unit uMesas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uClasses, Vcl.StdCtrls,Vcl.Imaging.jpeg, FireDAC.Comp.Client,
  Constantes, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TTipoComando = (tcNenhum, tcConferencia, tcFecharMesa, tcTransferenciaMesa, tcTransferenciaProduto, tcLancamento, tcConferenciaPedidos, tcReabrir, tcDespachar, tcDadosDaEntrega);

  TMesaVetor = record
    NumeroMesa : integer;
    TipoVenda : TTipoVenda;
    Valor : Double;
    Status : Integer;
  end;

  TfrmMesas = class(TForm)
    Panel1: TPanel;
    pnlMesas: TScrollBox;
    btnVendaBalcao: TPanel;
    btnTransferirMesa: TPanel;
    btnVoltar: TImage;
    tmrAtualiza: TTimer;
    btnAbrirMesa: TPanel;
    btnConferencia: TPanel;
    btnFecharMesa: TPanel;
    imgVerde: TImage;
    imgLaranja: TImage;
    imgVermelha: TImage;
    imgLogoCliente: TImage;
    btnVendaDelivery: TPanel;
    btnConferenciaPedidos: TPanel;
    btnReabrir: TPanel;
    Label1: TLabel;
    pnlEdtMesa: TPanel;
    Label2: TLabel;
    btnOKEditMesa: TPanel;
    edtMesa: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    btnObservacoes: TPanel;
    btnDespachar: TPanel;
    imgAzul: TImage;
    ImageList1: TImageList;
    imgRoxa: TImage;
    imgOuro: TImage;
    btnHistorico: TPanel;
    btnChamarSenha: TPanel;
    imgAmarelo: TImage;
    Panel2: TPanel;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    btnDadosDaEntrega: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnVendaBalcaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrAtualizaTimer(Sender: TObject);
    procedure btnAbrirMesaClick(Sender: TObject);
    procedure btnConferenciaClick(Sender: TObject);
    procedure btnFecharMesaClick(Sender: TObject);
    procedure btnTransferirMesaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVendaDeliveryClick(Sender: TObject);
    procedure btnConferenciaPedidosClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure btnReabrirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKEditMesaClick(Sender: TObject);
    procedure btnCancelarEditMesaClick(Sender: TObject);
    procedure btnDespacharClick(Sender: TObject);
    procedure btnChamarSenhaClick(Sender: TObject);
    procedure btnDadosDaEntregaClick(Sender: TObject);
  private
    { Private declarations }
    VetorMesas : array of TMesaVetor;
    FDistancia: integer;
    FTamanho: integer;
    FAltura: integer;
    FMesaOrigem,
    FMesaDestino : integer;
    FIDContaOrigem,
    FIDContaDestino : integer;
    Comando : TTipoComando;
    flCaixaFechado : boolean;
    DataDoCaixa : TDateTime;
    procedure AbrirMesa(Const AidMesa : integer; Const AidGarcom : integer; Const ANomeGarcom : string; Const VendaBalcao : Boolean);
    procedure SetDistancia(const Value: integer);
    procedure SetTamanho(const Value: integer);
    procedure EditaDadosDaEntrega(Const AIDConta : integer);
    procedure ClicouMesa(Sender : TObject);
    procedure VerificaMesasAbertas;
    procedure SetAltura(const Value: integer);
    procedure LimpaMesas;
    procedure LimpaBotoes;
    function CaixaEstaFechado : boolean;
    function TransfereMesa(Mesa : TMesa; Const AtualizarTotal : boolean) : boolean;
  public
    { Public declarations }
    function RetornaIDConta( Const AidMesa : integer) : integer;
    property Altura : integer read FAltura write SetAltura;
    property Distancia : integer read FDistancia write SetDistancia;
    property Tamanho : integer read FTamanho write SetTamanho;
  end;

var
  frmMesas: TfrmMesas;

implementation

{$R *.dfm}

uses uConta, DataModuleCaixa, uPrincipal, uCalculadora, uMensagem,
  uSelecionaPessoa, uMensagensErro, uProcuraDelivery, uPergunta, uSenha,
  uTransfereCartoes, uFuncoes, uCadastraDelivery;


procedure TfrmMesas.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMesas.ClicouMesa(Sender: TObject);
var
  NomeGarconConferencia : string;
  AidUsuario : integer;
