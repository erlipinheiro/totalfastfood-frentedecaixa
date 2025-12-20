unit uPedidoCompraItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseEdits, cxCalc, cxCurrencyEdit, cxNavigator,
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
  dxSkinscxPCPainter, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmPedidoCompraItens = class(TfrmFormPadrao)
    dbgridPedidoCompra: TcxGrid;
    dbgridPedidoCompraDBTableView1: TcxGridDBTableView;
    dbgridPedidoCompraLevel1: TcxGridLevel;
    qryPedidoCompraItens: TFDQuery;
    dsPedidoCompraItens: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    qryPedidoCompraItensidEmpresa: TIntegerField;
    qryPedidoCompraItensidPedidoCompra: TIntegerField;
    qryPedidoCompraItensidPedidoCompraItem: TIntegerField;
    qryPedidoCompraItensidProduto: TIntegerField;
    qryPedidoCompraItensQtdeEstoque: TFloatField;
    qryPedidoCompraItensQtdePedido: TFloatField;
    qryPedidoCompraItensQtdeUsada: TFloatField;
    qryPedidoCompraItensMTC: TFloatField;
    qryPedidoCompraItensQtdePorTickets: TFloatField;
    qryPedidoCompraItensQtdeSugerida: TFloatField;
    qryPedidoCompraItenscdProduto: TStringField;
    qryPedidoCompraItensDescricao: TStringField;
    qryPedidoCompraItensCodigoFornecedor: TStringField;
    qryPedidoCompraItensqtde: TFloatField;
    qryPedidoCompraItensQtdeNoEstoque: TFloatField;
    dbgridPedidoCompraDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1idPedidoCompra: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1idPedidoCompraItem: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1idProduto: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1QtdePedido: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1MTC: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1QtdePorTickets: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1QtdeSugerida: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1cdProduto: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1Descricao: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1CodigoFornecedor: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1QtdeNoEstoque: TcxGridDBColumn;
    dbgridPedidoCompraDBTableView1qtde: TcxGridDBColumn;
    procedure dbgridPedidoCompraDBTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCompraItens: TfrmPedidoCompraItens;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmPedidoCompraItens.dbgridPedidoCompraDBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    dbgridPedidoCompraDBTableView1.Controller.FocusNextRecord(8, true, true, false, false);
end;

end.
