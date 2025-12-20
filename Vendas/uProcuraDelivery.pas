unit uProcuraDelivery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfProcuraDelivery = class(TfrmFormPadrao)
    pnlNumero: TPanel;
    btn1: TButton;
    btn4: TButton;
    btn0: TButton;
    btn9: TButton;
    btn8: TButton;
    btn5: TButton;
    btn6: TButton;
    btn3: TButton;
    btn2: TButton;
    btn7: TButton;
    btnEnter: TButton;
    edtTelefone: TEdit;
    procedure btn0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
    procedure CadastraCliente;
  public
    { Public declarations }
  end;

var
  fProcuraDelivery: TfProcuraDelivery;

implementation

{$R *.dfm}

uses DataModuleCaixa, uMensagem, uSelecionaPessoa, uCadastraDelivery;

procedure TfProcuraDelivery.btn0Click(Sender: TObject);
begin
  inherited;

  edtTelefone.Text :=  edtTelefone.Text + TButton(Sender).Caption;

end;

procedure TfProcuraDelivery.btnEnterClick(Sender: TObject);
begin
  inherited;
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := 'select top 1 * from Vendas.ContaDelivery where idEmpresa = ' + dmCaixa.Estacao.idEmpresa.ToString +
      ' and (Telefone1 like ' + QuotedStr('%' + edtTelefone.Text + '%') +
      ' or Telefone2 like' + QuotedStr('%' + edtTelefone.Text + '%') +
      ' or Telefone3 like' + QuotedStr('%' + edtTelefone.Text + '%') +
      ') order by idConta desc';
    Open;

    if RecordCount <= 0 then
      CadastraCliente
    else
    begin
      fCadastraCliente.edtTelefone1.Text := FieldByName('Telefone1').AsString;
      fCadastraCliente.edtTelefone2.Text := FieldByName('Telefone2').AsString;
      fCadastraCliente.edtTelefone3.Text := FieldByName('Telefone3').AsString;
      fCadastraCliente.edtNome.Text := FieldByName('nome').AsString;
      fCadastraCliente.edtEndereco.Text := FieldByName('Endereco').AsString;
      fCadastraCliente.edtCEP.Text := FieldByName('CEP').AsString;
      fCadastraCliente.edtBairro.Text := FieldByName('Bairro').AsString;
      fCadastraCliente.edtCidade.Text := FieldByName('Cidade').AsString;
      fCadastraCliente.edtUF.Text := FieldByName('UF').AsString;
      fCadastraCliente.edtNumero.Text := FieldByName('Numero').AsString;
      fCadastraCliente.edtComplemento.Text := FieldByName('Complemento').AsString;
      fCadastraCliente.edtReferencia.Text := FieldByName('Referencia').AsString;
      fCadastraCliente.edtEmail.Text := FieldByName('Email').AsString;
      fCadastraCliente.memoObservacoes.Lines.Text := FieldByName('Observacoes').AsString;
      if fCadastraCliente.ShowModal = mrOk then
        ModalResult := mrOk;
    end;
  end;

end;

procedure TfProcuraDelivery.CadastraCliente;
begin
  fCadastraCliente.edtTelefone1.Text := edtTelefone.Text;

  if fCadastraCliente.ShowModal = IDOK then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TfProcuraDelivery.FormCreate(Sender: TObject);
begin
  inherited;

  edtTelefone.Text := '';
  fCadastraCliente := TfCadastraCliente.Create(Self);
end;

end.
