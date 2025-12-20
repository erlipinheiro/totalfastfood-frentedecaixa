unit uConsultaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxCustomData, ACBrPosPrinter,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, Vcl.StdCtrls, cxNavigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, frxExportPDF, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmConsultaCaixa = class(TfrmFormPadrao)
    pnlPesquisa: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtFim: TDateTimePicker;
    dtInicio: TDateTimePicker;
    pnlBuscar: TPanel;
    Panel2: TPanel;
    lblCaixaInicial: TLabel;
    btnCaixaInicial: TPanel;
    Panel4: TPanel;
    lblCaixaFinal: TLabel;
    btnCaixaFinal: TPanel;
    pnlOpcoesImpressao: TPanel;
    rgFormatoImpressao: TRadioGroup;
    btnImprimir: TPanel;
    btnPesquisar: TJvPanel;
    btnNovaImpressao: TJvPanel;
    pnlConsultarVendasProdutos: TJvPanel;
    btnConsultarSessaoCaixa: TJvPanel;
    qryContas: TFDQuery;
    dsContas: TDataSource;
    frxdbCaixa: TfrxDBDataset;
    frxCaixaResumido: TfrxReport;
    frxDBCaixaResumido: TfrxDBDataset;
    dsCaixaResumido: TDataSource;
    qryCaixaResumido: TFDQuery;
    qryCaixaResumidodata: TDateField;
    qryCaixaResumidoTotalTicket: TIntegerField;
    qryCaixaResumidoValorTotal: TCurrencyField;
    qryCaixaResumidoTM: TCurrencyField;
    qryCaixaResumidoTotalEmCompras: TCurrencyField;
    frxPDFExport1: TfrxPDFExport;
    dbgridCaixa: TcxGrid;
    dbgridCaixaDBTableView1: TcxGridDBTableView;
    dbgridCaixaDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridCaixaDBTableView1idCaixa: TcxGridDBColumn;
    dbgridCaixaDBTableView1idSessaoCaixa: TcxGridDBColumn;
    dbgridCaixaDBTableView1idConta: TcxGridDBColumn;
    dbgridCaixaDBTableView1idMesaCartaoSenha: TcxGridDBColumn;
    dbgridCaixaDBTableView1NomeDoCaixa: TcxGridDBColumn;
    dbgridCaixaDBTableView1NomeConvenio: TcxGridDBColumn;
    dbgridCaixaDBTableView1ColaboradorConveniado: TcxGridDBColumn;
    dbgridCaixaDBTableView1DataFim: TcxGridDBColumn;
    dbgridCaixaDBTableView1FormaPagamento: TcxGridDBColumn;
    dbgridCaixaDBTableView1Valor: TcxGridDBColumn;
    dbgridCaixaLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    qrySessoesCaixa: TFDQuery;
    dsSessoesCaixa: TDataSource;
    qrySessoesCaixaidEmpresa: TIntegerField;
    qrySessoesCaixaidCaixa: TIntegerField;
    qrySessoesCaixaidSessaoCaixa: TIntegerField;
    qrySessoesCaixaidUsuarioAbertura: TIntegerField;
    qrySessoesCaixaidUsuarioFechamento: TIntegerField;
    qrySessoesCaixaidEstacao: TIntegerField;
    qrySessoesCaixadhAbertura: TDateTimeField;
    qrySessoesCaixadhFechamento: TDateTimeField;
    qrySessoesCaixavlInicial: TCurrencyField;
    qrySessoesCaixavlVenda: TCurrencyField;
    qrySessoesCaixaTaxaServico: TFloatField;
    qrySessoesCaixaDataEnvioCentral: TDateTimeField;
    qrySessoesCaixaflEnviadoCentral: TBooleanField;
    qrySessoesCaixaUsuarioAbertura: TStringField;
    qrySessoesCaixaUsuarioFechamento: TStringField;
    chkImprimirProdutos: TCheckBox;
    chkImprimirCompras: TCheckBox;
    chkFiltrarSessaoCaixa: TCheckBox;
    dbgridSessoesCaixa: TDBGrid;
    qryContasidEmpresa: TIntegerField;
    qryContasidCaixa: TIntegerField;
    qryContasidSessaoCaixa: TIntegerField;
    qryContasidConta: TIntegerField;
    qryContasidMesaCartaoSenha: TIntegerField;
    qryContasnumerocupom: TStringField;
    qryContasNomeDoCaixa: TStringField;
    qryContasColaboradorConveniado: TStringField;
    qryContasNomeConvenio: TStringField;
    qryContasdata: TDateField;
    qryContasDataFim: TDateTimeField;
    qryContasValor: TCurrencyField;
    qryContasFormaPagamento: TStringField;
    btnVisualizarVenda: TJvPanel;
    chkImprimirEstornos: TCheckBox;
    chkImprimirColaboradores: TCheckBox;
    dbgridCaixaDBTableView1numerocupom: TcxGridDBColumn;
    procedure btnNovaImpressaoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pnlBuscarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCaixaInicialClick(Sender: TObject);
    procedure btnCaixaFinalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgridCaixaDBTableView1DblClick(Sender: TObject);
    procedure pnlConsultarVendasProdutosClick(Sender: TObject);
    procedure chkFiltrarSessaoCaixaClick(Sender: TObject);
    procedure btnVisualizarVendaClick(Sender: TObject);
  private
    { Private declarations }
    idCaixaInicial,
    idCaixaFinal : integer;
    procedure ImprimeCompleto;
    procedure ImprimeResumido;
  public
    { Public declarations }
  end;

