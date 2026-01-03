unit uPrincipal;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VCL.Graphics, System.Types,
  Winapi.Windows, Winapi.ShellAPI, Winapi.messages,
  VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.ExtCtrls, VCL.StdCtrls, VCL.ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, System.Win.Registry,
  Data.DB, VCL.Printers, System.DateUtils, System.StrUtils, ACBrDeviceSerial,
  ACBrBase, ACBrBAL, Vcl.AppEvnts, FireDAC.Stan.Intf, ACBrDevice,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, ACBrECF, ACBrSocket,
  uMensagensErro, System.Inifiles, ACBrIBPTax,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  ACBrPosPrinter, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS, ACBrDFe,
  ACBrNFe, IdExceptionCore, ACBrValidador, System.UITypes,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    btnAbrirCaixa: TPanel;
    btnFecharCaixa: TPanel;
    btnFecharSessaoCaixa: TPanel;
    btnAbrirSessaoCaixa: TPanel;
    btnVender: TPanel;
    btnFechar: TPanel;
    grpCaixa: TGroupBox;
    grpSessãoCaixa: TGroupBox;
    lblDataCaixa: TLabel;
    lblUsuarioCaixa: TLabel;
    lblDataSessaoCaixa: TLabel;
    lblUsuarioSessaoCaixa: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtTipoEstacao: TEdit;
    edtNomeEstacao: TEdit;
    edtListaPreco: TEdit;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    Label6: TLabel;
    edtCNPJ: TEdit;
    qryApuracao: TFDQuery;
    Label5: TLabel;
    edtEstadoECF: TEdit;
    btnSangria: TPanel;
    IdSMTP1: TIdSMTP;
    pnlLogos: TPanel;
    Image1: TImage;
    Label1: TLabel;
    pnlCentral: TPanel;
    Impressora: TACBrPosPrinter;
    Label7: TLabel;
    edtVersao: TEdit;
    Balanca: TACBrBAL;
    ACBrECF1: TACBrECF;
    tcpclienteSenha: TIdTCPClient;
    btnGerenciarNFCes: TPanel;
    btnBaixarPedidos: TPanel;
    ACBrValidador1: TACBrValidador;
    btnAbrirGaveta: TPanel;
    btnReimprimirCaixa: TPanel;
    btnReimprimirTurno: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAbrirCaixaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVenderClick(Sender: TObject);
    procedure BalancaLePeso(Peso: Double; Resposta: AnsiString);
    procedure FormShow(Sender: TObject);
    procedure btnFecharSessaoCaixaClick(Sender: TObject);
    procedure btnAbrirSessaoCaixaClick(Sender: TObject);
    procedure btnFecharCaixaClick(Sender: TObject);
    procedure btnSangriaClick(Sender: TObject);
    procedure ACBrECF1ChangeEstado(const EstadoAnterior,
      EstadoAtual: TACBrECFEstado);
    procedure ACBrECF1MsgAguarde(const Mensagem: string);
    procedure ACBrECF1BobinaAdicionaLinhas(const Linhas, Operacao: string);
    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ACBrECF1AntesSubtotalizaCupom(const DescontoAcrescimo: Double;
      const MensagemRodape: AnsiString);
    procedure btnBaixarPedidosClick(Sender: TObject);
    procedure btnGerenciarNFCesClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure btnAbrirGavetaClick(Sender: TObject);
    procedure btnReimprimirCaixaClick(Sender: TObject);
    procedure btnReimprimirTurnoClick(Sender: TObject);
  private
    FVersaoExe: string;
    { Private declarations }
    procedure HandleParameter(const param: string);
//    procedure WMCopyData(var msg: TWMCopyData); message WM_COPYDATA;
    procedure SetVersaoExe(const Value: string);
    procedure VerificaSituacaoNFE;
  public
    { Public declarations }
    ContadorErrosBalanca : integer;
    iRetorno : integer;
    iACK, iST1, iST2, iST3 : integer;
    IPServidorTCP : string;
    PortaServidorTCP : integer;
    ProgramaInicializado : boolean;
    CarregandoCombo : boolean;
    function  AtivarECF(Const ABuscarECF : boolean = False) : boolean;
    procedure AtualizaBotoes;
    procedure EnviarSenha(const ASenha: string);
//    procedure ClientConnect(const AClient: TClientRecord);
//    procedure ClientDisconnect(const AClient: TClientRecord);
//    procedure ClientMessage(const AClient: TClientRecord; const AMessage: string);
    function  ConectaAoServidorTCP: boolean;
    Procedure SetEnvironmentVariableValue(const VarName, VarValue: string);
    Procedure ImprimirUltimoPedido;
//    procedure ServerStatus(const AServer: TClientRecord; const AStatus : TStatus; const AMensagem : string; const ADataHoraServidor: TDateTime);
    property VersaoExe : string read FVersaoExe write SetVersaoExe;
  end;

var
  frmPrincipal: TfrmPrincipal;
//  ClientThread1: TClientThread;
  // user name & ID
//  ClientData1: TClient;

Const
  Estados : array[TACBrECFEstado] of string =
    ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda',
    'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X', 'Nao Fiscal' );Implementation

{$R *.dfm}

uses
  uSPlash, uMensagem, uPergunta, DataModuleCaixa, uClasses,
  uConta, uMesas, uSessaoCaixaApuracao,
  uSenha, uAberturaSessaoCaixa, uSangria,
  uFechamentoCaixa, frmBobinaECF,
  Constantes, uFuncoes, ACBrECFEscECF, uBaixarPedidos, uUnicaInstancia,
  uGerenciaNFCes, uGerarNFE, uSelecionaCaixa;

