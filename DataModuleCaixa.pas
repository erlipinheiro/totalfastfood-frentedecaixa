unit DataModuleCaixa;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.DB, Datasnap.DBClient,
  SimpleDS, Data.SqlExpr, Data.FMTBcd, System.Variants, Datasnap.Provider,
  Forms, ACBrBase, ACBrExtenso, uClasses, ACBrBAL,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Comp.UI, FireDAC.VCLUI.Wait,
  FireDAC.VCLUI.Error, Vcl.Graphics, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  FireDAC.Phys.MSSQLDef, FireDAC.Moni.Base, FireDAC.Moni.RemoteClient, ACBrPosPrinter,
  Constantes, pcnConversao, FireDAC.ConsoleUI.Wait, ACBrNFeDANFEClass,
  ACBrNFeDANFeESCPOS, ACBrDFe, ACBrNFe, ACBrValidador, DateUtils,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, ACBrSocket, ACBrIBPTax, ACBrDFeReport,
  ACBrDFeDANFeReport;

type
  TdmCaixa = class(TDataModule)
    qryAuxiliar: TFDQuery;
    qryviewProdutosRelacionadosListaPreco: TFDQuery;
    qryviewProdutosListaPreco: TFDQuery;
    dbTotalFastFood: TFDConnection;
    dspviewProdutosListaPreco: TDataSetProvider;
    cdsviewProdutosListaPreco: TClientDataSet;
    dspviewProdutosRelacionadosListaPreco: TDataSetProvider;
    cdsviewProdutosRelacionadosListaPreco: TClientDataSet;
    dsAuxiliar: TDataSource;
    qryProdutosComposicaoTicketFracionado: TFDQuery;
    dspProdutosComposicaoTicketFracionado: TDataSetProvider;
    cdsProdutosComposicaoTicketFracionado: TClientDataSet;
    qryTotalVendaPeriodo: TFDQuery;
    qryItensImprimir: TFDQuery;
    qryConferencia: TFDQuery;
    qryProdutoObservacoes: TFDQuery;
    dspProdutoObservacoes: TDataSetProvider;
    cdsProdutoObservacoes: TClientDataSet;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDTransaction1: TFDTransaction;
    qryItens: TFDQuery;
    qryConferenciaTotalizado: TFDQuery;
    qryPermissoes: TFDQuery;
    IdFTP1: TIdFTP;
    qryMTC: TFDQuery;
    qryMTCTC: TIntegerField;
    qryMTCQtdeMiniPasteis: TFloatField;
    qryMTCQtdePorcoes: TFloatField;
    qryMTCMTC: TFloatField;
    qryGrupos: TFDQuery;
    qryGruposDescricaoGrupo: TStringField;
    qryGruposCor: TStringField;
    qryGruposvalortotal: TFloatField;
    qryRefrigerantes: TFDQuery;
    qryRefrigerantesr300: TFloatField;
    qryRefrigerantesr500: TFloatField;
    qryCombos: TFDQuery;
    qryCombosCombo: TStringField;
    qryCombosQtde: TFloatField;
    qryCombosPercentual: TFloatField;
    qryCombosPorGrupos: TFDQuery;
    qryVendaTotais: TFDQuery;
    qryVendaTotaisTotal: TCurrencyField;
    qryVendaTotaisTC: TIntegerField;
    qryVendaTotaisTM: TCurrencyField;
    qryVendaTotaisValorAdicionais: TFloatField;
    strngfldCombosPorGruposdescricao: TStringField;
    strngfldCombosPorGruposCor: TStringField;
    qryCombosPorGruposQtdeSemCombo: TFloatField;
    qryCombosPorGruposQtdeComCombo: TFloatField;
    qryCombosPorGruposPercentual: TFloatField;
    qryProdutoPromocoes: TFDQuery;
    dspProdutoPromocoes: TDataSetProvider;
    cdsProdutoPromocoes: TClientDataSet;
    FDTransaction2: TFDTransaction;
    ACBrExtenso1: TACBrExtenso;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    qryEnderecos: TFDQuery;
    dspEnderecos: TDataSetProvider;
    cdsEnderecos: TClientDataSet;
    dsEnderecos: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryDescontos: TFDQuery;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCEFR1: TACBrNFeDANFCEFR;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    procedure DataModuleDestroy(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure DataModuleCreate(Sender: TObject);
    procedure ACBrNFe1GerarLog(const ALogLine: string; var Tratado: Boolean);
    procedure ACBrNFe1TransmitError(const HttpError, InternalError: Integer;
      const URL, DadosEnviados, SoapAction: string; var Retentar,
      Tratado: Boolean);
  private
    FDiretorioDadosOFFLine: string;
    FFormatoData: string;
    FUsuario: TUsuario;
    FEstacao: TEstacao;
    FNumeroMonitor: integer;
    FidEstacao: integer;
    FArquivoMensagens: string;
    FTipoVenda: TTipoVenda;
    FArquivoLogo: string;
    FTipoEstacao: TTipoEstacao;
    procedure SetDiretorioDadosOFFLine(const Value: string);
    function CarregaViewProdutosOffLine : boolean;
    function CarregaViewProdutosRelacionadosOffLine : boolean;
    procedure SetFormatoData(const Value: string);
    procedure BuscaAtualizacaoDeDados;
    procedure SetUsuario(const Value: TUsuario);
    procedure SetEstacao(const Value: TEstacao);
    procedure SetNumeroMonitor(const Value: integer);
    procedure SetidEstacao(const Value: integer);
    procedure SetArquivoMensagens(const Value: string);
    procedure SetTipoVenda(const Value: TTipoVenda);
    procedure SetArquivoLogo(const Value: string);
    procedure SetTipoEstacao(const Value: TTipoEstacao);
    { Private declarations }
  public
    { Public declarations }
    DiretorioNFE,
    CaminhoCertificado : string;
    flAtualizaDados : boolean;
    NomeImpressoraINI : string;
    ModeloImpressoraINI : string;
    LinhasEntreCuponsINI : integer;
    NumeroColunasINI : integer;
    FilaImpressaoINI : string;
    ArquivoDANFEINI : string;

    procedure AtualizaPainelItens(APainel : TScrollBox; Const AidEmpresa, AidCaixa, AidConta : integer;
      Const AAdicionarClick, AExcluirClick, AItemClick, ARetirarClick, ATamanhoClick  : TItemEvento; Const Visualizacao : boolean = False);
    procedure LimpaPainelItens(APainel : TScrollBox);
    procedure OrdenaPainelItens(APainel : TScrollBox);
    procedure AbreDataSets;
    procedure VerificaSeExisteAtualizacaoDeDados;
    procedure AtualizaQueryItens(Const AidCaixa, AidConta, AidItem : integer);
    procedure ConectaAoBancoDeDados;
    function ExisteID (const query : string) : integer;
    procedure MovimentaEstoque(Const idProduto: integer; Const Quantidade : Currency; const idPessoa: integer;
      Const idRelacionado : integer; const idTipoMovimentacao : integer; Const DataHora : TDateTime);
    function ImprimeFita(Const idCaixaInicial : integer = 0; const idCaixaFinal : integer = 0; const idSessaoCaixa : integer = 0;
      Const flImprimeProdutos : boolean = False; Const flImprimeComprasEmDinheiro: boolean = False; Const flFechamento : boolean = False;
      Const flImprimeEstornos : boolean = True; Const flImprimeColaboradores : boolean = True) : boolean;
//    Procedure ImprimeConferencia(AidConta : integer; idMesaCartaoSenha : integer; NomeGarcom : string; NomeGarconConferencia : string; idPessoaDelivery : integer);
    procedure ImprimeValeTroco(const AidConta : integer);
    function TemPermissao(Const AidControle : Integer) : boolean;
    function UsuarioTemPermissao(Const AidUsuario, AidControle : Integer) : boolean;
    procedure AtualizaPermissoes;
    function  SenhaOK(Const AidControle : integer; var AidUsuario : integer) : boolean;
    procedure AtualizaHistoricoConta(Const AidConta : integer; Const AStatus : TStatusConta; Const AidUsuario : integer; Const ADataHora : TDateTime = 0);
    procedure AtualizaStatusConta (Const AidConta : integer; Const AStatus : TStatusConta);
    function EmiteNFCe(Const AIDConta : integer; Const ADocumento : string; Const ATipoDocumento : TACBrValTipoDocto;
      Const ANome : string; Const AIE : string; Const AIDMesaCartaoSenha : integer; Const AContingencia : boolean;
      Const ANomeConvenio : string; Const AIDCaixa : integer = 0) : boolean;

    property ArquivoLogo : string read FArquivoLogo write SetArquivoLogo;
    property ArquivoMensagens : string read FArquivoMensagens write SetArquivoMensagens;
    property DiretorioDadosOFFLine : string read FDiretorioDadosOFFLine write SetDiretorioDadosOFFLine;
    property Estacao : TEstacao read FEstacao write SetEstacao;
    property FormatoData : string read FFormatoData write SetFormatoData;
    property NumeroMonitor : integer read FNumeroMonitor write SetNumeroMonitor;
    property Usuario : TUsuario read FUsuario write SetUsuario;
    property idEstacao : integer read FidEstacao write SetidEstacao;
    property TipoEstacao : TTipoEstacao read FTipoEstacao write SetTipoEstacao;
    property TipoVenda : TTipoVenda read FTipoVenda write SetTipoVenda;
  end;

var
  dmCaixa: TdmCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  USplash, uPrincipal, uMensagem, frmBobinaECF, uSenha, uFuncoes, pcnConversaoNFe, uGerarNFE;

{$R *.dfm}

{ TdmCaixa }

procedure TdmCaixa.AbreDataSets;
var
  flCriouSplash : boolean;
begin
//  BuscaAtualizacaoDeDados;
  flCriouSplash := False;
  if not Assigned(frmSplash) then
  begin
    frmSplash := TfrmSplash.Create(frmPrincipal);
    frmSplash.ShowModal;
    flCriouSplash := True;
  end;

  flAtualizaDados := true;
  frmSplash.AtualizaStatus('Abrindo tabela de promoções de produtos...');
  frmSplash.pbSplash.Position := 0;

  cdsProdutoPromocoes.Close;
  qryProdutoPromocoes.Close;
  qryProdutoPromocoes.ParamByName('idEmpresa').Value := Estacao.idEmpresa;
  qryProdutoPromocoes.Open;
  frmSplash.pbSplash.Position := 0;
  frmSplash.pbSplash.Max := qryProdutoPromocoes.RecordCount;
  cdsProdutoPromocoes.ProviderName := 'dspProdutoPromocoes';
  cdsProdutoPromocoes.FetchOnDemand := True;
  cdsProdutoPromocoes.PacketRecords := 1;
  cdsProdutoPromocoes.Open;
  while cdsProdutoPromocoes.GetNextPacket > 0 do
    frmSplash.pbSplash.Position := cdsProdutoPromocoes.RecordCount;

  //*** Salvo a ultima versão
  cdsProdutoPromocoes.SaveToFile(FDiretorioDadosOFFLine + 'tabela4.bar');
  qryProdutoPromocoes.Close;


  if (Not CarregaViewProdutosOffLine) or (flAtualizaDados) then
  begin
    //*** Existe atualização, então tenho que pegar no banco de dados
    cdsviewProdutosListaPreco.Close;
    qryviewProdutosListaPreco.Close;
    qryviewProdutosListaPreco.SQL.Text := 'select * from viewProdutosListaPreco with (nolock) where idEmpresa = ' + IntToStr(Estacao.idEmpresa) +
      ' and idTipo = 1 and idListaPreco = ' + Estacao.Caixa.idListaPreco.ToString;
    qryviewProdutosListaPreco.Open;
    frmSplash.pbSplash.Position := 0;
    frmSplash.pbSplash.Max := qryviewProdutosListaPreco.RecordCount;
    cdsviewProdutosListaPreco.ProviderName := 'dspViewProdutosListaPreco';
    cdsviewProdutosListaPreco.FetchOnDemand := True;
    cdsviewProdutosListaPreco.PacketRecords := 1;
    cdsviewProdutosListaPreco.Open;
    while cdsviewProdutosListaPreco.GetNextPacket > 0 do
      frmSplash.pbSplash.Position := cdsviewProdutosListaPreco.RecordCount;

    //*** Salvo a ultima versão
    cdsviewProdutosListaPreco.SaveToFile(FDiretorioDadosOFFLine + 'tabela1.bar');
    qryviewProdutosListaPreco.Close;
  end;


  frmSplash.AtualizaStatus('Abrindo tabela de produtos relacionados...');
  frmSplash.pbSplash.Position := 0;
  if (Not CarregaViewProdutosRelacionadosOffLine) or (flAtualizaDados) then
  begin
    //*** Existe atualização, então tenho que pegar no banco de dados
    cdsviewProdutosRelacionadosListaPreco.Close;
    qryviewProdutosRelacionadosListaPreco.Close;
    qryviewProdutosRelacionadosListaPreco.SQL.Text := 'select * from viewProdutosRelacionadosListaPreco with (nolock) ' +
      'where idEmpresa = ' + IntToStr(Estacao.idEmpresa) + ' and idListaPreco = ' + IntToStr(Estacao.Caixa.idListaPreco);
    qryviewProdutosRelacionadosListaPreco.Open;
    cdsviewProdutosRelacionadosListaPreco.Close;
    frmSplash.pbSplash.Max := qryviewProdutosRelacionadosListaPreco.RecordCount;
    cdsviewProdutosRelacionadosListaPreco.FetchOnDemand := True;
    cdsviewProdutosRelacionadosListaPreco.PacketRecords := 1;
    cdsviewProdutosRelacionadosListaPreco.ProviderName := 'dspviewProdutosRelacionadosListaPreco';
    cdsviewProdutosRelacionadosListaPreco.Open;
    while cdsviewProdutosRelacionadosListaPreco.GetNextPacket > 0 do
      frmSplash.pbSplash.Position := cdsviewProdutosRelacionadosListaPreco.RecordCount;

    //*** Salvo a ultima versão
    try
      cdsviewProdutosRelacionadosListaPreco.SaveToFile(FDiretorioDadosOFFLine + 'tabela2.bar');
    finally
      //*** Marco as tabelas dos produtos como atualizada
      with TFDQuery.Create(Self) do
      begin
        Connection := dmCaixa.dbTotalFastFood;

        SQL.Text := 'update [Configuracoes].[EmpresaTabelas] set DataAtualizacao = ' +
          QuotedStr(FormatDateTime(FormatoData + ' hh:mm:ss', Now)) + ', idUsuario = ' + IntToStr(Usuario.ID) +
          ' where (idEmpresa = ' + IntToStr(Estacao.idEmpresa) +') and idEstacao = ' + IntToStr(Estacao.ID)  +
          ' and (idTabela in (select idTabela from Configuracoes.Tabelas where (descricao like ' +
          QuotedStr('%Produtos%') + '))) and (DataAtualizacao is null) ';
        Execute;

        Free;
      end;
    end;
  end;
  qryviewProdutosRelacionadosListaPreco.Close;

  frmSplash.AtualizaStatus('Abrindo tabela de produtos composição emitir ticket...');
  frmSplash.pbSplash.Position := 0;
  if (Not CarregaViewProdutosRelacionadosOffLine) or (flAtualizaDados) then
  begin
    //*** Existe atualização, então tenho que pegar no banco de dados
    cdsProdutosComposicaoTicketFracionado.Close;
    qryProdutosComposicaoTicketFracionado.Close;
    qryProdutosComposicaoTicketFracionado.SQL.Text :=
      'SELECT idProduto, DescricaoProdutoComposicao, Qtde, ' +
      ' EmitirTicket,EmitirTicketFracionado FROM viewProdutoComposicao with (nolock) where EmitirTicket = 1 ' +
      ' and idProduto in (select idProduto from Vendas.EmpresaProdutos where idEmpresa =  ' + IntToStr(Estacao.idEmpresa) + ' )';
//    qryProdutosComposicaoTicketFracionado.Open;
    frmSplash.pbSplash.Max := qryProdutosComposicaoTicketFracionado.RecordCount;
    cdsProdutosComposicaoTicketFracionado.FetchOnDemand := True;
    cdsProdutosComposicaoTicketFracionado.PacketRecords := 1;
    cdsProdutosComposicaoTicketFracionado.ProviderName := 'dspProdutosComposicaoTicketFracionado';
    cdsProdutosComposicaoTicketFracionado.Open;

    while cdsProdutosComposicaoTicketFracionado.GetNextPacket > 0 do
      frmSplash.pbSplash.Position := cdsProdutosComposicaoTicketFracionado.RecordCount;

    //*** Salvo a ultima versão
    try
      cdsProdutosComposicaoTicketFracionado.SaveToFile(FDiretorioDadosOFFLine + 'tabela3.bar');
    finally
      //*** Marco as tabelas dos produtos como atualizada
      with TFDQuery.Create(Self) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        SQL.Text := 'update [Configuracoes].[EmpresaTabelas] set DataAtualizacao = ' +
          QuotedStr(FormatDateTime(FormatoData + ' hh:mm:ss', Now)) + ', idUsuario = ' + IntToStr(Usuario.ID) +
          ' where (idEmpresa = ' + IntToStr(Estacao.idEmpresa) +') and idEstacao = ' + IntToStr(Estacao.ID)  +
          ' and (idTabela in (select idTabela from Configuracoes.Tabelas where (descricao like ' +
          QuotedStr('%Produtos%') + '))) and (DataAtualizacao is null) ';
        Execute;

        Free;
      end;
    end;
  end;

  qryProdutosComposicaoTicketFracionado.Close;

  if Estacao.Caixa.TipoEstacao = teCallCenter then
  begin
    frmSplash.AtualizaStatus('Abrindo tabela de endereços...');
    frmSplash.pbSplash.Position := 0;
    if (Not CarregaViewProdutosRelacionadosOffLine) or (flAtualizaDados) then
    begin
      //*** Existe atualização, então tenho que pegar no banco de dados
      cdsEnderecos.Close;
      qryEnderecos.Close;
      qryEnderecos.Open;
      frmSplash.pbSplash.Max := qryEnderecos.RecordCount;
      cdsEnderecos.FetchOnDemand := True;
      cdsEnderecos.PacketRecords := 1;
      cdsEnderecos.ProviderName := 'dspEnderecos';
      cdsEnderecos.Open;

      while cdsEnderecos.GetNextPacket > 0 do
        frmSplash.pbSplash.Position := cdsEnderecos.RecordCount;

      //*** Salvo a ultima versão
      try
        cdsEnderecos.SaveToFile(FDiretorioDadosOFFLine + 'tabela5.bar');
      finally
        //*** Marco as tabelas dos produtos como atualizada
        with TFDQuery.Create(Self) do
        begin
          Connection := dmCaixa.dbTotalFastFood;
          SQL.Text := 'update [Configuracoes].[EmpresaTabelas] set DataAtualizacao = ' +
            QuotedStr(FormatDateTime(FormatoData + ' hh:mm:ss', Now)) + ', idUsuario = ' + IntToStr(Usuario.ID) +
            ' where (idEmpresa = ' + IntToStr(Estacao.idEmpresa) +') and idEstacao = ' + IntToStr(Estacao.ID)  +
            ' and (idTabela in (select idTabela from Configuracoes.Tabelas where (descricao like ' +
            QuotedStr('%Produtos%') + '))) and (DataAtualizacao is null) ';
          Execute;

          Free;
        end;
      end;
    end;

    qryEnderecos.Close;
  end;

  with cdsProdutoObservacoes do
  begin
    Close;
    Open;
  end;

{  with qryGarcons do
  begin
    Close;
    ParamByName('idEmpresa').value := Estacao.idEmpresa;
    cdsGarcons.Open;
    Close;
  end;
}
  if flCriouSplash then
  begin
    frmSplash.Close;
    FreeAndNil(frmSplash);
  end;
end;

procedure TdmCaixa.AtualizaQueryItens(Const AidCaixa, AidConta, AidItem : integer);
begin
  try
    with qryItens do
    begin
      Close;
      SQL.Text := 'select * from viewItens where idEmpresa =  ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
                  ' and idCaixa = ' + IntToStr(AidCaixa) +
                  ' and idConta = ' + IntToStr(AidConta) +
                  ' and (idItemPai is null)';
      if Aiditem > 0 then
        SQL.Text := SQL.Text + ' and idItem = ' + IntToStr(AidItem);

      SQL.Text := SQL.Text + ' order by NumeroOrdem desc';
      Open;
    end;
  except
    on e : Exception do
      raise Exception.Create ('Função AtualizaQueryItens. ' + sLineBreak + qryItens.SQL.Text + sLineBreak + e.Message);
  end;
end;

procedure TdmCaixa.ACBrNFe1GerarLog(const ALogLine: string;
  var Tratado: Boolean);
begin

  fBobinaECF.AtualizaBobina('Mensagem da NFC-e - ' + ALogLine);
end;

procedure TdmCaixa.ACBrNFe1TransmitError(const HttpError,
  InternalError: Integer; const URL, DadosEnviados, SoapAction: string;
  var Retentar, Tratado: Boolean);
begin
  fBobinaECF.AtualizaBobina('Erro transmitindo NFC-e --> erro de retotrno - ' + HttpError.ToString);
end;

procedure TdmCaixa.AtualizaHistoricoConta(const AidConta: integer; Const AStatus : TStatusConta; Const AidUsuario : integer; Const ADataHora : TDateTime = 0);
var
  DataHoraHistorico : TDateTime;
begin
  try
    if ADataHora > 0 then
      DataHoraHistorico := ADataHora
    else
      DataHoraHistorico := Now;

    Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ContaHistorico', ['idEmpresa', 'idCaixa', 'idConta', 'idUsuario', 'DataHora', 'Status'],
     [Estacao.idEmpresa, Estacao.Caixa.idCaixa, AidConta, AidUsuario, DataHoraHistorico, Integer(AStatus)]);
  except
    on e : exception do
      raise exception.Create('Erro inserindo histórico da conta.' + slinebreak + e.message + sLineBreak +
        Format('Empresa --> %d, Caixa --> %d, Conta --> %d, Usuario --> %d, Status --> %d',
          [Estacao.idEmpresa, Estacao.Caixa.idCaixa, AidConta, AidUsuario, Integer(AStatus)]));
  end;
