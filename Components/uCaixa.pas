unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Touch.GestureMgr, Gestures,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient,
  Data.FMTBcd, Data.SqlExpr, Vcl.ImgList, uClasses, ACBrECFClass, ACBrBase,
  ACBrECF, uImpressoras, JvComponentBase, JvComCtrls, Vcl.ComCtrls, JvExComCtrls,
  Datasnap.Provider, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxScrollBar, Vcl.Imaging.jpeg, ACBrDevice,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Protocolo,
  JvExControls, JvLabel, JvExExtCtrls, JvImage, JVXLabel, DataModuleCaixa,
  DBAccess, Uni, MemDS, ACBrBAL, synaser;

type
  TfrmCaixa = class(TForm)
    pnlProdutosPrincipal: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel5: TPanel;
    qryContas: TFDQuery;
    qryItens: TFDQuery;
    Panel6: TPanel;
    btnComboGrelhado: TPanel;
    btnComboSanduiche: TPanel;
    btnComboPastel: TPanel;
    btnComboSalada: TPanel;
    lblValorTotal: TLabel;
    ImageList1: TImageList;
    ACBrECF1: TACBrECF;
    pnlProdutos: TScrollBox;
    pnlSubGrupos: TPanel;
    pnl: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel3: TPanel;
    GestureManager1: TGestureManager;
    pnlItens: TScrollBox;
    btnVoltar: TImage;
    btnExcluirTodoPedido: TImage;
    btnPagamento: TImage;
    btnCalculadora: TPanel;
    Label1: TLabel;
    IdTCPClient1: TIdTCPClient;
    pnlRefrigerantes: TPanel;
    pnlSucos: TPanel;
    pnlUltimosVendidos: TScrollBox;
    Panel2: TPanel;
    qryNovaSenha: TFDQuery;
    qryNovoItem: TFDQuery;
    qryNovaConta: TFDQuery;
    qryBaixa: TFDQuery;
    Balanca: TACBrBAL;
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pnlProdutosGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnComboGrelhadoClick(Sender: TObject);
    procedure btnComboSanduicheClick(Sender: TObject);
    procedure btnComboPastelClick(Sender: TObject);
    procedure btnComboSaladaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure ACBrECF1MsgAguarde(const Mensagem: string);
    procedure btnExcluirTodoPedidoClick(Sender: TObject);
    procedure BalancaLePeso(Peso: Double; Resposta: AnsiString);
  private
    { Private declarations }
    ListaUltimosPedidos : string;
    ProdutoAtual : TProdutoPanel;
    AlturaPainelProduto : integer;
    TamanhoPainelProduto : integer;
    TamanhoFonteDescricao : integer;
    TamanhoFonteValor : integer;
    ValorTotal : Real;
    FidConta: integer;
    FidMesaCartao: integer;
    FTipoVenda: TTipoVenda;
    procedure AdicionouItemEvento(Sender: TObject; NumeroFilhos : integer);
    procedure AtualizaPainelItens;
    procedure AtualizaTotalConta(Const AtualizaValorTotalContaTabela : boolean);
    procedure BaixaItensDoEstoque(Const AItem : TItem);
    procedure BuscaUltimosVendidos;
    function  CarregaFormularioCombo(const AItem : TItem; const AProduto : TProduto; const flCombo : boolean; const TrocarProduto : boolean) : boolean;
    procedure ExcluirItemEvento(Sender: TObject);
    procedure GravarItems;
    procedure ImprimeCupomFiscal;
    procedure ImprimePedido;
    procedure InicializaCupom;
    function  InsereItem(Const AProduto : TProduto; Const flCombo : integer; Const idPai : Variant; Const idTipoRelacionamentoProduto : integer) : integer;
    procedure ItemClick(Sender : TObject);
    procedure ItemTamanhoClick(Sender : TObject);
    procedure OrdenaPainelItens;
    procedure ProdutoClick(Sender : TObject);
    procedure RetirarItemEvento(Sender: TObject);
    function  RetornaNovaSenha : integer;
    procedure SetidConta(const Value: integer);
    procedure SetidMesaCartao(const Value: integer);
    procedure SetTipoVenda(const Value: TTipoVenda);
  public
    { Public declarations }
    impressora : TImpressora;
    IPServidorTCP : string;
    PortaServidorTCP : integer;

    QtdeDigitada : integer;
    function NovaConta : integer;
    function  RetornaContaAberta : integer;
    function ConectaAoServidorTCP : boolean;
    function InicializaECF : boolean;
    procedure AtualizaPainelProdutos(Const AIndex : integer; const AOwner : TWinControl;
        const flCombo : boolean; const ATipo : TTipoProduto);
    procedure LimpaPainelItens;

    procedure ClientConnect(const AClient: TClientRecord);
    procedure ClientDisconnect(const AClient: TClientRecord);
    procedure ClientMessage(const AClient: TClientRecord; const AMessage: string);
    procedure ServerStatus(const AServer: TClientRecord; const AStatus : TStatus; const AMensagem : string; const ADataHoraServidor: TDateTime);
    property idConta : integer read FidConta write SetidConta;
    property idMesaCartao : integer read FidMesaCartao write SetidMesaCartao;
    property TipoVenda : TTipoVenda read FTipoVenda write SetTipoVenda;
  end;

var
  frmCaixa: TfrmCaixa;
  // client listener thread
  ClientThread: TClientThread;
  // user name & ID
  ClientData: TClientRecord;

implementation

{$R *.dfm}

uses
  uCombo, uPagamento, uCalculadora, USplash, uPrincipal;

procedure TfrmCaixa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  if CanClose then
//    ShowWindow(FindWindow ('Shell_TrayWnd',nil), SW_SHOW) ;
end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
//  ShowWindow(FindWindow ('Shell_TrayWnd',nil), SW_HIDE) ;
//  {$IFDEF Debug}
  BoundsRect := Screen.Monitors[1].BoundsRect;
//  {$ENDIF}
  WindowState := wsMaximized;

  AlturaPainelProduto := 85;
  TamanhoPainelProduto := 85;
  TamanhoFonteDescricao := 8;
  TamanhoFonteValor := 8;

  impressora := TImpressora.Create(Self);
  impressora.Modelo := miBematech;
  impressora.FilaDeImpressao := '\\10.1.1.3\pedidos';

  IPServidorTCP := '127.0.0.1';
  PortaServidorTCP := 37893;

  QtdeDigitada := 0;

  DrawRounded(btnComboGrelhado);
  DrawRounded(btnComboSanduiche);
  DrawRounded(btnComboPastel);
  DrawRounded(btnComboSalada);
  DrawRounded(btnCalculadora);

  TipoVenda := tvNenhum;
  idConta := 0;
  idMesaCartao := 0;

  ProdutoAtual := Nil;

  ListaUltimosPedidos := '';
end;

procedure TfrmCaixa.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiCheck : close;
  end;
end;

procedure TfrmCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key in ['1'..'9'] then
    QtdeDigitada := StrToInt(key)
  else
    QtdeDigitada := 0;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  AtualizaPainelProdutos(-1, frmCaixa.pnlProdutos, False, tpProdutoPrincipal);

  case TipoVenda of
    tvVendaBalcao : idConta := RetornaContaAberta;
  end;

  if idConta = 0 then
    raise exception.Create('Não foi informado o ID da conta.');

  //*** Carrego os itens da conta, se existirem
  try
    with qryItens do
    begin
      Close;
      SQL.Text := 'select * from viewItens where idEmpresa =  ' + IntToStr(dmCaixa.idEmpresa) +
                  ' and idCaixa = ' + IntToStr(dmCaixa.idCaixa) +
                  ' and idSessaoCaixa = ' + IntToStr(dmCaixa.idSessaoCaixa) +
                  ' and idConta = ' + IntToStr(idConta) +
                  ' order by NumeroOrdem desc';
      Open;
    end;
  except
    on e : exception do
      raise Exception.Create('Erro buscando os ítens da conta [' + IntToStr(Self.idConta) + ']' + #10#13 +
                             e.Message);
  end;

  BuscaUltimosVendidos;

  AtualizaPainelItens;
  AtualizaTotalConta(False);
end;

procedure TfrmCaixa.btnVoltarClick(Sender: TObject);
var
  cancelar : boolean;
