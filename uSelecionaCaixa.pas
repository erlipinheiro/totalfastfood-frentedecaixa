unit uSelecionaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmSelecionaCaixa = class(TForm)
    dbgridCaixas: TDBGrid;
    Panel1: TPanel;
    pnlBotoes: TPanel;
    btnVoltar: TImage;
    btnOK: TPanel;
    qryCaixas: TFDQuery;
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
    qryCaixasvlGastos: TCurrencyField;
    qryCaixasvlTroco: TCurrencyField;
    qryCaixasDataEnvioCentral: TDateTimeField;
    qryCaixasflEnviadoCentral: TBooleanField;
    qryCaixasUsuarioAbertura: TStringField;
    qryCaixasUsuarioFechamento: TStringField;
    dsCaixas: TDataSource;
    qryTurnos: TFDQuery;
    dsTurnos: TDataSource;
    dbgridTurnos: TDBGrid;
    qryTurnosidEmpresa: TIntegerField;
    qryTurnosidCaixa: TIntegerField;
    qryTurnosidSessaoCaixa: TIntegerField;
    qryTurnosidUsuarioAbertura: TIntegerField;
    qryTurnosidUsuarioFechamento: TIntegerField;
    qryTurnosidEstacao: TIntegerField;
    qryTurnosdhAbertura: TDateTimeField;
    qryTurnosdhFechamento: TDateTimeField;
    qryTurnosvlInicial: TCurrencyField;
    qryTurnosvlVenda: TCurrencyField;
    qryTurnosTaxaServico: TFloatField;
    qryTurnosDataEnvioCentral: TDateTimeField;
    qryTurnosflEnviadoCentral: TBooleanField;
    qryTurnosUsuarioAbertura: TStringField;
    qryTurnosUsuarioFechamento: TStringField;
    pnlSelecioneTurno: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaCaixa: TfrmSelecionaCaixa;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmSelecionaCaixa.btnOKClick(Sender: TObject);
begin
  if (qryCaixas.RecordCount > 0) then
    ModalResult := mrOk;
end;

procedure TfrmSelecionaCaixa.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelecionaCaixa.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
end;

procedure TfrmSelecionaCaixa.FormShow(Sender: TObject);
begin
  with qryCaixas do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;
end;

end.
