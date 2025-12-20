unit uConsultaCaixaold;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.StdCtrls, Vcl.ComCtrls, MemDS,
  DBAccess, Uni, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  frxClass, frxDBSet, frxExportPDF, uFormPadrao;

type
  TfrmConsultaCaixa = class(TfrmFormPadrao)
    pnlCaixa: TPanel;
    dbgridCaixaDBTableView1: TcxGridDBTableView;
    dbgridCaixaLevel1: TcxGridLevel;
    dbgridCaixa: TcxGrid;
    qryCaixa: TFDQuery;
    dsCaixa: TDataSource;
    pnlPesquisa: TPanel;
    GroupBox3: TGroupBox;
    dtFim: TDateTimePicker;
    dtInicio: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    pnlBuscar: TPanel;
    qryCaixaidCaixa: TIntegerField;
    qryCaixaidSessaoCaixa: TIntegerField;
    qryCaixaidConta: TIntegerField;
    qryCaixaDataFim: TDateTimeField;
    qryCaixaValor: TCurrencyField;
    Panel1: TPanel;
    btnVoltar: TImage;
    btnPesquisar: TJvPanel;
    qryCaixadata: TDateField;
    btnNovaImpressao: TJvPanel;
    pnlOpcoesImpressao: TPanel;
    rgFormatoImpressao: TRadioGroup;
    btnImprimir: TPanel;
    qryCaixaFormaPagamento: TStringField;
    dsContaPagamentos: TDataSource;
    qryCaixaidEmpresa: TIntegerField;
    qryContaPagamentos: TFDQuery;
    qryContaPagamentosidEmpresa: TIntegerField;
    qryContaPagamentosidCaixa: TIntegerField;
    qryContaPagamentosidSessaoCaixa: TIntegerField;
    qryContaPagamentosidConta: TIntegerField;
    qryContaPagamentosDescricao: TStringField;
    qryContaPagamentosvlPagamento: TCurrencyField;
    qryCaixaidMesaCartaoSenha: TIntegerField;
    qryCaixaNomeDoCaixa: TStringField;
    qryCaixaColaboradorConveniado: TStringField;
    qryCaixaNomeConvenio: TStringField;
    dbgridCaixaDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridCaixaDBTableView1idCaixa: TcxGridDBColumn;
    dbgridCaixaDBTableView1idSessaoCaixa: TcxGridDBColumn;
    dbgridCaixaDBTableView1idConta: TcxGridDBColumn;
    dbgridCaixaDBTableView1data: TcxGridDBColumn;
    dbgridCaixaDBTableView1DataFim: TcxGridDBColumn;
    dbgridCaixaDBTableView1FormaPagamento: TcxGridDBColumn;
    dbgridCaixaDBTableView1Valor: TcxGridDBColumn;
    dbgridCaixaDBTableView1idMesaCartaoSenha: TcxGridDBColumn;
    dbgridCaixaDBTableView1NomeDoCaixa: TcxGridDBColumn;
    dbgridCaixaDBTableView1ColaboradorConveniado: TcxGridDBColumn;
    dbgridCaixaDBTableView1NomeConvenio: TcxGridDBColumn;
    frxDBVendas: TfrxDBDataset;
    frxdbCaixa: TfrxDBDataset;
    qryCaixaResumido: TFDQuery;
    dsCaixaResumido: TDataSource;
    frxDBCaixaResumido: TfrxDBDataset;
    qryCaixaResumidodata: TDateField;
    qryCaixaResumidoTotalTicket: TIntegerField;
    qryCaixaResumidoValorTotal: TCurrencyField;
    qryCaixaResumidoTM: TCurrencyField;
    frxCaixaResumido: TfrxReport;
    qryCaixaResumidoTotalEmCompras: TCurrencyField;
    frxPDFExport1: TfrxPDFExport;
    btnConsultarSessaoCaixa: TJvPanel;
    pnlConsultarVendasProdutos: TJvPanel;
    Panel2: TPanel;
    Label3: TLabel;
    btnCaixaInicial: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    btnCaixaFinal: TPanel;
    lblCaixaInicial: TLabel;
    lblCaixaFinal: TLabel;
    dsItens: TDataSource;
    qryItens: TFDQuery;
    qryItensidEmpresa: TIntegerField;
    qryItensidConta: TIntegerField;
    qryItensidItem: TIntegerField;
    qryItensidProduto: TIntegerField;
    qryItensNumeroOrdem: TIntegerField;
    qryItensqtde: TFloatField;
    qryItensvlProduto: TCurrencyField;
    qryItensvlDesconto: TCurrencyField;
    qryItensNumeroCombo: TIntegerField;
    qryItensflCombo: TBooleanField;
    qryItensDescricao: TStringField;
    qryItensNumeroOrdemCombo: TIntegerField;
    qryItensidItemPai: TIntegerField;
    qryItenscdProduto: TStringField;
    qryItensidSubGrupoProduto: TIntegerField;
    qryItensAliquotaICMS: TFloatField;
    qryItensNumeroMaximoAcompanhamentos: TIntegerField;
    qryItensCorSelecionado: TIntegerField;
    qryItensCorFonte: TIntegerField;
    qryItensCorFonteSelecionado: TIntegerField;
    qryItensCorValorFonte: TIntegerField;
    qryItensCorValorFonteSelecionado: TIntegerField;
    qryItensflMostrarNaTela: TBooleanField;
    qryItensDescricaoSubGrupo: TStringField;
    qryItensCor: TIntegerField;
    qryItensOrdemTela: TIntegerField;
    qryItensidLinhaProduto: TIntegerField;
    qryItensidTipoRelacionamentoProduto: TIntegerField;
    qryItensidCaixa: TIntegerField;
    qryItensidSessaoCaixa: TIntegerField;
    qryItensLinhaProduto: TStringField;
    qryItensDescricaoReduzida: TStringField;
    qryItensCodigoBarras: TStringField;
    qryItensIncluirNaContagem: TBooleanField;
    qryItensLeQtdeBalanca: TBooleanField;
    qryItensControlaEstoque: TBooleanField;
    qryItensPercentualDeDiscrepanciaEstoque: TFloatField;
    qryItensImprimirPedido: TBooleanField;
    qryItensQuantidadeFracionada: TBooleanField;
    qryItensSomenteCombo: TBooleanField;
    qryItensDataHoraImpressao: TDateTimeField;
    qryItensDataHora: TDateTimeField;
    qryItensTaxaServico: TFloatField;
    qryItensidGarcom: TIntegerField;
    qryItensidImpressoraPedido: TIntegerField;
    qryItensidPlanoContas: TIntegerField;
    qryItensidUnidade: TIntegerField;
    qryItensDescricaoImpressora: TStringField;
    qryItensFilaImpressao: TStringField;
    qryItensNumeroColunas: TIntegerField;
    qryItensNumeroColunasCondensado: TIntegerField;
    qryItensidTipoImpressora: TIntegerField;
    qryItensExpr1: TBooleanField;
    cxgrdlvlCaixaLevel2: TcxGridLevel;
    dbgridCaixaDBTableView2: TcxGridDBTableView;
    dbgridCaixaDBTableView2idItem: TcxGridDBColumn;
    dbgridCaixaDBTableView2NumeroOrdem: TcxGridDBColumn;
    dbgridCaixaDBTableView2qtde: TcxGridDBColumn;
    dbgridCaixaDBTableView2vlProduto: TcxGridDBColumn;
    dbgridCaixaDBTableView2vlDesconto: TcxGridDBColumn;
    dbgridCaixaDBTableView2flCombo: TcxGridDBColumn;
    dbgridCaixaDBTableView2Descricao: TcxGridDBColumn;
    dbgridCaixaDBTableView2idItemPai: TcxGridDBColumn;
    dbgridCaixaDBTableView2cdProduto: TcxGridDBColumn;
    dbgridCaixaDBTableView2AliquotaICMS: TcxGridDBColumn;
    dbgridCaixaDBTableView2DescricaoSubGrupo: TcxGridDBColumn;
    dbgridCaixaDBTableView2idLinhaProduto: TcxGridDBColumn;
    dbgridCaixaDBTableView2LinhaProduto: TcxGridDBColumn;
    dbgridCaixaDBTableView2DataHoraImpressao: TcxGridDBColumn;
    dbgridCaixaDBTableView2DataHora: TcxGridDBColumn;
    dbgridCaixaDBTableView2TaxaServico: TcxGridDBColumn;
    dbgridCaixaDBTableView2DescricaoImpressora: TcxGridDBColumn;
    dbgridCaixaDBTableView2FilaImpressao: TcxGridDBColumn;
    cxgrdlvlCaixaLevel3: TcxGridLevel;
    dbgridCaixaDBTableView3: TcxGridDBTableView;
    dbgridCaixaDBTableView3Descricao: TcxGridDBColumn;
    dbgridCaixaDBTableView3vlPagamento: TcxGridDBColumn;
    procedure pnlBuscarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovaImpressaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure frxCaixaResumidoGetValue(const VarName: string;
      var Value: Variant);
    procedure btnCaixaInicialClick(Sender: TObject);
    procedure btnCaixaFinalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    idCaixaInicial,
    idCaixaFinal : integer;
    procedure ImprimeCompleto;
    procedure ImprimeResumido;
