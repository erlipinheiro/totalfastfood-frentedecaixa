unit uSelecionaConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfSelecionaConvenio = class(TForm)
    Panel1: TPanel;
    btnVoltar: TImage;
    btnOK: TPanel;
    qryConvenios: TFDQuery;
    qryConveniosidConvenio: TIntegerField;
    qryConveniosDescricao: TStringField;
    qryConveniosDataInicio: TDateTimeField;
    qryConveniosDataFim: TDateTimeField;
    qryConveniosAtivo: TBooleanField;
    qryConveniosidPessoa: TIntegerField;
    qryConveniosRazaoSocial: TStringField;
    qryConveniosNomeFantasia: TStringField;
    dsConvenios: TDataSource;
    Panel2: TPanel;
    lblSelecione: TLabel;
    DBGrid1: TDBGrid;
    procedure btnOKClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure dbgridConveniadosDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSelecionaConvenio: TfSelecionaConvenio;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfSelecionaConvenio.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSelecionaConvenio.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfSelecionaConvenio.dbgridConveniadosDBTableView1DblClick(
  Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TfSelecionaConvenio.FormShow(Sender: TObject);
begin
  with qryConvenios do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;
end;

end.
