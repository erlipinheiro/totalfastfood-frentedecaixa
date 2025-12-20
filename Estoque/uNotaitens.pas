unit uNotaitens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  cxDropDownEdit, cxDBEdit, Vcl.StdCtrls,
  cxCurrencyEdit, cxMaskEdit, cxCalc, cxTextEdit, Data.DB,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxSpinEdit, Vcl.ComCtrls, cxPCdxBarPopupMenu, cxPC, dxBarBuiltInMenu,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinscxPCPainter;

type
  TTipoNota = (tnEntrada, tnSaida);
  TfrmNotaItem = class(TfrmFormPadrao)
    dsCadastro: TDataSource;
    qryCadastro: TFDQuery;
    qryCadastroidEmpresa: TIntegerField;
    qryCadastroidPessoa: TIntegerField;
    qryCadastroidNota: TIntegerField;
    qryCadastroidItem: TIntegerField;
    qryCadastroidItemNFE: TIntegerField;
    qryCadastrocProd: TStringField;
    qryCadastronItem: TIntegerField;
    qryCadastrocEAN: TStringField;
    qryCadastroxProd: TStringField;
    qryCadastroNCM: TStringField;
    qryCadastroCFOP: TStringField;
    qryCadastrouCom: TStringField;
    qryCadastroqCom: TFloatField;
    qryCadastrovunCom: TCurrencyField;
    qryCadastrovProd: TCurrencyField;
    qryCadastrocEANTrib: TStringField;
    qryCadastrouTrib: TStringField;
    qryCadastroqTrib: TFloatField;
    qryCadastrovunTrib: TCurrencyField;
    qryCadastrovFrete: TCurrencyField;
    qryCadastrovSeg: TCurrencyField;
    qryCadastrovDesc: TCurrencyField;
    qryCadastrovOutro: TCurrencyField;
    qryCadastroIndTot: TIntegerField;
    qryCadastroxPed: TStringField;
    qryCadastronItemPed: TIntegerField;
    qryCadastroDataEnvioCentral: TDateTimeField;
    qryCadastroflEnviadoCentral: TBooleanField;
    qryCadastroUFST: TStringField;
    qryCadastroOrig: TIntegerField;
    qryCadastroCST: TIntegerField;
    qryCadastroCSOSN: TIntegerField;
    qryCadastromodBC: TIntegerField;
    qryCadastropRedBC: TFloatField;
    qryCadastrovBC: TCurrencyField;
    qryCadastropICMS: TFloatField;
    qryCadastromodBCST: TIntegerField;
    qryCadastrovBCST: TCurrencyField;
    qryCadastropICMSST: TFloatField;
    qryCadastrovICMSST: TCurrencyField;
    qryCadastrovICMS: TCurrencyField;
    qryCadastroclEnq: TStringField;
    qryCadastroCNPJProd: TStringField;
    qryCadastrocSelo: TStringField;
    qryCadastroqSelo: TIntegerField;
    qryCadastrocEnq: TStringField;
    qryCadastroIPICST: TIntegerField;
    qryCadastrovBCIPI: TCurrencyField;
    qryCadastroqUnid: TFloatField;
    qryCadastrovUnid: TCurrencyField;
    qryCadastropIPI: TFloatField;
    qryCadastrovIPI: TCurrencyField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnSelecionaProdutoFornecedor: TButton;
    edtUnidade: TcxDBComboBox;
    edtCodigo: TcxDBTextEdit;
    edtDescricao: TcxDBTextEdit;
    edtQtde: TcxDBCalcEdit;
    edtUnitario: TcxDBCurrencyEdit;
    pnlValorTotal: TPanel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    edtValorFrete: TcxDBCurrencyEdit;
    edtValorSeguro: TcxDBCurrencyEdit;
    edtValorDesconto: TcxDBCurrencyEdit;
    edtValorOutros: TcxDBCurrencyEdit;
    pnlValorTotalItem: TPanel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBCurrencyEdit12: TcxDBCurrencyEdit;
    cxDBCalcEdit6: TcxDBCalcEdit;
    cxDBCurrencyEdit11: TcxDBCurrencyEdit;
    cxDBCalcEdit5: TcxDBCalcEdit;
    cxDBCurrencyEdit10: TcxDBCurrencyEdit;
    cxDBSpinEdit7: TcxDBSpinEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBSpinEdit6: TcxDBSpinEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBCurrencyEdit9: TcxDBCurrencyEdit;
    cxDBCurrencyEdit8: TcxDBCurrencyEdit;
    cxDBCalcEdit4: TcxDBCalcEdit;
    cxDBCurrencyEdit7: TcxDBCurrencyEdit;
    cxDBSpinEdit5: TcxDBSpinEdit;
    cxDBCalcEdit3: TcxDBCalcEdit;
    cxDBCurrencyEdit6: TcxDBCurrencyEdit;
    cxDBCalcEdit2: TcxDBCalcEdit;
    cxDBSpinEdit4: TcxDBSpinEdit;
    cxDBSpinEdit3: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBCurrencyEdit5: TcxDBCurrencyEdit;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    Label42: TLabel;
    Label41: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    procedure btnSelecionaProdutoFornecedorClick(Sender: TObject);
    procedure qryCadastroNewRecord(DataSet: TDataSet);
    procedure qryCadastroBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure edtQtdePropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKPadraoClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    FTipoNota: TTipoNota;
    FDataEntradaEstoque: TDate;
    procedure SetTipoNota(const Value: TTipoNota);
    procedure SetDataEntradaEstoque(const Value: TDate);
    function NaoExisteRestricao : boolean;

    { Private declarations }
  public
    { Public declarations }
    property TipoNota : TTipoNota read FTipoNota write SetTipoNota;
    property DataEntradaEstoque : TDate read FDataEntradaEstoque write SetDataEntradaEstoque;
  end;

