unit uConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient,
  Data.FMTBcd, Data.SqlExpr, Vcl.ImgList, uClasses, JvComponentBase, JvComCtrls,
  Vcl.ComCtrls, JvExComCtrls,
  Datasnap.Provider, Vcl.Imaging.jpeg, JvExControls, JvLabel,
  JvExExtCtrls, JvImage, DataModuleCaixa, synaser,
  uImpressoras, System.StrUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrECF, ACBrECFClass,
  DateUtils, ACBrDevice;

type
  TfrmConta = class(TForm)
    pnlProdutosPrincipal: TPanel;
    Panel1: TPanel;
    pnlTotal: TPanel;
    qryContas: TFDQuery;
    lblValorTotal: TLabel;
    ImageList1: TImageList;
    pnlProdutos: TScrollBox;
    pnlDireita: TPanel;
    pnlItens: TScrollBox;
    btnVoltar: TImage;
    btnExcluirTodoPedido: TImage;
    btnPagamento: TImage;
    btnCalculadora: TPanel;
    Label1: TLabel;
    pnlCentro: TPanel;
    qryNovaSenha: TFDQuery;
    qryNovoItem: TFDQuery;
    qryNovaConta: TFDQuery;
    qryBaixa: TFDQuery;
    pnlMaisVendidos: TScrollBox;
    pnlLinhasProdutos: TScrollBox;
    btnMaisVendidos: TPanel;
    qryLinhasProduto: TFDQuery;
    pnlMesaCartao: TPanel;
    lblGarcom: TLabel;
    lblGarcomNome: TLabel;
    Label4: TLabel;
    lblData: TLabel;
    lblDataHoraAbertura: TLabel;
    btnConferencia: TPanel;
    pnlQuantidade: TPanel;
    lbl1: TLabel;
    btnCancelarQuantidade: TButton;
    edtQuantidade: TEdit;
    btnNaoConferencia: TPanel;
    Label5: TLabel;
    qryPromocoes: TFDQuery;
    timerAtualizaItens: TTimer;
    btnTipoVenda: TPanel;
    pnlTipoVendaConta: TPanel;
    lblTipoVenda: TLabel;
    pnlEditSenha: TPanel;
    edtSenha: TEdit;
    qryCupomFiscal: TFDQuery;
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
    procedure btnCancelarQuantidadeClick(Sender: TObject);
    procedure btnNaoConferenciaClick(Sender: TObject);
    procedure timerAtualizaItensTimer(Sender: TObject);
    procedure btnTipoVendaClick(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
  private
    { Private declarations}
    ListaUltimosPedidos : string;
    ValorTotal : Real;
    FidConta: integer;
    FidMesaCartaoSenha: integer;
    FTipoVenda: TTipoVenda;
    FidGarcom: integer;
    ValorDesconto : double;
    PontosDotz : integer;
    NumeroCupom : AnsiString;
    NumeroSerieECF : AnsiString;
    AtualizaValorTotalContaTabela : Boolean;
    FidPessoa: integer;
    procedure AtualizaTotalConta;
    procedure BaixaItensDoEstoque(Const AItem : TItem);
    function  CarregaFormularioCombo(AItem : TItem; AProduto : TProduto; Combo : boolean; AidTipoRelacionamento : integer) : boolean;
    procedure ImprimeCupomFiscal(Nome : string);
    procedure ItemClick(Sender : TObject);
    procedure AdicionarClick(Sender : TObject);
    procedure ExcluirClick(Sender : TObject);
    procedure RetirarClick(Sender: TObject);
    procedure TamanhoClick(Sender : TObject);
    procedure ProdutoClick(Sender : TObject);
    function  RetornaNovaSenha : integer;
    procedure SetidConta(const Value: integer);
    procedure SetidMesaCartaoSenha(const Value: integer);
    procedure SetTipoVenda(const Value: TTipoVenda);
    procedure SetidGarcom(const Value: integer);
    procedure SetidPessoa(const Value: integer);
  public
    { Public declarations }
    ProdutoAtual : TProdutoPanel;
    procedure btnLinhaProdutoClick(Sender: TObject);
    procedure AtualizaPainelProdutos(const AidItem : integer; Const AIndex : integer; const AOwner : TWinControl;
                                     const flCombo : boolean; const AidTipoRelacionamento : Integer);
    procedure AtualizaVisualizacao;
    function  NovaConta : integer;
    function  RetornaContaAberta : integer;
    function  RetornaUsuarioEstorno : integer;
    property  idPessoa : integer read FidPessoa write SetidPessoa;
    property  idConta : integer read FidConta write SetidConta;
    property  idMesaCartaoSenha : integer read FidMesaCartaoSenha write SetidMesaCartaoSenha;
    property  idGarcom : integer read FidGarcom write SetidGarcom;
    property  TipoVenda : TTipoVenda read FTipoVenda write SetTipoVenda;
  end;

var
  frmConta: TfrmConta;

implementation

uses
  uPagamento, uCombo, uCalculadora, uPrincipal, uMensagem, frmBobinaECF,
  uSelecionaPessoa, uSelecionaTipoVenda, uSenha;
{$R *.dfm}

procedure TfrmConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    while pnlLinhasProdutos.ControlCount > 0 do
      pnlLinhasProdutos.Controls[0].Free;

    while pnlProdutos.ControlCount > 0 do
      pnlProdutos.Controls[0].Free;

    while pnlMaisVendidos.ControlCount > 0 do
      pnlMaisVendidos.Controls[0].Free;

    while pnlItens.ControlCount > 0 do
      pnlItens.Controls[0].Free;

  except
    on e : exception do
      raise exception.create ('Fechando formulario de conta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.FormCreate(Sender: TObject);
var
  i : integer;
begin
  try
    idGarcom := 0;
    idConta := 0;
    idPessoa := 0;
    idMesaCartaoSenha := 0;
    TipoVenda := tvNenhum;
    ProdutoAtual := Nil;

    BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
    WindowState := wsMaximized;

    DrawRounded(btnCalculadora);
    DrawRounded(btnConferencia);

    lblGarcomNome.Caption := '';
    lblDataHoraAbertura.Caption := '';

    ListaUltimosPedidos := '';

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

      while not eof do
      begin
        with TPanel.Create(pnlLinhasProdutos) do
        begin
          Height := dmCaixa.Estacao.AlturaLinhasProduto;
          Top := 5 + (pnlLinhasProdutos.ControlCount * (Height + 5)) ;
          Left := 5;
          Parent := pnlLinhasProdutos;
          Width := Parent.Width - 10;
          Caption := FieldByName('Descricao').AsString;
          Color := FieldByName('CorFundo').AsInteger;
          Font.Name := 'ROBOTO';
          Font.Size := 11;
          Font.Color := FieldByName('CorFonte').AsInteger;
          Tag := FieldByName('idLinha').AsInteger;
          OnClick := btnLinhaProdutoClick;
          BevelInner := bvNone;
          BevelKind := TBevelKind(bkNone);
          BevelOuter := TBevelCut(bkNone);
          BorderStyle := TBorderStyle(bkNone);
        end;

        Next;
      end;

      for I := 0 to pnlLinhasProdutos.ControlCount -1 do
        if pnlLinhasProdutos.Controls[i] is TPanel then
          DrawRounded(TWinControl(pnlLinhasProdutos.Controls[i]));
    end;
  except
    on e : exception do
      raise exception.create ('Criando formulario de conta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Sender <> edtSenha then
  begin
    if key in ['0'..'9', '.', ',', #9] then
    begin
      if not pnlQuantidade.Visible then
      begin
        pnlQuantidade.Visible := True;
        edtQuantidade.Text := key;
      end
      else
      begin
        if key in ['0'..'9', '.', ','] then
        begin
          if key = '.' then
            edtQuantidade.Text := edtQuantidade.Text + ','
          else
            edtQuantidade.Text := edtQuantidade.Text + key;
        end
        else
          edtQuantidade.Text := copy (edtQuantidade.Text, 1, length(edtQuantidade.Text) - 1);
      end;
    end;
  end;
end;

procedure TfrmConta.FormShow(Sender: TObject);
var
  i,
  horizontalAtual,
  verticalAtual,
  nroHorizontal : integer;
  arrayCombos : array of tCombo;
begin
  try
    pnlEditSenha.Enabled := dmCaixa.Estacao.SenhaManual;

    AtualizaPainelProdutos(0, -1, frmConta.pnlProdutos, False, -1);

    if (dmCaixa.Estacao.TipoEstacao = teCaixaBalcao) and (TipoVenda = tvVendaBalcao) then
      idConta := RetornaContaAberta
    else if dmCaixa.Estacao.TipoEstacao = teLancamento then
    begin
      btnExcluirTodoPedido.Visible := False;
      btnPagamento.Visible := False;
      btnConferencia.Visible := False;
      btnNaoConferencia.Visible := False;
    end;

    if TipoVenda <> tvVendaMesa then
    begin
      lblData.Visible := False;
      lblDataHoraAbertura.Visible := False;
      lblGarcom.Visible := False;
      lblGarcomNome.Visible := False;
    end;

    if idConta = 0 then
      raise exception.Create('Não foi informado o ID da conta.');

    //*** Carrego os itens da conta, se existirem
    try
      dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.idCaixa, Self.idConta, -1);
    except
      on e : exception do
        raise Exception.Create('Erro buscando os ítens da conta [' + IntToStr(Self.idConta) + ']' + #10#13 +
                               e.Message);
    end;

//    BuscaUltimosVendidos;

    dmCaixa.AtualizaPainelItens(pnlItens, Self.idConta, AdicionarClick, ExcluirClick, ItemClick, RetirarClick, TamanhoClick);
    AtualizaValorTotalContaTabela := False;
    AtualizaTotalConta;
  except
    on e : exception do
      raise exception.create ('Abrindo formulario de conta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.btnVoltarClick(Sender: TObject);
var
  cancelar : boolean;
  i : integer;
  f : integer;


begin
  cancelar := False;
  try
    if (dmCaixa.Estacao.TipoEstacao = teLancamento) or (TipoVenda = tvVendaDelivery) then
      dmCaixa.ImprimePedido(idConta, idMesaCartaoSenha, '', '', '', false, True);

    if (TipoVenda = tvVendaBalcao) and (ValorTotal > 0) and (dmCaixa.Estacao.TipoEstacao <> teLancamento) then
      if MessageDlg('Deseja cancelar esta venda de balcão?', mtConfirmation, [mbNo, mbYes], 0) = IDYes then
        btnExcluirTodoPedidoClick(Self);

    Close;
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
        Close;
      end
      else
      begin
        raise;
        Close;
      end;
    end;
  end;
end;

function TfrmConta.CarregaFormularioCombo(AItem : TItem; AProduto : TProduto; Combo : boolean; AidTipoRelacionamento : integer) : boolean;
var
  i: integer;
  AidItem : integer;
  c : Char;
  s : string;
begin
  result := False;

  if AProduto.ExisteRelacionamentoObservacao then
  begin
    frmCombo := TfrmCombo.Create(Self);

    frmCombo.Produto   := AProduto;
    frmCombo.Altura    := dmCaixa.Estacao.AlturaProdutos;
    frmCombo.Distancia := 5;
    frmCombo.Tamanho   := dmCaixa.Estacao.TamanhoProdutos;
    frmCombo.AidTipoRelacionamento := AidTipoRelacionamento;

    //*** Ítem novo
    if AItem = Nil then
    begin
      frmCombo.TipoEdicao := teIncluir;
      try
        AidItem := dmCaixa.RetornaValorSequence('Vendas.ItensSequence');

        c :=FormatSettings.DecimalSeparator;
        FormatSettings.DecimalSeparator := '.';
        s := Format('insert into Vendas.Itens (idEmpresa, idCaixa, idConta, idItem, idProduto, qtde, vlProduto, AliquotaICMS, flCombo, ' +
            'idTipoRelacionamento, idGarcom, ImprimirPedido) values (%d, %d, %d, %d, %d, %f, %f, %f, 0, -1, %d, %d)',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, AidItem, AProduto.idProduto,
                                        AProduto.Qtde, AProduto.Valor, AProduto.AliquotaICMS, idGarcom, Integer(AProduto.ImprimirPedido)]);
        i := dmCaixa.dbTotalFastFood.ExecSQL(s);
        FormatSettings.DecimalSeparator := c;

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

    if AProduto.SomentePadrao then
    begin
      frmCombo.SomentePadrao := True;
      frmCombo.btnPadraoClick(Nil);
    end;

    result := frmCombo.ShowModal = mrOk;

    dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.idCaixa, Self.idConta, -1);
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

procedure TfrmConta.btnExcluirTodoPedidoClick(Sender: TObject);
var
  i : integer;
begin
  if MessageDlg('Deseja excluir todo o pedido?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then
  begin
    pnlItens.Visible := False;
    While pnlItens.ControlCount > 0 do
    begin
      TItem(pnlItens.Controls[pnlItens.ControlCount -1]).ExcluiItem(Sender, TItem(pnlItens.Controls[pnlItens.ControlCount -1]),
        False, TipoVenda, TItem(pnlItens.Controls[pnlItens.ControlCount -1]).NumeroFilhos > 0, -1);

      pnlItens.Controls[pnlItens.ControlCount -1].Free;
    end;

    pnlItens.Visible := True;

    dmCaixa.LimpaPainelItens(pnlItens);
    AtualizaValorTotalContaTabela := False;
    AtualizaTotalConta;
  end;
end;

procedure TfrmConta.btnConferenciaClick(Sender: TObject);
Var
  NomeGarconConferencia : string;
begin
  NomeGarconConferencia := '';
  if dmCaixa.Estacao.Conferencia then
  begin
    if dmCaixa.Estacao.IdentificarGarcomConferencia then
    begin
      fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
      fSelecionaPessoa.qryPessoas.ParamByName('idTipoPessoa').AsInteger := 7;
      if fSelecionaPessoa.ShowModal = IDOK then
        NomeGarconConferencia := fSelecionaPessoa.qryPessoas.FieldByName('NomeFantasia').AsString;
      FreeAndNil(fSelecionaPessoa);
    end;

    try
      dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta],
       ['Status'], [integer(msConferencia)]);
    except
      on e : exception do
        raise exception.Create('Erro atualizando status da mesa para conferência.');
    end;
    dmCaixa.TipoVenda := TipoVenda;
    dmCaixa.ImprimeConferencia(idConta, idMesaCartaoSenha, lblGarcomNome.Caption, NomeGarconConferencia, idPessoa);

    Close;
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

    DrawRounded(TPanel(pnlLinhasProdutos.Controls[i]));
  end;

  with btnMaisVendidos do
  begin
    BevelInner := bvNone;
    BevelKind  := bkNone;
    BorderStyle:= bsNone;
  end;

  with TPanel(Sender) do
  begin
    BevelInner := bvSpace;
    BevelKind  := bkTile;
    BorderStyle:= bsSingle;
  end;

  AtualizaPainelProdutos(0, TPanel(Sender).Tag, pnlProdutos, False, -1);
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

  with btnMaisVendidos do
  begin
    BevelInner := bvSpace;
    BevelKind  := bkTile;
    BorderStyle:= bsSingle;
  end;

  AtualizaPainelProdutos(0, -1, pnlProdutos, False, -1);
end;

procedure TfrmConta.btnNaoConferenciaClick(Sender: TObject);
begin
  try
    dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
     [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta],
     ['Status'], [integer(msAberta)]);
  except
    on e : exception do
      raise exception.Create('Erro atualizando status da mesa para aberta.');
  end;

  Close;