procedure TfrmPrincipal.ACBrECF1AntesSubtotalizaCupom(
  const DescontoAcrescimo: Double; const MensagemRodape: AnsiString);
var
  Informacao : TACBrInformacao;
begin
  if ACBrECF1.ECF is TACBrECFEscECF then
  begin
    Informacao := ACBrECF1.RespostasComando.FindFieldByName('SubTotal');
    ACBrECF1.RespostasComando.AddField( 'TotalAPagar', Informacao.AsString);
    ACBrECF1.RespostasComando.AddField( 'TotalPago', '000' );
  end;
end;

procedure TfrmPrincipal.ACBrECF1BobinaAdicionaLinhas(const Linhas,
  Operacao: string);
begin
  fBobinaECF.AtualizaBobina(Linhas, True);
end;

procedure TfrmPrincipal.ACBrECF1ChangeEstado(const EstadoAnterior,
  EstadoAtual: TACBrECFEstado);
var
  sEstAnterior, sEstAtual: String;
begin
  case EstadoAnterior of
    estNaoInicializada: sEstAnterior := 'NaoInicializada';
    estDesconhecido: sEstAnterior := 'Desconhecido';
    estLivre: sEstAnterior := 'Livre';
    estVenda: sEstAnterior := 'Venda';
    estPagamento: sEstAnterior := 'Pagamento';
    estRelatorio: sEstAnterior := 'Relatorio';
    estBloqueada: sEstAnterior := 'Bloqueada';
    estRequerZ: sEstAnterior := 'RequerZ';
    estRequerX: sEstAnterior := 'RequerX';
    estNaoFiscal: sEstAnterior := 'NaoFiscal';
  end;

  case EstadoAtual of
    estNaoInicializada: sEstAtual := 'NaoInicializada';
    estDesconhecido: sEstAtual := 'Desconhecido';
    estLivre: sEstAtual := 'Livre';
    estVenda: sEstAtual := 'Venda';
    estPagamento: sEstAtual := 'Pagamento';
    estRelatorio: sEstAtual := 'Relatorio';
    estBloqueada: sEstAtual := 'Bloqueada';
    estRequerZ: sEstAtual := 'RequerZ';
    estRequerX: sEstAtual := 'RequerX';
    estNaoFiscal: sEstAtual := 'NaoFiscal';
  end;

  edtEstadoECF.Text := Format('Anterior: %s - Atual: %s', [sEstAnterior, sEstAtual]);
end;

procedure TfrmPrincipal.ACBrECF1MsgAguarde(const Mensagem: string);
begin
  if trim (Mensagem) <> '' then
    frmSplash.AtualizaStatus(Mensagem);
end;

procedure TfrmPrincipal.ACBrECF1MsgPoucoPapel(Sender: TObject);
begin
  //*** Nao faz nada
  Sleep(1);
end;

function TfrmPrincipal.AtivarECF(Const ABuscarECF : boolean) : boolean;
var
  InicializouSplash : boolean;
  Porta : string;
  Modelo : integer;
  Velocidade : integer;
  ATimeOut : integer;
begin
  InicializouSplash := False;
  if not ACBrECF1.Ativo then
  begin
    ACBrECF1.Timeout := 3;
    ACBrECF1.IntervaloAposComando := 100;

    try
      if not ABuscarECF then
      begin
        Porta  :=  frmSplash.AiniFile.ReadString('ECF', 'Porta', '');
        Modelo :=  frmSplash.AiniFile.ReadInteger('ECF', 'Modelo', 0);
        Velocidade :=  frmSplash.AiniFile.ReadInteger('ECF', 'Velocidade', 115200);
        Modelo :=  frmSplash.AiniFile.ReadInteger('ECF', 'Modelo', 0);
      end
      else
      begin
        Porta  := '';
        Modelo := 0;
        Velocidade := 0;
      end;

      if Not Assigned(frmSplash) then
      begin
        frmSplash := TfrmSplash.Create(Self);
        frmSplash.ShowModal;
        InicializouSplash := True;
      end;

      frmSplash.AtualizaStatus('Buscando por um ECF.');
      if (Trim(Porta) <> '') and (Modelo> 1) then
      begin
        ACBrECF1.Porta := Porta;
        {0 - ecfNenhum, 1 - ecfNaoFiscal, 2 - ecfBematech, 3 - ecfSweda, 4 - ecfDaruma,
                  5 - ecfSchalter, 6 -  ecfMecaf, 7 - ecfYanco, 8 - ecfDataRegis, 9 - ecfUrano,
                  10 - ecfICash, 11 - ecfQuattro, 12 - ecfFiscNET, 13 - ecfEpson, 14 - ecfNCR,
                  15 - ecfSwedaSTX, 16 - ecfEscECF )}
        {(ecfNenhum, ecfNaoFiscal, ecfBematech, ecfSweda, ecfDaruma,
                  ecfSchalter, ecfMecaf, ecfYanco, ecfDataRegis, ecfUrano,
                  ecfICash, ecfQuattro, ecfFiscNET, ecfEpson, ecfNCR,
                  ecfSwedaSTX, ecfEscECF, ecfECFVirtual )}

        ACBrECF1.Modelo := TACBrECFModelo(Modelo);
