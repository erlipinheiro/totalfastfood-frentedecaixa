unit frmRelacionaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmPadrao, cxClasses, cxStyles,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfRelacionaProduto = class(TfPadrao)
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
    procedure Button1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idPessoa : integer;
    CodigoProdutoFornecedor : string;
    flAlterarRelacionamento : boolean;
    function NaoExisteRestricao: Boolean; override;
  end;

var
  fRelacionaProduto: TfRelacionaProduto;

implementation

{$R *.dfm}

uses udmProdutos, frmProdutos, uDMPrincipal, frmCadastroPadrao, uPrincipal;

procedure TfRelacionaProduto.btnOKClick(Sender: TObject);
var
  Quantidade : double;
begin
  if NaoExisteRestricao then
  begin
    if not flAlterarRelacionamento then
    begin
      if not TryStrToFloat(edtQuantidade.Text, Quantidade) then
        raise Exception.Create('Quantidade tem que ser um número válido.');

      try
        frmPrincipal.Funcoes.Inserir('Estoque.RelacaoEntreProdutos', ['idEmpresa', 'idPessoa', 'CodigoFornecedor', 'idProduto', 'Qtde'],
                [dmPrincipal.Empresa.idEmpresa, idPessoa, CodigoProdutoFornecedor, qryProdutos.FieldByName('idProduto').Value,
                 Quantidade]);
      finally
        ModalResult := mrOk;
      end;
    end
    else
      ModalResult := mrOk;
  end;

end;

procedure TfRelacionaProduto.Button1Click(Sender: TObject);
var
  flLiberarDMProdutos : boolean;
begin
  flLiberarDMProdutos := False;
  if Not Assigned(dmProdutos) then
  begin
    flLiberarDMProdutos := False;
    dmProdutos := TdmProdutos.Create(Self);
  end;

  fProdutos := TfProdutos.Create(Self);
  fProdutos.TipoFormulario := tfInclusao;
  if fProdutos.ShowModal = IDOK then
  begin
    frmPrincipal.Funcoes.Inserir('Vendas.EmpresaProdutos', ['idEmpresa', 'idProduto', 'Ativo', 'AliquotaICMS'],
      [dmPrincipal.Empresa.idEmpresa, fProdutos.qryCadastroidProduto.AsInteger, 1, 0]);

    qryProdutos.Close;
    qryProdutos.Open;
    qryProdutos.Locate('idProduto', fProdutos.qryCadastroidProduto.AsInteger, []);
  end;

  if flLiberarDMProdutos then
    FreeAndNil(dmProdutos);

  FreeAndNil(fProdutos);
end;

procedure TfRelacionaProduto.FormCreate(Sender: TObject);
begin
  inherited;

  flAlterarRelacionamento := False;

  qryProdutos.ParamByName('idEmpresa').Value := 21;
  qryProdutos.Open;
end;

function TfRelacionaProduto.NaoExisteRestricao: Boolean;
begin
  result := Trim(edtQuantidade.Text) <> '';
end;

end.
