unit uDadosConsumidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmDadosConsumidor = class(TForm)
    RadioGroup1: TRadioGroup;
    edtDocumento: TMaskEdit;
    edtIE: TMaskEdit;
    lblIE: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    btnFinalizar: TPanel;
    btnCancelar: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
    function NaoExisteRestricoes : boolean;
  public
    { Public declarations }
  end;

var
  frmDadosConsumidor: TfrmDadosConsumidor;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPrincipal, ACBrValidador;

procedure TfrmDadosConsumidor.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDadosConsumidor.btnFinalizarClick(Sender: TObject);
begin
  if NaoExisteRestricoes then
    ModalResult := mrOK;
end;

procedure TfrmDadosConsumidor.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
end;

function TfrmDadosConsumidor.NaoExisteRestricoes: boolean;
begin
  result := True;

  case RadioGroup1.ItemIndex of
    0 : frmPrincipal.ACBrValidador1.TipoDocto := docCPF;
    1 : frmPrincipal.ACBrValidador1.TipoDocto := docCNPJ;
  end;

  frmPrincipal.ACBrValidador1.Documento := edtDocumento.Text;

  Result := frmPrincipal.ACBrValidador1.Validar;
end;

procedure TfrmDadosConsumidor.RadioGroup1Click(Sender: TObject);
begin
  lblIE.Visible := RadioGroup1.ItemIndex =1;
  edtIE.Visible := RadioGroup1.ItemIndex =1;
end;

end.
