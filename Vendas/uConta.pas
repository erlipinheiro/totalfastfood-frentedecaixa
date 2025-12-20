unit uConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient,
  Data.FMTBcd, Data.SqlExpr, Vcl.ImgList, uClasses,
  Vcl.ComCtrls, Datasnap.Provider, Vcl.Imaging.jpeg, DataModuleCaixa, synaser,   System.StrUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrECF, ACBrECFClass,
  DateUtils, ACBrDevice, System.ImageList, Constantes,
  ACBrBase, ACBrTEFD, ACBrTEFDClass, System.TypInfo, ACBrMail, ACBrDFe, ACBrNFe,
  ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrPosPrinter, ACBrDFeException,
  System.Math, ACBrDFeSSL, IdBaseComponent, ACBRValidador,
  IdComponent, IdTCPConnection, ACBrNFeDANFEFRDM, ACBrNFeDANFEFR;

type
  TEstadoEcfSimulado = (tpsLivre, tpsVenda, tpsSubTotal, tpsTotalPagar, tpsPagamento, tpsRelatorio);

  TfrmConta = class(TForm)
    pnlProdutosPrincipal: TPanel;
    Panel1: TPanel;
    pnlTotal: TPanel;
    qryContas: TFDQuery;
    lblValorTotal: TLabel;
    ImageList1: TImageList;
    pnlProdutos: TScrollBox;
    pnlItens: TScrollBox;
    btnVoltar: TImage;
    btnExcluirTodoPedido: TImage;
    btnCalculadora: TPanel;
    Label1: TLabel;
    pnlCentro: TPanel;
    qryNovaSenha: TFDQuery;
    qryNovoItem: TFDQuery;
    qryNovaConta: TFDQuery;
    qryBaixa: TFDQuery;
    pnlLinhasProdutos: TScrollBox;
    qryLinhasProduto: TFDQuery;
    pnlMesaCartao: TPanel;
    lblGarcom: TLabel;
    lblGarcomNome: TLabel;
    Label4: TLabel;
    lblData: TLabel;
    lblDataHoraAbertura: TLabel;
    btnConferencia: TPanel;
    btnNaoConferencia: TPanel;
    Label5: TLabel;
    btnTipoVenda: TPanel;
    pnlTipoVendaConta: TPanel;
    lblTipoVenda: TLabel;
    pnlEditSenha: TPanel;
    edtSenha: TEdit;
    qryCupomFiscal: TFDQuery;
    pnlCodigoProduto: TPanel;
    Label2: TLabel;
    btnIncluirProduto: TButton;
    edtCodigoProduto: TEdit;
    Label3: TLabel;
    edtQtdeProduto: TEdit;
    btnExcluirProduto: TButton;
    lblProduto: TLabel;
    TimerInatividade: TTimer;
    timerAtualizaPainelItens: TTimer;
    ACBrTEFD1: TACBrTEFD;
    ACBrMail1: TACBrMail;
    btnPromocoes: TPanel;
    pnlPromocao: TPanel;
    btnPagamento: TImage;
    btnExcluirPromocao: TPanel;
    lblDescricaoPromocao: TLabel;
    btnSenha: TPanel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnlProdutosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure btnExcluirTodoPedidoClick(Sender: TObject);
    procedure btnMaisVendidosClick(Sender: TObject);
    procedure btnConferenciaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNaoConferenciaClick(Sender: TObject);
    procedure btnTipoVendaClick(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure pnlCodigoProdutoResize(Sender: TObject);
    procedure TimerInatividadeTimer(Sender: TObject);
    procedure timerAtualizaPainelItensTimer(Sender: TObject);
    procedure ACBrTEFD1AguardaResp(Arquivo: string; SegundosTimeOut: Integer;
      var Interromper: Boolean);
    procedure ACBrTEFD1AntesCancelarTransacao(RespostaPendente: TACBrTEFDResp);
    procedure ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
    procedure ACBrTEFD1BloqueiaMouseTeclado(Bloqueia: Boolean;
      var Tratado: Boolean);
    procedure ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
      Resp: TACBrTEFDResp; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
      Valor: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFImprimeVia(
      TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer;
      ImagemComprovante: TStringList; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1DepoisConfirmarTransacoes(
      RespostasPendentes: TACBrTEFDRespostasPendentes);
    procedure ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
      Mensagem: string; var AModalResult: TModalResult);
    procedure ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
      var RetornoECF: string);
    procedure ACBrTEFD1MudaEstadoReq(EstadoReq: TACBrTEFDReqEstado);
    procedure ACBrTEFD1MudaEstadoResp(EstadoResp: TACBrTEFDRespEstado);
    procedure ACBrTEFD1RestauraFocoAplicacao(var Tratado: Boolean);
    procedure ACBrNFe1TransmitError(const HttpError, InternalError: Integer;
      const URL, DadosEnviados, SoapAction: string; var Retentar,
      Tratado: Boolean);
    procedure btnPromocoesClick(Sender: TObject);
    procedure btnExcluirPromocaoClick(Sender: TObject);
    procedure btnSenhaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations}
    ExigirCPF : boolean;
    flErroTransmissaoNFCe : boolean;
    flTEFCancelado : boolean;
    CPFCNPJ : string;
    Nome : string;
    IE : string;
    ListaUltimosPedidos : string;
    FidConta: integer;
    FidMesaCartaoSenha: integer;
    FTipoVenda: TTipoVenda;
    FidGarcom: integer;
    ValorDesconto : double;
    NumeroCupom : AnsiString;
    NumeroSerieECF : AnsiString;
    AtualizaValorTotalContaTabela : Boolean;
    FidPessoa: integer;
    FidPedido: integer;
    FNomeGarcom: string;
    FStatus: TStatusConta;
    FidConvenio: integer;
    procedure AtualizaPainelItens;
    procedure AtualizaTotalConta;
    procedure BaixaItensDoEstoque(Const AItem : TItem);
    function  CarregaFormularioCombo(AItem : TItem; AProduto : TProduto; Combo : boolean; AidTipoRelacionamento : integer) : boolean;
    procedure ImprimeCupomFiscal(Nome : string);
    function RestricaoPorHorario : boolean;
    procedure ItemClick(Sender : TObject);
    procedure AdicionarClick(Sender : TObject);
    procedure ExcluirClick(Sender : TObject);
    procedure RetirarClick(Sender: TObject);
    procedure TamanhoClick(Sender : TObject);
    procedure ProdutoClick(Sender : TObject; Const QuantidadePadrao : integer = -1);
    procedure SetidConta(const Value: integer);
    procedure SetidMesaCartaoSenha(const Value: integer);
    procedure SetTipoVenda(const Value: TTipoVenda);
    procedure SetidGarcom(const Value: integer);
    procedure SetidPessoa(const Value: integer);
    procedure SetidPedido(const Value: integer);
    procedure SetNomeGarcom(const Value: string);
    procedure SetStatus(const Value: TStatusConta);
    procedure ResetTimerInatividade;
    procedure LimpaLinhaProdutos;
    procedure SetidConvenio(const Value: integer);
  public
    { Public declarations }
    estadoSimuladoEcf : tEstadoEcfSimulado;
    TipoTransacao : String;
    RedeAdquirente : string;
    ValorTotal : Real;
    ProdutoAtual : TProdutoPanel;
    procedure HabilitaEdicao(Const AValue : boolean);
    procedure btnLinhaProdutoClick(Sender: TObject);
    procedure AtualizaPainelProdutos(const AidItem : integer; Const AIndex : integer; const AOwner : TWinControl;
                                     const flCombo : boolean; const AidTipoRelacionamento : Integer; Const AtualizaTela : boolean;
                                     Const QtdeMaxima : integer = 0);
    procedure AtualizaVisualizacao;
    function  ExistePedido : boolean;
    function  NovaConta : integer;
    function  RetornaContaAberta : integer;

    property  idPessoa : integer read FidPessoa write SetidPessoa;
    property  idConta : integer read FidConta write SetidConta;
    property  idPedido : integer read FidPedido write SetidPedido;
    property  idMesaCartaoSenha : integer read FidMesaCartaoSenha write SetidMesaCartaoSenha;
    property  idGarcom : integer read FidGarcom write SetidGarcom;
    property  NomeGarcom : string read FNomeGarcom write SetNomeGarcom;
    property  TipoVenda : TTipoVenda read FTipoVenda write SetTipoVenda;
    property  Status : TStatusConta read FStatus write SetStatus;
    property idConvenio : integer read FidConvenio write SetidConvenio;
  end;

var
  frmConta: TfrmConta;

implementation

uses
  uPagamento, uCombo, uCalculadora, uPrincipal, uMensagem, frmBobinaECF,
  uSelecionaPessoa, uSelecionaTipoVenda, uSenha, uSelecionaAreaProducao,
  uPergunta, uFuncoes, pcnConversao, pcnConversaoNFe, uSelecionaPromocoes;
{$R *.dfm}

procedure TfrmConta.FormActivate(Sender: TObject);
var
  i,
  horizontalAtual,
  verticalAtual,
  nroHorizontal : integer;
  arrayCombos : array of tCombo;
begin
  try

    //*** Atualizo o painel de Linhas de produtos
    with qryLinhasProduto do
    begin
      Close;
      ParamByName('idEmpresa').AsInteger := dmCaixa.Estacao.idEmpresa;
      Open;

      try
        while pnlLinhasProdutos.ControlCount > 0 do
          pnlLinhasProdutos.Controls[0].Free;
      except
        on e : exception do
          raise exception.create ('Erro limpando painel de linhas de produtos.');
      end;

      with TPanel.Create(pnlLinhasProdutos) do
      begin
        Height := dmCaixa.Estacao.ConfiguracoesVisuais.AlturaLinhasProduto;
        Top := 5;
        Left := 5;
        Parent := pnlLinhasProdutos;
        Width := dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoLinhasProduto;
        Caption := 'Mais Vendidos';
        Color := clGreen;
        Font.Name := 'ROBOTO';
        Font.Size := dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoFonteLinhasProduto;
        Font.Color := clWhite;
        Tag := -1;
        OnClick := btnMaisVendidosClick;
        BevelInner := bvNone;
        BevelKind := TBevelKind(bkNone);
        BevelOuter := TBevelCut(bkNone);
        BorderStyle := TBorderStyle(bkNone);
      end;


      //*** Primeiro verifico quantos cabem na horizontal
      //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
      nroHorizontal   := Trunc(pnlLinhasProdutos.Width / (dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoLinhasProduto + 5)) - 1;

      horizontalAtual := 1;
      verticalAtual   := 0;

      while not eof do
      begin
        with TPanel.Create(pnlLinhasProdutos) do
        begin
          Height := dmCaixa.Estacao.ConfiguracoesVisuais.AlturaLinhasProduto;

          if horizontalAtual > nroHorizontal then
          begin
            horizontalAtual := 0;
            Inc(verticalAtual);
          end;

          Top  := verticalAtual * (dmCaixa.Estacao.ConfiguracoesVisuais.AlturaLinhasProduto + 5) + 5;
          Left := horizontalAtual * (dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoLinhasProduto + 5) + 5;
          Parent := pnlLinhasProdutos;
          Width := dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoLinhasProduto;
          Caption := FieldByName('Descricao').AsString;
          Color := FieldByName('CorFundo').AsInteger;
          Font.Name := 'ROBOTO';
          Font.Size := dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoFonteLinhasProduto;
          Font.Color := FieldByName('CorFonte').AsInteger;
          Tag := FieldByName('idLinha').AsInteger;
          OnClick := btnLinhaProdutoClick;
          BevelInner := bvNone;
          BevelKind := TBevelKind(bkNone);
          BevelOuter := TBevelCut(bkNone);
          BorderStyle := TBorderStyle(bkNone);
        end;

        Inc(horizontalAtual);
        Next;
      end;
    end;

    pnlLinhasProdutos.Height := (dmCaixa.Estacao.ConfiguracoesVisuais.AlturaLinhasProduto + 10) + verticalAtual * (dmCaixa.Estacao.ConfiguracoesVisuais.AlturaLinhasProduto + 5);

    AtualizaPainelProdutos(0, -1, frmConta.pnlProdutos, False, -1, True);
                                                                                               //*** Inserido no INI, para forçar o tipo da venda
    if (dmCaixa.Estacao.Caixa.TipoEstacao = teCaixaBalcao) and ((TipoVenda = tvVendaBalcao) or (dmCaixa.TipoEstacao <> teNenhum))then
      idConta := RetornaContaAberta
    else if dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento then
    begin
      btnExcluirTodoPedido.Visible := False;
      btnPagamento.Visible := False;
//      btnConferencia.Visible := False;
      btnNaoConferencia.Visible := False;
    end;

    if TipoVenda <> tvVendaMesa then
    begin
      lblData.Visible := False;
      lblDataHoraAbertura.Visible := False;
      lblGarcom.Visible := False;
      lblGarcomNome.Visible := False;
    end;

    if idConta <= 0 then
      raise exception.Create('Não foi informado o ID da conta.');

    //*** Carrego os itens da conta, se existirem
    try
      dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, -1);
    except
      on e : exception do
        raise Exception.Create('Erro buscando os ítens da conta [' + IntToStr(Self.idConta) + ']' + #10#13 +
                               e.Message);
    end;

    dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, AdicionarClick, ExcluirClick, ItemClick, RetirarClick, TamanhoClick);
    AtualizaValorTotalContaTabela := False;

    btnPromocoes.Visible := False;
    pnlPromocao.Visible := False;
    lblDescricaoPromocao.Caption := '';

    //*** Verifico se a Empresa tem promoções com ativação manual
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := format('select 1 from Vendas.EmpresaPromocoes epro inner join produtos.Promocoes pro on pro.idPromocao = epro.idPromocao ' +
        'where idEmpresa = %d', [dmCaixa.Estacao.idEmpresa]);
      Open;

      btnPromocoes.Visible := RecordCount > 0;

      Close;
    end;

    if btnPromocoes.Visible then
    begin
      //*** Verifico se existe promoção com ativação manual para esta conta;
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := format('select pro.idPromocao, pro.ExigirCPF, pro.Descricao from Vendas.ContaPromocoes cp inner join produtos.Promocoes pro on pro.idPromocao = cp.idPromocao ' +
          'where idEmpresa = %d and idCaixa = %d and idConta = %d',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta]);
        Open;

        if RecordCount > 0 then
        begin
          if not FieldByName('Descricao').IsNull then
          begin
            lblDescricaoPromocao.Caption := FieldByName('Descricao').AsString;
            ExigirCPF := FieldByName('ExigirCPF').AsBoolean;
            pnlPromocao.Visible := True;
          end;
        end;

        Close;
      end;
    end;

    //*** Por fim atualizo os valores
    AtualizaTotalConta;

    if TipoVenda <> tvVendaBalcao then
      TimerInatividade.Enabled := True;
  except
    on e : exception do
    begin
      raise exception.create ('Abrindo formulario de conta.' + sLineBreak + e.Message);
      Close;
    end;
  end;

end;

procedure TfrmConta.FormClose(Sender: TObject; var Action: TCloseAction);
var
  AProduto : TProdutoPanel;
  AItem : TItem;
  cancelar : boolean;
  i : integer;
  s : string;
