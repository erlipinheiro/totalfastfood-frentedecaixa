unit uNotaDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,

  cxCustomData, cxFilter, cxData, cxDataStorage, Data.DB, cxDBData, cxDBEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ucxDBLookupComboBoxButtonEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ComCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, System.Math, cxNavigator, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxStyles, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCurrencyEdit,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmNotaDados = class(TfrmFormPadrao)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    dsCadastro: TDataSource;
    qryCadastro: TFDQuery;
    qryCadastroidEmpresa: TIntegerField;
    qryCadastroidPessoa: TIntegerField;
    qryCadastroidNota: TIntegerField;
    qryCadastroNumeroNota: TStringField;
    qryCadastroidTipoNota: TIntegerField;
    qryCadastroDataEmissao: TDateTimeField;
    qryCadastroValorTotal: TCurrencyField;
    qryCadastroEntradaSaida: TStringField;
    qryCadastroDataEnvioCentral: TDateTimeField;
    qryCadastroflEnviadoCentral: TBooleanField;
    qryCadastroChaveNFE: TStringField;
    qryCadastroDataEntradaEstoque: TDateTimeField;
    Label6: TLabel;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    pcNotas: TPageControl;
    tsDadosNota: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cbEntradaSaida: TDBComboBox;
    cxDBDateEdit2: TcxDBDateEdit;
    tsProdutos: TTabSheet;
    btnIncluirNotaItem: TSpeedButton;
    btnAlterarNotaItem: TSpeedButton;
    btnExcluirNotaItem: TSpeedButton;
    dbgridItens: TcxGrid;
    dbgridItensDBTableView1: TcxGridDBTableView;
    dbgridItensLevel1: TcxGridLevel;
    tsVencimentos: TTabSheet;
    btnIncluirVencimentos: TSpeedButton;
    btnAlterarVencimentos: TSpeedButton;
    btnExcluirVencimentos: TSpeedButton;
    dbgridVencimentos: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dbgridItensDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridItensDBTableView1idPessoa: TcxGridDBColumn;
    dbgridItensDBTableView1idNota: TcxGridDBColumn;
    dbgridItensDBTableView1idItem: TcxGridDBColumn;
    dbgridItensDBTableView1idItemNFE: TcxGridDBColumn;
    dbgridItensDBTableView1cProd: TcxGridDBColumn;
    dbgridItensDBTableView1cEAN: TcxGridDBColumn;
    dbgridItensDBTableView1xProd: TcxGridDBColumn;
    dbgridItensDBTableView1NCM: TcxGridDBColumn;
    dbgridItensDBTableView1CFOP: TcxGridDBColumn;
    dbgridItensDBTableView1uCom: TcxGridDBColumn;
    dbgridItensDBTableView1qCom: TcxGridDBColumn;
    dbgridItensDBTableView1vunCom: TcxGridDBColumn;
    dbgridItensDBTableView1vProd: TcxGridDBColumn;
    dbgridItensDBTableView1cEANTrib: TcxGridDBColumn;
    dbgridItensDBTableView1uTrib: TcxGridDBColumn;
    dbgridItensDBTableView1qTrib: TcxGridDBColumn;
    dbgridItensDBTableView1vunTrib: TcxGridDBColumn;
    dbgridItensDBTableView1vFrete: TcxGridDBColumn;
    dbgridItensDBTableView1vSeg: TcxGridDBColumn;
    dbgridItensDBTableView1vDesc: TcxGridDBColumn;
    dbgridItensDBTableView1vOutro: TcxGridDBColumn;
    dbgridItensDBTableView1IndTot: TcxGridDBColumn;
    dbgridItensDBTableView1xPed: TcxGridDBColumn;
    dbgridItensDBTableView1nItemPed: TcxGridDBColumn;
    dbgridItensDBTableView1DataEnvioCentral: TcxGridDBColumn;
    dbgridItensDBTableView1flEnviadoCentral: TcxGridDBColumn;
    cxGridDBTableView1idEmpresa: TcxGridDBColumn;
    cxGridDBTableView1idPessoa: TcxGridDBColumn;
    cxGridDBTableView1idNota: TcxGridDBColumn;
    cxGridDBTableView1idVencimento: TcxGridDBColumn;
    cxGridDBTableView1idTipoVencimento: TcxGridDBColumn;
    cxGridDBTableView1Codigo: TcxGridDBColumn;
    cxGridDBTableView1ValorAPagar: TcxGridDBColumn;
    cxGridDBTableView1DataVencimento: TcxGridDBColumn;
    cxGridDBTableView1DataEnvioCentral: TcxGridDBColumn;
    cxGridDBTableView1flEnviadoCentral: TcxGridDBColumn;
    cxGridDBTableView1DescricaoFormaPagamento: TcxGridDBColumn;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cbPessoas: TMycxDBLookupComboBox;
    cbTipoNota: TMycxDBLookupComboBox;
    procedure qryCadastroNewRecord(DataSet: TDataSet);
    procedure btnIncluirNotaItemClick(Sender: TObject);
    procedure btnAlterarNotaItemClick(Sender: TObject);
    procedure btnExcluirNotaItemClick(Sender: TObject);
    procedure btnExcluirVencimentosClick(Sender: TObject);
    procedure btnIncluirVencimentosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function NaoExisteRestricao(var AValue : double) : boolean;
  public
    { Public declarations }
    procedure AbreTabelas;
    procedure AtualizaTotalNota;
  end;

