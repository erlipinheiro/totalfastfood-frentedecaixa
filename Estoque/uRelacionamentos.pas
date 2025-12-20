unit uRelacionamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.StdCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmRelacionamentos = class(TfrmFormPadrao)
    Panel1: TPanel;
    btnSelecionaUsuario: TPanel;
    Panel2: TPanel;
    lblNomeFornecedor: TLabel;
    lblUsuario: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    qryProdutosxprod: TStringField;
    qryProdutosdescricao: TStringField;
    qryProdutosidProduto: TIntegerField;
    qryProdutoscprod: TStringField;
    qryProdutosQuantidadeRelacionada: TFloatField;
    cxGrid1DBTableView1xprod: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1cprod: TcxGridDBColumn;
    cxGrid1DBTableView1QuantidadeRelacionada: TcxGridDBColumn;
    btnAlterarRelacionamento: TJvPanel;
    procedure btnSelecionaUsuarioClick(Sender: TObject);
    procedure btnAlterarRelacionamentoClick(Sender: TObject);
  private
    { Private declarations }
    idFornecedor : integer;
    NomeFornecedor : string;
  public
    { Public declarations }
  end;

var
  frmRelacionamentos: TfrmRelacionamentos;

implementation

{$R *.dfm}

uses uSelecionaPessoa, uRelacionaProduto, DataModuleCaixa;

procedure TfrmRelacionamentos.btnAlterarRelacionamentoClick(Sender: TObject);
Var
  ControlaEstoque : boolean;
  idProdutoRelacionado : integer;
  QtdeRelacionada : double;
begin
  if dmCaixa.ProdutoRelacionado(idFornecedor, qryProdutoscprod.AsString, qryProdutosxprod.AsString, idProdutoRelacionado, QtdeRelacionada, ControlaEstoque, True) then
  begin
    qryProdutos.Close;
    qryProdutos.Open;
  end;
end;

procedure TfrmRelacionamentos.btnSelecionaUsuarioClick(Sender: TObject);
begin
  fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
  fSelecionaPessoa.idTipoPessoa := 3;
  if fSelecionaPessoa.ShowModal = mrOk then
  begin
    idFornecedor := fSelecionaPessoa.qryPessoasidPessoa.AsInteger;
    NomeFornecedor := fSelecionaPessoa.qryPessoasNomeFantasia.AsString;
    lblNomeFornecedor.Caption := NomeFornecedor;
    with qryProdutos do
    begin
      Close;
      ParamByName('idPessoa').asinteger := idFornecedor;
      Open;
    end;
  end
  else
  begin
    idFornecedor := -1;
    NomeFornecedor := '';
    lblNomeFornecedor.Caption := NomeFornecedor;
  end;
end;

end.