end;

procedure TfrmConta.btnPagamentoClick(Sender: TObject);
var
  i : integer;
  Nome : string;
  nroVias : integer;
  sValor : string;
  ValorValeTroco : double;
  flFinalizou : boolean;
  flImprimindoFiscal : boolean;
  ValorString : String;
  procedure ProcessaPromocaoEmDobro;
  begin
    ValorDesconto := 0;

    with qryPromocoes do
    begin
      Close;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
      ParamByName('idConta').Value   := idConta;
      Open;

      if RecordCount > 0 then
      begin
        if not Fields.Fields[0].IsNull then
          ValorDesconto := Fields.Fields[0].AsFloat;
      end;
    end;
  end;

  function FormasPagamentoOK : boolean;
  begin
    result := True;

    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;
      SQL.Text := Format ('select * from vendas.ContaPagamentos with (NOLOCK) where idEmpresa = %d and idCaixa = %d and idconta = %d and idFormaPagamento <= 0',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta]);
      Open;
      result := RecordCount = 0;
      Close;
      Free;
    end;
  end;
begin
  flImprimindoFiscal := False;
  PontosDotz := 0;
  if idMesaCartaoSenha <= 0 then
  begin
    frmMensagem.MostraMensagem('Você deve indicar uma senha.');
    if edtSenha.CanFocus then
      edtSenha.SetFocus;
  end
  else
  begin
    if TipoVenda <> tvNenhum then
    begin
      if self.ValorTotal > 0 then
      begin
        NumeroCupom  := '';
        NumeroSerieECF  := '';
        frmPagamento := TfrmPagamento.Create(Self);

        //*** Se aconteceu tudo certo então fecho a conta....
        if Not (TipoVenda in [tvVendaBalcao, tvVendaDelivery]) and dmCaixa.Estacao.TaxaServico then
          frmPagamento.ValorAPagar := Trunc((self.ValorTotal + self.ValorTotal*10/100)*100)/100
        else
          frmPagamento.ValorAPagar := self.ValorTotal;

        ProcessaPromocaoEmDobro;

        frmPagamento.ValorAPagar := StrToFloat(FormatFloat('0.00', frmPagamento.ValorAPagar - ValorDesconto));


        if (frmPagamento.ShowModal = mrOk) and
           ((frmPagamento.idConvenio > -100) or ((frmPagamento.idConvenio = -100) and (FormasPagamentoOK))) then
        begin
          if TipoVenda <> tvVendaDelivery then
            idPessoa := 0;

          if frmPagamento.idPessoa > 0 then
            idPessoa := frmPagamento.idPessoa;

          if frmPagamento.chkClienteDotz.Checked then
            PontosDotz := trunc(ValorTotal / 2);

          fBobinaECF := TfBobinaECF.Create(Self);
          fBobinaECF.Show;
          fBobinaECF.wbBobina.Navigate('about:blank');
          fBobinaECF.mmoECF.Clear;
          flFinalizou := False;
          fBobinaECF.AtualizaBobina('Iniciando transação com o banco de dados.', True);
          dmCaixa.dbTotalFastFood.StartTransaction;
          Nome := '';

          //*** Fecho a conta
          try
            fBobinaECF.AtualizaBobina('Atualizando dados da conta.', True);
            if frmPagamento.idConvenio <> -1 then
            begin
              if idPessoa > 0 then
                dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta],
                  ['DataFim', 'Valor', 'idConvenio', 'idPessoa', 'idSessaoCaixa', 'idTipoVenda',
                   'Identificacao', 'Nome', 'Endereco', 'ClienteDotz', 'PontosDotz', 'idMesaCartaoSenha'],
                  [Now, ValorTotal, frmPagamento.idConvenio, idPessoa, dmCaixa.Estacao.idSessaoCaixa,
                   Integer(TipoVenda), frmPagamento.edtDocumento.Text, frmPagamento.edtNome.Text, frmPagamento.edtEndereco.Text,
                   frmPagamento.chkClienteDotz.Checked, PontosDotz, idMesaCartaoSenha])
              else
                dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta],
                  ['DataFim', 'Valor', 'idConvenio', 'idSessaoCaixa', 'idTipoVenda',
                   'Identificacao', 'Nome', 'Endereco', 'ClienteDotz', 'PontosDotz', 'idMesaCartaoSenha'],
                  [Now, ValorTotal, frmPagamento.idConvenio, dmCaixa.Estacao.idSessaoCaixa,
                   Integer(TipoVenda), frmPagamento.edtDocumento.Text, frmPagamento.edtNome.Text, frmPagamento.edtEndereco.Text,
                   frmPagamento.chkClienteDotz.Checked, PontosDotz, idMesaCartaoSenha])
            end
            else
            begin
              with TFDQuery.Create(Self) do
              begin
                Connection := dmCaixa.dbTotalFastFood;
                SQL.Clear;
                sValor := ReplaceStr(FloatToStr(ValorTotal), ',', '.');
                SQL.Text := Format('update Vendas.Contas set DataFim = ' + QuotedStr(FormatDateTime(dmCaixa.FormatoData + ' hh:NN:ss', Now)) +
                  ', Valor = ' + sValor + ', idSessaoCaixa = %d, idConvenio = %d, idPessoa = %d, idMesaCartaoSenha = %d where idEmpresa = %d and idCaixa = %d and idConta = %d',
                  [dmCaixa.Estacao.idSessaoCaixa, frmPagamento.idConvenio, idPessoa, idMesaCartaoSenha, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta]);
                Execute;

                if RowsAffected<= 0 then
                  raise Exception.Create('Erro fechando a conta.' + sLineBreak + sql.Text);

                Free;
              end;
            end;
          except on e : exception do
            raise Exception.Create('Atualizando conta. ' + sLineBreak + e.Message);
          end;
          try
            try
              if idPessoa > 0 then
              begin
                with dmCaixa.qryAuxiliar do
                begin
                  Close;
                  SQL.Text := 'select RazaoSocial from Contabil.Pessoas WITH (NOLOCK) where idPessoa = ' +
                    IntToStr(idPessoa);

                  Open;

                  if not FieldByName('RazaoSocial').IsNull then
                    Nome := FieldByName('RazaoSocial').AsString;
                end;
              end;

              //*** Se gravou tudo então imprimo o pedido
              try
                if (Not frmPrincipal.ACBrECF1.Ativo) or (frmPagamento.idConvenio > -100) then
                begin
                  for i := 1 to dmCaixa.Estacao.NumeroViasPedidoSemFiscal do
                  begin
                    fBobinaECF.AtualizaBobina('Imprimindo pedido conferencia, via de número - ' + IntToStr(i));
                    dmCaixa.ImprimePedido(idConta, idMesaCartaoSenha, Nome, FloatToStr(frmPagamento.ValorAPagar), lblGarcomNome.Caption, True, True);
                  end;
                end;

                for i := 1 to dmCaixa.Estacao.NumeroViasPedido do
                begin
                  fBobinaECF.AtualizaBobina('Imprimindo pedido, via de número - ' + IntToStr(i), True);
                  dmCaixa.ImprimePedido(idConta, idMesaCartaoSenha, Nome, FloatToStr(frmPagamento.ValorAPagar), lblGarcomNome.Caption, False, True);
                end;
              except
                on e : exception do
                  raise Exception.Create('Erro imprimindo pedido.'+ sLineBreak + e.Message);
              end;

              if frmPrincipal.ACBrECF1.Ativo then
              begin
                if dmCaixa.Estacao.AberturaAutomaticaGaveta then
                begin
                  if frmPrincipal.ACBrECF1.Ativo then
                  begin
                    fBobinaECF.AtualizaBobina('Abrindo gaveta...', True);
                    frmPrincipal.ACBrECF1.AbreGaveta;
                  end;
                end;
                if frmPagamento.idConvenio <> -1 then
                begin
                  try
                    fBobinaECF.AtualizaBobina('Imprimindo cupom fiscal', True);
                    flImprimindoFiscal := True;
                    ImprimeCupomFiscal(Nome);
                    //*** Coloco o dados do ECF na conta
                    dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
                      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta],
                      ['NumeroCupom', 'NumeroSerieECF'], [NumeroCupom, NumeroSerieECF]);
                    flImprimindoFiscal := False;
                  except
                    on e : exception do
                      ShowMessage('Erro imprimindo cupom fiscal. ' + sLineBreak + e.Message);
                  end;
                end;
              end;

              //*** Coloco a sessao no item.
              try
                fBobinaECF.AtualizaBobina('Atualizando os dados da sessão aos ítens.', True);
                dmCaixa.Atualizar('Vendas.Itens',
                  ['idEmpresa', 'idCaixa', 'idConta'],
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta],
                  ['idSessaoCaixa'],
                  [dmCaixa.Estacao.idSessaoCaixa]);
              except
                on e : exception do
                begin
                  raise exception.Create('Inserindo sessão de caixa nos ítens.' + sLineBreak + e.Message);
                end;
              end;

              //*** Atualizo o valor vendido na sessao de caixa e do caixa, se nao for refeicao de colaborador
              if frmPagamento.idConvenio <> -1 then
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

                    ParamByName('Valor').Value := ValorTotal;
                    ParamByName('Empresa').Value := dmCaixa.Estacao.idEmpresa;
                    ParamByName('Caixa').Value := dmCaixa.Estacao.idCaixa;
                    ParamByName('SessaoCaixa').Value := dmCaixa.Estacao.idSessaoCaixa;
                    Execute;

                    if RowsAffected <= 0 then
                      raise Exception.Create('Sessão de caixa. Nenhum dado atualizado. ' + sLineBreak + SQL.Text);

                    fBobinaECF.AtualizaBobina('Atualizando os valores vendidos no caixa diário.', True);
                    SQL.Text := 'update vendas.Caixas set vlTotalVenda = ISNULL(vlTotalVenda, 0) + :Valor where (idEmpresa = :empresa) and (idCaixa = :Caixa)';
                    ParamByName('Valor').DataType := ftCurrency;
                    ParamByName('Empresa').DataType := ftInteger;
                    ParamByName('Caixa').DataType := ftInteger;

                    ParamByName('Valor').Value := ValorTotal;
                    ParamByName('Empresa').Value := dmCaixa.Estacao.idEmpresa;
                    ParamByName('Caixa').Value := dmCaixa.Estacao.idCaixa;

                    Execute;

                    if RowsAffected <= 0 then
                      raise Exception.Create('Caixa. Nenhum dado atualizado. ' + sLineBreak + SQL.Text);

                    Free
                  end;

                except on E: Exception do
                  raise Exception.Create('Atualizando valor - ' + sLineBreak + e.Message);
                end;
              end;

              //*** Imprime o vale troco
              dmCaixa.ImprimeValeTroco(idConta);

              //*** Acabou a venda, entao tento Baixar os ítens no estoque
              fBobinaECF.AtualizaBobina('Realizando baixas no estoque.', True);
              while pnlItens.ControlCount > 0 do
              begin
                if pnlItens.Controls[pnlItens.ControlCount -1] is TItem then
                  BaixaItensDoEstoque(TItem(pnlItens.Controls[pnlItens.ControlCount -1]));

                pnlItens.Controls[pnlItens.ControlCount -1].Free;
              end;

              fBobinaECF.AtualizaBobina('Marcando as atualizações como válidas.', True);

              //*** Marco as atualizações como válidas
              fBobinaECF.AtualizaBobina('Realizando commit das transações.', True);
              dmCaixa.dbTotalFastFood.Commit;

              flFinalizou := True;
            except
              on e : exception do
              begin
                fBobinaECF.AtualizaBobina('Cancelando cupom.', True);
                if flImprimindoFiscal then
                  frmPrincipal.ACBrECF1.CancelaCupom;
                fBobinaECF.AtualizaBobina('Realizando roolback.', True);
                dmCaixa.dbTotalFastFood.Rollback;
                raise Exception.Create('Erro finalizando conta.' + sLineBreak + e.Message);
              end;
            end;
          finally

            if flFinalizou then
            begin
              fBobinaECF.AtualizaBobina('Limpando painel de ítens.', True);
              dmCaixa.LimpaPainelItens(pnlItens);

              AtualizaValorTotalContaTabela := False;
              fBobinaECF.AtualizaBobina('Atualizando total da conta.', True);
              AtualizaTotalConta;
              fBobinaECF.AtualizaBobina('Conta finalizada.', True);

              if dmCaixa.Estacao.TipoEstacao = teCaixaBalcao then
              begin
                TipoVenda := tvVendaBalcao;
                fBobinaECF.AtualizaBobina('Iniciando nova conta.', True);
                NovaConta;
              end;
            end;

            FreeAndNil(fBobinaECF);
          end;
        end
        else
        begin
          if frmPagamento.ModalResult = 1 then
            frmMensagem.MostraMensagem('Forma de pagamento inválida. Tente novamente.');
        end;

        FreeAndNil(frmPagamento);

        if (flFinalizou) and (dmCaixa.Estacao.TipoEstacao <> teCaixaBalcao) then
          Close;
      end;
    end
    else
    begin
      frmMensagem.MostraMensagem('O tipo de venda deve ser diferente de "NENHUM"');
    end;
  end;