begin
  DataDoCaixa := 0;
  AidUsuario := 0;
  flCaixaFechado := CaixaEstaFechado;
  if ((dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento) and (Not (TMesa(Sender).Status in [scConferencia, scTransferencia]))) or
    (dmCaixa.Estacao.Caixa.TipoEstacao <> teLancamento) and (Not flCaixaFechado) then
  begin
    case Comando of
      tcConferencia,
      tcConferenciaPedidos : begin
        tmrAtualiza.Enabled := False;

        if dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia then
        begin
          fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
          fSelecionaPessoa.idTipoPessoa := 7;
          if fSelecionaPessoa.ShowModal = IDOK then
          begin
            NomeGarconConferencia := fSelecionaPessoa.qryPessoas.FieldByName('NomeFantasia').AsString;
            AidUsuario := fSelecionaPessoa.qryPessoas.FieldByName('idPessoa').AsInteger;
          end;
          FreeAndNil(fSelecionaPessoa);
        end;

        if (dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia and (AidUsuario > 0)) or
           (not dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia) then
        begin
          if not dmCaixa.Estacao.ConfiguracoesDaVenda.IdentificarGarcomConferencia then
            dmCaixa.AtualizaHistoricoConta(TMesa(Sender).idConta, scConferencia, dmCaixa.Usuario.ID)
          else
            dmCaixa.AtualizaHistoricoConta(TMesa(Sender).idConta, scConferencia, AidUsuario);

          dmCaixa.AtualizaStatusConta(TMesa(Sender).idConta, scConferencia);

          dmCaixa.TipoVenda := TMesa(Sender).TipoVenda;

          ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TMesa(Sender).TipoVenda, TMesa(Sender).idConta, 0,
            TMesa(Sender).idMesa, '', '', TMesa(Sender).NomeGarcom, True, False, True, Comando = tcConferenciaPedidos, False, dmCaixa.qryDescontos);
        end;

        LimpaBotoes;
        Comando := tcNenhum;

        tmrAtualiza.Enabled := True;
      end;
      tcFecharMesa : begin
        if TMesa(Sender).ValorTotal <= 0 then
        begin
          //*** excluo a mesa aberta
          if dmCaixa.ExisteID(Format('select 1 from Vendas.ContaPagamentos where idEmpresa = %d and idCaixa = %d and idConta = %d',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta])) > 0 then
            frmMensagem.MostraMensagemErro('Existe pagamento(s) nesta conta. Exclua-o(s) primeiro.')
          else if dmCaixa.ExisteID(Format('select 1 from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d',
            [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta])) > 0 then
            frmMensagem.MostraMensagemErro('Existem ítem(ns) nesta conta. Exclua-o(s) primeiro.')
          else
          begin
            with TFDQuery.Create(Self) do
            begin
              Connection := dmCaixa.dbTotalFastFood;

              //*** Verifico se existe pedidos para esta conta, e se existir então apago.
              SQL.Text := format('delete from Vendas.Pedidos where idEmpresa = %d and idCaixa = %d and idConta = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta]);
              Execute;

              //*** Agora apago a conta em si
              SQL.Text := format('delete from Vendas.Contas where idEmpresa = %d and idCaixa = %d and idConta = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta]);
              Execute;

              if RowsAffected <= 0 then
                raise Exception.Create('Não foi possível excluir a conta.');

              Free;
            end;
          end;
        end
        else
          frmMensagem.MostraMensagemErro('Existem ítens nesta conta. Exclua-os primeiro.');
        LimpaBotoes;
        Comando := tcNenhum;
        tmrAtualiza.Enabled := False;
        tmrAtualiza.Interval := 100;
        tmrAtualiza.Enabled := True;
      end;
      tcReabrir : begin
        if dmCaixa.SenhaOK(23, AidUsuario) then
        begin
          dmCaixa.AtualizaHistoricoConta(TMesa(Sender).idConta, scReabriu, AidUsuario);
          dmCaixa.AtualizaStatusConta(TMesa(Sender).idConta, scAberta);
          LimpaBotoes;

          tmrAtualiza.Enabled := False;
          tmrAtualiza.Interval := 100;
          tmrAtualiza.Enabled := True;
        end;
      end;
      tcDespachar : begin
        fSelecionaPessoa := TfSelecionaPessoa.Create(Self);
        fSelecionaPessoa.idTipoPessoa := 8; //Entregador
        if fSelecionaPessoa.ShowModal = mrOk then
        begin
          try
            try
              Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.ContaDelivery', ['idEmpresa', 'idCaixa', 'idConta'],
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta],
                ['idPessoaDespacho', 'DataHoraDespacho'], [fSelecionaPessoa.qryPessoasidPessoa.AsInteger, Now]);

              ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TMesa(Sender).TipoVenda, TMesa(Sender).idConta, 0,
                TMesa(Sender).idMesa, '', '', TMesa(Sender).NomeGarcom, True, False, True, False, False, dmCaixa.qryDescontos);
            except
              on e : exception do
                raise exception.Create('Erro atualizando dados do despacho.' + slinebreak + e.message + sLineBreak +
                  Format('Empresa --> %d, Caixa --> %d, Conta --> %d',
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta]));
            end;
          finally
            dmCaixa.AtualizaHistoricoConta(TMesa(Sender).idConta, scDespachou, AidUsuario);
            dmCaixa.AtualizaStatusConta(TMesa(Sender).idConta, scDespachou);
          end;
        end;

        LimpaBotoes;

        tmrAtualiza.Enabled := False;
        tmrAtualiza.Interval := 100;
        tmrAtualiza.Enabled := True;
      end;

      tcDadosDaEntrega: begin
        EditaDadosDaEntrega(TMesa(Sender).idConta);
        LimpaBotoes;

        tmrAtualiza.Enabled := False;
        tmrAtualiza.Interval := 100;
        tmrAtualiza.Enabled := True;
      end;

      tcTransferenciaMesa : begin
        if FIDContaOrigem > 0 then
        begin
          tmrAtualiza.Enabled := False;
          if dmCaixa.SenhaOK(18, AidUsuario) then
          begin
            dmCaixa.AtualizaHistoricoConta(FIDContaOrigem, scTransferencia, AidUsuario);
            FIDContaDestino := TMesa(Sender).idConta;
            FMesaDestino := TMesa(Sender).idMesa;
            frmPergunta.LimpaFormulario;
            frmPergunta.lblPergunta.Caption := 'Deseja realmente transferir a mesa?';
            frmPergunta.pnlMesaOrigem.Caption :=  IntToStr(FMesaOrigem);
            frmPergunta.pnlMesaDestino.Caption :=  IntToStr(FMesaDestino);
            frmPergunta.lblMesaOrigem.Visible := True;
            frmPergunta.lblMesaDestino.Visible := True;
            frmPergunta.pnlMesaOrigem.Visible := True;
            frmPergunta.pnlMesaDestino.Visible := True;
            if frmPergunta.ShowModal = mrOk then
              TransfereMesa(TMesa(Sender), True);
          end;

          LimpaBotoes;
          tmrAtualiza.Enabled := False;
          tmrAtualiza.Interval := 100;
          tmrAtualiza.Enabled := True;
        end
        else
        begin
          FIDContaOrigem := TMesa(Sender).idConta;
          FMesaOrigem := TMesa(Sender).idMesa;
          TMesa(Sender).Status := scTransferencia;
        end;
      end;
    else
      begin
        tmrAtualiza.Enabled := False;
        if (TMesa(Sender).status = scAtendimento) and (TMesa(Sender).idGarcom <> dmCaixa.Usuario.ID) then
        begin
          with dmCaixa.qryAuxiliar do
          begin
            Close;
            SQL.Clear;
            SQL.add('select RazaoSocial from vendas.contas c');
            SQL.add('inner join Contabil.Pessoas p on c.idUsuarioAtendimento = p.idPessoa');
            SQL.add(Format('where idEmpresa = %d and idcaixa = %d and idconta = %d',
                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, TMesa(Sender).idConta]));
            Open;

            if RecordCount > 0 then
              frmMensagem.MostraMensagemErro('Esta mesa não pode ser aberta pois está em atendimento, pelo usuário(a) ' + FieldByName('RazaoSocial').AsString);

            Close;
          end;
        end
        else
        begin
          Comando := tcLancamento;
          frmConta := TfrmConta.Create(Self);
          frmConta.idMesaCartaoSenha := TMesa(Sender).idMesa;
          frmConta.idGarcom := dmCaixa.Usuario.id;
          frmConta.idPessoa := TMesa(Sender).idPessoaDelivery;
          frmConta.TipoVenda := TMesa(Sender).TipoVenda;
          dmCaixa.TipoVenda := TMesa(Sender).TipoVenda;
          frmConta.lblDataHoraAbertura.Caption := FormatDateTime('dd/MM/yy hh:NN', TMesa(Sender).DataHoraAbertura);
          frmConta.NomeGarcom := dmCaixa.Usuario.Nome;
          if TMesa(Sender).Status = scConferencia then
            frmConta.Status := scConferencia
          else
            frmConta.Status := scNenhum;
          if TMesa(Sender).idConta <= 0 then
          begin
            case TMesa(Sender).Status of
              scAberta : ;
              scConferencia : ;
              scNenhum : begin
                TMesa(Sender).idConta := frmConta.NovaConta;
                TMesa(Sender).Status := scAberta;
              end;
            end;
          end
          else
          begin
            frmConta.idConta := TMesa(Sender).idConta;
            if (TMesa(Sender).Status <> scFinalizada) and (TMesa(Sender).Status <> scDespachou) then
            begin
              frmConta.HabilitaEdicao(True);
              dmCaixa.AtualizaStatusConta(TMesa(Sender).idConta, scAtendimento);
            end;
          end;

          if TMesa(Sender).idConta <= 0 then
            raise exception.Create('Erro iniciando as vendas na mesa - ' + IntToStr(TMesa(Sender).idMesa))
          else
            frmConta.ShowModal;

          FreeAndNil(frmConta);
          LimpaBotoes;
          Comando := tcNenhum;
        end;

        tmrAtualiza.Enabled := True;
      end;
    end;
  end
  else if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else
    dmCaixa.TipoVenda := tvNenhum;