//    procedure ImprimeFita(ADia : Tdate; );
  public
    { Public declarations }
  end;

var
  frmConsultaCaixa: TfrmConsultaCaixa;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPrincipal, uImpressoras, uMensagem, uRelatorios,
  uImprimeFita, uSelecionaCaixa;

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
  qryCaixa.DisableControls;
  case rgFormatoImpressao.ItemIndex of
    0 : ImprimeCompleto;
    1 : ImprimeResumido;
    2 : dmCaixa.ImprimeFita(idCaixaInicial, 0, True, True);
  end;
  qryCaixa.EnableControls;
end;

procedure TfrmConsultaCaixa.btnNovaImpressaoClick(Sender: TObject);
begin
  pnlOpcoesImpressao.Visible := True;
end;

procedure TfrmConsultaCaixa.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := True;
end;

procedure TfrmConsultaCaixa.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  dtInicio.Date := Now;
  dtFim.Date := Now;
end;

procedure TfrmConsultaCaixa.frxCaixaResumidoGetValue(const VarName: string;
  var Value: Variant);
begin
  if UpperCase(VarName) = 'INICIO' then
    Value := DateToStr(dtInicio.Date)
  else if UpperCase(VarName) = 'FIM' then
    Value := DateToStr(dtFim.Date)
  else if UpperCase(VarName) = 'LOJA' then
    Value := IntToStr(dmCaixa.Estacao.idEmpresa)
  else if UpperCase(VarName) = 'NOMELOJA' then
    Value := dmCaixa.Estacao.NomeFantasia;