var
  frmNotaItem: TfrmNotaItem;

implementation

{$R *.dfm}
uses uSelecionaProdutoFornecedor, uNotaDados, DataModuleCaixa, uNotas,
  uMensagem, udmNotas, uFuncoes;

procedure TfrmNotaItem.btnOKPadraoClick(Sender: TObject);
var
  idProdutoRelacionado : integer;
  QuantidadeRelacionado : Double;
  ControlaEstoque : boolean;
  QuantidadeMovimentacao : double;
begin
  if NaoExisteRestricao then
  begin
    if dmCaixa.ProdutoRelacionado(qryCadastroidPessoa.AsInteger, qryCadastrocProd.AsString, qryCadastroxProd.AsString, idProdutoRelacionado, QuantidadeRelacionado, ControlaEstoque) then
    begin
      if ControlaEstoque then
      begin
        //*** Nota de saida, mudo o sinal da quantidade
        QuantidadeMovimentacao := qryCadastroqCom.AsFloat * QuantidadeRelacionado;

        if TipoNota = tnSaida then
          QuantidadeMovimentacao := (-1) * QuantidadeMovimentacao;

        dmCaixa.MovimentaEstoque(idProdutoRelacionado, QuantidadeMovimentacao, qryCadastroidPessoa.AsInteger, qryCadastroidItem.AsInteger, 5, Now)
      end;
    end
    else
      raise Exception.Create('Não existe produto relacionado para este código. Não é possível continuar a importação. ' +
        qryCadastrocProd.AsString + ' - ' + qryCadastroxProd.AsString);

    qryCadastro.Post;

    inherited;
  end;
end;

procedure TfrmNotaItem.btnSelecionaProdutoFornecedorClick(Sender: TObject);
begin
  inherited;
  frmSelecionaProdutoFornecedor := TfrmSelecionaProdutoFornecedor.Create(Self);
  frmSelecionaProdutoFornecedor.idEmpresa := qryCadastroidEmpresa.AsInteger;
  frmSelecionaProdutoFornecedor.idPessoa  := qryCadastroidPessoa.AsInteger;
  if frmSelecionaProdutoFornecedor.ShowModal = mrOk then
  begin
    qryCadastrocProd.Value := frmSelecionaProdutoFornecedor.qryProdutosFornecedorescProd.AsString;
    qryCadastroxProd.Value := frmSelecionaProdutoFornecedor.qryProdutosFornecedoresxProd.AsString;
    edtCodigo.Enabled := False;
    edtDescricao.Enabled := False;

    if edtUnidade.CanFocus then
      edtUnidade.SetFocus;
  end;

  FreeAndNil(frmSelecionaProdutoFornecedor);
end;

