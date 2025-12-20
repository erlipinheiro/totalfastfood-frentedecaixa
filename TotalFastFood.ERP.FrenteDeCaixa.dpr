program TotalFastFood.ERP.FrenteDeCaixa;

uses
  MIDASLIB,
  Dialogs,
  Windows,
  Vcl.Forms,
  System.SysUtils,
  pcnConversao,
  TlHelp32,
  ACBrDFeSSL,
  pcnConversaoNFe,
  blcksock,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  DataModuleCaixa in 'DataModuleCaixa.pas' {dmCaixa: TDataModule},
  USplash in 'USplash.pas' {frmSplash},
  uFormPadrao in 'Padroes\uFormPadrao.pas' {frmFormPadrao},
  uConta in 'Vendas\uConta.pas' {frmConta},
  uSelecionaPessoa in 'Vendas\uSelecionaPessoa.pas' {fSelecionaPessoa},
  uTipoPagamento in 'Vendas\uTipoPagamento.pas' {frmTipoPagamento},
  uSelecionaConveniado in 'Vendas\uSelecionaConveniado.pas' {fSelecionaConveniado},
  uSelecionaConvenio in 'Vendas\uSelecionaConvenio.pas' {fSelecionaConvenio},
  uPagamento in 'Vendas\uPagamento.pas' {frmPagamento},
  uCombo in 'Vendas\uCombo.pas' {frmCombo},
  uMesas in 'Vendas\uMesas.pas' {frmMesas},
  uCalculadora in 'Vendas\uCalculadora.pas' {fCalculadora},
  uPergunta in 'uPergunta.pas' {frmPergunta},
  uMensagem in 'uMensagem.pas' {frmMensagem},
  uSenha in 'uSenha.pas' {frmSenha},
  uAberturaSessaoCaixa in 'Caixa\uAberturaSessaoCaixa.pas' {frmAberturaSessaoCaixa},
  uSessaoCaixaApuracao in 'Caixa\uSessaoCaixaApuracao.pas' {frmSessaoCaixaApuracao},
  uSangria in 'Caixa\uSangria.pas' {frmSangria},
  uFechamentoCaixa in 'Caixa\uFechamentoCaixa.pas' {frmFechamentoCaixa},
  ACBrBAL,
  ACBRPosPrinter,
  frmBobinaECF in 'Vendas\frmBobinaECF.pas' {fBobinaECF},
  uMensagensErro in 'uMensagensErro.pas',
  uCadastraDelivery in 'Vendas\uCadastraDelivery.pas' {fCadastraCliente},
  uProcuraDelivery in 'Vendas\uProcuraDelivery.pas' {fProcuraDelivery},
  uSelecionaTipoVenda in 'Vendas\uSelecionaTipoVenda.pas' {frmSelecionaTipoVenda},
  uObservacoesManuais in 'Vendas\uObservacoesManuais.pas' {frmObservacoesManuais},
  uSelecionaAreaProducao in 'Vendas\uSelecionaAreaProducao.pas' {frmSelecionaAreaProducao},
  uCupomDesconto in 'Vendas\uCupomDesconto.pas' {frmCupomDesconto},
  uVerificaVersaoEXE in 'uVerificaVersaoEXE.pas',
  uTransfereCartoes in 'Vendas\uTransfereCartoes.pas' {frmTransfereCartoes},
  uFuncoes in '..\Compartilhados\uFuncoes.pas',
  Constantes in '..\Compartilhados\Constantes.pas',
  uClasses in '..\Compartilhados\uClasses.pas',
  uSelecionaPromocoes in 'Vendas\uSelecionaPromocoes.pas' {frmSelecionaPromocoes},
  uBaixarPedidos in 'Vendas\uBaixarPedidos.pas' {frmBaixarPedidos},
  uGerarNFE in '..\Compartilhados\uGerarNFE.pas',
  ProtocoloBRMidia in '..\..\..\BRMidia\Compartilhados\ProtocoloBRMidia.pas',
  uUnicaInstancia in 'uUnicaInstancia.pas',
  uGerenciaNFCes in 'Vendas\uGerenciaNFCes.pas' {frmGerenciarNFCes},
  uDadosConsumidor in 'Vendas\uDadosConsumidor.pas' {frmDadosConsumidor},
  VersaoBD in '..\Compartilhados\VersaoBD.pas',
  uSelecionaCaixa in 'uSelecionaCaixa.pas' {frmSelecionaCaixa},
  uConsultaVenda in 'Vendas\uConsultaVenda.pas' {frmConsultaVenda},
  uDadosCortesia in 'Vendas\uDadosCortesia.pas' {fDadosCortesia};