end;

procedure TdmCaixa.AtualizaPainelItens(APainel : TScrollBox; Const AidEmpresa, AidCaixa, AidConta : integer;
      Const AAdicionarClick, AExcluirClick, AItemClick, ARetirarClick, ATamanhoClick  : TItemEvento; Const Visualizacao : boolean = False);
var
  i, j, indexPanel: integer;
  AItens          : array of TItem;
  ComboAnterior   : integer;
  ProdutoAuxiliar : TProduto;
  AItemFilho      : TItem;
  TemFilhos,
  TemObservacao,
  TemObservacaoManual : boolean;
begin
  try
    LimpaPainelItens(APainel);

    APainel.Visible := False;

    with qryItens do
    begin
      Close;
      Open;

      //*** Primeiro seto a quantidade de itens = 0
      SetLength(AItens, 0);

      i := 0;

      //*** Agora sim, insiro os itens...
      First;
      while not eof do
      begin
        ComboAnterior := 0;
        indexPanel    := -1;

        //*** Só cria ítens dos produtos que não tem adicionais ou combos
        if (FieldByName('IDItemPai').IsNull) then
        begin
          //*** Verifico se tem Observacoes
          dmCaixa.qryAuxiliar.Close;
          dmCaixa.qryAuxiliar.SQL.Text := format('select * from Vendas.ItemObservacoes where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
            [AidEmpresa, AidCaixa, AIDConta, FieldByName('idItem').AsInteger]);
          dmCaixa.qryAuxiliar.Open;
          TemObservacao := dmCaixa.qryAuxiliar.RecordCount > 0;
          dmCaixa.qryAuxiliar.Close;

          //*** Verifico se tem Observacoes Manuais
          dmCaixa.qryAuxiliar.Close;
          dmCaixa.qryAuxiliar.SQL.Text := format('select * from Vendas.ItemObservacoesManuais where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
            [AidEmpresa, AidCaixa, AIDConta, FieldByName('idItem').AsInteger]);
          dmCaixa.qryAuxiliar.Open;
          TemObservacaoManual := dmCaixa.qryAuxiliar.RecordCount > 0;
          dmCaixa.qryAuxiliar.Close;

          //*** Verifico se tem filhos.
          dmCaixa.qryAuxiliar.Close;
          dmCaixa.qryAuxiliar.SQL.Text := format('with a as( ' +
            'select i.*, (select numeroordem from produtos.ProdutoTiposRelacionamento ' +
            'where idproduto = i.idItemPai and idTipoRelacionamento = i.IDTIPORELACIONAMENTO) NumeroOrdemRelacionamento ' +
            'from viewItens i where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d ' +
            ') ' +
            'select * from a order by NumeroOrdemRelacionamento asc',
            [AidEmpresa, AidCaixa, AIDConta, FieldByName('idItem').AsInteger]);

          dmCaixa.qryAuxiliar.Open;

          TemFilhos := dmCaixa.qryAuxiliar.RecordCount > 0;

          //*** Primeiro procuro para saber se já não existe um mesmo produto na lista, se não for combo
          if (Not (FieldByName('flCombo').AsBoolean)) and (Not FieldByName('QuantidadeFracionada').AsBoolean) and (Not TemFilhos)
            and ((Not TemObservacao) and (Not TemObservacaoManual)) then
//          if Not (FieldByName('flCombo').AsBoolean) and (dmCaixa.qryAuxiliar.RecordCount<=0) then
          begin
            if i > 0 then
            begin
              for j := 0 to i -1 do
              begin
                if (AItens[j].Produto.idProduto = FieldByName('idProduto').AsInteger) and (AItens[j].Tipo <> tiObservacao) and
                 (AItens[j].NumeroObservacoes <= 0) and (AItens[j].NumeroFilhos <= 0) then
                begin
                  indexPanel := j;
                  Break;
                end
              end;
            end;
          end;

          if indexPanel >= 0 then
          begin
            ProdutoAuxiliar := AItens[indexPanel].Produto;
            ProdutoAuxiliar.Qtde := ProdutoAuxiliar.Qtde + FieldByName('qtde').AsFloat;
            AItens[indexPanel].Produto := ProdutoAuxiliar;
          end
          else
          begin
            SetLength(AItens, i + 1);
            AItens[i] := TItem.CriaItem (APainel, tiNormal,
              StringToColor(Trim(FieldByName('Cor').AsString)),
              StringToColor(Trim(FieldByName('CorFonte').AsString)),
              StringToColor(Trim(FieldByName('CorValorFonte').AsString)),
              FieldByName('ImprimirPedido').AsBoolean and FieldByName('DataHoraImpressao').IsNull);
            with AItens[i] do
            begin
              IDItemPai:= 0;
              IDConta  := AidConta;
              IDItem   := FieldByName('idItem').AsInteger;
              IDPedido := FieldByName('IDPedido').AsInteger;

              if FieldByName('idMesaOrigem').IsNull then
                idMesaOrigem := -1
              else
                idMesaOrigem := FieldByName('idMesaOrigem').AsInteger;

              ProdutoAuxiliar.idProduto := FieldByName('idProduto').AsInteger;
              ProdutoAuxiliar.idSubGrupo := FieldByName('idSubGrupo').AsInteger;
              ProdutoAuxiliar.cdProduto := FieldByName('cdProduto').AsInteger;
              ProdutoAuxiliar.AliquotaICMS := FieldByName('AliquotaICMS').AsFloat;
              ProdutoAuxiliar.Descricao := FieldByName('Descricao').AsString;
              ProdutoAuxiliar.DescricaoReduzida := FieldByName('DescricaoReduzida').AsString;
              ProdutoAuxiliar.idTipoRelacionamento := FieldByName('idTipoRelacionamento').AsInteger;
              ProdutoAuxiliar.ImprimirPedido := FieldByName('ImprimirPedido').AsBoolean;
              ProdutoAuxiliar.SomenteCombo := FieldByName('SomenteCombo').AsBoolean;
              ProdutoAuxiliar.QuantidadeFracionada := FieldByName('QuantidadeFracionada').AsBoolean;
              ProdutoAuxiliar.LeQtdeBalanca  := FieldByName('LeQtdeBalanca').AsBoolean;
              ProdutoAuxiliar.DescricaoImpressora := FieldByName('DescricaoImpressora').AsString;
              ProdutoAuxiliar.FilaImpressao := FieldByName('FilaImpressao').AsString;
              ProdutoAuxiliar.ModeloImpressora := FieldByName('idTipoImpressora').AsInteger;
              ProdutoAuxiliar.NumeroColunas := FieldByName('NumeroColunas').AsInteger;
              ProdutoAuxiliar.NumeroColunasCondensado := FieldByName('NumeroColunasCondensado').AsInteger;

              if not Visualizacao then
              begin
                onAdicionar := AAdicionarClick;
                onExcluir   := AExcluirClick;
                onRetirar   := ARetirarClick;
                onTamanho   := ATamanhoClick;
              end;

              ProdutoAuxiliar.Qtde  := FieldByName('Qtde').AsFloat;

              Combo := FieldByName('flCombo').AsBoolean;

              ProdutoAuxiliar.Valor := FieldByName('vlProduto').AsFloat;
              ProdutoAuxiliar.ValorUnitario := FieldByName('vlUnitario').AsFloat;
              ProdutoAuxiliar.ValorUnitarioCombo := FieldByName('vlUnitarioCombo').AsFloat;
              ProdutoAuxiliar.ValorTotalCombo := FieldByName('vlTotalCombo').AsFloat;

              ProdutoAuxiliar.ExisteRelacionamentoObservacaoCupom := FieldByName('ExisteRelacionamentosObservacoesCupons').AsBoolean;

              Produto := ProdutoAuxiliar;

              if Produto.idTipoRelacionamento > 0 then
              begin
                TPanel(FindComponent(AItens[i].Name + 'btnAdicionarItem')).Visible := False;
                TPanel(FindComponent(AItens[i].Name + 'btnExcluirItem')).Visible   := False;
                TPanel(FindComponent(AItens[i].Name + 'btnRetirarItem')).Visible   := False;
              end
              else if (Produto.idTipoRelacionamento = -1) and (TemFilhos or TemObservacao) then
                  TPanel(FindComponent(AItens[i].Name + 'btnTamanhoItem')).Visible := True
              else if (Produto.idTipoRelacionamento = -1) and (not TemFilhos) and (not TemObservacao) then
              begin
                if (Produto.Qtde > 1) and (Trunc(Produto.Qtde) = Produto.Qtde) then
                  TPanel(FindComponent(AItens[i].Name + 'btnRetirarItem')).Visible := True;
              end;

              Parent       := APainel;
              Ctl3D        := False;
              tag          := i;

              if not Visualizacao then
              begin
                onAdicionar  := AAdicionarClick;
                onExcluir    := AExcluirClick;
                onItemClick  := AItemClick;
                onRetirar    := ARetirarClick;
                onTamanho    := ATamanhoClick;
              end;

              //*** Procuro por "filhos"
              with dmCaixa.qryAuxiliar do
              begin
                if not dmCaixa.qryAuxiliar.Fields.Fields[0].IsNull then
                begin
                  dmCaixa.qryAuxiliar.First;
                  while Not dmCaixa.qryAuxiliar.EOF do
                  begin
                    AItemFilho := TItem.CriaItem (AItens[i], tiCombo,
                    StringToColor(Trim(dmCaixa.qryAuxiliar.FieldByName('Cor').AsString)),
                    StringToColor(Trim(dmCaixa.qryAuxiliar.FieldByName('CorFonte').AsString)),
                    StringToColor(Trim(dmCaixa.qryAuxiliar.FieldByName('CorValorFonte').AsString)),
                    FieldByName('ImprimirPedido').AsBoolean and FieldByName('DataHoraImpressao').IsNull);

                    with AItemFilho do
                    begin
                      Top := AItens[i].Height;
                      AItens[i].Height := AItens[i].Height + 36;
                      IDItemPai := AItens[i].IDItem;
                      IDConta := AidConta;
                      IDItem := dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger;
                      IDPedido := FieldByName('IDPedido').AsInteger;
                      ProdutoAuxiliar.idProduto := dmCaixa.qryAuxiliar.FieldByName('idProduto').AsInteger;
                      ProdutoAuxiliar.idSubGrupo := dmCaixa.qryAuxiliar.FieldByName('idSubGrupo').AsInteger;
                      ProdutoAuxiliar.cdProduto := dmCaixa.qryAuxiliar.FieldByName('cdProduto').AsInteger;
                      ProdutoAuxiliar.AliquotaICMS := dmCaixa.qryAuxiliar.FieldByName('AliquotaICMS').AsFloat;
                      ProdutoAuxiliar.idTipoRelacionamento := dmCaixa.qryAuxiliar.FieldByName('idTipoRelacionamento').AsInteger;
                      ProdutoAuxiliar.ParteDoCombo := dmCaixa.qryAuxiliar.FieldByName('ParteDoCombo').AsBoolean;
                      ProdutoAuxiliar.FormacaoDePreco := dmCaixa.qryAuxiliar.FieldByName('FormacaoDePreco').AsBoolean;

                      ProdutoAuxiliar.Descricao := dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString;
                      ProdutoAuxiliar.DescricaoReduzida := dmCaixa.qryAuxiliar.FieldByName('DescricaoReduzida').AsString;

                      ProdutoAuxiliar.Qtde  := dmCaixa.qryAuxiliar.FieldByName('Qtde').AsFloat;
                      ProdutoAuxiliar.Valor := dmCaixa.qryAuxiliar.FieldByName('vlProduto').AsFloat;
                      ProdutoAuxiliar.ImprimirPedido := dmCaixa.qryAuxiliar.FieldByName('ImprimirPedido').AsBoolean;
                      ProdutoAuxiliar.DescricaoImpressora := dmCaixa.qryAuxiliar.FieldByName('DescricaoImpressora').AsString;
                      ProdutoAuxiliar.FilaImpressao := dmCaixa.qryAuxiliar.FieldByName('FilaImpressao').AsString;
                      ProdutoAuxiliar.ModeloImpressora := dmCaixa.qryAuxiliar.FieldByName('idTipoImpressora').AsInteger;
                      ProdutoAuxiliar.NumeroColunas := dmCaixa.qryAuxiliar.FieldByName('NumeroColunas').AsInteger;
                      ProdutoAuxiliar.NumeroColunasCondensado := dmCaixa.qryAuxiliar.FieldByName('NumeroColunasCondensado').AsInteger;
                      Produto := ProdutoAuxiliar;
                      Combo := dmCaixa.qryAuxiliar.FieldByName('flCombo').AsBoolean;

                      Parent       := AItens[i];
                      Ctl3D        := False;
                      tag          := i;

                      if not Visualizacao then
                      begin
                        onAdicionar  := AAdicionarClick;
                        onExcluir    := AExcluirClick;
                        onItemClick  := AItemClick;
                        onRetirar    := ARetirarClick;
                        onTamanho    := ATamanhoClick;
                      end;

                      Inc(AItens[i].NumeroFilhos);
                    end;
                    Next;
                  end;
                  AItens[i].AtualizaValorTotal;
                  AItens[i].Height := AItens[i].Height + 05;
                end;

                //*** Observações
                dmCaixa.qryAuxiliar.Close;
                SQL.Text := format('select * from [dbo].[viewItemObservacoes] where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d ',
                  [AidEmpresa, AidCaixa, AIDConta, AItens[i].idItem]);
                dmCaixa.qryAuxiliar.Open;
                TemObservacao := dmCaixa.qryAuxiliar.RecordCount > 0;
                if TemObservacao then
                begin
                  dmCaixa.qryAuxiliar.First;
                  while Not dmCaixa.qryAuxiliar.Eof do
                  begin
                    AItemFilho := TItem.CriaItem (AItens[i], tiObservacao, clRed, clWhite, clWhite, True);
                    with AItemFilho do
                    begin
                      Top := AItens[i].Height;
                      AItens[i].Height := AItens[i].Height + 36;
                      IDItemPai := AItens[i].IDItem;
                      IDConta := AidConta;
                      IDItem := dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger;
                      IDPedido  := FieldByName('IDPedido').AsInteger;
                      ProdutoAuxiliar := Produto;
                      ProdutoAuxiliar.idProduto := dmCaixa.qryAuxiliar.FieldByName('idObservacao').AsInteger;
                      ProdutoAuxiliar.Descricao := dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString;
                      ProdutoAuxiliar.DescricaoReduzida := dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString;
                      ProdutoAuxiliar.DescricaoImpressora := dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString;
                      ProdutoAuxiliar.idTipoRelacionamento := -2;

                      Produto := ProdutoAuxiliar;
                      Parent       := AItens[i];
                      Ctl3D        := False;
                      tag          := i;

                      if not Visualizacao then
                      begin
                        onExcluir    := AExcluirClick;
                        onItemClick  := AItemClick;
                      end;

                      Inc(AItens[i].NumeroObservacoes);
                    end;

                    dmCaixa.qryAuxiliar.Next;
                  end;
                  AItens[i].Height := AItens[i].Height + 5;
                end;
                dmCaixa.qryAuxiliar.Close;

                //*** Observações Manuais
                dmCaixa.qryAuxiliar.Close;
                SQL.Text := format('select * from Vendas.ItemObservacoesManuais where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d ',
                  [AidEmpresa, AidCaixa, AIDConta, AItens[i].idItem]);
                dmCaixa.qryAuxiliar.Open;
                TemObservacao := dmCaixa.qryAuxiliar.RecordCount > 0;
                if TemObservacao then
                begin
                  if trim(FieldByName('Observacao1').AsString) <> '' then
                  begin
                    AItemFilho := TItem.CriaItem (AItens[i], tiObservacaoManual, clGray, clWhite, clWhite, True);
                    with AItemFilho do
                    begin
                      Top := AItens[i].Height;
                      AItens[i].Height := AItens[i].Height + 36;
                      IDItemPai := AItens[i].IDItem;
                      IDConta := AidConta;
                      IDItem := dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger;
                      IDPedido  := FieldByName('IDPedido').AsInteger;
                      ProdutoAuxiliar := Produto;
                      ProdutoAuxiliar.idProduto := 1;
                      ProdutoAuxiliar.Descricao := dmCaixa.qryAuxiliar.FieldByName('Observacao1').AsString;
                      ProdutoAuxiliar.DescricaoReduzida := dmCaixa.qryAuxiliar.FieldByName('Observacao1').AsString;
                      ProdutoAuxiliar.DescricaoImpressora := dmCaixa.qryAuxiliar.FieldByName('Observacao1').AsString;
                      ProdutoAuxiliar.idTipoRelacionamento := -3;

                      Produto := ProdutoAuxiliar;
                      Parent       := AItens[i];
                      Ctl3D        := False;
                      tag          := i;

                      if not Visualizacao then
                      begin
                        onExcluir    := AExcluirClick;
                        onItemClick  := AItemClick;
                      end;

                      Inc(AItens[i].NumeroObservacoes);
                    end;
                  end;

                  if trim(FieldByName('Observacao2').AsString) <> '' then
                  begin
                    AItemFilho := TItem.CriaItem (AItens[i], tiObservacaoManual, clGray, clWhite, clWhite, True);
                    with AItemFilho do
                    begin
                      Top := AItens[i].Height;
                      AItens[i].Height := AItens[i].Height + 36;
                      IDItemPai := AItens[i].IDItem;
                      IDConta := AidConta;
                      IDItem := dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger;
                      ProdutoAuxiliar := Produto;
                      ProdutoAuxiliar.idProduto := 2;
                      ProdutoAuxiliar.Descricao := dmCaixa.qryAuxiliar.FieldByName('Observacao2').AsString;
                      ProdutoAuxiliar.DescricaoReduzida := dmCaixa.qryAuxiliar.FieldByName('Observacao2').AsString;
                      ProdutoAuxiliar.DescricaoImpressora := dmCaixa.qryAuxiliar.FieldByName('Observacao2').AsString;
                      ProdutoAuxiliar.idTipoRelacionamento := -3;

                      Produto := ProdutoAuxiliar;
                      Parent       := AItens[i];
                      Ctl3D        := False;
                      tag          := i;

                      if not Visualizacao then
                      begin
                        onExcluir    := AExcluirClick;
                        onItemClick  := AItemClick;
                      end;

                      Inc(AItens[i].NumeroObservacoes);
                    end;
                  end;
                  AItens[i].Height := AItens[i].Height + 5;
                end;
                dmCaixa.qryAuxiliar.Close;
              end;
              Inc(i);
            end;
          end;
        end;
        Next;
      end;

      Close;
    end;

    OrdenaPainelItens(APainel);
    APainel.Visible := True;
  except
    on e : exception do
      raise Exception.Create('AtualizaPainelItens - ' + sLineBreak + e.Message);
  end;