var
  frmConsultaCaixa: TfrmConsultaCaixa;

implementation

{$R *.dfm}

uses uSelecionaCaixa, DataModuleCaixa, uMensagem, uPrincipal,
  uConsultaVenda, uConsultaProdutos, uClasses, uFuncoes;

procedure TfrmConsultaCaixa.btnCaixaFinalClick(Sender: TObject);
begin
  frmSelecionaCaixa := TfrmSelecionaCaixa.Create(Self);
  if frmSelecionaCaixa.ShowModal = mrOk then
  begin
    idCaixaFinal := frmSelecionaCaixa.idCaixa;
    lblCaixaFinal.Caption := FormatDateTime('dd/mm/yy', frmSelecionaCaixa.DataCaixa);
  end;
  FreeAndNil(frmSelecionaCaixa);
end;

procedure TfrmConsultaCaixa.btnCaixaInicialClick(Sender: TObject);
begin
  frmSelecionaCaixa := TfrmSelecionaCaixa.Create(Self);
  if frmSelecionaCaixa.ShowModal = mrOk then
  begin
    idCaixaInicial := frmSelecionaCaixa.idCaixa;
    lblCaixaInicial.Caption := FormatDateTime('dd/mm/yy', frmSelecionaCaixa.DataCaixa);
  end;
  FreeAndNil(frmSelecionaCaixa);
end;

procedure TfrmConsultaCaixa.btnImprimirClick(Sender: TObject);
begin
  qryContas.DisableControls;

  case rgFormatoImpressao.ItemIndex of
    0 : ImprimeCompleto;
    1 : ImprimeResumido;
    2 : dmCaixa.ImprimeFita(idCaixaInicial, 0, 0, chkImprimirProdutos.Checked,chkImprimirCompras.Checked, False , chkImprimirEstornos.Checked, chkImprimirColaboradores.Checked);
    3 : dmCaixa.ImprimeFita(idCaixaInicial, idCaixaFinal,0, chkImprimirProdutos.Checked, chkImprimirCompras.Checked, False,
      chkImprimirEstornos.Checked, chkImprimirColaboradores.Checked);
    4 : begin
      if not qrySessoesCaixa.FieldByName('idSessaoCaixa').IsNull then
        dmCaixa.ImprimeFita(idCaixaInicial, 0,
          qrySessoesCaixa.FieldByName('idSessaoCaixa').AsInteger, chkImprimirProdutos.Checked, chkImprimirCompras.Checked, False, chkImprimirEstornos.Checked,
            chkImprimirColaboradores.Checked);
    end;
  end;

  qryContas.EnableControls;
end;

procedure TfrmConsultaCaixa.btnNovaImpressaoClick(Sender: TObject);
begin
  inherited;

  pnlOpcoesImpressao.Visible := True;
end;

procedure TfrmConsultaCaixa.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  pnlPesquisa.Visible := True;
end;

