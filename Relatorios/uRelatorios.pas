unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,  cxContainer,
  frxClass, frxDBSet, frxExportImage, frxExportText,
  frxExportCSV, frxExportRTF, frxExportHTML, 
  cxNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, JvWizard, JvExControls, JvCalendar, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, System.DateUtils, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TNomeRelatorio = (nrGastos, nrComprasPorItem, nrComprasPorFornecedor, nrInventarioFisicoFinanceiro,
    nrCMV, nrCMVComCompras, nrDRE, nrVendasResumido);

  TfrmRelatorios = class(TfrmFormPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    wzRelatorio: TJvWizard;
    JvWizardWelcomePage1: TJvWizardWelcomePage;
    tsEscolhaRelatorio: TJvWizardInteriorPage;
    btnGastosEmDinheiro: TPanel;
    btnComprasPlanoContas: TPanel;
    btnCompras: TPanel;
    btnInventarioFisicoFinanceiro: TPanel;
    btnCMVComCompras: TPanel;
    btnGerarDRE: TPanel;
    btnCMV: TPanel;
    tsPeriodo: TJvWizardInteriorPage;
    edtDataInicial: TJvMonthCalendar2;
    edtDataFinal: TJvMonthCalendar2;
    tsEscolhaAuditoria: TJvWizardInteriorPage;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1idContagem: TcxGridDBColumn;
    cxGridDBTableView1DataInicio: TcxGridDBColumn;
    cxGridDBTableView1RazaoSocial: TcxGridDBColumn;
    cxGridDBTableView1Total: TcxGridDBColumn;
    chkProdutos: TCheckBox;
    chkPessoas: TCheckBox;
    chkPagamentos: TCheckBox;
    chkConvenios: TCheckBox;
    tsPessoas: TJvWizardInteriorPage;
    dbgridPessoas: TcxGrid;
    dbgridPessoasTableView1: TcxGridDBTableView;
    dbgridPessoasLevel1: TcxGridLevel;
    cxgrdbclmnPessoasTableView1idPessoa: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1RazaoSocial: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1NomeFantasia: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1CNPJ: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1IE: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Logradouro: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Numero: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Complemento: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Bairro: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1NomeMunicipio: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1UF: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1CEP: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1NomePais: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Telefone1: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Telefone2: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1Telefone3: TcxGridDBColumn;
    cxgrdbclmnPessoasTableView1FisicaJuridica: TcxGridDBColumn;
    Image1: TImage;
    tsProdutos: TJvWizardInteriorPage;
    tsAuditoriaInicial: TJvWizardInteriorPage;
    tsAuditoriaFinal: TJvWizardInteriorPage;
    cxGrid3: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView4idContagem: TcxGridDBColumn;
    cxGridDBTableView4DataInicio: TcxGridDBColumn;
    cxGridDBTableView4RazaoSocial: TcxGridDBColumn;
    cxGridDBTableView4Total: TcxGridDBColumn;
    cxStyle4: TcxStyle;
    cxGrid5: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    btnVendasResumido: TPanel;
    tsConvenios: TJvWizardInteriorPage;
    cxGridConvenios: TcxGrid;
    cxGridConveniosDBTableView2: TcxGridDBTableView;
    cxGridConveniosLevel2: TcxGridLevel;
    cxGridConveniosDBTableView2idConvenio: TcxGridDBColumn;
    cxGridConveniosDBTableView2Descricao: TcxGridDBColumn;
    cxGridConveniosDBTableView2DataInicio: TcxGridDBColumn;
    tsFormasPagamento: TJvWizardInteriorPage;
    dbgridFormasPagamento: TcxGrid;
    dbgridFormasPagamentoDBTableView2: TcxGridDBTableView;
    dbgridFormasPagamentoLevel2: TcxGridLevel;
    DBTableView2idFormaPagamento: TcxGridDBColumn;
    DBTableView2Descricao: TcxGridDBColumn;
    DBTableView2DescricaoTipoPagamento: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGastosEmDinheiroClick(Sender: TObject);
    procedure btnComprasPlanoContasClick(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnInventarioFisicoFinanceiroClick(Sender: TObject);
    procedure wzRelatorioActivePageChanged(Sender: TObject);
    procedure wzRelatorioFinishButtonClick(Sender: TObject);
    procedure chkPessoasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCMVClick(Sender: TObject);
    procedure btnCMVComComprasClick(Sender: TObject);
    procedure btnGerarDREClick(Sender: TObject);
    procedure btnVendasResumidoClick(Sender: TObject);
  private
    { Private declarations }
    UltimaPagina : TJvWizardInteriorPage;
    NomeRelatorio : TNomeRelatorio;
    procedure ImprimirGastos;
    procedure ImprimirComprasPorItem;
    procedure ImprimirComprasPorFornecedor;
    procedure ImprimirInventarioFisicoFinanceiro;
    procedure ImprimirCMV;
    procedure ImprimirCMVComCompras;
    procedure ImprimirDRE;
    procedure ImprimirVendasResumido;
    procedure Imprimir;
    function NaoExisteRestricoes : boolean;
  public
    { Public declarations }

  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPergunta, uMensagem, uDMRelatorios, uPrincipal;

procedure TfrmRelatorios.btnCMVClick(Sender: TObject);
begin
  tsPeriodo.Enabled := True;
  tsAuditoriaInicial.Enabled := True;
  tsAuditoriaFinal.Enabled := True;
  tsEscolhaAuditoria.Enabled := False;
  tsPessoas.Enabled := False;
  tsProdutos.Enabled := False;

  UltimaPagina := tsAuditoriaFinal;
  NomeRelatorio := nrCMV;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.btnCMVComComprasClick(Sender: TObject);
begin
  tsPeriodo.Enabled := True;
  tsAuditoriaInicial.Enabled := True;
  tsAuditoriaFinal.Enabled := True;
  tsEscolhaAuditoria.Enabled := False;
  tsPessoas.Enabled := False;
  tsProdutos.Enabled := False;

  UltimaPagina := tsAuditoriaFinal;
  NomeRelatorio := nrCMVComCompras;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.btnComprasClick(Sender: TObject);
begin
  inherited;
  tsPeriodo.Enabled := True;
  tsEscolhaAuditoria.Enabled := False;
  tsAuditoriaInicial.Enabled := False;
  tsAuditoriaFinal.Enabled := False;
  tsPessoas.Enabled := chkPessoas.Checked;
  tsProdutos.Enabled := chkProdutos.Checked;

  if chkProdutos.Checked then
    UltimaPagina := tsProdutos
  else if chkPessoas.Checked then
    UltimaPagina := tsPessoas
  else
    UltimaPagina := tsPeriodo;

  NomeRelatorio := nrComprasPorFornecedor;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.btnComprasPlanoContasClick(Sender: TObject);
begin
  inherited;
  tsPeriodo.Enabled := True;
  tsEscolhaAuditoria.Enabled := False;
  tsPessoas.Enabled := False;

  if chkPessoas.Checked then
    UltimaPagina := tsPessoas
  else if chkProdutos.Checked then
    UltimaPagina := tsProdutos
  else
    UltimaPagina := tsPeriodo;

  NomeRelatorio := nrComprasPorItem;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.btnGastosEmDinheiroClick(Sender: TObject);
begin
  inherited;
  tsPeriodo.Enabled := True;
  tsEscolhaAuditoria.Enabled := False;
  tsPessoas.Enabled := chkPessoas.Checked;

  if chkPessoas.Checked then
    UltimaPagina := tsPessoas
  else
    UltimaPagina := tsPeriodo;

  NomeRelatorio := nrGastos;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.btnGerarDREClick(Sender: TObject);
begin
  tsPeriodo.Enabled := True;
  tsAuditoriaInicial.Enabled := True;
  tsAuditoriaFinal.Enabled := True;
  tsEscolhaAuditoria.Enabled := False;
  tsPessoas.Enabled := False;
  tsProdutos.Enabled := False;

  UltimaPagina := tsAuditoriaFinal;
  NomeRelatorio := nrDRE;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.btnInventarioFisicoFinanceiroClick(Sender: TObject);
begin
  inherited;
  tsEscolhaAuditoria.Enabled := True;
  tsPeriodo.Enabled := False;
  tsAuditoriaInicial.Enabled := False;
  tsAuditoriaFinal.Enabled := False;
  tsPessoas.Enabled := False;
  tsProdutos.Enabled := False;

  UltimaPagina := tsEscolhaAuditoria;
  NomeRelatorio := nrInventarioFisicoFinanceiro;
  wzRelatorio.ActivePage := tsEscolhaAuditoria;
end;

procedure TfrmRelatorios.btnVendasResumidoClick(Sender: TObject);
begin
  tsEscolhaAuditoria.Enabled := False;
  tsPeriodo.Enabled := True;
  tsAuditoriaInicial.Enabled := False;
  tsAuditoriaFinal.Enabled := False;
  tsPessoas.Enabled := chkPessoas.Checked;
  tsProdutos.Enabled := False;
  tsConvenios.Enabled := chkConvenios.Checked;
  tsFormasPagamento.Enabled := chkPagamentos.Checked;

  if chkPessoas.Checked then
    UltimaPagina := tsPessoas;
  if chkConvenios.Checked then
    UltimaPagina := tsConvenios;
  if chkPagamentos.Checked then
    UltimaPagina := tsFormasPagamento;

  if (not chkConvenios.Checked) and (not chkPessoas.Checked) and (not chkPagamentos.Checked) then
    UltimaPagina := tsPeriodo;

  NomeRelatorio := nrVendasResumido;
  wzRelatorio.ActivePage := tsPeriodo;
end;

procedure TfrmRelatorios.chkPessoasClick(Sender: TObject);
begin
  inherited;

  tsPessoas.Enabled := chkPessoas.Checked;
end;

procedure TfrmRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  dmRelatorios.qryAuditoriaInicial.Close;
  dmRelatorios.qryAuditoriaFinal.Close;

  FreeAndNil(dmRelatorios);
end;

procedure TfrmRelatorios.FormCreate(Sender: TObject);
begin
  inherited;

  UltimaPagina := nil;
  dmRelatorios := TdmRelatorios.Create(Self);
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
  inherited;

  edtDataInicial.DateFirst := StartOfTheMonth(Now);
  edtDataFinal.DateFirst   := Now;

  with dmRelatorios.qryAuditoriaInicial do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;

  with dmRelatorios.qryAuditoriaFinal do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;

end;

procedure TfrmRelatorios.Imprimir;
begin

end;

procedure TfrmRelatorios.ImprimirCMV;
begin
  if dmRelatorios.qryAuditoriaInicialDataInicio.Value < dmRelatorios.qryAuditoriaFinalDataInicio.value then
  begin
    if edtDataInicial.DateFirst < edtDataFinal.DateFirst then
    begin
      with dmRelatorios.qryCMVEstoque do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
        ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
        ParamByName('DataInicialValorMedio').Value := edtDataFinal.DateFirst - 30;
        ParamByName('idContagemInicial').Value := dmRelatorios.qryAuditoriaInicialidContagem.AsInteger;
        ParamByName('idContagemFinal').Value := dmRelatorios.qryAuditoriaFinalidContagem.AsInteger;
        Open;
      end;

      if dmRelatorios.frxCMVEstoque.PrepareReport(true) then
        dmRelatorios.frxCMVEstoque.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
  end
  else
    frmMensagem.MostraMensagem('A data da contagem inicial não pode ser maior do que a data da contagem final.');

end;

procedure TfrmRelatorios.ImprimirCMVComCompras;
begin
  if dmRelatorios.qryAuditoriaInicialDataInicio.Value < dmRelatorios.qryAuditoriaFinalDataInicio.value then
  begin
    if edtDataInicial.DateFirst <= edtDataFinal.DateFirst then
    begin
      with dmRelatorios.qryCMVEstoque do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
        ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
        ParamByName('DataInicialValorMedio').Value := edtDataFinal.DateFirst - 30;
        ParamByName('idContagemInicial').Value := dmRelatorios.qryAuditoriaInicialidContagem.AsInteger;
        ParamByName('idContagemFinal').Value := dmRelatorios.qryAuditoriaFinalidContagem.AsInteger;
        Open;
      end;

      with dmRelatorios.qryComprasPorProduto do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
        ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
        Open;
      end;

      if dmRelatorios.frxCMVComCompras.PrepareReport(true) then
        dmRelatorios.frxCMVComCompras.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
  end
  else
    frmMensagem.MostraMensagem('A data da contagem inicial não pode ser maior do que a data da contagem final.');
end;

procedure TfrmRelatorios.ImprimirComprasPorFornecedor;
var
  ListaPessoas : string;
  qtdeLinhasSelecionada, linha : integer;
  cgr:TcxCustomGridRow;
begin
  inherited;
  with dmRelatorios.qryComprasPorFornecedor do
  begin
    Close;

    SQL.Text := format('select p.idPessoa, p.RazaoSocial, p.NomeFantasia, sum(n.ValorTotal) TotalCompras from Contabil.Notas n inner join Contabil.Pessoas p on p.idPessoa = n.idPessoa ' +
                'where n.idNota >= 0 and n.idEmpresa = %d and n.DataEmissao between ' + QuotedStr('%s') + ' and  ' + QuotedStr('%s') + ' ',
                [dmCaixa.Estacao.idEmpresa, FormatDateTime(dmCaixa.FormatoData, edtDataInicial.DateFirst), FormatDateTime(dmCaixa.FormatoData, edtDataFinal.DateFirst)]);
    if chkPessoas.Checked then
    begin
      ListaPessoas := '';
      qtdeLinhasSelecionada:=dbgridPessoasTableView1.Controller.SelectedRecordCount - 1; //quantidade de linhas selecionadas
      for linha := 0 to qtdeLinhasSelecionada do
      begin
        cgr:=dbgridPessoasTableView1.Controller.SelectedRows[linha];
        if ListaPessoas = '' then
          ListaPessoas :=  String(cgr.Values[cxgrdbclmnPessoasTableView1idPessoa.Index])
        else
          ListaPessoas :=  ListaPessoas + ', ' + String(cgr.Values[cxgrdbclmnPessoasTableView1idPessoa.Index]);
      end;

      SQL.Text := SQL.Text + Format(' and n.idPessoa in (%s)', [ListaPessoas]);
    end;

    SQL.Text := SQL.Text + 'group by p.idPessoa, p.RazaoSocial, p.NomeFantasia order by p.NomeFantasia';
    Open;
  end;

  if dmRelatorios.frxComprasPorFornecedor.PrepareReport(true) then
    dmRelatorios.frxComprasPorFornecedor.ShowPreparedReport;

end;

procedure TfrmRelatorios.ImprimirComprasPorItem;
begin
  if edtDataInicial.DateFirst <= edtDataFinal.DateFirst then
  begin
    with dmRelatorios.qryGastosDiarios do
    begin
      Close;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
      ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
      ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
      Open;
    end;

    if dmRelatorios.frxGastosDiarios.PrepareReport(true) then
      dmRelatorios.frxGastosDiarios.ShowPreparedReport;
  end
  else
    frmMensagem.MostraMensagem('A data da compra inicial não pode ser maior do que a data da compra final.');

end;

procedure TfrmRelatorios.ImprimirDRE;
begin
  if dmRelatorios.qryAuditoriaInicialDataInicio.Value < dmRelatorios.qryAuditoriaFinalDataInicio.value then
  begin
    if edtDataInicial.DateFirst <= edtDataFinal.DateFirst then
    begin
      with dmRelatorios.qryDRE do
      begin
        Close;
        ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
        ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
        ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
        ParamByName('DataInicialValorMedio').Value := edtDataInicial.DateFirst - 30;
        ParamByName('idContagemInicial').Value := dmRelatorios.qryAuditoriaInicialidContagem.AsInteger;
        ParamByName('idContagemFinal').Value := dmRelatorios.qryAuditoriaFinalidContagem.AsInteger;
        Open;
      end;

      if dmRelatorios.frxDRE.PrepareReport(true) then
        dmRelatorios.frxDRE.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
  end
  else
    frmMensagem.MostraMensagem('A data da contagem inicial não pode ser maior do que a data da contagem final.');
end;

procedure TfrmRelatorios.ImprimirGastos;
begin
  if edtDataInicial.DateFirst <= edtDataFinal.DateFirst then
  begin
    with dmRelatorios.qryGastosEmDinheiro do
    begin
      Close;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
      ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
      ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
      Open;
    end;

    if dmRelatorios.frxGastosEmDinheiro.PrepareReport(true) then
      dmRelatorios.frxGastosEmDinheiro.ShowPreparedReport;
  end
  else
    frmMensagem.MostraMensagem('A data da compra inicial não pode ser maior do que a data da compra final.');

end;

procedure TfrmRelatorios.ImprimirInventarioFisicoFinanceiro;
begin
  with dmRelatorios.qryValorEstoque do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    ParamByName('idContagem').Value := dmRelatorios.qryAuditoriaInicialidContagem.AsInteger;
    Open;
  end;

  if dmRelatorios.frxValorEstoque.PrepareReport(true) then
    dmRelatorios.frxValorEstoque.ShowPreparedReport;

end;

procedure TfrmRelatorios.ImprimirVendasResumido;
var
  cgr : TcxCustomGridRow;
  ListaConvenios,
  ListaPagamentos : string;
  Linha,
  qtdeLinhasSelecionada : integer;
begin
  if edtDataInicial.DateFirst <= edtDataFinal.DateFirst then
  begin
    ListaConvenios := '';
    ListaPagamentos := '';

    if chkConvenios.Checked then
    begin
      qtdeLinhasSelecionada:=cxGridConveniosDBTableView2.Controller.SelectedRecordCount - 1; //quantidade de linhas selecionadas
      for linha := 0 to qtdeLinhasSelecionada do
      begin
        cgr:=cxGridConveniosDBTableView2.Controller.SelectedRows[linha];
        if ListaConvenios = '' then
          ListaConvenios :=  String(cgr.Values[cxGridConveniosDBTableView2idConvenio.Index])
        else
          ListaConvenios :=  ListaConvenios + ', ' + String(cgr.Values[cxGridConveniosDBTableView2idConvenio.Index]);
      end;
    end;

    if chkPagamentos.Checked then
    begin
      qtdeLinhasSelecionada:=dbgridFormasPagamentoDBTableView2.Controller.SelectedRecordCount - 1; //quantidade de linhas selecionadas
      for linha := 0 to qtdeLinhasSelecionada do
      begin
        cgr:=dbgridFormasPagamentoDBTableView2.Controller.SelectedRows[linha];
        if ListaPagamentos = '' then
          ListaPagamentos :=  String(cgr.Values[DBTableView2idFormaPagamento.Index])
        else
          ListaPagamentos :=  ListaPagamentos + ', ' + String(cgr.Values[DBTableView2idFormaPagamento.Index]);
      end;
    end;

    with dmRelatorios.qryVendasResumido do
    begin
      Close;
      SQL.Clear;
      SQL.Add ('select P.RazaoSocial, C.DataFim, idMesaCartaoSenha, Valor, NumeroCupom from Vendas.Contas C ');
      SQL.Add ('left join Contabil.Pessoas P on C.idPessoa = P.idPessoa ');
      SQL.Add ('where (C.idEmpresa= :idEmpresa) and (Cast(C.DataFim as Date) between :DataInicial and :DataFinal)');

      if ListaConvenios <> '' then
      begin
        SQL.Add ('and (C.idPessoa in (select idPessoa from Vendas.EmpresaPessoaConvenios EPC where EPC.idEmpresa = C.idEmpresa ');
        SQL.Add ('and EPC.idPessoa = C.idPessoa and EPC.idConvenio in (' + ListaConvenios + ')))');
      end;

      if ListaPagamentos <> '' then
      begin
        SQL.Add ('and (exists (select 1 from Vendas.ContaPagamentos CP where CP.idEmpresa = C.idEmpresa ');
        SQL.Add ('and CP.idCaixa =  C.idCaixa and CP.idConta = C.idConta and CP.idformapagamento in (' + ListaPagamentos + ')))');
      end;

      SQL.Add ('order by DataFim');

      ParamByName('idEmpresa').DataType   := ftInteger;
      ParamByName('DataInicial').DataType := ftDateTime;
      ParamByName('DataFinal').DataType   := ftDateTime;

      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
      ParamByName('DataInicial').Value := edtDataInicial.DateFirst;
      ParamByName('DataFinal').Value := edtDataFinal.DateFirst;
      Open;
    end;

    if dmRelatorios.frxVendasResumido.PrepareReport(true) then
      dmRelatorios.frxVendasResumido.ShowPreparedReport;
  end
  else
    frmMensagem.MostraMensagem('A data da venda inicial não pode ser maior do que a data da venda final.');
end;

function TfrmRelatorios.NaoExisteRestricoes: boolean;
  function PeriodoOK : boolean;
  begin
    result := True;

    if edtDataFinal.DateFirst < edtDataInicial.DateFirst then
      result := False;
  end;
begin
  result := True;

  case NomeRelatorio of
    nrGastos,
    nrComprasPorItem,
    nrComprasPorFornecedor,
    nrCMV,
    nrCMVComCompras,
    nrDRE,
    nrVendasResumido: result := PeriodoOK;

    nrInventarioFisicoFinanceiro: ;
  end;
end;

procedure TfrmRelatorios.wzRelatorioActivePageChanged(Sender: TObject);
var
  iResult : integer;
begin
  inherited;

  if Self.Showing then
  begin
    if wzRelatorio.ActivePage = tsPessoas then
    begin
      if not tsProdutos.Enabled then
        UltimaPagina := tsPessoas;
    end;

    if wzRelatorio.ActivePage = UltimaPagina then
      wzRelatorio.ActivePage.EnabledButtons := [bkBack, bkFinish]
    else
      if wzRelatorio.ActivePageIndex = 0 then
        wzRelatorio.ActivePage.EnabledButtons := [bkNext]
      else
        wzRelatorio.ActivePage.EnabledButtons := [bkBack, bkNext];

    wzRelatorio.ActivePage.VisibleButtons := [];
    if bkStart in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkStart];
    if bkLast in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkLast];
    if bkBack in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkBack];
    if bkNext in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkNext];
    if bkFinish in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkFinish];
    if bkCancel in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkCancel];
    if bkHelp in wzRelatorio.ActivePage.EnabledButtons then
      wzRelatorio.ActivePage.VisibleButtons := wzRelatorio.ActivePage.VisibleButtons + [bkHelp];


    if wzRelatorio.ActivePage = tsPessoas then
    begin
      case NomeRelatorio of
        //*** Relatórios de fornecedores
        nrGastos,
        nrComprasPorItem,
        nrComprasPorFornecedor: begin
          iResult := dmRelatorios.AbreQueryPessoas('3');
          if iResult = 0 then
          begin
            frmMensagem.MostraMensagemErro('Nenhum fornecedor cadastrado para esta empresa.');
            wzRelatorio.ActivePage := tsEscolhaRelatorio;
          end
          else if iResult = -1 then
            wzRelatorio.ActivePage := tsEscolhaRelatorio;
        end;

        ///*** Relatórios de auditoria
        nrInventarioFisicoFinanceiro: begin
          if wzRelatorio.ActivePageIndex = wzRelatorio.PageCount - 1 then
            wzRelatorioFinishButtonClick(Self)
          else
            wzRelatorio.SelectNextPage;
        end;

        //*** Relatórios gerenciais
        nrCMV: ;
        nrCMVComCompras: ;
        nrDRE: ;
      end;
    end
    else if wzRelatorio.ActivePage = tsConvenios then
    begin
      case NomeRelatorio of
        nrGastos: ;
        nrComprasPorItem: ;
        nrComprasPorFornecedor: ;
        nrInventarioFisicoFinanceiro: ;
        nrCMV: ;
        nrCMVComCompras: ;
        nrDRE: ;
        nrVendasResumido: begin
          with dmRelatorios.qryConvenios do
          begin
            Close;
            ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
            Open;

            if Not(RecordCount > 0) then
              frmMensagem.MostraMensagemErro('Não existem convênios para esta empresa.');
           end;
        end;
      end;
    end
    else if wzRelatorio.ActivePage = tsFormasPagamento then
    begin
      case NomeRelatorio of
        nrGastos: ;
        nrComprasPorItem: ;
        nrComprasPorFornecedor: ;
        nrInventarioFisicoFinanceiro: ;
        nrCMV: ;
        nrCMVComCompras: ;
        nrDRE: ;
        nrVendasResumido: begin
          with dmRelatorios.qryFormasPagamento do
          begin
            Close;
            ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
            Open;

            if Not(RecordCount > 0) then
              frmMensagem.MostraMensagemErro('Não existem formas de pagamento para esta empresa.');
           end;
        end;
      end;
    end;

  end;
end;

procedure TfrmRelatorios.wzRelatorioFinishButtonClick(Sender: TObject);
begin
  inherited;

  if NaoExisteRestricoes then
  begin
    case NomeRelatorio of
      nrGastos: ImprimirGastos;
      nrComprasPorItem: ImprimirComprasPorItem;
      nrComprasPorFornecedor: ImprimirComprasPorFornecedor;
      nrInventarioFisicoFinanceiro: ImprimirInventarioFisicoFinanceiro;
      nrCMV: ImprimirCMV;
      nrCMVComCompras: ImprimirCMVComCompras;
      nrDRE: ImprimirDRE;
      nrVendasResumido: ImprimirVendasResumido;
    end;
  end;

  wzRelatorio.ActivePage := tsEscolhaRelatorio;
end;

end.
