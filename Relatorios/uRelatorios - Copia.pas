unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,  cxContainer,
  frxClass, frxDBSet, frxExportImage, frxExportText,
  frxExportCSV, frxExportRTF, frxExportHTML, frxExportODF, frxExportDBF,
  frxExportBIFF, frxExportPDF, frxExportMail, frxExportXML, frxExportXLS,
  cxNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls;

type
  TfrmRelatorios = class(TfrmFormPadrao)
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
    dbgridContagemFinal: TcxGrid;
    dbgridContagemFinalDBTableView1: TcxGridDBTableView;
    dbgridContagemFinalDBTableView1idContagem: TcxGridDBColumn;
    dbgridContagemFinalDBTableView1DataInicio: TcxGridDBColumn;
    dbgridContagemFinalLevel1: TcxGridLevel;
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
    btnCompras: TJvPanel;
    qryComprasPorFornecedor: TFDQuery;
    qryComprasPorFornecedorRazaoSocial: TStringField;
    qryComprasPorFornecedorTotalCompras: TCurrencyField;
    frxdbComprasPorFornecedor: TfrxDBDataset;
    frxComprasPorFornecedor: TfrxReport;
    btnComprasPlanoContas: TJvPanel;
    qryComprasPorFornecedorNomeFantasia: TStringField;
    qryComprasPorPlanoContas: TFDQuery;
    frxdbComprasPorPlanoContas: TfrxDBDataset;
    qryPlanoContas: TFDQuery;
    frxdbPlanoContas: TfrxDBDataset;
    frxComprasPorPlanoContas: TfrxReport;
    dsPlanoContas: TDataSource;
    qryPlanoContasidPlanoContas: TIntegerField;
    qryPlanoContasidPlanoContasPai: TIntegerField;
    qryPlanoContasDescricao: TMemoField;
    qryPlanoContasCaminho: TMemoField;
    qryGastosEmDinheiro: TFDQuery;
    frxdbGastosEmDinheiro: TfrxDBDataset;
    frxGastosEmDinheiro: TfrxReport;
    qryGastosEmDinheiroDataEmissao: TDateTimeField;
    qryGastosEmDinheiroNomeFantasia: TStringField;
    qryGastosEmDinheiroValorTotal: TCurrencyField;
    btnGastosEmDinheiro: TJvPanel;
    qryComprasPorPlanoContascdProduto: TStringField;
    qryComprasPorPlanoContasidPlanoContas: TIntegerField;
    qryComprasPorPlanoContasDescricao: TStringField;
    qryComprasPorPlanoContasUnidade: TStringField;
    qryComprasPorPlanoContasTotalEntrada: TFloatField;
    qryGastosDiarios: TFDQuery;
    frxdbGastosDiarios: TfrxDBDataset;
    frxGastosDiarios: TfrxReport;
    qryGastosDiariosDataEmissao: TDateTimeField;
    qryGastosDiariosNomeFantasia: TStringField;
    qryGastosDiariosxProd: TStringField;
    qryGastosDiariosqcom: TFloatField;
    qryGastosDiariosvuncom: TCurrencyField;
    qryGastosDiariosvProd: TCurrencyField;
    qryGastosDiariosidNota: TIntegerField;
    qryGastosDiariosValorTotal: TCurrencyField;
    qryGastosDiariosDescricao: TStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    frxCMVComCompras: TfrxReport;
    qryComprasPorProduto: TFDQuery;
    frxdbComprasPorProduto: TfrxDBDataset;
    dsCMVEstoque: TDataSource;
    qryComprasPorProdutoidEmpresa: TIntegerField;
    qryComprasPorProdutoidProduto: TIntegerField;
    qryComprasPorProdutoidMovimentacao: TIntegerField;
    qryComprasPorProdutoDataHora: TDateTimeField;
    qryComprasPorProdutoidTipoMovimentacao: TIntegerField;
    qryComprasPorProdutoQtde: TFloatField;
    qryComprasPorProdutocProd: TStringField;
    qryComprasPorProdutoxProd: TStringField;
    qryComprasPorProdutoqCom: TFloatField;
    qryComprasPorProdutouCom: TStringField;
    qryComprasPorProdutovunCom: TCurrencyField;
    qryComprasPorProdutoSigla: TStringField;
    qryComprasPorProdutoQuantidadeRelacionada: TFloatField;
    qryComprasPorProdutoNomeFantasia: TStringField;
    qryComprasPorProdutoNumeroNota: TStringField;
    qryComprasPorProdutoidNota: TIntegerField;
    btnCMVComCompras: TJvPanel;
    edtDataInicial: TMonthCalendar;
    edtDataFinal: TMonthCalendar;
    procedure btnOKPadraoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxCMVEstoqueGetValue(const VarName: string; var Value: Variant);
    procedure btnGerarDREClick(Sender: TObject);
    procedure frxValorEstoqueGetValue(const VarName: string;
      var Value: Variant);
    procedure btnInventarioFisicoFinanceiroClick(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnGastosEmDinheiroClick(Sender: TObject);
    procedure btnComprasPlanoContasClick(Sender: TObject);
    procedure btnCMVComComprasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPergunta, uMensagem;

procedure TfrmRelatorios.btnCMVComComprasClick(Sender: TObject);
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

      with qryComprasPorProduto do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.Date;
        ParamByName('DataFinal').Value := edtDataFinal.Date;
        Open;
      end;

      if frxCMVComCompras.PrepareReport(true) then
        frxCMVComCompras.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
  end
  else
    frmMensagem.MostraMensagem('A data da contagem inicial não pode ser maior do que a data da contagem final.');
end;

procedure TfrmRelatorios.btnComprasClick(Sender: TObject);
begin
  inherited;
  with qryComprasPorFornecedor do
  begin
    Close;
    ParamByName('idEmpresa').value := dmCaixa.Estacao.idEmpresa;
    ParamByName('DataInicio').Value := edtDataInicial.Date;
    ParamByName('DataFim').Value := edtDataFinal.Date;
    Open;
  end;

  if frxComprasPorFornecedor.PrepareReport(true) then
    frxComprasPorFornecedor.ShowPreparedReport;
end;

procedure TfrmRelatorios.btnComprasPlanoContasClick(Sender: TObject);
begin
  if edtDataInicial.Date < edtDataFinal.Date then
  begin
    with qryGastosDiarios do
    begin
      Close;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
      ParamByName('DataInicial').Value := edtDataInicial.Date;
      ParamByName('DataFinal').Value := edtDataFinal.Date;
      Open;
    end;

    if frxGastosDiarios.PrepareReport(true) then
      frxGastosDiarios.ShowPreparedReport;
  end
  else
    frmMensagem.MostraMensagem('A data da compra inicial não pode ser maior do que a data da compra final.');
end;

procedure TfrmRelatorios.btnGastosEmDinheiroClick(Sender: TObject);
begin
  if edtDataInicial.Date < edtDataFinal.Date then
  begin
    with qryGastosEmDinheiro do
    begin
      Close;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
      ParamByName('DataInicial').Value := edtDataInicial.Date;
      ParamByName('DataFinal').Value := edtDataFinal.Date;
      Open;
    end;

    if frxGastosEmDinheiro.PrepareReport(true) then
      frxGastosEmDinheiro.ShowPreparedReport;
  end
  else
    frmMensagem.MostraMensagem('A data da compra inicial não pode ser maior do que a data da compra final.');
end;

procedure TfrmRelatorios.btnGerarDREClick(Sender: TObject);
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
        ParamByName('DataInicialValorMedio').Value := edtDataInicial.Date - 30;
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

procedure TfrmRelatorios.btnInventarioFisicoFinanceiroClick(Sender: TObject);
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

procedure TfrmRelatorios.btnOKPadraoClick(Sender: TObject);
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

procedure TfrmRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  qryContagemInicial.Close;
  qryContagemFinal.Close;
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
  inherited;

  edtDataInicial.Date := Now - 60;
  edtDataFinal.Date   := Now - 30;

  with qryContagemInicial do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;

  with qryContagemFinal do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;

end;

procedure TfrmRelatorios.frxCMVEstoqueGetValue(const VarName: string;
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
  end;
end;

procedure TfrmRelatorios.frxValorEstoqueGetValue(const VarName: string;
  var Value: Variant);
begin
  if UpperCase(VarName) = 'DATA' then
    Value := qryContagemInicialDataInicio.AsString
  else if UpperCase(VarName) = 'CODIGO' then
    Value := qryContagemInicialidContagem.AsString;
end;

end.
