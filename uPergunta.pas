unit uPergunta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ACBrBase,
  ACBrValidador, Vcl.Mask, Vcl.Touch.Keyboard;

type
  TfrmPergunta = class(TForm)
    lblPergunta: TLabel;
    btnSIM: TPanel;
    btnNAO: TPanel;
    pnlMesaOrigem: TPanel;
    pnlMesaDestino: TPanel;
    lblMesaOrigem: TLabel;
    lblMesaDestino: TLabel;
    Teclado: TTouchKeyboard;
    ACBrValidador1: TACBrValidador;
    edtCPF: TMaskEdit;
    procedure InvertePosicaoBotoes;
    procedure FormCreate(Sender: TObject);
    procedure btnNAOClick(Sender: TObject);
    procedure btnSIMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDigitarCPF: boolean;
    procedure SetDigitarCPF(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property DigitarCPF : boolean read FDigitarCPF write SetDigitarCPF;
    function  NaoExisteRestricoes : boolean;
    procedure LimpaFormulario;
  end;

var
  frmPergunta: TfrmPergunta;

implementation

{$R *.dfm}

uses uClasses, uPrincipal, DataModuleCaixa, uMensagem;

{ TfrmPerguntaAdicionais }

procedure TfrmPergunta.btnNAOClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPergunta.btnSIMClick(Sender: TObject);
begin
  if NaoExisteRestricoes then
    ModalResult := mrOk;
end;

procedure TfrmPergunta.FormCreate(Sender: TObject);
begin
  DrawRounded(btnSIM);
  DrawRounded(btnNAO);
end;

procedure TfrmPergunta.FormShow(Sender: TObject);
begin
  if edtCPF.Visible then
    if edtCPF.CanFocus then
      edtCPF.SetFocus;
end;

procedure TfrmPergunta.InvertePosicaoBotoes;
var
  PosicaoAnterior : integer;
begin
  PosicaoAnterior := btnSIM.Left;
  btnSIM.Left := btnNAO.Left;
  btnNAO.Left := PosicaoAnterior;
end;

procedure TfrmPergunta.LimpaFormulario;
begin
  pnlMesaOrigem.Visible  := False;
  pnlMesaDestino.Visible := False;
  lblMesaOrigem.Visible  := False;
  lblMesaDestino.Visible := False;
  edtCPF.Visible         := False;
  Teclado.Visible        := False;
  lblPergunta.Height     := 577;
end;

function TfrmPergunta.NaoExisteRestricoes: boolean;
begin
  result := True;

  if (edtCPF.Visible)  then
  begin
    ACBrValidador1.Documento := edtCPF.Text;
    if not ACBrValidador1.Validar then
    begin
      frmMensagem.MostraMensagemErro(ACBrValidador1.MsgErro);

      result := False;
    end
  end;
end;

procedure TfrmPergunta.SetDigitarCPF(const Value: boolean);
begin
  FDigitarCPF := Value;
  edtCPF.Visible := Value;
end;

end.