//        showmessge()
//        ACBrECF1.Device.Baud := Velocidade;
        frmSplash.AtualizaStatus('Ativando ECF na porta ' + ACBrECF1.Porta);
        try
          ACBrECF1.Ativar ;
          frmSplash.AtualizaStatus('ECF ATIVADO na porta ' + ACBrECF1.Porta);
          frmPrincipal.ACBrECF1.Operador := dmCaixa.Usuario.Nome;
        except
          Porta := '';
          Modelo := 0;
          AtivarECF(True);
        end;
      end
      else
      try
        if not ACBrECF1.AcharECF(True, True) then
          frmMensagem.MostraMensagemErro('Nenhum ECF encontrado. Verifique se a impressora de cupom fiscal está ligada.')
        else
        begin
          frmSplash.AtualizaStatus('Ativando ECF na porta ' + ACBrECF1.Porta);
          ACBrECF1.Ativar ;
          frmSplash.AtualizaStatus('ECF ATIVADO na porta ' + ACBrECF1.Porta);
          frmPrincipal.ACBrECF1.Operador := dmCaixa.Usuario.Nome;
        end;
      except
        on e : exception do
        begin

        end;
      end
    finally
      result := ACBrECF1.Ativo;
      if Result then
      begin
        frmSplash.AiniFile.WriteString('ECF', 'Porta', ACBrECF1.Porta);
        frmSplash.AiniFile.WriteInteger('ECF', 'Modelo', Integer(ACBrECF1.Modelo));
      end;

      if frmPrincipal.ACBrECF1.Estado = estRequerZ then
      begin
        frmSplash.AtualizaStatus('Emitindo REDUÇÃO "Z"');
        try
          ATimeOut := ACBrECF1.TimeOut;
          ACBrECF1.TimeOut := 600;
          ACBrECF1.ReducaoZ(Now);
        finally
          ACBrECF1.TimeOut := ATimeOut;
        end;
        frmSplash.AtualizaStatus('REDUÇÃO "Z" emitida com sucesso.');
      end;

      if frmPrincipal.ACBrECF1.Estado = estRequerX then
      begin
        frmSplash.AtualizaStatus('Emitindo LEITURA "X"');
        try
          ATimeOut := ACBrECF1.TimeOut;
          ACBrECF1.TimeOut := 600;
          ACBrECF1.LeituraX;
        finally
          ACBrECF1.TimeOut := ATimeOut;
        end;
        frmSplash.AtualizaStatus('LEITURA "X" emitida com sucesso.');
      end;

      if frmPrincipal.ACBrECF1.Estado = estLivre then
      begin
        ACBrECF1.CarregaAliquotas;
        ACBrECF1.CarregaFormasPagamento;
        ACBrECF1.IdentificaOperador(dmCaixa.Usuario.Nome);
      end;

    end;

    if InicializouSplash then
      FreeAndNil(frmSplash);
  end
  else
    result := True;
end;

procedure TfrmPrincipal.AtualizaBotoes;
begin
  btnAbrirCaixa.Visible := (dmCaixa.Estacao.Caixa.idCaixa <= 0) and (dmCaixa.TemPermissao(1));
  btnFecharCaixa.Visible := (dmCaixa.Estacao.Caixa.idCaixa > 0) and (dmCaixa.TemPermissao(2));
  btnAbrirSessaoCaixa.Visible := (dmCaixa.Estacao.Caixa.idSessaoCaixa <= 0) and (dmCaixa.TemPermissao(6));
  btnFecharSessaoCaixa.Visible := (dmCaixa.Estacao.Caixa.idSessaoCaixa > 0) and (dmCaixa.TemPermissao(7));
  btnVender.Visible := (dmCaixa.Estacao.Caixa.idSessaoCaixa > 0) and dmCaixa.TemPermissao(11);
  btnGerenciarNFCes.Visible := (dmCaixa.Estacao.Faturamento.EmitirDFEAutomaticamente = False) and dmCaixa.TemPermissao(96);
  lblDataCaixa.Visible := dmCaixa.Estacao.Caixa.idCaixa > 0;
  lblUsuarioCaixa.Visible := dmCaixa.Estacao.Caixa.idCaixa > 0;
  lblDataSessaoCaixa.Visible := dmCaixa.Estacao.Caixa.idSessaoCaixa > 0;
  lblUsuarioSessaoCaixa.Visible := dmCaixa.Estacao.Caixa.idSessaoCaixa > 0;
  btnBaixarPedidos.Visible := dmCaixa.Estacao.ConfiguracoesDaVenda.BaixarPedidos;
  btnGerenciarNFCes.Visible := (dmCaixa.Estacao.Faturamento.TipoFaturamento = tfNFCe) and (dmCaixa.TemPermissao(2));

  lblDataCaixa.Caption := 'Abertura : ' + FormatDateTime('dd/MM/yy hh:NN:ss', dmCaixa.Estacao.Caixa.dhAberturaCaixa);
  lblUsuarioCaixa.Caption := 'Usuário : ' + dmCaixa.Estacao.Caixa.NomeUsuarioAberturaCaixa;
  frmPrincipal.lblDataSessaoCaixa.Caption := 'Abertura : ' + FormatDateTime('dd/MM/yy hh:NN:ss', dmCaixa.Estacao.Caixa.dhAberturaSessaoCaixa);
  frmPrincipal.lblUsuarioSessaoCaixa.Caption := 'Usuário : ' + dmCaixa.Estacao.Caixa.NomeUsuarioAberturaSessaoCaixa;
