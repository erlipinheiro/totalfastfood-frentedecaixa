unit uSelecionaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
   cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxNavigator, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSelecionaCaixa = class(TfrmFormPadrao)
    dsCaixas: TDataSource;
    qryCaixas: TFDQuery;
    dbgridCaixas: TcxGrid;
    dbgridCaixasDBTableView1: TcxGridDBTableView;
    dbgridCaixasLevel1: TcxGridLevel;
    qryCaixasidEmpresa: TIntegerField;
    qryCaixasidCaixa: TIntegerField;
    qryCaixasidUsuarioAbertura: TIntegerField;
    qryCaixasidUsuarioFechamento: TIntegerField;
    qryCaixasidListaPreco: TIntegerField;
    qryCaixasdhAbertura: TDateTimeField;
    qryCaixasdhFechamento: TDateTimeField;
    qryCaixasvlInicio: TCurrencyField;
    qryCaixasvlTotalVenda: TCurrencyField;
    qryCaixasvlDeposito: TCurrencyField;
    qryCaixasvlTroco: TCurrencyField;
    qryCaixasDataEnvioCentral: TDateTimeField;
    qryCaixasflEnviadoCentral: TBooleanField;
    qryCaixasUsuarioAbertura: TStringField;
    qryCaixasUsuarioFechamento: TStringField;
    dbgridCaixasDBTableView1idCaixa: TcxGridDBColumn;
    dbgridCaixasDBTableView1dhAbertura: TcxGridDBColumn;
    dbgridCaixasDBTableView1dhFechamento: TcxGridDBColumn;
    dbgridCaixasDBTableView1vlTotalVenda: TcxGridDBColumn;
    dbgridCaixasDBTableView1vlInicio: TcxGridDBColumn;
    dbgridCaixasDBTableView1vlDeposito: TcxGridDBColumn;
    dbgridCaixasDBTableView1vlTroco: TcxGridDBColumn;
    dbgridCaixasDBTableView1UsuarioAbertura: TcxGridDBColumn;
    dbgridCaixasDBTableView1UsuarioFechamento: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKPadraoClick(Sender: TObject);
    procedure dbgridCaixasDBTableView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idCaixa : integer;
    DataCaixa : TDate;
  end;

var
  frmSelecionaCaixa: TfrmSelecionaCaixa;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmSelecionaCaixa.btnOKPadraoClick(Sender: TObject);
begin
  idCaixa := qryCaixasidCaixa.AsInteger;
  DataCaixa := qryCaixasdhAbertura.AsDateTime;

  inherited;
end;

procedure TfrmSelecionaCaixa.dbgridCaixasDBTableView1DblClick(Sender: TObject);
begin
  inherited;

  btnOKPadraoClick(Nil);
end;

procedure TfrmSelecionaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryCaixas.Close;
end;

procedure TfrmSelecionaCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  with qryCaixas do
  begin
    Close;
    ParamByName('idEmpresa').AsInteger := dmCaixa.Estacao.idEmpresa;
    Open;
  end;
end;

end.
