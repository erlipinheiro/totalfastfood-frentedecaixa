unit uBaixarPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg;

type

  TfrmBaixarPedidos = class(TForm)
    Panel1: TPanel;
    btnVoltar: TImage;
    pnlEdtMesa: TPanel;
    Label2: TLabel;
    btnOKEdit: TPanel;
    edtMesa: TPanel;
    pnlPedidos: TScrollBox;
    Panel2: TPanel;
    tmrAtualiza: TTimer;
    btnBaixarTodas: TPanel;
    procedure tmrAtualizaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBaixarTodasClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDistancia: integer;
    FAltura: integer;
    FTamanho: integer;
    VetorPedidos : array of integer;

    { Private declarations }
    procedure BaixaPedido(Const SenhaPedido : Char; id : integer);
    procedure LimpaPedidos;
    procedure VerificaDiferencas;
    procedure ClicouPedido(Sender : TObject);
    procedure SetAltura(const Value: integer);
    procedure SetDistancia(const Value: integer);
    procedure SetTamanho(const Value: integer);
  public
    { Public declarations }
    property Altura : integer read FAltura write SetAltura;
    property Distancia : integer read FDistancia write SetDistancia;
    property Tamanho : integer read FTamanho write SetTamanho;
  end;

var
  frmBaixarPedidos: TfrmBaixarPedidos;

implementation

{$R *.dfm}

uses
  DataModuleCaixa, Constantes, uClasses;

procedure TfrmBaixarPedidos.BaixaPedido(const SenhaPedido: Char; id : integer);
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    if SenhaPedido = 'P' then
      SQL.Text := format('update vendas.pedidos set horabaixa = getdate() where idempresa = %d and idpedido = %d', [dmCaixa.Estacao.idEmpresa, id])
    else
      SQL.Text := format('update vendas.pedidos set horabaixa = getdate() ' +
        'from vendas.pedidos p ' +
        'inner join vendas.contas c with (nolock) on p.idEmpresa=c.idEmpresa and p.idCaixa=c.idCaixa and p.idConta=c.idConta ' +
        'where idEmpresa = %d and c.idMesaCartaoSenha = %d', [dmCaixa.Estacao.idEmpresa, id]);
    ExecSQL;
    if RowsAffected > 0 then
    begin
      Close;
      VerificaDiferencas;
    end
    else
      Close;
  end;
end;

procedure TfrmBaixarPedidos.btnBaixarTodasClick(Sender: TObject);
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('update vendas.pedidos set horabaixa = getdate() where idEmpresa = %d and HoraBaixa is null', [dmCaixa.Estacao.idEmpresa]);

    ExecSQL;
    if RowsAffected > 0 then
    begin
      Close;
      VerificaDiferencas;
    end
    else
      Close;
  end;
end;

procedure TfrmBaixarPedidos.ClicouPedido(Sender : TObject);
begin
  BaixaPedido('P', TMesa(Sender).idConta);
  pnlEdtMesa.Visible := False;
end;

procedure TfrmBaixarPedidos.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;

  DrawRounded(btnBaixarTodas);

  Altura := 90;
  Distancia := 5;
  Tamanho := 90;
end;

procedure TfrmBaixarPedidos.FormKeyPress(Sender: TObject; var Key: Char);
Var
  i : Integer;
begin
  if key = #13 then
    btnOKEditClick(Sender)
  else if key = #8 then
  begin
    if Length(edtMesa.Caption) > 1 then
      edtMesa.Caption := copy (edtMesa.Caption, 1, Length(edtMesa.Caption) -1)
    else
      edtMesa.Caption := '';
  end
  else if key in ['0'..'9'] then
  begin
    if not pnlEdtMesa.Visible then
    begin
      pnlEdtMesa.Visible := True;
      edtMesa.Caption := Key;
    end
    else
      edtMesa.Caption := edtMesa.Caption + Key;
  end;
end;

procedure TfrmBaixarPedidos.FormShow(Sender: TObject);
begin
  VerificaDiferencas;
end;

procedure TfrmBaixarPedidos.btnOKEditClick(Sender: TObject);
begin
  if trim(edtMesa.Caption) <> '' then
    BaixaPedido('S', StrToInt(edtMesa.Caption))
  else
    pnlEdtMesa.Visible := False;
end;

procedure TfrmBaixarPedidos.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmBaixarPedidos.LimpaPedidos;
var
  i : integer;
  APedido : TMesa;
