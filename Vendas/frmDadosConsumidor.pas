unit frmDadosConsumidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    edtDocumento: TMaskEdit;
    edtIE: TMaskEdit;
    Label4: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    btnFinalizar: TPanel;
    btnCancelar: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
end;

end.
