unit uNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxClasses, cxNavigator, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmNotas = class(TfrmFormPadrao)
    SaveDialog1: TSaveDialog;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    btnNovaNota: TJvPanel;
    btnAlterar: TJvPanel;
    btnExcluir: TJvPanel;
    btnExportar: TJvPanel;
    btnNovaNFE: TJvPanel;
    qryGridPadrao: TFDQuery;
    qryGridPadraoidEmpresa: TIntegerField;
    qryGridPadraoidPessoa: TIntegerField;
    qryGridPadraoidNota: TIntegerField;
    qryGridPadraoRazaoSocial: TStringField;
    qryGridPadraoNomeFantasia: TStringField;
    qryGridPadraoNumeroNota: TStringField;
    qryGridPadraoDescricao: TStringField;
    qryGridPadraoidTipoNota: TIntegerField;
    qryGridPadraoDataEmissao: TDateTimeField;
    qryGridPadraoValorTotal: TCurrencyField;
    qryGridPadraoEntradaSaida: TStringField;
    qryGridPadraoDataEnvioCentral: TDateTimeField;
    qryGridPadraoflEnviadoCentral: TBooleanField;
    dsGridPadrao: TDataSource;
    dbgridPrincipal: TcxGrid;
    dbgridPrincipalDBTableView1: TcxGridDBTableView;
    dbgridPrincipalDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridPrincipalDBTableView1idPessoa: TcxGridDBColumn;
    dbgridPrincipalDBTableView1idNota: TcxGridDBColumn;
    dbgridPrincipalDBTableView1RazaoSocial: TcxGridDBColumn;
    dbgridPrincipalDBTableView1NomeFantasia: TcxGridDBColumn;
    dbgridPrincipalDBTableView1NumeroNota: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Descricao: TcxGridDBColumn;
    dbgridPrincipalDBTableView1idTipoNota: TcxGridDBColumn;
    dbgridPrincipalDBTableView1DataEmissao: TcxGridDBColumn;
    dbgridPrincipalDBTableView1ValorTotal: TcxGridDBColumn;
    dbgridPrincipalDBTableView1EntradaSaida: TcxGridDBColumn;
    dbgridPrincipalDBTableView1DataEnvioCentral: TcxGridDBColumn;
    dbgridPrincipalDBTableView1flEnviadoCentral: TcxGridDBColumn;
    dbgridPrincipalLevel1: TcxGridLevel;
    procedure btnNovaNFEClick(Sender: TObject);
    procedure btnNovaNotaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotas: TfrmNotas;

implementation

{$R *.dfm}

uses
  uNotaImportaNFE, uNotaDados, DataModuleCaixa, uMensagem, udmNotas;

procedure TfrmNotas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  frmNotaDados := TfrmNotaDados.Create(Self);
  frmNotaDados.qryCadastro.sql.Text := Format('select * from Contabil.Notas where idEmpresa = %d and idPessoa = %d and idNota = %d',
    [dmCaixa.Estacao.idEmpresa, qryGridPadraoidPessoa.AsInteger, qryGridPadraoidNota.AsInteger]);
  frmNotaDados.qryCadastro.Open;
  if frmNotaDados.qryCadastro.RecordCount <= 0 then
    frmMensagem.MostraMensagem('Nota não encontrada.')
  else
  begin
    frmNotaDados.qryCadastro.Edit;
    if frmNotaDados.ShowModal = mrOk then
    begin
      frmNotaDados.qryCadastro.Post;
      qryGridPadrao.Refresh;
      qryGridPadrao.Locate('idNota', frmNotaDados.qryCadastroidNota.AsInteger, []);
    end;
  end;

  frmNotaDados.Close;
end;