begin
  cancelar := False;
  try
    if (FidPedido > 0) then
    begin
      s := Format('update vendas.Pedidos set HoraFim = GetDate() where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idPedido = %d)',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FidConta, FidPedido]);
      i := dmCaixa.dbTotalFastFood.ExecSQL(s);

      if i <= 0 then
        frmMensagem.MostraMensagemErro('Nenhum ítem foi atualizado.');

      if ((dmCaixa.Estacao.ConfiguracoesDaVenda.ImprimirPedido = True) and (TipoVenda <> tvVendaBalcao)) then
      begin
        if pnlItens.ControlCount > 0 then
          ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TipoVenda, idConta, FidPedido,
            idMesaCartaoSenha, '', '', FNomeGarcom, false, True, False, false, False, dmCaixa.qryDescontos);
      end;
    end;

    if ((TipoVenda = tvVendaBalcao) and (ValorTotal > 0) and (dmCaixa.Estacao.Caixa.TipoEstacao <> teLancamento)) or
       (dmCaixa.Estacao.Caixa.TipoEstacao = teCallCenter) then
    begin
      if Status <> scFinalizada then
      begin
        if MessageDlg('Deseja cancelar esta venda de balcão?', mtConfirmation, [mbNo, mbYes], 0) = IDYes then
        begin
          btnExcluirTodoPedidoClick(Self);
          Cancelar := True
        end;
      end;
    end;

    if (Not Cancelar) and (FStatus <> scConferencia) and (FStatus <> scFinalizada) and (FStatus <> scDespachou) then
    begin
      if TipoVenda = tvVendaDelivery then
      begin
        if FStatus = scAtendimento then
          SetStatus(scEmProducao);
      end
      else
        SetStatus(scAberta);
    end;
  except
    on e : exception do
    begin
      if e.ClassType = EInOutError then
      begin
        case EInOutError(e).ErrorCode of
          53 : frmMensagem.MostraMensagemErro('A impressora não foi encontrada. ' + sLineBreak + 'A impressora está ligada?' +
            sLineBreak + 'O pedido não foi enviado. Verificar a impressora.' + sLineBreak + e.Message);
          61 : frmMensagem.MostraMensagemErro('Possível falta de papel. O pedido não foi enviado. Verificar a impressora.' + sLineBreak + e.Message);
        else
          raise;
        end;
      end
      else
        raise;
    end;
  end;

  try
    LimpaLinhaProdutos;

    while pnlProdutos.ControlCount > 0 do
    begin
      AProduto := TProdutoPanel(pnlProdutos.Controls[0]);
      AProduto.Parent := Nil;
      FreeAndNil(AProduto);
    end;

    while pnlItens.ControlCount > 0 do
    begin
      AItem := TItem(pnlItens.Controls[0]);
      AItem.Parent := Nil;
      FreeAndNil(AItem);
    end;

  except
    on e : exception do
      raise exception.create ('Fechando formulario de conta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.FormCreate(Sender: TObject);
begin
  try
    if dmCaixa.Estacao.Faturamento.TEF then
    begin
      try
        ACBrTEFD1.Inicializar(gpTefDial);
        estadoSimuladoEcf := tpsLivre;
      except
        on e : exception do
          raise Exception.Create('Erro inicializando o TEF.' + sLineBreak + e.Message);
      end;
    end;

    flTEFCancelado := False;
    ExigirCPF := False;
    idGarcom := 0;
    idConta := 0;
    idPessoa := 0;
    idPedido := 0;
    idMesaCartaoSenha := 0;
    TipoVenda := tvNenhum;
    ProdutoAtual := Nil;

    HabilitaEdicao(False);

    BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;

    WindowState := wsMaximized;

    DrawRounded(btnCalculadora);
    DrawRounded(btnConferencia);
    DrawRounded(btnNaoConferencia);
    DrawRounded(btnSenha);
    DrawRounded(btnPromocoes);

    lblGarcomNome.Caption := '';
    lblDataHoraAbertura.Caption := '';

    ListaUltimosPedidos := '';

    btnSenha.Visible := dmCaixa.Estacao.ChamarSenha;
  except
    on e : exception do
      raise exception.create ('Criando formulario de conta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if Sender <> edtSenha then
//  begin
//    if key = #13 then
//      btnVoltarClick(Sender)
//    else if key in ['0'..'9', '.', ',', #9] then
//    begin
//      if not pnlQuantidade.Visible then
//      begin
//        pnlQuantidade.Visible := True;
//        edtQuantidade.Text := key;
//      end
//      else
//      begin
//        if key in ['0'..'9', '.', ','] then
//        begin
//          if key = '.' then
//            edtQuantidade.Text := edtQuantidade.Text + ','
//          else
//            edtQuantidade.Text := edtQuantidade.Text + key;
//        end
//        else
//          edtQuantidade.Text := copy (edtQuantidade.Text, 1, length(edtQuantidade.Text) - 1);
//      end;
//    end;
//  end;
end;

procedure TfrmConta.FormShow(Sender: TObject);
begin
  dmCaixa.VerificaSeExisteAtualizacaoDeDados;

  pnlEditSenha.Enabled := dmCaixa.Estacao.ConfiguracoesDaVenda.SenhaManual;
end;

procedure TfrmConta.HabilitaEdicao(const AValue: boolean);
begin
  pnlProdutos.Enabled          := AValue;
  pnlLinhasProdutos.Enabled    := AValue;
  pnlItens.Enabled             := AValue;
  btnConferencia.Enabled       := AValue;
  btnNaoConferencia.Enabled    := AValue;
  btnPromocoes.Enabled         := AValue;
  btnExcluirPromocao.Enabled   := AValue;
  btnExcluirTodoPedido.Enabled := AValue;
end;

procedure TfrmConta.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

function TfrmConta.CarregaFormularioCombo(AItem : TItem; AProduto : TProduto; Combo : boolean; AidTipoRelacionamento : integer) : boolean;
var
  i: integer;
  AidItem : integer;
  c : Char;
  s : string;
begin
  result := False;

  if AProduto.ExisteRelacionamentoObservacaoCupom then
  begin
    frmCombo := TfrmCombo.Create(Self);

    frmCombo.Produto   := AProduto;
    frmCombo.Altura    := dmCaixa.Estacao.ConfiguracoesVisuais.AlturaProdutos;
    frmCombo.Distancia := 5;
    frmCombo.Tamanho   := dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoProdutos;
    frmCombo.AidTipoRelacionamento := AidTipoRelacionamento;

    //*** Ítem novo
    if AItem = Nil then
    begin
      frmCombo.TipoEdicao := teIncluir;
      try
//        AidItem := dmCaixa.RetornaValorSequence('Vendas.ItensSequence');
//
//        c :=FormatSettings.DecimalSeparator;
//        FormatSettings.DecimalSeparator := '.';
//
//        s := Format('insert into Vendas.Itens (idEmpresa, idCaixa, idConta, idPedido, idItem, idProduto, qtde, vlProduto, AliquotaICMS, flCombo, ' +
//            'idTipoRelacionamento, idGarcom, ImprimirPedido) values (%d, %d, %d, %d, %d, %d, %f, %f, %f, 0, -1, %d, %d)',
//            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta, Self.idPedido, AidItem, AProduto.idProduto,
//                                        AProduto.Qtde, AProduto.Valor, AProduto.AliquotaICMS, idGarcom, Integer(AProduto.ImprimirPedido)]);
//        i := dmCaixa.dbTotalFastFood.ExecSQL(s);
        AidItem := InsereItem(Self, AProduto, False, -1, idGarcom);
//        FormatSettings.DecimalSeparator := c;

        frmCombo.idItem := AidItem;
      except
        on e : exception do
          raise exception.Create('Função Insere Ítem. Produto - ' + AProduto.Descricao + sLineBreak + e.Message);
      end;
    end
    else
    begin
      frmCombo.idItem := AItem.idItem;
      frmCombo.TipoEdicao := teAlterar;
    end;

    if AProduto.NaoTemCombo then
    begin
      frmCombo.chkCombo.Checked := False;
      frmCombo.chkCombo.Enabled := False;
    end
    else
    begin
      if AProduto.SomenteCombo then
      begin
        frmCombo.SomenteCombo := True;
        frmCombo.Combo := True;
        frmCombo.chkCombo.Checked := frmCombo.Combo;
        frmCombo.chkComboClick(frmCombo.chkCombo);
      end
      else
      begin
        frmCombo.chkCombo.Checked := Combo;
        frmCombo.Combo     := Combo;
      end;
    end;

    result := frmCombo.ShowModal = mrOk;

    dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, -1);
    AtualizaVisualizacao;

    FreeAndNil(frmCombo);
  end;
end;

procedure TfrmConta.edtSenhaChange(Sender: TObject);
var
  i : integer;
begin
  if edtSenha.Text <> '' then
  begin
    if TryStrToInt(edtSenha.Text, i) then
      FidMesaCartaoSenha := i
    else
    begin
      edtSenha.Text := '';
      FidMesaCartaoSenha := 0;
      frmMensagem.MostraMensagem('Valor da senha inválido.');
    end;
  end;
end;

procedure TfrmConta.btnExcluirPromocaoClick(Sender: TObject);
begin
  //*** Retiro a promocao
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('delete from Vendas.ContaPromocoes where idEmpresa = %d and idCaixa = %d and idConta = %d',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta]);
    ExecSQL;

    if RowsAffected <= 0 then
      raise Exception.Create('Erro excluindo promoção.')
    else
    begin
      lblDescricaoPromocao.Caption := '';
      ExigirCPF := False;
      pnlPromocao.Visible := False;

      AtualizaTotalConta;
    end;

    Close;
  end;

end;

procedure TfrmConta.btnExcluirTodoPedidoClick(Sender: TObject);
var
  idUsuarioEstorno : integer;
  AItem : TItem;
begin
  if (dmCaixa.Estacao.ConfiguracoesDaVenda.Estornar) then
  begin
    if MessageDlg('Deseja excluir todo o pedido?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
    begin
      if dmCaixa.SenhaOK(19, idUsuarioEstorno) then
      begin
        dmCaixa.AtualizaHistoricoConta(idConta, scExcluirTodoPedido, idUsuarioEstorno);

        pnlItens.Visible := False;
        While pnlItens.ControlCount > 0 do
        begin
          TItem(pnlItens.Controls[pnlItens.ControlCount -1]).ExcluiItem(Sender, TItem(pnlItens.Controls[pnlItens.ControlCount -1]),
            False, TipoVenda, TItem(pnlItens.Controls[pnlItens.ControlCount -1]).NumeroFilhos > 0, idUsuarioEstorno);

          AItem := TItem(pnlItens.Controls[pnlItens.ControlCount -1]);
          AItem.Parent := Nil;
          FreeAndNil(AItem);
        end;

        pnlItens.Visible := True;

        dmCaixa.LimpaPainelItens(pnlItens);
        AtualizaValorTotalContaTabela := False;
        AtualizaTotalConta;
      end;
    end;
  end;
end;

procedure TfrmConta.btnConferenciaClick(Sender: TObject);
Var
  NomeGarconConferencia : string;
  i : integer;
  idUsuarioConferencia : integer;
  s : string;
begin
  NomeGarconConferencia := '';
  idUsuarioConferencia := 0;
  if dmCaixa.Estacao.ConfiguracoesDaVenda.Conferencia then
  begin
    if dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia then
    begin
      fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
      fSelecionaPessoa.idTipoPessoa := 7;
      if fSelecionaPessoa.ShowModal = IDOK then
      begin
        NomeGarconConferencia := fSelecionaPessoa.qryPessoas.FieldByName('NomeFantasia').AsString;
        idUsuarioConferencia  := fSelecionaPessoa.qryPessoas.FieldByName('idPessoa').AsInteger;
      end;
      FreeAndNil(fSelecionaPessoa);
    end;

    if (dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia and (idUsuarioConferencia > 0)) or
       (not dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia) then
    begin
      if (FidPedido > 0) then
      begin
        i := dmCaixa.dbTotalFastFood.ExecSQL(Format('update vendas.Pedidos set HoraFim = GetDate() where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idPedido = %d)',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, Self.idPedido]));

        if i <= 0 then
          frmMensagem.MostraMensagemErro('Erro atualizando hora de finalização do pedido.');
      end;

      if (not dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia) then
        dmCaixa.AtualizaHistoricoConta(idConta, scConferencia, dmCaixa.Usuario.id)
      else
        dmCaixa.AtualizaHistoricoConta(idConta, scConferencia, idUsuarioConferencia);

      SetStatus(scConferencia);

      dmCaixa.TipoVenda := TipoVenda;

      if FidPedido > 0 then
      begin
        //*** Primeiro envio o pedido para produção
        s := Format('update vendas.Pedidos set HoraFim = GetDate() where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idPedido = %d)',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FidConta, FidPedido]);
        i := dmCaixa.dbTotalFastFood.ExecSQL(s);

        if i <= 0 then
          frmMensagem.MostraMensagemErro('Erro atualizando hora de finalização do pedido.');

        if (dmCaixa.Estacao.ConfiguracoesDaVenda.ImprimirPedido = True) or (TipoVenda = tvVendaDelivery) then
          ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TipoVenda, idConta, FidPedido, idMesaCartaoSenha, '', '',
            FNomeGarcom, false, True, False, False, False, dmCaixa.qryDescontos);
      end;

      ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TipoVenda, idConta, 0, idMesaCartaoSenha, '', '', FNomeGarcom,
        True, False, True, False, False, dmCaixa.qryDescontos);

      Close;
    end;
  end;
end;

