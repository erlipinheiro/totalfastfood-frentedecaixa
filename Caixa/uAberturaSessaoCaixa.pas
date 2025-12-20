unit uAberturaSessaoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,  Vcl.Mask, Firedac.Comp.Client;

type
  TfrmAberturaSessaoCaixa = class(TForm)
    pnlCaixa: TPanel;
    pnlDataCaixa: TPanel;
    Panel1: TPanel;
    btnVoltar: TImage;
    btnSalvar: TPanel;
    pnlFundoCaixa: TPanel;
    Label1: TLabel;
    lblConfiraData: TLabel;
    edtTrocoInicial: TEdit;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTrocoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtTrocoInicialChange(Sender: TObject);
  private
    FidUsuarioAbertura: integer;
    FidSessaoCaixa: integer;
    FTrocoInicial: Extended;
    procedure SetidUsuarioAbertura(const Value: integer);
    procedure SetidSessaoCaixa(const Value: integer);
    procedure SetTrocoInicial(const Value: Extended);
    { Private declarations }
  public
    { Public declarations }
    property idSessaoCaixa : integer read FidSessaoCaixa write SetidSessaoCaixa;
    property TrocoInicial : Extended read FTrocoInicial write SetTrocoInicial;
  end;

var
  frmAberturaSessaoCaixa: TfrmAberturaSessaoCaixa;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPergunta;

procedure TfrmAberturaSessaoCaixa.btnSalvarClick(Sender: TObject);
  function AbreSessaoCaixa : boolean;
  begin
    result := False;
    with dmCaixa do
    begin
      //*** Primeiro pedo o ID na sequence
      with qryAuxiliar do
      begin
        Close;
        SQL.Text := 'select next value for Vendas.SessoesCaixaSequence';
        Open;

        if qryAuxiliar.Fields.Fields[0].AsInteger <= 0 then
          raise Exception.Create('Usuário do caixa não localizado.');


        if RecordCount > 0 then
        begin
          with TFDQuery.Create(Self) do
          begin
            Connection := dmCaixa.dbTotalFastFood;
            SQL.Text := Format('insert into Vendas.SessoesCaixa (idEmpresa, idCaixa, idSessaoCaixa, idUsuarioAbertura, idEstacao, dhAbertura, vlInicial) values ' +
              '(%d, %d, %d, %d, %d, GetDate(), ',
              [Estacao.idEmpresa, Estacao.Caixa.idCaixa, qryAuxiliar.Fields.Fields[0].AsInteger, Usuario.ID, Estacao.ID]) +
               StringReplace(edtTrocoInicial.Text, ',', '.', [rfReplaceAll]) + ')';
            Execute;

            if RowsAffected <= 0 then
              raise Exception.Create('Erro abrindo sessão de caixa no banco de dados. ' + sLineBreak + SQL.Text)
            else
            begin
              result := True;
              SetidSessaoCaixa(qryAuxiliar.Fields.Fields[0].AsInteger);
            end;
            Free;
          end;
        end
        else
          raise Exception.Create('Erro buscando novo ID da sessão de caixa. ' + sLineBreak + SQL.Text);
      end;
      Close;
    end;
  end;
begin
  if fTrocoInicial <= 0 then
  begin
    frmPergunta.LimpaFormulario;
    frmPergunta.lblPergunta.Caption := 'Deseja realmente iniciar este turno com o troco zerado?';
    if frmPergunta.ShowModal = mrOk then
    begin
      if AbreSessaoCaixa then
        ModalResult := mrOk;
    end
    else
      edtTrocoInicial.SetFocus;
  end
  else
  begin
    if AbreSessaoCaixa then
      ModalResult := mrOk;
  end;
end;

procedure TfrmAberturaSessaoCaixa.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAberturaSessaoCaixa.edtTrocoInicialChange(Sender: TObject);
begin
  TryStrToFloat(edtTrocoInicial.Text, fTrocoInicial);
end;

procedure TfrmAberturaSessaoCaixa.edtTrocoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9', '-', FormatSettings.DecimalSeparator]) then
  begin
    ShowMessage('Caracter inválido: ' + Key);
    Key := #0;
  end
  else if ((Key = FormatSettings.DecimalSeparator) or (Key = '-')) and (Pos(Key, (Sender as TEdit).Text) > 0) then
  begin
    ShowMessage('Caracter inválido: dois ' + Key);
    Key := #0;
  end
  else if (Key = '-') and ((Sender as TEdit).SelStart <> 0) then
  begin
    ShowMessage('Somente números são aceitos: ' + Key);
    Key := #0;
  end;
end;

procedure TfrmAberturaSessaoCaixa.FormShow(Sender: TObject);
begin
  fTrocoInicial := 0;
  pnlDataCaixa.Caption := FormatDateTime('DD/MM/YY', dmcaixa.Estacao.Caixa.dhAberturaCaixa);
  with TFDQuery.Create(Self) do
  begin
    Connection := dmCaixa.dbTotalFastFood;
    SQL.Text := Format('select Top 1 vlInicial from Vendas.SessoesCaixa where idEmpresa = %d and idEstacao = %d order by idSessaoCaixa desc',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.ID]);
    Open;


    if RecordCount > 0 then
      if not Fields.Fields[0].IsNull then
        fTrocoInicial := Fields.Fields[0].AsFloat;

    Close;
    Free;
  end;
end;

procedure TfrmAberturaSessaoCaixa.SetidSessaoCaixa(const Value: integer);
begin
  FidSessaoCaixa := Value;
end;

procedure TfrmAberturaSessaoCaixa.SetidUsuarioAbertura(const Value: integer);
begin
  FidUsuarioAbertura := Value;
end;

procedure TfrmAberturaSessaoCaixa.SetTrocoInicial(const Value: Extended);
begin
  FTrocoInicial := Value;
  edtTrocoInicial.Text := FloatToStr(Value);
end;

end.
