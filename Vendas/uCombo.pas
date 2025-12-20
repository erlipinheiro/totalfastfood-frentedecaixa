unit uCombo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, uClasses, System.DateUtils,
  FireDAC.Comp.Client, Constantes;

type
  TfrmCombo = class(TForm)
    pnlFundo: TPanel;
    pnlNavegacao: TPanel;
    btnFinalizar: TPanel;
    chkCombo: TCheckBox;
    pcCombo: TPageControl;
    Panel1: TPanel;
    pnlItens: TScrollBox;
    pnlTotal: TPanel;
    lblValorTotal: TLabel;
    Label1: TLabel;
    btnCancelar: TPanel;
    btnPadrao: TPanel;
    btnObservacoes: TPanel;
    btnCupom: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure chkComboClick(Sender: TObject);
    procedure btnPadraoClick(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure btnCupomClick(Sender: TObject);
    procedure pcComboDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
  private
    IndexTabSheetObservacao : integer;
    FProduto: TProduto;
    NumeroTiposRelacionamento : Integer;
    NumeroObservacoes : Integer;
    FonCloseCombo: TOnCloseCombo;
    FTipoEdicao: TTipoEdicao;
    FDistancia: integer;
    FAltura: integer;
    FTamanho: integer;
    FProdutoAlterar: TProduto;
    FAidTipoRelacionamento: Integer;

    function NaoExisteRestricoes : Boolean;
    procedure SetProduto(const Value: TProduto);
    procedure SetonCloseCombo(const Value: TOnCloseCombo);

    procedure AtualizaPainelObservacoes;
    procedure AtualizaRelacionadosObservacoes;
    procedure AtualizaTotalItem;
    procedure VerificaRelacionamentos;
    procedure MarcaSelecionados;

    procedure SetTipoEdicao(const Value: TTipoEdicao);
    function GetTiposRelacionamento(AIndex: integer): TTiposRelacionamento;
    procedure SetTiposRelacionamento(AIndex: integer;
      const Value: TTiposRelacionamento);
    procedure SetAltura(const Value: integer);
    procedure SetDistancia(const Value: integer);
    procedure SetTamanho(const Value: integer);
    procedure SetProdutoAlterar(const Value: TProduto);
    procedure SetAidTipoRelacionamento(const Value: Integer);
    function PodeSelecionarProduto(Var AProduto : TProdutoPanel): Boolean;
    { Private declarations }
  public
    { Public declarations }
    SomenteCombo : boolean;
    SomentePadrao : boolean;
    idItem : integer;
    Combo  : boolean;
    ArrayTiposRelacionamento: array of TTiposRelacionamento;

    procedure Clicou(Sender : TObject; Const QuantidadePadrao : integer = -1);
    procedure ClicouUp(Sender : TObject; Const QuantidadePadrao : integer = -1);
    procedure ClicouDown(Sender : TObject; Const QuantidadePadrao : integer = -1);
    procedure IncluiTipoRelacionamento(const ATTR : TTiposRelacionamento);

    property AidTipoRelacionamento : Integer read FAidTipoRelacionamento write SetAidTipoRelacionamento;
    property Altura : integer read FAltura write SetAltura;
    property Distancia : integer read FDistancia write SetDistancia;
    property Tamanho : integer read FTamanho write SetTamanho;

    property TiposRelacionamento[AIndex : integer] : TTiposRelacionamento read GetTiposRelacionamento write SetTiposRelacionamento;
    property onCloseCombo : TOnCloseCombo read FonCloseCombo write SetonCloseCombo;
    property Produto : TProduto read FProduto write SetProduto;
    property ProdutoAlterar : TProduto read FProdutoAlterar write SetProdutoAlterar;
    property TipoEdicao : TTipoEdicao read FTipoEdicao write SetTipoEdicao;
  end;

var
  frmCombo: TfrmCombo;

implementation

{$R *.dfm}

uses uPergunta, DataModuleCaixa, uPrincipal, uConta, uMensagem,
  uObservacoesManuais, uCupomDesconto, uFuncoes;

{ TfrmCombo }



procedure TfrmCombo.SetAidTipoRelacionamento(const Value: Integer);
begin
  FAidTipoRelacionamento := Value;
end;

procedure TfrmCombo.SetAltura(const Value: integer);
begin
  FAltura := Value;
end;

procedure TfrmCombo.SetDistancia(const Value: integer);
begin
  FDistancia := Value;
end;


procedure TfrmCombo.SetonCloseCombo(const Value: TOnCloseCombo);
begin
  FonCloseCombo := Value;
end;


procedure TfrmCombo.SetProduto(const Value: TProduto);
begin
  FProduto := Value;
end;


procedure TfrmCombo.SetProdutoAlterar(const Value: TProduto);
begin
  FProdutoAlterar := Value;
end;

procedure TfrmCombo.SetTamanho(const Value: integer);
begin
  FTamanho := Value;
end;

procedure TfrmCombo.SetTipoEdicao(const Value: TTipoEdicao);
begin
  FTipoEdicao := Value;
end;

procedure TfrmCombo.SetTiposRelacionamento(AIndex: integer;
  const Value: TTiposRelacionamento);
begin
  ArrayTiposRelacionamento[AIndex] := Value;
end;

procedure TfrmCombo.VerificaRelacionamentos;
var
  NumeroTabSheet : integer;
  TTR : TTiposRelacionamento;
  QtdeMaximaIndividual : integer;
  i : integer;
  AScrollBox : TScrollBox;
begin
  try
    NumeroTabSheet := 0;
    NumeroTiposRelacionamento := 0;
    SetLength(ArrayTiposRelacionamento, 0);
    with  TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;

      SQL.Text :=Format('select * from Produtos.ProdutoTiposRelacionamento ptr '+
                 'inner join Produtos.TiposRelacionamento tr on ptr.idTipoRelacionamento = tr.idTipoRelacionamento ' +
                 'where idProduto = %d order by NumeroOrdem', [Produto.idProduto]);
      Open;

      if RecordCount > 0 then
      begin
        while not EOF do
        begin
          if ((Combo) and (FieldByName('ParteDoCombo').AsBoolean)) or (not FieldByName('ParteDoCombo').AsBoolean) then
          begin
            with TTabSheet.Create(frmCombo.pcCombo) do
            begin
              with TTR do
              begin
                idTipoRelacionamento := FieldByName('idTipoRelacionamento').AsInteger;
                Descricao := FieldByName('Descricao').AsString;
                NumeroMinimo := FieldByName('NumeroMinimo').AsInteger;
                NumeroMaximo := FieldByName('NumeroMaximo').AsInteger;
                NumeroOrdem := FieldByName('NumeroOrdem').AsInteger;
                ParteDoCombo := FieldByName('ParteDoCombo').AsBoolean;
                FormacaoDePreco := FieldByName('FormacaoDePreco').AsBoolean;
                QtdeSelecionada := 0;
              end;
              Parent := frmCombo.pcCombo;
              frmCombo.IncluiTipoRelacionamento(TTR);
              PageIndex := NumeroTabSheet;

              BorderWidth := 0;
              Font.Name := 'Roboto';
              PageControl := pcCombo;
              Caption := TTR.Descricao;
              Width := pcCombo.Width - 8;
              Name := 'tsRelacionamento' + FieldByName('idTipoRelacionamento').AsString;

              with TScrollBox.Create(pccombo.FindComponent('tsRelacionamento' + FieldByName('idTipoRelacionamento').AsString)) do
              begin
                Parent := TTabSheet(pccombo.FindComponent('tsRelacionamento' + FieldByName('idTipoRelacionamento').AsString));
                Name := 'sb' + FieldByName('idTipoRelacionamento').AsString;
                Align := alClient;
                BorderWidth := 0;
                Width := pcCombo.Width -10;
              end;

              AScrollBox := TScrollBox((pccombo.FindComponent('tsRelacionamento' +
                FieldByName('idTipoRelacionamento').AsString)).findcomponent('sb' + FieldByName('idTipoRelacionamento').AsString));

              if FieldByName('QtdeMaximaIndividual').IsNull then
                QtdeMaximaIndividual := 0
              else
                QtdeMaximaIndividual := FieldByName('QtdeMaximaIndividual').AsInteger;
              frmConta.AtualizaPainelProdutos(idItem, Produto.idProduto, AScrollBox, False,
                TTR.idTipoRelacionamento, False, QtdeMaximaIndividual);
            end;

            Inc(NumeroTabSheet);
          end;

          Next;
        end;

        pcCombo.ActivePageIndex := NumeroTabSheet;
      end;

      Close;
      Free;
    end;
  except
    on e : exception do
      raise Exception.Create('Erro verificando relacionamentos.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmCombo.AtualizaPainelObservacoes;
var
  i               : integer;
  ProdutoAuxiliar : TProduto;
  nroHorizontal,
  horizontalAtual,
  verticalAtual   : Integer;
  TTR : TTiposRelacionamento;

begin
  try
    //*** Limpo todos os componentes do Aowner

    with dmCaixa.cdsProdutoObservacoes do
    begin
      Filtered := False;
      Filter := '(idProduto = ' + IntToStr(Produto.idProduto) + ')';
      Filtered := True;

      if RecordCount > 0 then
      begin
        with TTR do
        begin
          idTipoRelacionamento := -2;
          Descricao := 'Observacoes';
          NumeroMinimo := 0;
          NumeroMaximo := 0;
          NumeroOrdem := 100;
          ParteDoCombo := False;
          FormacaoDePreco := False;
          QtdeSelecionada := 0;
        end;
        frmCombo.IncluiTipoRelacionamento(TTR);

        IndexTabSheetObservacao := pcCombo.PageCount;

        with TTabSheet.Create(pcCombo) do
        begin
          PageIndex := IndexTabSheetObservacao;
          Font.Name := 'Roboto';
          PageControl := pcCombo;
          Caption := 'Observações';
        end;

        pcCombo.ActivePageIndex := IndexTabSheetObservacao;

        i:= 0;
        //*** Primeiro verifico quantos cabem na horizontal
        //*** Tamanho por observacao = 90 + 5 de espaço (vertical e horizontal)
        nroHorizontal   := Trunc(pcCombo.Pages[IndexTabSheetObservacao].Width / (Tamanho + Distancia)) - 1;

        horizontalAtual := 0;
        verticalAtual   := 0;

        Application.ProcessMessages;

        First;

        while not eof do
        begin
          with TProdutoPanel.CriaProduto(pcCombo.Pages[IndexTabSheetObservacao], Altura, Tamanho, 8, 10, False) do
          begin
            ProdutoAuxiliar.IDProduto := FieldByName('idObservacao').AsInteger;
            ProdutoAuxiliar.DescricaoReduzida := FieldByName('Descricao').AsString;
            ProdutoAuxiliar.Valor := 0;
            ProdutoAuxiliar.idTipoRelacionamento := -2;

            Produto := ProdutoAuxiliar;

            Parent     := pcCombo.Pages[IndexTabSheetObservacao];

            Cor        := clWhite;
            CorSelecionado := clYellow;
            CorFonte   := clBlack;
            CorFonteSelecionado := clRed;
            CorValorFonte   := clBlack;
            CorValorFonteSelecionado := clRed;
            Caption    := '';
            onProdutoClick := frmCombo.Clicou;
            onProdutoUpClick := frmCombo.ClicouUp;
            onProdutoDownClick := frmCombo.ClicouDown;
            tag        := i;
            Selecionado := False;

            if horizontalAtual > nroHorizontal then
            begin
              horizontalAtual := 0;
              Inc(verticalAtual);
            end;

            Top  := verticalAtual * (Altura + Distancia) + Distancia;
            Left := horizontalAtual * (Tamanho + Distancia) + Distancia;
            Inc(horizontalAtual);
          end;

          Inc(i);
          Next;
        end;
      end;
    end;
  except
    on e : exception do
      raise Exception.Create('TfrmConta.AtualizaPainelProdutos' + sLineBreak + e.Message);
  end;
end;

procedure TfrmCombo.AtualizaRelacionadosObservacoes;
var
  i : integer;
  Controle : TProdutoPanel;
begin
  //*** Primeiro limpo o page control
  while pcCombo.PageCount > 0 do
  begin
    while pcCombo.Pages[pcCombo.PageCount -1].ControlCount > 0 do
    begin
      if pcCombo.Pages[pcCombo.PageCount -1].Controls[pcCombo.Pages[pcCombo.PageCount -1].ControlCount - 1] is TProdutoPanel Then
      begin
        Controle := TProdutoPanel(pcCombo.Pages[pcCombo.PageCount -1].Controls[pcCombo.Pages[pcCombo.PageCount -1].ControlCount - 1]);
        Controle.Parent := Nil;
        FreeAndNil(Controle);
      end
      else if pcCombo.Pages[pcCombo.PageCount -1].Controls[pcCombo.Pages[pcCombo.PageCount -1].ControlCount - 1] is TScrollBox then
        pcCombo.Pages[pcCombo.PageCount -1].Controls[pcCombo.Pages[pcCombo.PageCount -1].ControlCount - 1].Free
      else
        raise Exception.Create('AtualizaRelacionadosObservacoes - Classe não suportada - ' +
          pcCombo.Pages[pcCombo.PageCount -1].Controls[pcCombo.Pages[pcCombo.PageCount -1].ControlCount - 1].ClassName);
    end;

    pcCombo.Pages[pcCombo.PageCount -1].Free;
  end;

  pcCombo.Visible := False;

  VerificaRelacionamentos;
  AtualizaPainelObservacoes;

  pcCombo.Visible := True;

  pcCombo.ActivePageIndex := 0;
end;

procedure TfrmCombo.AtualizaTotalItem;
var
  i, j : integer;
  ValorTotal : Double;
begin
  try
    lblValorTotal.Caption := '0,00';

    ValorTotal := 0;
    for I := 0 to pnlItens.ControlCount - 1 do
    begin
      ValorTotal := ValorTotal + (TItem(pnlItens.Controls[i]).Produto.Valor * TItem(pnlItens.Controls[i]).Produto.Qtde);

      for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
      begin
        if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
        begin
          ValorTotal := ValorTotal +
             (TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Valor *
              TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde);
        end;
      end;
    end;

    if ValorTotal > 0 then
      lblValorTotal.Caption := FloatToStr(ValorTotal);
  except
    on e : exception do
      raise Exception.Create('Erro atualizando total do ítem.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmCombo.btnCancelarClick(Sender: TObject);
var
  i : integer;
  s : string;
begin
  if TipoEdicao = teIncluir then
  begin
    //*** Primeiro apago as observacoes
    s := Format('delete from Vendas.ItemObservacoes  where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem]);
    i := dmCaixa.dbTotalFastFood.ExecSQL(s);

    //*** Agora apago os relacionados
    s := Format('delete from Vendas.Itens  where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem]);
    i := dmCaixa.dbTotalFastFood.ExecSQL(s);

    //*** Por fim apago o ítem
    s := Format('delete from Vendas.Itens  where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem]);
    i := dmCaixa.dbTotalFastFood.ExecSQL(s);
  end;

  ModalResult := mrCancel;
end;

procedure TfrmCombo.btnCupomClick(Sender: TObject);
var
  AidPromocao : integer;
  ATipoPromocao : char;
  AValorPromocao : Double;
  s : string;
  function ValidaCupomDesconto : boolean;
  begin
    result := False;
    try
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := 'select cp.*, e.NomeDaLoja from Vendas.CuponsDesconto cp left join Contabil.Empresas e on cp.idEmpresa = e.idEmpresa ' +
          'where CodigoCupom = ' + QuotedStr(UpperCase(frmCupomDesconto.edtCodigo.Text));
        Open;

        if RecordCount > 0 then
        begin
          //*** Verifico se já foi utilizado
          if FieldByName('DataUso').IsNull then
          begin
            AidPromocao := FieldByName('idPromocao').AsInteger;

            //*** Agora verifico se o produto participa deste cupom de desconto
            Close;
            SQL.Text := Format('select ValorDesconto from Produtos.ProdutoPromocoes where idProduto = %d and idPromocao = %d and ativa = 1'
              , [Produto.idProduto, AidPromocao]);
            Open;

            if RecordCount <= 0 then
              frmMensagem.MostraMensagemErro('Este cupom não pode ser utilizado com este produto.')
            else
              result := True;
          end
          else
            frmMensagem.MostraMensagemErro(format('Este cupom [%s] já foi utilizado na loja %s na data %s.',
              [UpperCase(frmCupomDesconto.edtCodigo.Text), FieldByName('NomeDaLoja').AsString, FieldByName('DataUso').AsString]));
        end
        else
          frmMensagem.MostraMensagemErro(format('Cupom não encontrado. Verifique o código digitado [%s].', [UpperCase(frmCupomDesconto.edtCodigo.Text)]));
      end;
    finally
      dmCaixa.qryAuxiliar.Close;
    end;
  end;
begin
  frmCupomDesconto := TfrmCupomDesconto.Create(Self);
  try
    frmCupomDesconto.ShowModal;
    if Trim(frmCupomDesconto.edtCodigo.Text) <> '' then
    begin
      if ValidaCupomDesconto then
      begin
        if Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ContaPromocoes', ['idempresa', 'idCaixa', 'idConta', 'idPromocao', 'idItem', 'idUsuario', 'DataHora'],
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, AidPromocao, Self.idItem, dmCaixa.Usuario.ID, Now]) > 0 then
        begin
          //*** O cupom de desconto é válido.
          if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.CuponsDesconto', ['idRedeDeNegocio', 'CodigoCupom'],
            [dmCaixa.Estacao.Dados.idRedeDeNegocio, UpperCase(frmCupomDesconto.edtCodigo.Text)],
            ['idEmpresa', 'idCaixa', 'idConta', 'idPedido', 'idItem', 'DataUso', 'idUsuario'],
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, frmConta.idPedido, Self.idItem, Now, dmCaixa.Usuario.ID]) <= 0 then
          begin
            frmMensagem.MostraMensagemErro(format('Ocorreu um erro marcando o cupom [%s] como utilizado. Desfazendo o desconto.',
              [UpperCase(frmCupomDesconto.edtCodigo.Text)]));

            if dmCaixa.dbTotalFastFood.ExecSQL(Format('delete from Vendas.ContaPromocoes  where idEmpresa = %d and idCaixa = %d and idConta = %d and idPromocao = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, AidPromocao])) <= 0 then
              raise Exception.Create('Erro excluindo promoção do cupom.');
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(frmCupomDesconto);
  end;
end;

procedure TfrmCombo.btnFinalizarClick(Sender: TObject);
begin
  if NaoExisteRestricoes then
    ModalResult := mrOk;
end;


procedure TfrmCombo.btnObservacoesClick(Sender: TObject);
var
  s : string;
begin
  frmObservacoesManuais := TfrmObservacoesManuais.Create(Self);
  with TFDQuery.Create(Self) do
  begin
    Connection := dmCaixa.dbTotalFastFood;
    SQL.Text := format('select * from Vendas.ItemObservacoesManuais where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem]);
    Open;

    if RecordCount > 0 then
    begin
      frmObservacoesManuais.edtObservacao1.Text := FieldByName('Observacao1').AsString;
      frmObservacoesManuais.edtObservacao2.Text := FieldByName('Observacao2').AsString;
    end;

    if frmObservacoesManuais.ShowModal = mrOk then
    begin
      if (Trim(frmObservacoesManuais.edtObservacao1.Text) <> '') or (Trim(frmObservacoesManuais.edtObservacao2.Text) <> '') then
      begin
        Close;
        SQL.Add('declare @idEmpresa int; ');
        SQL.Add('declare @idCaixa int; ');
        SQL.Add('declare @idConta int; ');
        SQL.Add('declare @idItem int; ');
        SQL.Add('declare @idPedido int; ');
        SQL.Add('declare @Obs1 varchar(24); ');
        SQL.Add('declare @Obs2 varchar(24); ');
        SQL.Add(' ');
        SQL.Add('set @idEmpresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa));
        SQL.Add('set @idCaixa = ' + IntToStr(dmCaixa.Estacao.Caixa.idCaixa));
        SQL.Add('set @idConta = ' + IntToStr(frmConta.idConta));
        SQL.Add('set @idPedido = ' + IntToStr(frmConta.idPedido));
        SQL.Add('set @idItem = ' + IntToStr(idItem));
        SQL.Add('set @Obs1 = ' + QuotedStr(frmObservacoesManuais.edtObservacao1.Text));
        SQL.Add('set @Obs2 = ' + QuotedStr(frmObservacoesManuais.edtObservacao2.Text));
        SQL.Add(' ');
        SQL.Add('if exists (select 1 from Vendas.ItemObservacoesManuais where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta = @idConta and idItem = @idItem) ');
        SQL.Add('  update Vendas.ItemObservacoesManuais set Observacao1 = @Obs1, Observacao2 = @Obs2 where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta = @idConta and idItem = @idItem ');
        SQL.Add('else ');
        SQL.Add('  insert into Vendas.ItemObservacoesManuais (idEmpresa, idCaixa, idConta, idPedido, idItem, Observacao1, Observacao2) values (@idEmpresa, @idCaixa, @idConta, @idPedido, @idItem, @Obs1, @Obs2)');
        ExecSQL;

//        if RowsAffected <= 0 then
//          frmMensagem.MostraMensagemErro('Não foi possível incluir as observações manuais.');
      end
      else
      begin
        Close;
        SQL.Text := format('delete from Vendas.ItemObservacoesManuais where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem]);
        ExecSQL;
      end;

      dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, nil, nil, nil, nil, nil);
    end;
  end;

end;

procedure TfrmCombo.btnPadraoClick(Sender: TObject);
var
  i, j : integer;
  AidTipoRelacionamento : integer;
  TrocouRelacionamento : boolean;
  ATabSheet : TTabSheet;
begin
  try
    TrocouRelacionamento := True;
    AidTipoRelacionamento := 0;

    if Produto.idProduto > 0 then
    begin
      with TFDQuery.Create(Self) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        SQL.Text := 'select * from Produtos.ProdutoPadroes pp ' +
          'inner join Produtos.ProdutoTiposRelacionamento ptr on pp.idProduto = ptr.idProduto and pp.idTipoRelacionamento = ptr.idTipoRelacionamento ' +
          ' where pp.idProduto = ' + IntToStr(Produto.idProduto) + ' order by ptr.NumeroOrdem asc' ;
        Open;

        if RecordCount > 0 then
        begin
          First;
          while not eof do
          begin
            if AidTipoRelacionamento <> FieldByName('idTipoRelacionamento').AsInteger then
            begin
              //*** seleciono o relacionamento corrente
              AidTipoRelacionamento := FieldByName('idTipoRelacionamento').AsInteger;
              //*** Apago tudo no relacionamento
              ATabSheet := TTabSheet((pccombo.FindComponent('tsRelacionamento' + FieldByName('idTipoRelacionamento').AsString)).findcomponent('sb' + FieldByName('idTipoRelacionamento').AsString));
              for j := 0 to ATabSheet.ControlCount -1 do
              begin
                if ATabSheet.Controls[j] is TProdutoPanel then
                begin
                  if TProdutoPanel(ATabSheet.Controls[j]).Produto.Qtde > 0 then
                  begin
                    Clicou(ATabSheet.Controls[j], FieldByName('Qtde').value);
                    TProdutoPanel(ATabSheet.Controls[j]).Selecionado := False;
                  end;
                end;
              end;
            end;

            //*** Então seleciono os produtos padrão
            for j := 0 to ATabSheet.ControlCount -1 do
            begin
              if (ATabSheet.Controls[j] is TProdutoPanel) and
                 (TProdutoPanel(ATabSheet.Controls[j]).Produto.idProduto = FieldByName('idProdutoRelacionado').AsInteger) then
              begin
                 Clicou(ATabSheet.Controls[j], FieldByName('Qtde').value);
                 TProdutoPanel(ATabSheet.Controls[j]).Selecionado := True;
              end;
            end;

            if SomentePadrao then
              ATabSheet.Enabled := False;

            next;
          end;
        end;

        Close;
        Free;
      end;
    end
    else
      frmMensagem.MostraMensagem('Você deve selecionar um prato principal primeiro.');
  except
    on e : exception do
      raise Exception.Create('Erro marcando padrões.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmCombo.chkComboClick(Sender: TObject);
var
  s : string;
  c : char;
  i : integer;
begin
  pcCombo.Visible := False;

  Combo := chkCombo.Checked;

  if Combo then
    //*** Atualizo o valor do ítem
    Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idItem'],
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem],
      ['flCombo', 'vlProduto'], [1, Produto.ValorUnitarioCombo])
  else
  begin
    //*** Atualizo o valor do ítem
    Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta', 'idItem'],
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem],
      ['flCombo', 'vlProduto'], [0, Produto.ValorUnitario]);

    //*** Agora apago todos os  relacionados do combo, se houverem
    s := Format('delete from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idTipoRelacionamento in ' +
                '(select idTipoRelacionamento from Produtos.TiposRelacionamento tp where tp.ParteDoCombo =1)',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem]);
    i := dmCaixa.dbTotalFastFood.ExecSQL(s);

  end;

  AtualizaRelacionadosObservacoes;
  dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, nil, nil, nil, nil, Nil);
  MarcaSelecionados;
  AtualizaTotalItem;

  pcCombo.Visible := True;
end;

procedure TfrmCombo.Clicou(Sender: TObject; Const QuantidadePadrao : integer = -1);
var
  AidItem : integer;
  c : char;
  s : string;
  Qtde : Double;
  ProdutoAuxiliar : TProduto;
  AProduto : TProdutoPanel;
  i, AArrayIndex : integer;
begin
  if Sender is TProdutoPanel then
    AProduto := TProdutoPanel(Sender)
  else
    AProduto := TProdutoPanel(TLabel(Sender).Parent);

  try
//    c :=FormatSettings.DecimalSeparator;
    ProdutoAuxiliar := AProduto.Produto;

    AArrayIndex := -1;
    for I := 0 to Length(ArrayTiposRelacionamento) -1 do
    begin
      if ArrayTiposRelacionamento[i].idTipoRelacionamento = AProduto.Produto.idTipoRelacionamento then
      begin
        AArrayIndex := i;
        Break
      end;
    end;

    if AArrayIndex = -1 then
      raise Exception.Create('Não foi possível localizar o array do relacionamento.');

    AProduto.Produto := ProdutoAuxiliar;

    if not AProduto.Selecionado then
    begin
      if PodeSelecionarProduto(AProduto) then
      begin
        //*** Produtos relacionados
        if (AProduto.Produto.idTipoRelacionamento > 0) then
        begin
          if QuantidadePadrao > 0 then
            ProdutoAuxiliar.Qtde := QuantidadePadrao
          else
            ProdutoAuxiliar.Qtde := 1;
          AidItem := InsereItem(Self, ProdutoAuxiliar, chkCombo.Checked, Self.idItem, frmConta.idGarcom);
        end      //*** Observações
        else if  (AProduto.Produto.idTipoRelacionamento = -2)  then
        begin
          s := Format('insert into Vendas.ItemObservacoes  (idEmpresa, idCaixa, idConta, idPedido, idItem, idObservacao) values (%d, %d, %d, %d, %d, %d)',
              [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, frmConta.idPedido, Self.idItem, AProduto.Produto.idProduto]);
          if dmCaixa.dbTotalFastFood.ExecSQL(s) <= 0 then
            raise Exception.Create('Erro inserindo observação.');
        end
        else //*** Ítem pai
          AidItem := InsereItem(Self, AProduto.Produto, chkCombo.Checked, -1, frmConta.idGarcom);

        if (AProduto.Produto.idTipoRelacionamento <> -2)  then
          Inc(ArrayTiposRelacionamento[AArrayIndex].QtdeSelecionada, Trunc(ProdutoAuxiliar.Qtde));

        //*** Verifico se atingiu o número máximo de ítens deste relacionamento, então pulo para o próximo tipo de acompanhamento, e se não
        //*** existir, eu volto a tela da conta.
        if (ArrayTiposRelacionamento[AArrayIndex].QtdeSelecionada = ArrayTiposRelacionamento[AArrayIndex].NumeroMaximo) then
        begin
          //*** É o último tabsheet, então fecho, e volto a conta.
          if ((pcCombo.ActivePageIndex + 1) = pcCombo.PageCount) then
          begin
            if ArrayTiposRelacionamento[AArrayIndex].idTipoRelacionamento <> -2 then
              ModalResult := mrOk;
          end
          else
            //*** senão, pulo para o próximo tabsheet
            pcCombo.ActivePageIndex := pcCombo.ActivePageIndex + 1;
        end;
      end;
    end
    else
    begin
      ProdutoAuxiliar.Qtde := 0;

      //*** Apago o produto
      if ProdutoAuxiliar.idTipoRelacionamento > 0 then
      begin
        s := Format('delete from Vendas.Itens  where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idTipoRelacionamento = %d and idProduto = %d',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem, ProdutoAuxiliar.idTipoRelacionamento, AProduto.Produto.idProduto]);
        AidItem := dmCaixa.dbTotalFastFood.ExecSQL(s);
      end //*** Observacoes
      else if ProdutoAuxiliar.idTipoRelacionamento = -2 then
      begin
        s := Format('delete from Vendas.ItemObservacoes  where idEmpresa = %d and idCaixa = %d and idConta = %d and idItem = %d and idObservacao = %d',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem, AProduto.Produto.idProduto]);
        AidItem := dmCaixa.dbTotalFastFood.ExecSQL(s);
      end;
      Dec(ArrayTiposRelacionamento[AArrayIndex].QtdeSelecionada);
    end;

    if Sender is TProdutoPanel then
      TProdutoPanel(Sender).Produto := ProdutoAuxiliar
    else
      TProdutoPanel(TLabel(Sender).Parent).Produto := ProdutoAuxiliar;
  except
    on e : exception do
      raise Exception.Create('Função frmCombo.Clicou' + sLineBreak + e.Message);
  end;

