unit uSelecionaPromocoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmSelecionaPromocoes = class(TForm)
    pnlBotoes: TPanel;
    btnVoltar: TImage;
    btnOK: TPanel;
    DBGrid1: TDBGrid;
    qryPromocoes: TFDQuery;
    dsPromocoes: TDataSource;
    Panel1: TPanel;
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
  frmSelecionaPromocoes: TfrmSelecionaPromocoes;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmSelecionaPromocoes.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSelecionaPromocoes.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSelecionaPromocoes.DBGrid1DblClick(Sender: TObject);
begin
  btnOKClick(Sender);
end;

procedure TfrmSelecionaPromocoes.FormCreate(Sender: TObject);
begin
  with qryPromocoes do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;
end;

procedure TfrmSelecionaPromocoes.FormShow(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  btnOK.Left := Self.Width - btnOK.Width - 25;
end;

end.