procedure TfrmConta.btnLinhaProdutoClick(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to pnlLinhasProdutos.ControlCount -1 do
  begin
    with TPanel(pnlLinhasProdutos.Controls[i]) do
    begin
      BevelInner := bvNone;
      BevelKind  := TBevelKind(bkNone);
      BorderStyle:= (bsNone);
    end;
  end;


  with TPanel(Sender) do
  begin
    BevelInner := bvSpace;
    BevelKind  := bkTile;
    BorderStyle:= bsSingle;
  end;

  AtualizaPainelProdutos(0, TPanel(Sender).Tag, pnlProdutos, False, -1, True);
end;

procedure TfrmConta.btnMaisVendidosClick(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to pnlLinhasProdutos.ControlCount -1 do
  begin
    with TPanel(pnlLinhasProdutos.Controls[i]) do
    begin
      BevelInner := bvNone;
      BevelKind  := bkNone;
      BorderStyle:= bsNone;
    end;
  end;


  AtualizaPainelProdutos(0, -1, pnlProdutos, False, -1, False);
end;

procedure TfrmConta.btnNaoConferenciaClick(Sender: TObject);
var
  idUsuarioNC : integer;
begin
  if dmCaixa.SenhaOK(19, idUsuarioNC) then
  begin
    try
      SetStatus(scAberta);
      dmCaixa.AtualizaHistoricoConta(idConta, scReabriu, idUsuarioNC);
    except
      on e : exception do
        raise exception.Create('Erro atualizando status da mesa para aberta.');
    end;

    Close;
  end;
end;

procedure TfrmConta.btnPagamentoClick(Sender: TObject);
var
  TipoDocumento : TACBrValTipoDocto;
  j : integer;
  nroVias : integer;
  sValor : string;
  ValorAPagar : double;
  ValorValeTroco : double;
  flFinalizou : boolean;
  flImprimindoFiscal : boolean;
  ValorString : String;
  AItem : TItem;
  flEmitirConferencia : boolean;

  function FormasPagamentoOK : boolean;
  begin
    result := True;

    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;
      SQL.Text := Format ('select sum(vlPagamento) from vendas.ContaPagamentos with (NOLOCK) where (idEmpresa = %d) and (idCaixa = %d) and (idconta = %d)',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);
      Open;
      result := (Fields.Fields[0].AsFloat > 0) or (ValorAPagar = 0);
      Close;
      Free;
    end;
  end;

  procedure EmiteDocumentosFiscais;
  var
    i : integer;
  begin
    try
      try
        case dmCaixa.Estacao.Faturamento.TipoFaturamento of
          tfECF : begin
            if frmPrincipal.ACBrECF1.Ativo then
            begin
              if FidConvenio <> -1 then
              begin
                fBobinaECF.AtualizaBobina('Imprimindo cupom fiscal', True);
                flImprimindoFiscal := True;
                ImprimeCupomFiscal(Nome);
                flImprimindoFiscal := False;
              end;
            end;
          end;

          tfNFCe : begin
            if FidConvenio <> -1 then
            begin
              if not dmCaixa.EmiteNFCe(Self.idConta, CPFCNPJ, TipoDocumento, Nome, IE, idMesaCartaoSenha, False, Nome) then
                  dmCaixa.EmiteNFCe(Self.idConta, CPFCNPJ, TipoDocumento, Nome, IE, idMesaCartaoSenha, True, Nome);
//              if dmCaixa.Estacao.Faturamento.TEF then
//              begin
//                frmPrincipal.Impressora.CortaPapel := True;
//                frmPrincipal.Impressora.CortarPapel(True);
//                ACBrTEFD1.FinalizarCupom;
//                estadoSimuladoEcf := tpsLivre;
//              end;
            end;
          end;
        end;
      except
        on e : exception do
        begin
          NumeroCupom    := '';
          NumeroSerieECF := '';
          if (dmCaixa.Estacao.Faturamento.TEF) or (dmCaixa.Estacao.Faturamento.TipoFaturamento = tfNFCe) then
            raise exception.create('Erro emitindo documento fiscal. ' + sLineBreak + e.Message);
        end;
      end;
    except
      on e : exception do
      begin
        if flImprimindoFiscal then
        begin
          fBobinaECF.AtualizaBobina('Cancelando cupom.', True);
          frmPrincipal.ACBrECF1.CancelaCupom;
        end;

        raise Exception.Create('Erro finalizando conta.' + sLineBreak + e.Message);
      end;
    end;

    flFinalizou := True;

    frmPrincipal.Impressora.Desativar;
  end;

  procedure FinalizaVenda;
  begin
    if (dmCaixa.Estacao.Caixa.TipoEstacao = teCallCenter) or (flFinalizou) then
    begin
      try
//            dmCaixa.dbTotalFastFood.StartTransaction;

        //*** Acabou a venda, entao tento Baixar os ítens no estoque
        fBobinaECF.AtualizaBobina('Realizando baixas no estoque.', True);
        while pnlItens.ControlCount > 0 do
        begin
          if pnlItens.Controls[pnlItens.ControlCount -1] is TItem then
          begin
//            BaixaItensDoEstoque(TItem(pnlItens.Controls[pnlItens.ControlCount -1]));

            AItem := TItem(pnlItens.Controls[pnlItens.ControlCount -1]);
            AItem.Parent := Nil;
            FreeAndNil(AItem);
          end;
        end;

        //*** Atualizo a sessão de caixa nos ítens
        fBobinaECF.AtualizaBobina('Atualizo a sessão de caixa nos ítens.', True);
        with TFDQuery.Create(Self) do
        begin
          Connection := dmCaixa.dbTotalFastFood;
          SQL.Text := Format ('update Vendas.Itens set idSessaoCaixa = %d where (idEmpresa = %d) and (idCaixa = %d) and (idconta = %d) and  (idSessaoCaixa is null)',
            [dmCaixa.Estacao.Caixa.idSessaoCaixa, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);
          ExecSQL;
          Free;
        end;

        //*** Fecho a conta
        try
          fBobinaECF.AtualizaBobina('Atualizando dados da conta.', True);
          if (dmCaixa.Estacao.Caixa.TipoEstacao = teCallCenter) then
          begin
            Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta],
              ['DataFim', 'Valor', 'ValorDesconto', 'Status', 'idConvenio'],
              [Now, ValorTotal, ValorDesconto, integer(scAguardandoDelivery), -100]);
          end
          else
          begin
            if FidConvenio <> -1 then
            begin
              if idPessoa > 0 then
                Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta],
                  ['DataFim', 'Valor', 'ValorDesconto', 'idConvenio', 'idPessoa', 'idSessaoCaixa', 'idTipoVenda',
                   'Identificacao', 'Nome', 'idMesaCartaoSenha', 'NumeroCupom', 'NumeroSerieECF', 'Status'],
                  [Now, ValorTotal, ValorDesconto, FidConvenio, idPessoa, dmCaixa.Estacao.Caixa.idSessaoCaixa,
                   Integer(TipoVenda), CPFCNPJ, Nome, idMesaCartaoSenha, NumeroCupom, NumeroSerieECF, integer(scFechada)])
              else
              begin
                Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta],
                  ['DataFim', 'Valor', 'ValorDesconto', 'idConvenio', 'idSessaoCaixa', 'idTipoVenda',
                   'Identificacao', 'Nome', 'idMesaCartaoSenha', 'NumeroCupom', 'NumeroSerieECF', 'Status'],
                  [Now, ValorTotal, ValorDesconto, FidConvenio, dmCaixa.Estacao.Caixa.idSessaoCaixa,
                   Integer(TipoVenda), CPFCNPJ, Nome, idMesaCartaoSenha, NumeroCupom, NumeroSerieECF, integer(scFechada)])
              end;
            end
            else
            begin
              with TFDQuery.Create(Self) do
              begin
                Connection := dmCaixa.dbTotalFastFood;
                SQL.Clear;
                sValor := ReplaceStr(FloatToStr(ValorTotal), ',', '.');
                if ExigirCPF then
                  SQL.Text := Format('update Vendas.Contas set DataFim =r ' + QuotedStr(FormatDateTime(dmCaixa.FormatoData + ' hh:NN:ss', Now)) +
                    ', Valor = ' + sValor + ', idSessaoCaixa = %d, idConvenio = %d, idPessoa = %d, idMesaCartaoSenha = %d, status = %d, identificacao= ' + QuotedStr(CPFCNPJ) +
                    'where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d)',
                    [dmCaixa.Estacao.Caixa.idSessaoCaixa, FidConvenio, idPessoa, idMesaCartaoSenha, integer(scFechada),
                     dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta])
                else
                  SQL.Text := Format('update Vendas.Contas set DataFim = ' + QuotedStr(FormatDateTime(dmCaixa.FormatoData + ' hh:NN:ss', Now)) +
                    ', Valor = ' + sValor + ', idSessaoCaixa = %d, idConvenio = %d, idPessoa = %d, idMesaCartaoSenha = %d, status = %d '+
                    'where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d)',
                    [dmCaixa.Estacao.Caixa.idSessaoCaixa, FidConvenio, idPessoa, idMesaCartaoSenha, integer(scFechada),
                     dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);
                Execute;

                if RowsAffected<= 0 then
                  raise Exception.Create('Erro fechando a conta.' + sLineBreak + sql.Text);

                Free;
              end;
            end;
          end;
        except on e : exception do
          raise Exception.Create('Atualizando conta. ' + sLineBreak + e.Message);
        end;

        //*** Atualizo o valor vendido na sessao de caixa e do caixa, se nao for refeicao de colaborador
        if (dmCaixa.Estacao.Caixa.TipoEstacao = teCallCenter) or (FidConvenio <> -1) then
        begin
          try
            with TFDQuery.Create(Self) do
            begin
              Connection := dmCaixa.dbTotalFastFood;

              fBobinaECF.AtualizaBobina('Atualizando os valores vendidos na sessão de caixa.', True);
              SQL.Text := 'update vendas.SessoesCaixa set vlVenda = ISNULL(vlVenda, 0) + :Valor where (idEmpresa = :empresa) and (idCaixa = :Caixa) and (idSessaoCaixa = :SessaoCaixa)';
              ParamByName('Valor').DataType := ftCurrency;
              ParamByName('Empresa').DataType := ftInteger;
              ParamByName('Caixa').DataType := ftInteger;
              ParamByName('SessaoCaixa').DataType := ftInteger;

              ParamByName('Valor').Value := ValorTotal-ValorDesconto;
              ParamByName('Empresa').Value := dmCaixa.Estacao.idEmpresa;
              ParamByName('Caixa').Value := dmCaixa.Estacao.Caixa.idCaixa;
              ParamByName('SessaoCaixa').Value := dmCaixa.Estacao.Caixa.idSessaoCaixa;
              Execute;

              if RowsAffected <= 0 then
                raise Exception.Create('Sessão de caixa. Nenhum dado atualizado. ' + sLineBreak + SQL.Text);

              fBobinaECF.AtualizaBobina('Atualizando os valores vendidos no caixa diário.', True);
              SQL.Text := 'update vendas.Caixas set vlTotalVenda = ISNULL(vlTotalVenda, 0) + :Valor where (idEmpresa = :empresa) and (idCaixa = :Caixa)';
              ParamByName('Valor').DataType := ftCurrency;
              ParamByName('Empresa').DataType := ftInteger;
              ParamByName('Caixa').DataType := ftInteger;

              ParamByName('Valor').Value := ValorTotal-ValorDesconto;
              ParamByName('Empresa').Value := dmCaixa.Estacao.idEmpresa;
              ParamByName('Caixa').Value := dmCaixa.Estacao.Caixa.idCaixa;

              Execute;

              if RowsAffected <= 0 then
                raise Exception.Create('Caixa. Nenhum dado atualizado. ' + sLineBreak + SQL.Text);

              Free
            end;

          except on E: Exception do
            raise Exception.Create('Atualizando valor - ' + sLineBreak + e.Message);
          end;
        end;

//            dmCaixa.dbTotalFastFood.Commit;

        fBobinaECF.AtualizaBobina('Limpando painel de ítens.', True);
        dmCaixa.LimpaPainelItens(pnlItens);

        AtualizaValorTotalContaTabela := False;
        fBobinaECF.AtualizaBobina('Atualizando total da conta.', True);
        fBobinaECF.AtualizaBobina('Conta finalizada.', True);
        if dmCaixa.Estacao.Caixa.TipoEstacao = teCaixaBalcao then
        begin
          if dmCaixa.TipoEstacao <> teNenhum then
          begin
            case dmCaixa.TipoEstacao of
              teCaixaBalcao : TipoVenda := tvVendaBalcao;
              teCaixaMesa   : TipoVenda := tvVendaMesa;
              teCaixaCartao : TipoVenda := tvVendaCartao;
              teCallCenter  : TipoVenda := tvVendaDelivery;
            end;
          end
          else
            TipoVenda := tvVendaBalcao;
          fBobinaECF.AtualizaBobina('Iniciando nova conta.', True);
          NovaConta;
        end
        else
          AtualizaTotalConta;
      except
        on e : exception do
        begin
//              dmCaixa.dbTotalFastFood.Rollback;
          frmMensagem.MostraMensagemErro('Erro finalizando conta. ' + e.Message);
        end;
      end;
    end;

    if (dmCaixa.Estacao.Caixa.TipoEstacao = teCallCenter) or ((flFinalizou) and (dmCaixa.Estacao.Caixa.TipoEstacao <> teCaixaBalcao)) then
    begin
      dmCaixa.AtualizaHistoricoConta(Self.idConta, scEmProducao, dmCaixa.Usuario.ID);
      Close;
    end;
  end;

  procedure ImprimeOPedido;
  var
    i : integer;
    viaPedido : integer;
    viaCliente : integer;
  begin
    if dmCaixa.Estacao.ConfiguracoesDaVenda.NumeroViasPedido = 0 then
    begin
      if frmPagamento.chkEmitirPedido.Checked then
        viaPedido := 1
      else
        viaPedido := 0;
    end
    else
      viaPedido := dmCaixa.Estacao.ConfiguracoesDaVenda.NumeroViasPedido;


    //*** Se gravou tudo então imprimo o pedido
    try
      for i := 1 to viaPedido do
      begin
        if FidPedido > 0 then
          ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TipoVenda, idConta, FidPedido, idMesaCartaoSenha,
            Nome, FloatToStr(ValorAPagar), lblGarcomNome.Caption, False, True, TipoVenda = tvVendaBalcao , False,  False, dmCaixa.qryDescontos);
      end;

      if (((dmCaixa.Estacao.Faturamento.TipoFaturamento = tfECF) and (Not frmPrincipal.ACBrECF1.Ativo)) or (FidConvenio > -100) or
        (FidConvenio = -1) or (not dmCaixa.Estacao.Faturamento.EmitirDFEAutomaticamente)) and (flEmitirConferencia) then
      begin
        if dmCaixa.Estacao.ConfiguracoesDaVenda.NumeroViasPedidoSemFiscal = 0 then
        begin
          if frmPagamento.chkEmitirViaCliente.Checked then
            viaCliente := 1
          else
            viaCliente := 0;
        end
        else
          viaCliente := dmCaixa.Estacao.ConfiguracoesDaVenda.NumeroViasPedidoSemFiscal;
        for i := 1 to viaCliente do
        begin
          fBobinaECF.AtualizaBobina(format('Imprimindo conferência, via de número - %d, na impressora --> %s',[i, frmprincipal.Impressora.Porta]));
          ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TipoVenda, idConta, 0, idMesaCartaoSenha, Nome,
            FloatToStr(ValorAPagar), lblGarcomNome.Caption, True, False, True, False, False, dmCaixa.qryDescontos);
        end;
      end;
    except
      on e : exception do
        raise Exception.Create('Erro imprimindo pedido.'+ sLineBreak + e.Message);
    end;

    //*** Imprime o vale troco
    dmCaixa.ImprimeValeTroco(idConta);
  end;
begin
  TipoDocumento := docCPF;
  flImprimindoFiscal := False;
  flEmitirConferencia := true;
  ValorAPagar := 0;
  if idMesaCartaoSenha <= 0 then
  begin
    frmMensagem.MostraMensagem('Você deve indicar uma senha.');
    if edtSenha.CanFocus then
      edtSenha.SetFocus;
  end
  else
  begin
    if (FidPedido > 0) then
    begin
      j := dmCaixa.dbTotalFastFood.ExecSQL(Format('update vendas.Pedidos set HoraFim = GetDate() where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idPedido = %d)',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, Self.idPedido]));

      if j <= 0 then
        frmMensagem.MostraMensagemErro(Format('Erro atualizando hora de finalização do pedido.' + sLineBreak +
          'idEmpresa : %d' + sLineBreak +
          'idCaixa   : %d' + sLineBreak +
          'idConta   : %d' + sLineBreak +
          'idPedido  : %d',[dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, Self.idPedido]));
    end;

    flFinalizou := False;

    if TipoVenda <> tvNenhum then
    begin
      if self.ValorTotal > 0 then
      begin
        NumeroCupom  := '';
        NumeroSerieECF  := '';
        estadoSimuladoEcf := tpsVenda;

        if dmCaixa.Estacao.Caixa.TipoEstacao <> teCallCenter then
        begin
          if Status <> scFinalizada then
          begin
            frmPagamento := TfrmPagamento.Create(Self);

            //*** Se aconteceu tudo certo então fecho a conta....
            if Not (TipoVenda in [tvVendaBalcao, tvVendaDelivery]) and dmCaixa.Estacao.ConfiguracoesDaVenda.TaxaServico then
              frmPagamento.ValorAPagar := Trunc((self.ValorTotal + self.ValorTotal*10/100)*100)/100
            else
              frmPagamento.ValorAPagar := self.ValorTotal;

            ValorDesconto := RetornaPromocoes(dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, dmCaixa.qryDescontos);
            dmCaixa.qryDescontos.Close;

            frmPagamento.ValorAPagar := StrToFloat(FormatFloat('0.00', frmPagamento.ValorAPagar - ValorDesconto));

            if (frmPagamento.ShowModal = mrOk) and
               ((frmPagamento.idConvenio > -100) or ((frmPagamento.idConvenio = -100) and (FormasPagamentoOK)))
               then
            begin
              flEmitirConferencia := not frmPagamento.chkEmitirDFE.Checked;
              idConvenio := frmPagamento.idConvenio;
              ValorAPagar := frmPagamento.ValorAPagar;