end;

procedure TfrmConta.btnTipoVendaClick(Sender: TObject);
begin
  with TfrmSelecionaTipoVenda.Create(Self) do
  begin
    if ShowModal = IDOK then
      Self.TipoVenda := TTipoVenda(TipoVenda);

    Free;
  end;
end;

procedure TfrmConta.ItemClick(Sender: TObject);
var
  AItem : TItem;
  AProduto : TProduto;
  AidTipoRelacionamento : integer;
  uAuxiliar : TUsuario;
  idUsuarioEstorno : integer;
begin
  if (dmCaixa.Estacao.Estornar) then
  begin
    idUsuarioEstorno := RetornaUsuarioEstorno;

    if idUsuarioEstorno > 0 then
    begin
      AItem := TItem(Sender);
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

procedure TfrmConta.TamanhoClick(Sender: TObject);
begin
  dmCaixa.OrdenaPainelItens(pnlItens);
end;


procedure TfrmConta.timerAtualizaItensTimer(Sender: TObject);
begin
  timerAtualizaItens.Enabled := False;
  dmCaixa.AtualizaPainelItens(pnlItens, Self.idConta, AdicionarClick, ExcluirClick, ItemClick, RetirarClick, TamanhoClick);

  AtualizaTotalConta;


  if ValorTotal <= 0 then
  begin
    //*** Verifico se existem pagamentos, e os apago.
    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;

      SQL.Clear;
      SQL.Text := Format('delete from Vendas.ContaPagamentos where idEmpresa = %d and idCaixa = %d and idConta = %d',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta]);

      Execute;

      Free;
    end;
  end;

  if pnlItens.ControlCount = 0 then
    AtualizaPainelProdutos(0, -1, pnlProdutos, False, -1);