end;

procedure TdmCaixa.AtualizaPermissoes;
begin
  with qryPermissoes do
  begin
    Close;
    ParamByName('idEmpresa').Value := Estacao.idEmpresa;
    ParamByName('idUsuario').Value := Usuario.ID;
    Open;
  end;
end;


procedure TdmCaixa.AtualizaStatusConta(const AidConta: integer;
  const AStatus: TStatusConta);
begin
  try
    Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
     [Estacao.idEmpresa, Estacao.Caixa.idCaixa, AidConta],
     ['Status', 'idUsuarioAtendimento'], [integer(AStatus), Usuario.ID]);
  except
    on e : exception do
      raise exception.Create('Erro atualizando status da mesa para conferência.' + slinebreak + e.message + sLineBreak +
        Format('Empresa --> %d, Caixa --> %d, Conta --> %d, Usuario --> %s', [Estacao.idEmpresa, Estacao.Caixa.idCaixa, AidConta, Usuario.Nome]));
  end;
end;

procedure TdmCaixa.BuscaAtualizacaoDeDados;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := 'select 1 from Configuracoes.EmpresaTabelas et where et.idTabela in (select idTabela from Configuracoes.Tabelas where (descricao like '
      + QuotedStr('%Produtos%') + ') and (DataAtualizacao is null))';
    Open;

    flAtualizaDados := RecordCount > 0;

    Close;
  end;
end;

function TdmCaixa.CarregaViewProdutosOffLine: boolean;
begin
  result := False;
  cdsviewProdutosListaPreco.Close;
  if FileExists(FDiretorioDadosOFFLine + 'tabela1.bar') then
  begin
    cdsviewProdutosListaPreco.ProviderName := '';
    try
      cdsviewProdutosListaPreco.LoadFromFile(FDiretorioDadosOFFLine + 'tabela1.bar');
      cdsviewProdutosListaPreco.Open;
    finally
      result := True;
    end;
  end;
end;

function TdmCaixa.CarregaViewProdutosRelacionadosOffLine: boolean;
begin
  result := False;
  cdsviewProdutosRelacionadosListaPreco.Close;
  if FileExists(FDiretorioDadosOFFLine + 'tabela2.bar') then
  begin
    cdsviewProdutosRelacionadosListaPreco.ProviderName := '';
    try
      cdsviewProdutosRelacionadosListaPreco.LoadFromFile(FDiretorioDadosOFFLine + 'tabela2.bar');
      cdsviewProdutosRelacionadosListaPreco.Open;
    finally
      result := True;
    end;
  end
  else
end;

procedure TdmCaixa.ConectaAoBancoDeDados;
var
  sAuxiliar : string;
  i : integer;
  estacaoAuxiliar : TEstacao;

  procedure InicializaParametrosBancoDeDados;
  begin
    try
      with dbTotalFastFood do
      begin
        Params.Clear;
        DriverName := 'MSSQL';
        sAuxiliar := frmSplash.AiniFile.ReadString('Banco de Dados', 'InstanciaDoBancoDeDados', '');
        frmPrincipal.SetEnvironmentVariableValue('InstanciaDoBancoDeDados', sAuxiliar);
        Params.Add('Server=' + sAuxiliar);
        sAuxiliar := frmSplash.AiniFile.ReadString('Banco de Dados', 'NomeDoBancoDeDados', '');
        Params.Add('Database=' + sAuxiliar);
        frmPrincipal.SetEnvironmentVariableValue('NomeDoBancoDeDados', sAuxiliar);
        Params.Add('User_name=' + frmSplash.AiniFile.ReadString('Banco de Dados', 'NomeUsuarioSQLServer', ''));
        Params.Add('Password=' + Criptografia(frmSplash.AiniFile.ReadString('Banco de Dados', 'SenhaUsuarioSQLServer', ''), False));
        Params.Add('MARS=YES');
        try
          Connected := True;
        except
          on e : exception do
            raise Exception.Create('Erro tentando conectar ao servidor - ' + sAuxiliar);
        end;

        with qryAuxiliar do
        begin
          Close;
          SQL.Text := 'select	s.date_format from sys.dm_exec_sessions s where	s.session_id = @@SPID ';
          Open;

          FFormatoData := '';
          if not FieldByName('date_format').IsNull then
          begin
            if Trim(FieldByName('date_format').AsString) <> '' then
            begin
              sAuxiliar := FieldByName('date_format').AsString;
              if Length(sAuxiliar) <> 3 then
                raise Exception.Create('O formato da data não foi lido corretamento no banco de dados.');

              case UpCase(sAuxiliar[1]) of
                'D' : FFormatoData := 'dd/';
                'M' : FFormatoData := 'mm/';
                'Y' : FFormatoData := 'yy/';
              end;
              case UpCase(sAuxiliar[2]) of
                'D' : FFormatoData := FFormatoData + 'dd/';
                'M' : FFormatoData := FFormatoData + 'mm/';
                'Y' : FFormatoData := FFormatoData + 'yy/';
              end;
              case UpCase(sAuxiliar[3]) of
                'D' : FFormatoData := FFormatoData + 'dd';
                'M' : FFormatoData := FFormatoData + 'mm';
                'Y' : FFormatoData := FFormatoData + 'yy';
              end;
            end;
            Close;
          end;
        end;

//        SetFormatoData(iFile.ReadString('Banco de Dados', 'FormatoData', 'dd/mm/yy'));
        SetDiretorioDadosOFFLine(frmSplash.AiniFile.ReadString('Banco de Dados', 'DiretorioTemporario', 'c:\temp'));
        SetArquivoMensagens(frmSplash.AiniFile.ReadString('Banco de Dados', 'ArquivoMensagens', 'mensagens.ini'));

        NomeImpressoraINI := frmSplash.AiniFile.ReadString('Banco de Dados', 'NomeImpressora', '');
        FilaImpressaoINI := frmSplash.AiniFile.ReadString('Banco de Dados', 'FilaImpressao', '');
        NumeroColunasINI := frmSplash.AiniFile.ReadInteger('Banco de Dados', 'NumeroColunas', 0);
        LinhasEntreCuponsINI := frmSplash.AiniFile.ReadInteger('Banco de Dados', 'LinhasEntreCupons', 0);
        ModeloImpressoraINI := frmSplash.AiniFile.ReadString('Banco de Dados', 'ModeloImpressora', '');
        ArquivoDANFEINI := frmSplash.AiniFile.ReadString('Banco de Dados', 'ArquivoDanfe', 'DANFeNFCe5_00.fr3');

        DiretorioNFE := frmSplash.AiniFile.ReadString('Monitor NFE', 'DiretorioNFE', '');
        CaminhoCertificado  := frmSplash.AiniFile.ReadString('Monitor NFE', 'CaminhoDoCertificado ', '');

        ModeloImpressoraINI := frmSplash.AiniFile.ReadString('Banco de Dados', 'ModeloImpressora', '');
        idEstacao := frmSplash.AiniFile.ReadInteger('Banco de Dados', 'ID', 0);
        TipoEstacao := TTipoEstacao(frmSplash.AiniFile.ReadInteger('Banco de Dados', 'TipoEstacao', 0));
        SetArquivoLogo(frmSplash.AiniFile.ReadString('Banco de Dados', 'ArquivoLogo', ''));
        i := frmSplash.AiniFile.ReadInteger('Banco de Dados', 'Monitor', 0);
        SetNumeroMonitor(i);
      end;
    except
      on e: exception do
        raise exception.Create('Erro carregando parametros da conexao = ' + e.Message);
    end;
  end;
begin
  InicializaParametrosBancoDeDados;
  dbTotalFastFood.Open;
end;

procedure TdmCaixa.DataModuleCreate(Sender: TObject);
var
  uAuxiliar : TUsuario;
  eAuxiliar : TEstacao;
begin
  with eAuxiliar do
  begin
    ID := 0;
    idEmpresa := 0;
    Caixa.idCaixa := -1;
    Caixa.idSessaoCaixa := -1;
    Caixa.idListaPreco := 0;
    Caixa.TipoEstacao := teNenhum;
    Dados.Descricao := '';
    Caixa.Identificacao := '';
    IPLocal := '';
    IPVPN := '';
    Impressora.ModeloImpressora := ppTexto;
    Impressora.FilaImpressao := '';
    Impressora.LinhasEntreCupons := 0;
    ConfiguracoesDaVenda.SenhaSequencial := False;
    ConfiguracoesDaVenda.SenhaManual := False;
    Faturamento.TipoAmbiente := taProducao;
  end;

  SetEstacao(eAuxiliar);

  with uAuxiliar do
  begin
    ID := 0;
    Nome := '';
    TransferirMesa := False;
    EstornarItem := False;
    EstornarVenda := False;
  end;

  SetUsuario(uAuxiliar);

  FNumeroMonitor := 0;
end;

procedure TdmCaixa.DataModuleDestroy(Sender: TObject);
begin
  dbTotalFastFood.Connected := False;
end;

