unit uConsultaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.StdCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConsultaVenda = class(TfrmFormPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlPagamentos: TPanel;
    pnlItens: TScrollBox;
    dsContaPagamentos: TDataSource;
    qryContaPagamentos: TFDQuery;
    qryContaPagamentosDescricao: TStringField;
    qryContaPagamentosvlPagamento: TCurrencyField;
    DBGrid1: TDBGrid;
    pnlData: TPanel;
    pnlMesaSenhaCartao: TPanel;
    JvPanel1: TJvPanel;
    Label3: TLabel;
    pnlCupomFiscal: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FidConta: integer;
    FidCaixa: integer;
    procedure SetidCaixa(const Value: integer);
    procedure SetidConta(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idCaixa : integer read FidCaixa write SetidCaixa;
    property idConta : integer read FidConta write SetidConta;
  end;

var
  frmConsultaVenda: TfrmConsultaVenda;

implementation

{$R *.dfm}

uses DataModuleCaixa, uConta;

{ TfrmConsultaVenda }

procedure TfrmConsultaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryContaPagamentos.Close;
end;

procedure TfrmConsultaVenda.FormShow(Sender: TObject);
begin
  inherited;

  dmCaixa.AtualizaQueryItens(idCaixa, idConta, -1);
  dmCaixa.AtualizaPainelItens(pnlItens, idConta, nil, nil, nil, nil, nil);
  dmCaixa.qryItens.Close;

  with qryContaPagamentos do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    ParamByName('idCaixa').Value   := idCaixa;
    ParamByName('idConta').Value   := idConta;
    Open
  end;
end;

procedure TfrmConsultaVenda.SetidCaixa(const Value: integer);
begin
  FidCaixa := Value;
end;

procedure TfrmConsultaVenda.SetidConta(const Value: integer);
begin
  FidConta := Value;
end;

end.