end;

function TfrmConta.NovaConta() : integer;
var
  i : integer;
begin
  //*** Proximo pedido
  result := 0;
  idConta := 0;
  ValorTotal := 0;
  try
    if dmCaixa.dbTotalFastFood.InTransaction then
      dmCaixa.dbTotalFastFood.Commit;
  except
    on e : exception do
      raise Exception.Create('NovaConta() - Erro marcando a transação como finalizada.');
  end;

  try
    idConta := dmCaixa.RetornaValorSequence('Vendas.ContasSequence');

    if TipoVenda = tvVendaBalcao  then
    begin
      if dmCaixa.Estacao.SenhaManual then
        Self.idMesaCartaoSenha := 0
      else
        Self.idMesaCartaoSenha := RetornaNovaSenha;


      if dmCaixa.Estacao.TipoEstacao = teCaixaBalcao then
      begin
       i := dmCaixa.Inserir('Vendas.Contas',
              ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartaoSenha', 'Status'],
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, dmCaixa.Estacao.idSessaoCaixa, idConta, Integer(TipoVenda), Now, idMesaCartaoSenha, 1]);
      end
      else
      begin
        i := dmCaixa.Inserir('Vendas.Contas',
              ['idEmpresa', 'idCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartaoSenha', 'Status'],
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta, Integer(TipoVenda), Now, idMesaCartaoSenha, 1])
      end;
    end
    else
    begin
      if TipoVenda = tvVendaDelivery then
        Self.idMesaCartaoSenha := RetornaNovaSenha;

      i := dmCaixa.Inserir('Vendas.Contas',
              ['idEmpresa', 'idCaixa', 'idConta', 'idTipoVenda', 'DataInicio', 'idMesaCartaoSenha', 'Status', 'idGarcom', 'idPessoa'],
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta, Integer(TipoVenda), Now, idMesaCartaoSenha, 1, idGarcom, idPessoa]);
    end;

    if i <= 0 then
    begin
      idConta := -1;
      raise exception.Create('Erro inserindo nova conta. ');
    end
    else
    begin
      result := idConta;
      dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.idCaixa, Self.idConta, -1);
    end;
  except
    on e : exception do
      raise exception.create ('Erro abrindo nova conta. ' + e.Message);
  end;

  btnMaisVendidosClick(btnMaisVendidos);