begin
  cancelar := True;

  if TipoVenda = tvVendaBalcao then
  begin
    if ValorTotal > 0 then
    begin
      if MessageDlg('Deseja cancelar esta venda de balcão?', mtConfirmation, [mbNo, mbYes], 0) = IDYes then
      begin
        btnExcluirTodoPedidoClick(Self);

        if ValorTotal<= 0 then
          Close;
      end;
    end;
  end
  else
    Close;
end;

procedure TfrmCaixa.btnExcluirTodoPedidoClick(Sender: TObject);
var
  i : integer;
begin
  if MessageDlg('Deseja excluir todo o pedido?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
  begin
    pnlItens.Visible := False;
    for i := 0 to pnlItens.ControlCount -1 do
      if pnlItens.Controls[i] is TItem then
        TItem(pnlItens.Controls[i]).ExcluirItemClique(pnlItens.Controls[i]);
    pnlItens.Visible := True;

    LimpaPainelItens;
    AtualizaTotalConta(True);
  end;
end;

procedure TfrmCaixa.btnPagamentoClick(Sender: TObject);
var
  i : integer;
begin
  if self.ValorTotal > 0 then
  begin
    frmPagamento := TfrmPagamento.Create(Self);
    //*** Se aconteceu tudo certo então fecho a conta....
    frmPagamento.ValorAPagar := self.ValorTotal;
    if frmPagamento.ShowModal = mrOk then
    begin
      try
        ImprimePedido;

  //      ImprimeCupomFiscal;

        //*** Primiro limpo o painel anterior
        while pnlItens.ControlCount > 0 do
        begin
          if pnlItens.Controls[pnlItens.ControlCount -1] is TItem then
            BaixaItensDoEstoque(TItem(pnlItens.Controls[pnlItens.ControlCount -1]));
          pnlItens.Controls[pnlItens.ControlCount -1].Free;
        end;
      finally
        dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa','idSessaoCaixa', 'idConta'],
          [dmCaixa.idEmpresa, dmCaixa.idCaixa, dmCaixa.idSessaoCaixa, Self.idConta], ['DataFim', 'Valor'], [Now, ValorTotal]);

        LimpaPainelItens;
        AtualizaTotalConta(False);

        if frmPrincipal.TipoEstacao = teCaixaBalcao then
          NovaConta
        else
        begin
          FreeAndNil(frmPagamento);
          Close;
        end;
      end;
    end;

    if Assigned(frmPagamento) then
      frmPagamento.Free;
  end;
end;

function TfrmCaixa.InicializaECF: boolean;
begin
  //*** Tento abrir a conexao com o ECF, se falhar fecho a aplicacao
  try
    result := False;
    if ACBrECF1.AcharECF(true,False) then
    begin
      ACBrECF1.Ativar ;
      result := True;
    end;
  except
    on e : exception do
      raise Exception.Create('Erro inicializando ECF - ' + e.Message);
  end ;
end;

procedure TfrmCaixa.GravarItems;
var
  i,
  idPai : integer;
begin
  try
    with frmCombo do
    begin
      //*** Primeiro o Item Principal do combo
      idPai := InsereItem(frmCombo.Produto.Produto, 1, Null, integer(tpProdutoPrincipal));

      //*** Agora os acompanhamentos
      for I := 0 to Length(frmCombo.ArrayAcompanhamentos) - 1 do
        InsereItem(frmCombo.Acompanhamentos[I].Produto, 1, idPai, integer(tpAcompanhamento));

      //*** Agora os adicionais
      for I := 0 to Length(frmCombo.ArrayAdicionais) - 1 do
        InsereItem(frmCombo.Adicionais[I].Produto, 1, idPai, integer(tpAdicional));

      //*** Agora a sobremesa
      if frmCombo.Sobremesa.Produto.idProduto > 0 then
        InsereItem(frmCombo.Sobremesa.Produto, 1, idPai, integer(tpSobremesa));

      //*** Agora a bebida
      if frmCombo.Bebida.Produto.idProduto > 0 then
        InsereItem(frmCombo.Bebida.Produto, 1, idPai, integer(tpBebida));
    end;
  finally
    AtualizaPainelItens;
    AtualizaTotalConta(True);
  end;

end;

function TfrmCaixa.InsereItem(Const AProduto : TProduto; Const flCombo : integer; Const idPai : Variant; Const idTipoRelacionamentoProduto : integer) : integer;
  function RetornaIDItem : integer;
  begin
    result := -1;
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'Select Next Value For Vendas.ItensSequence';
      Open;
      if RecordCount > 0 then
        result := Fields.Fields[0].AsInteger
      else
        raise Exception.Create('Não retornado o id do combo inserido. ');
    end;
  end;
begin
  result := RetornaIDItem;
  try
    dmCaixa.Inserir('Vendas.Itens', ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idItem', 'idProduto', 'qtde', 'vlProduto',
                                    'AliquotaICMS', 'flCombo', 'idItemPai', 'idTipoRelacionamentoProduto'],
                                    [dmCaixa.idEmpresa, dmCaixa.idCaixa, dmCaixa.idSessaoCaixa, idConta, result, AProduto.idProduto,
                                    AProduto.Qtde, AProduto.Valor, AProduto.AliquotaICMS, flCombo, idPai, idTipoRelacionamentoProduto]);
    if flCombo = 0 then
    begin
      QtdeDigitada := 0;
      AtualizaPainelItens;
      AtualizaTotalConta(True);
    end;
  except
    on e : exception do
    begin
      result := -1;
      raise exception.Create('Produto - ' + AProduto.Descricao);
    end;
  end;
end;

procedure TfrmCaixa.ItemClick(Sender: TObject);
var
  AItem : TItem;
  AidSubGrupo : integer;
  AProduto : TProduto;
begin
  AItem := TItem(Sender);
  if (AItem.NumeroFilhos > 0) or (AItem.IDItemPai > 0) then
  begin
    if AItem.IDItemPai > 0 then
      AProduto := TItem(AItem.Parent).Produto
    else
      AProduto := AItem.Produto;
    CarregaFormularioCombo(AItem, AProduto, True, True)
  end
  else
  begin
    AidSubGrupo := AItem.Produto.idSubGrupo;
    AItem.ExcluiItem(AItem, AItem, false);
    AtualizaPainelProdutos(AidSubGrupo, pnlProdutos, False, tpProdutoPrincipal);
    AtualizaPainelItens;
    AtualizaTotalConta(True);
  end;
end;


procedure TfrmCaixa.ItemTamanhoClick(Sender: TObject);
begin
  OrdenaPainelItens;
end;

procedure TfrmCaixa.LimpaPainelItens;
begin
  //*** Primiro limpo o painel anterior
  try
    while pnlItens.ControlCount > 0do
      pnlItens.Controls[pnlItens.ControlCount -1].Free;
  except
    on e : exception do
      raise Exception.Create('Erro limpando painel de ítens - ' + e.Message);
  end;
end;

function TfrmCaixa.NovaConta : integer;
var
  idSenha : integer;