//  FormatSettings.DecimalSeparator := c;
  dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, nil, nil, nil, nil, nil);
  AtualizaTotalItem;
end;

procedure TfrmCombo.ClicouDown(Sender: TObject; Const QuantidadePadrao : integer = -1);
var
  ProdutoAuxiliar : TProduto;
  s : string;
  i,
  AArrayIndex : integer;
begin
  ProdutoAuxiliar := TProdutoPanel(Sender).Produto;

  AArrayIndex := -1;
  for I := 0 to Length(ArrayTiposRelacionamento) -1 do
  begin
    if ArrayTiposRelacionamento[i].idTipoRelacionamento = ProdutoAuxiliar.idTipoRelacionamento then
    begin
      AArrayIndex := i;
      Break
    end;
  end;

  if AArrayIndex = -1 then
    raise Exception.Create('Não foi possível localizar o array do relacionamento.');

  if ProdutoAuxiliar.idTipoRelacionamento > 0 then
  begin
    //*** Apago o produto
    if ProdutoAuxiliar.Qtde = 0 then
    begin
      s := Format('delete from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idProduto = %d',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem, ProdutoAuxiliar.idProduto]);
      if dmCaixa.dbTotalFastFood.ExecSQL(s) <= 0 then
        raise Exception.Create('Erro apagando ítem da conta.');
    end
    else
    //*** Diminuo a qtde
    begin
      s := Format('update Vendas.Itens set qtde = %d where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idProduto = %d',
          [Trunc(ProdutoAuxiliar.Qtde), dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem, ProdutoAuxiliar.idProduto]);
      if dmCaixa.dbTotalFastFood.ExecSQL(s) <= 0 then
        raise Exception.Create('Erro excluindo um produto deste ítem da conta. IDconta = ' + frmConta.idConta.ToString + ', idItem = ' + idItem.ToString + ', idProduto = ' +
          ProdutoAuxiliar.idProduto.ToString);
    end;
  end;

  Dec(ArrayTiposRelacionamento[AArrayIndex].QtdeSelecionada);

  TProdutoPanel(Sender).Produto := ProdutoAuxiliar;

  TProdutoPanel(Sender).Selecionado := TProdutoPanel(Sender).Produto.Qtde > 0;


  dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, nil, nil, nil, nil, nil);
  AtualizaTotalItem;