end;

procedure TfrmPrincipal.BalancaLePeso(Peso: Double; Resposta: AnsiString);
var
  i : integer;
  ProdutoAuxiliar : TProduto;
begin
  if (Not CarregandoCombo) then
  begin
    try
      if Peso > 0 then
      begin
        ContadorErrosBalanca := 0;
        ProdutoAuxiliar := frmConta.ProdutoAtual.Produto;
        ProdutoAuxiliar.Qtde := Peso;
        frmConta.ProdutoAtual.Produto := ProdutoAuxiliar;
        InsereItem(Self, frmConta.ProdutoAtual.Produto, False, -1, -1);
        frmConta.AtualizaVisualizacao;
      end
      else
      begin
        Inc(ContadorErrosBalanca);
        i := Trunc(frmPrincipal.Balanca.UltimoPesoLido);
        case i of
           0 : raise exception.Create('Tempo esgotado! '+sLineBreak+ 'Coloque o produto sobre a balança!');
          -1 : raise exception.Create('Peso instável! ' +sLineBreak+ 'Tente nova leitura.');
          -2 : raise exception.Create('Peso negativo! ' +sLineBreak+ 'Verifique a tara da balança.');
          -9 : begin
            if ContadorErrosBalanca > 3 then
              raise exception.Create('Tempo esgotado! '+sLineBreak+ 'A balança está ligada?')
            else
              Balanca.LePeso(2000);
          end;
         -10 : raise exception.Create('Sobrepeso! ');
        else
          raise exception.Create('Erro não conhecido - ' + IntToStr(i));
        end;
      end ;
    except
      on E: Exception do
        frmMensagem.MostraMensagemErroSemTimer('Erro inserindo ítem por peso da balança. Reinicie o processo. ' +
          frmConta.ProdutoAtual.Produto.Descricao + sLineBreak + e.Message);
    end;
  end;
end;

procedure TfrmPrincipal.btnAbrirCaixaClick(Sender: TObject);
var
  EstacaoAuxiliar : TEstacao;
begin
  if dmCaixa.Estacao.Faturamento.TipoFaturamento in [tfNFE, tfNFCe] then
    VerificaSituacaoNFE;

  frmPergunta.LimpaFormulario;
  frmPergunta.lblPergunta.Caption := 'Deseja abrir o caixa geral do dia ' + QuotedStr(FormatDateTime('dd/MM/YY', Now)) + ' ?';
  if frmPergunta.ShowModal = mrOk then
  begin
    frmSenha := TfrmSenha.Create(Self);
    if frmSenha.ShowModal = mrOk then
    begin
      with dmCaixa do
      begin
        //*** Primeiro pedo o ID na sequence
        with qryAuxiliar do
        begin
          Close;
          SQL.Text := format('select idCaixa, dhAbertura from Vendas.Caixas where idEmpresa = %d and Cast(dhAbertura as date) = ' +
              QuotedStr(FormatDateTime(FormatoData, Date)), [dmCaixa.Estacao.idEmpresa]);;
          Open;

          if RecordCount > 0 then
          begin
            //*** Agora seto o novo caixa
            EstacaoAuxiliar := dmCaixa.Estacao;
            EstacaoAuxiliar.Caixa.idCaixa := Fields.Fields[0].AsInteger;
            EstacaoAuxiliar.Caixa.dhAberturaCaixa := Fields.Fields[1].AsDateTime;
            dmCaixa.Estacao := EstacaoAuxiliar;

            AtualizaBotoes;

            frmMensagem.MostraMensagem('Já existe um caixa aberto para esta data - ' + QuotedStr(FormatDateTime('dd/MM/YY', Now)));

          end
          else
          begin
            Close;
            SQL.Text := 'select next value for Vendas.CaixasSequence';
            Open;

            if RecordCount > 0 then
            begin
              with TFDQuery.Create(Self) do
              begin
                Connection := dmCaixa.dbTotalFastFood;
                SQL.Text := Format('insert into Vendas.Caixas (idEmpresa, idCaixa, idUsuarioAbertura, idListaPreco, dhAbertura) values ' +
                  '(%d, %d, %d, %d, GetDate())',
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.qryAuxiliar.Fields.Fields[0].AsInteger, dmCaixa.Usuario.ID, dmCaixa.Estacao.Caixa.idListaPreco]);
                Execute;

                if RowsAffected <= 0 then
                  raise Exception.Create('Erro abrindo caixa geral no banco de dados. ' + sLineBreak + SQL.Text)
                else
                begin
                  //*** Agora seto o novo caixa
                  EstacaoAuxiliar := dmCaixa.Estacao;
                  EstacaoAuxiliar.Caixa.idCaixa := dmCaixa.qryAuxiliar.Fields.Fields[0].AsInteger;
                  EstacaoAuxiliar.Caixa.dhAberturaCaixa := Now;
                  dmCaixa.Estacao := EstacaoAuxiliar;

                  AtualizaBotoes;
                end;

                Free;
              end;
            end
            else
              raise Exception.Create('Erro buscando novo ID do caixa geral. ' + sLineBreak + SQL.Text);
          end;

          Close;
        end;
      end;
    end;
    frmsenha.Free;
  end;
end;