begin
  //*** Proximo pedido
  result := 0;
  idConta := 0;
  ValorTotal := 0;

  try
    with qryNovaConta do
    begin
      Close;
      SQL.Text := UpperCase('select NEXT VALUE FOR Vendas.ContasSequence');
      Open;

      if Fields.Fields[0].IsNull then
        raise exception.Create('Não retornou valor da sequence.');

      idConta := Fields.Fields[0].AsInteger;

      Close;
      case TipoVenda of
        tvVendaMesa : idSenha := -1;
        else
        begin
          Self.idMesaCartao := -1;
          idSenha := RetornaNovaSenha;
        end;
      end;

      if dmCaixa.Inserir('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartao',
        'NumeroSenha', 'Status'], [dmCaixa.idEmpresa, dmCaixa.idCaixa, dmCaixa.idSessaoCaixa, idConta, Integer(TipoVenda),
        Now, idMesaCartao, idSenha, 1]) <= 0 then
        raise exception.Create('Erro inserindo nova conta. ' + #10 + SQL.Text  )
      else
        result := idConta;
    end;
  except
    on e : exception do
      raise exception.create ('Erro abrindo nova conta. ' + e.Message);
  end;
end;

procedure TfrmCaixa.OrdenaPainelItens;
var
  ATop : integer;
  i : integer;
begin
  ATop := 0;
  for I := 0 to pnlItens.ControlCount - 1 do
  begin
    with TItem(pnlItens.Controls[i]) do
    begin
      Left := 5;
      Top  := ATop;
      ATop := ATop + Height + 5;
    end;
  end;
end;

procedure TfrmCaixa.btnCalculadoraClick(Sender: TObject);
begin
  fCalculadora := TfCalculadora.Create(Self);
  fCalculadora.ShowModal;

  if Trim(fCalculadora.eDisplay.Text) <> '' Then
    QtdeDigitada := StrToInt(fCalculadora.eDisplay.Text);

  fCalculadora.Free;
end;

procedure TfrmCaixa.pnlClick(Sender: TObject);
var
  i : integer;
begin
  for I := 0 to pnlSubGrupos.ControlCount -1 do
  begin
    with TPanel(pnlSubGrupos.Controls[i]) do
    begin
      BevelInner := bvNone;
      BevelKind  := bkNone;
      BorderStyle:= bsNone;
    end;
  end;

  with TPanel(Sender) do
  begin
    BevelInner := bvSpace;
    BevelKind  := bkTile;
    BorderStyle:= bsSingle;
  end;

  pnlUltimosVendidos.Visible := (TipoVenda in [tvVendaMesa, tvVendaCartao]) and (TPanel(Sender).Tag = -1);

  AtualizaPainelProdutos(TPanel(Sender).Tag, pnlProdutos, False, tpProdutoPrincipal);
end;

procedure TfrmCaixa.ProdutoClick(Sender: TObject);
var
  ID : integer;
  TelaPrincipal : boolean;
  ProdutoAuxiliar : TProduto;
begin
  if Sender is TLabel then
    ProdutoAtual := TProdutoPanel(TLabel(Sender).Parent)
  else if Sender is TBevel then
    ProdutoAtual := TProdutoPanel(TBevel(Sender).Parent)
  else if sender is TProdutoPanel then
    ProdutoAtual := TProdutoPanel(Sender);

  ProdutoAuxiliar := ProdutoAtual.Produto;

  ProdutoAuxiliar.Qtde := 1;

  ProdutoAtual.Produto := ProdutoAuxiliar;

  if Not CarregaFormularioCombo(Nil, ProdutoAtual.Produto, False, False) then
  begin
    //*** Produto único (não tem acompanhamentos, adicionais, etc...)
    //*** Então insiro direto
    if not qryitens.Active then
      qryItens.Open;

    if QtdeDigitada = 0 then
      QtdeDigitada := 1;

    ProdutoAuxiliar := ProdutoAtual.Produto;
    ProdutoAuxiliar.Qtde := QtdeDigitada;
    ProdutoAtual.Produto := ProdutoAuxiliar;

    if ProdutoAuxiliar.LeQtdeBalanca then
    begin
      if not Balanca.Ativo then
      begin
        try
        Balanca.Ativar;
        except on E: Exception do
          if e is ESynaSerError then
            raise exception.Create('Não foi possível ativar a balança. ' + sLineBreak +
              'Verifique se está ligada e configurada para a porta ' + Balanca.Porta + sLineBreak +
              e.Message)
          else
            raise exception.Create(e.Message);
        end;
      end;

      if Not Balanca.MonitorarBalanca then
      begin
        Balanca.LePeso;
        Balanca.Desativar;
      end;
    end
    else
      InsereItem(ProdutoAtual.Produto, 0, Null, Integer(tpProdutoPrincipal));
  end;

  ProdutoAtual := Nil;
end;


procedure TfrmCaixa.RetirarItemEvento(Sender: TObject);
begin
  AtualizaTotalConta(True);
end;

function TfrmCaixa.RetornaNovaSenha: integer;
var
  i:integer;
  s : string;
  a : array of integer;

const
  str='1234567890';
begin
  Result := 0;
  for i:=1 to 3 do
    s:=s + str[random(length(str))+1];
  i := StrToInt(s);
  with qryNovaSenha do
  begin
    Close;
    SQL.Text := 'select * from vendas.contas';
    SQL.Text := UpperCase('select 1 from [Vendas].[Contas] where (idempresa = ' + IntToStr(dmCaixa.idEmpresa) +
      ') and (idCaixa = ' + IntToStr(dmCaixa.idCaixa) + ') and (numerosenha = ' + IntToStr(i) +
      ') and (DataInicio >= (GETDATE() -0.1))');
    Open;

    if RecordCount > 0 then
      result := RetornaNovaSenha
    else
      result := i;
  end;
end;

procedure TfrmCaixa.ServerStatus(const AServer: TClientRecord;
  const AStatus: TStatus; const AMensagem: string;
  const ADataHoraServidor: TDateTime);
begin

end;


procedure TfrmCaixa.SetidConta(const Value: integer);
begin
  FidConta := Value;
end;

procedure TfrmCaixa.SetidMesaCartao(const Value: integer);
begin
  FidMesaCartao := Value;
end;

procedure TfrmCaixa.SetTipoVenda(const Value: TTipoVenda);
begin
  FTipoVenda := Value;
end;

procedure TfrmCaixa.pnlProdutosGesture(Sender: TObject;
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

function TfrmCaixa.RetornaContaAberta : integer;
begin
  result := -1;
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := 'select idConta from vendas.contas where (idTipoVenda = ' + IntToStr(Integer(tvVendaBalcao)) +
      ') and (datafim is null) and (idSessaoCaixa = ' + IntToStr(dmCaixa.idSessaoCaixa) + ')';
    Open;
    if not Fields.Fields[0].IsNull then
      result := Fields.Fields[0].AsInteger
    else
      idConta := NovaConta;
  end;
end;

procedure TfrmCaixa.AtualizaTotalConta(Const AtualizaValorTotalContaTabela : boolean);
var
  i, j : integer;
begin
  ValorTotal := 0;
  for I := 0 to pnlItens.ControlCount - 1 do
  begin
    ValorTotal := ValorTotal + (TItem(pnlItens.Controls[i]).Produto.Valor * TItem(pnlItens.Controls[i]).Produto.Qtde);

    if TItem(pnlItens.Controls[i]).Combo then
    begin
      for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
      begin
        if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
          ValorTotal := ValorTotal +
             (TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Valor *
              TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde);
      end;
    end;
  end;

  lblValorTotal.Caption := FormatFloat('0.00', ValorTotal);

  if AtualizaValorTotalContaTabela then
    dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta'],
        [dmCaixa.idEmpresa, dmCaixa.idCaixa, dmCaixa.idSessaoCaixa, idConta], ['Valor'],[ValorTotal]);
end;

procedure TfrmCaixa.BaixaItensDoEstoque(Const AItem : TItem);
var
  i : Integer;

  procedure BaixaProdutosComposicao(const AProduto : integer; const AQtde : Double);

    procedure RelizaMovimentacaoEstoque(const MProduto : integer; const MQtde : double);
    begin
      try
        if dmCaixa.Inserir('Estoque.Movimentacao', ['idEmpresa', 'idProduto', 'DataHora', 'idTipoMovimentacao', 'Qtde', 'idRelacionado'],
          [dmCaixa.idEmpresa, MProduto, Now, 2, StringReplace(FloatToStr(-MQtde), ',', '.', [rfReplaceAll]) , Self.idConta]) <= 0 then
          raise exception.Create('Não incluiu movimentação.');
      except on E: Exception do
        raise Exception.Create('Erro movimentando estoque. ID do produto - ' + IntToStr(MProduto) + ', Quantidade - ' + FloatToStr(MQtde));
      end;
    end;

  begin
    with qryBaixa do
    begin
      Close;
      SQL.Text := 'select *, ' +
                  '  CAST( ' +
                  '     CASE WHEN EXISTS(SELECT 1 FROM Produtos.ProdutoComposicao where idProduto= PC.idProdutoComposicao) THEN 1 ' +
                  '     ELSE 0 ' +
                  '     END ' +
                  '  AS BIT) as TemFilhos ' +
                  '   from Produtos.ProdutoComposicao PC where pc.idProduto = ' + IntToStr(AProduto);
      Open;

      First;
      while not Eof do
      begin
        if FieldByName('TemFilhos').AsBoolean then
          BaixaProdutosComposicao(FieldByName('idProdutoComposicao').AsInteger, AQtde);

        RelizaMovimentacaoEstoque(FieldByName('idProdutoComposicao').AsInteger, FieldByName('Qtde').AsFloat * AQtde);

        Next;
      end;

      FreeAndNil(qryBaixa);
    end;
  end;

  Procedure AtualizaEstoqueNoProduto(const AProduto : integer; const AQtde : double);

    Procedure AtualizaDadosDoProduto (const BProduto : integer; const BQtde : Double);
    begin
      try
        with dmCaixa.qryAuxiliar do
        begin
          Close;
          SQL.Text := 'update Vendas.EmpresaProdutos set QtdeEstoque = QtdeEstoque - ' + StringReplace(FloatToStr(BQtde), ',', '.', [rfReplaceAll]) +
            ' where idEmpresa = ' + IntToStr(dmCaixa.idEmpresa) + ' and idProduto = ' + (IntToStr(BProduto));
          ExecSQL;

          if RowsAffected <= 0 then
            raise exception.Create('Não foi encontrado o produto para atualizar o estoque.');
        end;
      except on E: Exception do
        raise Exception.Create('Erro movimentando estoque. ID do produto - ' + IntToStr(BProduto) + ', Quantidade - ' +
          FloatToStr(BQtde)  + ' --> ' + e.Message);
      end;
    end;
  begin
    with qryBaixa do
    begin
      Close;
      SQL.Text := 'select *, ' +
                  '  CAST( ' +
                  '     CASE WHEN EXISTS(SELECT 1 FROM Produtos.ProdutoComposicao where idProduto= PC.idProdutoComposicao) THEN 1 ' +
                  '     ELSE 0 ' +
                  '     END ' +
                  '  AS BIT) as TemFilhos ' +
                  '   from Produtos.ProdutoComposicao PC where pc.idProduto = ' + IntToStr(AProduto);
      Open;

      First;
      while not Eof do
      begin
        if FieldByName('TemFilhos').AsBoolean then
          AtualizaEstoqueNoProduto(FieldByName('idProdutoComposicao').AsInteger, AQtde);

        AtualizaDadosDoProduto(FieldByName('idProdutoComposicao').AsInteger, FieldByName('Qtde').AsFloat * AQtde);

        Next;
      end;

      FreeAndNil(qryBaixa);
    end;
  end;

  procedure RealizaBaixaNoBancoDeDados(const AProduto : TProduto);
  begin
    BaixaProdutosComposicao(AProduto.idProduto, AProduto.Qtde);

    AtualizaEstoqueNoProduto(AProduto.idProduto, AProduto.Qtde);
  end;
begin
  //*** Primeiro, se o ítem tiver um "filho" eu os excluo.
  for i := 0 to AItem.ControlCount -1 do
    if AItem.Controls[i] is TItem then
      RealizaBaixaNoBancoDeDados(TItem(AItem.Controls[i]).Produto);

  //*** Por fim atualizo o ítem principal
  RealizaBaixaNoBancoDeDados(AItem.Produto);
end;

procedure TfrmCaixa.BalancaLePeso(Peso: Double; Resposta: AnsiString);
var
  i : integer;
  ProdutoAuxiliar : TProduto;
begin
  try
    if Peso > 0 then
    begin
      ProdutoAuxiliar := ProdutoAtual.Produto;
      ProdutoAuxiliar.Qtde := Peso;
      ProdutoAtual.Produto := ProdutoAuxiliar;
      InsereItem(ProdutoAtual.Produto, 0, Null, integer(tpProdutoPrincipal));
    end
    else
    begin
      i := Trunc(Balanca.UltimoPesoLido);
      case i of
         0 : raise exception.Create('TimeOut !'+sLineBreak+ 'Coloque o produto sobre a Balança!');
        -1 : raise exception.Create('Peso Instavel ! ' +sLineBreak+ 'Tente Nova Leitura');
        -2 : raise exception.Create('Peso Negativo !');
        -9 : raise exception.Create('TimeOut !'+sLineBreak+ 'A balança está ligada?');
       -10 : raise exception.Create('Sobrepeso !');
      else
        raise exception.Create('Erro não conhecido - ' + IntToStr(i));
      end;
    end ;
  except
    on E: Exception do
      raise exception.Create('Erro inserindo ítem por peso da balança. Reinicie o processo. ' + ProdutoAtual.Produto.Descricao + sLineBreak + e.Message);
  end;
end;

procedure TfrmCaixa.btnComboGrelhadoClick(Sender: TObject);
begin
  frmCombo := TfrmCombo.Create(Self);
  frmCombo.tsProduto.Caption := 'Grelhado';
  frmCombo.tsProduto.Enabled := True;
  frmCombo.tsAdicionais.Enabled := false;
  frmCombo.tsBebidas.Enabled := false;
  frmCombo.tsSobremesas.Enabled := false;
  AtualizaPainelProdutos(1, frmcombo.pnlProdutos, True, tpProdutoPrincipal);
  frmCombo.pcCombo.ActivePageIndex := 0;
  frmCombo.flCombo := True;
  if frmCombo.ShowModal = idok then
    GravarItems;

  frmCombo.Free;
end;

procedure TfrmCaixa.btnComboPastelClick(Sender: TObject);
begin
  frmCombo := TfrmCombo.Create(Self);
  frmCombo.tsProduto.Caption := 'Pastel';
  frmCombo.tsProduto.Enabled := True;
  frmCombo.tsAdicionais.Enabled := false;
  frmCombo.tsBebidas.Enabled := false;
  frmCombo.tsSobremesas.Enabled := false;
  AtualizaPainelProdutos(0, frmcombo.pnlProdutos, True, tpProdutoPrincipal);
  frmCombo.pcCombo.ActivePageIndex := 0;
  frmCombo.flCombo := True;
  if frmCombo.ShowModal = idok then
    GravarItems;

  frmCombo.Free;
end;

procedure TfrmCaixa.btnComboSaladaClick(Sender: TObject);
begin
  frmCombo := TfrmCombo.Create(Self);
  frmCombo.tsProduto.Caption := 'Salada';
  frmCombo.tsProduto.Enabled := True;
  frmCombo.tsAdicionais.Enabled := false;
  frmCombo.tsBebidas.Enabled := false;
  frmCombo.tsSobremesas.Enabled := false;
  AtualizaPainelProdutos(14, frmcombo.pnlProdutos, True, tpProdutoPrincipal);
  frmCombo.pcCombo.ActivePageIndex := 0;
  frmCombo.flCombo := True;
  if frmCombo.ShowModal = idok then
    GravarItems;

  frmCombo.Free;
end;

procedure TfrmCaixa.btnComboSanduicheClick(Sender: TObject);
begin
  frmCombo := TfrmCombo.Create(Self);
  frmCombo.tsProduto.Caption := 'Sanduiche';
  frmCombo.tsProduto.Enabled := True;
  frmCombo.tsAdicionais.Enabled := false;
  frmCombo.tsBebidas.Enabled := false;
  frmCombo.tsSobremesas.Enabled := false;
  AtualizaPainelProdutos(2, frmcombo.pnlProdutos, True, tpProdutoPrincipal);
  frmCombo.pcCombo.ActivePageIndex := 0;
  frmCombo.flCombo := True;
  if frmCombo.ShowModal = idok then
    GravarItems;

  frmCombo.Free;
end;

function TfrmCaixa.CarregaFormularioCombo(const AItem : TItem; const AProduto : TProduto; const flCombo : boolean; const TrocarProduto : boolean) : boolean;
var
  i, j : integer;
  ItemAuxiliar : TItem;
  flExisteAcompanhamento,
  flExisteAdicional,
  flExisteSobremesa,
  flExisteBebida : boolean;
  ProdutoAuxiliar : TProdutoPanel;
begin
  result := False;

  with dmCaixa.cdsviewProdutosRelacionadosListaPreco do
  begin
    Filtered := False;
    Filter := 'idProduto = ' + IntToStr(AProduto.idProduto);
    Filtered := True;

    if not Fields.Fields[0].IsNull then
    begin
      //*** Verifico se existe acompanhamentos ou adicionais
      First;
      flExisteAcompanhamento := False;
      flExisteAdicional := False;
      flExisteSobremesa := False;
      flExisteBebida := False;
      while not eof do
      begin
        if not FieldByName('idTipoRelacionamentoProduto').IsNull then
        begin
          if FieldByName('idTipoRelacionamentoProduto').AsInteger = 2 then
            flExisteAcompanhamento := True
          else if FieldByName('idTipoRelacionamentoProduto').AsInteger = 3 then
            flExisteAdicional := True
          else if FieldByName('idTipoRelacionamentoProduto').AsInteger = 4 then
            flExisteBebida := True
          else if FieldByName('idTipoRelacionamentoProduto').AsInteger = 5 then
            flExisteSobremesa := True;
        end;
        Next;
      end;

      if (flCombo) or ((Not flCombo) and (flExisteAdicional)) or ((Not flCombo) and (flExisteAcompanhamento))  then
      begin
        frmCombo := TfrmCombo.Create(Self);

        if TrocarProduto then
          frmCombo.TipoEdicao := teAlterar;


        frmCombo.tsProduto.Enabled := False;
        frmCombo.tsProduto.TabVisible := False;
        frmCombo.tsAdicionais.Enabled := False;
        frmCombo.tsAdicionais.TabVisible := False;
        frmCombo.tsBebidas.Enabled := False;
        frmCombo.tsBebidas.TabVisible := False;
        frmCombo.tsSobremesas.Enabled := False;
        frmCombo.tsSobremesas.TabVisible := False;

        if flCombo then
        begin
          frmCombo.tsProduto.Enabled := True;
          frmCombo.tsProduto.TabVisible := True;
          frmCombo.pnlProdutos.Visible := True;
          frmCombo.tsProduto.Caption := 'Produtos';
          AtualizaPainelProdutos(AProduto.idSubGrupo, frmCombo.pnlProdutos, flCombo, tpProdutoPrincipal);
        end;

        if flExisteAcompanhamento then
        begin
          if Not flCombo then
          begin
            frmCombo.tsProduto.Enabled := True;
            frmCombo.tsProduto.TabVisible := True;
            frmCombo.pnlProdutos.Visible := True;
            frmCombo.tsProduto.Caption := 'Acompanhamentos';
          end;
          AtualizaPainelProdutos(AProduto.idProduto, frmCombo.pnlAcompanhamentos, flCombo, tpAcompanhamento);
         if frmCombo.pnlProdutos.ControlCount > frmCombo.pnlAcompanhamentos.ControlCount then
           frmCombo.pnlProdutos.Height:= 406
         else
           frmCombo.pnlProdutos.Height:= 250;
        end;

        if flExisteAdicional then
        begin
          frmCombo.tsAdicionais.Enabled := True;
          frmCombo.tsAdicionais.TabVisible := True;
          AtualizaPainelProdutos(AProduto.idProduto, frmCombo.pnlAdicionais, flCombo, tpAdicional);
        end;

        if (flExisteSobremesa) and (flCombo) then
        begin
          frmCombo.tsSobremesas.Enabled := True;
          frmCombo.tsSobremesas.TabVisible := True;
          AtualizaPainelProdutos(AProduto.idProduto, frmCombo.pnlSobremesas, flCombo, tpSobremesa);
        end;

        if (flExisteBebida) and (flCombo) then
        begin
          frmCombo.tsBebidas.Enabled := True;
          frmCombo.tsBebidas.TabVisible := True;
          AtualizaPainelProdutos(AProduto.idProduto, frmCombo.pnlBebidas, flCombo, tpBebida);
        end;

        if AProduto.idProduto > 0 then
          frmCombo.Produto.Produto := AProduto;

        frmCombo.pnlNomeProduto.Caption := ' ' + aProduto.Descricao;

        if AItem <> Nil then
        begin
          frmCombo.TipoEdicao := teAlterar;

          //*** É uma alteração, então eu tenho que marcar as opções selecionadas anteriormente
          if AItem.IDItemPai > 0 then
            ItemAuxiliar := TItem(AItem.Parent)
          else
            ItemAuxiliar := AItem;

          for I := 0 to ItemAuxiliar.ControlCount -1 do
          begin
            if ItemAuxiliar.Controls[i] is TItem then
            begin
              case TItem(ItemAuxiliar.Controls[i]).Produto.TipoRelacionamentoProduto of
                tpProdutoPrincipal : begin
                  for j := 0 to frmCombo.pnlProdutos.ControlCount -1 do
                  begin
                    if frmCombo.pnlProdutos.Controls[j] is TProdutoPanel then
                      if TProdutoPanel(frmCombo.pnlProdutos.Controls[j]).Produto.idProduto = TItem(ItemAuxiliar.Controls[i]).Produto.idProduto then
                      begin
                        ProdutoAuxiliar := TProdutoPanel(frmCombo.pnlProdutos.Controls[j]);
                        ProdutoAuxiliar.Produto := TItem(ItemAuxiliar.Controls[i]).Produto;
                        frmCombo.Produto := ProdutoAuxiliar;
                      end;
                  end;
                end;
                tpAcompanhamento : begin
                  for j := 0 to frmCombo.pnlAcompanhamentos.ControlCount -1 do
                  begin
                    if frmCombo.pnlAcompanhamentos.Controls[j] is TProdutoPanel then
                      if TProdutoPanel(frmCombo.pnlAcompanhamentos.Controls[j]).Produto.idProduto = TItem(ItemAuxiliar.Controls[i]).Produto.idProduto then
                      begin
                        ProdutoAuxiliar := TProdutoPanel(frmCombo.pnlAcompanhamentos.Controls[j]);
                        ProdutoAuxiliar.Produto := TItem(ItemAuxiliar.Controls[i]).Produto;
                        frmCombo.IncluiAcompanhamento(ProdutoAuxiliar, True);
                      end;
                  end;
                end;
                tpAdicional : begin
                  for j := 0 to frmCombo.pnlAdicionais.ControlCount -1 do
                  begin
                    if frmCombo.pnlAdicionais.Controls[j] is TProdutoPanel then
                      if TProdutoPanel(frmCombo.pnlAdicionais.Controls[j]).Produto.idProduto = TItem(ItemAuxiliar.Controls[i]).Produto.idProduto then
                      begin
                        ProdutoAuxiliar := TProdutoPanel(frmCombo.pnlAdicionais.Controls[j]);
                        ProdutoAuxiliar.Produto := TItem(ItemAuxiliar.Controls[i]).Produto;
                        frmCombo.IncluiAdicional(ProdutoAuxiliar, True);
                      end;
                  end;
                end;
                tpSobremesa : begin
                  for j := 0 to frmCombo.pnlSobremesas.ControlCount -1 do
                  begin
                    if frmCombo.pnlSobremesas.Controls[j] is TProdutoPanel then
                      if TProdutoPanel(frmCombo.pnlSobremesas.Controls[j]).Produto.idProduto = TItem(ItemAuxiliar.Controls[i]).Produto.idProduto then
                      begin
                        ProdutoAuxiliar := TProdutoPanel(frmCombo.pnlSobremesas.Controls[j]);
                        ProdutoAuxiliar.Produto := TItem(ItemAuxiliar.Controls[i]).Produto;
                        frmCombo.Sobremesa := ProdutoAuxiliar;
                      end;
                  end;
                end;
                tpBebida : begin
                  for j := 0 to frmCombo.pnlBebidas.ControlCount -1 do
                  begin
                    if frmCombo.pnlBebidas.Controls[j] is TProdutoPanel then
                      if TProdutoPanel(frmCombo.pnlBebidas.Controls[j]).Produto.idProduto = TItem(ItemAuxiliar.Controls[i]).Produto.idProduto then
                      begin
                        ProdutoAuxiliar := TProdutoPanel(frmCombo.pnlBebidas.Controls[j]);
                        ProdutoAuxiliar.Produto := TItem(ItemAuxiliar.Controls[i]).Produto;
                        frmCombo.Bebida := ProdutoAuxiliar;
                      end;
                  end;
                end;
              end;
            end;
          end;

          case AItem.Produto.TipoRelacionamentoProduto of
            tpProdutoPrincipal: frmCombo.pcCombo.ActivePage := frmCombo.tsProduto;
            tpAcompanhamento: frmCombo.pcCombo.ActivePage := frmCombo.tsProduto;
            tpAdicional: frmCombo.pcCombo.ActivePage := frmCombo.tsAdicionais;
            tpSobremesa: frmCombo.pcCombo.ActivePage := frmCombo.tsSobremesas;
            tpBebida: frmCombo.pcCombo.ActivePage := frmCombo.tsBebidas;
          end;
        end
        else
          frmCombo.TipoEdicao := teIncluir;

        if (flCombo) or ((Not flCombo) and (flExisteAdicional)) or ((Not flCombo) and (flExisteAcompanhamento))  then
        begin
          Result := True;

          if frmCombo.ShowModal = idok then
          begin
            //*** Primeiro apago o item anterior
            if AItem <> Nil then
              AItem.ExcluirItemClique(ItemAuxiliar);

            GravarItems;
          end;
        end;

        frmCombo.Free;
      end;
    end;
  end;
end;


procedure TfrmCaixa.ClientConnect(const AClient: TClientRecord);
begin

end;

procedure TfrmCaixa.ClientDisconnect(const AClient: TClientRecord);
begin

end;

procedure TfrmCaixa.ClientMessage(const AClient: TClientRecord;
  const AMessage: string);
begin

end;

function TfrmCaixa.ConectaAoServidorTCP: boolean;
  function RetornaNomeComputador: string;
  var
    NameBuffer: array[0..255] of char;
    NameString : String;
    size: dword;
  begin
    Result := '';

    try
      size := 256;
      if GetComputerName(NameBuffer, size) then
      begin
        NameString := NameBuffer;
        Result := Trim(NameString);
      end;
    except
      // eat errors
    end;
  end;
begin
  try
    IdTCPClient1.Host := IPServidorTCP;
    IdTCPClient1.Port := PortaServidorTCP;
    IdTCPClient1.Connect;
    // if we are connected
    if IdTCPClient1.Connected then begin
      // create a listener thread instance
      ClientThread := TClientThread.Create(IdTCPClient1);
      ClientData.NomeComputador := RetornaNomeComputador;
      ClientData.Tipo := tcCaixa;
      // set the client user name & ID
      ClientData.ID := Now;
      ClientThread.ClientData := ClientData;
      ClientThread.OnClientConnect := ClientConnect;
      ClientThread.OnClientDisconnect := ClientDisconnect;
      ClientThread.OnClientMessage := ClientMessage;
      ClientThread.OnServerStatus :=ServerStatus;
      // start the thread
      ClientThread.Start;
      // notify clients that we're connected
      ClientThread.SendConnected;
    end; // if Client.Connected then begin
  except
    on e : exception do
      raise exception.Create('Erro conectando ao servidor TCP. ' + e.Message);
  end;
end;

procedure TfrmCaixa.ACBrECF1MsgAguarde(const Mensagem: string);
begin
  if Assigned(frmSplash) then
    frmSplash.AtualizaStatus(Mensagem)
  else
    ShowMessage('Mensagem do ECF --> ' + Mensagem);
end;

procedure TfrmCaixa.AdicionouItemEvento(Sender: TObject; NumeroFilhos: integer);
begin
  if NumeroFilhos > 0 then
    AtualizaPainelItens;

  AtualizaTotalConta(True);
end;

procedure TfrmCaixa.AtualizaPainelItens;
var
  i, j, indexPanel: integer;
  AItens          : array of TItem;
  ComboAnterior   : integer;
  AProduto        : TProduto;
  ATop            : integer;
  ProdutoAuxiliar : TProduto;
  AItemFilho      : TItem;
begin
  LimpaPainelItens;

  pnlItens.Visible := False;

  with qryItens do
  begin
    Refresh;
    First;

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
        //*** Primeiro procuro para saber se já não existe um mesmo produto na lista, se não for combo
        if Not (FieldByName('flCombo').AsBoolean) then
        begin
          if i > 0 then
          begin
            for j := 0 to i -1 do
            begin
              if AItens[j].Produto.idProduto = FieldByName('idProduto').AsInteger then
              begin
                indexPanel := j;
                Break;
              end
            end;
          end;
        end;

        if indexPanel >= 0 then
        begin
          ProdutoAuxiliar := AItens[j].Produto;
          ProdutoAuxiliar.Qtde := ProdutoAuxiliar.Qtde + FieldByName('qtde').AsFloat;
          AItens[j].Produto := ProdutoAuxiliar;
        end
        else
        begin
          SetLength(AItens, i + 1);
          AItens[i] := TItem.CriaItem (pnlItens, tiNormal,
            StringToColor(Trim(FieldByName('Cor').AsString)),
            StringToColor(Trim(FieldByName('CorFonte').AsString)),
            StringToColor(Trim(FieldByName('CorValorFonte').AsString)));
          with AItens[i] do
          begin
            IDItemPai := 0;
            IDConta   := Self.idConta;
            IDItem    := FieldByName('idItem').AsInteger;

            ProdutoAuxiliar.idProduto := FieldByName('idProduto').AsInteger;
            ProdutoAuxiliar.idSubGrupo := FieldByName('idSubGrupoProduto').AsInteger;
            ProdutoAuxiliar.cdProduto := FieldByName('cdProduto').AsInteger;
            ProdutoAuxiliar.AliquotaICMS := FieldByName('AliquotaICMS').AsFloat;
            ProdutoAuxiliar.NumeroMaximoAcompanhamentos := FieldByName('NumeroMaximoAcompanhamentos').AsInteger;
            ProdutoAuxiliar.Descricao := FieldByName('Descricao').AsString;
            ProdutoAuxiliar.TipoRelacionamentoProduto := TTipoProduto(FieldByName('idTipoRelacionamentoProduto').AsInteger);
            onTamanho := ItemTamanhoClick;

            ProdutoAuxiliar.Qtde  := FieldByName('Qtde').AsFloat;
            ProdutoAuxiliar.Valor := FieldByName('vlProduto').AsFloat;

            Produto := ProdutoAuxiliar;

            Combo := FieldByName('flCombo').AsBoolean;

            if Combo then
            begin
              if Produto.TipoRelacionamentoProduto in [tpAcompanhamento, tpBebida, tpSobremesa] then
              begin
                TPanel(FindComponent(AItens[i].Name + 'btnAdicionarItem')).Visible := False;
                TPanel(FindComponent(AItens[i].Name + 'btnExcluirItem')).Visible   := False;
                TPanel(FindComponent(AItens[i].Name + 'btnRetirarItem')).Visible   := False;
              end
              else
                if Produto.TipoRelacionamentoProduto = tpProdutoPrincipal then
                  TPanel(FindComponent(AItens[i].Name + 'btnTamanhoItem')).Visible := True;
            end
            else
              TPanel(FindComponent(AItens[i].Name + 'btnRetirarItem')).Visible := True;


            Parent       := pnlItens;
            Ctl3D        := False;
            tag          := i;
            onItemClick  := ItemClick;
            onAdicionado := AdicionouItemEvento;
            onExcluido   := ExcluirItemEvento;
            onRetirado   := RetirarItemEvento;

            //*** Procuro por "filhos"
            with dmCaixa.qryAuxiliar do
            begin
              dmCaixa.qryAuxiliar.Close;
              dmCaixa.qryAuxiliar.SQL.Text := 'select * from viewItens where idItemPai = ' + IntToStr(IDItem) + ' order by idTipoRelacionamentoProduto asc, NumeroOrdem asc';
              dmCaixa.qryAuxiliar.Open;

              if not dmCaixa.qryAuxiliar.Fields.Fields[0].IsNull then
              begin
                dmCaixa.qryAuxiliar.First;
                while Not dmCaixa.qryAuxiliar.EOF do
                begin
                  AItemFilho := TItem.CriaItem (AItens[i], tiCombo,
                    StringToColor(Trim(dmCaixa.qryAuxiliar.FieldByName('Cor').AsString)),
                    StringToColor(Trim(dmCaixa.qryAuxiliar.FieldByName('CorFonte').AsString)),
                    StringToColor(Trim(dmCaixa.qryAuxiliar.FieldByName('CorValorFonte').AsString)));
                  with AItemFilho do
                  begin
                    Top := AItens[i].Height;
                    AItens[i].Height := AItens[i].Height + 36;
                    IDItemPai := AItens[i].IDItem;
                    IDConta := Self.idConta;
                    IDItem := dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger;
                    ProdutoAuxiliar.idProduto := dmCaixa.qryAuxiliar.FieldByName('idProduto').AsInteger;
                    ProdutoAuxiliar.idSubGrupo := dmCaixa.qryAuxiliar.FieldByName('idSubGrupoProduto').AsInteger;
                    ProdutoAuxiliar.cdProduto := dmCaixa.qryAuxiliar.FieldByName('cdProduto').AsInteger;
                    ProdutoAuxiliar.AliquotaICMS := dmCaixa.qryAuxiliar.FieldByName('AliquotaICMS').AsFloat;
                    ProdutoAuxiliar.TipoRelacionamentoProduto := TTipoProduto(dmCaixa.qryAuxiliar.FieldByName('idTipoRelacionamentoProduto').AsInteger);
                    if ProdutoAuxiliar.TipoRelacionamentoProduto = tpAdicional then
                      ProdutoAuxiliar.Descricao := 'Adicional - ' + dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString
                    else
                      ProdutoAuxiliar.Descricao := dmCaixa.qryAuxiliar.FieldByName('Descricao').AsString;
                    ProdutoAuxiliar.Qtde  := dmCaixa.qryAuxiliar.FieldByName('Qtde').AsFloat;
                    ProdutoAuxiliar.Valor := dmCaixa.qryAuxiliar.FieldByName('vlProduto').AsFloat;
                    Produto := ProdutoAuxiliar;
                    Combo := dmCaixa.qryAuxiliar.FieldByName('flCombo').AsBoolean;

                    if Combo then
                    begin
                      if Produto.TipoRelacionamentoProduto in [tpAcompanhamento, tpBebida, tpSobremesa] then
                      begin
                        TPanel(FindComponent(AItemFilho.Name + 'btnAdicionarItem')).Visible := False;
                        TPanel(FindComponent(AItemFilho.Name + 'btnExcluirItem')).Visible := False;
                        TPanel(FindComponent(AItens[i].Name + 'btnRetirarItem')).Visible := False;
                      end;
                    end
                    else
                      TPanel(FindComponent(AItemFilho.Name + 'btnRetirarItem')).Visible := True;

                    Parent     := AItens[i];
                    Ctl3D      := False;
                    tag        := i;
                    onAdicionado := AdicionouItemEvento;
                    onExcluido := ExcluirItemEvento;
                    onRetirado := RetirarItemEvento;
                    onItemClick:= ItemClick;

                    Inc(AItens[i].NumeroFilhos);
                  end;
                  Next;
                end;
                AItens[i].AtualizaValorTotal;
                AItens[i].Height := AItens[i].Height + 05;
              end;
              dmCaixa.qryAuxiliar.Close;
            end;
            Inc(i);
          end;
        end;
      end;
      Next;
    end;
    if qryItens.RecordCount > 0 then
      BuscaUltimosVendidos;
  end;
  OrdenaPainelItens;
  pnlItens.Visible := True;
end;

procedure TfrmCaixa.AtualizaPainelProdutos(Const AIndex : integer; const AOwner : TWinControl;
    const flCombo : boolean; const ATipo : TTipoProduto);
var
  i               : integer;
  nroHorizontal   : integer;
  horizontalAtual : integer;
  verticalAtual   : integer;
  arrayProdutos   : array of TProdutoPanel;
  ProdutoAuxiliar : TProduto;
  cdsAuxiliar     : TClientDataSet;
begin
  LockWindowUpdate(Self.Handle);

  //*** Limpo todos os componentes do Aowner
  while AOwner.ControlCount > 0 do
    AOwner.Controls[0].Free;

  if AIndex = -2 then
  begin
    cdsAuxiliar := dmCaixa.cdsviewProdutos;
    cdsAuxiliar.Filtered := False;
    cdsAuxiliar.Filter := '(idProduto in ' + ListaUltimosPedidos + ') and (idTipoProduto = 1)';
    cdsAuxiliar.IndexFieldNames := 'idSubGrupoProduto;Descricao';
    cdsAuxiliar.Filtered := True;
  end
  else if AIndex = -1 then
  begin
    cdsAuxiliar := dmCaixa.cdsviewProdutos;
    cdsAuxiliar.Filtered := False;
    cdsAuxiliar.Filter := 'MaisVendidos = 1';
    cdsAuxiliar.IndexFieldNames := 'idSubGrupoProduto;Descricao';
    cdsAuxiliar.Filtered := True;
  end
  else if (ATipo = tpProdutoPrincipal) and (flCombo) then
  begin
    cdsAuxiliar := dmCaixa.cdsviewProdutos;
    cdsAuxiliar.Filtered := False;
    cdsAuxiliar.Filter := 'idGrupoProduto = ' + IntToStr(AIndex);
    cdsAuxiliar.IndexFieldNames := 'idSubGrupoProduto;Descricao';
    cdsAuxiliar.Filtered := True;
  end
  else if ATipo = tpProdutoPrincipal then
  begin
    cdsAuxiliar := dmCaixa.cdsviewProdutos;
    cdsAuxiliar.Filtered := False;
    if AIndex in [10, 11, 12] then
    begin
      case AIndex of
        10 : cdsAuxiliar.Filter := 'idSubGrupoProduto = 5';
        11 : cdsAuxiliar.Filter := 'idSubGrupoProduto = 19';
        12 : cdsAuxiliar.Filter := 'idSubGrupoProduto = 8';
      end;
    end
    else
    begin
      if AIndex = 13 then
        cdsAuxiliar.Filter := 'idLinhaProduto = 11'
      else
        cdsAuxiliar.Filter := 'idLinhaProduto = ' + IntToStr(AIndex);
    end;
    cdsAuxiliar.IndexFieldNames := 'idSubGrupoProduto;Descricao';
    cdsAuxiliar.Filtered := True;
  end
  else
  begin
    cdsAuxiliar := dmCaixa.cdsviewProdutosRelacionadosListaPreco;
    cdsAuxiliar.Filtered := False;
    cdsAuxiliar.Filter := '(idProduto = ' + IntToStr(AIndex) +
      ') and (idTipoRelacionamentoProduto = ' + IntToStr(Integer(ATipo)) + ')';
    cdsAuxiliar.IndexFieldNames := 'Ordem';
    cdsAuxiliar.Filtered := True;
  end;

//    qryProdutos.SQL.Text := 'select * from  viewProdutos ' +
//                  'where (p.idProduto in (select idProdutoRelacionado from Produtos.ProdutosRelacionados where (idProduto = ' + IntToStr(AIndex) +
//                  ') and (tipo = ' + IntToStr(Integer(ATipo)) + ')) order by p.Ordem, p.Descricao';
  i:= 0;

  Application.ProcessMessages;

  with cdsAuxiliar do
  begin
    First;
    SetLength(arrayProdutos, RecordCount);

    while not eof do
    begin
      arrayProdutos[i] := TProdutoPanel.CriaProduto(AOwner, AlturaPainelProduto, TamanhoPainelProduto, TamanhoFonteDescricao, TamanhoFonteValor);
      with arrayProdutos[i] do
      begin
        if (AIndex <> -1) and (ATipo <> tpProdutoPrincipal) then
          ProdutoAuxiliar.IDProduto := FieldByName('idProdutoRelacionado').AsInteger
        else
          ProdutoAuxiliar.IDProduto := FieldByName('idProduto').AsInteger;
        ProdutoAuxiliar.cdProduto := FieldByName('cdProduto').AsInteger;
        ProdutoAuxiliar.AliquotaICMS := FieldByName('AliquotaICMS').AsFloat;
        ProdutoAuxiliar.NumeroMaximoAcompanhamentos := FieldByName('NumeroMaximoAcompanhamentos').AsInteger;
        if Atipo in ([tpAcompanhamento, tpAdicional, tpBebida, tpSobremesa]) then
          ProdutoAuxiliar.Descricao := FieldByName('DescricaoProdutoRelacionado').AsString
        else
          ProdutoAuxiliar.Descricao := FieldByName('Descricao').AsString;
        if ((flCombo) and (Atipo = tpProdutoPrincipal)) then
          ProdutoAuxiliar.Valor   := FieldByName('vlTotalCombo').AsFloat
        else if Atipo in ([tpAcompanhamento, tpAdicional, tpBebida, tpSobremesa]) then
          ProdutoAuxiliar.Valor   := FieldByName('vlRelacionado').AsFloat
        else
          ProdutoAuxiliar.Valor   := FieldByName('vlUnitario').AsFloat;
        ProdutoAuxiliar.IDSubGrupo:= FieldByName('IDSubGrupoProduto').AsInteger;
        if (AIndex <> -1) and (ATipo <> tpProdutoPrincipal) then
          ProdutoAuxiliar.Relacao   := TTipoRelacao(FieldByName('TipoRelacao').AsInteger);
        ProdutoAuxiliar.TipoRelacionamentoProduto      := ATipo;
        ProdutoAuxiliar.LeQtdeBalanca   := FieldByName('LeQtdeBalanca').AsBoolean;

        Height     := AlturaPainelProduto;
        Width      := TamanhoPainelProduto;

        Produto := ProdutoAuxiliar;

        Parent     := AOwner;
        Cor        := StringToColor(Trim(FieldByName('Cor').AsString));
        CorSelecionado := StringToColor(Trim(FieldByName('CorSelecionado').AsString));
        CorFonte   := StringToColor(Trim(FieldByName('CorFonte').AsString));
        CorFonteSelecionado := StringToColor(Trim(FieldByName('CorFonteSelecionado').AsString));
        CorValorFonte   := StringToColor(Trim(FieldByName('CorValorFonte').AsString));
        CorValorFonteSelecionado := StringToColor(Trim(FieldByName('CorValorFonteSelecionado').AsString));
        Caption    := '';
        if (AOwner = Self.pnlProdutos) or (AOwner = pnlUltimosVendidos) then
          OnProdutoClick := ProdutoClick
        else
          onProdutoClick := frmCombo.Clicou;
        tag        := i;

        Selecionado := False;
      end;

      Inc(i);
      Next;
    end;
  end;

  //*** Primeiro verifico quantos cabem na horizontal
  //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
  nroHorizontal   := Trunc(AOwner.Width / (TamanhoPainelProduto+5)) - 1;

  horizontalAtual := 0;
  verticalAtual   := 0;

  for I := 0 to cdsAuxiliar.RecordCount - 1 do
  begin
    with arrayProdutos[i] do
    begin
      if horizontalAtual > nroHorizontal then
      begin
        horizontalAtual := 0;
        Inc(verticalAtual);
      end;

      Top  := verticalAtual * (AlturaPainelProduto + 5) + 5;
      Left := horizontalAtual * (TamanhoPainelProduto + 5) + 5;
    end;

    Inc(horizontalAtual);
  end;

  LockWindowUpdate(0);
end;

procedure TfrmCaixa.ExcluirItemEvento(Sender: TObject);
begin
  AtualizaPainelItens;
  AtualizaTotalConta(True);
end;

procedure TfrmCaixa.ImprimePedido;
var
  i : integer;
  j : integer;
  descricao : string;
  qtde : string;
begin
  //***

  with impressora do
  begin
    InicializaImpressao;

    ImprimeCentralizado('Senha - 1', 13, True, False, False, False);
    ImprimeLinha(StringOfChar('-', 48));

    for I := 0 to pnlItens.ControlCount -1 do
    begin
      descricao := Copy(TItem(pnlItens.Controls[i]).Produto.Descricao, 1, 22);
      qtde := FloatToStr(TItem(pnlItens.Controls[i]).Produto.Qtde);

      if TItem(pnlItens.Controls[i]).Combo then
      begin
        ImprimeExpandido(Format('%-20s', [Descricao]));

        for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
        begin
          if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
          begin
            if TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.TipoRelacionamentoProduto in [tpAcompanhamento, tpAdicional] then
            begin
              descricao := Copy(TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Descricao, 1, 30);
              qtde := FloatToStr(TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde);
              ImprimeLinha('    ' + Format('%-30s', [descricao])  + ' ' + Format('%3s',[Qtde]));
            end
            else
            begin
              ImprimeLinhaEmBranco(1);
              descricao := Copy(TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Descricao, 1, 16);
              qtde := FloatToStr(TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde);
              ImprimeExpandido('  ' + Format('%-16s', [descricao])  + ' ' + Format('%3s',[Qtde]));
            end;
          end;
        end;
      end
      else
        ImprimeExpandido(Format('%-18s', [Descricao]) + ' ' + Format('%2s',[Qtde]));

      ImprimeLinhaEmBranco(1)
    end;

    if NumeroLinhasImpressas > 12 then
      ImprimeLinhaEmBranco(1)
    else
      ImprimeLinhaEmBranco(12 - NumeroLinhasImpressas);

    CorteTotal;

    FinalizaImpressao;
  end;
end;

procedure TfrmCaixa.InicializaCupom;
begin
  with ACBrECF1 do
  begin
    try
      AbreCupom;
    except
      on e : exception do
      begin
        ShowMessage(e.Message);

        if pos('Cupom aberto', e.Message) > 0 then
        begin
          try
            CancelaCupom;
          except
            on e : exception do
            begin
              if Not (pos('Cancelamento já efetuado', e.message) > 0) then
                raise Exception.Create('Erro cancelando cupom fiscal - ' + e.Message);
            end;
          end;

          CortaPapel;

          InicializaCupom;
        end;
      end;
    end;
  end;
end;

procedure TfrmCaixa.ImprimeCupomFiscal;
var
  i : integer;
  j : integer;
  descricao : string;
  qtde : string;
  flCancelaCupom : boolean;
  sAliquotaICMS : string;
begin
  //***
  with ACBrECF1 do
  begin
    InicializaCupom;

    for I := 0 to pnlItens.ControlCount -1 do
    begin
      descricao := Copy(TItem(pnlItens.Controls[i]).Produto.Descricao, 1, 22);
      qtde := FloatToStr(TItem(pnlItens.Controls[i]).Produto.Qtde);
//      try
        if TItem(pnlItens.Controls[i]).Produto.AliquotaICMS = 0 then
          sAliquotaICMS := 'FF'
        else
          sAliquotaICMS := FloatToStr(TItem(pnlItens.Controls[i]).Produto.AliquotaICMS);

        flCancelaCupom := True;

        try
          VendeItem(IntToStr(TItem(pnlItens.Controls[i]).Produto.cdProduto),
                TItem(pnlItens.Controls[i]).Produto.Descricao,
                sAliquotaICMS,
                TItem(pnlItens.Controls[i]).Produto.Qtde,
                TItem(pnlItens.Controls[i]).Produto.Valor);
        finally
          flCancelaCupom := False;
        end;
//      except
//        on e : exception do
//          raise Exception.Create('Erro enviando item para o ECF - ' + TItem(pnlItens.Controls[i]).Produto.Descricao + #10#13 + e.Message);
//      end;
      if TItem(pnlItens.Controls[i]).Combo then
      begin
        for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
        begin
          if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
          begin
//            try
            if TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.AliquotaICMS = 0 then
              sAliquotaICMS := 'FF'
            else
              sAliquotaICMS := FloatToStr(TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.AliquotaICMS);

            flCancelaCupom := True;
            try
              VendeItem(IntToStr(TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.cdProduto),
                      TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Descricao,
                      sAliquotaICMS,
                      TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde,
                      TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Valor);
            finally
              flCancelaCupom := False;
            end;
//          except
//            on e : exception do
//              raise Exception.Create('Erro enviando item para o ECF - ' + TItem(pnlItens.Controls[i]).Produto.Descricao + #10#13 + e.Message);
          end;
        end;
      end
    end;
    if flCancelaCupom then
    begin
      CancelaCupom;

      CortaPapel;
    end
    else
    begin
      SubtotalizaCupom( 0, ' ');

      EfetuaPagamento('01', StrToFloat(frmPagamento.edtValorPago.Caption));

      FechaCupom;

      CortaPapel;
    end;
  end;
end;

procedure TfrmCaixa.BuscaUltimosVendidos;
begin
  ListaUltimosPedidos := '';
  if TipoVenda in [tvVendaMesa, tvVendaCartao] then
  begin
    with qryItens do
    begin
      if RecordCount > 0 then
      begin
        ListaUltimosPedidos := '';
        First;
        while not Eof do
        begin
          if FieldByName('idTipoRelacionamentoProduto').AsInteger = Integer(tpProdutoPrincipal) then
          begin
            if ListaUltimosPedidos = '' then
              ListaUltimosPedidos := FieldByName('idProduto').AsString
            else
              ListaUltimosPedidos := ListaUltimosPedidos + ', ' + FieldByName('idProduto').AsString;
          end;
          Next;
        end;
      end;
      if ListaUltimosPedidos <> '' then
      begin
        ListaUltimosPedidos := '('+ ListaUltimosPedidos + ')';
        AtualizaPainelProdutos(-2, pnlUltimosVendidos, False, tpProdutoPrincipal);
      end;
    end;
  end;

  pnlUltimosVendidos.Visible := Trim(ListaUltimosPedidos) <> '';
end;
end.


{
  //*** Relação do combo com o produto relacionado
  0 - Pode ter um ou mais produtos deste grupo
  1 - Deve ter um produto deste grupo
  2 - Produto de relação exclusiva (só pode existir um item relacionado deste grupo para este produto)
  3 - Contem obrigatoriamente este produto
}