//              if ExigirCPF then
//              begin
//                frmPergunta.LimpaFormulario;
//                frmPergunta.lblPergunta.Height := 113;
//                frmPergunta.lblPergunta.Caption := 'Digite o CPF do cliente.';
//                frmPergunta.btnSIM.Caption := 'OK';
//                frmPergunta.btnNAO.Caption := 'Cancelar';
//                frmPergunta.edtCPF.Visible := True;
//                frmPergunta.edtCPF.Text := '';
//                frmPergunta.Teclado.Visible := True;
//                frmPergunta.ActiveControl := frmPergunta.edtCPF;
//                if frmPergunta.ShowModal = mrOk then
//                begin
//                  frmPergunta.btnSIM.Caption := 'SIM';
//                  frmPergunta.btnNAO.Caption := 'NÃO';
//                  CPFCNPJ := trim(frmPergunta.edtCPF.Text);
//                  frmPergunta.edtCPF.Text := '';
//                end
//                else
//                begin
//                  frmPergunta.edtCPF.Text := '';
//                  frmPergunta.btnSIM.Caption := 'SIM';
//                  frmPergunta.btnNAO.Caption := 'NÃO';
//                  Exit;
//                end;
//              end;

              SetStatus(scFinalizada);

              if TipoVenda <> tvVendaDelivery then
                idPessoa := 0;

              if frmPagamento.idPessoa > 0 then
                idPessoa := frmPagamento.idPessoa;

              fBobinaECF := TfBobinaECF.Create(Self);
              fBobinaECF.Show;
              fBobinaECF.wbBobina.Navigate('about:blank');
              fBobinaECF.mmoECF.Clear;
              fBobinaECF.AtualizaBobina('Iniciando transação com o banco de dados.', True);
              Nome := '';

              if idPessoa > 0 then
              begin
                with dmCaixa.qryAuxiliar do
                begin
                  Close;
                  SQL.Text := 'select RazaoSocial from Contabil.Pessoas WITH (NOLOCK) where (idPessoa = ' +
                    IntToStr(idPessoa) + ')';

                  Open;

                  if not FieldByName('RazaoSocial').IsNull then
                    Nome := FieldByName('RazaoSocial').AsString;
                end;
              end
              else
              begin
                Nome := frmPagamento.edtNome.Text;
                if trim(CPFCNPJ) = '' then
                begin
                  CPFCNPJ := frmPagamento.edtDocumento.Text;
                  case frmPagamento.rgTipoDocumento.ItemIndex of
                    1 : TipoDocumento := docCPF;
                    2 : TipoDocumento := docCNPJ;
                  end;
                end;
              end;

              //*** Gravo os descontos aplicados
              with dmCaixa.qryAuxiliar do
              begin
                Close;
                SQL.Text := format('update vendas.itens set idPromocaoAplicada=D.idPromocao, Tipo=D.Tipo, Condicao=D.Condicao, Exclusiva=D.Exclusiva, ' +
                  'Prioridade=D.Prioridade, ValorDesconto=D.ValorDesconto, idSessaoCaixa = %d ' +
                  'from vendas.itens i ' +
                  'inner join (select * from Vendas.RetornaDescontos(%d,%d,%d)) as D ' +
                  ' on i.idempresa = d.idempresa and i.idcaixa=d.idcaixa and i.idconta = d.idconta and i.idItem=d.idItem',
                  [dmCaixa.Estacao.Caixa.idSessaoCaixa, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);

                ExecSQL;

                Close;
              end;

              frmPrincipal.Impressora.Desativar;
              frmPrincipal.Impressora.ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
              frmPrincipal.Impressora.Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
              frmPrincipal.Impressora.Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
              frmPrincipal.Impressora.LinhasEntreCupons := dmCaixa.Estacao.Impressora.LinhasEntreCupons;
              frmPrincipal.Impressora.CortaPapel := not dmCaixa.Estacao.Faturamento.TEF;

              try
                frmPrincipal.Impressora.Ativar;
              except
                on e : exception do
                begin
                  frmMensagem.MostraMensagemErro('A impressora do cupom está desligada ou sem acesso.');
                  raise Exception.Create('Não foi possível ativar a impressora ' + dmCaixa.Estacao.Impressora.NomeImpressora + slinebreak + e.message);
                end;
              end;

              if dmCaixa.Estacao.ConfiguracoesDaVenda.AberturaAutomaticaGaveta then
                frmPrincipal.Impressora.AbrirGaveta;

              if (dmCaixa.Estacao.Faturamento.EmitirDFEAutomaticamente) or (frmPagamento.chkEmitirDFE.Checked) then
                EmiteDocumentosFiscais
              else
                flFinalizou := True;

              ImprimeOPedido;

              FinalizaVenda;
            end
            else
              frmMensagem.MostraMensagem('Forma de pagamento inválida. Tente novamente.');

            FreeAndNil(frmPagamento);
          end
          else
          begin
            TipoDocumento := docCNH;
            if (dmCaixa.Estacao.Faturamento.EmitirDFEAutomaticamente) or (frmPagamento.chkEmitirDFE.Checked) then
              EmiteDocumentosFiscais
            else
              flFinalizou := True;
            FinalizaVenda;
          end;

          FreeAndNil(fBobinaECF);
        end;
      end;
    end
    else
    begin
      frmMensagem.MostraMensagem('O tipo de venda deve ser diferente de "NENHUM"');
    end;
  end;
end;

procedure TfrmConta.btnPromocoesClick(Sender: TObject);
begin
  if pnlPromocao.Visible then
    btnExcluirPromocaoClick(Sender);

  try
    frmSelecionaPromocoes := TfrmSelecionaPromocoes.Create(Self);
    with frmSelecionaPromocoes do
    begin
      if ShowModal = mrOK then
      begin
        Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ContaPromocoes', ['idempresa', 'idCaixa', 'idConta', 'idPromocao', 'idUsuario', 'DataHora'],
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, qryPromocoes.FieldByName('idPromocao').AsInteger,
           dmCaixa.Usuario.ID, Now]);
        pnlPromocao.Visible := True;
        lblDescricaoPromocao.Caption := qryPromocoes.FieldByName('Descricao').AsString;
        ExigirCPF := qryPromocoes.FieldByName('ExigirCPF').AsBoolean;
        AtualizaTotalConta;
      end;
    end;
  finally
    frmSelecionaPromocoes.Free;
  end;
end;

procedure TfrmConta.btnSenhaClick(Sender: TObject);
begin
  fCalculadora := TfCalculadora.Create(Self);
  fCalculadora.TipoFormulario := tfSenha;
  if fCalculadora.ShowModal = mrOk then
    frmPrincipal.EnviarSenha(fCalculadora.eDisplay.Text);
  fCalculadora.Free;
end;

procedure TfrmConta.btnTipoVendaClick(Sender: TObject);
begin
  frmSelecionaTipoVenda := TfrmSelecionaTipoVenda.Create(Self);
  if frmSelecionaTipoVenda.ShowModal = IDOK then
  begin
    Self.TipoVenda := TTipoVenda(frmSelecionaTipoVenda.TipoVenda);
    if Self.TipoVenda in ([tvVendaMesa, tvVendaCartao]) then
    begin
      btnConferencia.Visible := True;
      btnNaoConferencia.Visible := True;
    end
    else
    begin
      btnConferencia.Visible := False;
      btnNaoConferencia.Visible := False;
    end;

    Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta],
      ['idTipoVenda'],
      [integer(Self.TipoVenda)]);
  end;

  frmSelecionaTipoVenda.Free;
end;

procedure TfrmConta.ItemClick(Sender: TObject);
var
  AItem : TItem;
  AProduto : TProduto;
  AidTipoRelacionamento : integer;
  uAuxiliar : TUsuario;
  idUsuarioEstorno : integer;
begin
  if TipoVenda <> tvVendaBalcao then
    ResetTimerInatividade;

  if Sender is TItem and Assigned(Sender) then
  begin
    AItem := TItem(Sender);
    if (dmCaixa.Estacao.ConfiguracoesDaVenda.Estornar) then
    begin
      if (AItem.idPedido = Self.idPedido) or (dmCaixa.SenhaOK(19, idUsuarioEstorno)) then
      begin
        try
          if AItem.IDItemPai > 0 then
          begin
            //*** Primeiro verifico o tipo do relacionamento
            AidTipoRelacionamento := AItem.Produto.idTipoRelacionamento;

            //*** Agora excluo o ítem a trocar
            AItem.ExcluiItem(AItem, AItem, false, TipoVenda, False, idUsuarioEstorno);

            //*** Pego o ítem Pai
            AItem := TItem(TItem(Sender).Parent);
            AProduto := AItem.Produto;
            CarregaFormularioCombo(AItem, AProduto, TItem(AItem).Combo, AidTipoRelacionamento)
          end
          else
          begin
            AProduto := AItem.Produto;
            CarregaFormularioCombo(AItem, AProduto, AItem.Combo, -1)
          end;
        except
          on e: exception do
            raise exception.Create('Alterando ítem. ' + e.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmConta.LimpaLinhaProdutos;
var
  ALinha : TPanel;
begin
  while pnlLinhasProdutos.ControlCount > 0 do
  begin
    ALinha := TPanel(pnlLinhasProdutos.Controls[0]);
    ALinha.Parent := Nil;
    FreeAndNil(ALinha);
  end;
end;

procedure TfrmConta.TamanhoClick(Sender: TObject);
begin
  dmCaixa.OrdenaPainelItens(pnlItens);
end;


procedure TfrmConta.timerAtualizaPainelItensTimer(Sender: TObject);
begin
  timerAtualizaPainelItens.Enabled := False;
  AtualizaPainelItens;
  AtualizaTotalConta;
end;

procedure TfrmConta.TimerInatividadeTimer(Sender: TObject);
begin
  TimerInatividade.Enabled := False;

  btnVoltarClick(Sender);
end;

function TfrmConta.NovaConta() : integer;
var
  i : integer;
  s : string;
begin
  //*** Proximo pedido
  i := 0;
  result := 0;
  idConta := 0;
  idPedido := 0;
  ValorTotal := 0;
  ExigirCPF := False;
  CPFCNPJ := '';
  pnlPromocao.Visible := False;

  try
    if dmCaixa.dbTotalFastFood.InTransaction then
      dmCaixa.dbTotalFastFood.Commit;
  except
    on e : exception do
      raise Exception.Create('NovaConta() - Erro marcando a transação como finalizada.');
  end;

  try
//    idConta := RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Vendas.ContasSequence');

    if dmCaixa.Estacao.ConfiguracoesDaVenda.SolicitarCPF then
    begin
      frmPergunta.LimpaFormulario;
      frmPergunta.lblPergunta.Height := 113;
      frmPergunta.lblPergunta.Caption := 'Cliente deseja CPF no cupom?';
      frmPergunta.edtCPF.Visible := True;
      frmPergunta.Teclado.Visible := True;
      if frmPergunta.ShowModal = mrOk then
        CPFCNPJ := trim(frmPergunta.edtCPF.Text);
      frmPergunta.edtCPF.Text := '';
    end;

    if TipoVenda = tvVendaBalcao  then
    begin
      if dmCaixa.Estacao.ConfiguracoesDaVenda.SenhaManual then
        Self.idMesaCartaoSenha := 0
      else
        Self.idMesaCartaoSenha := RetornaNovaSenha(Self, dmCaixa.dbTotalFastFood, dmCaixa.Estacao, TipoVenda);

      if dmCaixa.Estacao.Caixa.TipoEstacao = teCaixaBalcao then
      begin
        with TFDQuery.Create(Self) do
        begin
          Connection := dmCaixa.dbTotalFastFood;
          s := format('declare @idEmpresa int = %d; ' +
            'INSERT into vendas.contas (idempresa, idcaixa, idSessaoCaixa, idConta, idTipoVenda, DataInicio, idMesaCartaoSenha, Status, idUsuarioAtendimento, Identificacao) ' +
            '    OUTPUT INSERTED.idConta ' +
            'VALUES (@idEmpresa, %d, %d, (select ' +
            '  case when cast((select max(idConta) from Vendas.Contas where idEmpresa = @idEmpresa) as int) is null ' +
            '    then 1 ' +
            '    else cast((select max(idConta) from Vendas.Contas where idEmpresa = @idEmpresa) as int) + 1 ' +
            '  end), %d, getdate(), %d, %d, %d, ' + QuotedStr(CPFCNPJ) + ')',
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa, Integer(TipoVenda), idMesaCartaoSenha,
               Integer(scAtendimento), DMCaixa.Usuario.ID]);
          sql.Text := s;
          Open;

          i := FieldByName('idConta').AsInteger;

          Free;
        end;
//       i := Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.Contas',
//              ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartaoSenha', 'Status', 'idUsuarioAtendimento', 'Identificacao'],
//              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa, idConta, Integer(TipoVenda), Now, idMesaCartaoSenha,
//               Integer(scAtendimento), DMCaixa.Usuario.ID, CPFCNPJ]);
      end
      else
      begin
        with TFDQuery.Create(Self) do
        begin
          Connection := dmCaixa.dbTotalFastFood;
          s := format('declare @idEmpresa int = %d; ' +
            'INSERT into vendas.contas (idempresa, idcaixa, idConta, idTipoVenda, DataInicio, idMesaCartaoSenha, Status, idUsuarioAtendimento, Identificacao) ' +
            '    OUTPUT INSERTED.idConta ' +
            'VALUES (@idEmpresa, %d, (select ' +
            '  case when cast((select max(idConta) from Vendas.Contas where idEmpresa = @idEmpresa) as int) is null ' +
            '    then 1 ' +
            '    else cast((select max(idConta) from Vendas.Contas where idEmpresa = @idEmpresa) as int) + 1 ' +
            '  end), %d, getdate(), %d, %d, %d, ' + QuotedStr(CPFCNPJ) + ')',
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Integer(TipoVenda), idMesaCartaoSenha,
               Integer(scAtendimento), DMCaixa.Usuario.ID]);
          sql.Text := s;
          Open;

          i := FieldByName('idConta').AsInteger;

          Free;
        end;
//        i := Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.Contas',
//              ['idEmpresa', 'idCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartaoSenha', 'Status', 'idUsuarioAtendimento', 'Identificacao'],
//              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, Integer(TipoVenda), Now, idMesaCartaoSenha, Integer(scAtendimento), DMCaixa.Usuario.ID,
//              CPFCNPJ])
      end;
    end
    else
    begin
      if TipoVenda = tvVendaDelivery then
        Self.idMesaCartaoSenha := RetornaNovaSenha(Self, dmCaixa.dbTotalFastFood, dmCaixa.Estacao, TipoVenda);

      with TFDQuery.Create(Self) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        s := format('declare @idEmpresa int = %d; ' +
          'INSERT into vendas.contas (idempresa, idcaixa, idConta, idTipoVenda, DataInicio, idMesaCartaoSenha, Status, idGarcom, idPessoa, idUsuarioAtendimento, Identificacao) ' +
          '    OUTPUT INSERTED.idConta ' +
          'VALUES (@idEmpresa, %d, (select ' +
          '  case when cast((select max(idConta) from Vendas.Contas where idEmpresa = @idEmpresa) as int) is null ' +
          '    then 1 ' +
          '    else cast((select max(idConta) from Vendas.Contas where idEmpresa = @idEmpresa) as int) + 1 ' +
          '  end), %d, getdate(), %d, %d, %d, %d, %d, ' + QuotedStr(CPFCNPJ) + ')',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Integer(TipoVenda), idMesaCartaoSenha,
             Integer(scAtendimento), idGarcom, idPessoa, DMCaixa.Usuario.ID]);
        sql.Text := s;
        Open;

        i := FieldByName('idConta').AsInteger;

        Free;
      end;
//      i := Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.Contas',
//              ['idEmpresa', 'idCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartaoSenha', 'Status', 'idGarcom', 'idPessoa', 'idUsuarioAtendimento', 'Identificacao'],
//              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, Integer(TipoVenda), Now, idMesaCartaoSenha, Integer(scAtendimento),
//               idGarcom, idPessoa, DMCaixa.Usuario.ID, CPFCNPJ]);
    end;

    if i <= 0 then
    begin
      idConta := -1;
      raise exception.Create('Erro inserindo nova conta. ');
    end
    else
    begin
      result := i;

      Self.idConta := i;

      dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, -1);
    end;
  except
    on e : exception do
      raise exception.create ('Erro abrindo nova conta. ' + e.Message);
  end;

  btnMaisVendidosClick(Self);

  FStatus := scAtendimento;

  HabilitaEdicao(True);
end;


procedure TfrmConta.btnCalculadoraClick(Sender: TObject);
begin
  fCalculadora := TfCalculadora.Create(Self);
  fCalculadora.ShowModal;
  fCalculadora.Free;
end;

procedure TfrmConta.ProdutoClick(Sender: TObject; Const QuantidadePadrao : integer = -1);
var
  ID : integer;
  TelaPrincipal : boolean;
  ProdutoAuxiliar : TProduto;
  flCancelou : boolean;
  flJaPegouQuantidade : boolean;
  QtdeDigitada : double;