end;

procedure TfrmCombo.ClicouUp(Sender: TObject; Const QuantidadePadrao : integer = -1);
var
  ProdutoAuxiliar : TProduto;
  s : string;
  i,
  AArrayIndex : integer;
begin
  ProdutoAuxiliar := TProdutoPanel(Sender).Produto;

  AArrayIndex := -1;
  for I := 0 to Length(ArrayTiposRelacionamento) -1 do
  begin
    if ArrayTiposRelacionamento[i].idTipoRelacionamento = ProdutoAuxiliar.idTipoRelacionamento then
    begin
      AArrayIndex := i;
      Break
    end;
  end;

  if AArrayIndex = -1 then
    raise Exception.Create('Não foi possível localizar o array do relacionamento.');

  if PodeSelecionarProduto(TProdutoPanel(Sender)) then
  begin
    if ProdutoAuxiliar.idTipoRelacionamento > 0 then
    begin
      //*** Apago o produto
      if ProdutoAuxiliar.Qtde = 1 then
        i := InsereItem(Self, ProdutoAuxiliar, chkCombo.Checked, Self.idItem, frmConta.idGarcom)
      else
      //*** Aumento a qtde
      begin
        s := Format('update Vendas.Itens set qtde = %d where idEmpresa = %d and idCaixa = %d and idConta = %d and idItemPai = %d and idProduto = %d',
            [Trunc(ProdutoAuxiliar.Qtde), dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem, ProdutoAuxiliar.idProduto]);
        if dmCaixa.dbTotalFastFood.ExecSQL(s) <= 0 then
          raise Exception.Create('Erro adicionando um produto deste ítem da conta. IDconta = ' + frmConta.idConta.ToString + ', idItem = ' + idItem.ToString + ', idProduto = ' +
            ProdutoAuxiliar.idProduto.ToString);
      end;
    end;

    Inc(ArrayTiposRelacionamento[AArrayIndex].QtdeSelecionada);

    //*** Verifico se atingiu o número máximo de ítens deste relacionamento, então pulo para o próximo tipo de acompanhamento, e se não
    //*** existir, eu volto a tela da conta.
    if (ArrayTiposRelacionamento[AArrayIndex].QtdeSelecionada = ArrayTiposRelacionamento[AArrayIndex].NumeroMaximo) then
    begin
      //*** É o último tabsheet, então fecho, e volto a conta.
      if ((pcCombo.ActivePageIndex + 1) = pcCombo.PageCount) then
      begin
        if ArrayTiposRelacionamento[AArrayIndex].idTipoRelacionamento <> -2 then
          ModalResult := mrOk;
      end
      else
        //*** senão, pulo para o próximo tabsheet
        pcCombo.ActivePageIndex := pcCombo.ActivePageIndex + 1;
    end;

    TProdutoPanel(Sender).Produto := ProdutoAuxiliar;
    dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, nil, nil, nil, nil, nil);
    AtualizaTotalItem;
  end
  else
  begin
    ProdutoAuxiliar.Qtde := ProdutoAuxiliar.Qtde -1;
    TProdutoPanel(Sender).Produto := ProdutoAuxiliar;
  end;

  TProdutoPanel(Sender).Selecionado := TProdutoPanel(Sender).Produto.Qtde > 0;
