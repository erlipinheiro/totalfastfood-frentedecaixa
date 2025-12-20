unit uObservacoesManuais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Touch.Keyboard;

type
  TfrmObservacoesManuais = class(TForm)
    pnlBotoes: TPanel;
    btnOK: TPanel;
    Label1: TLabel;
    TouchKeyboard1: TTouchKeyboard;
    btnApagarObservacao1: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    btnCancelar: TPanel;
    edtObservacao1: TEdit;
    edtObservacao2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EstadoAnterior : integer;
  end;

var
  frmObservacoesManuais: TfrmObservacoesManuais;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmObservacoesManuais.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmObservacoesManuais.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmObservacoesManuais.FormCreate(Sender: TObject);
var
  MyKeys: array of tagInput;
begin
  setLength(MyKeys, 2);
  MyKeys[0].Itype:=INPUT_KEYBOARD;
  MyKeys[0].ki.wVk:=VK_CAPITAL;
  MyKeys[0].ki.wScan:=0;
  MyKeys[0].ki.dwFlags:=4;
  MyKeys[0].ki.time:=0;
  MyKeys[0].ki.dwExtraInfo:=0;

  MyKeys[1].Itype:=INPUT_KEYBOARD;
  MyKeys[1].ki.wVk:=VK_CAPITAL;
  MyKeys[1].ki.wScan:=0;
  MyKeys[1].ki.dwFlags:=4+2;
  MyKeys[1].ki.time:=0;
  MyKeys[1].ki.dwExtraInfo:=0;
  SendInput(2, MyKeys[0], sizeof(tagInput));
end;

procedure TfrmObservacoesManuais.FormShow(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  btnOK.Left := Trunc(pnlBotoes.Width /2 - btnOK.Width / 2);
end;

procedure TfrmObservacoesManuais.Image1Click(Sender: TObject);
begin
  edtObservacao1.Text := '';
end;

procedure TfrmObservacoesManuais.Image2Click(Sender: TObject);
begin
  edtObservacao2.Text := '';
end;

end.