begin
  QtdeDigitada := 0;
  if TipoVenda <> tvVendaBalcao then
    ResetTimerInatividade;

  flCancelou := False;
  flJaPegouQuantidade := False;
  frmPrincipal.CarregandoCombo := False;

  if ExistePedido then
  begin
    if (trim(edtQtdeProduto.Text) <> '') and (edtQtdeProduto.Text <> '0') then
    begin
      if ((TryStrToFloat(edtQtdeProduto.Text, QtdeDigitada)) and (QtdeDigitada < 100)) then
          frmMensagem.MostraMensagemErro('Quantidade digitada inválida. Deve ser menor que 100.' + sLineBreak + edtQtdeProduto.Text);
    end
    else
    try
      if Sender is TLabel then
        ProdutoAtual := TProdutoPanel(TLabel(Sender).Parent)
      else if Sender is TBevel then
        ProdutoAtual := TProdutoPanel(TBevel(Sender).Parent)
      else if sender is TProdutoPanel then
        ProdutoAtual := TProdutoPanel(Sender);

      if not RestricaoPorHorario then
      begin
        ProdutoAtual.CancelarClique := True;

        ProdutoAuxiliar := ProdutoAtual.Produto;
        if (ProdutoAuxiliar.QuantidadeFracionada) and (not dmCaixa.Estacao.Balanca.Existe) and (ProdutoAuxiliar.LeQtdeBalanca) and (QtdeDigitada <= 0) then
        begin
          fCalculadora := TfCalculadora.Create(Self);
          fCalculadora.btnPlus.Visible := False;
          fCalculadora.btnMinus.Visible := False;
          fCalculadora.btnMultiply.Visible := False;
          fCalculadora.btnDivide.Visible := False;
          fCalculadora.btnEquals.Visible := False;
          fCalculadora.pClear.Visible := False;
          fCalculadora.btnPercent.Visible := False;
          fCalculadora.btnDecimal.Visible := True;
          if fCalculadora.ShowModal = mrOk then
          begin
            if (Trim(fCalculadora.eDisplay.Text) <> '') then
            begin
              ProdutoAuxiliar.Qtde := StrToFloat(fCalculadora.eDisplay.Text);
              if ProdutoAuxiliar.Qtde <= 0 then
                raise Exception.Create('Quantidade tem que ser maior que zero.');

              flJaPegouQuantidade := True;
              QtdeDigitada := ProdutoAuxiliar.Qtde;
            end
            else
              raise Exception.Create('Não retornou o valor do produto fracionado.');
          end
          else
            flCancelou := True;
          FreeAndNil(fCalculadora);
        end
        else
        begin
          if QtdeDigitada > 0 then
          begin
            flJaPegouQuantidade := True;
            ProdutoAuxiliar.Qtde := QtdeDigitada;
          end
          else
            ProdutoAuxiliar.Qtde := 1;
        end;

        if not flCancelou then
        begin
          ProdutoAtual.Produto := ProdutoAuxiliar;

          if (Not ProdutoAtual.Produto.ExisteRelacionamentoObservacaoCupom) then
          begin
            //*** Produto único (não tem acompanhamentos, adicionais, etc...)
            //*** Então insiro direto
            if not dmCaixa.qryitens.Active then
              dmCaixa.qryItens.Open;

            if QtdeDigitada = 0 then
              QtdeDigitada := 1;

            ProdutoAuxiliar := ProdutoAtual.Produto;
            ProdutoAuxiliar.Qtde := QtdeDigitada;
            ProdutoAtual.Produto := ProdutoAuxiliar;

            if ProdutoAuxiliar.LeQtdeBalanca and (Not flJaPegouQuantidade) then
            begin
//              frmPrincipal.Balanca.Desativar;
              if not frmPrincipal.Balanca.Ativo then
              begin
                try
                  frmPrincipal.Balanca.Ativar;
                except on E: Exception do
                  if e is ESynaSerError then
                    raise exception.Create('Não foi possível ativar a balança. ' + sLineBreak +
                      'Verifique se está ligada e configurada para a porta ' + frmPrincipal.Balanca.Porta + sLineBreak +
                      e.Message)
                  else
                    raise exception.Create(e.Message);
                end;
              end;

              if Not frmPrincipal.Balanca.MonitorarBalanca then
              begin
                frmPrincipal.ContadorErrosBalanca := 0;
                frmPrincipal.Balanca.LePeso(2000);
              end;
            end
            else
            begin
              InsereItem(Self, ProdutoAtual.Produto, False, -1, idGarcom);
              AtualizaVisualizacao;
            end;
          end
          else
            CarregaFormularioCombo(nil, ProdutoAtual.Produto, False, -1)
        end;
      end;

      ProdutoAtual := Nil;
    except
      on e : exception do
        raise Exception.Create('ProdutoClick - ' + sLineBreak + e.Message);
    end;
  end;

  edtQtdeProduto.Text := '0';
end;

procedure TfrmConta.ResetTimerInatividade;
begin
  TimerInatividade.Enabled := False;
  TimerInatividade.Enabled := True;
end;

function TfrmConta.RestricaoPorHorario: boolean;
var
  flRestricaoHorario : Boolean;
  flDentroDoHorario  : boolean;
begin
  result := False;
  flRestricaoHorario := False;
  flDentroDoHorario  := False;

  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('select * from produtos.ProdutoPromocoes pp ' +
      'where idProduto = %d and Ativa = 1 and idPromocao in ' +
      '(select idPromocao from Produtos.ProdutoPromocaoHorario pph ' +
        'where SomenteNesteHorario=1)',
      [ProdutoAtual.Produto.idProduto]);
    Open;

    flRestricaoHorario := RecordCount > 0;

    if flRestricaoHorario then
    begin
      Close;
      SQL.Text := format('select * from produtos.ProdutoPromocoes pp ' +
        'where idProduto = %d and Ativa = 1 and idPromocao in ' +
        '(select idPromocao from Produtos.ProdutoPromocaoHorario pph ' +
          'where DATEPART(dw, getdate()) = pph.DiaDaSemana and ' +
          'cast(getdate() as time) between HoraInicio and HoraFim and SomenteNesteHorario=1)',
        [ProdutoAtual.Produto.idProduto]);
      Open;

      if RecordCount <= 0 then
      begin
        frmMensagem.MostraMensagem('Este produto não pode ser vendido neste horário.');
        result := True;
      end;
      Close;
    end;
  end;
end;


procedure TfrmConta.RetirarClick(Sender: TObject);
var
  produtoAuxiliar : TProduto;
  idUsuarioEstorno : integer;
  AItem : TItem;
begin
  if TipoVenda <> tvVendaBalcao then
    ResetTimerInatividade;

  if dmCaixa.Estacao.ConfiguracoesDaVenda.Estornar then
  begin
    AItem := TItem(Sender);

    if (AItem.idPedido = Self.idPedido) or (dmCaixa.SenhaOK(19, idUsuarioEstorno)) then
    begin
      try
        with AItem do
        begin
          if TipoVenda in [tvVendaBalcao, tvVendaMesa] then
          begin
            with dmCaixa.qryAuxiliar do
            begin
              Close;
              SQL.Text := Format('Select top 1 idItem, qtde from vendas.itens where idEmpresa = %d and idCaixa = %d and idConta = %d ' +
                'and idProduto = %d and flCombo = 0 order by qtde asc',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, Produto.idProduto]);
              Open;

              if RecordCount <= 0 then
                raise Exception.Create('Não retornou nenhum ítem para retirar.');

              with TFDQuery.Create(Self) do
              begin
                Connection := dmCaixa.dbTotalFastFood;

                //*** Primeiro excluo as observacoes, se existirem
                SQL.Text := Format('delete from Vendas.ItemObservacoes where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger]);

                Execute;

                //*** Se for pedido já emitido, então registro estorno...
                if not AItem.idPedido = Self.idPedido then
                  RegistraEstorno(Self, dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger, idUsuarioEstorno);

                //*** Agora excluo o ítem
                SQL.Text := Format('delete from vendas.itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger]);

                Execute;

                if RowsAffected <= 0 then
                  raise Exception.Create('Não excluiu nenhum ítem.');

                Free;
              end;

              Close;
            end;
          end;

          ProdutoAuxiliar := Produto;
          ProdutoAuxiliar.Qtde := ProdutoAuxiliar.Qtde - 1;
          Produto := ProdutoAuxiliar;

          AtualizaValorTotalContaTabela := True;
          timerAtualizaPainelItens.Enabled := True;
        end;
      except
        on e : exception do
          raise exception.create('RetirarItemEvento - ' + sLineBreak +  e.message);
      end;
    end;
  end;
end;

procedure TfrmConta.SetidConta(const Value: integer);
begin
  FidConta := Value;
end;

procedure TfrmConta.SetidConvenio(const Value: integer);
begin
  FidConvenio := Value;
end;

procedure TfrmConta.SetidGarcom(const Value: integer);
begin
  FidGarcom := Value;
end;

procedure TfrmConta.SetidMesaCartaoSenha(const Value: integer);
begin
  FidMesaCartaoSenha := Value;

  edtSenha.Text := IntToStr(Value);
end;

procedure TfrmConta.SetidPedido(const Value: integer);
begin
  FidPedido := Value;
end;

procedure TfrmConta.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
end;

procedure TfrmConta.SetNomeGarcom(const Value: string);
begin
  FNomeGarcom := Value;
  lblGarcom.Caption := Value;
end;

procedure TfrmConta.SetStatus(const Value: TStatusConta);
begin
  FStatus := Value;

  if (Value = scFinalizada) or (Value = scDespachou) then
    HabilitaEdicao(False);

  dmCaixa.AtualizaStatusConta(idConta, Value);
end;

procedure TfrmConta.SetTipoVenda(const Value: TTipoVenda);
begin
  FTipoVenda := Value;

  case Integer(TipoVenda) of
    0 : lblTipoVenda.Caption := '';
    1 : lblTipoVenda.Caption := 'Balcão';
    2 : lblTipoVenda.Caption := 'Mesa';
    3 : lblTipoVenda.Caption := 'Cartao';
    4 : lblTipoVenda.Caption := 'Delivery';
  end;
end;

procedure TfrmConta.pnlCodigoProdutoResize(Sender: TObject);
begin
  lblProduto.Width := pnlCodigoProduto.Width - 10 - lblProduto.Left;
end;

procedure TfrmConta.pnlProdutosGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
//  case EventInfo.GestureID of
//    sgiDown : begin
//      if pnlProdutos.VertScrollBar.Position > 300 then
//        pnlProdutos.VertScrollBar. ScrollBy(0,-300)
//      else
//        pnlProdutos.VertScrollBar.Position := 0;
//    end;
//    sgiUp : begin
//      if pnlProdutos.VertScrollBar.Position < pnlProdutos.VertScrollBar.Range + 300 then
//        pnlProdutos.ScrollBy(0, 300)
//      else
//        pnlProdutos.VertScrollBar.Position := pnlProdutos.VertScrollBar.Range;
//    end;
//  end;
end;

function TfrmConta.RetornaContaAberta : integer;
var
  StatusConta : integer;
begin
  result := -1;
  Nome := '';
  IE := '';
  CPFCNPJ := '';

  try
    if dmCaixa.Estacao.idEmpresa <= 0 then
      raise exception.Create('ID da empresa inválido [' + IntToStr(dmCaixa.Estacao.idEmpresa) + ']');

    if dmCaixa.Estacao.Caixa.idCaixa <= 0 then
      raise exception.Create('ID do caixa inválido [' + IntToStr(dmCaixa.Estacao.Caixa.idCaixa) + ']');

    if (dmCaixa.Estacao.Caixa.TipoEstacao = teCaixaBalcao) and (dmCaixa.Estacao.Caixa.idSessaoCaixa <= 0) then
      raise exception.Create('ID da sessão de caixa inválido [' + IntToStr(dmCaixa.Estacao.Caixa.idSessaoCaixa) + ']');

    with dmCaixa.qryAuxiliar do
    begin
      Close;
      if dmCaixa.Estacao.Caixa.TipoEstacao = teCaixaBalcao then
        SQL.Text := 'select idConta, idMesaCartaoSenha, Identificacao, idConvenio, Status from vendas.contas where idEmpresa =  ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
                    ' and idCaixa = ' + IntToStr(dmCaixa.Estacao.Caixa.idCaixa) +
                    ' and idSessaoCaixa = ' + IntToStr(dmCaixa.Estacao.Caixa.idSessaoCaixa) +
                    ' and idTipoVenda = ' + IntToStr(Integer(tvVendaBalcao)) +
                    ' and datafim is null'
      else
        SQL.Text := 'select idConta, idMesaCartaoSenha, Identificacao, idConvenio, Status from vendas.contas where idEmpresa =  ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
                    ' and idCaixa = ' + IntToStr(dmCaixa.Estacao.Caixa.idCaixa) +
                    ' and idTipoVenda = ' + IntToStr(Integer(tvVendaBalcao)) +
                    ' and datafim is null';
      Open;
      if not Fields.Fields[0].IsNull then
      begin
        StatusConta := FieldByName('Status').AsInteger;
        if FieldByName('idConvenio').IsNull then
          idConvenio := -100
        else
          idConvenio := FieldByName('idConvenio').AsInteger;
        result := Fields.Fields[0].AsInteger;
        if not Fields.Fields[1].IsNull then
          idMesaCartaoSenha := Fields.Fields[1].AsInteger
        else
          raise Exception.Create('Não retornado a mesa ou cartão ou senha.');

        if (not FieldByName('Identificacao').IsNull) and (trim(FieldByName('Identificacao').AsString) <> '') then
          CPFCNPJ := FieldByName('Identificacao').AsString
        else
        begin
          if (TipoVenda in [tvVendaBalcao, tvVendaDelivery]) and (dmCaixa.Estacao.ConfiguracoesDaVenda.SolicitarCPF) then
          begin
            frmPergunta.LimpaFormulario;
            frmPergunta.lblPergunta.Caption := 'Cliente deseja CPF no cupom?';
            frmPergunta.edtCPF.Visible := True;
            frmPergunta.Teclado.Visible := True;
            CPFCNPJ := frmPergunta.edtCPF.Text;
            if frmPergunta.ShowModal = mrOk then
            begin
              Close;
              SQL.Text := format('update Vendas.Contas set Identificacao = ' + QuotedStr(frmPergunta.edtCPF.Text) +
                'where idEmpresa = %d and idCaixa = %d and idConta = %d', [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, result]);
              try
                ExecSQL;
              except
                on e : exception do
                  raise Exception.Create('Erro setando CPF do cliente. ' + e.Message);
              end;
            end;
          end;
        end;

        if StatusConta = Integer(TStatusConta(scFinalizada)) then
        begin
          frmMensagem.MostraMensagem('Esta conta está finalizada e aguardando impressão de documentos.');

          HabilitaEdicao(False);
          FStatus := scFinalizada;
        end
        else if StatusConta = Integer(TStatusConta(scDespachou)) then
        begin
          frmMensagem.MostraMensagem('Este delivery foi despachado, aguardando pagamento.');

          HabilitaEdicao(False);
          FStatus := scDespachou;
        end
        else
          HabilitaEdicao(True);
      end
      else
      begin
        idConta := NovaConta;
        result := idConta;
      end;
      Close;
    end;
  except
    on e : exception do
      raise Exception.Create('Função RetornaContaAberta. ' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.AtualizaTotalConta;
var
  i, j : integer;
  AValorDescontoProdutos : double;
begin
  try
    AValorDescontoProdutos := 0;
    ValorTotal := 0;

    for I := 0 to pnlItens.ControlCount - 1 do
    begin
      ValorTotal := ValorTotal + (TItem(pnlItens.Controls[i]).Produto.Valor * TItem(pnlItens.Controls[i]).Produto.Qtde);

      for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
      begin
        if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
          ValorTotal := ValorTotal +
             (TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Valor *
              TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde);
      end;
    end;

    if pnlItens.ControlCount > 0 then
    begin
      AValorDescontoProdutos := RetornaPromocoes(dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, dmCaixa.qryDescontos);
      dmCaixa.qryDescontos.Close;
    end;

    lblValorTotal.Caption := FormatFloat('0.00', ValorTotal - AValorDescontoProdutos);

    if AtualizaValorTotalContaTabela then
      Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta], ['Valor', 'ValorDesconto'],
          [ValorTotal, AValorDescontoProdutos]);
  except
    on e : exception do
      raise Exception.Create('Função AtualizaTotalConta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.AtualizaVisualizacao;
begin
  dmCaixa.AtualizaPainelItens(pnlItens,dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa,  Self.idConta, AdicionarClick, ExcluirClick, ItemClick, RetirarClick, TamanhoClick);
  AtualizaValorTotalContaTabela := True;
  AtualizaTotalConta;
end;

procedure TfrmConta.BaixaItensDoEstoque(Const AItem : TItem);
var
  i : Integer;
begin
  try
    //*** Primeiro, se o ítem tiver um "filho"
    for i := 0 to AItem.ControlCount -1 do
      if (AItem.Controls[i] is TItem) and  (Not (TItem(AItem.Controls[i]).Tipo in [tiObservacao, tiObservacaoManual])) then
        dmCaixa.MovimentaEstoque(TItem(AItem.Controls[i]).Produto.idProduto,
          TItem(AItem.Controls[i]).Produto.Qtde, -1, TItem(AItem.Controls[i]).idItem, 1{Movimentacao venda}, Now);

    //*** Por fim atualizo o ítem principal
    dmCaixa.MovimentaEstoque(AItem.Produto.idProduto, AItem.Produto.Qtde, -1, AItem.idItem, 1{Movimentacao venda}, Now);
  except
    on e : exception do
      raise exception.Create('Função BaixaItensDoEstoque' + sLineBreak + e.Message);
  end;
end;


procedure TfrmConta.ACBrNFe1TransmitError(const HttpError,
  InternalError: Integer; const URL, DadosEnviados, SoapAction: string;
  var Retentar, Tratado: Boolean);
begin
  frmPergunta.LimpaFormulario;
  frmPergunta.lblPergunta.Caption := 'Houve um erro ao tentar enviar a NFC-e ao SEFAZ. Deseja retentar?';
  if frmPergunta.ShowModal = mrOK then
    Retentar := True
  else
  begin
    flErroTransmissaoNFCe := True;
    Tratado := True;
  end;
end;

procedure TfrmConta.ACBrTEFD1AguardaResp(Arquivo: string;
  SegundosTimeOut: Integer; var Interromper: Boolean);
var
  Msg : String ;
begin
  Msg := '' ;
  if (ACBrTEFD1.GPAtual in [gpCliSiTef, gpVeSPague]) then   // É TEF dedicado ?
  begin
    if (Arquivo = '23') then  // Está aguardando Pin-Pad ?
    begin
      if ACBrTEFD1.TecladoBloqueado then
      begin
        ACBrTEFD1.BloquearMouseTeclado(False);  // Desbloqueia o Teclado
      end ;

      Msg := 'Tecle "ESC" para cancelar.';
      flTEFCancelado := False;
    end;
  end
  else
    Msg := 'Aguardando: '+Arquivo+' '+IntToStr(SegundosTimeOut) ;

  if Assigned(fBobinaECF) then
    fBobinaECF.AtualizaBobina(Msg);

  Application.ProcessMessages;

  if flTEFCancelado then
    Interromper := True ;
end;

procedure TfrmConta.ACBrTEFD1AntesCancelarTransacao(
  RespostaPendente: TACBrTEFDResp);
var
   Est: TACBrECFEstado;
begin
  if dmCaixa.Estacao.Faturamento.TipoFaturamento = tfECF then
  begin
    Est := frmPrincipal.ACBrECF1.Estado;

    case Est of
      estVenda, estPagamento :
        frmPrincipal.ACBrECF1.CancelaCupom;

      estRelatorio :
          frmPrincipal.ACBrECF1.FechaRelatorio;
    else
      if not ( Est in [estLivre, estDesconhecido, estNaoInicializada] ) then
        frmPrincipal.ACBrECF1.CorrigeEstadoErro( False ) ;
    end;
  end;
end;

procedure TfrmConta.ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
begin
  if Req.Header = 'CRT' then
  begin
    if dmCaixa.Estacao.Faturamento.SelecaoAutomaticaTEF then
    begin
      if Trim(RedeAdquirente) <> '' then
        Req.GravaInformacao(10, 0, RedeAdquirente);

      if Trim(TipoTransacao) <> '' then
      begin
        if Trim(TipoTransacao) = 'C' then
        begin
          Req.GravaInformacao(731, 0, '1');
          //*** Informo também que tem que ser a vista
          Req.GravaInformacao(732, 0, '1');
        end
        else if Trim(TipoTransacao) = 'D'then
        begin
          Req.GravaInformacao(731, 0, '2');
          //*** Informo também que tem que ser a vista
          Req.GravaInformacao(732, 0, '1');
        end
        else if Trim(TipoTransacao) = 'V'then
          Req.GravaInformacao(731, 0 , '3');
      end;
    end;
  end;

  if Assigned(fBobinaECF) then
    if fBobinaECF.Showing then
      fBobinaECF.AtualizaBobina('Enviando: '+Req.Header+' ID: '+IntToStr( Req.ID ) );
end;

procedure TfrmConta.ACBrTEFD1BloqueiaMouseTeclado(Bloqueia: Boolean;
  var Tratado: Boolean);
begin
  self.Enabled := not Bloqueia ;
  if Assigned(fBobinaECF) then
    if fBobinaECF.Showing then
      fBobinaECF.AtualizaBobina('BloqueiaMouseTeclado = '+IfThen(Bloqueia,'SIM', 'NAO'));

//  Tratado := False ;  { Deixa executar o código de Bloqueio do ACBrTEFD }
  Tratado := True ;  { Somente para DEBUG }
end;

procedure TfrmConta.ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
  Resp: TACBrTEFDResp; var RetornoECF: Integer);
Var
   Est : TACBrECFEstado ;
   P   : Integer;
   Linha, CodFPG : String ;
   ValorFPG : Double ;
begin
  try
    case Operacao of
      opeAbreGerencial :
         fBobinaECF.AtualizaBobina('Abre Gerencial') {ACBrECF1.AbreRelatorioGerencial} ;

      opeFechaCupom :
         estadoSimuladoEcf := tpsLivre;

      opeSubTotalizaCupom :
         fBobinaECF.AtualizaBobina('Sub Totaliza');

      opeFechaGerencial, opeFechaVinculado :
         estadoSimuladoEcf := tpsRelatorio;

      opePulaLinhas :
        begin
          fBobinaECF.AtualizaBobina('PulaLinhas');
          frmPrincipal.Impressora.PularLinhas(5);
//          frmPrincipal.Impressora.CortaPapel := True;
//          frmPrincipal.Impressora.CortarPapel;
        end;

      opeImprimePagamentos :
        begin
          fBobinaECF.AtualizaBobina('ImprimePagamentos');
        end;
    end;
    RetornoECF := 1 ;
  except
    RetornoECF := 0 ;
  end;
end;

procedure TfrmConta.ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
  Valor: Double; var RetornoECF: Integer);