end;

procedure TfrmCombo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (ModalResult = mrOK) then
  begin
    if NaoExisteRestricoes = False then
      CanClose := False;
  end;
end;

procedure TfrmCombo.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  IndexTabSheetObservacao := -1;
  idItem := -1;
  SomenteCombo := False;
  SomentePadrao := False;
  DrawRounded(btnCancelar);
  DrawRounded(btnFinalizar);
  DrawRounded(btnPadrao);
  DrawRounded(btnObservacoes);
  DrawRounded(btnCupom);
  AidTipoRelacionamento := -1;
end;

procedure TfrmCombo.FormShow(Sender: TObject);
var
  i : integer;
begin
  pcCombo.Visible := False;

  with TFDQuery.Create(Self) do
  begin
    Connection := dmCaixa.dbTotalFastFood;
    SQL.Text := 'select 1 from Produtos.ProdutoPadroes where idProduto = ' + IntToStr(Produto.idProduto);
    Open;

    btnPadrao.Visible := RecordCount > 0;
    Close;
    Free;
  end;

  dmCaixa.AtualizaQueryItens(dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, idItem);
  dmCaixa.AtualizaPainelItens(pnlItens, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, nil, nil, nil, nil, nil);

  btnCupom.Visible := dmCaixa.cdsProdutoPromocoes.Locate('idProduto', Produto.idProduto, []);

  AtualizaRelacionadosObservacoes;

  if SomenteCombo then
  begin
    chkCombo.Enabled := False;
    chkCombo.Checked := True;
    chkComboClick(Sender);
  end
  else
  begin
    MarcaSelecionados;

    AtualizaTotalItem;
  end;

  if TipoEdicao = teIncluir then
  begin
    if Produto.SomentePadrao or Produto.ForcarPadrao then
    begin
      SomentePadrao := Produto.SomentePadrao;
      btnPadraoClick(Nil);
    end;
  end;


  if AidTipoRelacionamento > -1 then
  begin
    for i := 0  to NumeroTiposRelacionamento -1 do
    begin
      if ArrayTiposRelacionamento[i].idTipoRelacionamento = AidTipoRelacionamento then
      begin
        pcCombo.ActivePageIndex := i;
        Break;
      end;
    end;
  end;

  pcCombo.Visible := True;
