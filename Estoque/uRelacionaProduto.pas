unit uRelacionaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxClasses, cxStyles,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExExtCtrls, JvExtComponent,
  JvPanel, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmRelacionaProduto = class(TfrmFormPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlCodigo: TPanel;
    pnlDescricao: TPanel;
    qryProdutos: TFDQuery;
    qryProdutosidEmpresa: TIntegerField;
    qryProdutosidProduto: TIntegerField;
    qryProdutoscdProduto: TStringField;
    qryProdutosDescricao: TStringField;
    qryProdutosCodigoBarras: TStringField;
    qryProdutosDescricaoGrupo: TStringField;
    qryProdutosDescricaoSubGrupo: TStringField;
    qryProdutosDescricaoLinhaProduto: TStringField;
    qryProdutosDescricaoProdutoTipos: TStringField;
    qryProdutosDescricaoPlanoContas: TStringField;
    qryProdutosSigla: TStringField;
    qryProdutosNCM: TStringField;
    qryProdutosControlaEstoque: TBooleanField;
    dsProdutos: TDataSource;
    dbgridProdutos: TcxGrid;
    dbgridProdutosDBTableView1: TcxGridDBTableView;
    dbgridProdutosDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridProdutosDBTableView1idProduto: TcxGridDBColumn;
    dbgridProdutosDBTableView1cdProduto: TcxGridDBColumn;
    dbgridProdutosDBTableView1Descricao: TcxGridDBColumn;
    dbgridProdutosDBTableView1CodigoBarras: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoGrupo: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoSubGrupo: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoLinhaProduto: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoProdutoTipos: TcxGridDBColumn;
    dbgridProdutosDBTableView1DescricaoPlanoContas: TcxGridDBColumn;
    dbgridProdutosDBTableView1Sigla: TcxGridDBColumn;
    dbgridProdutosDBTableView1NCM: TcxGridDBColumn;
    dbgridProdutosLevel1: TcxGridLevel;
    edtQuantidade: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnOKPadraoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idPessoa : integer;
    CodigoProdutoFornecedor : string;
    flAlterarRelacionamento : boolean;
    function NaoExisteRestricao: Boolean;
  end;

var
  frmRelacionaProduto: TfrmRelacionaProduto;

implementation

{$R *.dfm}

uses
  uPrincipal,  DataModuleCaixa, uFuncoes;

procedure TfrmRelacionaProduto.btnOKPadraoClick(Sender: TObject);
var
  Quantidade : double;
begin
  if NaoExisteRestricao then
  begin
    if not TryStrToFloat(edtQuantidade.Text, Quantidade) then
      raise Exception.Create('Quantidade tem que ser um número válido.');

    if not flAlterarRelacionamento then
    begin
      try
        Inserir(Self, dmCaixa.dbTotalFastFood, 'Estoque.RelacaoEntreProdutos', ['idEmpresa', 'idPessoa', 'CodigoFornecedor', 'idProduto', 'Qtde'],
                [dmCaixa.Estacao.idEmpresa, idPessoa, CodigoProdutoFornecedor, qryProdutos.FieldByName('idProduto').Value,
                 Quantidade]);
      finally
        ModalResult := mrOk;
      end;
    end
    else
    begin
      try
        Atualizar(dmCaixa.dbTotalFastFood, 'Estoque.RelacaoEntreProdutos',
                ['idEmpresa', 'idPessoa', 'CodigoFornecedor'],
                [dmCaixa.Estacao.idEmpresa, idPessoa, CodigoProdutoFornecedor],
                ['idProduto', 'Qtde'],
                [qryProdutos.FieldByName('idProduto').Value,Quantidade]);
      finally
        ModalResult := mrOk;
      end;
    end;
  end;
end;

procedure TfrmRelacionaProduto.FormCreate(Sender: TObject);
begin
  inherited;

  flAlterarRelacionamento := False;
  qryProdutos.Close;
  qryProdutos.ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
  qryProdutos.Open;
end;

function TfrmRelacionaProduto.NaoExisteRestricao: Boolean;
begin
  result := Trim(edtQuantidade.Text) <> '';
end;

end.