procedure TfrmNotaItem.edtCodigoExit(Sender: TObject);
begin
  if Trim(edtCodigo.Text) <> '' then
  begin
    with dmNotas.qryPessoaProdutos do
    begin
      Close;
      ParamByName('idPessoa').Value := qryCadastroidPessoa.AsInteger;
      ParamByName('Codigo').Value := edtCodigo.Text;
      Open;

      if RecordCount > 0 then
      begin
        qryCadastroxProd.Value := FieldByName('xProd').AsString;
        edtDescricao.Enabled := False;

        if edtUnidade.CanFocus then
          edtUnidade.SetFocus;
      end
      else
        edtDescricao.Enabled := True;

      Close;
    end;
  end;
end;

procedure TfrmNotaItem.edtQtdePropertiesChange(Sender: TObject);
var
  TotalItem : DOUBLE;
begin
  inherited;

  TotalItem := 0;
  if edtQtde.Value > 0 then
  begin
    if edtUnitario.Value > 0 then
    begin
      TotalItem := edtQtde.Value * edtUnitario.Value;
      pnlValorTotal.Caption := FloatToStr(TotalItem) + ' ';
      if edtValorFrete.Value > 0 then
        TotalItem := TotalItem + edtValorFrete.Value;
      if edtValorSeguro.Value > 0 then
        TotalItem := TotalItem + edtValorSeguro.Value;
      if edtValorDesconto.Value > 0 then
        TotalItem := TotalItem - edtValorDesconto.Value;
      if edtValorOutros.Value > 0 then
        TotalItem := TotalItem + edtValorOutros.Value;

      pnlValorTotalItem.Caption := FloatToStr(TotalItem) + ' ';
    end;
  end;

  if TotalItem = 0 then
  begin
    pnlValorTotal.Caption := '';
    pnlValorTotalItem.Caption := '';
  end;
end;

procedure TfrmNotaItem.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadastro.Open;
end;

procedure TfrmNotaItem.FormShow(Sender: TObject);
begin
  inherited;

  if qryCadastro.State = dsInsert then
  begin
    frmSelecionaProdutoFornecedor := TfrmSelecionaProdutoFornecedor.Create(Self);
    frmSelecionaProdutoFornecedor.idEmpresa := qryCadastroidEmpresa.AsInteger;
    frmSelecionaProdutoFornecedor.idPessoa  := qryCadastroidPessoa.AsInteger;
    if frmSelecionaProdutoFornecedor.ShowModal = mrOk then
    begin
      qryCadastrocProd.Value := frmSelecionaProdutoFornecedor.qryProdutosFornecedorescProd.AsString;
      qryCadastroxProd.Value := frmSelecionaProdutoFornecedor.qryProdutosFornecedoresxProd.AsString;
    end;

    FreeAndNil(frmSelecionaProdutoFornecedor);
  end;
end;

function TfrmNotaItem.NaoExisteRestricao: boolean;
begin
  result := True;

  if qryCadastrocProd.IsNull or (trim(qryCadastrocProd.AsString) = '') then
  begin
    result := False;
    frmMensagem.MostraMensagem('Você deve indicar um código para este produto.');
    edtCodigo.SetFocus;
  end
  else if qryCadastroxProd.IsNull or (trim(qryCadastroxProd.AsString) = '') then
  begin
    result := False;
    frmMensagem.MostraMensagem('Você deve indicar uma descrição para este produto.');
    edtDescricao.SetFocus;
  end
  else if qryCadastroqCom.IsNull or (qryCadastroqCom.Value <= 0) then
  begin
    result := False;
    frmMensagem.MostraMensagem('O quantidade deve ser maior que 0(zero).');
    edtQtde.SetFocus;
  end
  else if qryCadastrovunCom.IsNull or (qryCadastrovunCom.Value <= 0) then
  begin
    result := False;
    frmMensagem.MostraMensagem('O valor unitário deve ser maior que 0(zero).');
    edtUnitario.SetFocus;
  end;

end;

procedure TfrmNotaItem.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;

  qryCadastrovProd.Value := qryCadastroqCom.value * qryCadastrovunCom.value;
end;

procedure TfrmNotaItem.qryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;

  qryCadastroidItem.AsInteger    := RetornaValorSequence(dmCaixa.dbTotalFastFood, '[Contabil].[NotaItemSequence]');
end;

procedure TfrmNotaItem.SetDataEntradaEstoque(const Value: TDate);
begin
  FDataEntradaEstoque := Value;
end;


procedure TfrmNotaItem.SetTipoNota(const Value: TTipoNota);
begin
  FTipoNota := Value;
end;

end.