procedure TfrmPrincipal.btnAbrirGavetaClick(Sender: TObject);
begin
  frmSenha := TfrmSenha.Create(Self);
  try
    if frmSenha.ShowModal = mrOk then
    begin
      if dmCaixa.UsuarioTemPermissao(frmSenha.idUsuario, 110) then
        Impressora.AbrirGaveta
      else
        frmMensagem.MostraMensagem('Usuário não tem permissão para abrir a gaveta.');
    end;
  finally
    frmSenha.Free;
  end;
end;

procedure TfrmPrincipal.btnAbrirSessaoCaixaClick(Sender: TObject);
var
  EstacaoAuxiliar : TEstacao;
begin
  EstacaoAuxiliar := dmCaixa.Estacao;
  //*** Primeiro verifico se existe Caixa aberto.
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select c.*, p.NomeFantasia from Vendas.Caixas c inner join Contabil.Pessoas p ' +
      'on c.idUsuarioAbertura = p.idPessoa where c.idEmpresa = %d and c.dhfechamento is null ',
      [dmCaixa.Estacao.idEmpresa]);
    Open;

    if RecordCount <= 0 then
    begin
      EstacaoAuxiliar.Caixa.idCaixa := -1;
      dmCaixa.Estacao := EstacaoAuxiliar;
      AtualizaBotoes;
      frmMensagem.MostraMensagemErro('Não existe CAIXA aberto. Abra primeiro.');
    end
    else
    begin
      EstacaoAuxiliar.Caixa.idCaixa := FieldByName('idCaixa').AsInteger;
      EstacaoAuxiliar.Caixa.dhAberturaCaixa := FieldByName('dhAbertura').AsDateTime;
      EstacaoAuxiliar.Caixa.idUsuarioAberturaCaixa := FieldByName('idUsuarioAbertura').AsInteger;
      EstacaoAuxiliar.Caixa.NomeUsuarioAberturaCaixa := FieldByName('NomeFantasia').AsString;
      dmCaixa.Estacao := EstacaoAuxiliar;
      AtualizaBotoes;

      //*** Agora sim inicio a abertura da sessão do caixa
      frmPergunta.LimpaFormulario;
      frmPergunta.lblPergunta.Caption := 'Deseja abrir novo turno?';
      if frmPergunta.ShowModal = mrOk then
      begin
        frmSenha := TfrmSenha.Create(Self);
        if frmSenha.ShowModal = mrOk then
        begin
          frmAberturaSessaoCaixa := TfrmAberturaSessaoCaixa.Create(Self);
          if frmAberturaSessaoCaixa.ShowModal = mrOk then
          begin
            //*** Agora seto a nova sessão de caixa
            EstacaoAuxiliar := dmCaixa.Estacao;
            EstacaoAuxiliar.Caixa.idSessaoCaixa := frmAberturaSessaoCaixa.idSessaoCaixa;
            EstacaoAuxiliar.Caixa.dhAberturaSessaoCaixa := Now;
            EstacaoAuxiliar.Caixa.idUsuarioAberturaSessaoCaixa := dmCaixa.Usuario.ID;
            EstacaoAuxiliar.Caixa.NomeUsuarioAberturaSessaoCaixa := dmCaixa.Usuario.Nome;
            dmCaixa.Estacao := EstacaoAuxiliar;

            AtualizaBotoes;
          end;
          frmAberturaSessaoCaixa.Free;
        end;
        FreeAndNil(frmsenha);
      end;
    end;
    Close;
  end;
end;

procedure TfrmPrincipal.btnBaixarPedidosClick(Sender: TObject);
begin
  frmBaixarPedidos := TfrmBaixarPedidos.Create(Self);
  try
    frmBaixarPedidos.ShowModal;
  finally
    frmBaixarPedidos.Free;
  end;
end;

procedure TfrmPrincipal.btnFecharCaixaClick(Sender: TObject);

begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select * from vendas.contas where idEmpresa = %d and idCaixa = %d and DataFim is Null',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa]);
    Open;

    if RecordCount > 0 then
      frmMensagem.MostraMensagem('Existem mesas em aberto. Feche-as primeiro. Se não existir nenhum turno em aberto, tem que abrir um.')
    else
    begin
      frmPergunta.LimpaFormulario;
      frmPergunta.lblPergunta.Caption := 'Deseja realmente fechar o caixa geral?';
      if frmPergunta.ShowModal = mrOk then
      begin
        frmFechamentoCaixa := TfrmFechamentoCaixa.Create(Self);
        try
          frmFechamentoCaixa.ShowModal;
        finally
          frmFechamentoCaixa.Free;
        end;
      end;
    end;

    Close;
  end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnFecharSessaoCaixaClick(Sender: TObject);
var
  existe : boolean;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select * from vendas.contas where idEmpresa = %d and idCaixa = %d and idSessaoCaixa = %d and DataFim is Null and idTipoVenda = 1 and valor > 0',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa]);
    Open;

    existe := RecordCount > 0;
    Close;
    if Existe then
    begin
      frmMensagem.MostraMensagem('Existem mesas em aberto. Feche-as primeiro. Se não existir nenhum turno em aberto, tem que abrir um.');
      btnVenderClick(Sender);
    end
    else
    begin
      frmSessaoCaixaApuracao := TfrmSessaoCaixaApuracao.Create(Self);
      try
        if frmSessaoCaixaApuracao.ShowModal = mrOk then
          AtualizaBotoes;
      finally
        FreeAndNil(frmSessaoCaixaApuracao);
      end;
    end;
  end;
