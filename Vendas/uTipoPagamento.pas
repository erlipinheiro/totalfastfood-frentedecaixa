unit uTipoPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Touch.Keyboard, Vcl.Grids, Vcl.DBGrids, Vcl.ButtonGroup,
  Vcl.Imaging.jpeg, Data.DB, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmTipoPagamento = class(TForm)
    Teclado: TTouchKeyboard;
    pnlFormasPagamento: TScrollBox;
    qryFormasPagamento: TFDQuery;
    dsFormasPagamento: TDataSource;
    DBImage1: TDBImage;
    qryPessoas: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    BooleanField1: TBooleanField;
    IntegerField3: TIntegerField;
    BlobField1: TBlobField;
    dsPessoas: TDataSource;
    pnlEsquerda: TPanel;
    btnCancelar: TPanel;
    btnColaborador: TPanel;
    btnConvenio: TPanel;
    pnlValorRestante: TPanel;
    lblRestanteTroco: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    pnlValorPagamento: TPanel;
    Label1: TLabel;
    edtValorPagamento: TEdit;
    edtValorDesconto: TEdit;
    edtValorRestante: TEdit;
    btnCortesia: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtValorPagamentoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConvenioClick(Sender: TObject);
    procedure btnColaboradorClick(Sender: TObject);
    procedure edtValorPagamentoChange(Sender: TObject);
    procedure edtValorDescontoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCortesiaClick(Sender: TObject);
  private
    { Private declarations }
    FValorAPagar : real;
    FIDTipoPagamento : integer;
    FidConvenio: integer;
    FidPessoa: integer;
    FEmitirValeTroco: boolean;
    FidFormaPagamento: integer;
    FTEF: boolean;
    FTipoTransacao: string;
    FRedeAdquirente: string;
    FValorDesconto: Extended;
    FValorPagamento: Extended;
    FValorRestante: Extended;
    FEntraNaVenda: boolean;
    procedure setValorAPagar (const Value : real);
    procedure ClicouTipoPagamento (Sender : TObject);
    procedure SetidConvenio(const Value: integer);
    procedure SetidPessoa(const Value: integer);
    procedure SetidTipoPagamento(const Value: integer);
    procedure SetEmitirValeTroco(const Value: boolean);
    procedure SetidFormaPagamento(const Value: integer);
    procedure SetTEF(const Value: boolean);
    procedure SetTipoTransacao(const Value: string);
    procedure SetRedeAdquirente(const Value: string);
    procedure SetValorDesconto(const Value: Extended);
    procedure SetValorPagamento(const Value: Extended);
    procedure SetValorRestante(const Value: Extended);
    procedure SetEntraNaVenda(const Value: boolean);
  public
    { Public declarations }
    property EmitirValeTroco : boolean read FEmitirValeTroco write SetEmitirValeTroco;
    property idFormaPagamento : integer read FidFormaPagamento write SetidFormaPagamento;
    property idTipoPagamento : integer read FidTipoPagamento write SetidTipoPagamento;
    property EntraNaVenda : boolean read FEntraNaVenda write SetEntraNaVenda;
    property TEF : boolean read FTEF write SetTEF;
    property TipoTransacao : string read FTipoTransacao write SetTipoTransacao;
    property RedeAdquirente : string read FRedeAdquirente write SetRedeAdquirente;
    property idPessoa : integer read FidPessoa write SetidPessoa;
    property idConvenio : integer read FidConvenio write SetidConvenio;
    property ValorAPagar : real read FValorAPagar write setValorAPagar;
    property ValorPagamento : Extended read FValorPagamento write SetValorPagamento;
    property ValorDesconto : Extended read FValorDesconto write SetValorDesconto;
    property ValorRestante  : Extended read FValorRestante write SetValorRestante;
  end;

var
  frmTipoPagamento: TfrmTipoPagamento;

implementation

{$R *.dfm}

uses uClasses, DataModuleCaixa, uSelecionaConvenio, uSelecionaConveniado,
  uSelecionaPessoa, uPrincipal, uMensagem, uSenha, uDadosCortesia;

