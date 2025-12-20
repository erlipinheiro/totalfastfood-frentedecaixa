unit uSelecionaTipoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmSelecionaTipoVenda = class(TfrmFormPadrao)
    btnBalcao: TPanel;
    btnMesa: TPanel;
    btnCartao: TPanel;
    btnDelivery: TPanel;
    procedure btnBalcaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TipoVenda : integer;
  end;

var
  frmSelecionaTipoVenda: TfrmSelecionaTipoVenda;

implementation

{$R *.dfm}

procedure TfrmSelecionaTipoVenda.btnBalcaoClick(Sender: TObject);
begin
  //  TTipoVenda = (tvNenhum, tvVendaBalcao, tvVendaMesa, tvVendaCartao, tvVendaDelivery);

  if TPanel(Sender) = btnBalcao then
    TipoVenda := 1
  else if TPanel(Sender) = btnMesa then
    TipoVenda := 2
  else if TPanel(Sender) = btnCartao then
    TipoVenda := 3
  else if TPanel(Sender) = btnDelivery then
    TipoVenda := 4;

  ModalResult := mrOk;
end;

end.