begin
  if dmCaixa.Estacao.Faturamento.TipoFaturamento = TTipoFaturamento.tfECF then
  begin
    try
      if Assigned(fBobinaECF) then
        if fBobinaECF.Showing then
          fBobinaECF.AtualizaBobina('ACBrTEFD1ComandaECFAbreVinculado, COO:'+COO+
          ' IndiceECF: '+IndiceECF+' Valor: '+FormatFloat('0.00',Valor) ) ;
       frmPrincipal.ACBrECF1.AbreCupomVinculado( COO, IndiceECF, Valor );
       RetornoECF := 1 ;
    except
       RetornoECF := 0 ;
    end;
  end
  else
    RetornoECF := 1 ;
end;

procedure TfrmConta.ACBrTEFD1ComandaECFImprimeVia(
  TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer;
  ImagemComprovante: TStringList; var RetornoECF: Integer);
begin
  try
    frmPrincipal.Impressora.Desativar;
    frmPrincipal.Impressora.ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
    frmPrincipal.Impressora.Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
    frmPrincipal.Impressora.Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
    frmPrincipal.Impressora.LinhasEntreCupons := dmCaixa.Estacao.Impressora.LinhasEntreCupons;
    frmPrincipal.Impressora.CortaPapel := True;

    try
      frmPrincipal.Impressora.Ativar;
    except
      on e : exception do
      begin
        frmMensagem.MostraMensagemErro('A impressora do cupom está desligada ou sem acesso.');
        raise Exception.Create('Não foi possível ativar a impressora ' + dmCaixa.Estacao.Impressora.NomeImpressora + slinebreak + e.message);
      end;
    end;

    frmPrincipal.Impressora.ImprimirLinha(ImagemComprovante.Text);
    frmPrincipal.Impressora.CortarPapel;
    frmPrincipal.Impressora.Desativar;
  except
    on e : Exception do
      raise Exception.Create('Erro imprimindo comprovanto do TEF - ' + e.Message);
  end;

  RetornoECF := 1 ;
end;

procedure TfrmConta.ACBrTEFD1ComandaECFPagamento(IndiceECF: string;
  Valor: Double; var RetornoECF: Integer);
var
   Est : TACBrECFEstado ;
begin
//  try
//    Memo1.Lines.Add( 'ComandaECFPagamento, IndiceECF: '+IndiceECF+
//      ' Valor: '+FormatFloat('0.00',Valor) );
//    Est := ACBrECF1.Estado;
//
//    if Est = estNaoFiscal then
//      ACBrECF1.EfetuaPagamentoNaoFiscal(IndiceECF, Valor)
//    else
//      ACBrECF1.EfetuaPagamento(IndiceECF, Valor);
//
//    RetornoECF := 1 ;
//  except
//    RetornoECF := 0 ;
//  end;
  RetornoECF := 1 ;
end;

procedure TfrmConta.ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
  var RetornoECF: Integer);
begin
  estadoSimuladoEcf := tpsPagamento;
  RetornoECF := 1 ;
end;

procedure TfrmConta.ACBrTEFD1DepoisConfirmarTransacoes(
  RespostasPendentes: TACBrTEFDRespostasPendentes);
var
  I : Integer;
begin
  for I := 0 to RespostasPendentes.Count-1  do
  begin
     with RespostasPendentes[I] do
     begin
        if (Assigned(fBobinaECF)) and (fBobinaECF.Showing) then
        begin
         fBobinaECF.AtualizaBobina('Confirmado: '+Header+' ID: '+IntToStr( ID ) );
         fBobinaECF.AtualizaBobina('Rede: '  + Rede + ' NSU: '  + NSU  + ' Valor: '+ FormatFloat('###,###,##0.00',ValorTotal)) ;
         fBobinaECF.AtualizaBobina('Campo 11: ' + LeInformacao(11,0).AsString );
        end;
     end;
  end;
end;

procedure TfrmConta.ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
  Mensagem: string; var AModalResult: TModalResult);
var
   Fim : TDateTime;
begin
  flTEFCancelado := Mensagem = 'OPERACAO CANCELADA';

  case Operacao of
    opmOK :
      AModalResult := MessageDlg( Mensagem, mtInformation, [mbOK], 0);
    opmYesNo :
      AModalResult := MessageDlg( Mensagem, mtConfirmation, [mbYes,mbNo], 0);
    opmExibirMsgOperador, opmRemoverMsgOperador,
    opmExibirMsgCliente, opmRemoverMsgCliente :
      if (Assigned(fBobinaECF)) and (fBobinaECF.Showing) then
        fBobinaECF.AtualizaBobina(Mensagem) ;
//    opmDestaqueVia :
//      begin
//        try
//          if (Assigned(fBobinaECF)) and (fBobinaECF.Showing) then
//            fBobinaECF.mmoECF.Lines.Add(Mensagem) ;
//
//          { Aguardando 3 segundos }
//          Fim := IncSecond( now, 3)  ;
//          repeat
//            sleep(200) ;
//            if (Assigned(fBobinaECF)) and (fBobinaECF.Showing) then
//              fBobinaECF.AtualizaBobina(Mensagem + ' ' + IntToStr(SecondsBetween(Fim,now)));
//            Application.ProcessMessages;
//          until (now > Fim) ;
//
//         finally
//         end;
//       end;
  end;

  Application.ProcessMessages;
end;

procedure TfrmConta.ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
  var RetornoECF: string);
var
   ASubTotal: Double;
begin
  case Operacao of
    ineSubTotal : begin
      RetornoECF := FloatToStr(frmPagamento.ValorAPagar - frmPagamento.ValorPago - frmPagamento.ValorDesconto);
      if estadoSimuladoEcf = tpsPagamento then
        RetornoECF := FloatToStr(0);
    end;

    ineTotalAPagar : RetornoECF := '0';

    ineEstadoECF : begin
      Case estadoSimuladoEcf of
        tpsLivre     : RetornoECF := 'L' ;
        tpsVenda     : RetornoECF := 'V' ;
        tpsPagamento : RetornoECF := 'P' ;
        tpsRelatorio : RetornoECF := 'R' ;
      else
        RetornoECF := 'O' ;
      end;
    end;
  end;
end;

procedure TfrmConta.ACBrTEFD1MudaEstadoReq(EstadoReq: TACBrTEFDReqEstado);
begin
  if (Assigned(fBobinaECF)) and (fBobinaECF.Showing) then
    fBobinaECF.AtualizaBobina(GetEnumName(TypeInfo(TACBrTEFDReqEstado), Integer(EstadoReq)));
  flTEFCancelado := False ;
end;

procedure TfrmConta.ACBrTEFD1MudaEstadoResp(EstadoResp: TACBrTEFDRespEstado);
begin
  if (Assigned(fBobinaECF)) and (fBobinaECF.Showing) then
    fBobinaECF.AtualizaBobina(GetEnumName(TypeInfo(TACBrTEFDRespEstado), Integer(EstadoResp)));
end;

procedure TfrmConta.ACBrTEFD1RestauraFocoAplicacao(var Tratado: Boolean);
begin
  Application.BringToFront;

  Tratado := False ;  { Deixa executar o código de Foco do ACBrTEFD }
end;

procedure TfrmConta.AdicionarClick(Sender: TObject);
var
  ProdutoAuxiliar : TProduto;
  i,
  idPai : integer;
  idAuxiliar : integer;
  flTemAcompanhamentoOuAdicional : boolean;
  DescricaoRelacionamento : string;
  QtdeRelacionamentos,
  QtdeMaximaRelacionamentos : integer;
  flAdicionou : boolean;
  AidItem : integer;
  ANumeroOrdem : integer;

  function AdicionarItem(AProduto : TProduto;  Qtde : integer; Combo : integer; Pai : variant; Relacionamento : integer) : integer;
  begin
    try
      result := RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Vendas.ItensSequence');

      if ExistePedido then
      begin
        if pai <> null then
        begin
          with dmCaixa.qryAuxiliar do
          begin
            Close;
            SQL.Text := format('select case when max(NumeroOrdem) is null then 1 else max(NumeroOrdem) + 1 end from Vendas.Itens ' +
              'where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d',
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, Integer(Pai)]);
            Open;

            if RecordCount <= 0 then
              raise Exception.Create('Erro buscando numero da ordem do ítem a ser inserido. ')
            else
              ANumeroOrdem := Fields.Fields[0].AsInteger;

            Close;
          end;
          Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idPedido', 'idItem', 'idProduto', 'qtde', 'vlProduto',
                                        'AliquotaICMS', 'flCombo', 'idItemPai' , 'idTipoRelacionamento', 'idGarcom', 'NumeroOrdem'],
                                        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, FidPedido, result, AProduto.idProduto,
                                        Qtde, AProduto.Valor, AProduto.AliquotaICMS, Combo, Pai, Relacionamento, idGarcom, ANumeroOrdem ])
        end
        else
        begin
          with dmCaixa.qryAuxiliar do
          begin
            Close;
            SQL.Text := format('select case when max(NumeroOrdem) is null then 1 else max(NumeroOrdem) + 1 end from Vendas.Itens ' +
              'where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai is null',
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta]);
            Open;

            if RecordCount <= 0 then
              raise Exception.Create('Erro buscando numero da o ítem a ser inserido. ')
            else
              ANumeroOrdem := Fields.Fields[0].AsInteger;

            Close;
          end;
          Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idPedido', 'idItem', 'idProduto', 'qtde', 'vlProduto',
                                        'AliquotaICMS', 'flCombo', 'idTipoRelacionamento', 'idGarcom', 'NumeroOrdem'],
                                        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, FidPedido, result, AProduto.idProduto,
                                        Qtde, AProduto.Valor, AProduto.AliquotaICMS, Combo, Relacionamento, idGarcom, ANumeroOrdem]);
        end;
      end
      else
        raise Exception.Create('Não foi possível retornar o valor do ID do pedido.');
    except
      on e : exception do
      begin
        result := -1;
        raise exception.Create('Função Insere Ítem. Produto - ' + AProduto.Descricao + sLineBreak + e.Message);
      end;
    end;
  end;
