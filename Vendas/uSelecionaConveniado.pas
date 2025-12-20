unit uSelecionaConveniado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfSelecionaConveniado = class(TForm)
    Panel1: TPanel;
    btnVoltar: TImage;
    btnOK: TPanel;
    qryConveniado: TFDQuery;
    dsConveniado: TDataSource;
    qryConveniadoidEmpresa: TIntegerField;
    qryConveniadoidPessoa: TIntegerField;
    qryConveniadoidConvenio: TIntegerField;
    qryConveniadoAtivo: TBooleanField;
    qryConveniadoRazaoSocial: TStringField;
    qryConveniadoNomeFantasia: TStringField;
    Panel2: TPanel;
    lblSelecione: TLabel;
    DBGrid1: TDBGrid;
    procedure dbgridConveniadosDBTableView1DblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FidConvenio: integer;
    procedure SetidConvenio(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idConvenio : integer read FidConvenio write SetidConvenio;
  end;

var
  fSelecionaConveniado: TfSelecionaConveniado;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfSelecionaConveniado.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSelecionaConveniado.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfSelecionaConveniado.dbgridConveniadosDBTableView1DblClick(
  Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSelecionaConveniado.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
end;

procedure TfSelecionaConveniado.FormShow(Sender: TObject);
begin
  with qryConveniado do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    ParamByName('idConvenio').Value := FidConvenio;
    Open;
  end;
end;

procedure TfSelecionaConveniado.SetidConvenio(const Value: integer);
begin
  FidConvenio := Value;
end;

end.
