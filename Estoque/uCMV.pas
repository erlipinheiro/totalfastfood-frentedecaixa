unit uCMV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, MemDS, DBAccess, Uni, cxSchedulerStorage,
  cxSchedulerCustomControls, cxSchedulerDateNavigator, cxContainer,
  cxDateNavigator, frxClass, frxDBSet, frxExportImage, frxExportText,
  frxExportCSV, frxExportRTF, frxExportHTML, frxExportODF, frxExportDBF,
  frxExportBIFF, frxExportPDF, frxExportMail, frxExportXML, frxExportXLS;

type
  TfrmCMV = class(TfrmFormPadrao)
    qryContagemInicial: TFDQuery;
    dsContagemInicial: TDataSource;
    qryContagemFinal: TFDQuery;
    dsContagemFinal: TDataSource;
    dbgridContagemInicialDBTableView1: TcxGridDBTableView;
    dbgridContagemInicialLevel1: TcxGridLevel;
    dbgridContagemInicial: TcxGrid;
    qryContagemInicialidEmpresa: TIntegerField;
    qryContagemInicialidContagem: TIntegerField;
    qryContagemInicialidPessoaInicio: TIntegerField;
    qryContagemInicialidPessoaFim: TIntegerField;
    qryContagemInicialDataInicio: TDateTimeField;
    qryContagemInicialDataFim: TDateTimeField;
    qryContagemInicialStatus: TIntegerField;
    qryContagemInicialPercentualAcerto: TFloatField;
    qryContagemInicialDataEnvioCentral: TDateTimeField;
    qryContagemInicialflEnviadoCentral: TBooleanField;
    qryContagemFinalidEmpresa: TIntegerField;
    qryContagemFinalidContagem: TIntegerField;
    qryContagemFinalidPessoaInicio: TIntegerField;
    qryContagemFinalidPessoaFim: TIntegerField;
    qryContagemFinalDataInicio: TDateTimeField;
    qryContagemFinalDataFim: TDateTimeField;
    qryContagemFinalStatus: TIntegerField;
    qryContagemFinalPercentualAcerto: TFloatField;
    qryContagemFinalDataEnvioCentral: TDateTimeField;
    qryContagemFinalflEnviadoCentral: TBooleanField;
    dbgridContagemInicialDBTableView1idContagem: TcxGridDBColumn;
    dbgridContagemInicialDBTableView1DataInicio: TcxGridDBColumn;
    qryCMVEstoque: TFDQuery;
    qryCMVEstoqueidProduto: TIntegerField;
    qryCMVEstoquecdProduto: TStringField;
    qryCMVEstoqueDescricao: TStringField;
    qryCMVEstoqueEstoqueInicial: TFloatField;
    qryCMVEstoqueEntrada: TFloatField;
    qryCMVEstoqueContagemFinal: TFloatField;
    qryCMVEstoqueSubTotal: TFloatField;
    qryCMVEstoqueUso: TFloatField;
    qryCMVEstoqueVendas: TFloatField;
    qryCMVEstoqueColaboradores: TFloatField;
    qryCMVEstoqueDiferenca: TFloatField;
    qryCMVEstoqueDiferencaPercentual: TFloatField;
    qryCMVEstoqueValorMedio: TFloatField;
    qryCMVEstoqueUsoEmReais: TFloatField;
    qryCMVEstoqueVendasEmReais: TFloatField;
    qryCMVEstoqueDiferencaEmReais: TFloatField;
    qryCMVEstoqueDiferencaEmReaisPercentual: TFloatField;
    frxdbCMVEstoque: TfrxDBDataset;
    frxCMVEstoque: TfrxReport;
    edtDataInicial: TcxDateNavigator;
    dbgridContagemFinal: TcxGrid;
    dbgridContagemFinalDBTableView1: TcxGridDBTableView;
    dbgridContagemFinalDBTableView1idContagem: TcxGridDBColumn;
    dbgridContagemFinalDBTableView1DataInicio: TcxGridDBColumn;
    dbgridContagemFinalLevel1: TcxGridLevel;
    edtDataFinal: TcxDateNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxMailExport1: TfrxMailExport;
    frxODSExport1: TfrxODSExport;
    frxPDFExport1: TfrxPDFExport;
    frxBIFFExport1: TfrxBIFFExport;
    frxDBFExport1: TfrxDBFExport;
    frxODTExport1: TfrxODTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxCSVExport1: TfrxCSVExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxGIFExport1: TfrxGIFExport;
    frxTIFFExport1: TfrxTIFFExport;
    btnGerarDRE: TJvPanel;
    qryDRE: TFDQuery;
    frxdbDRE: TfrxDBDataset;
    frxDRE: TfrxReport;
    qryDRETotalEmVendas: TCurrencyField;
    qryDRECMV: TFloatField;
    qryDREImpostos: TFloatField;
    qryDRERoyalties: TFloatField;
    qryDREMarketing: TFloatField;
    qryDRECartao: TFloatField;
    qryDRECMVPercentual: TFloatField;
    qryDREDespesasOperacionais2: TFloatField;
    qryDREDespesasOperacionaisPercentual: TFloatField;
    qryDREPessoal: TFloatField;
    qryDREPessoalPercentual: TFloatField;
    qryDREServicosEssenciais: TFloatField;
    qryDREServicosEssenciaisPercentual: TFloatField;
    qryDREDemaisDespesas: TFloatField;
    qryDREDemaisDespesasPercentual: TFloatField;
    qryDREOcupacao: TFloatField;
    qryDREOcupacaoPercentual: TFloatField;
    qryDRESalarios: TFloatField;
    qryDRESalariosPercentual: TFloatField;
    qryDREHorasExtras: TFloatField;
    qryDREHorasExtrasPercentual: TFloatField;
    qryDREFerias13: TFloatField;
    qryDREFerias13Percentual: TFloatField;
    qryDREAlimentacao: TFloatField;
    qryDREAlimentacaoPercentual: TFloatField;
    qryDREFGTS: TFloatField;
    qryDREFGTSPercentual: TFloatField;
    qryDREValeTransporte: TFloatField;
    qryDREValeTransportePercentual: TFloatField;
    qryDRETelefone: TFloatField;
    qryDRETelefonePercentual: TFloatField;
    qryDREEnergia: TFloatField;
    qryDREEnergiaPercentual: TFloatField;
    qryDREAgua: TFloatField;
    qryDREAguaPercentual: TFloatField;
    qryDREMaterialLimpeza: TFloatField;
    qryDREMaterialLimpezaPercentual: TFloatField;
    qryDREManutencao: TFloatField;
    qryDREManutencaoPercentual: TFloatField;
    qryDRETerceiros: TFloatField;
    qryDRETerceirosPercentual: TFloatField;
    qryDREOutrasDespesas: TFloatField;
    qryDREOutrasDespesasPercentual: TFloatField;
    qryDREAluguel: TFloatField;
    qryDREAluguelPercentual: TFloatField;
    qryDRECondominio: TFloatField;
    qryDRECondominioPercentual: TFloatField;
    qryDREFundoPromocao: TFloatField;
    qryDREFundoPromocaoPercentual: TFloatField;
    qryDREIPTU: TFloatField;
    qryDREIPTUPercentual: TFloatField;
    qryDREGas: TFloatField;
    qryDREGasPercentual: TFloatField;
    frxValorEstoque: TfrxReport;
    frxdbValorEstoque: TfrxDBDataset;
    qryValorEstoque: TFDQuery;
    qryValorEstoquecdProduto: TStringField;
    qryValorEstoqueDescricao: TStringField;
    qryValorEstoqueValorUnitario: TFloatField;
    qryValorEstoqueQtde: TFloatField;
    btnInventarioFisicoFinanceiro: TJvPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure btnOKPadraoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxCMVEstoqueGetValue(const VarName: string; var Value: Variant);
    procedure btnGerarDREClick(Sender: TObject);
    procedure frxValorEstoqueGetValue(const VarName: string;
      var Value: Variant);
    procedure btnInventarioFisicoFinanceiroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCMV: TfrmCMV;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPergunta, uMensagem;

