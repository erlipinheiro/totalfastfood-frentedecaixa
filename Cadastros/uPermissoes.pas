unit uPermissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmPermissoes = class(TfrmFormPadrao)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qryPermissoes: TFDQuery;
    dsPermissoes: TDataSource;
    cxGrid1DBTableView1Permitir: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxGrid1DBTableView1DescricaoModulo: TcxGridDBColumn;
    btnMarcarTudo: TJvPanel;
    btnDesmarcarTudo: TJvPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    procedure btnMarcarTudoClick(Sender: TObject);
    procedure btnDesmarcarTudoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FidPessoa: integer;
    { Private declarations }
    procedure VerificaPermissoes;
    procedure SetidPessoa(const Value: integer);
  public
    { Public declarations }
    property idPessoa : integer read FidPessoa write SetidPessoa;
  end;

var
  frmPermissoes: TfrmPermissoes;

implementation

{$R *.dfm}

uses DataModuleCaixa, uFuncoes;

procedure TfrmPermissoes.btnDesmarcarTudoClick(Sender: TObject);
begin
  inherited;
  with qryPermissoes do
  begin
    First;
    while not EOF do
    begin
      Edit;
      FieldByName('Permitir').AsBoolean := False;
      Post;
      Next;
    end;
  end;
end;

procedure TfrmPermissoes.btnMarcarTudoClick(Sender: TObject);
begin
  inherited;
  with qryPermissoes do
  begin
    First;
    while not EOF do
    begin
      Edit;
      FieldByName('Permitir').AsBoolean := True;
      Post;
      Next;
    end;
  end;
end;

procedure TfrmPermissoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  if CanClose then
    qryPermissoes.Close;
end;

procedure TfrmPermissoes.FormShow(Sender: TObject);
begin
  inherited;
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;

  VerificaPermissoes;

  with qryPermissoes do
  begin
    ParamByName('idEmpresa').AsInteger := dmCaixa.Estacao.idEmpresa;
    ParamByName('idPessoa').AsInteger := FidPessoa;
    Open;
  end;
end;

procedure TfrmPermissoes.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
end;

procedure TfrmPermissoes.VerificaPermissoes;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select * from Seguranca.Controles c where not exists ' +
      '(select 1 from Seguranca.Permissoes p where p.idEmpresa = %d and p.idPessoa = %d and  p.idControle = c.idControle)',
      [dmCaixa.Estacao.idEmpresa, FidPessoa]);
    Open;

    while not EOF do
    begin
      Inserir(Self, dmCaixa.dbTotalFastFood, 'Seguranca.Permissoes',
        ['idEmpresa', 'idPessoa', 'idControle', 'Permitir'],
        [dmCaixa.Estacao.idEmpresa, FidPessoa, FieldByName('idControle').AsInteger, 0]);

      Next;
    end;

    Close;
  end;
end;

end.
