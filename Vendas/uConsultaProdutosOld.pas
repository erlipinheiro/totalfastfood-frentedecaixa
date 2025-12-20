unit uConsultaProdutosOld;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ComCtrls, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, frxClass, frxExportPDF, frxDBSet,
  cxCheckBox, cxCalc, frxExportImage, frxExportText,
  frxExportCSV, frxExportRTF, frxExportHTML, frxExportODF, frxExportDBF,
  frxExportBIFF, frxExportMail, frxExportXML, frxExportXLS, cxNavigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFormPadrao;

type
  TfrmConsultaProdutosold = class(TfrmFormPadrao)
    pnlCaixa: TPanel;
    Panel1: TPanel;
    btnVoltar: TImage;
    btnImprimir: TJvPanel;
    dbgridProdutos: TcxGrid;
    dbgridProdutosDBTableView1: TcxGridDBTableView;
    dbgridProdutosLevel1: TcxGridLevel;
    pnlPesquisa: TPanel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtFim: TDateTimePicker;
    dtInicio: TDateTimePicker;
    pnlBuscar: TPanel;
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    frxdbProdutos: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxProdutos: TfrxReport;
    dbgridProdutosDBTableView1Descricao: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoReduzida: TcxGridDBColumn;
    dbgridProdutosDBTableView1TipoRelacionamento: TcxGridDBColumn;
    dbgridProdutosDBTableView1flCombo: TcxGridDBColumn;
    dbgridProdutosDBTableView1vlProduto: TcxGridDBColumn;
    dbgridProdutosDBTableView1QtdeTotal: TcxGridDBColumn;
    qryProdutosDescricao: TStringField;
    qryProdutosDescricaoReduzida: TStringField;
    qryProdutosTipoRelacionamento: TStringField;
    qryProdutosflCombo: TBooleanField;
    qryProdutosvlProduto: TCurrencyField;
    qryProdutosQtdeTotal: TFloatField;
    qryProdutosValorTotal: TFloatField;
    dbgridProdutosDBTableView1ValorTotal: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxMailExport1: TfrxMailExport;
    frxODSExport1: TfrxODSExport;
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
    procedure qryProdutosCalcFields(DataSet: TDataSet);
    procedure frxProdutosGetValue(const VarName: string; var Value: Variant);
    procedure pnlBuscarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProdutosold: TfrmConsultaProdutosold;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmConsultaProdutosold.btnImprimirClick(Sender: TObject);
begin
  qryProdutos.DisableControls;

  if frxProdutos.PrepareReport then
  begin
    qryProdutos.EnableControls;
    frxProdutos.ShowPreparedReport;
  end;
end;

procedure TfrmConsultaProdutosold.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaProdutosold.FormCreate(Sender: TObject);
begin
  dtInicio.Date := Now;
  dtFim.Date    := Now;
end;

procedure TfrmConsultaProdutosold.frxProdutosGetValue(const VarName: string; var Value: Variant);
begin
  if UpperCase(VarName) = 'INICIO' then
    Value := DateToStr(dtInicio.Date)
  else if UpperCase(VarName) = 'FIM' then
    Value := DateToStr(dtFim.Date)
  else if UpperCase(VarName) = 'LOJA' then
    Value := dmCaixa.Estacao.CNPJ + ' - ' + dmCaixa.Estacao.NomeFantasia;
end;

procedure TfrmConsultaProdutosold.pnlBuscarClick(Sender: TObject);
begin
  with qryProdutos do
  begin
    Close;
    ParamByName('idEmpresa').AsInteger    := dmCaixa.Estacao.idEmpresa;
    ParamByName('DataInicial').AsDateTime := dtInicio.DateTime;
    ParamByName('DataFinal').AsDateTime   := dtFim.DateTime;
    Open;
  end;
end;

procedure TfrmConsultaProdutosold.qryProdutosCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ValorTotal').AsCurrency := DataSet.FieldByName('vlProduto').AsCurrency * DataSet.FieldByName('qtdeTotal').AsFloat;
end;

end.