procedure TfrmTipoPagamento.edtValorDescontoChange(Sender: TObject);
begin
  if TryStrToFloat(edtValorDesconto.text, fValorDesconto) then
  begin
    if fValorDesconto > 0 then
    begin
      edtValorPagamento.Enabled := false;
      fValorPagamento := ValorAPagar - fValorDesconto;
      fValorRestante  := ValorAPagar - fValorPagamento - fValorDesconto;

      if fValorRestante > 0 then
        lblRestanteTroco.Caption := 'VALOR RESTANTE'
      else
        lblRestanteTroco.Caption := 'TROCO';

      edtValorRestante.Text := FormatFloat('###,##0.00',abs(FValorRestante));
      edtValorPagamento.Enabled := True;
    end;
  end;
end;

procedure TfrmTipoPagamento.edtValorPagamentoChange(Sender: TObject);
begin
  if TryStrToFloat(edtValorPagamento.Text, fValorPagamento) then
  begin
    fValorRestante := ValorAPagar - fValorPagamento - fValorDesconto;
    if fValorRestante > 0 then
      lblRestanteTroco.Caption := 'VALOR RESTANTE'
    else
      lblRestanteTroco.Caption := 'TROCO';

    edtValorRestante.Text := FormatFloat('###,##0.00',abs(FValorRestante));
  end;
end;

