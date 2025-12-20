unit uTransfereCartoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  TfrmTransfereCartoes = class(TForm)
    Panel1: TPanel;
    pnlCartoes: TPanel;
    ListBox1: TListBox;
    edtMesa: TEdit;
    btnIncluir: TButton;
    pnlBotoes: TPanel;
    btnVoltar: TImage;
    btnTransferirMesa: TPanel;
    btnRetirar: TButton;
    procedure ListBox1Click(Sender: TObject);
    procedure edtMesaChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnRetirarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnTransferirMesaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransfereCartoes: TfrmTransfereCartoes;

implementation

{$R *.dfm}

uses uMesas, uMensagem, DataModuleCaixa;

procedure TfrmTransfereCartoes.btnIncluirClick(Sender: TObject);
var
  i : integer;
  Achou : boolean;
begin
  if frmMesas.RetornaIDConta(StrToInt(edtMesa.Text)) > 0 then
  begin
    Achou := False;
    for I := 0 to ListBox1.Count -1 do
      if edtMesa.Text = ListBox1.Items[i] then
        Achou := True;

    if Achou then
      frmMensagem.MostraMensagemErro('Mesa ou cartão já está na lista de transferência.')
    else
      ListBox1.Items.Add(edtMesa.Text);
  end
  else
    frmMensagem.MostraMensagemErro('Mesa ou cartão não existe.');

  edtMesa.Text := '';

  if edtMesa.CanFocus then
    edtMesa.SetFocus;

  btnTransferirMesa.Visible := ListBox1.Count > 1;
end;

procedure TfrmTransfereCartoes.btnRetirarClick(Sender: TObject);
Var
  i : integer;
begin
  for I := 0 to ListBox1.Count -1 do
    if edtMesa.Text = ListBox1.Items[i] then
      ListBox1.Items.Delete(i);

  edtMesa.Text := '';

  if edtMesa.CanFocus then
    edtMesa.SetFocus;

  btnTransferirMesa.Visible := ListBox1.Count > 1;
end;

procedure TfrmTransfereCartoes.btnTransferirMesaClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmTransfereCartoes.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTransfereCartoes.edtMesaChange(Sender: TObject);
Var
  i : Integer;
  Achou : boolean;
begin
  Achou := False;

  for I := 0 to ListBox1.Count -1 do
  begin
    if edtMesa.Text = ListBox1.Items[i] then
    begin
       Achou := True;
       Break;
    end;
  end;

  btnRetirar.Visible := (Achou) and (trim(edtMesa.text) <> '');
  btnIncluir.Visible := (Not Achou) and (trim(edtMesa.text) <> '');
end;

procedure TfrmTransfereCartoes.FormCreate(Sender: TObject);
begin
    BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
end;

procedure TfrmTransfereCartoes.FormShow(Sender: TObject);
begin
  pnlCartoes.Left := Trunc((Self.Width - pnlCartoes.Width) / 2);
  btnTransferirMesa.Left := Trunc((pnlBotoes.Width - btnTransferirMesa.Width) / 2);
  edtMesa.SelStart := 2;
end;

procedure TfrmTransfereCartoes.ListBox1Click(Sender: TObject);
begin
  if ListBox1.SelCount > 0 then
    edtMesa.Text := ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TfrmTransfereCartoes.ListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  if odSelected in State then
  begin
    ListBox1.Canvas.Brush.Color := clHighlight;
    ListBox1.Canvas.Font.Color := clHighlightText;
  end else
  begin
    ListBox1.Canvas.Font.Color := clBlack;
    if Odd(Index) then
      ListBox1.Canvas.Brush.Color := clMoneyGreen
    else
      ListBox1.Canvas.Brush.Color := clWindow;
  end;

  ListBox1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
  ListBox1.Items[Index]);
end;

end.