begin
  if TipoVenda <> tvVendaBalcao then
    ResetTimerInatividade;

  QtdeRelacionamentos := 0;
  QtdeMaximaRelacionamentos := 0;
  flAdicionou := False;
  try
    with TItem(Sender) do
    begin
      try
        if idItemPai > 0 then
        begin
          //*** Primeiro verifico se ainda pode ser adicionado mais um item para este relacionamento.
          with TFDQuery.Create(Self) do
          begin
            Connection := dmCaixa.dbTotalFastFood;
            SQL.Text := Format('with Relacionamento  as (  ' +
              'select tr.Descricao, sum(qtde) as Qtde from Vendas.Itens i  inner join Produtos.TiposRelacionamento tr on ' +
              'tr.idTipoRelacionamento = i.idTipoRelacionamento where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and i.idTipoRelacionamento = %d ' +
              'group by tr.Descricao) ' +
              'select *, (Select NumeroMaximo from Produtos.ProdutoTiposRelacionamento ptr ' +
              'where ptr.idProduto = (select idProduto from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d) ' +
              'and ptr.idTipoRelacionamento = %d) as NumeroMaximo from Relacionamento  ',
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, idItemPai, Produto.idTipoRelacionamento,
               dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, idItemPai, Produto.idTipoRelacionamento]);
            Open;
            if RecordCount > 0 then
            begin
              DescricaoRelacionamento := Fields.Fields[0].AsString;
              QtdeRelacionamentos := Fields.Fields[1].AsInteger;
              QtdeMaximaRelacionamentos := Fields.Fields[2].AsInteger;
            end;
            Close;
            Free;
          end;

          if QtdeRelacionamentos >= QtdeMaximaRelacionamentos then
            frmMensagem.MostraMensagem(Format('Este produto alcançou a quantidade máxima [%d] deste relacionamento [%s]',
              [QtdeMaximaRelacionamentos, DescricaoRelacionamento]))
          else
          begin
            idPai := AdicionarItem(Produto, 1, Integer(Combo), idItemPai, Produto.idTipoRelacionamento);
            flAdicionou := true;
          end;
        end
        else
        begin
          //*** Primeiro o Item Principal do combo
          idPai := AdicionarItem(Produto, 1, Integer(Combo), Null, -1);
          flAdicionou := true;

          if (NumeroFilhos > 0) then
          begin
            for I := 0 to ControlCount - 1 do
            begin
              if Controls[i] is TItem then
                AdicionarItem(TItem(Controls[i]).Produto, 1, Integer(Combo), idPai, TItem(Controls[i]).Produto.idTipoRelacionamento);
            end;
          end;

          try
            if (NumeroObservacoes > 0) then
            begin
              for I := 0 to ControlCount - 1 do
              begin
                if (Controls[i] is TItem) and (TItem(Controls[i]).Tipo = tiObservacao) then
                  Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ItemObservacoes', ['idEmpresa', 'idCaixa', 'idConta', 'idItem', 'idObservacao'],
                    [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idPai, TItem(Controls[i]).Produto.idProduto]);
              end;
            end
          except
            on e : exception do
              raise Exception.Create('Erro inserindo observacao.' + sLineBreak + TItem(Controls[i]).Produto.Descricao + sLineBreak + e.Message);
          end;
        end;
      except
        on e : exception do
          raise Exception.Create('TItem.AdicionarClique' + sLineBreak + e.Message);
      end;
    end;
  finally
    if flAdicionou then
    begin
      AtualizaValorTotalContaTabela := True;
      timerAtualizaPainelItens.Enabled := True;
    end;
  end;
end;



procedure TfrmConta.AtualizaPainelItens;
begin
  dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa,  Self.idConta, AdicionarClick, ExcluirClick, ItemClick, RetirarClick, TamanhoClick);

  if ValorTotal <= 0 then
  begin
    //*** Verifico se existem pagamentos, e os apago.
    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;

      SQL.Clear;
      SQL.Text := Format('delete from Vendas.ContaPagamentos where idEmpresa = %d and idCaixa = %d and idConta = %d',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);

      Execute;

      Free;
    end;
  end;

  if pnlItens.ControlCount = 0 then
    AtualizaPainelProdutos(0, -1, pnlProdutos, False, -1, True);
end;

procedure TfrmConta.AtualizaPainelProdutos(const AidItem : integer; Const AIndex : integer; const AOwner : TWinControl;
    const flCombo : boolean; const AidTipoRelacionamento : Integer; Const AtualizaTela : boolean; Const QtdeMaxima : integer = 0);
var
  i               : integer;
  nroHorizontal   : integer;
  horizontalAtual : integer;
  verticalAtual   : integer;
  arrayProdutos   : array of TProdutoPanel;
  ProdutoAuxiliar : TProduto;
  cdsAuxiliar     : TClientDataSet;
  flNumeroOrdem   : boolean;
  MaiorOrdem      : integer;
  AProduto        : TProdutoPanel;
  flMostrarQuantidade : boolean;
begin
  try
    if AtualizaTela then
      AOwner.Visible := False;

    //*** Limpo todos os componentes do Aowner
    while AOwner.ControlCount > 0 do
    begin
      if AOwner.Controls[0] is TProdutoPanel then
      begin
        AProduto := TProdutoPanel(AOwner.Controls[0]);
        AProduto.Parent := Nil;
        FreeAndNil(AProduto);
      end;
    end;

    if AIndex = -1 then
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := '(MaisVendidos = 1)';
      cdsAuxiliar.IndexFieldNames := 'idSubGrupo;Descricao';
      cdsAuxiliar.Filtered := True;
    end
    else if (AidTipoRelacionamento = -1) and (flCombo) then
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := '(idGrupo = ' + IntToStr(AIndex) + ')';
      cdsAuxiliar.IndexFieldNames := 'idSubGrupo;Descricao';
      cdsAuxiliar.Filtered := True;
    end
    else if AidTipoRelacionamento = -1 then
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := '(idLinha = ' + IntToStr(AIndex) + ')';
      cdsAuxiliar.IndexFieldNames := 'idSubGrupo;Descricao';
      cdsAuxiliar.Filtered := True;
    end
    else
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosRelacionadosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := '(idProduto = ' + IntToStr(AIndex) +
        ') and (idTipoRelacionamento= ' + IntToStr(Integer(AidTipoRelacionamento)) + ')';
      if AidTipoRelacionamento > 0 then
        cdsAuxiliar.IndexFieldNames := 'DescricaoProdutoRelacionado'
      else
        cdsAuxiliar.IndexFieldNames := 'Ordem';
      cdsAuxiliar.Filtered := True;
    end;

    i:= 0;

    Application.ProcessMessages;

    flMostrarQuantidade := AOwner <> Self.pnlProdutos;

    with cdsAuxiliar do
    begin
      First;
      SetLength(arrayProdutos, RecordCount);

      while not eof do
      begin
        arrayProdutos[i] := TProdutoPanel.CriaProduto(AOwner,
          dmCaixa.Estacao.ConfiguracoesVisuais.AlturaProdutos,
          dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoProdutos,
          dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoFonteProdutos,
          10, flMostrarQuantidade, QtdeMaxima);
        with arrayProdutos[i] do
        begin
          if (AIndex <> -1) and (AidTipoRelacionamento > 0) then
            ProdutoAuxiliar.IDProduto := FieldByName('idProdutoRelacionado').AsInteger
          else
            ProdutoAuxiliar.IDProduto := FieldByName('idProduto').AsInteger;
          ProdutoAuxiliar.cdProduto := FieldByName('cdProduto').AsInteger;
          ProdutoAuxiliar.idAreaProducao := FieldByName('idAreaProducao').AsInteger;
          ProdutoAuxiliar.AliquotaICMS := FieldByName('AliquotaICMS').AsFloat;
          if (AidTipoRelacionamento > 0) then
            ProdutoAuxiliar.DescricaoReduzida := FieldByName('DescricaoProdutoRelacionado').AsString
          else
            ProdutoAuxiliar.DescricaoReduzida := FieldByName('Descricao').AsString;
          ProdutoAuxiliar.SomenteCombo  := FieldByName('SomenteCombo').AsBoolean;
          ProdutoAuxiliar.SomentePadrao := FieldByName('SomentePadrao').AsBoolean;
          ProdutoAuxiliar.ForcarPadrao := FieldByName('ForcarPadrao').AsBoolean;
          ProdutoAuxiliar.SolicitarAreaImpressao  := FieldByName('SolicitarAreaImpressao').AsBoolean;
          ProdutoAuxiliar.NaoTemCombo := FieldByName('NaoTemCombo').AsBoolean;

          //*** Valores
          if (AidTipoRelacionamento = -1) then
          begin
            ProdutoAuxiliar.Valor             := FieldByName('vlUnitario').AsFloat;
            ProdutoAuxiliar.ValorUnitario     := FieldByName('vlUnitario').AsFloat;
            ProdutoAuxiliar.ValorUnitarioCombo:= FieldByName('vlUnitarioCombo').AsFloat;
            ProdutoAuxiliar.ValorTotalCombo   := FieldByName('vlTotalCombo').AsFloat;
          end
          else if (AidTipoRelacionamento > 0) then
            ProdutoAuxiliar.Valor   := FieldByName('vlRelacionado').AsFloat;

          ProdutoAuxiliar.IDSubGrupo:= FieldByName('IDSubGrupo').AsInteger;
          if (AIndex <> -1) and (AidTipoRelacionamento > 0) then
            ProdutoAuxiliar.Relacao   := TTipoRelacao(FieldByName('TipoRelacao').AsInteger);
          ProdutoAuxiliar.idTipoRelacionamento      := AidTipoRelacionamento;
          ProdutoAuxiliar.LeQtdeBalanca  := FieldByName('LeQtdeBalanca').AsBoolean;
          ProdutoAuxiliar.ImprimirPedido := FieldByName('ImprimirPedido').AsBoolean;
          ProdutoAuxiliar.QuantidadeFracionada := FieldByName('QuantidadeFracionada').AsBoolean;

          ProdutoAuxiliar.ExisteRelacionamentoObservacaoCupom := FieldByName('ExisteRelacionamentosObservacoesCupons').AsBoolean;

          Cor        := StringToColor(Trim(FieldByName('Cor').AsString));
          CorSelecionado := StringToColor(Trim(FieldByName('CorSelecionado').AsString));
          CorFonte   := StringToColor(Trim(FieldByName('CorFonte').AsString));
          CorFonteSelecionado := StringToColor(Trim(FieldByName('CorFonteSelecionado').AsString));
          CorValorFonte   := StringToColor(Trim(FieldByName('CorValorFonte').AsString));
          CorValorFonteSelecionado := StringToColor(Trim(FieldByName('CorValorFonteSelecionado').AsString));

          Selecionado := False;

          Height     := dmCaixa.Estacao.ConfiguracoesVisuais.AlturaProdutos;
          Width      := dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoProdutos;

          Produto := ProdutoAuxiliar;

          Parent     := AOwner;

          Caption    := '';

          if (AOwner = Self.pnlProdutos) then
          begin
            OnProdutoClick := ProdutoClick;
            onProdutoUpClick := ProdutoClick;
            onProdutoDownClick := ProdutoClick;
          end
          else
          begin
            onProdutoClick := frmCombo.Clicou;
            onProdutoUpClick := frmCombo.ClicouUp;
            onProdutoDownClick := frmCombo.ClicouDown;
          end;
          tag        := i;
        end;

        Inc(i);
        Next;
      end;
    end;

    //*** Primeiro verifico quantos cabem na horizontal
    //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
    nroHorizontal   := Trunc(AOwner.Width / (dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoProdutos + 5)) - 1;

    horizontalAtual := 0;
    verticalAtual   := 0;
    MaiorOrdem      := 0;

    flNumeroOrdem := False;

    for I := 0 to cdsAuxiliar.RecordCount - 1 do
    begin
      with arrayProdutos[i] do
      begin
        if horizontalAtual > nroHorizontal then
        begin
          horizontalAtual := 0;
          Inc(verticalAtual);
        end;

        Top  := verticalAtual * (dmCaixa.Estacao.ConfiguracoesVisuais.AlturaProdutos + 5) + 5;
        Left := horizontalAtual * (dmCaixa.Estacao.ConfiguracoesVisuais.TamanhoProdutos + 5) + 5;
      end;

      Inc(horizontalAtual);
    end;
    if AtualizaTela then
      AOwner.Visible := True;
  except
    on e : exception do
      raise Exception.Create('TfrmConta.AtualizaPainelProdutos' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.ExcluirClick(Sender: TObject);
var
//  c : Char;
  i : integer;
  AItem : TItem;
  s : string;
  idUsuarioEstorno : Integer;
begin
  if TipoVenda <> tvVendaBalcao then
    ResetTimerInatividade;
  idUsuarioEstorno := -1;
  AItem := TItem(Sender);
  if (dmCaixa.Estacao.ConfiguracoesDaVenda.Estornar) then
  begin
    if ((AItem.idPedido = Self.idPedido) and (not dmCaixa.Estacao.ConfiguracoesDaVenda.ExigirSenhaParaEstorno)) or (dmCaixa.SenhaOK(19, idUsuarioEstorno)) then
    begin
      try
        try
          if ((AItem.NumeroFilhos > 0) or (AItem.Produto.QuantidadeFracionada) or
            ((AItem.Produto.ExisteRelacionamentoObservacaoCupom) and (Not (AItem.idItemPai > 0))) ) and (not (AItem.Tipo in [tiObservacao, tiObservacaoManual])) then
            AItem.ExcluiItem(Sender, AItem, True, TipoVenda, AItem.NumeroFilhos > 0, idUsuarioEstorno)
          else if TItem(Sender).Tipo in [tiObservacao, tiObservacaoManual] then
            AItem.ExcluiItem(Sender, TItem(Sender), True, TipoVenda, False, idUsuarioEstorno)
          else if (AItem.idItemPai > 0) and (AItem.Produto.ParteDoCombo) and (not TItem(AItem.Parent).Produto.SomenteCombo) then
          begin
//            c := FormatSettings.DecimalSeparator;
//            FormatSettings.DecimalSeparator := '.';

            //*** Retiro o combo do item pai
            Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idItem'],
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem],
              ['flCombo', 'vlProduto'], [0, TItem(AItem.Parent).Produto.ValorUnitario]);

//            s := Format('update Vendas.Itens set flCombo = 0, vlProduto = %f where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idItem = %d)',
//                [TItem(AItem.Parent).Produto.ValorUnitario ,dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem]);
//            i := dmCaixa.dbTotalFastFood.ExecSQL(s);

            //*** Registro os estornos
            if (AItem.DataHoraImpressao > 0) then
            begin
              with TFDQuery.Create(Application) do
              begin
                Connection := dmCaixa.dbTotalFastFood;
                SQL.Text := Format('Select * from Vendas.Itens where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idItemPai = %d) and (idTipoRelacionamento in ' +
                          '(select idTipoRelacionamento from Produtos.TiposRelacionamento tp where tp.ParteDoCombo =1))',
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem]);
                Open;

                while not EOF do
                begin
                  AItem.RegistraEstorno(Self, FieldByName('idItem').AsInteger, idUsuarioEstorno);

                  Next;
                end;

                Free;
              end;
            end;

            //*** Agora apago todos os  relacionados do combo, se houverem
            s := Format('delete from Vendas.Itens where (idEmpresa = %d) and (idCaixa = %d) and (idConta = %d) and (idItemPai = %d) and (idTipoRelacionamento in ' +
                        '(select idTipoRelacionamento from Produtos.TiposRelacionamento tp where tp.ParteDoCombo =1))',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem]);
            i := dmCaixa.dbTotalFastFood.ExecSQL(s);
//            FormatSettings.DecimalSeparator := c;
          end
          else if not (AItem.idItemPai > 0) then
            AItem.ExcluiItem(Sender, AItem, True, TipoVenda, False, idUsuarioEstorno);
        except
          on e : exception do
            raise Exception.Create('ExcluirItemClique - ' + sLineBreak + e.Message);
        end;
      finally
        AtualizaValorTotalContaTabela := True;
        timerAtualizaPainelItens.Enabled := True;
      end;
    end;
  end;
end;