end;

procedure TfrmPrincipal.btnGerenciarNFCesClick(Sender: TObject);
begin
  frmGerenciarNFCes := TfrmGerenciarNFCes.Create(Self);
  try
    frmGerenciarNFCes.ShowModal;
  finally
    FreeAndNil(frmGerenciarNFCes);
  end;
end;

procedure TfrmPrincipal.btnReimprimirCaixaClick(Sender: TObject);
begin
  frmSenha := TfrmSenha.Create(Self);
  try
    if frmSenha.ShowModal = mrOk then
    begin

      if dmCaixa.UsuarioTemPermissao(frmSenha.idUsuario, 118) then
      begin
        frmSelecionaCaixa := TfrmSelecionaCaixa.Create(Self);

        try
          if frmSelecionaCaixa.ShowModal = mrOk then
            //*** Sai a fita
            dmCaixa.ImprimeFita(frmSelecionaCaixa.qryCaixas.FieldByName('idCaixa').AsInteger, 0, 0, dmCaixa.Estacao.EmitirProdutosNaFita, False, False);

        finally
          FreeAndNil(frmSelecionaCaixa);
        end;
      end
      else
        frmMensagem.MostraMensagem('Usuário não tem permissão para abrir a gaveta.');
    end;
  finally
    frmSenha.Free;
  end;
end;

procedure TfrmPrincipal.btnReimprimirTurnoClick(Sender: TObject);
begin
  frmSenha := TfrmSenha.Create(Self);
  try
    if frmSenha.ShowModal = mrOk then
    begin

      if dmCaixa.UsuarioTemPermissao(frmSenha.idUsuario, 119) then
      begin
        frmSelecionaCaixa := TfrmSelecionaCaixa.Create(Self);

        frmSelecionaCaixa.pnlSelecioneTurno.Visible := true;
        frmSelecionaCaixa.dbgridTurnos.Visible := true;
        frmSelecionaCaixa.qryTurnos.Open;

        try
          if frmSelecionaCaixa.ShowModal = mrOk then
            //*** Sai a fita
            dmCaixa.ImprimeFita(frmSelecionaCaixa.qryCaixas.FieldByName('idCaixa').AsInteger, 0,
              frmSelecionaCaixa.qryTurnos.FieldByName('idSessaoCaixa').AsInteger, dmCaixa.Estacao.EmitirProdutosNaFita, False, False);
        finally
          FreeAndNil(frmSelecionaCaixa);
        end;
      end
      else
        frmMensagem.MostraMensagem('Usuário não tem permissão para abrir a gaveta.');
    end;
  finally
    frmSenha.Free;
  end;
end;

procedure TfrmPrincipal.btnSangriaClick(Sender: TObject);
begin
  //*** SANGRIA
  frmSangria := TfrmSangria.Create(Self);
  try
    frmSangria.ShowModal;
  finally
    frmSangria.Free;
  end;
end;

procedure TfrmPrincipal.btnVenderClick(Sender: TObject);
begin
  if dmCaixa.Estacao.Caixa.idCaixa = -1 then
    frmMensagem.MostraMensagem('Não existe "caixa" aberto. Abra um primeiro.')
  else if Not (dmCaixa.Estacao.Caixa.TipoEstacao in [teAdministrador, teLancamento]) and (dmCaixa.Estacao.Caixa.idSessaoCaixa = -1) then
    frmMensagem.MostraMensagem('Não existe "sessão de caixa" aberta para esta estação. Abra um primeiro.')
  else
  begin
//    if not (dmCaixa.Estacao.TipoEstacao in [teAdministrador, teLancamento]) then
//      AtivarECF;
    case dmCaixa.Estacao.Caixa.TipoEstacao of
      teCaixaBalcao : begin
        frmConta := TfrmConta.Create(Self);
        if dmCaixa.TipoEstacao <> teNenhum then
        begin
          case dmCaixa.TipoEstacao of
            teCaixaBalcao : frmConta.TipoVenda := tvVendaBalcao;
            teCaixaMesa   : frmConta.TipoVenda := tvVendaMesa;
            teCaixaCartao : frmConta.TipoVenda := tvVendaCartao;
            teCallCenter  : frmConta.TipoVenda := tvVendaDelivery;
          end;
        end
        else
          frmConta.TipoVenda := tvVendaBalcao;
        frmConta.ShowModal;
        FreeAndNil(frmConta);
      end;
      teCaixaMesa, teCaixaCartao, teLancamento, teCallCenter : begin
        frmMesas := TfrmMesas.Create(Self);
        frmMesas.ShowModal;
        FreeAndNil(frmMesas);
        if dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento then
          Close;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tcpclienteSenha.Connected then
    tcpclienteSenha.Disconnect;