end;


function TfrmCombo.GetTiposRelacionamento(
  AIndex: integer): TTiposRelacionamento;
begin
  Result := ArrayTiposRelacionamento[AIndex];
end;


procedure TfrmCombo.IncluiTipoRelacionamento(const ATTR: TTiposRelacionamento);
begin
  Inc(NumeroTiposRelacionamento);
  SetLength(ArrayTiposRelacionamento, Length(ArrayTiposRelacionamento) + 1);
  SetTiposRelacionamento(Length(ArrayTiposRelacionamento) - 1, ATTR);
end;

procedure TfrmCombo.MarcaSelecionados;
var
  i, j, k : integer;
  ATabSheet : TTabSheet;
  AScrollBox : TScrollBox;
  indexTabSheet : integer;
  AProduto : TProduto;
begin
  try
    for I := 0 to pnlItens.ControlCount - 1 do
    begin
      if TItem(pnlItens.Controls[i]).Produto.idProduto = Produto.idProduto then
      begin
        for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
        begin
          if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
          begin
            with TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto do
            begin
              if (idTipoRelacionamento <> -2) and (idTipoRelacionamento <> -3) then
              begin
                AScrollBox := TScrollBox((pccombo.FindComponent('tsRelacionamento' + IntToStr(idTipoRelacionamento))).findcomponent('sb' + IntToStr(idTipoRelacionamento)));
                ATabSheet := TTabSheet(pccombo.FindComponent('tsRelacionamento' + IntToStr(idTipoRelacionamento)));
              end
              else if idTipoRelacionamento = -2 then
              begin
                AScrollBox := TScrollBox(pccombo.Pages[pcCombo.PageCount - 1]);
                ATabSheet := pccombo.Pages[pcCombo.PageCount - 1];
              end;
              if AScrollBox <> nil then
              begin
                for k := 0 to AScrollBox.ControlCount -1 do
                begin
                  if AScrollBox.Controls[k] is TProdutoPanel then
                  begin
                    if TProdutoPanel(AScrollBox.Controls[k]).Produto.idProduto = idProduto then
                    begin
                      TProdutoPanel(AScrollBox.Controls[k]).Selecionado := True;
                      indexTabSheet := ATabSheet.PageIndex;
                      Aproduto := TProdutoPanel(AScrollBox.Controls[k]).Produto;
                      AProduto.Qtde := Qtde;
                      TProdutoPanel(AScrollBox.Controls[k]).Produto := AProduto;
                      Inc(ArrayTiposRelacionamento[indexTabSheet].QtdeSelecionada, Trunc(TProdutoPanel(AScrollBox.Controls[k]).Produto.Qtde));
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;

        Break;
      end;
    end;
  except
    on e : exception do
      raise Exception.Create('Erro marcando selecionados.' + sLineBreak + e.Message);
  end;