function TdmCaixa.ExisteID(const query: string): integer;
begin
  result := -1;

  try
    with qryAuxiliar do
    begin
      Close;
      SQL.Text := query;
      try
        Open;
      except
        on e : exception do
          raise Exception.Create('Erro buscando a existência do campo. ' +  #10#13 + SQL.Text + #10#13 + e.Message);
      end;
      if not Fields.Fields[0].IsNull then
        result := Fields.Fields[0].AsInteger;
      Close;
    end;
  except
    on e : exception do
      raise Exception.Create('DMPrincipal - Existe - Mensagem de erro --> ' + e.Message);
  end;
end;

procedure TdmCaixa.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  fBobinaECF.AtualizaBobina('Outras informações: ' + AStatusText);
  Application.ProcessMessages;
end;

//procedure TdmCaixa.ImprimeConferencia(AidConta: integer; idMesaCartaoSenha : integer; NomeGarcom : string; NomeGarconConferencia : string; idPessoaDelivery : integer);
//var
//  ValorPedido : Double;
//  qryImprimeConferencia : TFDQuery;
//begin
//  if Estacao.ImprimirCupomTotalizado then
//    qryImprimeConferencia := qryConferenciaTotalizado
//  else
//    qryImprimeConferencia := qryConferencia;
//
//  with qryImprimeConferencia, frmPrincipal.impressora do
//  begin
//    Close;
//    ParamByName('idEmpresa').Value     := dmCaixa.Estacao.idEmpresa;
//    ParamByName('idCaixa').Value       := dmCaixa.Estacao.idCaixa;
//    ParamByName('idConta').Value       := AidConta;
//    Open;
//    if RecordCount > 0 then
//    begin
//      InicializaImpressao(dmCaixa.Estacao.FilaImpressao, dmCaixa.Estacao.NomeImpressora, dmCaixa.Estacao.ModeloImpressora, False,
//        dmCaixa.Estacao.NumeroColunas, dmCaixa.Estacao.NumeroColunasCondensado, 0, 0 ,0);
//
//      ImprimeExpandido(Copy(dmCaixa.Estacao.NomeFantasia, 1, 20));
//      Imprime ('Data    : ' + FormatDateTime('dd/MM/yy hh:NN:ss', Now));
//      Imprime ('Conta   : ' + IntToStr(AidConta));
//      if Trim(NomeGarcom) <> '' then
//        Imprime('Garcom  : ' + Copy(NomeGarcom, 1, NumeroColunas - 10));
//      if Trim(NomeGarconConferencia) <> '' then
//        Imprime('Garcom C: ' + Copy(NomeGarconConferencia, 1, NumeroColunas - 10));
//      ImprimeLinhaEmBranco(1);
//      ImprimeExpandido('CONFERENCIA', True);
//      Imprime(StringOfChar('-', NumeroColunas));
//
//      case TipoVenda of
//        tvVendaBalcao   : ImprimeExpandido('Balcão - ' + IntToStr(idMesaCartaoSenha), True);
//        tvVendaMesa     : ImprimeExpandido('Mesa - ' + IntToStr(idMesaCartaoSenha), True);
//        tvVendaCartao   : ImprimeExpandido('Cartão - ' + IntToStr(idMesaCartaoSenha), True);
//        tvVendaDelivery : ImprimeExpandido('Delivery - ' + IntToStr(idMesaCartaoSenha), True);
//      end;
//
//      Imprime(StringOfChar('-', NumeroColunas));
//
//      if TipoVenda = tvVendaDelivery then
//      begin
//        qryAuxiliar.Close;
//        qryAuxiliar.SQL.Text := 'select * from Contabil.Pessoas where idPessoa = ' + IntToStr(idPessoaDelivery);
//        qryAuxiliar.Open;
//
//        if qryAuxiliar.RecordCount >= 0 then
//        begin
//          ImprimeLinhaEmBranco(1);
//          Imprime('Nome : ' + copy (qryAuxiliar.FieldByName('RazaoSocial').Asstring, 1, 30));
//          Imprime('End. : ' + copy (qryAuxiliar.FieldByName('Logradouro').Asstring, 1, 30));
//          Imprime('Nro. : ' + copy (qryAuxiliar.FieldByName('Numero').Asstring, 1, 5) + ' Bairro : ' + copy (qryAuxiliar.FieldByName('Bairro').Asstring, 1, 20) );
//          Imprime('Compl: ' + copy (qryAuxiliar.FieldByName('Complemento').Asstring, 1, 20));
//          Imprime('Cidad: ' + copy (qryAuxiliar.FieldByName('NomeMunicipio').Asstring, 1, 20));
//          Imprime('Tel1 : ' + copy (qryAuxiliar.FieldByName('Telefone1').Asstring, 1, 20));
//          Imprime('Tel2 : ' + copy (qryAuxiliar.FieldByName('Telefone2').Asstring, 1, 20));
//          Imprime('Tel3 : ' + copy (qryAuxiliar.FieldByName('Telefone3').Asstring, 1, 20));
//          Imprime('Obs. : ' + qryAuxiliar.FieldByName('Observacao').Asstring);
//          ImprimeLinhaEmBranco(1);
//          Imprime(StringOfChar('-', NumeroColunas));
//        end;
//
//        qryAuxiliar.Close;
//      end;
//
//      ImprimeLinhaEmBranco(1);
////             123456789 123456789 123456789 123456789 12
//      Imprime('Descricao            Unit.   Qtde.   Total');
//
//      ValorPedido := 0;
//      while not eof do
//      begin
//        Imprime(LeftPad(Copy(FieldByName('Descricao').AsString, 1, 19), ' ', 19) + ' ' +
//          RightPad(formatfloat('##0.00', FieldByName('ValorUnitario').AsCurrency), ' ', 6) + ' ' +
//          RightPad(formatfloat('##0.000', FieldByName('Qtde').AsCurrency), ' ', 7) + ' ' +
//          RightPad(formatfloat('###0.00', FieldByName('ValorUnitario').AsFloat * FieldByName('Qtde').AsFloat), ' ', 7));
//
//        ValorPedido := ValorPedido + FieldByName('ValorUnitario').AsFloat * FieldByName('Qtde').AsFloat;
//        Next;
//      end;
//
//      Imprime(StringOfChar('-', NumeroColunas));
//      if dmCaixa.Estacao.TaxaServico and (dmCaixa.TipoVenda <> tvVendaBalcao) then
//      begin
//        ImprimeExpandido('Sub-Total ' + RightPad('R$ ' + formatfloat('###,##0.00', ValorPedido), ' ', 11));
//        ImprimeExpandido('+ 10%     ' + RightPad('R$ ' + formatfloat('###,##0.00', ValorPedido*10/100), ' ', 11));
//        ImprimeExpandido('Total     ' + RightPad('R$ ' + formatfloat('###,##0.00', ValorPedido + (ValorPedido*10/100)), ' ', 11));
//      end
//      else
//        ImprimeExpandido('Total     ' + RightPad('R$ ' + formatfloat('###,##0.00', ValorPedido), ' ', 11));
//      Imprime(StringOfChar('-', NumeroColunas));
//
//      ImprimeLinhaEmBranco(2);
//      Imprime(StringOfChar('-', NumeroColunas));
//      ImprimeExpandido('DOCUMENTO NAO FISCAL', True);
//      Imprime(StringOfChar('-', NumeroColunas));
//
//
//      FinalizaImpressao(tcTotal);
//    end;
//
//    Close;
//  end;
//end;

function TdmCaixa.ImprimeFita(Const idCaixaInicial : integer = 0; const idCaixaFinal : integer = 0; const idSessaoCaixa : integer = 0;
  Const flImprimeProdutos : boolean = False; Const flImprimeComprasEmDinheiro: boolean = False; Const flFechamento : boolean = False;
  Const flImprimeEstornos : boolean = True; Const flImprimeColaboradores : boolean = True) : boolean;
var
  slImpressao : TStringList;
  subgrupo : string;
  ValorTotalComissoes,
  ValorGastoTotal,
  ValorVendidoSubGrupo,
  ValorApuradoSubGrupo,
  ValorVendidoTotal,
  ValorDeposito,
  ValorSangria,
  ValorTroco,
  ValorTrocoAnterior,
  ValorApuradoTotal,
  ValorTotalTipoVenda,
  ValorTotalDescontoTipoVenda : Double;
  DataHoraCaixaAbertura : TDateTime;
  idCaixaFita : integer;

  procedure AbreTabelaDosCaixas;
  begin
    dmCaixa.qryAuxiliar.Close;

    if idSessaoCaixa > 0 then
    begin
      dmcaixa.qryauxiliar.sql.text := Format('select sc.*, c.dhAbertura as AberturaCaixa, ee.Descricao from vendas.SessoesCaixa sc ' +
        'inner join Vendas.Caixas c on sc.idCaixa = c.idCaixa ' +
        'inner join Vendas.EmpresaEstacoes ee on sc.idEstacao = ee.idEstacao ' +
        'where sc.idEmpresa = %d and sc.idCaixa = %d and sc.idSessaoCaixa = %d',
        [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa]);
      dmCaixa.qryAuxiliar.Open;
    end
    else if idCaixaFinal = 0 then
    begin
      dmcaixa.qryauxiliar.sql.text := Format('select idCaixa, dhAbertura, vlDeposito, vlTroco from Vendas.Caixas where idEmpresa = %d and idCaixa = %d',
        [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);
      dmCaixa.qryAuxiliar.Open;
      ValorDeposito := dmCaixa.qryAuxiliar.FieldByName('vlDeposito').asFloat;
      ValorTroco    := dmCaixa.qryAuxiliar.FieldByName('vlTroco').asFloat;
    end
    else if idCaixaFinal > 0 then
    begin
      dmcaixa.qryauxiliar.sql.text :=
        Format('select idCaixa, dhAbertura, 1 as TipoCaixa from vendas.caixas where idEmpresa = %d and idCaixa = %d ' +
               'union all ' +
               'select idCaixa, dhAbertura, 2 as TipoCaixa from vendas.caixas where idEmpresa = %d and idCaixa = %d',
               [dmCaixa.Estacao.idEmpresa, idCaixaInicial, dmCaixa.Estacao.idEmpresa, idCaixaFinal]);
      dmCaixa.qryAuxiliar.Open;

      ValorDeposito := 0;
      ValorTroco    := 0;
    end;

    if dmCaixa.qryAuxiliar.RecordCount <= 0 then
      raise Exception.Create('Não foi encontrado este caixa ');

    DataHoraCaixaAbertura    := dmCaixa.qryAuxiliar.FieldByName('dhAbertura').asFloat;
  end;

  procedure InicializaImpressora;
  begin
    frmPrincipal.Impressora.Desativar;
    frmPrincipal.Impressora.ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
    frmPrincipal.Impressora.Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
    frmPrincipal.Impressora.Porta := dmCaixa.Estacao.Impressora.FilaImpressao;

    try
      frmPrincipal.Impressora.Ativar;
    except
      on e : exception do
        raise Exception.Create('Erro comunicando com impressora ' + frmPrincipal.Impressora.Porta +
          ', modelo - ' + IntToStr(Integer(frmPrincipal.Impressora.Modelo)) + sLineBreak + e.Message);
    end;
  end;

  procedure ImprimeCabecalho;
  begin
    //*** Imprimo o cabecalho
    slImpressao := TStringList.Create;
    slImpressao.Add('');
    slImpressao.Add('<e>APURACAO</e>');
    slImpressao.Add('');
    slImpressao.Add(LeftPad('EMPRESA', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.NomeFantasia);
    slImpressao.Add(LeftPad('CNPJ', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.CNPJ);
    slImpressao.Add(LeftPad('USUARIO', ' ', 12) + ' : ' + dmCaixa.Usuario.Nome);
    if idSessaoCaixa > 0 then
    begin
      slImpressao.Add(LeftPad('ESTACAO', ' ', 12) + ' : ' + dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString);
      slImpressao.Add(LeftPad('COD. CAIXA', ' ', 12) + ' : ' + dmCaixa.qryAuxiliar.FieldByName('idCaixa').AsString);
      slImpressao.Add(LeftPad('DATA CAIXA', ' ', 12) + ' : ' + FormatDateTime('dd/mm/yyyy', dmCaixa.qryAuxiliar.FieldByName('AberturaCaixa').AsDateTime));
      slImpressao.Add(LeftPad('COD. SESSAO', ' ', 12) + ' : ' + dmCaixa.qryAuxiliar.FieldByName('idSessaoCaixa').AsString);
      slImpressao.Add(LeftPad('DATA SESSAO', ' ', 12) + ' : ' + FormatDateTime('dd/mm/yyyy', dmCaixa.qryAuxiliar.FieldByName('dhAbertura').AsDateTime));
    end
    else if idCaixaFinal > 0 then
    begin
      if dmCaixa.qryAuxiliar.Locate('TipoCaixa', 1, []) then
      begin
        slImpressao.Add(LeftPad('COD. CAIXA INICIAL', ' ', 18) + ' : ' + dmCaixa.qryAuxiliar.FieldByName('idCaixa').AsString);
        slImpressao.Add(LeftPad('DATA CAIXA INICIAL', ' ', 18) + ' : ' + FormatDateTime('dd/mm/yyyy', dmCaixa.qryAuxiliar.FieldByName('dhAbertura').AsDateTime));
      end
      else
        raise Exception.Create('Não foram encontrados os dados do caixa inicial. ' + IntToStr(idCaixaInicial));

      if dmCaixa.qryAuxiliar.Locate('TipoCaixa', 2, []) then
      begin
        slImpressao.Add(LeftPad('COD. CAIXA FINAL', ' ', 18) + ' : ' + dmCaixa.qryAuxiliar.FieldByName('idCaixa').AsString);
        slImpressao.Add(LeftPad('DATA CAIXA FINAL', ' ', 18) + ' : ' + FormatDateTime('dd/mm/yyyy', dmCaixa.qryAuxiliar.FieldByName('dhAbertura').AsDateTime));
      end
      else
        raise Exception.Create('Não foram encontrados os dados do caixa final. ' + IntToStr(idCaixaFinal));
    end
    else
    begin
      slImpressao.Add(LeftPad('COD. CAIXA', ' ', 12) + ' : ' + dmCaixa.qryAuxiliar.FieldByName('idCaixa').AsString);
      slImpressao.Add(LeftPad('DATA CAIXA', ' ', 12) + ' : ' + FormatDateTime('dd/mm/yyyy', dmCaixa.qryAuxiliar.FieldByName('dhAbertura').AsDateTime));
    end;
  end;

  procedure ImprimeProdutos;
  begin
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    slImpressao.Add('');
    slImpressao.Add('');

    slImpressao.Add('<e>PRODUTOS VENDIDOS</e>');
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));

    dmCaixa.qryAuxiliar.Close;
    if idSessaoCaixa > 0 then
      dmCaixa.qryAuxiliar.SQL.Text := format(
        'declare @idEmpresa as int; ' +
        'declare @idCaixa as int; ' +
        'declare @idSessaoCaixa as int; ' +
        'declare @valorTotal as money; ' +
        ' ' +
        'select @idEmpresa = %d; ' +
        'select @idCaixa = %d; ' +
        'select @idSessaoCaixa = %d; ' +
        ' ' +
        'select @valortotal = (select sum((i.vlProduto - IsNull(i.vlDesconto, 0)) * qtde) from vendas.itens i ' +
        'inner join vendas.Contas c on i.idEmpresa = c.idEmpresa and i.idCaixa = c.idCaixa and i.idSessaoCaixa = c.idSessaoCaixa and i.idConta = c.idConta ' +
        'where  c.idEmpresa = @idEmpresa and c.idCaixa = @idCaixa and c.idSessaoCaixa = @idSessaoCaixa and c.idConvenio <> -1); ' +
        ' ' +
        'with ProdutosVendidos (DescricaoTipoRelacionamento, Descricao, ValorUnitario, QtdeTotalVendida) as ' +
        '( ' +
        'select DescricaoTipoRelacionamento, Descricao, vlProduto, sum(qtde) as TotalVendido  from viewItens i ' +
        '        where  idEmpresa = @idEmpresa and idCaixa = @idCaixa and idSessaoCaixa = @idSessaoCaixa and idConvenio <> -1 ' +
        '        group by DescricaoTipoRelacionamento, Descricao, vlProduto ' +
        ') ' +
        ' ' +
        'select case when DescricaoTipoRelacionamento is null then ' + QuotedStr('Produto Principal') +
        ' else DescricaoTipoRelacionamento end as DescricaoTipoRelacionamento, ' +
        ' Descricao, ValorUnitario, QtdeTotalVendida, @ValorTotal as TotalVendasCaixa, (ValorUnitario*QtdeTotalVendida) as TotalEmVendas, ' +
        ' case when @ValorTotal > 0 then ((ValorUnitario*QtdeTotalVendida) / @ValorTotal * 100) else 0 end as PercentualTotalVendas from ProdutosVendidos ' +
        'order by DescricaoTipoRelacionamento, Descricao, ValorUnitario', [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa])
    else if idCaixaFinal > 0 then
      dmCaixa.qryAuxiliar.SQL.Text := format(
        'declare @idEmpresa as int; ' +
        'declare @idCaixa as int; ' +
        'declare @idCaixaFinal as int; ' +
        'declare @valorTotal as money; ' +
        ' ' +
        'select @idEmpresa = %d; ' +
        'select @idCaixa = %d; ' +
        'select @idCaixaFinal = %d; ' +
        ' ' +
        'select @valortotal = (select sum((i.vlProduto - IsNull(i.vlDesconto, 0)) * qtde) from vendas.itens i ' +
        'inner join vendas.Contas c on i.idEmpresa = c.idEmpresa and i.idCaixa = c.idCaixa and i.idSessaoCaixa = c.idSessaoCaixa and i.idConta = c.idConta ' +
        'where  i.idEmpresa = @idEmpresa and i.idCaixa between @idCaixa and @idCaixaFinal and c.idConvenio <> -1); ' +
        ' ' +
        'with ProdutosVendidos (DescricaoTipoRelacionamento, Descricao, ValorUnitario, QtdeTotalVendida) as ' +
        '( ' +
        'select DescricaoTipoRelacionamento, Descricao, vlProduto, sum(qtde) as TotalVendido  from viewItens i ' +
        '        where  idEmpresa = @idEmpresa and idCaixa between @idCaixa and @idCaixaFinal and idConvenio <> -1 ' +
        '        group by DescricaoTipoRelacionamento, Descricao, vlProduto ' +
        ') ' +
        ' ' +
        'select case when DescricaoTipoRelacionamento is null then ' + QuotedStr('Produto Principal') +
        ' else DescricaoTipoRelacionamento end as DescricaoTipoRelacionamento, ' +
        ' Descricao, ValorUnitario, QtdeTotalVendida, @ValorTotal as TotalVendasCaixa, (ValorUnitario*QtdeTotalVendida) as TotalEmVendas, ' +
        ' case when @ValorTotal > 0 then ((ValorUnitario*QtdeTotalVendida) / @ValorTotal * 100) else 0 end as PercentualTotalVendas from ProdutosVendidos ' +
        'order by DescricaoTipoRelacionamento, Descricao, ValorUnitario', [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal])
    else
      dmCaixa.qryAuxiliar.SQL.Text := format(
        'declare @idEmpresa as int; ' +
        'declare @idCaixa as int; ' +
        'declare @valorTotal as money; ' +
        ' ' +
        'select @idEmpresa = %d; ' +
        'select @idCaixa = %d; ' +
        ' ' +
        'select @valortotal = (select sum((i.vlProduto - IsNull(i.vlDesconto, 0)) * qtde) from vendas.itens i ' +
        'inner join vendas.Contas c on i.idEmpresa = c.idEmpresa and i.idCaixa = c.idCaixa and i.idSessaoCaixa = c.idSessaoCaixa and i.idConta = c.idConta ' +
        'where  i.idEmpresa = @idEmpresa and i.idCaixa = @idCaixa and c.idConvenio <> -1); ' +
        ' ' +
        'with ProdutosVendidos (DescricaoTipoRelacionamento, Descricao, ValorUnitario, QtdeTotalVendida) as ' +
        '( ' +
        'select DescricaoTipoRelacionamento, Descricao, vlProduto, sum(qtde) as TotalVendido  from viewItens i ' +
        '        where  idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConvenio <> -1 ' +
        '        group by DescricaoTipoRelacionamento, Descricao, vlProduto ' +
        ') ' +
        ' ' +
        'select case when DescricaoTipoRelacionamento is null then ' + QuotedStr('Produto Principal') +
        ' else DescricaoTipoRelacionamento end as DescricaoTipoRelacionamento, ' +
        ' Descricao, ValorUnitario, QtdeTotalVendida, @ValorTotal as TotalVendasCaixa, (ValorUnitario*QtdeTotalVendida) as TotalEmVendas, ' +
        ' case when @ValorTotal > 0 then ((ValorUnitario*QtdeTotalVendida) / @ValorTotal * 100) else 0 end as PercentualTotalVendas from ProdutosVendidos ' +
        'order by DescricaoTipoRelacionamento, Descricao, ValorUnitario', [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);

      dmCaixa.qryAuxiliar.Open;

    ValorVendidoSubGrupo := 0;
    subgrupo := '';
    while not dmCaixa.qryAuxiliar.Eof do
    begin
      if UpperCase(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoRelacionamento').AsString) <> subGrupo then
      begin
        if subgrupo <> '' then
        begin
          slImpressao.Add('');

          if dmCaixa.qryAuxiliar.FieldByName('TotalVendasCaixa').AsCurrency > 0 then
          begin
            slImpressao.Add('<c>' + LeftPad('TOTAL SUBGRUPO ', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 18) + ' ' +
              RightPad(formatfloat('###,##0.00', ValorVendidoSubGrupo), ' ', 10) + ' ' +
              RightPad(formatfloat('#0.00', ValorVendidoSubGrupo / dmCaixa.qryAuxiliar.FieldByName('TotalVendasCaixa').AsCurrency * 100), ' ', 5) + '%</c>');
          end;

          slImpressao.Add('');
        end;
        ValorVendidoSubGrupo := 0;
        subgrupo := UpperCase(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoRelacionamento').AsString);
        slImpressao.Add('<e>' + subgrupo + '</e>');
        slImpressao.Add('<c>' + LeftPad('Descricao', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' + RightPad('Unitario', ' ', 9) + ' ' + RightPad('Qtde', ' ', 4) + ' ' +
          RightPad('Total', ' ', 10) + ' ' + RightPad('%', ' ', 5) + '</c>');
      end;

      slImpressao.Add('<c>' + LeftPad(Copy(dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString, 1, frmPrincipal.Impressora.ColunasFonteCondensada - 33), ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
        RightPad(formatfloat('###,##0.00', dmCaixa.qryAuxiliar.FieldByName('ValorUnitario').AsCurrency), ' ', 10) + ' ' +
        RightPad(dmCaixa.qryAuxiliar.FieldByName('QtdeTotalVendida').AsString, ' ', 4) + ' ' +
        RightPad(formatfloat('###,##0.00', dmCaixa.qryAuxiliar.FieldByName('TotalEmVendas').AsCurrency), ' ', 10) + ' ' +
        RightPad(formatfloat('#0.00', dmCaixa.qryAuxiliar.FieldByName('PercentualTotalVendas').AsCurrency), ' ', 5) + '</c>' );

      ValorVendidoSubGrupo := ValorVendidoSubGrupo + dmCaixa.qryAuxiliar.FieldByName('TotalEmVendas').AsCurrency;
      dmCaixa.qryAuxiliar.Next;
    end;

    slImpressao.Add('');
    if dmCaixa.qryAuxiliar.FieldByName('TotalVendasCaixa').AsCurrency > 0 then
    begin
      slImpressao.Add('<c>' + LeftPad('TOTAL SUBGRUPO ', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 18) + ' ' +
        RightPad(formatfloat('###,##0.00', ValorVendidoSubGrupo), ' ', 10) + ' ' +
        RightPad(formatfloat('#0.00', ValorVendidoSubGrupo / dmCaixa.qryAuxiliar.FieldByName('TotalVendasCaixa').AsCurrency * 100), ' ', 5) + '%</c>');
    end;
  end;

  procedure ImprimeColaboradores;
  begin
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    slImpressao.Add('');
    slImpressao.Add('');

    dmCaixa.qryAuxiliar.Close;
    dmCaixa.qryAuxiliar.SQL.Text := format('select RazaoSocial, Descricao, DataHora, idMesaCartaoSenha, ' +
      'Vendas.RetornaTotalDoProduto(idEmpresa, idCaixa, idConta, idItem) as TotalDoProduto from viewItens vi ' +
      'where idEmpresa = %d and idcaixa = %d and idConvenio = -1 and idtipoRelacionamento = -1 order by DataHora',
      [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);
    dmCaixa.qryAuxiliar.Open;
    if dmCaixa.qryAuxiliar.RecordCount > 0 then
    begin
      slImpressao.Add('');
      slImpressao.Add('');
      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
      slImpressao.Add('<e>Refeições de colaboradores</e>');
      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
      slImpressao.Add('<c>' +LeftPad('Mesa Descricao', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 39) + ' ' + LeftPad('Colaborador', ' ', 15) + ' ' +
        LeftPad('Valor', ' ', 6) + ' ' + LeftPad('Data e hora', ' ', 17));
      while not dmCaixa.qryAuxiliar.Eof do
      begin
        slImpressao.Add('<c>' + LeftPad(dmCaixa.qryAuxiliar.FieldByName('idMesaCartaoSenha').AsString, ' ', 4) + ' ' +
          LeftPad(Copy(dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString, 1, frmPrincipal.Impressora.ColunasFonteCondensada - 39), ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 39) + ' ' +
          LeftPad(Copy(dmCaixa.qryAuxiliar.FieldByName('RazaoSocial').AsString, 1, 15), ' ', 15) + ' ' +
          RightPad(formatfloat('##0.00', dmCaixa.qryAuxiliar.FieldByName('TotalDoProduto').AsFloat), ' ', 6) + ' ' +
          RightPad(FormatDateTime('dd/mm/yy hh:nn:ss', dmCaixa.qryAuxiliar.FieldByName('DataHora').AsDateTime), ' ', 17) + '</c>');
        dmCaixa.qryAuxiliar.Next;
      end;
    end;
  end;

  procedure ImprimeEstornos;
  begin
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    slImpressao.Add('');
    slImpressao.Add('');

    dmCaixa.qryAuxiliar.Close;
    dmCaixa.qryAuxiliar.SQL.Text := format('select idMesaCartaoSenha, DescricaoReduzida, qtde, vlProduto, razaosocial, '+
      'DataHoraEstorno FROM viewitensestorno where idEmpresa = %d and idcaixa = %d order by DataHoraEstorno asc',
      [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);
    dmCaixa.qryAuxiliar.Open;
    if dmCaixa.qryAuxiliar.RecordCount > 0 then
    begin
      slImpressao.Add('');
      slImpressao.Add('');
      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
      slImpressao.Add('<e>ESTORNOS</e>');
      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
      slImpressao.Add('<c>' + LeftPad('Mesa Descricao reduzida', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 45) + ' ' + LeftPad('Qtde', ' ', 5) + ' ' +
        LeftPad('Valor', ' ', 6) + ' ' + LeftPad('Usuario', ' ', 10) + ' ' + LeftPad('Data e hora', ' ', 17) + '</c>');
      while not dmCaixa.qryAuxiliar.Eof do
      begin
        slImpressao.Add('<c>' + LeftPad(dmCaixa.qryAuxiliar.FieldByName('idMesaCartaoSenha').AsString, ' ', 4) + ' ' +
          LeftPad(Copy(dmCaixa.qryAuxiliar.FieldByName('DescricaoReduzida').AsString, 1, frmPrincipal.Impressora.ColunasFonteCondensada - 45), ' ',
            frmPrincipal.Impressora.ColunasFonteCondensada - 45) + ' ' +
          RightPad(formatfloat('0.000', dmCaixa.qryAuxiliar.FieldByName('Qtde').AsFloat), ' ', 10) + ' ' +
          RightPad(formatfloat('##0.00', dmCaixa.qryAuxiliar.FieldByName('vlProduto').AsFloat), ' ', 6) + ' ' +
          LeftPad(Copy(dmCaixa.qryAuxiliar.FieldByName('RazaoSocial').AsString, 1, 10), ' ', 10) + ' ' +
          RightPad(FormatDateTime('dd/mm/yy hh:nn:ss', dmCaixa.qryAuxiliar.FieldByName('DataHoraEstorno').AsDateTime), ' ', 17) + '</c>');
        dmCaixa.qryAuxiliar.Next;
      end;
    end;
  end;

  procedure ImprimeSangrias;
  begin
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    slImpressao.Add('');
    slImpressao.Add('');

    with dmCaixa.qryAuxiliar do
    begin
      Close;
      if idSessaoCaixa > 0 then
        SQL.Text := Format('select scs.Motivo, scs.dhSangria, scs.vlSangria, p.NomeFantasia from Vendas.SessaoCaixaSangrias scs ' +
          'inner join Vendas.SessoesCaixa sc on scs.idEmpresa = sc.idEmpresa and scs.idSessaoCaixa = sc.idSessaoCaixa ' +
          'inner join Vendas.EmpresaEstacoes ee on sc.idEmpresa = ee.idEmpresa and sc.idEstacao = ee.idEstacao ' +
          'inner join Contabil.Pessoas p on scs.idUsuario = p.idPessoa ' +
          'where (scs.idEmpresa = %d) and (scs.idCaixa = %d) and (scs.idSessaoCaixa = %d)', [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa])
      else
        SQL.Text := Format('select scs.Motivo, scs.dhSangria, scs.vlSangria, p.NomeFantasia from Vendas.SessaoCaixaSangrias scs ' +
          'inner join Vendas.SessoesCaixa sc on scs.idEmpresa = sc.idEmpresa and scs.idSessaoCaixa = sc.idSessaoCaixa ' +
          'inner join Vendas.EmpresaEstacoes ee on sc.idEmpresa = ee.idEmpresa and sc.idEstacao = ee.idEstacao ' +
          'inner join Contabil.Pessoas p on scs.idUsuario = p.idPessoa ' +
          'where (scs.idEmpresa = %d) and (scs.idCaixa = %d)', [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);

      Open;

      if RecordCount > 0 then
      begin
        ValorSangria := 0;
        slImpressao.Add('');
        slImpressao.Add('');
        slImpressao.Add('');
        slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
        slImpressao.Add('<e>SANGRIAS</e>');
        slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
        slImpressao.Add('Motivo            Responsavel Data e hora          Valor');
        while not eof do
        begin
          if (not FieldByName('vlSangria').IsNull) and (FieldByName('vlSangria').Value > 0) then
          begin
            slImpressao.Add('<c>' + LeftPad(Copy(FieldByName('Motivo').AsString, 1, 17), ' ', 17) + ' ' +
              LeftPad(Copy(FieldByName('NomeFantasia').AsString, 1, 11), ' ', 11) + ' ' +
              FormatDateTime('dd/mm/yy hh:NN', FieldByName('dhSangria').AsDateTime) + '  ' +
              RightPad(formatfloat('###,##0.00', FieldByName('vlSangria').AsCurrency), ' ', 10) + '</c>');
          end;

          ValorSangria := ValorSangria + FieldByName('vlSangria').AsCurrency;
          Next;
        end;

        slImpressao.Add('TOTAL SANGRIA    : ' + RightPad(formatfloat('##,###,##0.00', ValorSangria), ' ', frmPrincipal.Impressora.ColunasFonteNormal - 19));
      end;
    end;
  end;

  procedure ImprimePagamentos;
  begin
    slImpressao.Add('');
    slImpressao.Add('');
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    slImpressao.Add('<e>FORMAS DE PAGAMENTO</e>');
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));

    slImpressao.Add('<c>' + LeftPad('DESCRICAO', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' + RightPad('VENDIDO', ' ', 10) + ' ' +
      RightPad('APURADO', ' ', 10) + ' ' + RightPad('DIFERENCA', ' ', 10) + '</c>');

    dmCaixa.qryAuxiliar.Close;
    if idSessaoCaixa > 0 then
      dmCaixa.qryAuxiliar.SQL.Text := Format('declare @idEmpresa as int; ' +
          'declare @idCaixa as int; ' +
          'declare @idSessaoCaixa as int; ' +
          'declare @valorTotal as money; ' +
          ' ' +
          'select @idEmpresa = %d; ' +
          'select @idCaixa = %d; ' +
          'select @idSessaoCaixa = %d; ' +
          ' ' +
          ';with vendido ' +
          'as( ' +
          'select idTipoPagamento, idFormaPagamento, sum(vlPagamento) as Total from viewContasPagamentos vcp inner join Vendas.Contas c on ' +
          'vcp.idEmpresa = c.idEmpresa and vcp.idCaixa = c.idCaixa and vcp.idSessaoCaixa = c.idSessaoCaixa and vcp.idConta = c.idConta ' +
          'where vcp.idEmpresa = @idEmpresa and vcp.idCaixa = @idCaixa and vcp.idSessaoCaixa = @idSessaoCaixa and EntraNaVenda = 1 and not datafim is null ' +
          'group by rollup (idTipoPagamento, idFormaPagamento)) ' +
          'select tp.Descricao as DescricaoTipoPagamento, fp.Descricao, vendido.Total, apurado.TotalApuradoCaixa from vendido ' +
          'left join (Select sca.idFormaPagamento, fp.Descricao, sum(sca.vlApurado) as TotalApuradoCaixa from Vendas.SessaoCaixaApuracoes  sca ' +
          '  join Contabil.FormasPagamento fp on sca.idFormaPagamento = fp.idFormaPagamento ' +
          '  where sca.idEmpresa = @idEmpresa and sca.idCaixa = @idCaixa and sca.idSessaoCaixa = @idSessaoCaixa ' +
          '  group by sca.idFormaPagamento, fp.Descricao ' +
          '  ) as Apurado on vendido.idFormaPagamento = Apurado.idFormaPagamento ' +
          'left join Contabil.FormasPagamento fp on fp.idFormaPagamento = vendido.idFormaPagamento ' +
          'left join Contabil.TiposPagamento tp on tp.idTipoPagamento = vendido.idTipoPagamento ' +
          'order by tp.Descricao asc, fp.Descricao asc',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa])
    else if idCaixaFinal > 0 then
      dmCaixa.qryAuxiliar.SQL.Text := Format('declare @idEmpresa as int; ' +
          'declare @idCaixa as int; ' +
          'declare @idCaixaFinal as int; ' +
          'declare @valorTotal as money; ' +
          ' ' +
          'select @idEmpresa = %d; ' +
          'select @idCaixa = %d; ' +
          'select @idCaixaFinal = %d; ' +
          ' ' +
          ';with vendido ' +
          'as( ' +
          'select idTipoPagamento, idFormaPagamento, sum(vlPagamento) as Total from viewContasPagamentos vcp inner join Vendas.Contas c on ' +
          'vcp.idEmpresa = c.idEmpresa and vcp.idCaixa = c.idCaixa and vcp.idConta = c.idConta ' +
          'where vcp.idEmpresa = @idEmpresa and vcp.idCaixa between @idCaixa and @idCaixaFinal and EntraNaVenda = 1 and not datafim is null ' +
          'group by rollup (idTipoPagamento, idFormaPagamento)) ' +
          'select tp.Descricao as DescricaoTipoPagamento, fp.Descricao, vendido.Total, apurado.TotalApuradoCaixa from vendido ' +
          'left join (Select sca.idFormaPagamento, fp.Descricao, sum(sca.vlApurado) as TotalApuradoCaixa from Vendas.SessaoCaixaApuracoes  sca ' +
          '  join Contabil.FormasPagamento fp on sca.idFormaPagamento = fp.idFormaPagamento ' +
          '  where sca.idEmpresa = @idEmpresa and sca.idCaixa between @idCaixa and @idCaixaFinal ' +
          '  group by sca.idFormaPagamento, fp.Descricao ' +
          '  ) as Apurado on vendido.idFormaPagamento = Apurado.idFormaPagamento ' +
          'left join Contabil.FormasPagamento fp on fp.idFormaPagamento = vendido.idFormaPagamento ' +
          'left join Contabil.TiposPagamento tp on tp.idTipoPagamento = vendido.idTipoPagamento ' +
          'order by tp.Descricao asc, fp.Descricao asc',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal])
    else
      dmCaixa.qryAuxiliar.SQL.Text := Format('declare @idEmpresa as int; ' +
          'declare @idCaixa as int; ' +
          'declare @valorTotal as money; ' +
          ' ' +
          'select @idEmpresa = %d; ' +
          'select @idCaixa = %d; ' +
          ' ' +
          ';with vendido ' +
          'as( ' +
          'select idTipoPagamento, idFormaPagamento, sum(vlPagamento) as Total from viewContasPagamentos vcp inner join Vendas.Contas c on ' +
          'vcp.idEmpresa = c.idEmpresa and vcp.idCaixa = c.idCaixa and vcp.idConta = c.idConta ' +
          'where vcp.idEmpresa = @idEmpresa and vcp.idCaixa = @idCaixa and EntraNaVenda = 1 and not datafim is null ' +
          'group by rollup (idTipoPagamento, idFormaPagamento)) ' +
          'select tp.Descricao as DescricaoTipoPagamento, fp.Descricao, vendido.Total, apurado.TotalApuradoCaixa from vendido ' +
          'left join (Select sca.idFormaPagamento, fp.Descricao, sum(sca.vlApurado) as TotalApuradoCaixa from Vendas.SessaoCaixaApuracoes  sca ' +
          '  join Contabil.FormasPagamento fp on sca.idFormaPagamento = fp.idFormaPagamento ' +
          '  where sca.idEmpresa = @idEmpresa and sca.idCaixa = @idCaixa ' +
          '  group by sca.idFormaPagamento, fp.Descricao ' +
          '  ) as Apurado on vendido.idFormaPagamento = Apurado.idFormaPagamento ' +
          'left join Contabil.FormasPagamento fp on fp.idFormaPagamento = vendido.idFormaPagamento ' +
          'left join Contabil.TiposPagamento tp on tp.idTipoPagamento = vendido.idTipoPagamento ' +
          'order by tp.Descricao asc, fp.Descricao asc',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);
    dmCaixa.qryAuxiliar.Open;

    ValorVendidoSubGrupo := 0;
    ValorApuradoSubGrupo := 0;
    ValorVendidoTotal := 0;
    ValorApuradoTotal := 0;

    subgrupo := '';
    while not dmCaixa.qryAuxiliar.Eof do
    begin
      if dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').IsNull and dmCaixa.qryAuxiliar.FieldByName('Descricao').IsNull then
        ValorVendidoTotal := dmCaixa.qryAuxiliar.FieldByName('Total').AsCurrency;

      if dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString <> subGrupo then
      begin
        if ValorVendidoSubGrupo > 0 then
          slImpressao.Add('<c>' + LeftPad('TOTAL', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
            RightPad(formatfloat('###,##0.00', ValorVendidoSubGrupo), ' ', 10) + ' ' +
            RightPad(formatfloat('###,##0.00', ValorApuradoSubGrupo), ' ', 10) + ' ' +
            RightPad(formatfloat('###,##0.00', ValorApuradoSubGrupo - ValorVendidoSubGrupo), ' ', 10) + '</c>');

        ValorApuradoTotal := ValorApuradoTotal + ValorApuradoSubGrupo;

        ValorApuradoSubGrupo := 0;

        if subgrupo <> '' then
          slImpressao.Add('');
        if Length(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString) > 30 then
        begin
          slImpressao.Add('<e>' + RemoveAcentos(Copy(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString, 1, 30)));
          slImpressao.Add(RemoveAcentos(Copy(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString, 30,
            Length(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString) - 30)) + '</e>');
        end
        else
          slImpressao.Add('<e>' + RemoveAcentos(dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString) + '</e>');
        subGrupo := dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').AsString;
      end;
      if dmCaixa.qryAuxiliar.FieldByName('Descricao').IsNull then
      begin
        if not dmCaixa.qryAuxiliar.FieldByName('DescricaoTipoPagamento').IsNull then
          ValorVendidoSubGrupo := dmCaixa.qryAuxiliar.FieldByName('Total').AsCurrency;
      end
      else
      begin
        slImpressao.Add('<c>' + LeftPad(Copy(dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString, 1, frmPrincipal.Impressora.ColunasFonteCondensada - 33), ' ',
          frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
          RightPad(formatfloat('###,##0.00', dmCaixa.qryAuxiliar.FieldByName('Total').AsCurrency), ' ', 10) + ' ' +
          RightPad(formatfloat('###,##0.00', dmCaixa.qryAuxiliar.FieldByName('TotalApuradoCaixa').AsCurrency), ' ', 10) + ' ' +
          RightPad(formatfloat('###,##0.00', dmCaixa.qryAuxiliar.FieldByName('TotalApuradoCaixa').AsCurrency - dmCaixa.qryAuxiliar.FieldByName('Total').AsCurrency), ' ', 10) + '</c>');
        ValorApuradoSubGrupo := ValorApuradoSubGrupo + dmCaixa.qryAuxiliar.FieldByName('TotalApuradoCaixa').AsCurrency;
      end;
      dmCaixa.qryAuxiliar.Next;
    end;
    slImpressao.Add('<c>' + LeftPad('TOTAL', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorVendidoSubGrupo), ' ', 10) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorApuradoSubGrupo), ' ', 10) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorApuradoSubGrupo - ValorVendidoSubGrupo), ' ', 10));
    slImpressao.Add('');
    slImpressao.Add(LeftPad('TOTAL ', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorVendidoTotal), ' ', 10) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorApuradoTotal + ValorApuradoSubGrupo), ' ', 10) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorApuradoSubGrupo + ValorApuradoTotal - ValorVendidoTotal), ' ', 10));
    slImpressao.Add(LeftPad('TOTAL SANGRIA (Soma com apurado)', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 53) + RightPad(formatfloat('###,##0.00', ValorSangria), ' ', 10));
    slImpressao.Add(LeftPad('TOTAL GERAL', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorVendidoTotal), ' ', 10) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorApuradoTotal + ValorApuradoSubGrupo + ValorSangria), ' ', 10) + ' ' +
      RightPad(formatfloat('###,##0.00', ValorApuradoSubGrupo + ValorApuradoTotal + ValorSangria - ValorVendidoTotal), ' ', 10) +
      '</c>');
  end;

  procedure ImprimeCompras;
  begin
    slImpressao.Add('');
    slImpressao.Add('');
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    slImpressao.Add('<e>GASTOS EM DINHEIRO</e>');
    slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));

    dmCaixa.qryAuxiliar.Close;
    dmCaixa.qryAuxiliar.SQL.Text := format('SELECT p.NomeFantasia, xProd, qCom, vunCom, vProd from Contabil.NotaItens ni ' +
      'inner join contabil.notas n on ni.idempresa = n.idempresa and n.idnota = ni.idnota and ' +
      'exists (select idNota from contabil.notavencimentos nv where nv.idEmpresa = n.idEmpresa and nv.idNota = n.idNota and nv.idTipoVencimento = 1) ' +
      'inner join Contabil.Pessoas p on n.idPessoa = p.idPessoa ' +
      'where ni.idEmpresa = %d and cast(n.dataemissao as date) = ' +
        QuotedStr(FormatDateTime(dmCaixa.FormatoData, DataHoraCaixaAbertura)) + ' ' +
      'order by n.idPessoa, xProd', [dmCaixa.Estacao.idEmpresa]);
    dmCaixa.qryAuxiliar.Open;

    subgrupo := '';
    ValorGastoTotal := 0;
    slImpressao.Add('<c>' + LeftPad('Descricao', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 30) + ' ' +
      RightPad('Qtde', ' ', 9) + ' ' + RightPad('Unitario', ' ', 9) + ' ' + RightPad('Total', ' ', 9) + '</c>');
    while not dmCaixa.qryAuxiliar.Eof do
    begin
      if UpperCase(dmCaixa.qryAuxiliar.FieldByName('NomeFantasia').AsString) <> subGrupo then
      begin
        if subgrupo <> '' then
          slImpressao.Add('');
        subgrupo := UpperCase(dmCaixa.qryAuxiliar.FieldByName('NomeFantasia').AsString);
        slImpressao.Add('<e>' + copy(subgrupo, 1, 24) + '</e>');
      end;

      slImpressao.Add('<c>' + LeftPad(copy(dmCaixa.qryAuxiliar.FieldByName('xProd').AsString, 1, 37), ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 30) + ' ' +
        RightPad(formatfloat('##,###,##0.00', dmCaixa.qryAuxiliar.FieldByName('qCom').AsFloat), ' ', 9) + ' ' +
        RightPad(formatfloat('##,###,##0.00', dmCaixa.qryAuxiliar.FieldByName('vunCom').AsCurrency), ' ', 9) + ' ' +
        RightPad(formatfloat('##,###,##0.00', dmCaixa.qryAuxiliar.FieldByName('vProd').AsCurrency), ' ', 9) + '</c>');

      ValorGastoTotal := ValorGastoTotal + dmCaixa.qryAuxiliar.FieldByName('vProd').AsFloat;

      dmCaixa.qryAuxiliar.Next;
    end;
  end;

  procedure ImprimeTaxaServico;
  begin
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      if idSessaoCaixa > 0 then
        SQL.Text := Format('with Comissao as ' +
            '(select p.NomeFantasia, sum(vlProduto * qtde) ValorTotal from Vendas.Itens i ' +
            'inner join vendas.Contas c on i.idEmpresa = c.idEmpresa and i.idCaixa = c.idCaixa and i.idSessaoCaixa = c.idSessaoCaixa and i.idConta = c.idConta  and ((c.idConvenio <> -1) or (c.idConvenio is null))' +
            'inner join Contabil.Pessoas p on  i.idGarcom = p.idPessoa ' +
            'where (c.idEmpresa = %d)  and (c.idCaixa = %d) and (c.idSessaoCaixa = %d)' +
            'Group by p.NomeFantasia ' +
            ') ' +
            ' ' +
            'select NomeFantasia, (ValorTotal * 7 / 100) as ValorComissao from Comissao order by NomeFantasia ',
            [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa])
      else if idCaixaFinal > 0 then
        SQL.Text := Format('with Comissao as ' +
            '(select p.NomeFantasia, sum(vlProduto * qtde) ValorTotal from Vendas.Itens i ' +
            'inner join Contabil.Pessoas p on  i.idGarcom = p.idPessoa ' +
            'where i.idEmpresa = %d  and i.idCaixa between %d and %d ' +
            'Group by p.NomeFantasia ' +
            ') ' +
            ' ' +
            'select NomeFantasia, (ValorTotal * 7 / 100) as ValorComissao from Comissao order by NomeFantasia ',
            [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal])
      else
        SQL.Text := Format('with Comissao as ' +
            '(select p.NomeFantasia, sum(vlProduto * qtde) ValorTotal from Vendas.Itens i ' +
            'inner join Contabil.Pessoas p on  i.idGarcom = p.idPessoa ' +
            'where i.idEmpresa = %d  and i.idCaixa = %d ' +
            'Group by p.NomeFantasia ' +
            ') ' +
            ' ' +
            'select NomeFantasia, (ValorTotal * 7 / 100) as ValorComissao from Comissao order by NomeFantasia ',
            [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);

      Open;

      if RecordCount > 0 then
      begin
        ValorTotalComissoes := 0;
        slImpressao.Add('');
        slImpressao.Add('');
        slImpressao.Add('');
        slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
        slImpressao.Add('<e>COMISSOES</e>');
        slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
        slImpressao.Add('<e>Nome do garcom                                 Valor');
        while not eof do
        begin
          if (not FieldByName('ValorComissao').IsNull) and (FieldByName('ValorComissao').Value > 0) then
          begin
            slImpressao.Add(LeftPad(Copy(FieldByName('NomeFantasia').AsString, 1, 30), ' ', 30) + ' ' +
              RightPad(formatfloat('###,##0.00', FieldByName('ValorComissao').AsCurrency), ' ', 10));
          end;

          ValorTotalComissoes := ValorTotalComissoes + FieldByName('ValorComissao').AsCurrency;
          Next;
        end;

        slImpressao.Add('</c>TOTAL COMISSOES  : ' + RightPad(formatfloat('##,###,##0.00', ValorTotalComissoes), ' ', frmPrincipal.Impressora.ColunasFonteNormal - 19));
      end;
    end;
  end;

  procedure ImprimeVendasPorTipo;
  begin
    with dmCaixa.qryAuxiliar do
    begin
      slImpressao.Add('<e>VENDA POR TIPOS</e>');
      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
      Close;
      if idSessaoCaixa > 0 then
        SQL.Text := Format('select case when idTipoVenda = 1 then ' + QuotedStr('Venda balcao') + ' when idTipoVenda = 2 then ' +
          QuotedStr('Venda mesa') + ' when idTipoVenda = 3 then ' + QuotedStr('Venda cartão') + ' when idTipoVenda = 4 then ' + QuotedStr('Venda delivery') +
          ' end as TipoVenda, sum(valor) as VendaTipoVenda, sum(ValorDesconto) as DescontoTipoVenda from vendas.contas where (idEmpresa = %d) and (not (DataFim is null)) ' +
          'and (idcaixa = %d) and (idSessaoCaixa = %d) and ((idConvenio <> -1) or (idConvenio is null)) group by idTipoVenda',
        [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa])
      else if idCaixaFinal > 0 then
        SQL.Text := Format('select case when idTipoVenda = 1 then ' + QuotedStr('Venda balcao') + ' when idTipoVenda = 2 then ' +
          QuotedStr('Venda mesa') + ' when idTipoVenda = 3 then ' + QuotedStr('Venda cartão') + ' when idTipoVenda = 4 then ' + QuotedStr('Venda delivery') +
          ' end as TipoVenda, sum(valor) as VendaTipoVenda, sum(ValorDesconto) as DescontoTipoVenda from vendas.contas where (idEmpresa = %d) and (not (DataFim is null)) ' +
          'and (idcaixa between %d and %d) and ((idConvenio <> -1) or (idConvenio is null)) group by idTipoVenda',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal])
      else
        SQL.Text := Format('select case when idTipoVenda = 1 then ' + QuotedStr('Venda balcao') + ' when idTipoVenda = 2 then ' +
          QuotedStr('Venda mesa') + ' when idTipoVenda = 3 then ' + QuotedStr('Venda cartão') + ' when idTipoVenda = 4 then ' + QuotedStr('Venda delivery') +
          ' end as TipoVenda, sum(valor) as VendaTipoVenda, sum(ValorDesconto) as DescontoTipoVenda from vendas.contas where (idEmpresa = %d) and (not (DataFim is null)) ' +
          'and (idcaixa = %d)  and ((idConvenio <> -1) or (idConvenio is null)) group by idTipoVenda',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);
      Open;

      slImpressao.Add('<c>' + LeftPad('DESCRICAO', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' + RightPad('VALOR', ' ', 10) + ' ' +
        RightPad('DESCONTO', ' ', 10) + ' ' + RightPad('TOTAL', ' ', 10));
      ValorTotalTipoVenda := 0;
      ValorTotalDescontoTipoVenda := 0;
      First;
      While not eof do
      begin
        slImpressao.Add(LeftPad(Copy(FieldByName('TipoVenda').AsString, 1, frmPrincipal.Impressora.ColunasFonteCondensada - 33), ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
          RightPad(formatfloat('###,##0.00', FieldByName('VendaTipoVenda').AsCurrency), ' ', 10) + ' ' +
          RightPad(formatfloat('###,##0.00', FieldByName('DescontoTipoVenda').AsCurrency), ' ', 10) + ' ' +
          RightPad(formatfloat('###,##0.00', FieldByName('VendaTipoVenda').AsCurrency - FieldByName('DescontoTipoVenda').AsCurrency), ' ', 10));
        ValorTotalTipoVenda := ValorTotalTipoVenda + FieldByName('VendaTipoVenda').AsCurrency;
        ValorTotalDescontoTipoVenda := ValorTotalDescontoTipoVenda + FieldByName('DescontoTipoVenda').AsCurrency;
        Next;
      end;
    end;
  end;

  procedure ImprimeRodape;
  begin
    with dmCaixa.qryAuxiliar do
    begin
      slImpressao.Add('');

      slImpressao.Add(LeftPad('TOTAL GERAL', ' ', frmPrincipal.Impressora.ColunasFonteCondensada - 33) + ' ' +
        RightPad(formatfloat('###,##0.00', ValorTotalTipoVenda), ' ', 10) + ' ' +
        RightPad(formatfloat('###,##0.00', ValorTotalDescontoTipoVenda), ' ', 10) + ' ' +
        RightPad(formatfloat('###,##0.00', ValorTotalTipoVenda - ValorTotalDescontoTipoVenda), ' ', 10) + '</c>');

      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));

      slImpressao.Add('');
      //*** pego o troco anterior

      Close;
      SQL.Text := format('select top 1 vlTroco from vendas.caixas where idEmpresa = %d and cast(dhabertura as date) < ' +
        QuotedStr(FormatDateTime(dmCaixa.FormatoData, DataHoraCaixaAbertura)) + ' order by dhAbertura desc',
        [dmCaixa.Estacao.idEmpresa]);
      Open;

      if FieldByName('vlTroco').IsNull then
        ValorTrocoAnterior := 0
      else
        ValorTrocoAnterior := FieldByName('vlTroco').AsCurrency;
      Close;

      if idSessaoCaixa = 0 then
        slImpressao.Add('TROCO ANTERIOR(+): ' + RightPad(formatfloat('##,###,##0.00', ValorTrocoAnterior), ' ', frmPrincipal.Impressora.ColunasFonteNormal - 19));
      slImpressao.Add('VENDIDO       (+): ' + RightPad(formatfloat('##,###,##0.00', ValorVendidoTotal), ' ', frmPrincipal.Impressora.ColunasFonteNormal - 19));
      if idSessaoCaixa = 0 then
        slImpressao.Add('DEPOSITO      (-): ' + RightPad(formatfloat('##,###,##0.00', ValorDeposito), ' ', frmPrincipal.Impressora.ColunasFonteNormal - 19));
      slImpressao.Add('GASTOS        (-): ' + RightPad(formatfloat('##,###,##0.00', ValorGastoTotal), ' ', frmPrincipal.Impressora.ColunasFonteNormal - 19));
  //          slImpressao.Add('SANGRIA       (-): ' + RightPad(formatfloat('##,###,##0.00', ValorSangria), ' ', ColunasFonteNormal - 19));
      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));

      if idSessaoCaixa = 0 then
        slImpressao.Add('TROCO ATUAL      : ' + RightPad(formatfloat('##,###,##0.00', ValorTrocoAnterior + ValorVendidoTotal - ValorDeposito - ValorGastoTotal), ' ',
          frmPrincipal.Impressora.ColunasFonteNormal - 19));

      slImpressao.Add(StringOfChar('-', frmPrincipal.Impressora.ColunasFonteNormal));
    end;
  end;