procedure TfrmConsultaCaixa.btnVisualizarVendaClick(Sender: TObject);
begin
  inherited;

  frmConsultaVenda := TfrmConsultaVenda.Create(Self);
  frmConsultaVenda.idCaixa := qryContasidCaixa.Value;
  frmConsultaVenda.idConta := qryContasidConta.Value;
  frmConsultaVenda.pnlData.Caption := qryContasDataFim.AsString;
  frmConsultaVenda.pnlMesaSenhaCartao.Caption := qryContasidMesaCartaoSenha.AsString;
  frmConsultaVenda.ShowModal;
  FreeAndNil(frmConsultaVenda);
end;

procedure TfrmConsultaCaixa.chkFiltrarSessaoCaixaClick(Sender: TObject);
begin
  inherited;

  if chkFiltrarSessaoCaixa.Checked then
  begin
    if qrySessoesCaixa.RecordCount > 0 then
    begin
      with qryContas do
      begin
        Close;
        SQL.Text := Format('select ' +
        '  c.idEmpresa, ' +
        '  c.idCaixa, ' +
        '  c.idSessaoCaixa, ' +
        '  c.idConta, ' +
        '  c.idMesaCartaoSenha, ' +
        '  c.numerocupom, ' +
        '  p.RazaoSocial as NomeDoCaixa, ' +
        '  pc.RazaoSocial as ColaboradorConveniado, ' +
        '   conv.Descricao as NomeConvenio, ' +
        '  cast(c.DataFim as date) as data, ' +
        '  c.DataFim, ' +
        '  c.Valor, ' +
        '  case (select count(1) from Vendas.ContaPagamentos cp where cp.idEmpresa = c.idEmpresa and cp.idCaixa = c.idCaixa and cp.idSessaoCaixa = c.idSessaoCaixa and cp.idConta = c.idConta) ' +
        '    when 1 then ( select fp.Descricao from Vendas.ContaPagamentos cp ' +
        '                    inner join Contabil.FormasPagamento fp on cp.idFormaPagamento = fp.idFormaPagamento ' +
        '                  where cp.idEmpresa = c.idEmpresa and cp.idCaixa = c.idCaixa and cp.idSessaoCaixa = c.idSessaoCaixa and cp.idConta = c.idConta) ' +
        '    when  0 then ' + QuotedStr('MULTIPLO') +
        '  else ' + QuotedStr('MULTIPLO') +
        '  end as FormaPagamento ' +
        'from Vendas.Contas c ' +
        'inner join Vendas.Caixas ca on c.idEmpresa = ca.idEmpresa and c.idCaixa = ca.idCaixa ' +
        'inner join Vendas.SessoesCaixa sc on c.idEmpresa = sc.idEmpresa and c.idCaixa = sc.idCaixa and c.idSessaoCaixa = sc.idSessaoCaixa ' +
        'inner join Contabil.Pessoas p on sc.idUsuarioAbertura = p.idPessoa ' +
        'left  join Contabil.Pessoas pc on c.idPessoa = pc.idPessoa ' +
        'left  join Vendas.Convenios conv on c.idConvenio = conv.idConvenio ' +
        'where c.idEmpresa = %d and c.idCaixa between %d and %d and c.idSessaoCaixa = %d ' +
        'and ' +
        'exists (select 1 from vendas.ContaPagamentos cp ' +
        '          where cp.idEmpresa = c.idEmpresa and cp.idCaixa = c.idCaixa and cp.idSessaoCaixa = c.idSessaoCaixa and cp.idConta = c.idConta and cp.idFormaPagamento <> -1) ' +
        'order by c.DataFim ',
        [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal,
         qrySessoesCaixa.FieldByName('idSessaoCaixa').AsInteger]);
        Open;
      end;
    end;
  end;
end;

procedure TfrmConsultaCaixa.dbgridCaixaDBTableView1DblClick(Sender: TObject);
begin
  inherited;

  frmConsultaVenda := TfrmConsultaVenda.Create(Self);
  frmConsultaVenda.idCaixa := qryContasidCaixa.Value;
  frmConsultaVenda.idConta := qryContasidConta.Value;
  frmConsultaVenda.pnlData.Caption := qryContasDataFim.AsString;
  frmConsultaVenda.pnlMesaSenhaCartao.Caption := qryContasidMesaCartaoSenha.AsString;
  frmConsultaVenda.pnlCupomFiscal.Caption := qryContasnumerocupom.AsString;
  frmConsultaVenda.ShowModal;
  FreeAndNil(frmConsultaVenda);
end;