end;


procedure TfrmConta.btnCalculadoraClick(Sender: TObject);
begin
  fCalculadora := TfCalculadora.Create(Self);
  fCalculadora.ShowModal;

  if Trim(fCalculadora.eDisplay.Text) <> '' Then
    edtQuantidade.Text := fCalculadora.eDisplay.Text;

  fCalculadora.Free;
end;

procedure TfrmConta.btnCancelarQuantidadeClick(Sender: TObject);
begin
  edtQuantidade.Text := '0';
  pnlQuantidade.Visible := False;
end;

procedure TfrmConta.ProdutoClick(Sender: TObject);
var
  ID : integer;
  TelaPrincipal : boolean;
  ProdutoAuxiliar : TProduto;
  flCancelou : boolean;
  flJaPegouQuantidade : boolean;
  QtdeDigitada : double;
begin
  flCancelou := False;
  flJaPegouQuantidade := False;
  frmPrincipal.CarregandoCombo := False;

  if (TryStrToFloat(edtQuantidade.Text, QtdeDigitada)) and (QtdeDigitada < 100) then
  begin
    try
      if Sender is TLabel then
        ProdutoAtual := TProdutoPanel(TLabel(Sender).Parent)
      else if Sender is TBevel then
        ProdutoAtual := TProdutoPanel(TBevel(Sender).Parent)
      else if sender is TProdutoPanel then
        ProdutoAtual := TProdutoPanel(Sender);

      ProdutoAtual.CancelarClique := True;

      ProdutoAuxiliar := ProdutoAtual.Produto;
      if (ProdutoAuxiliar.QuantidadeFracionada) and (not dmCaixa.Estacao.Balanca) and (ProdutoAuxiliar.LeQtdeBalanca) and (QtdeDigitada <= 0) then
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

        if (Not ProdutoAtual.Produto.ExisteRelacionamentoObservacao) then
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
              frmPrincipal.Balanca.LePeso;
              frmPrincipal.Balanca.Desativar;
            end;
          end
          else
          begin
            InsereItem(ProdutoAtual.Produto, 0, -1, -1, idGarcom );
            AtualizaVisualizacao;
          end;
        end
        else
          CarregaFormularioCombo(nil, ProdutoAtual.Produto, False, -1)
      end;

      ProdutoAtual := Nil;
    except
      on e : exception do
        raise Exception.Create('ProdutoClick - ' + sLineBreak + e.Message);
    end;
  end
  else
    frmMensagem.MostraMensagemErro('Quantidade digitada inválida. Deve ser menor que 100.' + sLineBreak + edtQuantidade.Text);
  edtQuantidade.Text := '0';
  pnlQuantidade.Visible := False;
end;


procedure TfrmConta.RetirarClick(Sender: TObject);
var
  produtoAuxiliar : TProduto;
  idUsuarioEstorno : integer;