//  ClientThread1 := nil;

  if ACBrECF1.Ativo then
    ACBrECF1.Desativar;

  if Balanca.Ativo then
    Balanca.Desativar;

  if frmPergunta <> nil then
    FreeAndNil(frmPergunta);

  if frmMensagem <> nil then
    FreeAndNil(frmMensagem);

  dmCaixa.dbTotalFastFood.Close;

  FreeAndNil(dmCaixa);

  Action := caFree;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TPanel then
      if (copy(TPanel(Self.Components[i]).name, 1, 3) = 'btn') or
         (copy(TPanel(Self.Components[i]).name, 1, 3) = 'grp') then
        DrawRounded(TWinControl(Self.Components[i]));

  IPServidorTCP := '127.0.0.1';
  PortaServidorTCP := 34987;

  frmPergunta  := TfrmPergunta.Create(Self);
  frmMensagem  := TfrmMensagem.Create(Self);

  ProgramaInicializado := False;

  edtVersao.Text := RetornaVersaoArquivo(Application.ExeName);

  HandleCommandline(HandleParameter);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  eAuxiliar : TEstacao;

  function VeririfaDataHoraECF : Boolean;
  var
    sDataECF : AnsiString;
    sHoraECF : AnsiString;
    DataECF : TDateTime;
    w : integer;
  begin
    result := True;

    sDataECF := '';
    sHoraECF := '';

    for w := 1 to 6 do
      sDataECF := sDataECF + ' ';
    for w := 1 to 6 do
      sHoraECF := sHoraECF + ' ';

    DataECF := ACBrECF1.DataHora;

    If Abs(MinuteOf(Now - DataECF)) > 15 Then
    begin
      result := False;
      frmMensagem.MostraMensagem('Data e hora do computudador, não confere com a data e hora do ECF.' + sLineBreak +
                  'Data e hora do computador : ' + DateTimeToStr(Now) + sLineBreak +
                  'Data e hora do ECF        : ' + DateTimeToStr(DataECF) + sLineBreak +
                  'Diferença em minutos      : ' + IntToStr(Abs(MinuteOf(Now - DataECF))) + sLineBreak +
                  'Verifique.');
    end;
  end;
begin
  if not ProgramaInicializado then
  begin
{
    if dmCaixa.Estacao.ChamarSenha then
    begin

      tcpclienteSenha.Host := dmCaixa.Estacao.NomeServidorSenha;
      tcpclienteSenha.Port := dmCaixa.Estacao.PortaServidorSenha;
      try
        tcpclienteSenha.Connect;
        // if we are connected
        if tcpclienteSenha.Connected then begin
          // create a listener thread instance
          ClientThread1 := TClientThread.Create(tcpclienteSenha);
          // set the client user name & ID
          ClientThread1.ClientData := ClientData1;
          // start the thread
          ClientThread1.Start;
          // notify clients that we're connected
          ClientThread1.SendConnected;
        end; // if Client.Connected then begin
      except
        on e : exception do
        begin
          if e.ClassType = EIdHostRequired then
            ShowMessage('Erro conectando ao servidor das TVs.' + #10#13 +
                        'Não foi informado um IP/Host.' + #10#13 +
                        'Mensagem do sistema --> ' + e.Message)
          else if e.ClassType = EIdPortRequired then
            ShowMessage('Erro conectando ao servidor das TVs.' + #10#13 +
                        'Não foi informada uma porta TCP/IP.' + #10#13 +
                        'Mensagem do sistema --> ' + e.Message)
          else
            ShowMessage('Erro conectando ao servidor das TVs.' +
                        #10#13 + 'Mensagem do sistema --> ' + e.Message);
        end;
      end;
    end;
 }
    frmPergunta.BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
    frmMensagem.NumeroMonitor := dmCaixa.NumeroMonitor;
    frmMensagem.BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
    BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
    WindowState := wsMaximized;

    pnlCentral.Left := Trunc((Self.Width - pnlCentral.Width) / 2);
    pnlCentral.Top := pnlLogos.Height + Trunc((pnlPrincipal.Height - pnlLogos.Height - pnlCentral.Height) / 2) + 1;

    frmSplash.Show;

    eAuxiliar := dmCaixa.Estacao;

    if dmCaixa.Estacao.Balanca.Existe then
    begin
      Balanca.ArqLOG := 'FrenteDeCaixa-Estacao-' +dmCaixa.Estacao.ID.ToString + '.log';
      Balanca.Porta := 'COM' + IntToStr(dmCaixa.Estacao.Balanca.PortaSerialBalanca);
      frmSplash.AtualizaStatus('Ativando balança. [' + Balanca.Porta + ']');
      Balanca.Modelo := dmCaixa.Estacao.Balanca.ModeloBalanca;
      Balanca.Device.Baud := dmCaixa.Estacao.Balanca.BaudRate;
      if dmCaixa.Estacao.Balanca.Parity = 'S' then
        Balanca.Device.Parity := TACBrSerialParity.pNone
      else if dmCaixa.Estacao.Balanca.Parity = 'P' then
        Balanca.Device.Parity := pEven
      else if dmCaixa.Estacao.Balanca.Parity = 'I' then
        Balanca.Device.Parity := pOdd;
      case dmCaixa.Estacao.Balanca.StopBits of
        2 : Balanca.Device.Stop := s2;
        3 : Balanca.Device.Stop := s1eMeio;
      else
        Balanca.Device.Stop := s1;
      end;
      if Balanca.Modelo <> balNenhum then
      begin
        try
          Balanca.Ativar;
        except
          on e : exception do
            raise Exception.Create('Erro ativando balança. [' + Balanca.Porta + ']' + sLineBreak + e.Message);
        end;
      end;
    end;

    if Not (dmcaixa.estacao.Caixa.TipoEstacao in [teAdministrador, teLancamento]) then
    begin
      btnSangria.Visible := True;

      if frmPrincipal.btnVender.CanFocus then
        frmPrincipal.ActiveControl := frmPrincipal.btnVender;

      if (dmCaixa.Estacao.Faturamento.TipoFaturamento = tfECF) and (dmCaixa.Estacao.Caixa.TipoEstacao <> teCallCenter) then
      begin
        try
          ACBrECF1.ArqLOG := dmCaixa.Estacao.Dados.Descricao + 'acbrlog.txt';
          AtivarECF;
        finally
          if (ACBrECF1.Ativo) and (not VeririfaDataHoraECF) then
          begin

          end;
        end;
      end;
    end
    else if dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento then
    begin
      frmSplash.AtualizaStatus('Buscando informações do caixa ativo da estação de lançamento.');
      //*** Verificando se existe caixa
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := Format('Select c.idCaixa, c.idUsuarioAbertura, c.dhAbertura, p.NomeFantasia from Vendas.Caixas C '+
          'inner join Contabil.Pessoas p on c.idUsuarioAbertura = p.idPessoa where idEmpresa = %d  and idUsuarioFechamento is Null ',
          [dmCaixa.Estacao.idEmpresa]);
        Open;

        if RecordCount > 0 then
        begin
          eAuxiliar.Caixa.idCaixa := FieldByName('idCaixa').AsInteger;
          eAuxiliar.Caixa.idUsuarioAberturaCaixa := FieldByName('idUsuarioAbertura').Value;
          eAuxiliar.Caixa.dhAberturaCaixa := FieldByName('dhAbertura').Value;
          eAuxiliar.Caixa.NomeUsuarioAberturaCaixa := FieldByName('NomeFantasia').Value;
        end;

        Close;
      end;

      dmCaixa.Estacao := eAuxiliar;
    end;

    AtualizaBotoes;

    ProgramaInicializado :=  True;

    frmSplash.AiniFile.Free;
    if Assigned(frmSplash) then
        FreeAndNil(frmSplash);

    if dmCaixa.Estacao.Caixa.TipoEstacao = teLancamento then
      btnVenderClick(Self);
  end;
end;

procedure TfrmPrincipal.HandleParameter(const param: string);
begin
 // Não faz nada
end;

procedure TfrmPrincipal.ImprimirUltimoPedido;
begin

end;

procedure TfrmPrincipal.Panel1Click(Sender: TObject);
begin
//  GerarNotaEletronica(dmCaixa.dbTotalFastFood, dmCaixa.ACBrNFe1, 1, True, True,
//    dmCaixa.Estacao, '', '', '',  316915, 59, '', 0);
end;

procedure TfrmPrincipal.SetEnvironmentVariableValue(const VarName, VarValue: string);
var
  rv: DWORD;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;
    OpenKey('Environment', False);
    WriteString(VarName, VarValue);
    SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LParam
      (PChar('Environment')), SMTO_ABORTIFHUNG, 5000, rv);
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.SetVersaoExe(const Value: string);
begin
  FVersaoExe := Value;

