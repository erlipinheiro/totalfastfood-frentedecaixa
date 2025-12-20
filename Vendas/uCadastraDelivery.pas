unit uCadastraDelivery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg, Vcl.ExtCtrls, ACBrBase,
  ACBrEnterTab, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, ACBrSocket, ACBrCEP;

type
  TfCadastraCliente = class(TfrmFormPadrao)
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    Label3: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    ACBrCEP1: TACBrCEP;
    Button1: TButton;
    edtTelefone1: TEdit;
    edtTelefone2: TEdit;
    edtTelefone3: TEdit;
    edtNome: TEdit;
    edtCEP: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtReferencia: TEdit;
    memoObservacoes: TMemo;
    Label13: TLabel;
    edtEmail: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastraCliente: TfCadastraCliente;

implementation

{$R *.dfm}

uses uMensagem;

procedure TfCadastraCliente.Button1Click(Sender: TObject);
begin
  inherited;

  if trim (edtCep.Text) <> '' then
  begin
    if ACBrCEP1.BuscarPorCEP(edtCep.Text) > 0 then
    begin
      edtendereco.Text:= ACBrCEP1.Enderecos[0].Tipo_Logradouro + ' ' + ACBrCEP1.Enderecos[0].Logradouro;
      edtbairro.Text := ACBrCEP1.Enderecos[0].Bairro;
      edtcidade.Text := ACBrCEP1.Enderecos[0].Municipio;
      edtuf.Text := ACBrCEP1.Enderecos[0].UF;

      if edtNumero.CanFocus then
        edtNumero.SetFocus;
    end;
  end
  else
    frmMensagem.MostraMensagem('Digite um CEP primeiro.');
end;

end.