procedure TfrmTipoPagamento.edtValorPagamentoKeyPress(Sender: TObject;
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

procedure TfrmTipoPagamento.edtValorPagamentoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with teclado do
  begin
    BringToFront;
    if not Visible then
    begin
      Top     := 63;
      Left    := 437;
      Height  := 598;
      Width   := 536;
      Visible := True;
      Layout  := 'NumPad';
    end;
  end;
end;

procedure TfrmTipoPagamento.FormCreate(Sender: TObject);
var
  BMPImage : TBitmap;
  i : integer;

  C : TWinControl;
  nroHorizontal   : integer;
  horizontalAtual : integer;
  verticalAtual   : integer;
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  SetidFormaPagamento(-100);
  SetidConvenio(-100);
  SetEntraNaVenda(True);
  SetidTipoPagamento(-1);

  DrawRounded(pnlValorPagamento);
  DrawRounded(pnlValorRestante);
  DrawRounded(edtValorPagamento);
  DrawRounded(edtValorRestante);
  DrawRounded(btnConvenio);
  DrawRounded(btnColaborador);

  BMPImage := TBitmap.Create;

  With qryFormasPagamento do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    ParamByName('idEstacao').Value := dmCaixa.Estacao.ID;
    Open;
    while not eof do
    begin
      BMPImage.Assign(DBImage1.Picture.Bitmap);

      with TFormaPagamento.CriaTipoPagamento(pnlFormasPagamento, FieldByName('idFormaPagamento').AsInteger,
          FieldByName('idTipoPagamento').AsInteger, BMPImage, 96, 83, FieldByName('Ordem').AsInteger,
          FieldByName('Descricao').AsString, True, FieldByName('EmitirValeTroco').AsBoolean, FieldByName('TEF').AsBoolean,
          FieldByName('TipoTransacao').AsString, FieldByName('DescricaoRedeAdquirente').AsString, FieldByName('EntraNaVenda').AsBoolean) do
      begin
        parent := pnlFormasPagamento;
        OnPagamentoClick := ClicouTipoPagamento;
      end;

      Next;
    end;
    Close;
  end;

  FreeAndNil(BMPImage);

  //*** Primeiro verifico quantos cabem na horizontal
  //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
  nroHorizontal   := Trunc(pnlFormasPagamento.Width / (96+5)) - 1;
  horizontalAtual := 0;
  verticalAtual   := 0;
  for I := 0 to pnlFormasPagamento.ControlCount - 1 do
  begin
    c := TFormaPagamento(pnlFormasPagamento.Controls[i]);
    with c do
    begin
      if horizontalAtual > nroHorizontal then
      begin
        horizontalAtual := 0;
        Inc(verticalAtual);
      end;

      Top  := verticalAtual * (83 + 5) + 5;
      Left := horizontalAtual * (96 + 5) + 5;
    end;

    Inc(horizontalAtual);
    DrawRounded(c);
  end;

  fValorPagamento := 0;
  fValorDesconto  := 0;
  fValorRestante  := 0;

  btnColaborador.Visible  := dmCaixa.Estacao.Dados.RefeicaoColaboradores;
end;

procedure TfrmTipoPagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    if Teclado.Visible then
      Teclado.Visible := False
    else
      Close;
  end
  else if key = #13 then
    Teclado.Visible := False;
end;

procedure TfrmTipoPagamento.FormShow(Sender: TObject);
begin
  if edtValorPagamento.CanFocus then
  begin
    edtValorPagamento.SetFocus;
    edtValorPagamento.SelectAll;
  end;
end;

procedure TfrmTipoPagamento.btnCortesiaClick(Sender: TObject);
begin
  try
    fDadosCortesia := TfDadosCortesia.Create(Self);
    if fDadosCortesia.ShowModal = IDOK then
    begin
      ModalResult := mrOk;
      FidFormaPagamento := -4;
      FEntraNaVenda := True;
    end;
  finally
    FreeAndNil(fDadosCortesia);
  end;
end;

procedure TfrmTipoPagamento.SetEmitirValeTroco(const Value: boolean);
begin
  FEmitirValeTroco := Value;
end;

procedure TfrmTipoPagamento.SetEntraNaVenda(const Value: boolean);
begin
  FEntraNaVenda := Value;
end;

procedure TfrmTipoPagamento.SetidConvenio(const Value: integer);
begin
  FidConvenio := Value;
end;

procedure TfrmTipoPagamento.SetidFormaPagamento(const Value: integer);
begin
  FidFormaPagamento := Value;
end;

procedure TfrmTipoPagamento.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
end;

procedure TfrmTipoPagamento.SetidTipoPagamento(const Value: integer);
begin
  FidTipoPagamento := Value;
end;

procedure TfrmTipoPagamento.SetRedeAdquirente(const Value: string);
begin
  FRedeAdquirente := Value;
end;

procedure TfrmTipoPagamento.SetTEF(const Value: boolean);
begin
  FTEF := Value;
end;

procedure TfrmTipoPagamento.SetTipoTransacao(const Value: string);
begin
  FTipoTransacao := Value;
end;

procedure TfrmTipoPagamento.setValorAPagar (const Value : real);
begin
  FValorAPagar := Value;
  fValorRestante := FValorAPagar;
end;

procedure TfrmTipoPagamento.SetValorDesconto(const Value: Extended);
begin
  FValorDesconto := Value;
  edtValorDesconto.Text := FloatToStr(Value);
end;

procedure TfrmTipoPagamento.SetValorPagamento(const Value: Extended);
begin
  FValorPagamento := Value;
  edtValorPagamento.Text := FormatFloat('###,##0.00',abs(Value));
end;

procedure TfrmTipoPagamento.SetValorRestante(const Value: Extended);
begin
  FValorRestante := Value;
  edtValorRestante.Text := FormatFloat('###,##0.00',abs(Value));
end;

procedure TfrmTipoPagamento.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTipoPagamento.btnColaboradorClick(Sender: TObject);
begin
  try
    fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
    fSelecionaPessoa.idTipoPessoa := 2;
    if fSelecionaPessoa.ShowModal = IDOK then
    begin
      SetidPessoa(fSelecionaPessoa.qryPessoasidPessoa.AsInteger);
      FidFormaPagamento := -1;
      FEntraNaVenda := False;
      if dmCaixa.Estacao.BloquearRefeicaoColaboradores then
      begin
        with dmCaixa.qryAuxiliar do
        begin
          Close;
          SQL.Text := format('select count(1) from vendas.contas where idEmpresa = %d and idCaixa = %d and idConvenio = -1 and idPessoa = %d',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, fSelecionaPessoa.qryPessoasidPessoa.AsInteger]);
          Open;

          if (Fields.Fields[0].IsNull) or (Fields.Fields[0].AsInteger < 2) then
          begin
            frmSenha := TfrmSenha.Create(Application);
            frmSenha.idUsuario := fSelecionaPessoa.qryPessoasidPessoa.AsInteger;
            frmSenha.NomeUsuario := fSelecionaPessoa.qryPessoasRazaoSocial.AsString;
            frmSenha.SenhaUsuario := fSelecionaPessoa.qryPessoassenha.AsString;
            if frmSenha.ShowModal = 1 then
              ModalResult := mrOK
            else
            begin
              frmMensagem.MostraMensagemErro(format('Senha inválida.', [dmCaixa.Usuario.Nome]));
              ModalResult := mrCancel;
            end;
            FreeAndNil(frmSenha);
          end
          else
          begin
            frmMensagem.MostraMensagemErro(format('Este usuário ["%s"] já fez duas refeições no caixa de hoje.', [fSelecionaPessoa.qryPessoasRazaoSocial.AsString]));
            ModalResult := mrCancel;
          end;
        end;
      end
      else
        ModalResult := mrOK;
    end;
  finally
    FreeAndNil(fSelecionaPessoa);
  end;