begin
  result := False;
  try
    with frmPrincipal.Impressora do
    begin
      AbreTabelaDosCaixas;

      InicializaImpressora;

      ImprimeCabecalho;

      if flImprimeProdutos then
        ImprimeProdutos;

      //*** Refeicoes de colaboradores
      if (Estacao.ConfiguracoesDaVenda.ImprimirColaboradores) and (flImprimeColaboradores) then
        ImprimeColaboradores;

      //*** Estornos
      if flImprimeEstornos then
        ImprimeEstornos;

      //*** Imprimo as sangrias se houverem
      if idCaixaFinal = 0 then
        ImprimeSangrias;

      slImpressao.Add(StringOfChar('-', ColunasFonteNormal));

      //*** Formas de pagamento
      ImprimePagamentos;

      if (flImprimeComprasEmDinheiro) then
        ImprimeCompras;

      slImpressao.Add('');

      //*** Se existirem comissoes, eu imprimo
      if Estacao.ConfiguracoesDaVenda.TaxaServico then
        ImprimeTaxaServico;

      slImpressao.Add(StringOfChar('-', ColunasFonteNormal));

      with dmCaixa.qryAuxiliar do
      begin
        Close;
        if idSessaoCaixa > 0 then
          SQL.Text := Format('select count(1) from Vendas.Contas where (idEmpresa = %d) and (idCaixa = %d) and (idSessaoCaixa = %d) and (Not (DataFim is Null)) and ((idConvenio <> -1) or (idConvenio is null))',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idSessaoCaixa])
        else if idCaixaFinal > 0 then
          SQL.Text := Format('select count(1) from Vendas.Contas where (idEmpresa = %d) and (idCaixa between %d and %d) and (Not (DataFim is Null)) and ((idConvenio <> -1) or (idConvenio is null))',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial, idCaixaFinal])
        else
          SQL.Text := Format('select count(1) from Vendas.Contas where (idEmpresa = %d) and (idCaixa = %d) and (Not (DataFim is Null)) and ((idConvenio <> -1) or (idConvenio is null))',
          [dmCaixa.Estacao.idEmpresa, idCaixaInicial]);
        Open;

        if RecordCount <= 0 then
          raise Exception.Create('Erro buscando número total de tickets.');

        if not Fields.Fields[0].IsNull then
        begin
          slImpressao.Add('TICKETS          : ' + RightPad(Fields.Fields[0].AsString, ' ', ColunasFonteNormal - 19));
          if Fields.Fields[0].AsInteger > 0 then
          slImpressao.Add('TICKET MEDIO     : ' + RightPad(formatfloat('##,###,##0.00', ValorVendidoTotal / Fields.Fields[0].AsInteger), ' ', ColunasFonteNormal - 19));
          slImpressao.Add('');
          slImpressao.Add('');

          slImpressao.Add('');
          slImpressao.Add(StringOfChar('-', ColunasFonteNormal));

          ImprimeVendasPorTipo;

          ImprimeRodape;
        end;

        Close;
      end;

      slImpressao.Add('');
      slImpressao.Add('');
      slImpressao.Add('</corte_total>');
      Imprimir(slImpressao.Text);
      Desativar;