procedure TfrmNotas.btnExcluirClick(Sender: TObject);
begin
  try
    dmCaixa.dbTotalFastFood.StartTransaction;
    with dmCaixa.qryAuxiliar do
    begin
      //*** Primeiro retiro a entrada no estoque
      SQL.Text := Format('delete from Estoque.Movimentacao where idEmpresa = %d and idPessoa = %d and ' +
        'idRelacionado in (select idItem from Contabil.NotaItens where idEmpresa = %d and idNota = %d) and idTipoMovimentacao = 5',
        [dmCaixa.Estacao.idEmpresa, qryGridPadraoidPessoa.AsInteger, dmCaixa.Estacao.idEmpresa, qryGridPadraoidNota.AsInteger]);
      Execute;

      //*** Agora retiro os pagamentos
      SQL.Text := Format('delete from Contabil.NotaVencimentos where idEmpresa = %d and idPessoa = %d and idNota = %d',
        [dmCaixa.Estacao.idEmpresa, qryGridPadraoidPessoa.AsInteger, qryGridPadraoidNota.AsInteger]);
      Execute;

      //*** Agora retiro os itens
      SQL.Text := Format('delete from Contabil.NotaItens where idEmpresa = %d and idPessoa = %d and idNota = %d',
        [dmCaixa.Estacao.idEmpresa, qryGridPadraoidPessoa.AsInteger, qryGridPadraoidNota.AsInteger]);
      Execute;

      //*** Por fim, apago a nota
      qryGridPadrao.Delete;
    end;
    dmCaixa.dbTotalFastFood.Commit;
  except
    on e : exception do
    begin
      dmCaixa.dbTotalFastFood.Rollback;
    end;
  end;
end;

procedure TfrmNotas.btnNovaNFEClick(Sender: TObject);
var
  Resultado : integer;
begin
  frmNotaImportaNFE := TfrmNotaImportaNFE.Create(Self);
  Resultado := frmNotaImportaNFE.ShowModal;
  if frmNotaImportaNFE.idNota > 0 then
  begin
    qryGridPadrao.Close;
    qryGridPadrao.Open;
    qryGridPadrao.Locate('idNota', frmNotaImportaNFE.idNota, []);
  end;
  frmNotaImportaNFE.Free;

  if Resultado = mrIgnore then
  begin
    frmNotaDados := TfrmNotaDados.Create(Self);
    frmNotaDados.qryCadastro.sql.Text := Format('select * from Contabil.Notas where idEmpresa = %d and idPessoa = %d and idNota = %d',
      [dmCaixa.Estacao.idEmpresa, qryGridPadraoidPessoa.AsInteger, qryGridPadraoidNota.AsInteger]);
    frmNotaDados.qryCadastro.Open;
    if frmNotaDados.qryCadastro.RecordCount <= 0 then
      ShowMessage('Nota não encontrada.')
    else
    begin
      frmNotaDados.AbreTabelas;
      frmNotaDados.qryCadastro.Edit;

      if frmNotaDados.ShowModal = mrOk then
      begin
        if frmNotaDados.qryCadastro.State in [dsInsert, dsEdit] then
          frmNotaDados.qryCadastro.Post;
        qryGridPadrao.Refresh;
        qryGridPadrao.Locate('idNota', frmNotaDados.qryCadastroidNota.AsInteger, []);
      end;
    end;
    frmNotaDados.qryCadastro.Close;
    frmNotaDados.Free;
  end;

end;

procedure TfrmNotas.btnNovaNotaClick(Sender: TObject);
begin
  frmNotaDados := TfrmNotaDados.Create(Self);
  frmNotaDados.qryCadastro.Insert;
  if frmNotaDados.ShowModal = mrOk then
  begin
    frmNotaDados.qryCadastro.Post;
    qryGridPadrao.Refresh;
    qryGridPadrao.Locate('idNota', frmNotaDados.qryCadastroidNota.AsInteger, []);
  end;

  frmNotaDados.Close;
end;

procedure TfrmNotas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  if CanClose then
    dmNotas.Free;
end;

procedure TfrmNotas.FormCreate(Sender: TObject);
begin
  inherited;

  dmNotas := TdmNotas.Create(Self);
end;

procedure TfrmNotas.FormShow(Sender: TObject);
begin
  inherited;

  qryGridPadrao.Open
end;

end.