end;

procedure TfrmPrincipal.VerificaSituacaoNFE;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('select * from Vendas.Contas where (datafim is not null) and ((situacaoNFE <> ' + QuotedSTR('A') + ') and ' +
      '(dateadd(dd, 1, datafim) > getdate())) and (not exists (select 1 from vendas.EmpresaEstacoes where idEmpresa = %d and idEstacao = %d and MODOCONTINGENCIANFCE = 1))',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.ID]);
    Open;

    if RecordCount > 0 then
    begin
      frmMensagem.MostraMensagemErro('Existem notas fiscais eletrônicas emitidas não autorizadas pelo SEFAZ. Contate suporte técnico.');
      Application.Terminate;
    end;
  end;
end;

//procedure TfrmPrincipal.WMCopyData(var msg: TWMCopyData);
//begin
//  HandleSendCommandline(msg.CopyDataStruct^, HandleParameter);
//end;

function TfrmPrincipal.ConectaAoServidorTCP: boolean;
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

end;

procedure TfrmPrincipal.EnviarSenha(const ASenha: string);
begin
{
  try
    if not tcpclienteSenha.Connected then
      tcpclienteSenha.Connect;

    if not tcpclienteSenha.Connected then
      frmMensagem.MostraMensagemErro('Não foi possível enviar senha. Verifique o servidor de senha.')
    else
    begin
      ClientThread1.EnviaNumeroSenha(StrToInt(ASenha));

//      try
//        if dmCaixa.Estacao.AvisoSonoro then
//          mediaChamaSenha.Play(dmCaixa.Estacao.NomeArquivoSom);
//      except
//        on e : exception do
//          raise Exception.Create('Erro emitindo o som.' + sLineBreak + e.Message);
//      end;
    end;
  except
    on e : exception do
      frmMensagem.MostraMensagemErro('Ocorreu o seguinte erro enviando senha. ' + sLineBreak + e.Message);
  end;
  }
end;

{procedure TfrmPrincipal.EurekaLogEvents1CustomDataRequest(
  AEurekaExceptionRecord: TEurekaExceptionInfo; ALogBuilder: TBaseLogBuilder;
  ADataFields: TStrings; var ACallNextHandler: Boolean);
begin
  if dmCaixa <> nil then
  begin
    AdataFields.Values['Nome da empresa'] := dmCaixa.Estacao.Dados.RazaoSocial;
    ADataFields.Values['ID do caixa'] := dmCaixa.Estacao.ID.ToString;
    ADataFields.Values['ID do usuário'] := dmCaixa.Usuario.ID.ToString;
    ADataFields.Values['Nome do usuário'] := dmCaixa.Usuario.Nome;
  end;
end;
}
end.