function TfrmConta.ExistePedido: boolean;
begin
  result := False;

  //*** verifico se existe um pedido em aberto
  if FidPedido <= 0 then
  begin
    //*** Crio um pedido
    SetidPedido(RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Vendas.PedidosSequence'));

    if FidPedido <= 0 then
      frmMensagem.MostraMensagemErro('Não foi possível retornar o valor da sequence - Vendas.PedidosSequence.')
    else
    begin
      with dmCaixa.qryAuxiliar do
      begin
        Close;

        //*** Agora crio o pedido
        SQL.Text := Format('INSERT INTO Vendas.Pedidos (idEmpresa, idCaixa, idConta, idPedido, HoraInicio ,idUsuario) values ( '+
           '%d, %d, %d, %d, GetDate(), %d)', [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, FidPedido, dmCaixa.Usuario.ID]);
        ExecSQL;

        if RowsAffected <= 0 then
        begin
          frmMensagem.MostraMensagemErro(Format('Erro criando pedido - %d.', [FidPedido]));
          FidPedido := 0;
        end
        else
          result := True;
      end;
    end;
  end
  else
    result := True;
end;

procedure TfrmConta.ImprimeCupomFiscal(Nome : string);
var
  i : integer;
  j : integer;

  flCancelaCupom : boolean;
  sAliquotaICMS : string;

  Est : String ;
  cMensagem,
  sAuxiliar : string;

  EstadoECF : TACBrECFEstado;
  HoraInicial, HoraFinal : TTime;

  ex: String;
  tabela : Integer;
  descricao : string;
  ChaveIBPT : string;
  aliqFedNac, aliqFedImp, aliqEstadual, aliqMunicipal,
  ValorDesconto,
  ValorAproximadoEstadual,
  ValorAproximadoFederal,
  ValorAproximadoMunicipal : Double;

  flEmitindoReducaoZ : boolean;
  flExistePagamentoTEF : boolean;
  flTEFFinalizado : boolean;

  sRede, sNSU, sNumeroCartao, sNomeCartao, sTipoCartao, sNomeClienteCartao, sAutorizacao : string;

  NumeroItem : integer;
begin
  try
    if not frmPrincipal.AtivarECF then
      raise Exception.Create('Não é possível fechar a conta sem comunicação com o ECF.');

    if frmPrincipal.ACBrECF1.Estado in estCupomAberto then
      frmPrincipal.ACBrECF1.CancelaCupom;

    try
      try
        EstadoECF := frmPrincipal.ACBrECF1.Estado;
        Est := Estados[frmPrincipal.ACBrECF1.Estado] ;
        frmPrincipal.ACBrECF1.TestaPodeAbrirCupom ;
      except
        on e : EACBrECFCMDInvalido do
        begin
          if EstadoECF = estRequerZ then
          begin
            HoraInicial := StrToTime('00:00:00');
            HoraFinal   := StrToTime('01:59:59');
            if Not TimeInRange(Now, HoraInicial, HoraFinal) then
            begin
              frmMensagem.MostraMensagem('A redução Z deve ser emitida.');
              flEmitindoReducaoZ := True;
              frmPrincipal.ACBrECF1.ReducaoZ(Now);
              flEmitindoReducaoZ := False;
            end;
          end
          else
            raise Exception.Create('Não pode abrir cupom fiscal. ' + sLineBreak +
              'O estado atual do ECF é - ' + Est + sLineBreak + e.Message) ;
        end;
      end ;

      if Trim(CPFCNPJ) <> '' then
        frmPrincipal.ACBrECF1.AbreCupom(CPFCNPJ, '', '')
      else
      begin
        if trim(CPFCNPJ) <> '' then
          frmPrincipal.ACBrECF1.AbreCupom(CPFCNPJ, Nome, '')
        else
          frmPrincipal.ACBrECF1.AbreCupom('', '', '');
      end;
    except
      on e : exception do
        if not flEmitindoReducaoZ then
          raise Exception.Create('Abrindo cupom fiscal - ' + e.Message);
    end;

    SetLength(NumeroCupom, 6);
    SetLength(NumeroSerieECF, 20);

    NumeroCupom := frmPrincipal.ACBrECF1.NumCupom;
    NumeroSerieECF := frmPrincipal.ACBrECF1.NumSerie;

    ValorDesconto := 0;
    ValorAproximadoEstadual := 0;
    ValorAproximadoFederal := 0;
    ValorAproximadoMunicipal := 0;

    RetornaPromocoes(dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idConta, dmCaixa.qryDescontos);

    with qryCupomFiscal do
    begin
      Close;
      try
        ParamByName('Totalizado').AsBoolean := dmCaixa.Estacao.ConfiguracoesDaVenda.ImprimirCupomTotalizado;
        ParamByName('idEmpresa').asInteger  := dmCaixa.Estacao.idEmpresa;
        ParamByName('idCaixa').asInteger    := dmCaixa.Estacao.Caixa.idCaixa;
        ParamByName('idConta').asInteger    := idConta;

        Open;
        First;
        while not eof do
        begin
          if FieldByName('AliquotaICMS').AsInteger = 0 then
            sAliquotaICMS := 'FF'
          else
            sAliquotaICMS := RightPad (IntToStr(FieldByName('AliquotaICMS').AsInteger), '0', 2);

          try
            frmPrincipal.ACBrECF1.VendeItem( FieldByName('cdProduto').AsString, Copy(FieldByName('DescricaoReduzida').AsString, 1, 20),
              sAliquotaICMS, FieldByName('qtde').AsFloat, FieldByName('vlProduto').AsFloat);

            sleep(100);

            //*** Verifico se tem desconto para o ítem
            if dmCaixa.qryDescontos.RecordCount > 0 then
            begin
              NumeroItem := 0;
//              if dmCaixa.Estacao.ConfiguracoesDaVenda.ImprimirCupomTotalizado then
//              begin
//                if dmCaixa.qryDescontos.Locate('cdProduto', FieldByName('cdProduto').AsString, []) then
//                  NumeroItem := FieldByName('NumeroItem').AsInteger;
//              end
//              else
              begin
                if dmCaixa.qryDescontos.Locate('idItem', FieldByName('idItem').AsInteger, []) then
                  NumeroItem := FieldByName('NumeroItem').AsInteger;
              end;

              if (NumeroItem > 0) then
              begin
                frmPrincipal.ACBrECF1.DescontoAcrescimoItemAnterior(dmCaixa.qryDescontos.FieldByName('ValorDesconto').AsFloat, 'D',  '$');
                Sleep(100);
              end;
            end;
          except
            on e : exception do
            begin
              raise Exception.Create('Erro enviando item para o ECF - ' +
                TItem(pnlItens.Controls[i]).Produto.DescricaoReduzida + #10#13 + 'ID do ítem - ' + FieldByName('idItem').AsString + sLineBreak + e.Message);
              flCancelaCupom := True;
            end;
          end;

          if frmPrincipal.ACBrIBPTax1.Procurar(FieldByName('NCM').AsString, ex, descricao, tabela, aliqFedNac, aliqFedImp, aliqEstadual, aliqMunicipal, False) then
          begin
//            ChaveIBPT :=
            if aliqEstadual > 0 then
              ValorAproximadoEstadual := ValorAproximadoEstadual + (FieldByName('qtde').AsFloat * FieldByName('vlProduto').AsFloat) * aliqEstadual / 100;
            if aliqFedNac > 0 then
              ValorAproximadoFederal := ValorAproximadoFederal + (FieldByName('qtde').AsFloat * FieldByName('vlProduto').AsFloat) * aliqFedNac / 100;
            if aliqMunicipal > 0 then
              ValorAproximadoMunicipal := ValorAproximadoMunicipal + (FieldByName('qtde').AsFloat * FieldByName('vlProduto').AsFloat) * aliqMunicipal / 100;
          end;

          Next;
        end;
      except
        on e : exception do
          raise Exception.Create('Enviando ítens ao ECF - ' + e.Message);
      end;
    end;

    dmCaixa.qryDescontos.Close;
    qryCupomFiscal.Close;

    //***Depois, vejo se tem desconto sobre a conta
    try
      with TFDQuery.Create(Application) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        SQL.Text := Format('select IndiceECF, idTipoPagamento, DescricaoECF, CodigoECF, sum(vlTotalPagamento) as Pagamento, sum(vlDesconto) as Desconto from viewContasPagamentos ' +
          'where idEmpresa = %d and idCaixa = %d and idConta = %d ' +
          'group by IndiceECF, idTipoPagamento, DescricaoECF, CodigoECF ',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);
        Open;

        First;

        While not Eof do
        begin
          ValorDesconto := ValorDesconto + FieldByName('Desconto').AsCurrency;
          Next;
        end;

        //*** Agora aplico o desconto se necessário
        try
          if ValorDesconto > 0 then
            frmPrincipal.ACBrECF1.SubtotalizaCupom(ValorDesconto * (-1))
          else
            frmPrincipal.ACBrECF1.SubtotalizaCupom(0);
          Sleep(100);
        except
          on e : exception do
            raise Exception.Create('Subtotalizando - ' + sLineBreak + e.Message);
        end;


        //*** Se estação usa o TEF, então busco os pagamentos em cartão
        if dmCaixa.Estacao.Faturamento.TEF then
        begin
          repeat
            flExistePagamentoTEF := False;
            flTEFFinalizado := False;
            flTEFCancelado := False;
            try
              Close;
              SQL.Text := Format('select idContaPagamento, idTipoPagamento, CodigoECF, TipoTransacao, DescricaoRedeAdquirente, vlPagamento from viewContasPagamentos ' +
                'where idEmpresa = %d and idCaixa = %d and idConta = %d ',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);
              Open;

              First;

              While not Eof do
              begin
                if FieldByName('idTipoPagamento').AsInteger in [2, 3, 4] then
                  flExistePagamentoTEF := True;

                Next;
              end;

              if flExistePagamentoTEF then
              begin
                ACBrTEFD1.Inicializar;

                if ACBrTEFD1.RespostasPendentes.Count > 0 then
                  ACBrTEFD1.CancelarTransacoesPendentes;

                First;
                i := 0;

                While (not Eof) and (flTEFCancelado = False) do
                begin
                  if FieldByName('idTipoPagamento').AsInteger in [2, 3, 4] then
                  begin
                    flExistePagamentoTEF := True;
                    flTEFCancelado := False;
                    TipoTransacao := FieldByName('TipoTransacao').AsString;
                    RedeAdquirente:= FieldByName('DescricaoRedeAdquirente').AsString;
                    ACBrTEFD1.CRT(FieldByName('vlPagamento').AsCurrency, FieldByName('CodigoECF').AsString, frmPrincipal.ACBrECF1.NumCOO);
                    if ACBrTEFD1.RespostasPendentes.Count > 0 then
                    begin
                      if ACBrTEFD1.RespostasPendentes[I].TransacaoAprovada then
                      begin
                        with ACBrTEFD1.RespostasPendentes[I] do
                        begin
                          sRede              := LeInformacao(10, 0).AsString;
                          sNSU               := LeInformacao(12, 0).AsString;
                          sNumeroCartao      := LeInformacao(740, 0).AsString;
                          sNomeCartao        := LeInformacao(40, 0).AsString;
                          sTipoCartao        := LeInformacao(731, 0).AsString;
                          sNomeClienteCartao := LeInformacao(741, 0).AsString;
                          sAutorizacao       := LeInformacao(13, 0).AsString;

                          Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.ContaPagamentos',
                            ['idEmpresa', 'idCaixa', 'idConta', 'idContaPagamento'],
                            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta, FieldByName('idContaPagamento').AsInteger],
                            ['Rede', 'NSU', 'NumeroCartao', 'NomeCartao', 'TipoCartao', 'NomeClienteCartao', 'Autorizacao'],
                            [sRede, sNSU, sNumeroCartao, sNomeCartao, sTipoCartao, sNomeClienteCartao, sAutorizacao]);
                        end;
                      end;
                    end;

                    inc(i);
                  end;

                  Next;
                end;
              end;
            except
              on e : exception do
                raise Exception.Create('Erro efetuando pagamento pelo TEF.' + sLineBreak + e.Message);
            end;
          until (Not flExistePagamentoTEF) or ((flExistePagamentoTEF) and (ACBrTEFD1.RespostasPendentes.SaldoRestante = 0)) Or (flTEFCancelado);

          if flTEFCancelado then
            raise Exception.Create('Usuário cancelou o pagamento de cartão.');
        end;

        //*** Agora envio os pagamentos ao ECF
        try
          Close;
          SQL.Text := Format('select IndiceECF, idTipoPagamento, DescricaoECF, CodigoECF, sum(vlTotalPagamento) as Pagamento, sum(vlDesconto) as Desconto from viewContasPagamentos ' +
            'where idEmpresa = %d and idCaixa = %d and idConta = %d ' +
            'group by IndiceECF, idTipoPagamento, DescricaoECF, CodigoECF ',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, Self.idConta]);
          Open;

          First;

          While not Eof do
          begin
            frmPrincipal.ACBrECF1.EfetuaPagamento(FieldByName('CodigoECF').AsString, FieldByName('Pagamento').AsCurrency,
                                               '' , False );
            Sleep(100);
            Next;
          end;

        except
          on e : exception do
            raise Exception.Create('Enviando pagamentos ao ECF - ' + sLineBreak + e.Message);
        end;

        Close;
        Free;
      end;
    except
      on e : exception do
        raise Exception.Create('Enviando pagamentos ao ECF - ' + e.Message);
    end;

    if Trim(dmCaixa.Estacao.Dados.ProconECF) <> '' then
      cMensagem :=  dmCaixa.Estacao.Dados.ProconECF;

    if Trim(Nome) <> '' then
      cMensagem := cMensagem + #10 + 'Convenio - ' + Nome;

    cMensagem := cMensagem +  #10 + 'Data e hora do pedido :' + DateTimeToStr(Now) ;

    sAuxiliar := '';
    case TipoVenda of
      tvVendaBalcao : begin
//        cMensagem := cMensagem + #10 + 'As senhas são aleatórias.' + #10#13 + 'Data e hora do pedido :' + DateTimeToStr(Now) + #10;
        cMensagem := cMensagem + #10 + 'As senhas são aleatórias.' +  #10;
        sAuxiliar := 'Senha';
      end;
      tvVendaMesa: sAuxiliar := 'Mesa';
      tvVendaCartao: sAuxiliar := 'Cartao';
      tvVendaDelivery: sAuxiliar := 'Delivery';
    end;


    sAuxiliar := sAuxiliar + ' - ' + IntToStr(idMesaCartaoSenha);

    if idMesaCartaoSenha > 0 then
    begin
      case frmPrincipal.ACBrECF1.Modelo of
        ecfBematech,
        ecfEpson,
        ecfDaruma,
//        ecfEscECF: cMensagem := cMensagem + #10 + '<e><n>' + sAuxiliar + '</n></e>' + #10;
        ecfEscECF: cMensagem := cMensagem + #10 + '<e><a><in>' + sAuxiliar + '</in></a></e>' + #10;
      else
        cMensagem := cMensagem + #10 + sAuxiliar + #10;
      end;
    end;

    frmPrincipal.ACBrECF1.InfoRodapeCupom.Imposto.ValorAproximadoEstadual  := ValorAproximadoEstadual;
    frmPrincipal.ACBrECF1.InfoRodapeCupom.Imposto.ValorAproximadoFederal   := ValorAproximadoFederal;
    frmPrincipal.ACBrECF1.InfoRodapeCupom.Imposto.ValorAproximadoMunicipal := ValorAproximadoMunicipal;
    frmPrincipal.ACBrECF1.InfoRodapeCupom.Imposto.Fonte := 'IBPT/FECOMERCIO (9oi3aC)';
    frmPrincipal.ACBrECF1.InfoRodapeCupom.Imposto.ModoCompacto := True;

    try
      sleep(100);
      frmPrincipal.ACBrECF1.FechaCupom(cMensagem);

      if dmCaixa.Estacao.Faturamento.TEF then
      begin
        estadoSimuladoEcf := tpsLivre;
        if ACBrTEFD1.RespostasPendentes.Count > 0 then
          ACBrTEFD1.ImprimirTransacoesPendentes;
      end;
    except
      on e : exception do
        raise Exception.Create('Fechando cupom fiscal - ' + e.Message);
    end;
  except
    on e : exception do
    begin
      frmMensagem.MostraMensagemErro(e.Message);

      if dmCaixa.Estacao.Faturamento.TEF then
        if flExistePagamentoTEF then
          ACBrTEFD1.CancelarTransacoesPendentes;

      if frmPrincipal.ACBrECF1.Estado in estCupomAberto then
        frmPrincipal.ACBrECF1.CancelaCupom;

      raise Exception.Create(e.Message);
    end;
  end;
end;

end.

