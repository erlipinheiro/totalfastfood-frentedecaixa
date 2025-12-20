unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMensagem = class(TForm)
    btnOK: TPanel;
    Timer1: TTimer;
    Panel1: TPanel;
    Memo1: TMemo;
    procedure btnOKClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NumeroMonitor : integer;
    procedure MostraMensagem (const AMensagem : string);
    procedure MostraMensagemErro (const AMensagem : string);
    procedure MostraMensagemErroSemTimer (const AMensagem : string);
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}

procedure TfrmMensagem.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMensagem.FormCreate(Sender: TObject);
begin
  NumeroMonitor := 0;
end;

procedure TfrmMensagem.FormShow(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
end;

procedure TfrmMensagem.MostraMensagem(const AMensagem: string);
begin
  BoundsRect := Screen.Monitors[NumeroMonitor].BoundsRect;
  Memo1.Color := $000D8AD1;
  Memo1.Lines.Clear;
  Memo1.Lines.add(AMensagem);
  Memo1.Font.Color := clBlack;
  ShowModal;
end;

procedure TfrmMensagem.MostraMensagemErro(const AMensagem: string);
var
  l : integer;
begin
  BoundsRect := Screen.Monitors[NumeroMonitor].BoundsRect;
  btnOK.Enabled := False;
  btnOK.Visible := False;
  Timer1.Enabled:= True;

  l := Random(self.Width - 50);

  if l < 10 then
    l := 10;

  btnOK.Left := l;

  Memo1.Color := clRed;
  Memo1.Lines.Clear;
  Memo1.Font.Color := clWhite;
  Memo1.Lines.add(AMensagem);
  ShowModal;
end;

procedure TfrmMensagem.MostraMensagemErroSemTimer(const AMensagem: string);
var
  l : integer;
begin
  BoundsRect := Screen.Monitors[NumeroMonitor].BoundsRect;
  btnOK.Enabled := True;
  btnOK.Visible := True;

  l := Random(self.Width - 50);

  if l < 10 then
    l := 10;

  btnOK.Left := l;

  Memo1.Color := clRed;
  Memo1.Lines.Clear;
  Memo1.Font.Color := clWhite;
  Memo1.Lines.add(AMensagem);
  ShowModal;
end;

procedure TfrmMensagem.Timer1Timer(Sender: TObject);
begin
  btnOK.Enabled := true;
  btnOK.Visible := true;
  Timer1.Enabled:= False;
end;

end.
