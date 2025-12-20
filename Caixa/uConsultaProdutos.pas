unit uConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxCheckBox, cxCalc, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  frxClass, frxDBSet, frxExportPDF, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.StdCtrls, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, frxExportHTML, frxExportImage,
  frxExportText, frxExportRTF, frxExportCSV;

type
  TfrmConsultaProdutos = class(TfrmFormPadrao)
    pnlPesquisa: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dtpFim: TDateTimePicker;
    dtpInicio: TDateTimePicker;
    pnlBuscar: TPanel;
    qryProdutos: TFDQuery;
    strngfldProdutosDescricao: TStringField;
    strngfldProdutosDescricaoReduzida: TStringField;
    strngfldProdutosTipoRelacionamento: TStringField;
    qryProdutosflCombo: TBooleanField;
    qryProdutosvlProduto: TCurrencyField;
    qryProdutosQtdeTotal: TFloatField;
    qryProdutosValorTotal: TFloatField;
    dsProdutos: TDataSource;
    frxProdutos: TfrxReport;
    frxCSVExport1: TfrxCSVExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxBMPExport1: TfrxBMPExport;
    frxRTFExport1: TfrxRTFExport;
    frxGIFExport1: TfrxGIFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxdbProdutos: TfrxDBDataset;
    dbgridProdutos: TcxGrid;
    dbgridProdutosDBTableView1: TcxGridDBTableView;
    dbgridProdutosDBTableView1Descricao: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoReduzida: TcxGridDBColumn;
    dbgridProdutosDBTableView1TipoRelacionamento: TcxGridDBColumn;
    dbgridProdutosDBTableView1flCombo: TcxGridDBColumn;
    dbgridProdutosDBTableView1vlProduto: TcxGridDBColumn;
    dbgridProdutosDBTableView1QtdeTotal: TcxGridDBColumn;
    dbgridProdutosDBTableView1ValorTotal: TcxGridDBColumn;
    dbgridProdutosLevel1: TcxGridLevel;
    btnImprimir: TJvPanel;
    procedure pnlBuscarClick(Sender: TObject);
    procedure qryProdutosCalcFields(DataSet: TDataSet);
    procedure frxProdutosGetValue(const VarName: string; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProdutos: TfrmConsultaProdutos;

implementation

{$R *.dfm}

uses DataModuleCaixa, uMensagem;

procedure TfrmConsultaProdutos.btnImprimirClick(Sender: TObject);
begin
  qryProdutos.DisableControls;

  if frxProdutos.PrepareReport then
  begin
    qryProdutos.EnableControls;
    frxProdutos.ShowPreparedReport;
  end;
end;

procedure TfrmConsultaProdutos.FormCreate(Sender: TObject);
begin
  inherited;

  dtpInicio.Date := Now;
  dtpFim.Date    := Now;
end;

procedure TfrmConsultaProdutos.frxProdutosGetValue(const VarName: string;
  var Value: Variant);
begin
  if UpperCase(VarName) = 'INICIO' then
    Value := DateToStr(dtpInicio.Date)
  else if UpperCase(VarName) = 'FIM' then
    Value := DateToStr(dtpFim.Date)
  else if UpperCase(VarName) = 'LOJA' then
    Value := dmCaixa.Estacao.Dados.CNPJ + ' - ' + dmCaixa.Estacao.Dados.NomeFantasia;
end;

procedure TfrmConsultaProdutos.pnlBuscarClick(Sender: TObject);
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := 'select * from vendas.caixas where idEmpresa = :idEmpresa and dhFechamento is null and dhAbertura between :DataInicial and :DataFinal';
    ParamByName('idEmpresa').DataType     := ftInteger;
    ParamByName('DataInicial').DataType   := ftDateTime;
    ParamByName('DataFinal').DataType     := ftDateTime;
    ParamByName('idEmpresa').AsInteger    := dmCaixa.Estacao.idEmpresa;
    ParamByName('DataInicial').AsDateTime := dtpInicio.DateTime;
    ParamByName('DataFinal').AsDateTime   := dtpFim.DateTime;
    Open;

    if RecordCount > 0 then
    begin
      frmMensagem.MostraMensagem('Não é possível fazer consulta de caixa em aberto.');
    end
    else
    begin
      with qryProdutos do
      begin
        Close;
        ParamByName('idEmpresa').AsInteger    := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').AsDateTime := dtpInicio.DateTime;
        ParamByName('DataFinal').AsDateTime   := dtpFim.DateTime;
        Open;
      end;
    end;

    Close;
  end;
end;

procedure TfrmConsultaProdutos.qryProdutosCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ValorTotal').AsCurrency := DataSet.FieldByName('vlProduto').AsCurrency * DataSet.FieldByName('qtdeTotal').AsFloat;
end;

end.