end;

procedure TfrmMesas.EditaDadosDaEntrega(const AIDConta: integer);
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('select * from Vendas.ContaDelivery where idEmpresa = %d and idCaixa = %d and idConta = %d',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, AIDConta]);
    Open;

    if RecordCount <= 0 then
      frmMensagem.MostraMensagemErro('Erro buscando dados da entrega. Contacte o suporte técnico.')
    else
    begin
      try
        fCadastraCliente := TfCadastraCliente.Create(Self);
        fCadastraCliente.edtTelefone1.Text := FieldByName('Telefone1').AsString;
        fCadastraCliente.edtTelefone2.Text := FieldByName('Telefone2').AsString;
        fCadastraCliente.edtTelefone3.Text := FieldByName('Telefone3').AsString;
        fCadastraCliente.edtNome.Text := FieldByName('nome').AsString;
        fCadastraCliente.edtEndereco.Text := FieldByName('Endereco').AsString;
        fCadastraCliente.edtCEP.Text := FieldByName('CEP').AsString;
        fCadastraCliente.edtBairro.Text := FieldByName('Bairro').AsString;
        fCadastraCliente.edtCidade.Text := FieldByName('Cidade').AsString;
        fCadastraCliente.edtUF.Text := FieldByName('UF').AsString;
        fCadastraCliente.edtNumero.Text := FieldByName('Numero').AsString;
        fCadastraCliente.edtComplemento.Text := FieldByName('Complemento').AsString;
        fCadastraCliente.edtReferencia.Text := FieldByName('Referencia').AsString;
        fCadastraCliente.edtEmail.Text := FieldByName('Email').AsString;
        fCadastraCliente.memoObservacoes.Lines.Text := FieldByName('Observacoes').AsString;
        if fCadastraCliente.ShowModal = mrOk then
        begin
          Atualizar(dmCaixa.dbTotalFastFood,'Vendas.ContaDelivery', ['idEmpresa', 'idCaixa', 'idConta'],
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, AIDConta] , ['Nome', 'Endereco',
            'Complemento', 'Bairro', 'Cidade', 'UF', 'CEP', 'Observacoes', 'Telefone1', 'Telefone2',
            'Telefone3', 'Numero', 'referencia', 'email'],
            [fCadastraCliente.edtNome.Text, fCadastraCliente.edtEndereco.Text, fCadastraCliente.edtComplemento.Text,
            fCadastraCliente.edtBairro.Text, fCadastraCliente.edtCidade.Text, fCadastraCliente.edtUF.Text,
            fCadastraCliente.edtCEP.Text, fCadastraCliente.memoObservacoes.Lines.Text, fCadastraCliente.edtTelefone1.Text,
            fCadastraCliente.edtTelefone2.Text, fCadastraCliente.edtTelefone3.Text, fCadastraCliente.edtNumero.Text,
            fCadastraCliente.edtReferencia.Text, fCadastraCliente.edtEmail.Text]);
        end;
      finally
        FreeAndNil(fCadastraCliente);
      end;
    end;
  end;

