unit uSelecionaAreaProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Data.FMTBcd,  Data.DB, Data.SqlExpr,Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmSelecionaAreaProducao = class(TForm)
    pnlBotoes: TPanel;
    btnOK: TPanel;
    btnVoltar: TImage;
    Label1: TLabel;
    qryAreasProducao: TFDQuery;
    DBGrid1: TDBGrid;
    dsAreasProducao: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaAreaProducao: TfrmSelecionaAreaProducao;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmSelecionaAreaProducao.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelecionaAreaProducao.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelecionaAreaProducao.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSelecionaAreaProducao.FormCreate(Sender: TObject);
begin
  with qryAreasProducao do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;
end;

procedure TfrmSelecionaAreaProducao.FormShow(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  btnOK.Left := Self.Width - btnOK.Width - 25;
end;

end.