//      if flFechamento then
//      begin
//        if Atualizar(dmCaixa.dbTotalFastFood, 'Contabil.Empresas', ['idEmpresa'], [dmCaixa.Estacao.idEmpresa], ['Troco'],
//                                 [ValorTrocoAnterior + ValorVendidoTotal - ValorDeposito - ValorGastoTotal]) <= 0 then
//          raise Exception.Create('Erro atualizando troco atual');
//      end;
      result := True;
    end;
  except
    on e : exception do
      raise Exception.Create('Imprimindo fita.' + sLineBreak + e.Message);
  end;

  dmCaixa.qryAuxiliar.Close;
end;



procedure TdmCaixa.ImprimeValeTroco(const AidConta : integer);

  Procedure RealizaImpressao (Const Descricao : string; Const Valor : double);
  var
    NumeroLinhas : integer;
    i : integer;
    s : string;
  begin
    try
      with frmPrincipal.Impressora do
      begin
        if Ativo then
          Desativar;
        ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
        Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
        Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
        Ativar;

        ImprimirLinha('<e>' + Copy(dmCaixa.Estacao.Dados.NomeFantasia, 1, 20));
        ImprimirLinha('CNPJ : ' + dmCaixa.Estacao.Dados.CNPJ + '</e>');
        Imprimir ('Data : ' + FormatDateTime('dd/MM/yy hh:NN:ss', Now));
        PularLinhas(1);
        ImprimirLinha('<e><n>VALE TROCO</e></n>');
        ImprimirLinha(StringOfChar('-', ColunasFonteNormal));
        ImprimirLinha('<e><n>Conta - ' + IntToStr(AidConta) + '</e></n>');
        ImprimirLinha(Copy(Descricao, 1, ColunasFonteNormal));
        ImprimirLinha('<e>R$ ' + formatfloat('###,##0.00', Valor) + '</e>');
        ACBrExtenso1.Valor := Valor;
        s := ACBrExtenso1.Texto;

        NumeroLinhas := 1;

        if length (s) > ColunasFonteNormal then
        begin
          NumeroLinhas := trunc (length(s) / ColunasFonteNormal);

          if length(s) mod 2 = 1 then
            Inc(NumeroLinhas);
        end;

        for i := 0 to NumeroLinhas - 1 do
          ImprimirLinha(Copy(s, (i * ColunasFonteNormal) + 1, ColunasFonteNormal));

        ImprimirLinha(StringOfChar('-', ColunasFonteNormal));

        PularLinhas(3);
        CortarPapel;
        Desativar;
      end;
    except
      on e : exception do
        raise Exception.Create('Imprimindo - ' + sLineBreak + e.Message);
    end;
  end;