end;

function TfrmMesas.CaixaEstaFechado: boolean;
begin
  result := False;
  with dmCaixa.qryAuxiliar do
  begin
    Close;

    SQL.Text := Format('select DHAbertura from Vendas.Caixas where idEmpresa = %d and idCaixa = %d and (Not (DHFechamento is null))',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa]);
    Open;

    if RecordCount > 0 then
    begin
      if not FieldByName('DHAbertura').IsNull then
      begin
        DataDoCaixa := FieldByName('DHAbertura').AsDateTime;
        result := True;
      end
      else
        raise Exception.Create('Erro verificando se o caixa está fechado. Retornou valor NULO para a data e hora de abertura.');
    end;

    Close;
  end;
end;

procedure TfrmMesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LimpaMesas;
end;

procedure TfrmMesas.FormCreate(Sender: TObject);
begin
  try
    Comando := tcNenhum;

    BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;

    DrawRounded(btnVendaBalcao);
    DrawRounded(btnTransferirMesa);
    DrawRounded(btnAbrirMesa);
    DrawRounded(btnConferencia);
    DrawRounded(btnConferenciaPedidos);
    DrawRounded(btnReabrir);
    DrawRounded(btnFecharMesa);
    DrawRounded(btnObservacoes);
    DrawRounded(btnVendaDelivery);
    DrawRounded(btnDespachar);
    DrawRounded(btnDadosDaEntrega);
    DrawRounded(btnHistorico);
    DrawRounded(btnChamarSenha);

    Altura := 90;
    Distancia := 5;
    Tamanho := 90;

    if dmCaixa.ArquivoLogo <> '' then
      imgLogoCliente.Picture.LoadFromFile(dmCaixa.ArquivoLogo);

  except
    on e : exception do
      raise exception.create ('Criando formulario de mesas / cartões.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmMesas.FormKeyPress(Sender: TObject; var Key: Char);
Var
  i : Integer;
begin
  if key = #13 then
    btnOKEditMesaClick(Sender)
  else if key = #8 then
  begin
    if Length(edtMesa.Caption) > 1 then
      edtMesa.Caption := copy (edtMesa.Caption, 1, Length(edtMesa.Caption) -1)
    else
      edtMesa.Caption := '';
  end
  else if key in ['0'..'9'] then
  begin
    if Comando = tcTransferenciaMesa then
    begin
      frmTransfereCartoes := TfrmTransfereCartoes.Create(Self);
      frmTransfereCartoes.edtMesa.Text := key;
      if frmTransfereCartoes.ShowModal = mrOk then
      begin
        FIDContaDestino := RetornaIDConta(StrToInt(frmTransfereCartoes.ListBox1.Items[frmTransfereCartoes.ListBox1.Count -1]));
        for i  := 0 to frmTransfereCartoes.ListBox1.Count - 2 do
        begin
          FIDContaOrigem := RetornaIDConta(StrToInt(frmTransfereCartoes.ListBox1.Items[i]));
          TransfereMesa(Nil, False);
        end;

        for i := pnlMesas.ControlCount -1 downto 0  do
        begin
          if (pnlMesas.Controls[i] is TMesa) and (TMesa(pnlMesas.Controls[i]).idConta = FIDContaDestino) then
          begin
            TMesa(pnlMesas.Controls[i]).AtualizaTotalConta;
            Break;
            Comando := tcLancamento;
            ClicouMesa(TMesa(pnlMesas.Controls[i]));
          end;
        end;
      end;
      FreeAndNil(frmTransfereCartoes);
      LimpaBotoes;
    end
    else
    begin
      if not pnlEdtMesa.Visible then
      begin
        pnlEdtMesa.Visible := True;
        edtMesa.Caption := Key;
      end
      else
        edtMesa.Caption := edtMesa.Caption + Key;
    end;
  end;
end;

procedure TfrmMesas.FormShow(Sender: TObject);
begin
  VerificaMesasAbertas;
  if dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento then
  begin
    btnVendaBalcao.Visible := False;
    btnVendaDelivery.Visible := False;
    btnFecharMesa.Visible := False;
    btnConferencia.Visible := False;
    btnConferenciaPedidos.Visible := False;
    btnReabrir.Visible := False;
  end;
end;

procedure TfrmMesas.btnConferenciaPedidosClick(Sender: TObject);
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else if dmCaixa.Estacao.ConfiguracoesDaVenda.Conferencia then
  begin
    //*** Imprimir conferencia
    LimpaBotoes;
    btnConferenciaPedidos.Color := clBlue;
    Comando := tcConferenciaPedidos;
  end;
end;

procedure TfrmMesas.btnDespacharClick(Sender: TObject);
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else
  begin
    LimpaBotoes;

    Comando := tcDespachar;
    btnDespachar.Color := clBlue;
  end;
end;

procedure TfrmMesas.Label1Click(Sender: TObject);
begin
  btnConferenciaPedidosClick(Sender);
end;

procedure TfrmMesas.LimpaBotoes;
begin
  Comando := tcNenhum;
  FMesaOrigem  := 0;
  FMesaDestino := 0;
  FIDContaOrigem:= 0;
  FIDContaDestino := 0;
  btnFecharMesa.Color := $00404080;
  btnTransferirMesa.Color := $00404080;
  btnConferencia.Color := $00404080;
  btnConferenciaPedidos.Color := $00404080;
  btnReabrir.Color := $00404080;
  btnDadosDaEntrega.Color := $00404080;
  btnDespachar.Color := $00404080;
end;

procedure TfrmMesas.LimpaMesas;
var
  i : integer;
  AMesa : TMesa;
begin
  try
    for i := pnlMesas.ControlCount -1 downto 0  do
    begin
      if pnlMesas.Controls[i] is TMesa then
      begin
        AMesa := TMesa(pnlMesas.Controls[i]);
        AMesa.Parent := Nil;
        FreeAndNil(AMesa);
      end;
    end;
  except
    on e : exception do
      raise exception.create ('Limpando mesas.' + sLineBreak + e.Message);
  end;
end;

procedure TfrmMesas.btnDadosDaEntregaClick(Sender: TObject);
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else
  begin
    LimpaBotoes;

    Comando := tcDadosDaEntrega;
    btnDadosDaEntrega.Color := clBlue;
  end;
end;

function TfrmMesas.RetornaIDConta(const AidMesa: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := pnlMesas.ControlCount -1 downto 0  do
    if pnlMesas.Controls[i] is TMesa then
      if TMesa(pnlMesas.Controls[i]).idMesa = AidMesa then
        Result := TMesa(pnlMesas.Controls[i]).idConta;
end;

procedure TfrmMesas.AbrirMesa(const AidMesa: integer; Const AidGarcom : integer; Const ANomeGarcom : string; Const VendaBalcao : Boolean);
var
  StatusConta : TStatusConta;
  idAuxiliar : Integer;
begin
  idAuxiliar := AidMesa;
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select idConta, status from Vendas.Contas where idEmpresa = %d and idCaixa = %d and idMesaCartaoSenha = %d ' +
    'and (dataFim is null)', [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, idAuxiliar]);
    Open;
    if RecordCount > 0 then
    begin
      idAuxiliar := FieldByName('idConta').AsInteger;
      StatusConta := TStatusConta(FieldByName('status').AsInteger);
    end
    else
      idAuxiliar := -1;
    Close;
  end;
  if ((idAuxiliar > 0) and
      (((dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento) and (StatusConta <> scConferencia)) or
       (dmCaixa.Estacao.Caixa.TipoEstacao <> teLancamento))) or (idAuxiliar = -1)  then
  begin
    frmConta := TfrmConta.Create(Self);
    frmConta.idGarcom := AidGarcom;
    frmConta.NomeGarcom := ANomeGarcom;
    frmConta.idMesaCartaoSenha := AidMesa;

    if idAuxiliar = -1 then
    begin
      if VendaBalcao then
        frmConta.TipoVenda := tvVendaBalcao
      else
      begin
        if dmCaixa.Estacao.Caixa.TipoEstacao in [teCaixaMesa, teLancamento] then
          frmConta.TipoVenda := tvVendaMesa
        else if dmCaixa.Estacao.Caixa.TipoEstacao = teCaixaCartao then
          frmConta.TipoVenda := tvVendaCartao
        else if dmCaixa.Estacao.Caixa.TipoEstacao = teCallCenter then
          frmConta.TipoVenda := tvVendaDelivery;
      end;
      idAuxiliar := frmConta.NovaConta;
    end
    else
      frmConta.TipoVenda := tvVendaMesa;

    frmConta.lblDataHoraAbertura.Caption := FormatDateTime('dd/MM/yy hh:NN', Now);

    if idAuxiliar <= 0 then
      raise exception.Create('Abrindo mesa. Não foi informado o ID da conta.')
    else
    begin
      frmConta.idConta := idAuxiliar;
      frmConta.ShowModal;
    end;

    FreeAndNil(frmConta);
  end;

end;

procedure TfrmMesas.btnAbrirMesaClick(Sender: TObject);
var
  id : integer;
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else
  begin
    fCalculadora := TfCalculadora.Create(Self);
    fCalculadora.btnMinus.Visible := False;
    fCalculadora.btnPlus.Visible := False;
    fCalculadora.btnMultiply.Visible := False;
    fCalculadora.btnDivide.Visible := False;
    fCalculadora.btnEquals.Visible := False;
    fCalculadora.pClear.Visible := False;
    fCalculadora.btnPercent.Visible := False;
    fCalculadora.btnDecimal.Visible := False;
    fCalculadora.pnlGarcom.Visible := True;
    fCalculadora.btnEnter.Visible := True;
    fCalculadora.TipoFormulario := tfCriaMesa;
    fCalculadora.idGarcom := dmCaixa.Usuario.ID;
    fCalculadora.pnlNomeGarcom.Caption := dmCaixa.Usuario.Nome;
    if fCalculadora.ShowModal = mrOk then
    begin
      if (Trim(fCalculadora.eDisplay.Text) <> '')  and (Trim(fCalculadora.eDisplay.Text) <> '0') then
      begin
        if TryStrToInt(fCalculadora.eDisplay.Text, id) then
        begin
          if id > dmCaixa.Estacao.ConfiguracoesDaVenda.ValorMinimoSenha then
            frmMensagem.MostraMensagem('O número da mesa deve ser menor que ' + IntToStr(id))
          else
            AbrirMesa(id, fCalculadora.idGarcom, fCalculadora.pnlNomeGarcom.Caption, fCalculadora.chkBalcao.Checked);
        end
        else if Not TryStrToInt(fCalculadora.eDisplay.Text, id) then
          frmMensagem.MostraMensagemErro('Número de mesa inválido.' + sLineBreak + fCalculadora.eDisplay.Text);
      end;
    end;
    FreeAndNil(fCalculadora);
  end;
end;

procedure TfrmMesas.btnCancelarEditMesaClick(Sender: TObject);
begin
  pnlEdtMesa.Visible := False;
end;

procedure TfrmMesas.btnChamarSenhaClick(Sender: TObject);
begin
  fCalculadora := TfCalculadora.Create(Self);
  fCalculadora.TipoFormulario := tfSenha;
  if fCalculadora.ShowModal = mrOk then
    frmPrincipal.EnviarSenha(fCalculadora.eDisplay.Text);
  fCalculadora.Free;
end;

procedure TfrmMesas.btnConferenciaClick(Sender: TObject);
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else if dmCaixa.Estacao.ConfiguracoesDaVenda.Conferencia then
  begin
    //*** Imprimir conferencia
    LimpaBotoes;
    btnConferencia.Color := clBlue;
    Comando := tcConferencia;
  end;
end;

procedure TfrmMesas.btnVendaDeliveryClick(Sender: TObject);
var
  DataHoraCadastroCliente : TDateTime;
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else
  begin
    fProcuraDelivery := TfProcuraDelivery.Create(Self);
    DataHoraCadastroCliente := Now;
    if fProcuraDelivery.ShowModal = mrOK then
    begin
      frmConta := TfrmConta.Create(Self);
      frmConta.TipoVenda := tvVendaDelivery;
      frmConta.idConta := frmConta.NovaConta;
      dmCaixa.AtualizaHistoricoConta(frmConta.idConta, scCadastroCliente, dmCaixa.Usuario.ID, DataHoraCadastroCliente);
      Inserir(Self, dmCaixa.dbTotalFastFood,'Vendas.ContaDelivery', ['idEmpresa', 'idCaixa', 'idConta', 'Nome', 'Endereco',
        'Complemento', 'Bairro', 'Cidade', 'UF', 'CEP', 'Observacoes', 'Telefone1', 'Telefone2', 'Telefone3', 'Numero', 'referencia', 'email'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, frmConta.idConta, copy(fCadastraCliente.edtNome.Text, 1, 80),
        copy(fCadastraCliente.edtEndereco.Text, 1, 80), Copy(fCadastraCliente.edtComplemento.Text, 1, 80), copy(fCadastraCliente.edtBairro.Text, 1, 30),
        copy(fCadastraCliente.edtCidade.Text, 1, 30),
        fCadastraCliente.edtUF.Text, fCadastraCliente.edtCEP.Text, fCadastraCliente.memoObservacoes.Lines.Text, fCadastraCliente.edtTelefone1.Text,
        fCadastraCliente.edtTelefone2.Text, fCadastraCliente.edtTelefone3.Text, fCadastraCliente.edtNumero.Text, copy(fCadastraCliente.edtReferencia.Text, 1, 80),
        fCadastraCliente.edtEmail.Text]);

      FreeAndNil(fCadastraCliente);
      FreeAndNil(fProcuraDelivery);
      frmConta.ShowModal;
      FreeAndNil(frmConta);
    end
    else
      FreeAndNil(fProcuraDelivery);
  end;
end;

procedure TfrmMesas.btnFecharMesaClick(Sender: TObject);
begin
  try
    flCaixaFechado := CaixaEstaFechado;
  finally
    if flCaixaFechado then
    begin
      frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
    end
    else
    begin
      LimpaBotoes;

      if btnFecharMesa.Color <> clRed then
      begin
        Comando := tcFecharMesa;
        btnFecharMesa.Color := clRed;
      end;
    end;
  end;
end;

procedure TfrmMesas.btnOKEditMesaClick(Sender: TObject);
begin
  if Length(edtMesa.Caption) > 0 then
    AbrirMesa(StrToInt(edtMesa.Caption), dmCaixa.Usuario.ID, dmCaixa.Usuario.Nome, False);

  pnlEdtMesa.Visible := False;
end;

procedure TfrmMesas.btnReabrirClick(Sender: TObject);
begin
  LimpaBotoes;
  Comando := tcReabrir;
  btnReabrir.Color := clBlue;
end;

procedure TfrmMesas.btnTransferirMesaClick(Sender: TObject);
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
  begin
    frmMensagem.MostraMensagemErro('O caixa do dia ' + FormatDateTime('DD/MM/YY', DataDoCaixa) + ' está fechado. Você deve realizar novo login.');
    ModalResult := mrAbort;
  end
  else
  begin
    LimpaBotoes;

    if btnTransferirMesa.Color <> clBlue then
    begin
      Comando := tcTransferenciaMesa;
      btnTransferirMesa.Color := clBlue;
    end;
  end;
end;
procedure TfrmMesas.btnVendaBalcaoClick(Sender: TObject);
begin
  frmConta := TfrmConta.Create(Self);
  frmConta.TipoVenda := tvVendaBalcao;
  frmConta.idConta := frmConta.NovaConta;
  frmConta.ShowModal;
  FreeAndNil(frmConta);
end;

procedure TfrmMesas.SetAltura(const Value: integer);
begin
  FAltura := Value;
end;

procedure TfrmMesas.SetDistancia(const Value: integer);
begin
  FDistancia := Value;
end;

procedure TfrmMesas.SetTamanho(const Value: integer);
begin
  FTamanho := Value;
end;

procedure TfrmMesas.tmrAtualizaTimer(Sender: TObject);
begin
  tmrAtualiza.Interval := 3000;
  if FIDContaOrigem <= 0 then
    VerificaMesasAbertas;
end;

function TfrmMesas.TransfereMesa(Mesa : TMesa; Const AtualizarTotal : boolean): boolean;
begin
  result := true;

  try
    dmCaixa.dbTotalFastFood.StartTransaction;

{    //*** Primeiro transfiro as observações, se existirem
    if dmCaixa.ExisteID(Format('select idItem from Vendas.ItemObservacoes where idEmpresa = %d and idCaixa = %d and idConta = %d',
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem])) > 0 then
    begin
      if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.ItemObservacoes', ['idEmpresa', 'idCaixa', 'idConta'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem],
        ['idConta'],
        [FIDContaDestino]) <= 0 then
        raise Exception.Create('Nenhum observação foi transferida.');
    end;

    //*** Agora transfiro as observações manuais, se existirem
    if dmCaixa.ExisteID(Format('select idItem from Vendas.ItemObservacoesManuais where idEmpresa = %d and idCaixa = %d and idConta = %d',
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem])) > 0 then
    begin
      if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.ItemObservacoesManuais', ['idEmpresa', 'idCaixa', 'idConta'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem],
        ['idConta'],
        [FIDContaDestino]) <= 0 then
        raise Exception.Create('Nenhum observação manual foi transferida.');
    end;
 }
    //*** Depois transfiro os pedidos, se existirem
    if dmCaixa.ExisteID(Format('select idPedido from Vendas.Pedidos where idEmpresa = %d and idCaixa = %d and idConta = %d',
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem])) > 0 then
    begin
      if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Pedidos', ['idEmpresa', 'idCaixa', 'idConta'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem],
        ['idConta'],
        [FIDContaDestino]) <= 0 then
        raise Exception.Create('Nenhum ítem foi transferido.');
    end;

  {  //*** Depois transfiro os itens, se existirem
    if dmCaixa.ExisteID(Format('select idItem from Vendas.Itens where idEmpresa = %d and idCaixa = %d and idConta = %d',
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem])) > 0 then
    begin
      if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Itens', ['idEmpresa', 'idCaixa', 'idConta'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem],
        ['idConta', 'idMesaOrigem'],
        [FIDContaDestino, FMesaOrigem]) <= 0 then
        raise Exception.Create('Nenhum ítem foi transferido.');
    end;
   }
    //*** Depois transfiro os pagamentos, se existirem
    if dmCaixa.ExisteID(Format('select idContaPagamento from Vendas.ContaPagamentos where idEmpresa = %d and idCaixa = %d and idConta = %d',
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem])) > 0 then
    begin
      if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.ContaPagamentos', ['idEmpresa', 'idCaixa', 'idConta'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem],
        ['idConta'],
        [FIDContaDestino]) <= 0 then
        raise Exception.Create('Nenhum pagamento foi transferido.');
    end;

    //*** Atualizo os dados da mesa
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := format('select valor from Vendas.Contas where idEmpresa = %d and idCaixa = %d and idConta = %d',
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem]);
      Open;
      if FieldByName('Valor').AsFloat > 0 then
      begin
        if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Contas', ['idEmpresa', 'idCaixa', 'idConta'],
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem],
          ['Valor'],
          [FieldByName('Valor').AsFloat]) <= 0 then
          raise Exception.Create('Não foi atualizado o valor da conta.');
      end;
      Close;
    end;

    //*** Por fim encerro a conta anterior
    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;
      SQL.Text := Format('delete from Vendas.Contas where idEmpresa = %d and idCaixa = %d and idConta = %d',
       [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, FIDContaOrigem]);
      Execute;

      if RowsAffected <= 0 then
        raise Exception.Create('Erro excluindo a mesa de origem.');

      Free;
    end;

    dmCaixa.dbTotalFastFood.Commit;

    //*** Por fim atualizo o total da conta na mesa de destino
    if AtualizarTotal then
      Mesa.AtualizaTotalConta;
  except
    on e : exception do
    begin
      result := false;
      dmCaixa.dbTotalFastFood.Rollback;
      raise Exception.Create('Erro transferindo mesa' + sLineBreak + e.Message);
    end;
  end;