end;

procedure TfrmTipoPagamento.btnConvenioClick(Sender: TObject);
begin
  try
    fSelecionaConvenio := TfSelecionaConvenio.Create(Self);
    if fSelecionaConvenio.ShowModal = IDOK then
    begin
      SetidConvenio(fSelecionaConvenio.qryConveniosidConvenio.AsInteger);
      fSelecionaConveniado := TfSelecionaConveniado.Create(Self);
      fSelecionaConveniado.idConvenio := fSelecionaConvenio.qryConveniosidConvenio.AsInteger;
      if fSelecionaConveniado.ShowModal = IDOK then
      begin
        SetidPessoa(fSelecionaConveniado.qryConveniadoidPessoa.AsInteger);
        ModalResult := mrOk;
      end;
      FreeAndNil(fSelecionaConveniado);
      FidFormaPagamento := -2;
      FEntraNaVenda := True;
    end;
  finally
    FreeAndNil(fSelecionaConvenio);
  end;
end;

procedure TfrmTipoPagamento.ClicouTipoPagamento (Sender : TObject);
begin
  if (Assigned(Sender)) and (Sender is TFormaPagamento) then
  begin
    try
      if TFormaPagamento(Sender).idFormaPagamento > -1 then
        SetidFormaPagamento(TFormaPagamento(Sender).idFormaPagamento);

      if TFormaPagamento(Sender).idTipoPagamento > -1 then
        SetidTipoPagamento(TFormaPagamento(Sender).idTipoPagamento);

      SetEntraNaVenda(TFormaPagamento(Sender).EntraNaVenda);
      SetRedeAdquirente(TFormaPagamento(Sender).RedeAdquirente);
      SetTEF(TFormaPagamento(Sender).TEF);
      SetTipoTransacao(TFormaPagamento(Sender).TipoTransacao);
      SetEmitirValeTroco(TFormaPagamento(Sender).EmitirValeTroco);
    finally
      if (fValorDesconto <= 0) or ((fValorDesconto > 0) and (fValorDesconto <= dmCaixa.Estacao.ConfiguracoesDaVenda.ValorMaximoDesconto))
        or (dmcaixa.Estacao.ConfiguracoesDaVenda.ValorMaximoDesconto <= 0) then
        ModalResult := mrOk
      else
      begin
        if dmCaixa.Estacao.ConfiguracoesDaVenda.ValorMaximoDesconto > 0 then
        begin
          frmMensagem.MostraMensagemErro('Desconto maior que o permitido para esta estação - R$ ' + FloatToStr(dmCaixa.Estacao.ConfiguracoesDaVenda.ValorMaximoDesconto));
          if edtValorDesconto.CanFocus then
            edtValorDesconto.SetFocus;
        end;
      end;
    end;
  end;
end;

end.