var
  frmNotaDados: TfrmNotaDados;

implementation

{$R *.dfm}

uses udmNotas, DataModuleCaixa, uNotaitens, uMensagem, uNotaVencimentos,
  uMensagensErro, uFuncoes;


{ TfrmNotaDados }

procedure TfrmNotaDados.AbreTabelas;
begin
  with dmNotas.qryPessoas do
  begin
    Close;
    ParamByName('idEmpresa').Value :=  dmCaixa.Estacao.idEmpresa;
    Open;
  end;

  with dmNotas.qryItens do
  begin
    Close;
    ParamByName('idEmpresa').Value :=  dmCaixa.Estacao.idEmpresa;
    ParamByName('idNota').Value    :=  qryCadastroidNota.AsInteger;
    Open;
  end;

  with dmNotas.qryVencimentos do
  begin
    Close;
    ParamByName('idEmpresa').Value :=  dmCaixa.Estacao.idEmpresa;
    ParamByName('idNota').Value    :=  qryCadastroidNota.AsInteger;
    Open;
  end;
end;

procedure TfrmNotaDados.AtualizaTotalNota;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('select sum(qCom * vunCom) from contabil.notaitens where idEmpresa = %d and idnota = %d',
      [dmCaixa.Estacao.idEmpresa, qryCadastro.FieldByName('idNota').AsInteger]);
    Open;

    if not Fields.Fields[0].IsNull then
      qryCadastroValorTotal.Value := Fields.Fields[0].AsCurrency;

    Close;
  end;
end;

procedure TfrmNotaDados.btnAlterarNotaItemClick(Sender: TObject);
begin
  if qryCadastroidPessoa.IsNull then
  begin
    frmMensagem.MostraMensagem('Selecione uma pessoa primeiro.');
    pcNotas.ActivePage := tsDadosNota;
    cbPessoas.SetFocus;
  end
  else
  begin
    if qryCadastro.State = dsInsert then
    begin
      try
        qrycadastro.Post;
        qrycadastro.Edit;
      except
        on e : exception do
          raise Exception.Create('Aconteceu o seguinte erro salvando a nota -' + sLineBreak + e.Message);
      end;
    end;

    frmNotaItem := TfrmNotaItem.Create(Self);
    if qryCadastroEntradaSaida.AsString = 'E' then
      frmNotaItem.TipoNota := tnEntrada
    else
      frmNotaItem.TipoNota := tnSaida;

    frmNotaItem.qryCadastro.sql.Text := Format('select * from Contabil.NotaItens where idEmpresa = %d and idPessoa = %d and idNota = %d and idItem = %d',
      [dmNotas.qryItensidEmpresa.AsInteger, dmNotas.qryItensidPessoa.AsInteger, dmNotas.qryItensidNota.AsInteger, dmNotas.qryItensidItem.AsInteger]);
    frmNotaItem.qryCadastro.Open;
    if frmNotaItem.qryCadastro.RecordCount <= 0 then
      frmMensagem.MostraMensagem('Ítem de nota não encontrado.')
    else
    begin
      frmNotaItem.qryCadastro.Edit;
      if frmNotaItem.ShowModal = mrOk then
      begin
        frmNotaItem.qryCadastro.Post;
        dmNotas.qryItens.Refresh;
      end;
    end;
    frmNotaItem.qryCadastro.Close;
    FreeAndNil(frmNotaItem);
  end;
end;