end;

procedure TfrmConsultaCaixa.ImprimeCompleto;
var
  dataAnterior : string;
  ValorTotal   : Double;
  ValorTotalGeral : Double;
begin
  with frmPrincipal.impressora do
  begin
    InicializaImpressao(dmCaixa.Estacao.FilaImpressao, dmCaixa.Estacao.ModeloImpressora,
      dmCaixa.Estacao.NumeroColunas, dmCaixa.Estacao.NumeroColunasCondensado);

    //*** Imprimo o cabecalho
    ImprimeLinhaEmBranco(1);
    ImprimeExpandido('RELATORIO DE VENDAS', True);
    ImprimeExpandido('COMPLETO', True);
    ImprimeLinhaEmBranco(1);
    Imprime(copy(LeftPad('EMPRESA', ' ', 12) + ' : ' + dmCaixa.Estacao.NomeFantasia, 1, NumeroColunas));
    Imprime(copy(LeftPad('CNPJ', ' ', 12) + ' : ' + dmCaixa.Estacao.CNPJ, 1, NumeroColunas));
    Imprime(copy(LeftPad('USUARIO', ' ', 12) + ' : ' + dmCaixa.Usuario.Nome, 1, NumeroColunas));

    ImprimeLinhaEmBranco(1);
    Imprime(StringOfChar('-', NumeroColunas));
    Imprime('Período : ' + FormatDateTime('dd/MM/yy', dtInicio.Date) + ' a ' + FormatDateTime('dd/MM/yy', dtFim.Date));
    Imprime(StringOfChar('-', NumeroColunas));
    dataAnterior := '';
    ValorTotal := -1;
    ValorTotalGeral := 0;

    Imprime('Conta   Mesa    Hora Fechamento   Valor');

    qryCaixa.First;
    while not qryCaixa.Eof do
    begin
      if dataAnterior <> qryCaixadata.AsString then
      begin
        if ValorTotal <> -1 then
        begin
          ImprimeNegrito(RightPad('Valor total[' + dataAnterior + '] R$ ' + FormatCurr('0.00', ValorTotal), ' ', NumeroColunas));
          ValorTotalGeral := ValorTotalGeral + ValorTotal;
          ValorTotal := 0;
        end;

        ImprimeLinhaEmBranco(1);
        dataAnterior := qryCaixadata.AsString;
        ImprimeNegrito(dataAnterior);
      end;

      if qryCaixaFormaPagamento.AsString = 'MULTIPLO' then
      begin
        Imprime(Format('%7d %3d ', [qryCaixaidConta.AsInteger, qryCaixaidMesaCartaoSenha.AsInteger]) +  FormatDateTime('hh:NN:ss', qryCaixaDataFim.AsDateTime) + ' R$' + RightPad(FormatCurr('0.00', qryCaixaValor.AsCurrency), ' ', 10));
        while not qryContaPagamentos.Eof do
        begin
          Imprime(' ' + LeftPad(qryContaPagamentosDescricao.AsString, ' ', 20) + ' R$ ' + RightPad(FormatCurr('0.00', qryContaPagamentosvlPagamento.AsCurrency), ' ', 10));
          qryContaPagamentos.Next;
        end;
      end
      else
        Imprime(Format('%7d %3d ', [qryCaixaidConta.AsInteger, qryCaixaidMesaCartaoSenha.AsInteger]) +  FormatDateTime('hh:NN:ss', qryCaixaDataFim.AsDateTime) + ' R$' + RightPad(FormatCurr('0.00', qryCaixaValor.AsCurrency), ' ', 10) + ' ' + qryCaixaFormaPagamento.AsString);
      ValorTotal := ValorTotal + qryCaixaValor.AsCurrency;
      qryCaixa.Next;
    end;

    ImprimeNegrito(RightPad('Valor total[' + dataAnterior + '] - R$ ' + FormatCurr('0.00', ValorTotal), ' ', NumeroColunas));
    ValorTotalGeral := ValorTotalGeral + ValorTotal;
    ImprimeLinhaEmBranco(2);
    ImprimeNegrito(RightPad('Valor total geral - R$ ' + FormatCurr('0.00', ValorTotalGeral), ' ', NumeroColunas));

    FinalizaImpressao(tcTotal);
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

  {with frmPrincipal.impressora do
  begin
    InicializaImpressao;

    //*** Imprimo o cabecalho
    ImprimeLinhaEmBranco(1);
    ImprimeExpandido('RELATORIO DE VENDAS', True);
    ImprimeExpandido('COMPLETO', True);
    ImprimeLinhaEmBranco(1);
    Imprime(copy(LeftPad('EMPRESA', ' ', 12) + ' : ' + dmCaixa.Estacao.NomeFantasia, 1, NumeroColunas));
    Imprime(copy(LeftPad('CNPJ', ' ', 12) + ' : ' + dmCaixa.Estacao.CNPJ, 1, NumeroColunas));
    Imprime(copy(LeftPad('USUARIO', ' ', 12) + ' : ' + dmCaixa.Usuario.Nome, 1, NumeroColunas));

    ImprimeLinhaEmBranco(1);
    Imprime(StringOfChar('-', NumeroColunas));
    Imprime('Período : ' + FormatDateTime('dd/MM/yy', dtInicio.Date) + ' a ' + FormatDateTime('dd/MM/yy', dtFim.Date));
    Imprime(StringOfChar('-', NumeroColunas));
    dataAnterior := '';
    ValorTotal := -1;
    ValorTotalGeral := 0;

    qryCaixa.First;
    while not qryCaixa.Eof do
    begin
      if dataAnterior <> qryCaixadata.AsString then
      begin
        if ValorTotal <> -1 then
        begin
          ImprimeNegrito(RightPad('Valor total [' + dataAnterior + '] R$ ' + FormatCurr('0.00', ValorTotal), ' ', NumeroColunas));
          ValorTotalGeral := ValorTotalGeral + ValorTotal;
          ValorTotal := 0;
        end;
        dataAnterior := qryCaixadata.AsString;
      end;

      ValorTotal := ValorTotal + qryCaixaValor.AsCurrency;
      qryCaixa.Next;
    end;

    ImprimeNegrito(RightPad('Valor total [' + dataAnterior + '] R$ ' + FormatCurr('0.00', ValorTotal), ' ', NumeroColunas));
    ValorTotalGeral := ValorTotalGeral + ValorTotal;
    ImprimeLinhaEmBranco(2);
    ImprimeNegrito(RightPad('Valor total geral - R$ ' + FormatCurr('0.00', ValorTotalGeral), ' ', NumeroColunas));

    FinalizaImpressao(tcTotal);
  end;
 }
end;

procedure TfrmConsultaCaixa.pnlBuscarClick(Sender: TObject);
begin
  with qryCaixa do
  begin
    Close;
    ParamByName('idEmpresa').AsInteger   := dmCaixa.Estacao.idEmpresa;
    ParamByName('idCaixaInicial').AsInteger := idCaixaInicial;
    ParamByName('idCaixaFinal').AsInteger   := idCaixaFinal;
    Open;

    if RecordCount <= 0 then
      frmMensagem.MostraMensagem('Nenhum dado retornado para esta pesquisa.')
    else
    begin
      pnlPesquisa.Visible := False;

      with qryContaPagamentos do
      begin
        Close;
        SQL.Text := Format('select cp.*, fp.Descricao from Vendas.ContaPagamentos cp ' +
          'inner join Contabil.FormasPagamento fp on cp.idFormaPagamento = fp.idFormaPagamento ' +
          'where cp.idEmpresa = %d and exists (select 1 from Vendas.Contas c ' +
          'where c.idEmpresa = cp.idEmpresa and c.idCaixa between %d and %d)',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal]);
        Open;
      end;
    end;
    qryItens.Open;
    qryContaPagamentos.Open;
  end;
end;

end.