procedure TfrmConsultaCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  idCaixaInicial := 0;
  idCaixaFinal   := 0;
  chkFiltrarSessaoCaixa.Visible := False;
  dbgridSessoesCaixa.Visible := False;
end;

procedure TfrmConsultaCaixa.ImprimeCompleto;
var
  dataAnterior : string;
  ValorTotal   : Double;
  ValorTotalGeral : Double;
begin
  with frmPrincipal.impressora do
  begin
    if Ativo then
      Desativar;
    ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
    Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
    Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
    Ativar;

    //*** Imprimo o cabecalho
    PularLinhas(1);
    ImprimirLinha('<e><n>RELATORIO DE VENDAS');
    ImprimirLinha('COMPLETO</e></n>');
    PularLinhas(1);
    ImprimirLinha(copy(LeftPad('EMPRESA', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.NomeFantasia, 1, ColunasFonteNormal));
    ImprimirLinha(copy(LeftPad('CNPJ', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.CNPJ, 1, ColunasFonteNormal));
    ImprimirLinha(copy(LeftPad('USUARIO', ' ', 12) + ' : ' + dmCaixa.Usuario.Nome, 1, ColunasFonteNormal));

    PularLinhas(1);
    ImprimirLinha(StringOfChar('-', ColunasFonteNormal));
    ImprimirLinha('Período : ' + FormatDateTime('dd/MM/yy', dtInicio.Date) + ' a ' + FormatDateTime('dd/MM/yy', dtFim.Date));
    ImprimirLinha(StringOfChar('-', ColunasFonteNormal));
    dataAnterior := '';
    ValorTotal := -1;
    ValorTotalGeral := 0;

    ImprimirLinha('Conta   Mesa    Hora Fechamento   Valor');

    qryContas.First;
    while not qryContas.Eof do
    begin
      if dataAnterior <> qryContasdata.AsString then
      begin
        if ValorTotal <> -1 then
        begin
          ImprimirLinha(RightPad('Valor total[' + dataAnterior + '] R$ ' + FormatCurr('0.00', ValorTotal), ' ', ColunasFonteNormal));
          ValorTotalGeral := ValorTotalGeral + ValorTotal;
          ValorTotal := 0;
        end;

        PularLinhas(1);
        dataAnterior := qryContasdata.AsString;
        ImprimirLinha(dataAnterior);
      end;

      if qryContasFormaPagamento.AsString = 'MULTIPLO' then
      begin
        ImprimirLinha(Format('%7d %3d ', [qryContasidConta.AsInteger, qryContasidMesaCartaoSenha.AsInteger]) +  FormatDateTime('hh:NN:ss', qryContasDataFim.AsDateTime) + ' R$' + RightPad(FormatCurr('0.00', qryContasValor.AsCurrency), ' ', 10));
        with dmCaixa.qryAuxiliar do
        begin
          Close;
          SQL.Text := Format('select cp.*, fp.Descricao from Vendas.ContaPagamentos cp ' +
            'inner join Contabil.FormasPagamento fp on cp.idFormaPagamento = fp.idFormaPagamento ' +
            'where cp.idEmpresa = %d and exists (select 1 from Vendas.Contas c ' +
            'where c.idEmpresa = cp.idEmpresa and c.idCaixa between %d and %d)',
            [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal]);
          Open;

          while not Eof do
          begin
            ImprimirLinha(' ' + LeftPad(FieldByName('Descricao').AsString, ' ', 20) + ' R$ ' + RightPad(FormatCurr('0.00', FieldByName('vlPagamento').AsCurrency), ' ', 10));
            Next;
          end;

          Close;
        end;
      end
      else
        ImprimirLinha(Format('%7d %3d ', [qryContasidConta.AsInteger, qryContasidMesaCartaoSenha.AsInteger]) +  FormatDateTime('hh:NN:ss', qryContasDataFim.AsDateTime) + ' R$' + RightPad(FormatCurr('0.00', qryContasValor.AsCurrency), ' ', 10) + ' ' + qryContasFormaPagamento.AsString);
      ValorTotal := ValorTotal + qryContasValor.AsCurrency;
      qryContas.Next;
    end;

    ImprimirLinha(RightPad('Valor total[' + dataAnterior + '] - R$ ' + FormatCurr('0.00', ValorTotal), ' ', ColunasFonteNormal));
    ValorTotalGeral := ValorTotalGeral + ValorTotal;
    PularLinhas(2);
    ImprimirLinha(RightPad('Valor total geral - R$ ' + FormatCurr('0.00', ValorTotalGeral), ' ', ColunasFonteNormal));

    PularLinhas(3);
    CortarPapel;
    Desativar;
  end;

end;

procedure TfrmConsultaCaixa.ImprimeResumido;
var
  dataAnterior : string;
  ValorTotal   : Double;
  ValorTotalGeral : Double;
begin
  with qryCaixaResumido do
  begin
    Close;
    sql.Text :=
      'DECLARE @t TIME(7) = ' + QuotedStr('23:59:59:000') + ' ; ' +
      'declare @datafinal as date; ' +
      ' ' +
      'select @datafinal = DATEADD(SECOND, DATEDIFF(SECOND, 0, @t), ' + QuotedStr(FormatDateTime(dmCaixa.FormatoData, dtFim.Date)) + '); ' +
      ' ' +
      'select cast(c.DataFim as date) as data, count(1) TotalTicket, Sum(c.Valor) ValorTotal,  Sum(c.Valor)/count(1) TM, ' +
      '(select sum(nv.ValorAPagar) from Contabil.NotaVencimentos nv ' +
      'inner join Contabil.Notas n on nv.idEmpresa = n.idEmpresa and nv.idPessoa = nv.idPessoa and nv.idNota = n.idNota ' +
      ' where idTipoVencimento = 1 and cast(n.DataEmissao as date) = cast(c.DataFim as date)) as TotalEmCompras ' +
      'from Vendas.Contas c ' +
      'inner join Vendas.Caixas ca on c.idEmpresa = ca.idEmpresa and c.idCaixa = ca.idCaixa ' +
      'inner join Vendas.SessoesCaixa sc on c.idEmpresa = sc.idEmpresa and c.idCaixa = sc.idCaixa and  c.idSessaoCaixa = sc.idSessaoCaixa ' +
      'inner join Contabil.Pessoas p on sc.idUsuarioAbertura = p.idPessoa ' +
      'left  join Contabil.Pessoas pc on c.idPessoa = pc.idPessoa ' +
      'left  join Vendas.Convenios conv on c.idConvenio = conv.idConvenio ' +
      'where c.idEmpresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa) + ' and c.DataFim between ' +
      QuotedStr(FormatDateTime(dmCaixa.FormatoData, dtInicio.Date)) + '  and @DataFinal ' +
      'and ' +
      '      exists (select 1 from vendas.ContaPagamentos cp ' +
      '                where cp.idEmpresa = c.idEmpresa and cp.idCaixa = c.idCaixa and cp.idSessaoCaixa = c.idSessaoCaixa and cp.idConta = c.idConta and cp.idFormaPagamento <> -1) ' +
      'group by cast(c.DataFim as date) ' +
      'order by cast(c.DataFim as date)';
    Open;

    if RecordCount > 0 then
    begin
      if frxCaixaResumido.PrepareReport(True) then
        frxCaixaResumido.ShowPreparedReport;
    end
    else
      frmMensagem.MostraMensagem('Não existe dados para este intervalo de datas.');
  end;
end;

procedure TfrmConsultaCaixa.pnlBuscarClick(Sender: TObject);
begin
  with qryContas do
  begin
    Close;
    ParamByName('idEmpresa').AsInteger   := dmCaixa.Estacao.idEmpresa;
    ParamByName('idCaixaInicial').AsInteger := idCaixaInicial;
    ParamByName('idCaixaFinal').AsInteger   := idCaixaFinal;
    Open;

    if RecordCount <= 0 then
      frmMensagem.MostraMensagem('Nenhum dado retornado para esta pesquisa.')
    else
      pnlPesquisa.Visible := False;

  end;

  with qrySessoesCaixa do
  begin
    Close;
    ParamByName('idEmpresa').AsInteger   := dmCaixa.Estacao.idEmpresa;
    ParamByName('idCaixa').AsInteger := idCaixaInicial;
    Open;
  end;

  chkFiltrarSessaoCaixa.Visible := true;
  dbgridSessoesCaixa.Visible := True;
end;

procedure TfrmConsultaCaixa.pnlConsultarVendasProdutosClick(Sender: TObject);
begin
  frmConsultaProdutos := TfrmConsultaProdutos.Create(Self);
  frmConsultaProdutos.ShowModal;
  FreeAndNil(frmConsultaProdutos);
end;

end.