end;

function TfrmCombo.NaoExisteRestricoes: Boolean;
var
  i : integer;
  j : integer;
  Qtde : integer;
begin
  result := True;

  for i := 0  to NumeroTiposRelacionamento -1 do
  begin
    Qtde := 0;
    //*** Primeiro verifico se tem o número mínimo
    if (ArrayTiposRelacionamento[i].NumeroMinimo > 0) or (ArrayTiposRelacionamento[i].NumeroMaximo > 0) then
    begin

      for j := 0  to TTabSheet(pcCombo.Pages[i].Controls[0]).ControlCount -1 do
      begin
        if TTabSheet(pcCombo.Pages[i].Controls[0]).Controls[j] is TProdutoPanel then
          if TProdutoPanel(TTabSheet(pcCombo.Pages[i].Controls[0]).Controls[j]).Produto.Qtde > 0 then
            Inc(Qtde, Trunc(TProdutoPanel(TTabSheet(pcCombo.Pages[i].Controls[0]).Controls[j]).Produto.Qtde));
      end;

      if (ArrayTiposRelacionamento[i].NumeroMinimo > 0) and (Qtde < ArrayTiposRelacionamento[i].NumeroMinimo) then
      begin
        Result := False;
        if (ArrayTiposRelacionamento[i].NumeroMinimo = 1) then
          frmMensagem.MostraMensagem('O grupo de [' + UpperCase(ArrayTiposRelacionamento[i].Descricao) + '] deve conter pelo menos um ítem.')
        else
          frmMensagem.MostraMensagem(Format('O grupo de [' + UpperCase(ArrayTiposRelacionamento[i].Descricao) + '] deve conter pelo menos %d ítens.',
            [ArrayTiposRelacionamento[i].NumeroMinimo]));
        pcCombo.ActivePageIndex := i;
        Break;
      end else if (ArrayTiposRelacionamento[i].NumeroMaximo > 0) and (Qtde > ArrayTiposRelacionamento[i].NumeroMaximo) then
      begin
        result := False;
        if (ArrayTiposRelacionamento[i].NumeroMaximo = 1) then
          frmMensagem.MostraMensagem('O grupo de [' + UpperCase(ArrayTiposRelacionamento[i].Descricao) + '] pode conter no máximo um ítem.')
        else
          frmMensagem.MostraMensagem(Format('O grupo de [' + UpperCase(ArrayTiposRelacionamento[i].Descricao) + '] pode conter no máximo %d ítens.',
            [ArrayTiposRelacionamento[i].NumeroMaximo]));
        pcCombo.ActivePageIndex := i;
        Break;
      end;
    end;
  end;
