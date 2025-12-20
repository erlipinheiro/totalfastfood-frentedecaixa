unit uAuditoriaEstoqueProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,  cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxClasses,
  JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, cxNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmAuditoriaEstoqueProdutos = class(TfrmFormPadrao)
    qryContagemProdutos: TFDQuery;
    dsContagemProdutos: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    dbgridContagemEstoqueProdutos: TcxGrid;
    dbgridContagemEstoqueProdutosDBTableView1: TcxGridDBTableView;
    dbgridContagemEstoqueProdutosLevel1: TcxGridLevel;
    cxGridRelacaoEntreProdutosDBTableView1: TcxGridDBTableView;
    cxGridRelacaoEntreProdutosLevel1: TcxGridLevel;
    cxGridRelacaoEntreProdutos: TcxGrid;
    qryRelacaoEntreProdutos: TFDQuery;
    dsRelacaoEntreProdutos: TDataSource;
    qryRelacaoEntreProdutosidPessoa: TIntegerField;
    qryRelacaoEntreProdutosidProduto: TIntegerField;
    qryRelacaoEntreProdutosRazaoSocial: TStringField;
    qryRelacaoEntreProdutosNomeFantasia: TStringField;
    qryRelacaoEntreProdutosCodigoFornecedor: TStringField;
    qryRelacaoEntreProdutosQtde: TFloatField;
    cxGridRelacaoEntreProdutosDBTableView1RazaoSocial: TcxGridDBColumn;
    cxGridRelacaoEntreProdutosDBTableView1NomeFantasia: TcxGridDBColumn;
    cxGridRelacaoEntreProdutosDBTableView1CodigoFornecedor: TcxGridDBColumn;
    cxGridRelacaoEntreProdutosDBTableView1Qtde: TcxGridDBColumn;
    Splitter1: TSplitter;
    qryContagemProdutosidEmpresa: TIntegerField;
    qryContagemProdutosidContagem: TIntegerField;
    qryContagemProdutosidProduto: TIntegerField;
    qryContagemProdutosQtdeInteira: TFloatField;
    qryContagemProdutosQtdeFracionada: TFloatField;
    qryContagemProdutosQtdeDiferenca: TFloatField;
    qryContagemProdutosDataEnvioCentral: TDateTimeField;
    qryContagemProdutosflEnviadoCentral: TBooleanField;
    qryContagemProdutoscdProduto: TStringField;
    qryContagemProdutosDescricao: TStringField;
    qryContagemProdutosDescricaoGrupo: TStringField;
    qryContagemProdutosDescricaoSubGrupo: TStringField;
    qryContagemProdutosDescricaoLinhaProduto: TStringField;
    qryContagemProdutosidUnidadePacote: TIntegerField;
    qryContagemProdutosqtdePacote: TFloatField;
    qryContagemProdutosDescricaoUnidadePacote: TStringField;
    dbgridContagemEstoqueProdutosDBTableView1QtdeInteira: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1QtdeFracionada: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1cdProduto: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1Descricao: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1DescricaoGrupo: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1DescricaoSubGrupo: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1DescricaoLinhaProduto: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1qtdePacote: TcxGridDBColumn;
    dbgridContagemEstoqueProdutosDBTableView1DescricaoUnidadePacote: TcxGridDBColumn;
    qryContagemProdutosTotal: TFloatField;
    dbgridContagemEstoqueProdutosDBTableView1Total: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure qryContagemProdutosCalcFields(DataSet: TDataSet);
  private
    FidContagem: integer;
    procedure SetidContagem(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idContagem : integer read FidContagem write SetidContagem;
  end;

var
  frmAuditoriaEstoqueProdutos: TfrmAuditoriaEstoqueProdutos;

implementation

{$R *.dfm}
uses uAuditoriaEstoque, DataModuleCaixa;

procedure TfrmAuditoriaEstoqueProdutos.FormShow(Sender: TObject);
begin
  inherited;

  with qryContagemProdutos do
  begin
    Close;
    ParamByName('idEmpresa').AsInteger := dmCaixa.Estacao.idEmpresa;
    ParamByName('idContagem').AsInteger := FidContagem;
    Open;
  end;

  qryRelacaoEntreProdutos.Close;
  qryRelacaoEntreProdutos.Open;
end;

procedure TfrmAuditoriaEstoqueProdutos.qryContagemProdutosCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  DataSet.FieldByName('Total').Value :=
    DataSet.FieldByName('QtdePacote').AsFloat * DataSet.FieldByName('QtdeInteira').AsFloat + DataSet.FieldByName('QtdeFracionada').AsFloat;

end;

procedure TfrmAuditoriaEstoqueProdutos.SetidContagem(const Value: integer);
begin
  FidContagem := Value;
end;

end.
