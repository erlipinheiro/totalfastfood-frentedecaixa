unit uFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmFormPadrao = class(TForm)
    pnlBotoesPadrao: TPanel;
    btnVoltarPadrao: TImage;
    btnOKPadrao: TPanel;
    pnlFundoPadrao: TPanel;
    pnlTituloPadrao: TPanel;
    Image1Padrao: TImage;
    procedure btnOKPadraoClick(Sender: TObject);
    procedure btnVoltarPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormPadrao: TfrmFormPadrao;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmFormPadrao.btnOKPadraoClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmFormPadrao.btnVoltarPadraoClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmFormPadrao.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
end;

end.