end;

procedure TfrmCombo.pcComboDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Brush.Color := clBlack;
  end
  else
  begin
    Control.Canvas.Font.Color := clWindowText;
    Control.Canvas.Brush.Color := clBtnFace;
  end;

  Control.Canvas.Font.Size := 9;
  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(pcCombo.Pages[TabIndex]).Caption);
end;

function TfrmCombo.PodeSelecionarProduto(var AProduto : TProdutoPanel): Boolean;
begin
  result := True;
  //*** Primeiro verifico as restriçoes do relacionado, se existirem
  if pcCombo.ActivePageIndex <= NumeroTiposRelacionamento -1 then
  begin
    if (ArrayTiposRelacionamento[pcCombo.ActivePageIndex].NumeroMaximo > 0) and
       (ArrayTiposRelacionamento[pcCombo.ActivePageIndex].QtdeSelecionada  = ArrayTiposRelacionamento[pcCombo.ActivePageIndex].NumeroMaximo) then
    begin
      frmMensagem.MostraMensagem(Format('O grupo de [' + UpperCase(ArrayTiposRelacionamento[pcCombo.ActivePageIndex].Descricao) +
        '] já atingiu a quantidade máxima de ítens possíveis, [%d] ítens. Para selecionar outro produto deste grupo, desmarque outro primeiro.',
        [ArrayTiposRelacionamento[pcCombo.ActivePageIndex].NumeroMaximo]));
      Aproduto.CancelarClique := True;
      Result := False;
    end;
  end;
end;

end.

