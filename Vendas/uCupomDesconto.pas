unit uCupomDesconto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Touch.Keyboard,
  Vcl.StdCtrls;

type
  TfrmCupomDesconto = class(TForm)
    TouchKeyboard1: TTouchKeyboard;
    Label1: TLabel;
    btnApagarObservacao1: TPanel;
    Image1: TImage;
    pnlBotoes: TPanel;
    btnOK: TPanel;
    edtCodigo: TEdit;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCupomDesconto: TfrmCupomDesconto;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmCupomDesconto.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCupomDesconto.FormCreate(Sender: TObject);
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

procedure TfrmCupomDesconto.FormShow(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  btnOK.Left := Trunc(pnlBotoes.Width /2 - btnOK.Width / 2);
end;

procedure TfrmCupomDesconto.Image1Click(Sender: TObject);
begin
  edtCodigo.Text := '';
end;

end.
