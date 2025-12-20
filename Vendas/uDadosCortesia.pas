unit uDadosCortesia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfDadosCortesia = class(TForm)
    lblSelecione: TLabel;
    Panel1: TPanel;
    btnVoltar: TImage;
    btnOK: TPanel;
    Label1: TLabel;
    edtFavorecido: TEdit;
    Label2: TLabel;
    edtMotivo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDadosCortesia: TfDadosCortesia;

implementation

{$R *.dfm}

uses DataModuleCaixa, uClasses;

procedure TfDadosCortesia.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfDadosCortesia.btnVoltarClick(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TfDadosCortesia.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  DrawRounded(btnOK);
end;

end.
