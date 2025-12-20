unit uSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg;

type
  TfrmSenha = class(TForm)
    pnlTeclado: TPanel;
    btn1: TPanel;
    btn2: TPanel;
    btn3: TPanel;
    btn4: TPanel;
    btn5: TPanel;
    btnOK: TPanel;
    btnCancelar: TPanel;
    edtSenha: TEdit;
    lblUsuario: TLabel;
    Label1: TLabel;
    pnlGeral: TPanel;
    img1: TImage;
    btnLimpar: TPanel;
    btnSelecionaUsuario: TPanel;
    Panel1: TPanel;
    lblNomeUsuario: TLabel;
    Panel2: TPanel;
    lblEmpresa: TLabel;
    Panel3: TPanel;
    lblEstacao: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSelecionaUsuarioClick(Sender: TObject);
  private
    { Private declarations }
    vetorSenha : array of string[2];
  public
    { Public declarations }
    idUsuario : integer;
    NomeUsuario : String;
    SenhaUsuario : string;
  end;

var
  frmSenha: TfrmSenha;

implementation

{$R *.dfm}

uses DataModuleCaixa, uClasses, uPrincipal, uMensagem, uSelecionaPessoa;

procedure TfrmSenha.btn1Click(Sender: TObject);
  function retornaNumeros : string;
  var
    i, r : integer;
    s : string;
  begin
    result := '';
    for I := Low(TPanel(Sender).Caption) to High(TPanel(Sender).Caption) do
    begin
      if TPanel(Sender).Caption[i] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'] then
        result := result + TPanel(Sender).Caption[i];
    end;
  end;
begin
  edtSenha.Text := edtSenha.Text + '*';
  SetLength(vetorSenha, Length(vetorSenha) + 1);
  vetorSenha[Length(vetorSenha) -1] := retornaNumeros;
end;

procedure TfrmSenha.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSenha.btnLimparClick(Sender: TObject);
begin
  edtSenha.Text := '';
  SetLength(vetorSenha, 0);
end;

procedure TfrmSenha.btnOKClick(Sender: TObject);
  function SenhaOK : boolean;
  var
    i : integer;
  begin
    result := True;

    if length(SenhaUsuario) <> Length(vetorSenha) then
      result := False
    else
    begin
      for I := 0 to length(SenhaUsuario) - 1 do
      begin
        if Pos(SenhaUsuario[i+1], vetorSenha[i]) <= 0 then
        begin
          result := False;
          Break;
        end;
      end;
    end;
  end;
begin
  if idUsuario <= 0 then
  begin
    if MessageDlg('Você tem que selecionar um usuário primeiro. Deseja tentar novamente?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
    begin
      btnSelecionaUsuarioClick(Self);
    end
    else
      ModalResult := mrCancel;
  end
  else
  begin
    if SenhaOK then
      ModalResult := mrOk
    else
    begin
      if MessageDlg('Senha inválida. Deseja tentar novamente?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
      begin
        SetLength(vetorSenha, 0);
        edtSenha.Text := '';
        edtSenha.SetFocus;
      end
      else
        ModalResult := mrCancel;
    end;
  end;
end;

procedure TfrmSenha.btnSelecionaUsuarioClick(Sender: TObject);
begin
  fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
  fSelecionaPessoa.idTipoPessoa := 5;
  if fSelecionaPessoa.ShowModal = mrOk then
  begin
    idUsuario := fSelecionaPessoa.qryPessoasidPessoa.AsInteger;
    NomeUsuario := fSelecionaPessoa.qryPessoasNomeFantasia.AsString;
    SenhaUsuario := fSelecionaPessoa.qryPessoassenha.AsString;
    lblNomeUsuario.Caption := fSelecionaPessoa.qryPessoasNomeFantasia.AsString;
  end
  else
  begin
    idUsuario := -1;
    NomeUsuario := '';
    SenhaUsuario := '';
    lblNomeUsuario.Caption := '';
  end;
end;

procedure TfrmSenha.FormCreate(Sender: TObject);
Var
  vetorNumeros: array [0..9] of Integer;
  idVetor : integer;

  function retornaNumeros : string;
  var
    Numero1,
    Numero2 : integer;
    function EstaNoVetor(Const AValor : integer) : boolean;
    var
      i : integer;
    begin
//      showMessage('Numero ' + avalor.ToString);
      result := False;
      for I := 0 to idVetor do
      begin
//        Showmessage('Vetor - ' + vetorNumeros[i].ToString);
        if AValor = vetorNumeros[i]  then
        begin
//          showmessage('Achou.');
          result := True;
          Break;
        end;
      end;
    end;
  begin
    Randomize;

    repeat
      Numero1 := Random(10);
//      ShowMessage('Numero 1 - ' + numero1.ToString);
    until Not EstaNoVetor(Numero1);

    vetorNumeros[idVetor] := Numero1;
    Inc(idVetor);

    Randomize;
    repeat
      Numero2 := Random(10);
//      ShowMessage('Numero 2 - ' + numero2.ToString);
    until Not EstaNoVetor(Numero2);

    vetorNumeros[idVetor] := Numero2;

    Inc(idVetor);

    result := IntToStr(Numero1) + ' - ' + IntToStr(Numero2);
  end;

begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  DrawRounded(pnlGeral);
  DrawRounded(pnlTeclado);
  DrawRounded(btn1);
  DrawRounded(btn2);
  DrawRounded(btn3);
  DrawRounded(btn4);
  DrawRounded(btn5);
  DrawRounded(btnLimpar);
  DrawRounded(btnOK);
  DrawRounded(btnCancelar);

  for idVetor := 0 to 9 do
    vetorNumeros[idVetor] := -1;

  idVetor := 0;

  btn1.Caption := retornaNumeros;
  btn2.Caption := retornaNumeros;
  btn3.Caption := retornaNumeros;
  btn4.Caption := retornaNumeros;
  btn5.Caption := retornaNumeros;
  idUsuario := -1;
  NomeUsuario := '';
  SenhaUsuario := '';
end;

procedure TfrmSenha.FormShow(Sender: TObject);
begin
  pnlGeral.Left := Trunc((Self.Width / 2) - (pnlGeral.Width / 2));
  img1.Left := Trunc((Self.Width / 2) - (img1.Width / 2));
  if idUsuario > 0 then
    btnSelecionaUsuario.Visible := False;

  if NomeUsuario <> '' then
    lblNomeUsuario.Caption := NomeUsuario;
end;

end.