begin
  try
    with TFDQuery.Create(Application) do
    begin
      try
        Connection := dbTotalFastFood;
        SQL.Text := Format('select cp.*, fp.Descricao from Vendas.ContaPagamentos cp inner join Contabil.FormasPagamento fp on ' +
          'cp.idFormaPagamento = fp.idFormaPagamento where (cp.idEmpresa = %d) and (cp.idCaixa = %d) and (cp.idConta = %d) and (cp.vlValeTroco > 0)',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, AidConta]);
        Open;
      except
        on e : exception do
          raise Exception.Create('Buscando se existe vale troco - ' + e.Message);
      end;

      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          RealizaImpressao(FieldByName('Descricao').AsString, FieldByName('vlValeTroco').AsCurrency);

          Next;
        end;
      end;

      Free;
    end;
  except
    on e : exception do
      raise Exception.Create('Função : TdmCaixa.ImprimeValeTroco - ' + e.Message);
  end;
end;


procedure TdmCaixa.LimpaPainelItens(APainel: TScrollBox);
begin
  //*** Primiro limpo o painel anterior
  try
    while APainel.ControlCount > 0 do
      APainel.Controls[APainel.ControlCount -1].Free;
  except
    on e : exception do
      raise Exception.Create('Erro limpando painel de ítens - ' + e.Message);
  end;
end;

procedure TdmCaixa.MovimentaEstoque(const idProduto: integer;
  const Quantidade: Currency; const idPessoa, idRelacionado: integer; const idTipoMovimentacao : integer; Const DataHora : TDateTime);