begin
  try
    for i := pnlPedidos.ControlCount -1 downto 0  do
    begin
      if pnlPedidos.Controls[i] is TMesa then
      begin
        APedido := TMesa(pnlPedidos.Controls[i]);
        APedido.Parent := Nil;
        FreeAndNil(APedido);
      end;
    end;
  except
    on e : exception do
      raise exception.create ('Limpando mesas.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmBaixarPedidos.SetAltura(const Value: integer);
begin
  FAltura := Value;
end;

procedure TfrmBaixarPedidos.SetDistancia(const Value: integer);
begin
  FDistancia := Value;
end;

procedure TfrmBaixarPedidos.SetTamanho(const Value: integer);
begin
  FTamanho := Value;
end;

procedure TfrmBaixarPedidos.tmrAtualizaTimer(Sender: TObject);
begin
  VerificaDiferencas;
end;

procedure TfrmBaixarPedidos.VerificaDiferencas;
var
  nroHorizontal,
  horizontalAtual,
  verticalAtual,
  i : integer;
  ExisteDiferencaNosPedidos : boolean;
begin
  try
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := format('select p.*, c.idMesaCartaoSenha from vendas.pedidos p with (nolock)' +
        'inner join vendas.contas c with (nolock) on p.idEmpresa=c.idEmpresa and p.idCaixa=c.idCaixa and p.idConta=c.idConta ' +
        'where p.idEmpresa = %d and HoraBaixa is null order by idpedido desc', [dmCaixa.Estacao.idEmpresa]);
      Open;

      //*** Primeiro verifico quantos cabem na horizontal
      //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
      nroHorizontal   := Trunc(pnlPedidos.Width / (Tamanho + Distancia)) - 1;

      horizontalAtual := 0;
      verticalAtual   := 0;

      ExisteDiferencaNosPedidos := False;
      if (Length(VetorPedidos) <> RecordCount) then
        ExisteDiferencaNosPedidos := True
      else
      begin
        i := 0;
        while not eof do
        begin
          if (VetorPedidos[i] <> FieldByName('idMesaCartaoSenha').AsInteger) then
          begin
            ExisteDiferencaNosPedidos := True;
            Break
          end;
          Inc(i);
          Next;
        end;
      end;

      if ExisteDiferencaNosPedidos then
      begin
        pnlPedidos.Visible := False;

        LimpaPedidos;

        i := 0;
        SetLength(VetorPedidos, 0);
        SetLength(VetorPedidos, RecordCount);
        First;
        while not Eof do
        begin
          VetorPedidos[i] := FieldByName('idMesaCartaoSenha').AsInteger;
          Inc(i);
          with TMesa.CriaMesa(pnlPedidos, FieldByName('idPedido').AsInteger, FieldByName('idMesaCartaoSenha').AsInteger, Tamanho, Altura,
            FieldByName('idConta').AsInteger, tvNenhum, '', False) do
          begin
            onMesaClick := ClicouPedido;

//            if FieldByName('Valor').AsFloat > 0 then
//              ValorTotal  := FieldByName('Valor').AsFloat - FieldByName('ValorDesconto').AsFloat ;

//            Status           := TStatusConta(FieldByName('Status').AsInteger);
//            idConta          := FieldByName('idConta').AsInteger;
//            idGarcom         := FieldByName('idGarcom').AsInteger;
//            idMesa           := FieldByName('idMesaCartaoSenha').AsInteger;
//            if TTipoVenda(FieldByName('idTipoVenda').AsInteger) = tvVendaDelivery then
//              idPessoaDelivery := FieldByName('idPessoa').AsInteger
//            else
//              idPessoaDelivery := 0;
//            DataHoraAbertura := FieldByName('DataInicio').AsDateTime;

            if horizontalAtual > nroHorizontal then
            begin
              horizontalAtual := 0;
              Inc(verticalAtual);
            end;

            Top  := verticalAtual * (Tamanho + Distancia) + Distancia;
            Left := horizontalAtual * (Tamanho + Distancia) + Distancia;
            Inc(horizontalAtual);
          end;

          Next;
        end;
      end;

      pnlPedidos.Visible := True;
      Close;
    end;
  except
    on e : exception do
      raise exception.create ('VerificaMesasAbertas.' + sLineBreak + e.Message);
  end;
end;

end.
