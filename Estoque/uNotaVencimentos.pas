unit uNotaVencimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
   cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ucxDBLookupComboBoxButtonEdit, cxMaskEdit,
  cxCalendar, cxDBEdit, cxCurrencyEdit, cxTextEdit, Vcl.StdCtrls, Data.DB,
   JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmNotaVencimentos = class(TfrmFormPadrao)
    qryCadastro: TFDQuery;
    qryCadastroidEmpresa: TIntegerField;
    qryCadastroidPessoa: TIntegerField;
    qryCadastroidNota: TIntegerField;
    qryCadastroidVencimento: TIntegerField;
    qryCadastroidTipoVencimento: TIntegerField;
    qryCadastroCodigo: TStringField;
    qryCadastroValorAPagar: TCurrencyField;
    qryCadastroDataVencimento: TDateTimeField;
    qryCadastroDataEnvioCentral: TDateTimeField;
    qryCadastroflEnviadoCentral: TBooleanField;
    dsCadastro: TDataSource;
    Label4: TLabel;
    cbTipoVencimento: TMycxDBLookupComboBox;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    Label3: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    procedure qryCadastroNewRecord(DataSet: TDataSet);
  private
    FidPessoa: integer;
    FidNota: integer;
    procedure SetidNota(const Value: integer);
    procedure SetidPessoa(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idNota : integer read FidNota write SetidNota;
    property idPessoa : integer read FidPessoa write SetidPessoa;
  end;

var
  frmNotaVencimentos: TfrmNotaVencimentos;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfrmNotaVencimentos.qryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;

  qryCadastroidEmpresa.AsInteger := dmCaixa.Estacao.idEmpresa;
  qryCadastroidPessoa.AsInteger  := FidPessoa;
  qryCadastroidNota.AsInteger    := FidNota;
end;

procedure TfrmNotaVencimentos.SetidNota(const Value: integer);
begin
  FidNota := Value;
end;

procedure TfrmNotaVencimentos.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
end;

end.