var
  AProduto : TProduto;


  procedure BaixaProdutosComposicao(const AProduto : integer; const AQtde : double);
    procedure RealizaMovimentacaoEstoque(const MProduto : integer; const MQtde : double);
    begin
      try
        if Inserir(Self, dmCaixa.dbTotalFastFood, 'Estoque.Movimentacao', ['idEmpresa', 'idProduto', 'DataHora', 'idTipoMovimentacao', 'Qtde', 'idRelacionado'],
          [Estacao.idEmpresa, MProduto, DataHora, idTipoMovimentacao, StringReplace(FloatToStr(abs(MQtde)), ',', '.', [rfReplaceAll]) , idRelacionado]) <= 0 then
          raise exception.Create('Não incluiu movimentação.');
      except on E: Exception do
        raise Exception.Create('Função : RelizaMovimentacaoEstoque. ID do produto - ' + IntToStr(MProduto) + ', Quantidade - ' + FloatToStr(MQtde));
      end;
    end;
  begin
    try
      with TFDQuery.Create(Application) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        Close;
        SQL.Text := 'select *, ' +
                    '  CAST( ' +
                    '     CASE WHEN EXISTS(SELECT 1 FROM Produtos.ProdutoComposicao where idProduto= PC.idProdutoComposicao) THEN 1 ' +
                    '     ELSE 0 ' +
                    '     END ' +
                    '  AS BIT) as TemFilhos ' +
                    '   from Produtos.ProdutoComposicao PC where pc.idProduto = ' + IntToStr(AProduto);
        Open;

        if RecordCount > 0 then
        begin
          First;
          while not Eof do
          begin
            if FieldByName('TemFilhos').AsBoolean then
              BaixaProdutosComposicao(FieldByName('idProdutoComposicao').AsInteger, FieldByName('Qtde').AsFloat * AQtde)
            else
              RealizaMovimentacaoEstoque(FieldByName('idProdutoComposicao').AsInteger, FieldByName('Qtde').AsFloat * AQtde);

            Next;
          end;
        end
        else
          //*** Produto nao tem itens na composicao
          RealizaMovimentacaoEstoque(AProduto, AQtde);

        Free;
      end;
    except
      on e : exception do
        raise Exception.Create('Função BaixaProdutosComposicao.' + sLineBreak + e.Message +
          sLineBreak + 'ID do produto - ' + IntToStr(AProduto));
    end;
  end;

  Procedure AtualizaEstoqueNoProduto(const AProduto : integer; const AQtde : double);
    Procedure AtualizaDadosDoProduto (const BProduto : integer; const BQtde : Double);
    begin
      try
        with TFDQuery.Create(Application) do
        begin
          Connection := dmCaixa.dbTotalFastFood;
          if BQtde > 0 then
            SQL.Text := Format('update Vendas.EmpresaProdutos set QtdeEstoque = (case when QtdeEstoque is null then 0 else QtdeEstoque end) + ' +
              StringReplace(FloatToStr(BQtde), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' ' +
              'where idEmpresa = %d and idProduto = %d', [dmCaixa.Estacao.idEmpresa, BProduto])
          else
            SQL.Text := Format('update Vendas.EmpresaProdutos set QtdeEstoque = (case when QtdeEstoque is null then 0 else QtdeEstoque end) + ' +
              StringReplace(FloatToStr(BQtde), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ' ' +
              'where idEmpresa = %d and idProduto = %d', [Estacao.idEmpresa, BProduto]);

          Execute;

          if RowsAffected <= 0 then
            raise exception.Create('Não foi encontrado o produto para atualizar o estoque.');

          Free;
        end;
      except on E: Exception do
        raise Exception.Create('Função AtualizaDadosDoProduto. ID do produto - ' + IntToStr(BProduto) + ', Quantidade - ' +
          FloatToStr(BQtde)  + sLineBreak + e.Message);
      end;
    end;
  begin
    try
      with TFDQuery.Create(Application) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        Close;
        SQL.Text := 'select *, ' +
                    '  CAST( ' +
                    '     CASE WHEN EXISTS(SELECT 1 FROM Produtos.ProdutoComposicao where idProduto= PC.idProdutoComposicao) THEN 1 ' +
                    '     ELSE 0 ' +
                    '     END ' +
                    '  AS BIT) as TemFilhos ' +
                    '   from Produtos.ProdutoComposicao PC where pc.idProduto = ' + IntToStr(AProduto);
        Open;
        //*** O produto tem outros produtos em sua composicao
        if RecordCount > 0 then
        begin
          First;
          while not Eof do
          begin
            if FieldByName('TemFilhos').AsBoolean then
              AtualizaEstoqueNoProduto(FieldByName('idProdutoComposicao').AsInteger, AQtde);

            AtualizaDadosDoProduto(FieldByName('idProdutoComposicao').AsInteger, FieldByName('Qtde').AsFloat * AQtde);

            Next;
          end;
        end
        else
        //*** Produto nao tem nenhum item na sua composicao
          AtualizaDadosDoProduto(AProduto, AQtde);

        Free;
      end;
    except
      on e : exception do
        raise Exception.Create('Função AtualizaEstoqueNoProduto.' + sLineBreak + e.Message);
    end;
  end;

begin
  try
    AProduto.idProduto := idProduto;
    AProduto.Qtde := Quantidade;

    BaixaProdutosComposicao(AProduto.idProduto, AProduto.qtde);

    AtualizaEstoqueNoProduto(AProduto.idProduto, AProduto.qtde);
  except
    on e : exception do
    raise Exception.Create('Função : TdmCaixa.MovimentaEstoque - ' + sLineBreak + e.Message);
  end;
end;

procedure TdmCaixa.OrdenaPainelItens(APainel: TScrollBox);
var
  ATop : integer;
  i : integer;
begin
  try
    ATop := 0;
    for I := 0 to APainel.ControlCount - 1 do
    begin
      with TItem(APainel.Controls[i]) do
      begin
        Left := 5;
        Top  := ATop;
        ATop := ATop + Height + 5;
      end;
    end;
  except
    on e : exception do
      raise Exception.Create('OrdenaPainelItens - ' + sLineBreak + e.Message);
  end;

end;

function TdmCaixa.SenhaOK(const AidControle : integer; var AidUsuario : integer): boolean;
begin
  result := False;
  frmSenha := TfrmSenha.Create(Application);
  //*** if = mrOK ....
  if frmSenha.ShowModal = 1 then
  begin
    AidUsuario := frmSenha.idUsuario;
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := Format('declare @idEmpresa int = %d; ' +
        'declare @idUsuario int = %d; ' +
        'declare @idControle int = %d; ' +
        'select distinct p.idControle, c.Descricao, c.idControlePai, Permitir, c.EhMenu ' +
        'from seguranca.Permissoes p ' +
        'inner join Seguranca.Controles c on p.idcontrole = c.idControle ' +
        'where p.idEmpresa = @idEmpresa and c.idSistema = 2 and p.idPessoa = @idUsuario and p.idControle = @idControle and permitir = 1 ' +
        'union all ' +
        'select distinct c.idControle, c.Descricao, c.idControlePai, pc.permitir, c.EhMenu from Seguranca.Controles c ' +
        'inner join Seguranca.PerfilControles pc on c.idControle = pc.idControle ' +
        'where c.idSistema = 2 and c.idControle = @idControle and pc.Permitir =1 and pc.idPerfil in (select idPerfil from Seguranca.UsuarioPerfis up where up.idEmpresa = @idEmpresa and up.idUsuario = @idUsuario) ',
        [dmCaixa.Estacao.idEmpresa, frmSenha.idUsuario, AidControle]);
      Open;

      if RecordCount > 0 then
        result := True
      else
        frmMensagem.MostraMensagem(format('O usuário [%s] não tem permissão para esta operação.', [frmSenha.NomeUsuario]));

      Close;
    end;
  end;

  FreeAndNil(frmSenha);
end;

procedure TdmCaixa.SetArquivoLogo(const Value: string);
begin
  FArquivoLogo := Value;
end;

procedure TdmCaixa.SetArquivoMensagens(const Value: string);
begin
  FArquivoMensagens := Value;
end;

procedure TdmCaixa.SetDiretorioDadosOFFLine(const Value: string);
begin
  FDiretorioDadosOFFLine := Value;
end;

procedure TdmCaixa.SetEstacao(const Value: TEstacao);
begin
  FEstacao := Value;
end;

procedure TdmCaixa.SetFormatoData(const Value: string);
begin
  FFormatoData := Value;
end;

procedure TdmCaixa.SetidEstacao(const Value: integer);
begin
  FidEstacao := Value;
end;

procedure TdmCaixa.SetNumeroMonitor(const Value: integer);
begin
  if (Value > 0) and ((value + 1) > Screen.MonitorCount) then
    FNumeroMonitor := 0
  else
    FNumeroMonitor := Value;
end;

procedure TdmCaixa.SetTipoEstacao(const Value: TTipoEstacao);
begin
  FTipoEstacao := Value;
end;

procedure TdmCaixa.SetTipoVenda(const Value: TTipoVenda);
begin
  FTipoVenda := Value;
end;

procedure TdmCaixa.SetUsuario(const Value: TUsuario);
begin
  FUsuario := Value;
end;

function TdmCaixa.TemPermissao(const AidControle: Integer): boolean;
begin
  Result := False;

  if qryPermissoes.Active = False then
    qryPermissoes.Open;

  if qryPermissoes.Locate('idControle', AidControle, [loPartialKey, loCaseInsensitive]) then
    result := qryPermissoes.FieldByName('Permitir').AsBoolean;
end;

function TdmCaixa.UsuarioTemPermissao(const AidUsuario,
  AidControle: Integer): boolean;
var
  q : TFDQuery;
begin
  Result := False;

  q := TFDQuery.Create(Self);
  try
    with q do
    begin
      Connection := dbTotalFastFood;
      SQL.Text := format('declare @idEmpresa int = %d; ' +
        'declare  @idUsuario int = %d; ' +
        'declare @idControle int = %d; ' +
        'select distinct p.idControle, c.Descricao, c.idControlePai, Permitir, c.EhMenu ' +
        'from seguranca.Permissoes p ' +
        'inner join Seguranca.Controles c on p.idcontrole = c.idControle ' +
        'where p.idEmpresa = @idEmpresa and c.idControle = @idControle and p.idPessoa = @idUsuario and permitir = 1 ' +
        'union all ' +
        'select distinct c.idControle, c.Descricao, c.idControlePai, pc.permitir, c.EhMenu from Seguranca.Controles c ' +
        'inner join Seguranca.PerfilControles pc on c.idControle = pc.idControle ' +
        'where c.idControle = @idControle and pc.Permitir =1 and pc.idPerfil in  ' +
        '(select idPerfil from Seguranca.UsuarioPerfis up where up.idEmpresa = @idEmpresa and up.idUsuario = @idUsuario)',
        [Estacao.idEmpresa, AidUsuario, AidControle]);

      Open;

      result := RecordCount > 0;
    end;
  finally
    q.Free;
  end;
end;

procedure TdmCaixa.VerificaSeExisteAtualizacaoDeDados;
begin
  //*** Verifico se existe atualização
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Clear;
    SQL.Text := Format('select 1 from Vendas.EmpresaEstacoes where idEmpresa = %d and idEstacao = %d and AtualizarBancoDeDados=1',
      [Estacao.idEmpresa, Estacao.ID]);
    Open;

    if RecordCount > 0 then
      AbreDataSets;

    Close;
  end;
end;

function TdmCaixa.EmiteNFCe(Const AIDConta : integer; Const ADocumento : string; Const ATipoDocumento : TACBrValTipoDocto;
  Const ANome : string; Const AIE : string; Const AIDMesaCartaoSenha : integer; Const AContingencia : boolean; Const ANomeConvenio : string;
  Const AIDCaixa : integer = 0) : boolean;
var
  NumeroNFCe : integer;
  DataFimDaNota : TDateTime;
  flAchou : boolean;
  i : integer;
  SituacaoNFE : string;
  NotaConfirmada : boolean;
  sMes : string;
  sArquivo : string;
  sArquivoOriginal : string;
  sNFE : string;
  XMLJaGerado : boolean;
  idCaixaAuxiliar : integer;

  procedure MudaStatusConta(ASituacao : string; Const ANFE : string = '');
  Var
    s: string;
  begin
    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;
      s := 'update vendas.contas set SituacaoNFE = ' + QuotedStr(ASituacao) + ', DataHoraAutorizacaoNFE = ' +
          QuotedStr(FormatDateTime('dd/MM/yy HH:mm:ss',ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto));
      if ANFE  <> '' then
        s := s + ', NFE = ' + QuotedStr(ANFE);

      s := s + ' where idEmpresa = %d and idCaixa = %d and idConta = %d';
      SQL.Text := format(s, [dmCaixa.Estacao.idEmpresa, IDCaixaAuxiliar, AidConta]);;
      ExecSQL;

      if RowsAffected <= 0 then
      begin
        Free;
        raise Exception.Create('Erro mudando status da conta para emissão de NFCe - ');
      end;

      Free;
    end;
  end;
  function TentaEnviarNFE(Const AContingencia : boolean; Const AMudarStatus : boolean; Const AMudarDataEmissao : boolean) : boolean;
  begin
    result := false;
    try
      if AContingencia then
      begin
        ACBrNFe1.Configuracoes.Geral.FormaEmissao := teOffLine;
        ACBrNFe1.NotasFiscais[0].NFe.Ide.tpEmis    := teOffLine;
      end
      else
      begin
        ACBrNFe1.NotasFiscais[0].NFe.Ide.tpEmis   := teNormal;
        ACBrNFe1.NotasFiscais[0].NFe.ide.dhCont := 0;
        ACBrNFe1.NotasFiscais[0].NFe.Ide.xJust  := '';
      end;

      ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi := Now;

      if AMudarStatus then
      begin
        fBobinaECF.AtualizaBobina('Mudando status da NFC-e para emitindo.');
        MudaStatusConta('E');
      end;

      fBobinaECF.AtualizaBobina('Gravando o XML da NFC-e.');
      ACBrNFe1.NotasFiscais[0].GravarXML;
      fBobinaECF.AtualizaBobina('Enviando a NFC-e para o SEFAZ.');
      ACBrNFe1.Enviar(1, False, True);

      //*** Autorizado o uso da NF-e
      if ACBrNFe1.NotasFiscais.Items[0].Confirmada then
      begin
        fBobinaECF.AtualizaBobina('A NFC-e foi autorizada pelo SEFAZ.');
        result := true;
      end
      else
      begin
        case ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat of
          204 : result := True;
          //*** 539 - Duplicidade de NF-e com diferença na Chave de Acesso [chNFe: 99999999999999999999999999999999999999999999][nRec:999999999999999]
          //*** 562 - Rejeição: Código Numérico informado na Chave de Acesso difere do Código Numérico da NF-e [chNFe:99999999999999999999999999999999999999999999]
          539,
          562 : begin
            if pos('chNFe:', ACBrNFe1.WebServices.Enviar.xMotivo) > 1 then
              MudaStatusConta('E', 'NFe' + copy(ACBrNFe1.WebServices.Enviar.xMotivo, pos('chNFe:', ACBrNFe1.WebServices.Enviar.xMotivo) + 6, 44));
            result := TentaEnviarNFE(AContingencia, False, False);
          end;
          //*** |Rejeição: NFC-e com Data-Hora de emissão atrasada
          704 : result := TentaEnviarNFE(False, True, True);
        else
          raise Exception.Create('Retorno não tratado --- IDConta = ' + AIDConta.ToString + ', NFE = ' +
              QuotedStr(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) + ', código de retorno : ' +
              ACBrNFe1.WebServices.Enviar.cStat.ToString + ', mensagem de retorno : ' + ACBrNFe1.WebServices.Enviar.xMotivo);
        end;
      end;
    except
      on e : exception do
        raise Exception.Create('Erro enviando a NFC-e - ' + e.message);
    end;
  end;
begin
  if AIDCaixa = 0 then
    idCaixaAuxiliar := dmCaixa.Estacao.Caixa.idCaixa
  else
    idCaixaAuxiliar := AIDCaixa;

//  ACBrNFeDANFCEFR1.Impressora := Estacao.Impressora.FilaImpressao;
//  ACBrNFeDANFCEFR1.FastFile   := Estacao.Impressora.ArquivoDanfe;
//  ACBrNFe1.DANFE := ACBrNFeDANFCEFR1;

  result := False;
  NumeroNFCe := 0;
  XMLJaGerado := False;
  DataFimDaNota := 0;
  sNFE := '';
  if Trim(dmCaixa.Estacao.Dados.CodigoMunicipio) = '' then
  begin
    frmMensagem.MostraMensagemErro('O código do município, deve ser preenchido no cadastro da empresa.');
    raise Exception.Create('O código do município, deve ser preenchido no cadastro da empresa.');
  end;

  flAchou := False;
  for i:= Low(DFeUF) to High(DFeUF) do
    if DFeUF[I] = UpperCase(dmCaixa.Estacao.Dados.UF) then
      flAchou := True;

  if not flAchou then
  begin
    frmMensagem.MostraMensagemErro('A UF da empresa, deve ser preenchida no cadastro da empresa.');
    raise Exception.Create('A UF da empresa, deve ser preenchida no cadastro da empresa.');
  end;

  SituacaoNFE := '';
  NotaConfirmada := False;

  try
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.Configuracoes.Geral.ModeloDF := moNFCe;
    ACBrNFe1.Configuracoes.Geral.VersaoDF := ve400;
    with TFDQuery.Create(Application) do
    begin
      Connection := dmCaixa.dbTotalFastFood;
      SQL.Text := Format('select NFE, NumeroNFE, SituacaoNFE, DataFim from Vendas.Contas ' +
        'where idEmpresa = %d and idCaixa = %d and idConta = %d ',
        [dmCaixa.Estacao.idEmpresa, idCaixaAuxiliar, AIDConta]);
      Open;

      if not FieldByName('NumeroNFE').isnull then
      begin
        NumeroNFCe := FieldByName('NumeroNFE').asinteger;
        XMLJaGerado := True;
      end;

      if not FieldByName('SituacaoNFE').IsNull then
        SituacaoNFE := FieldByName('SituacaoNFE').AsString;

      if not FieldByName('NFE').IsNull then
        sNFE := FieldByName('NFE').AsString;

      Close;

      if NumeroNFCe = 0 then
      begin
        //*** Atualizo o numero da NFE na conta
        SQL.Text := format('declare @idEmpresa int = %d; ' +
          'declare @NumeroNFCE int = cast((select numeroNFCe from contabil.empresas where idEmpresa = @idEmpresa) as int) ; ' +
          'if @NumeroNFCE is null ' +
          '  Set @NumeroNFCE = 0; ' +
          'Set @NumeroNFCE = @NumeroNFCE + 1; ' +
          'update Contabil.empresas set NumeroNFCe = @NumeroNFCE where idEmpresa = @idEmpresa ' +
          'Select @NumeroNFCE', [dmCaixa.Estacao.idEmpresa]);
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          raise Exception.Create('Erro buscando próximo número de NFC-e.');
        end;

        NumeroNFCe := Fields.Fields[0].AsInteger;

        Close;
        SQL.Text := format('update Vendas.Contas set numeroNFE= %d where idEmpresa = %d and idCaixa = %d and idConta = %d',
          [NumeroNFCe, dmCaixa.Estacao.idEmpresa, idCaixaAuxiliar, AIDConta]);
        ExecSQL;

        if RowsAffected <= 0 then
          raise Exception.Create('Erro atualizando conta. Inserindo número da NFC-e. Numero');
      end;

      Free;
    end;

    if NumeroNFCe = 0 then
      raise Exception.Create('Retornou número 0 para a NFC-e.');

    if (trim(ADocumento) <> '') and (ATipoDocumento <> docCNH) then
    begin
      frmPrincipal.ACBrValidador1.Documento := ADocumento;
      frmPrincipal.ACBrValidador1.TipoDocto := ATipoDocumento;

      if Not frmPrincipal.ACBrValidador1.Validar then
        raise Exception.Create('CPF / CNPJ - Inválido.');
    end;


    if ((SituacaoNFE = '') and (not XMLJaGerado)) or (ACBrNFe1.Configuracoes.Geral.FormaEmissao = teOffLine) or
    (dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe) or (AContingencia) then
    begin
      fBobinaECF.AtualizaBobina('Gerando NFC-e.');
      GerarNotaEletronica(dmCaixa.dbTotalFastFood, ACBrNFe1, NumeroNFCe, AContingencia or dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe,
        dmCaixa.Estacao.Faturamento.TipoAmbiente = taProducao, dmCaixa.Estacao, ADocumento, ANome, AIE, AIDConta, AIDMesaCartaoSenha, ANomeConvenio, Now, idCaixaAuxiliar);

      MudaStatusConta('G', ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID);

      if (SituacaoNFE = '') and (not AContingencia) and (not dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe) then
        TentaEnviarNFE(False, True, False);
    end
    else if (SituacaoNFE = 'R') or (SituacaoNFE = 'A') or (SituacaoNFE = 'E') or (SituacaoNFE = 'G') or (XMLJaGerado) then
    begin
      sMes := IntToStr(MonthOf(Now));
      if Length(sMes) = 1 then
        sMes := '0' + sMes;

      sArquivo := sNFE;
      sArquivo := copy(sArquivo, 4, length(sArquivo) -1) + '-nfe.xml';
      sArquivoOriginal := ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\' + IntToStr(YearOf(Now)) + sMes + '\' + sArquivo;
      if FileExists(sArquivoOriginal) and (not dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe) then
        ACBrNFe1.NotasFiscais.LoadFromFile(sArquivoOriginal, False)
      else
        GerarNotaEletronica(dmCaixa.dbTotalFastFood, ACBrNFe1, NumeroNFCe, AContingencia or dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe,
          dmCaixa.Estacao.Faturamento.TipoAmbiente = taProducao, dmCaixa.Estacao, ADocumento, ANome, AIE, AIDConta,
          AidMesaCartaoSenha, ANomeConvenio, Now);

      if (not dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe) and (not AContingencia) then
      begin
        try
          ACBrNFe1.WebServices.Consulta.NFeChave := StringReplace(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,'NFe','',[rfIgnoreCase]);
          ACBrNFe1.WebServices.Consulta.Executar;
        except
          on e : exception do
          begin
            if not ((ACBrNFe1.WebServices.Consulta.cStat = 100) or (ACBrNFe1.WebServices.Consulta.cStat = 204) or
            (ACBrNFe1.WebServices.Consulta.cStat = 228) or (ACBrNFe1.WebServices.Consulta.cStat = 539) or
            (ACBrNFe1.WebServices.Consulta.cStat = 562) or (ACBrNFe1.WebServices.Consulta.cStat = 217) or
            (ACBrNFe1.WebServices.Consulta.cStat = 557)) then
              raise Exception.Create('Retorno consultar NFE --> IDConta = ' + AIDConta.ToString + ', NFE = ' +
                QuotedStr(ACBrNFe1.WebServices.Consulta.NFeChave) + ', código de retorno : ' +
                ACBrNFe1.WebServices.Consulta.cStat.ToString + ', mensagem de retorno : ' + ACBrNFe1.WebServices.Consulta.xMotivo +
                ', Exceção retornada --> ' + e.Message);
          end;
        end;


        case ACBrNFe1.WebServices.Consulta.cStat of
          //*** Autorizado o uso da NF-e
          100,
          //*** Duplicidade de NF-e [nRec:999999999999999]
          204 : begin
            NotaConfirmada := True;
            MudaStatusConta('A');
          end;
          //*** Rejeição: Data de Emissão muito atrasada
          228 : NotaConfirmada := TentaEnviarNFE(False, True, True);
          //*** Duplicidade de NF-e com diferença na Chave de Acesso [chNFe: 99999999999999999999999999999999999999999999][nRec:999999999999999]
          539,
          //*** Rejeição: Código Numérico informado na Chave de Acesso difere do Código Numérico da NF-e [chNFe:99999999999999999999999999999999999999999999]
          562 : begin
            if pos('chNFe:', ACBrNFe1.WebServices.Consulta.xMotivo) > 1 then
            begin
              MudaStatusConta('R', 'NFe' + copy(ACBrNFe1.WebServices.Consulta.xMotivo, pos('chNFe:', ACBrNFe1.WebServices.Consulta.xMotivo) + 6, 44));
              NotaConfirmada := TentaEnviarNFE(False, True, True);
            end
            else
              raise Exception.Create('Exceção não tratada para retorno da consulta de NFE código 562.');
          end;
          //*** Rejeição: NF-e não consta na base de dados da SEFAZ
          217,
          //*** Rejeição: A Justificativa de entrada em contingência deve ser informada.
          557 : NotaConfirmada := TentaEnviarNFE(False, True, False);
        else
          NotaConfirmada := TentaEnviarNFE(False, True, False);
        end;
      end;
    end
    else
      raise Exception.Create('Situação da NFE não tratada');

    if ACBrNFe1.NotasFiscais.Items[0].Confirmada or (ACBrNFe1.Configuracoes.Geral.FormaEmissao <> teNormal) or
      (dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe) or NotaConfirmada or AContingencia then
    begin
      Result := true;
      if (ACBrNFe1.Configuracoes.Geral.FormaEmissao = teOffLine) or (AContingencia) or (dmCaixa.Estacao.Faturamento.ModoContingenciaNFCe) then
      begin
        ACBrNFe1.NotasFiscais.Assinar;
        ACBrNFe1.NotasFiscais.Validar;
        ACBrNFe1.NotasFiscais.GravarXML;
      end;

      ACBrNFe1.NotasFiscais.Imprimir;

      if ACBrNFe1.Configuracoes.Geral.FormaEmissao = teNormal then
        MudaStatusConta('A', ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)
      else
        MudaStatusConta('C', ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID);
    end;

    ACBrNFe1.NotasFiscais.Clear;

    if Estacao.Impressora.ModeloImpressora <> ppTexto then
      frmPrincipal.Impressora.Desativar;

    result := True;
  except
    on e : exception do
    begin
      result := false;
      RegistrarLog('Ocorreu o seguinte erro emitindo a NFE - ' + e.Message);
      fBobinaECF.AtualizaBobina('Ocorreu o seguinte erro emitindo a NFE - ' + e.Message);
      ACBrNFe1.NotasFiscais.Clear;
    end;
  end;
end;
end.