begin
  if dmCaixa.Estacao.Estornar then
  begin
    idUsuarioEstorno := RetornaUsuarioEstorno;
    if idUsuarioEstorno > 0 then
    begin
      try
        with TItem(Sender) do
        begin
          if TipoVenda in [tvVendaBalcao, tvVendaMesa] then
          begin
            with dmCaixa.qryAuxiliar do
            begin
              Close;
              SQL.Text := Format('Select top 1 idItem, qtde from vendas.itens where idEmpresa = %d and idCaixa = %d and idConta = %d ' +
                'and idProduto = %d and flCombo = 0 order by qtde asc',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta, Produto.idProduto]);
              Open;

              if RecordCount <= 0 then
                raise Exception.Create('Não retornou nenhum ítem para retirar.');

              with TFDQuery.Create(Self) do
              begin
                Connection := dmCaixa.dbTotalFastFood;

                //*** Primeiro excluo as observacoes, se existirem
                SQL.Text := Format('delete from Vendas.ItemObservacoes where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta, dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger]);

                Execute;

                //*** Agora excluo o ítem
                SQL.Text := Format('delete from vendas.itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta, dmCaixa.qryAuxiliar.FieldByName('idItem').AsInteger]);

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
          timerAtualizaItens.Enabled := True;
        end;
      except
        on e : exception do
          raise exception.create('RetirarItemEvento - ' + sLineBreak +  e.message);
      end;
    end;
  end;
end;

function TfrmConta.RetornaNovaSenha: integer;
var
  i:integer;
  s : string;
  a : array of integer;

const
  str='1234567890';
begin
  try
    Result := 0;
    for i:=1 to dmCaixa.Estacao.QtdeDigitosSenha do
      s:=s + str[random(length(str))+1];
    i := StrToInt(s);
//    if TipoVenda = tvVendaBalcao then
    with qryNovaSenha do
    begin
      Close;
      SQL.Text := 'select * from vendas.contas';
      SQL.Text := UpperCase('select 1 from [Vendas].[Contas] where (idempresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
        ') and (idCaixa = ' + IntToStr(dmCaixa.Estacao.idCaixa) + ') and (idMesaCartaoSenha = ' + IntToStr(i) +
        ') and (DataInicio >= (GETDATE() -0.1))');
      Open;

      if (RecordCount > 0) or (i <= dmCaixa.Estacao.ValorMinimoSenha) then
        result := RetornaNovaSenha
      else
        result := i;

      Close;
    end;
  except
    on e : Exception do
      raise Exception.Create('Erro buscando nova senha.' + sLineBreak + e.Message);
  end;
end;

function TfrmConta.RetornaUsuarioEstorno: integer;
begin
  result := -1;
  if dmCaixa.Estacao.EstornarPorSenha then
  begin
    frmSenha := TfrmSenha.Create(Nil);
    //*** if = mrOK ....
    if frmSenha.ShowModal <> mrOk then
      result := -1
    else
    begin
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := Format('select 1 from Seguranca.Permissoes where idEmpresa = %d and idPessoa = %d and idControle=19 and Permitir = 1',
          [dmCaixa.Estacao.idEmpresa, frmSenha.idUsuario]);
        Open;

        if RecordCount > 0 then
          result := frmSenha.idUsuario;

        Close;
      end;
    end;

    FreeAndNil(frmSenha);
  end
  else
    result := dmCaixa.Usuario.ID;
end;

procedure TfrmConta.SetidConta(const Value: integer);
begin
  FidConta := Value;
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

procedure TfrmConta.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
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
begin
  result := -1;
  try
    if dmCaixa.Estacao.idEmpresa <= 0 then
      raise exception.Create('ID da empresa inválido [' + IntToStr(dmCaixa.Estacao.idEmpresa) + ']');

    if dmCaixa.Estacao.idCaixa <= 0 then
      raise exception.Create('ID do caixa inválido [' + IntToStr(dmCaixa.Estacao.idCaixa) + ']');

    if (dmCaixa.Estacao.TipoEstacao = teCaixaBalcao) and (dmCaixa.Estacao.idSessaoCaixa <= 0) then
      raise exception.Create('ID da sessão de caixa inválido [' + IntToStr(dmCaixa.Estacao.idSessaoCaixa) + ']');

    with dmCaixa.qryAuxiliar do
    begin
      Close;
      if dmCaixa.Estacao.TipoEstacao = teCaixaBalcao then
        SQL.Text := 'select idConta, idMesaCartaoSenha from vendas.contas where idEmpresa =  ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
                    ' and idCaixa = ' + IntToStr(dmCaixa.Estacao.idCaixa) +
                    ' and idSessaoCaixa = ' + IntToStr(dmCaixa.Estacao.idSessaoCaixa) +
                    ' and idTipoVenda = ' + IntToStr(Integer(tvVendaBalcao)) +
                    ' and datafim is null'
      else
        SQL.Text := 'select idConta, idMesaCartaoSenha from vendas.contas where idEmpresa =  ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
                    ' and idCaixa = ' + IntToStr(dmCaixa.Estacao.idCaixa) +
                    ' and idTipoVenda = ' + IntToStr(Integer(tvVendaBalcao)) +
                    ' and datafim is null';
      Open;
      if not Fields.Fields[0].IsNull then
      begin
        result := Fields.Fields[0].AsInteger;
        if not Fields.Fields[1].IsNull then
          idMesaCartaoSenha := Fields.Fields[1].AsInteger
        else
          raise Exception.Create('Não retornado a mesa ou cartão ou senha.');
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
begin
  try
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

    lblValorTotal.Caption := FormatFloat('0.00', ValorTotal);

    if AtualizaValorTotalContaTabela then
      dmCaixa.Atualizar('Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, idConta], ['Valor'],[ValorTotal]);
  except
    on e : exception do
      raise Exception.Create('Função AtualizaTotalConta.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.AtualizaVisualizacao;
begin
  edtQuantidade.Text := '0';
  pnlQuantidade.Visible := False;
  dmCaixa.AtualizaPainelItens(pnlItens, Self.idConta, AdicionarClick, ExcluirClick, ItemClick, RetirarClick, TamanhoClick);
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
      if (AItem.Controls[i] is TItem) and  (TItem(AItem.Controls[i]).Tipo <> tiObservacao) then
        dmCaixa.MovimentaEstoque(TItem(AItem.Controls[i]).Produto.idProduto,
          TItem(AItem.Controls[i]).Produto.Qtde, -1, TItem(AItem.Controls[i]).idItem, 1{Movimentacao venda}, Now);

    //*** Por fim atualizo o ítem principal
    dmCaixa.MovimentaEstoque(AItem.Produto.idProduto, AItem.Produto.Qtde, -1, AItem.idItem, 1{Movimentacao venda}, Now);
  except
    on e : exception do
      raise exception.Create('Função BaixaItensDoEstoque' + sLineBreak + e.Message);
  end;
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

  function AdicionarItem(AProduto : TProduto;  Qtde : integer; Combo : integer; Pai : variant; Relacionamento : integer) : integer;
  begin
    try
      result := dmCaixa.RetornaValorSequence('Vendas.ItensSequence');

      if pai <> null then
        dmCaixa.Inserir('Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idItem', 'idProduto', 'qtde', 'vlProduto',
                                      'AliquotaICMS', 'flCombo', 'idItemPai' , 'idTipoRelacionamento', 'idGarcom'],
                                      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, result, AProduto.idProduto,
                                      Qtde, AProduto.Valor, AProduto.AliquotaICMS, Combo, Pai, Relacionamento, idGarcom ])
      else
        dmCaixa.Inserir('Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idItem', 'idProduto', 'qtde', 'vlProduto',
                                      'AliquotaICMS', 'flCombo', 'idTipoRelacionamento', 'idGarcom'],
                                      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, result, AProduto.idProduto,
                                      Qtde, AProduto.Valor, AProduto.AliquotaICMS, Combo, Relacionamento, idGarcom ]);
    except
      on e : exception do
      begin
        result := -1;
        raise exception.Create('Função Insere Ítem. Produto - ' + AProduto.Descricao + sLineBreak + e.Message);
      end;
    end;
  end;