procedure TfrmCMV.btnGerarDREClick(Sender: TObject);
begin
  if qryContagemInicialDataInicio.Value < qryContagemFinalDataInicio.value then
  begin
    if edtDataInicial.Date < edtDataFinal.Date then
    begin
      with qryDRE do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.Date;
        ParamByName('DataFinal').Value := edtDataFinal.Date;
        ParamByName('DataInicialValorMedio').Value := edtDataFinal.Date - 30;
        ParamByName('idContagemInicial').Value := qryContagemInicialidContagem.AsInteger;
        ParamByName('idContagemFinal').Value := qryContagemFinalidContagem.AsInteger;
        Open;
      end;

      if frxDRE.PrepareReport(true) then
        frxDRE.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
  end
  else
    frmMensagem.MostraMensagem('A data da contagem inicial não pode ser maior do que a data da contagem final.');
end;

procedure TfrmCMV.btnInventarioFisicoFinanceiroClick(Sender: TObject);
begin
  with qryValorEstoque do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    ParamByName('idContagem').Value := qryContagemInicialidContagem.AsInteger;
    Open;
  end;

  if frxValorEstoque.PrepareReport(true) then
    frxValorEstoque.ShowPreparedReport;
end;

procedure TfrmCMV.btnOKPadraoClick(Sender: TObject);
begin
  if qryContagemInicialDataInicio.Value < qryContagemFinalDataInicio.value then
  begin
    if edtDataInicial.Date < edtDataFinal.Date then
    begin
      with qryCMVEstoque do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.Date;
        ParamByName('DataFinal').Value := edtDataFinal.Date;
        ParamByName('DataInicialValorMedio').Value := edtDataFinal.Date - 30;
        ParamByName('idContagemInicial').Value := qryContagemInicialidContagem.AsInteger;
        ParamByName('idContagemFinal').Value := qryContagemFinalidContagem.AsInteger;
        Open;
      end;

      if frxCMVEstoque.PrepareReport(true) then
        frxCMVEstoque.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
  end
  else
    frmMensagem.MostraMensagem('A data da contagem inicial não pode ser maior do que a data da contagem final.');
