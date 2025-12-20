unit uPedidoCompraDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Data.DB, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits, cxStyles,
  cxClasses, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, Vcl.DBCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, cxCalc, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FireDAC.Stan.Intf,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmPedidoCompraDados = class(TfrmFormPadrao)
    qryCadastro: TFDQuery;
    dsCadastro: TDataSource;
    qryCadastroidEmpresa: TIntegerField;
    qryCadastroidPedidoCompra: TIntegerField;
    qryCadastroidPessoa: TIntegerField;
    qryCadastroidUsuario: TIntegerField;
    qryCadastroidContagem: TIntegerField;
    qryCadastroDataInicioVendas: TDateField;
    qryCadastroDataHora: TDateTimeField;
    qryCadastroQtdeTickets: TIntegerField;
    qryFornecedores: TFDQuery;
    dsFornecedores: TDataSource;
    edtFornecedor: TDBLookupComboBox;
    dsAuditoriasEstoque: TDataSource;
    qryAuditoriasEstoque: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    edtContagem: TDBLookupComboBox;
    Label1: TLabel;
    Label4: TLabel;
    pnlTicketsNoPeriodo: TPanel;
    Label5: TLabel;
    qryAuditoriasEstoqueidEmpresa: TIntegerField;
    qryAuditoriasEstoqueidContagem: TIntegerField;
    qryAuditoriasEstoqueidPessoaInicio: TIntegerField;
    qryAuditoriasEstoqueidPessoaFim: TIntegerField;
    qryAuditoriasEstoqueDataInicio: TDateTimeField;
    qryAuditoriasEstoqueDataFim: TDateTimeField;
    qryAuditoriasEstoqueStatus: TIntegerField;
    qryAuditoriasEstoquePercentualAcerto: TFloatField;
    qryAuditoriasEstoqueDataEnvioCentral: TDateTimeField;
    qryAuditoriasEstoqueflEnviadoCentral: TBooleanField;
    edtDataInicial: TcxDBDateEdit;
    edtQtdeTickets: TcxDBCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure qryCadastroNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure btnOKPadraoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCompraDados: TfrmPedidoCompraDados;

implementation

{$R *.dfm}

uses DataModuleCaixa, uMensagem, uFuncoes;

procedure TfrmPedidoCompraDados.btnOKPadraoClick(Sender: TObject);
begin
  if qryCadastroidPessoa.IsNull then
  begin
    frmMensagem.MostraMensagem('Você deve preencher o campo de fornecedor.');
    edtFornecedor.SetFocus;
  end
  else if qryCadastroDataInicioVendas.IsNull then
  begin
    frmMensagem.MostraMensagem('Você deve preencher a data de início das vendas.');
    edtDataInicial.SetFocus;
  end
  else if qryCadastroidContagem.IsNull then
  begin
    frmMensagem.MostraMensagem('Você deve selecionar uma contagem.');
    edtContagem.SetFocus;
  end
  else if qryCadastroQtdeTickets.IsNull then
  begin
    frmMensagem.MostraMensagem('Você deve preencher o campo de qtde de tickets.');
    edtDataInicial.SetFocus;
  end
  else
  begin
    qryCadastro.Post;

    inherited;
  end;
end;

procedure TfrmPedidoCompraDados.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if Not qryCadastroDataInicioVendas.IsNull and Not qryCadastroidContagem.IsNull then
  begin
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := Format('select count(1) from vendas.contas c where (idEmpresa = %d) and (c.datafim between ' +
        QuotedStr(FormatDateTime(dmCaixa.FormatoData, edtDataInicial.Date)) + ' and ' +
        QuotedStr(FormatDateTime(dmCaixa.FormatoData, qryAuditoriasEstoqueDataInicio.AsDateTime))+ ')', [dmCaixa.Estacao.idEmpresa]);
      Open;

      if RecordCount > 0 then
      begin
        pnlTicketsNoPeriodo.Caption := Fields.Fields[0].AsString;
      end;

      Close;
    end;
  end
  else
    pnlTicketsNoPeriodo.Caption := '';
end;

procedure TfrmPedidoCompraDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  qryCadastro.Close;
end;

procedure TfrmPedidoCompraDados.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadastro.Open;
end;

procedure TfrmPedidoCompraDados.FormShow(Sender: TObject);
begin
  inherited;

  with qryAuditoriasEstoque do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;

  with qryFornecedores do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;

  if qryAuditoriasEstoque.RecordCount <= 0 then
    raise Exception.Create('Não existe auditoria de estoque. Impossível continuar.');
end;

procedure TfrmPedidoCompraDados.qryCadastroNewRecord(DataSet: TDataSet);
begin
  qryCadastroidEmpresa.Value      := dmCaixa.Estacao.idEmpresa;
  qryCadastroidPedidoCompra.Value := RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Estoque.PedidosCompraSequence');
  qryCadastroDataHora.Value       := Now;
  qryCadastroidUsuario.Value      := dmCaixa.Usuario.ID;
end;

end.