begin
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
              'select tr.Descricao, count(1) as Qtde from Vendas.Itens i  inner join Produtos.TiposRelacionamento tr on ' +
              'tr.idTipoRelacionamento = i.idTipoRelacionamento where idItemPai = %d and i.idTipoRelacionamento = %d ' +
              'group by tr.Descricao) ' +
              'select *, (Select NumeroMaximo from Produtos.ProdutoTiposRelacionamento ptr ' +
              'where ptr.idProduto = (select idProduto from Vendas.Itens where idItem = %d) ' +
              'and ptr.idTipoRelacionamento = %d) as NumeroMaximo from Relacionamento  ',
              [idItemPai, Produto.idTipoRelacionamento, idItemPai, Produto.idTipoRelacionamento]);
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
                  dmCaixa.Inserir('Vendas.ItemObservacoes', ['idEmpresa', 'idCaixa', 'idConta', 'idItem', 'idObservacao'],
                    [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, idPai, TItem(Controls[i]).Produto.idProduto]);
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

      timerAtualizaItens.Enabled := True;
    end;
  end;
end;



procedure TfrmConta.AtualizaPainelProdutos(const AidItem : integer; Const AIndex : integer; const AOwner : TWinControl;
    const flCombo : boolean; const AidTipoRelacionamento : Integer);
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
begin
  try
    LockWindowUpdate(Self.Handle);

    //*** Limpo todos os componentes do Aowner
    while AOwner.ControlCount > 0 do
      AOwner.Controls[0].Free;

    if AIndex = -1 then
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := 'MaisVendidos = 1';
      cdsAuxiliar.IndexFieldNames := 'idSubGrupo;Descricao';
      cdsAuxiliar.Filtered := True;
    end
    else if (AidTipoRelacionamento = -1) and (flCombo) then
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := 'idGrupo = ' + IntToStr(AIndex);
      cdsAuxiliar.IndexFieldNames := 'idSubGrupo;Descricao';
      cdsAuxiliar.Filtered := True;
    end
    else if AidTipoRelacionamento = -1 then
    begin
      cdsAuxiliar := dmCaixa.cdsviewProdutosListaPreco;
      cdsAuxiliar.Filtered := False;
      cdsAuxiliar.Filter := 'idLinha = ' + IntToStr(AIndex);
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

    with cdsAuxiliar do
    begin
      First;
      SetLength(arrayProdutos, RecordCount);

      while not eof do
      begin
        arrayProdutos[i] := TProdutoPanel.CriaProduto(AOwner,
          dmCaixa.Estacao.AlturaProdutos,
          dmCaixa.Estacao.TamanhoProdutos,
          dmCaixa.Estacao.TamanhoFonteProdutos,
          dmCaixa.Estacao.TamanhoFonteProdutos);
        with arrayProdutos[i] do
        begin
          if (AIndex <> -1) and (AidTipoRelacionamento > 0) then
            ProdutoAuxiliar.IDProduto := FieldByName('idProdutoRelacionado').AsInteger
          else
            ProdutoAuxiliar.IDProduto := FieldByName('idProduto').AsInteger;
          ProdutoAuxiliar.cdProduto := FieldByName('cdProduto').AsInteger;
          ProdutoAuxiliar.AliquotaICMS := FieldByName('AliquotaICMS').AsFloat;
          if (AidTipoRelacionamento > 0) then
            ProdutoAuxiliar.DescricaoReduzida := FieldByName('DescricaoProdutoRelacionado').AsString
          else
            ProdutoAuxiliar.DescricaoReduzida := FieldByName('Descricao').AsString;
          ProdutoAuxiliar.SomenteCombo  := FieldByName('SomenteCombo').AsBoolean;
          ProdutoAuxiliar.SomentePadrao := FieldByName('SomentePadrao').AsBoolean;

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

          ProdutoAuxiliar.ExisteRelacionamentoObservacao := FieldByName('ExisteRelacionamentosObservacoes').AsBoolean;

          Cor        := StringToColor(Trim(FieldByName('Cor').AsString));
          CorSelecionado := StringToColor(Trim(FieldByName('CorSelecionado').AsString));
          CorFonte   := StringToColor(Trim(FieldByName('CorFonte').AsString));
          CorFonteSelecionado := StringToColor(Trim(FieldByName('CorFonteSelecionado').AsString));
          CorValorFonte   := StringToColor(Trim(FieldByName('CorValorFonte').AsString));
          CorValorFonteSelecionado := StringToColor(Trim(FieldByName('CorValorFonteSelecionado').AsString));

          Selecionado := False;

          Height     := dmCaixa.Estacao.AlturaProdutos;
          Width      := dmCaixa.Estacao.TamanhoProdutos;

          Produto := ProdutoAuxiliar;

          Parent     := AOwner;

          Caption    := '';
          if (AOwner = Self.pnlProdutos) then
            OnProdutoClick := ProdutoClick
          else
            onProdutoClick := frmCombo.Clicou;
          tag        := i;
        end;

        Inc(i);
        Next;
      end;
    end;

    //*** Primeiro verifico quantos cabem na horizontal
    //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
    nroHorizontal   := Trunc(AOwner.Width / (dmCaixa.Estacao.TamanhoProdutos + 5)) - 1;

    horizontalAtual := 0;
    verticalAtual   := 0;
    MaiorOrdem      := 0;

    flNumeroOrdem := False;

//    if (AidTipoRelacionamento > 0) then
//    begin
//      with cdsAuxiliar do
//      begin
//        First;
//        While not Eof do
//        begin
//          if not FieldByName('NumeroOrdem').IsNull then
//          begin
//            flNumeroOrdem := True;
//            if MaiorOrdem < FieldByName('NumeroOrdem').AsInteger then
//              MaiorOrdem := FieldByName('NumeroOrdem').AsInteger;
//          end;
//
//          if flNumeroOrdem and FieldByName('NumeroOrdem').IsNull then
//            raise Exception.Create('Existe acompanhamento deste produto sem ordem');
//
//          Next;
//        end;
//      end;
//    end;


    for I := 0 to cdsAuxiliar.RecordCount - 1 do
    begin
      with arrayProdutos[i] do
      begin
        if horizontalAtual > nroHorizontal then
        begin
          horizontalAtual := 0;
          Inc(verticalAtual);
        end;

        Top  := verticalAtual * (dmCaixa.Estacao.AlturaProdutos + 5) + 5;
        Left := horizontalAtual * (dmCaixa.Estacao.TamanhoProdutos + 5) + 5;
      end;

      Inc(horizontalAtual);
    end;
    LockWindowUpdate(0);
  except
    on e : exception do
      raise Exception.Create('TfrmConta.AtualizaPainelProdutos' + sLineBreak + e.Message);
  end;
end;

procedure TfrmConta.ExcluirClick(Sender: TObject);
var
  c : Char;
  i : integer;
  AItem : TItem;
  s : string;
  idUsuarioEstorno : Integer;