procedure TfrmNotaDados.btnExcluirNotaItemClick(Sender: TObject);
begin
  if dmNotas.qryItens.Active then
  begin
    dmNotas.qryItens.Delete;
    dmNotas.qryItens.Refresh;
  end;
end;

procedure TfrmNotaDados.btnExcluirVencimentosClick(Sender: TObject);
begin
  if dmNotas.qryVencimentos.Active then
  begin
    dmNotas.qryVencimentos.Delete;
    dmNotas.qryVencimentos.Refresh;
  end;
end;

procedure TfrmNotaDados.btnIncluirNotaItemClick(Sender: TObject);
begin
  if qryCadastroidPessoa.IsNull then
  begin
    ShowMessage('Selecione uma pessoa primeiro.');
    pcNotas.ActivePage := tsDadosNota;
    cbPessoas.SetFocus;
  end
  else
  begin
    if qryCadastro.State = dsInsert then
    begin
      try
        qrycadastro.Post;
        AbreTabelas;
        qrycadastro.Edit;
      except
        on e : exception do
          raise Exception.Create('Aconteceu o seguinte erro salvando a nota -' + sLineBreak + e.Message);
      end;
    end;

    frmNotaItem := TfrmNotaItem.Create(Self);
    if qryCadastroEntradaSaida.AsString = 'E' then
      frmNotaItem.TipoNota := tnEntrada
    else
      frmNotaItem.TipoNota := tnSaida;
    frmNotaItem.qryCadastro.Insert;
    frmNotaItem.qryCadastroidEmpresa.AsInteger := qryCadastroidEmpresa.AsInteger;
    frmNotaItem.qryCadastroidPessoa.AsInteger := qryCadastroidPessoa.AsInteger;
    frmNotaItem.qryCadastroidNota.AsInteger := qryCadastroidNota.AsInteger;
    if frmNotaItem.ShowModal = mrOk then
    begin
      dmNotas.qryItens.Refresh;
      AtualizaTotalNota;
    end;
    FreeAndNil(frmNotaItem);
  end;

end;

procedure TfrmNotaDados.btnIncluirVencimentosClick(Sender: TObject);
begin
  if qryCadastroidPessoa.IsNull then
  begin
    frmMensagem.MostraMensagem('Selecione uma pessoa primeiro.');
    pcNotas.ActivePage := tsDadosNota;
    cbPessoas.SetFocus;
  end
  else
  begin
    if qryCadastro.State = dsInsert then
    begin
      try
        qrycadastro.Post;
        qrycadastro.Edit;
      except
        on e : exception do
          raise Exception.Create('Aconteceu o seguinte erro salvando a nota -' + sLineBreak + e.Message);
      end;
    end;
    frmNotaVencimentos := TfrmNotaVencimentos.Create(Self);
    frmNotaVencimentos.qryCadastro.Open;
    frmNotaVencimentos.idPessoa := qryCadastroidPessoa.AsInteger;
    frmNotaVencimentos.idNota := qryCadastroidNota.AsInteger;
    frmNotaVencimentos.qryCadastro.Insert;
    if frmNotaVencimentos.ShowModal = mrOk then
    begin
      frmNotaVencimentos.qryCadastro.Post;
      dmNotas.qryVencimentos.Refresh;
    end;
    FreeAndNil(frmNotaVencimentos);
  end;

end;

procedure TfrmNotaDados.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadastro.Open;
end;

procedure TfrmNotaDados.FormShow(Sender: TObject);
begin
  inherited;

  AbreTabelas;
end;

function TfrmNotaDados.NaoExisteRestricao(var AValue: double): boolean;
begin
  Result := True;

  if qryCadastroidTipoNota.IsNull then
  begin
    frmMensagem.MostraMensagem('O campo TIPO DA NOTA tem que ser preenchido.');
    if cbTipoNota.CanFocus then
      cbTipoNota.SetFocus;

    result := False;
  end;
end;


procedure TfrmNotaDados.qryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;

  try
    qryCadastroidNota.AsInteger := RetornaValorSequence(dmCaixa.dbTotalFastFood, '[Contabil].[NotasSequence]');
  except
    on e : exception do
      raise Exception.Create('Erro buscando sequence da nota. ' + sLineBreak + e.Message);
  end;
  
  qryCadastroidEmpresa.AsInteger := dmCaixa.Estacao.idEmpresa;
  qryCadastroValorTotal.Value := 0;
end;

end.
