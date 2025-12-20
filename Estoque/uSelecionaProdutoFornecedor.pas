unit uSelecionaProdutoFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
   JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, cxNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmSelecionaProdutoFornecedor = class(TfrmFormPadrao)
    qryProdutosFornecedores: TFDQuery;
    qryProdutosFornecedorescProd: TStringField;
    qryProdutosFornecedoresxProd: TStringField;
    dsProdutosFornecedores: TDataSource;
    dbgridProdutosFornecedores: TcxGrid;
    dbgridProdutosFornecedoresDBTableView1: TcxGridDBTableView;
    dbgridProdutosFornecedoresDBTableView1cProd: TcxGridDBColumn;
    dbgridProdutosFornecedoresDBTableView1xProd: TcxGridDBColumn;
    dbgridProdutosFornecedoresLevel1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
  private
    FidEmpresa: integer;
    FidPessoa: integer;
    procedure SetidEmpresa(const Value: integer);
    procedure SetidPessoa(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idEmpresa : integer read FidEmpresa write SetidEmpresa;
    property idPessoa : integer read FidPessoa write SetidPessoa;
  end;

var
  frmSelecionaProdutoFornecedor: TfrmSelecionaProdutoFornecedor;

implementation

{$R *.dfm}

uses DataModuleCaixa, uMensagem;

procedure TfrmSelecionaProdutoFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  with qryProdutosFornecedores do
  begin
    Close;
    ParamByName('idEmpresa').Value := FidEmpresa;
    ParamByName('idPessoa').Value  := FidPessoa;
    Open;

    if RecordCount <= 0 then
    begin
      frmMensagem.MostraMensagem('Nenhum produto cadastrado para este fornecedor.');
      Close;
    end;
  end;
end;

procedure TfrmSelecionaProdutoFornecedor.SetidEmpresa(const Value: integer);
begin
  FidEmpresa := Value;
end;

procedure TfrmSelecionaProdutoFornecedor.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
end;

end.
