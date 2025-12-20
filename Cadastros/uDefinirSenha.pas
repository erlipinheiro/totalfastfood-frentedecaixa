unit uDefinirSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.StdCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmDefinirSenha = class(TfrmFormPadrao)
    lblNome: TLabel;
    lbl1: TLabel;
    edtSenha: TEdit;
    edtConfirmacaoSenha: TEdit;
    procedure btnOKPadraoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefinirSenha: TfrmDefinirSenha;

implementation

{$R *.dfm}

procedure TfrmDefinirSenha.btnOKPadraoClick(Sender: TObject);
begin
  if (trim(edtSenha.Text) <> '') and (edtSenha.Text = edtConfirmacaoSenha.Text) then
    inherited;
end;

end.