end;

procedure TfrmCMV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  qryContagemInicial.Close;
  qryContagemFinal.Close;
end;

procedure TfrmCMV.FormShow(Sender: TObject);
begin
  inherited;

  qryContagemInicial.Open;
  qryContagemFinal.Open;
end;

procedure TfrmCMV.frxCMVEstoqueGetValue(const VarName: string;
  var Value: Variant);
begin
  inherited;

  if UpperCase(VarName) = 'INICIO' then
    Value := DateToStr(edtDataInicial.Date)
  else if UpperCase(VarName) = 'FIM' then
    Value := DateToStr(edtDataFinal.Date)
  else if UpperCase(VarName) = 'FATURAMENTO' then
  begin
    with dmCaixa.qryTotalVendaPeriodo do
    begin
      Close;

      ParamByName('datainicial').Value := edtDataInicial.Date;
      ParamByName('datafinal').Value := edtDataFinal.Date;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;

      Open;

      if RecordCount <= 0 then
        raise Exception.Create('Erro buscando total em vendas no período.')
      else
        Value := Fields.Fields[0].AsCurrency;

      Close;
    end;
  end
  else if UpperCase(VarName) = 'LOJA' then
    Value := IntToStr(dmCaixa.Estacao.idEmpresa)
  else if UpperCase(VarName) = 'NOMELOJA' then
    Value := dmCaixa.Estacao.NomeFantasia;
end;

procedure TfrmCMV.frxValorEstoqueGetValue(const VarName: string;
  var Value: Variant);
begin
  if UpperCase(VarName) = 'DATA' then
    Value := qryContagemInicialDataInicio.AsString
  else if UpperCase(VarName) = 'CODIGO' then
    Value := qryContagemInicialidContagem.AsString;
end;

end.