end;

procedure TfrmMesas.VerificaMesasAbertas;
var
  nroHorizontal,
  horizontalAtual,
  verticalAtual,
  i : integer;
  ExisteDiferencaNasMesas : boolean;
begin
  flCaixaFechado := CaixaEstaFechado;
  if flCaixaFechado then
    ModalResult := mrAbort
  else if comando = tcNenhum then
  begin
    try
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := 'select c.*, p.NomeFantasia from vendas.contas c ' +
          'left Join Contabil.Pessoas p on c.idUsuarioAtendimento = p.idPessoa ' +
          'where (idEmpresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
          ') and (idCaixa= ' + IntToStr(dmCaixa.Estacao.Caixa.idCaixa) +
          ') and (((idTipoVenda <> 4) and (DataFim is null)) or ((idTipoVenda=4) and (Status<>' + IntToStr(Integer(scFechada)) +
          '))) Order by idMesaCartaoSenha';
        Open;

        //*** Primeiro verifico quantos cabem na horizontal
        //*** Tamanho por mesa = 40 + 5 de espaço (vertical e horizontal)
        nroHorizontal   := Trunc(pnlMesas.Width / (Tamanho + Distancia)) - 1;

        horizontalAtual := 0;
        verticalAtual   := 0;

        ExisteDiferencaNasMesas := False;
        if (Length(VetorMesas) <> RecordCount) then
          ExisteDiferencaNasMesas := True
        else
        begin
          i := 0;
          while not eof do
          begin
            if (VetorMesas[i].NumeroMesa <> FieldByName('idMesaCartaoSenha').AsInteger) or
               (VetorMesas[i].TipoVenda <> TTipoVenda(FieldByName('idTipoVenda').AsInteger)) or
               (VetorMesas[i].Valor <> FieldByName('Valor').AsFloat) or
               (VetorMesas[i].Status <> FieldByName('Status').AsInteger) then
            begin
              ExisteDiferencaNasMesas := True;
              Break
            end;
            Inc(i);
            Next;
          end;
        end;

        if ExisteDiferencaNasMesas then
        begin
          pnlMesas.Visible := False;

          LimpaMesas;

          i := 0;
          SetLength(VetorMesas, 0);
          SetLength(VetorMesas, RecordCount);
          First;
          while not Eof do
          begin
            VetorMesas[i].NumeroMesa := FieldByName('idMesaCartaoSenha').AsInteger;
            VetorMesas[i].TipoVenda  := TTipoVenda(FieldByName('idTipoVenda').AsInteger);
            VetorMesas[i].Valor      := FieldByName('Valor').AsFloat;
            VetorMesas[i].Status     := FieldByName('Status').AsInteger;
            Inc(i);
            with TMesa.CriaMesa(pnlMesas, FieldByName('idConta').AsInteger, FieldByName('idMesaCartaoSenha').AsInteger, Tamanho, Altura,
              FieldByName('idUsuarioAtendimento').AsInteger, TTipoVenda(FieldByName('idTipoVenda').AsInteger), FieldByName('NomeFantasia').AsString,
              dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento) do
            begin
              onMesaClick := ClicouMesa;

              if FieldByName('Valor').AsFloat > 0 then
                ValorTotal  := FieldByName('Valor').AsFloat - FieldByName('ValorDesconto').AsFloat ;

              Status           := TStatusConta(FieldByName('Status').AsInteger);
              if TTipoVenda(FieldByName('idTipoVenda').AsInteger) = tvVendaDelivery then
                idPessoaDelivery := FieldByName('idPessoa').AsInteger
              else
                idPessoaDelivery := 0;
              DataHoraAbertura := FieldByName('DataInicio').AsDateTime;

              if horizontalAtual > nroHorizontal then
              begin
                horizontalAtual := 0;
                Inc(verticalAtual);
              end;

              Top  := verticalAtual * (Tamanho + Distancia) + Distancia;
              Left := horizontalAtual * (Tamanho + Distancia) + Distancia;
              Inc(horizontalAtual);
            end;

            Next;
          end;
        end;

        pnlMesas.Visible := True;
      end;
    except
      on e : exception do
        raise exception.create ('VerificaMesasAbertas.' + sLineBreak + e.Message);
    end;
  end;
end;

end.