begin
  if dmCaixa.Estacao.Estornar then
  begin
    idUsuarioEstorno := RetornaUsuarioEstorno;
    if idUsuarioEstorno > 0 then
    begin
      try
        try
          AItem := TItem(Sender);
          if ((AItem.NumeroFilhos > 0) or (AItem.Produto.QuantidadeFracionada) or
            ((AItem.Produto.ExisteRelacionamentoObservacao) and (Not (AItem.idItemPai > 0))) ) and (AItem.Tipo <> tiObservacao) then
            AItem.ExcluiItem(Sender, AItem, False, TipoVenda, AItem.NumeroFilhos > 0, idUsuarioEstorno)
          else if TItem(Sender).Tipo = tiObservacao then
            AItem.ExcluiItem(Sender, TItem(Sender), True, TipoVenda, False, idUsuarioEstorno)
          else if (AItem.idItemPai > 0) and (AItem.Produto.ParteDoCombo) then
          begin
            c := FormatSettings.DecimalSeparator;
            FormatSettings.DecimalSeparator := '.';

            //*** Retiro o combo do item pai
            s := Format('update Vendas.Itens set flCombo = 0, vlProduto = %f where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
                [TItem(AItem.Parent).Produto.ValorUnitario ,dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem]);
            i := dmCaixa.dbTotalFastFood.ExecSQL(s);

            //*** Registro os estornos
            with TFDQuery.Create(Nil) do
            begin
              Connection := dmCaixa.dbTotalFastFood;
              SQL.Text := Format('Select * from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idTipoRelacionamento in ' +
                        '(select idTipoRelacionamento from Produtos.TiposRelacionamento tp where tp.ParteDoCombo =1)',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem]);
              Open;

              while not EOF do
              begin
                AItem.RegistraEstorno(FieldByName('idItem').AsInteger, idUsuarioEstorno);

                Next;
              end;

              Free;
            end;
            //*** Agora apago todos os  relacionados do combo, se houverem
            s := Format('delete from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idTipoRelacionamento in ' +
                        '(select idTipoRelacionamento from Produtos.TiposRelacionamento tp where tp.ParteDoCombo =1)',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, frmConta.idConta, TItem(AItem.Parent).idItem]);
            i := dmCaixa.dbTotalFastFood.ExecSQL(s);
            FormatSettings.DecimalSeparator := c;
          end
          else
            AItem.ExcluiItem(Sender, AItem, True, TipoVenda, False, idUsuarioEstorno);
        except
          on e : exception do
            raise Exception.Create('ExcluirItemClique - ' + sLineBreak + e.Message);
        end;
      finally
        try
          AtualizaValorTotalContaTabela := True;

          timerAtualizaItens.Enabled:= True;
        except
          on e : exception do
            raise exception.Create('ExcluirItemClique - ' + sLineBreak + e.Message);
        end;
      end;
    end;
  end;
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
  ValorAproximadoEstadual,
  ValorAproximadoFederal,
  ValorAproximadoMunicipal : Double;

  flEmitindoReducaoZ : boolean;
begin
  try
    if not frmPrincipal.AtivarECF then
      raise Exception.Create('Não é possível fechar a conta sem comunicação com o ECF.');

    try
      EstadoECF := frmPrincipal.ACBrECF1.Estado;
      Est := Estados[frmPrincipal.ACBrECF1.Estado] ;

      try
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

      if frmPagamento.chkClienteDotz.Checked then
        frmPrincipal.ACBrECF1.AbreCupom('', '', '')
      else
        frmPrincipal.ACBrECF1.AbreCupom(frmPagamento.edtDocumento.Text, frmPagamento.edtNome.Text, frmPagamento.edtEndereco.Text)
    except
      on e : exception do
        if not flEmitindoReducaoZ then
          raise Exception.Create('Abrindo cupom fiscal - ' + e.Message);
    end;

    SetLength(NumeroCupom, 6);
    SetLength(NumeroSerieECF, 20);

    NumeroCupom := frmPrincipal.ACBrECF1.NumCupom;
    NumeroSerieECF := frmPrincipal.ACBrECF1.NumSerie;

    ValorAproximadoEstadual := 0;
    ValorAproximadoFederal := 0;
    ValorAproximadoMunicipal := 0;

    with qryCupomFiscal do
    begin
      Close;
      try
        ParamByName('Totalizado').AsBoolean := dmCaixa.Estacao.ImprimirCupomTotalizado;
        ParamByName('idEmpresa').asInteger  := dmCaixa.Estacao.idEmpresa;
        ParamByName('idCaixa').asInteger    := dmCaixa.Estacao.idCaixa;
        ParamByName('idConta').asInteger    := idConta;

        Open;
        First;
        while not eof do
        begin
          if FieldByName('AliquotaICMS').AsInteger = 0 then
            sAliquotaICMS := 'FF'
          else
            sAliquotaICMS := frmPrincipal.impressora.RightPad (IntToStr(FieldByName('AliquotaICMS').AsInteger), '0', 2);

          try
           frmPrincipal.ACBrECF1.VendeItem( FieldByName('cdProduto').AsString, Copy(FieldByName('DescricaoReduzida').AsString, 1, 20),
             sAliquotaICMS, FieldByName('qtde').AsFloat, FieldByName('vlProduto').AsFloat);
          except
            on e : exception do
            begin
              raise Exception.Create('Erro enviando item para o ECF - ' + TItem(pnlItens.Controls[i]).Produto.DescricaoReduzida + #10#13 + e.Message);
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

        Close;
      except
        on e : exception do
          raise Exception.Create('Enviando ítens ao ECF - ' + e.Message);
      end;
    end;

    try
      if ValorDesconto > 0 then
        frmPrincipal.ACBrECF1.SubtotalizaCupom( ValorDesconto * (-1), '')
      else
        frmPrincipal.ACBrECF1.SubtotalizaCupom( 0, '');
    except
      on e : exception do
        raise Exception.Create('Subtotalizando - ' + e.Message);
    end;

    try
      with TFDQuery.Create(nil) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        SQL.Text := Format('select IndiceECF, DescricaoECF, sum(vlPagamento) from viewContasPagamentos where idEmpresa = %d and idCaixa = %d and idConta = %d ' +
          'group by IndiceECF, DescricaoECF ',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.idCaixa, Self.idConta]);
        Open;

        First;

        While not Eof do
        begin
          frmPrincipal.ACBrECF1.EfetuaPagamento(fields.Fields[0].AsString, fields.Fields[2].AsCurrency,
                                             '' , False );

          Next;
        end;

        Close;
        Free;
      end;
    except
      on e : exception do
        raise Exception.Create('Enviando pagamentos ao ECF - ' + e.Message);
    end;

    cMensagem :=  dmCaixa.Estacao.ProconECF;

    if Trim(Nome) <> '' then
      cMensagem := cMensagem + #10 + 'Convenio - ' + Nome + #10;

    if frmPagamento.chkClienteDotz.Checked then
      cMensagem := cMensagem + #10 + 'Pontos DOTZ - ' + IntToStr(PontosDotz) + #10;

    sAuxiliar := '';
    case TipoVenda of
      tvVendaBalcao : begin
        cMensagem := cMensagem + #10 + 'As senhas são aleatórias.' + #10;
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
        ecfBematech : cMensagem := cMensagem + #10+ #27 + #87 + #49 + sAuxiliar + #27 + #87 + #48 + #10 + #10;
        ecfDaruma : cMensagem := cMensagem + #10+ '<e>' + sAuxiliar + '</e>' + #10 + #10;
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
      frmPrincipal.ACBrECF1.FechaCupom(cMensagem);
    except
      on e : exception do
        raise Exception.Create('Fechando cupom fiscal - ' + e.Message);
    end;
  except
    on e : exception do
      raise Exception.Create(e.Message);
  end;
end;

end.


{
  //*** Relação do combo com o produto relacionado
  0 - Pode ter um ou mais produtos deste grupo
  1 - Deve ter um produto deste grupo
  2 - Produto de relação exclusiva (só pode existir um item relacionado deste grupo para este produto)
  3 - Contem obrigatoriamente este produto
}