{$R *.res}

const
  ProcessName = '{8F21E9F2-1805-4650-9C6B-78CA03D864A4}';

var
  flLogou : boolean;
  eAuxiliar : TEstacao;
  uAuxiliar : TUsuario;
  flJaExecutando : boolean;
  aVersaoDB : TAtualizaBD;
begin
  flJaExecutando := AlreadyRunning(ProcessName, TfrmPrincipal);

  if FileExists('c:\windows\TotalFastFoodFrenteDeCaixa.ini') and (not flJaExecutando) then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    frmSplash := TfrmSplash.Create(Application);
    frmSplash.Show;
    frmSplash.AtualizaStatus('Criando formulário principal.');
    Application.Title := 'TotalFastFood - Frente de Caixa';
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    frmPrincipal.VersaoExe := frmSplash.VersaoEXE;
    frmSplash.AtualizaStatus('Criando formulário data module.');
    dmCaixa := TdmCaixa.Create(Application);
    frmSplash.AtualizaStatus('Inicializando conexão com o banco de dados.');

    dmCaixa.ConectaAoBancoDeDados;

    if dmCaixa.dbTotalFastFood.Connected then
    begin
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := format ('select ServidorDeAtualizacao from Contabil.Empresas where idEmpresa = (select idEmpresa from Vendas.EmpresaEstacoes where idEstacao = %d)',
          [dmCaixa.idEstacao]);
        Open;

        if RecordCount > 0 then
        begin
          frmSplash.AtualizaStatus('Buscando atualização do sistema.');
          try
            frmSplash.AtualizaVersao(FieldByName('ServidorDeAtualizacao').AsString);
          finally
            frmSplash.AtualizaStatus('Terminou a verificação da atualização.');
          end;
        end;

        Close;
      end;
  {
      //*** Verifico se tem atualização do banco de dados
      frmSplash.AtualizaStatus('Atualizando banco de dados.');
      aVersaoDB := TAtualizaBD.Create(Application, dmCaixa.dbTotalFastFood);
      try
        if not aVersaoDB.AtualizaBD then
          ShowMessage('Erro atualizando banco de dados --> ' + aVersaoDB.Mensagens);
      finally
        FreeAndNil(aVersaoDB);
      end;
  }
      //*** Posiciono na tela corretamente
      with frmSplash do
      begin
        BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
        WindowState := wsMaximized;
        pnlSplash.left := Trunc((Width - pnlSplash.Width) / 2);
        pnlSplash.Top := Trunc((Height - pnlSplash.Height) / 2);
      end;

      //*** Identifico a Estação
      frmSplash.AtualizaStatus('Identificando a estação.');

      //    idComputador := THardwareId.Create;
      try
        eAuxiliar := RetornaDadosDaEstacao(dmCaixa.dbTotalFastFood, dmCaixa.idEstacao);
        eAuxiliar.ChamarSenha:= frmSplash.AiniFile.ReadInteger('Senha', 'ChamarSenha', 0) = 1;
        eAuxiliar.NomeServidorSenha := frmSplash.AiniFile.ReadString('Senha', 'NomeServidorSenha', '');
        eAuxiliar.PortaServidorSenha := frmSplash.AiniFile.ReadInteger('Senha', 'PortaServidorSenha', 0);
        eAuxiliar.AvisoSonoro := frmSplash.AiniFile.ReadInteger('Senha', 'AvisoSonoro',  0) = 1;
        eAuxiliar.NomeArquivoSom := frmSplash.AiniFile.ReadString('Senha', 'NomeArquivoSom', '');
        eAuxiliar.ConfiguracoesDaVenda.BaixarPedidos := frmSplash.AiniFile.ReadInteger('Banco de Dados', 'BaixarPedidos',  0) = 1;

        frmPrincipal.SetEnvironmentVariableValue('idEmpresa', eAuxiliar.idEmpresa.ToString);
        frmPrincipal.SetEnvironmentVariableValue('NomeDaEstacao', eAuxiliar.Dados.Descricao);
        frmPrincipal.SetEnvironmentVariableValue('RazaoSocial', eAuxiliar.Dados.RazaoSocial);

        if (eAuxiliar.Caixa.idListaPreco <= 0) then
        begin
          raise exception.Create('Não existe lista de preço ativa para esta estação. Cadastre primeiro.');
          Application.Terminate;
        end;

        eAuxiliar.Faturamento.TipoAmbiente := tpcnTipoAmbiente(frmSplash.AiniFile.ReadInteger('Banco de Dados', 'TipoAmbiente', 0));

        if trim(dmCaixa.DiretorioNFE) <> '' then
        begin
          eAuxiliar.Faturamento.DiretorioNFE := dmCaixa.DiretorioNFE;
          eAuxiliar.Faturamento.DiretorioXSD := IncludeTrailingPathDelimiter(dmCaixa.DiretorioNFE) + 'SCHEMAS\NFE';
        end;

        if trim(dmCaixa.CaminhoCertificado) <> '' then
          eAuxiliar.Faturamento.CaminhoCertificado := dmCaixa.CaminhoCertificado;

        if eAuxiliar.Faturamento.TipoFaturamento =tfNFCe then
        begin
          dmCaixa.ACBrNFe1.Configuracoes.WebServices.UF := eAuxiliar.Dados.UF;
          dmCaixa.ACBrNFe1.Configuracoes.Geral.IdCSC := eAuxiliar.Faturamento.idCSC;
          dmCaixa.ACBrNFe1.Configuracoes.Geral.CSC := eAuxiliar.Faturamento.CSC;
          dmCaixa.ACBrNFe1.Configuracoes.Arquivos.PathNFe := eAuxiliar.Faturamento.DiretorioNFE;
          dmCaixa.ACBrNFe1.Configuracoes.Arquivos.PathSchemas := eAuxiliar.Faturamento.DiretorioXSD;

          dmCaixa.ACBrNFe1.Configuracoes.Certificados.ArquivoPFX := eAuxiliar.Faturamento.CaminhoCertificado;
          dmCaixa.ACBrNFe1.Configuracoes.WebServices.Ambiente := eAuxiliar.Faturamento.TipoAmbiente;
          dmCaixa.ACBrNFe1.Configuracoes.Certificados.Senha := eAuxiliar.Faturamento.SenhaCertificado;
        end;

        if trim(dmCaixa.ArquivoDANFEINI) <> '' then
          eAuxiliar.Impressora.ArquivoDanfe := dmCaixa.ArquivoDANFEINI;

        if trim(dmCaixa.NomeImpressoraINI) <> '' then
        begin
          eAuxiliar.Impressora.NomeImpressora := dmCaixa.NomeImpressoraINI;
          if uppercase(dmCaixa.ModeloImpressoraINI) = 'BEMATECH' then
            eAuxiliar.Impressora.ModeloImpressora := ppEscBematech
          else if uppercase(dmCaixa.ModeloImpressoraINI) = 'EPSON' then
            eAuxiliar.Impressora.ModeloImpressora := ppEscPosEpson
          else if uppercase(dmCaixa.ModeloImpressoraINI) = 'DARUMA' then
            eAuxiliar.Impressora.ModeloImpressora := ppEscDaruma
          else if uppercase(dmCaixa.ModeloImpressoraINI) = 'DIEBOLD' then
            eAuxiliar.Impressora.ModeloImpressora := ppEscDiebold
          else if uppercase(dmCaixa.ModeloImpressoraINI) = 'TEXTO' then
            eAuxiliar.Impressora.ModeloImpressora := ppTexto;

          eAuxiliar.Impressora.LinhasEntreCupons := dmCaixa.LinhasEntreCuponsINI;
          eAuxiliar.Impressora.NumeroColunas := dmCaixa.NumeroColunasINI;
          eAuxiliar.Impressora.FilaImpressao := dmCaixa.FilaImpressaoINI;
        end;

        if trim(eAuxiliar.Impressora.FilaImpressao) = '' then
        begin
          raise exception.Create('Não existe fila de impressão para esta estação. Cadastre primeiro.');
          Application.Terminate;
        end;

        case eAuxiliar.Caixa.TipoEstacao of
          teCaixaBalcao : frmPrincipal.edtTipoEstacao.Text := 'Venda balcão';
          teCaixaMesa   : frmPrincipal.edtTipoEstacao.Text := 'Venda mesa';
          teCaixaCartao : frmPrincipal.edtTipoEstacao.Text := 'Venda cartão';
          teCallCenter  : frmPrincipal.edtTipoEstacao.Text := 'Venda delivery';
          teLancamento  : frmPrincipal.edtTipoEstacao.Text := 'Lancamento';
        end;

        frmPrincipal.edtEmpresa.Text := ' ' + eAuxiliar.Dados.RazaoSocial;
        frmPrincipal.edtCNPJ.Text := ' ' + eAuxiliar.Dados.CNPJ;
        frmPrincipal.edtNomeEstacao.Text := ' ' + eAuxiliar.Dados.Descricao;
        frmPrincipal.edtListaPreco.Text := ' ' + eAuxiliar.Caixa.DescricaoListaPreco;
      except
        on e : exception do
        begin
          ShowMessage('Erro buscando dados da estação : ' + sLineBreak + e.Message);
          raise Exception.Create('Erro buscando dados da estação : ' + sLineBreak + e.Message);
        end;
      end;

      frmPrincipal.Impressora.Ativo := False;
      frmPrincipal.Impressora.Porta := eAuxiliar.Impressora.FilaImpressao;
      frmPrincipal.Impressora.LinhasEntreCupons := eAuxiliar.Impressora.LinhasEntreCupons;
      frmPrincipal.Impressora.ColunasFonteNormal := eAuxiliar.Impressora.NumeroColunas;
      frmPrincipal.Impressora.Modelo := eAuxiliar.Impressora.ModeloImpressora;
      frmPrincipal.Impressora.Ativar;

      //    if Assigned(idComputador) then
      //      FreeAndNil(idComputador);

    //    if (eAuxiliar.Caixa.TipoEstacao <> teLancamento)
    //      and (Not IsSingleInstance('TotalFastFood'))
    //      then
    //      Application.MessageBox('Já existe um sistema de Frente de Caixa aberto.', 'TotalFastFood')
    //    else
      if eAuxiliar.ID = 0 then
        ShowMessage(Format('Estação não identificada - %d.' + sLineBreak + 'O sistema não pode inicializar.' + sLineBreak + 'Contacte o suporte técnico.',
          [dmCaixa.idEstacao]))
      else
      begin
        with dmCaixa.qryAuxiliar do
        begin
          Close;
          SQL.Text := format('update Vendas.EmpresaEstacoes set VersaoFrenteDeCaixa = ' + QuotedStr(frmSplash.VersaoEXE) +
            ' where idEstacao= %d', [dmCaixa.idEstacao]);
          ExecSQL;
        end;

        //*** Faço o login do usuário
        frmSplash.Hide;
        frmSenha := TfrmSenha.Create(Application);
        dmCaixa.Estacao := eAuxiliar;
        frmSenha.FormStyle := fsStayOnTop;
        //*** if = mrOK ....
        frmSenha.lblEmpresa.Caption := eAuxiliar.Dados.NomeFantasia;
        frmSenha.lblEstacao.Caption := eAuxiliar.Dados.Descricao;
        flLogou := frmSenha.ShowModal = 1;
        if flLogou then
        begin
          //*** Pego os dados do caixa
          with dmCaixa.qryAuxiliar do
          begin
            Close;
            SQL.Text := format ('select c.idCaixa, c.idUsuarioAbertura as idUsuarioAberturaCaixa, c.dhAbertura as dhAberturaCaixa, pc.NomeFantasia as NomeUsuarioAberturaCaixa, ' +
                'sc.idSessaoCaixa, sc.idUsuarioAbertura as idUsuarioAberturaSessaoCaixa, sc.dhAbertura as dhAberturaSessaoCaixa, psc.NomeFantasia as NomeUsuarioAberturaSessaoCaixa ' +
                'from Vendas.EmpresaEstacoes ee ' +
                'inner join Vendas.Caixas c on ee.idEmpresa = c.idEmpresa ' +
                'inner join Contabil.Pessoas pc on c.idUsuarioAbertura = pc.idPessoa ' +
                'left join Vendas.SessoesCaixa sc on (sc.idEmpresa = c.idEmpresa) and (sc.idCaixa = c.idCaixa) and (sc.idEstacao = ee.idEstacao) and (sc.idUsuarioFechamento is Null) ' +
                'left join Contabil.Pessoas psc on sc.idUsuarioAbertura = psc.idPessoa ' +
                'where ee.idEstacao = %d and c.idUsuarioFechamento is Null ',[dmCaixa.idEstacao]);
            Open;

            if RecordCount > 0 then
            begin
              eAuxiliar.Caixa.idCaixa := FieldByName('idCaixa').AsInteger;
              eAuxiliar.Caixa.dhAberturaCaixa := FieldByName('dhAberturaCaixa').AsDateTime;
              eAuxiliar.Caixa.idUsuarioAberturaCaixa := FieldByName('idUsuarioAberturaCaixa').AsInteger;
              eAuxiliar.Caixa.NomeUsuarioAberturaCaixa := FieldByName('NomeUsuarioAberturaCaixa').AsString;
              if FieldByName('idSessaoCaixa').IsNull then
                eAuxiliar.Caixa.idSessaoCaixa := 0
              else
                eAuxiliar.Caixa.idSessaoCaixa := FieldByName('idSessaoCaixa').AsInteger;
              if FieldByName('dhAberturaSessaoCaixa').IsNull then
                eAuxiliar.Caixa.dhAberturaSessaoCaixa := 0
              else
                eAuxiliar.Caixa.dhAberturaSessaoCaixa := FieldByName('dhAberturaSessaoCaixa').AsDateTime;
              if FieldByName('idUsuarioAberturaSessaoCaixa').IsNull then
                eAuxiliar.Caixa.idUsuarioAberturaSessaoCaixa := 0
              else
                eAuxiliar.Caixa.idUsuarioAberturaSessaoCaixa := FieldByName('idUsuarioAberturaSessaoCaixa').AsInteger;
              if FieldByName('NomeUsuarioAberturaSessaoCaixa').IsNull then
                eAuxiliar.Caixa.NomeUsuarioAberturaSessaoCaixa := ''
              else
                eAuxiliar.Caixa.NomeUsuarioAberturaSessaoCaixa := FieldByName('NomeUsuarioAberturaSessaoCaixa').AsString;
            end;

            dmCaixa.Estacao := eAuxiliar;
            Close;
          end;

          with uAuxiliar do
          begin
            ID   := frmSenha.idUsuario;
            Nome := frmSenha.NomeUsuario;

            TransferirMesa := True;
            EstornarItem   := True;
            EstornarVenda  := True;
          end;
          dmCaixa.Usuario := uAuxiliar;
        end;

        frmSenha := nil;

        if flLogou then
        begin
          frmSplash.Show;
          dmCaixa.AbreDataSets;
          //          frmPrincipal.AtualizaPermissoes;

          dmCaixa.AtualizaPermissoes;
          //    HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics

          Application.Run;
        end
      end;
    end;

    if DMCaixa <> nil then
      FreeAndNil(DMCaixa);

    if frmPrincipal <> nil then
      FreeAndNil(frmPrincipal);

    if frmSplash <> nil then
      FreeAndNil(frmSplash);

    Application.Terminate;
  end
  else
  begin
    if flJaExecutando then
      ShowMessage('Já existe uma instância do aplicativo sendo executada. Reiniciar o computador pode resolver isso.')
    else
      ShowMessage('O arquivo de inicialização não foi encontrado. Contacte o suporte técnico.');
  end;
end.
