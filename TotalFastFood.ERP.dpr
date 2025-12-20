program TotalFastFood.ERP;

uses
  EMemLeaks,
  EResLeaks,
  ESendMailSMTP,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogWinAPIStepsToReproduce,
  EDebugExports,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  ExceptionLog7,
  Dialogs,
  Vcl.Forms,
  System.SysUtils,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  DataModuleCaixa in 'DataModuleCaixa.pas' {dmCaixa: TDataModule},
  uImpressoras in 'Components\uImpressoras.pas',
  USplash in 'USplash.pas' {frmSplash},
  uFormPadrao in 'Padroes\uFormPadrao.pas' {frmFormPadrao},
  uClasses in 'Components\uClasses.pas',
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
  ACBrHTMLtoXML in 'Estoque\ACBrHTMLtoXML.pas',
  uAuditoriaEstoque in 'Estoque\uAuditoriaEstoque.pas' {frmAuditoriaEstoque},
  uAuditoriaEstoqueProdutos in 'Estoque\uAuditoriaEstoqueProdutos.pas' {frmAuditoriaEstoqueProdutos},
  uSelecionaProdutoFornecedor in 'Estoque\uSelecionaProdutoFornecedor.pas' {frmSelecionaProdutoFornecedor},
  uChecaInstancia in 'uChecaInstancia.pas',
  uSangria in 'Caixa\uSangria.pas' {frmSangria},
  uPedidoCompraItens in 'Estoque\uPedidoCompraItens.pas' {frmPedidoCompraItens},
  uPedidosCompra in 'Estoque\uPedidosCompra.pas' {frmPedidoCompra},
  uPedidoCompraDados in 'Estoque\uPedidoCompraDados.pas' {frmPedidoCompraDados},
  uFechamentoCaixa in 'Caixa\uFechamentoCaixa.pas' {frmFechamentoCaixa},
  uSelecionaCaixa in 'Caixa\uSelecionaCaixa.pas' {frmSelecionaCaixa},
  ACBrBAL,
  uConsultaCaixa in 'Caixa\uConsultaCaixa.pas' {frmConsultaCaixa},
  uRelatorios in 'Relatorios\uRelatorios.pas' {frmRelatorios},
  uDMRelatorios in 'Relatorios\uDMRelatorios.pas' {dmRelatorios: TDataModule},
  frmBobinaECF in 'Vendas\frmBobinaECF.pas' {fBobinaECF},
  uMenuFiscal in 'uMenuFiscal.pas' {frmMenuFiscal},
  uMensagensErro in 'uMensagensErro.pas',
  InterfaceEpsonNF in 'Components\InterfaceEpsonNF.pas',
  uConsultaVenda in 'Caixa\uConsultaVenda.pas' {frmConsultaVenda},
  uHardwareID in '..\Comum\uHardwareID.pas',
  uCadastraDelivery in 'Vendas\uCadastraDelivery.pas' {fCadastraCliente},
  uNotaitens in 'Estoque\uNotaitens.pas' {frmNotaItem},
  uNotas in 'Estoque\uNotas.pas' {frmNotas},
  uNotaVencimentos in 'Estoque\uNotaVencimentos.pas' {frmNotaVencimentos},
  udmNotas in 'DataModules\udmNotas.pas' {dmNotas: TDataModule},
  uNotaImportaNFE in '..\Comum\uNotaImportaNFE.pas' {frmNotaImportaNFE},
  uRelacionaProduto in 'Estoque\uRelacionaProduto.pas' {frmRelacionaProduto},
  uProcuraDelivery in 'Vendas\uProcuraDelivery.pas' {fProcuraDelivery},
  uSelecionaTipoVenda in 'Vendas\uSelecionaTipoVenda.pas' {frmSelecionaTipoVenda},
  uNotaDados in 'Estoque\uNotaDados.pas' {frmNotaDados},
  uConsultaProdutos in 'Caixa\uConsultaProdutos.pas' {frmConsultaProdutos},
  uPessoas in 'Cadastros\uPessoas.pas' {frmPessoas},
  uFormPessoas in 'Cadastros\uFormPessoas.pas' {frmFormCadastroPessoas},
  uDefinirSenha in 'Cadastros\uDefinirSenha.pas' {frmDefinirSenha},
  uPermissoes in 'Cadastros\uPermissoes.pas' {frmPermissoes},
  uObservacoesManuais in 'Vendas\uObservacoesManuais.pas' {frmObservacoesManuais},
  uSelecionaAreaProducao in 'Vendas\uSelecionaAreaProducao.pas' {frmSelecionaAreaProducao},
  uCupomDesconto in 'Vendas\uCupomDesconto.pas' {frmCupomDesconto},
  uRelacionamentos in 'Estoque\uRelacionamentos.pas' {frmRelacionamentos},
  BematechMP2032 in 'Components\BematechMP2032.pas',
  uControleVersaoDB in '..\Comum\uControleVersaoDB.pas',
  uVerificaVersaoEXE in 'uVerificaVersaoEXE.pas';

{$R *.res}

var
  idComputador : THardwareId;
  s : string;
  p : ^string;
  c : Cardinal;
  b : boolean;
  flLogou : boolean;
  eAuxiliar : TEstacao;
  uAuxiliar : TUsuario;
begin
  if not RestoreIfRunning(Application.Handle, 1) then
  begin
    Application.Initialize;

    if not ExisteAtualizacaoEXE then
    begin
      Application.MainFormOnTaskbar := True;
      frmSplash := TfrmSplash.Create(Nil);
      frmSplash.Show;
      frmSplash.AtualizaStatus('Criando formulário principal.');
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
  frmPrincipal.VersaoExe := frmSplash.VersaoEXE;
      frmSplash.AtualizaStatus('Criando formulário data module.');
      dmCaixa := TdmCaixa.Create(Nil);
      frmSplash.AtualizaStatus('Inicializando conexão com o banco de dados.');
      dmCaixa.ConectaAoBancoDeDados;

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
        with dmCaixa.qryAuxiliar do
        begin
          Close;
          SQL.Text := 'select ee.*, elp.idListaPreco, lp.Descricao as ListaPreco, elp.DataInicio, elp.DataFim, te.Descricao as TipoEstacao, ' +
                      'e.RazaoSocial, e.NomeFantasia, e.CNPJ, e.IE, e.iM, e.Endereco, e.Numero, e.Complemento, e.Bairro, e.Cidade, e.UF, e.CEP, e.Telefone1, e.ProconECF, ' +
                      'i.Descricao as NomeImpressora, i.FilaImpressao, i.idTipoImpressora, ti.NumeroColunas, ti.NumeroColunasCondensado, e.TaxaServico, ' +
                      'e.EmitirProdutosNaFita, e.EmitirProdutosNoFechamentoSessao, ee.Descricao, ee.Estornar, ee.Conferencia, ee.Balanca, ee.PortaSerialBalanca, ' +
                      'ee.ModeloBalanca, e.IdentificarGarcomConferencia, ee.NumeroViasPedidoSemFiscal, ee.AberturaAutomaticaGaveta, ee.AlturaLinhasProduto, ' +
                      'ee.TamanhoFonteLinhasProduto, ee.AlturaProdutos, ee.TamanhoProdutos, ee.TamanhoFonteProdutos, ee.ValorMinimoSenha, ' +
                      'ee.ImprimirCupomTotalizado, ee.SenhaManual, e.CodigoParceiroDOTZ, e.CodigoLojaDOTZ, e.CodigoPromocaoDOTZ, e.NomeArquivoDOTZ, ' +
                      'ee.QtdeDigitosSenha, e.ServidorFTP, e.UsuarioFTP, e.SenhaFTP, ee.EstornarPorSenha, ee.ImprimirPedido ' +
                      'from Vendas.EmpresaEstacoes ee ' +
                      'inner join Vendas.EmpresaListasPreco elp on ee.idEmpresa = elp.idEmpresa and ativa = 1 ' +
                      'inner join Contabil.Empresas e on e.idEmpresa = ee.idEmpresa ' +
                      'inner join Vendas.ListasPreco lp on elp.idListaPreco = lp.idListaPreco ' +
                      'inner join Vendas.TiposEstacao te on te.idTipoEstacao = ee.idTipoEstacao ' +
                      'inner join Configuracoes.Impressoras i on i.idEmpresa = ee.idEmpresa and i.idImpressora = ee.idImpressora ' +
                      'inner join Configuracoes.TiposImpressora ti on i.idEmpresa = ee.idEmpresa and ti.idTipoImpressora = i.idTipoImpressora ' +
                      'where idEstacao = ' + IntToStr(dmCaixa.idEstacao);
    //      Encryption.Fields := 'identificacao';

          Open;

          b := False;

          eAuxiliar := dmCaixa.Estacao;

          First;
          While not Eof do
          begin
            if Not (FieldByName('identificacao').IsNull) then
            begin
    //          if (FieldByName('identificacao').AsString = idComputador.HardwareIdMd5) then
    //          begin
                //*** Identifico a Empresa
                eAuxiliar.idEmpresa := FieldByName('idEmpresa').AsInteger;
                if (FieldByName('idListaPreco').IsNull) or (FieldByName('idListaPreco').AsInteger <= 0) then
                begin
                  raise exception.Create('Não existe lista de preço ativa para esta estação. Cadastre primeiro.');
                  Application.Terminate;
                end;
                eAuxiliar.idListaPreco := FieldByName('idListaPreco').AsInteger;
                eAuxiliar.ID := FieldByName('idEstacao').AsInteger;
                if trim(dmCaixa.NomeImpressora) = '' then
                begin
                  eAuxiliar.NomeImpressora := FieldByName('NomeImpressora').AsString;
                  eAuxiliar.ModeloImpressora := TModeloImpressora(FieldByName('idTipoImpressora').AsInteger);
                  eAuxiliar.NumeroColunas := FieldByName('NumeroColunas').AsInteger;
                  eAuxiliar.NumeroColunasCondensado := FieldByName('NumeroColunasCondensado').AsInteger;
                  eAuxiliar.FilaImpressao := FieldByName('FilaImpressao').AsString;
                end
                else
                begin
                  eAuxiliar.NomeImpressora := dmCaixa.NomeImpressora;
                  eAuxiliar.ModeloImpressora := TModeloImpressora(dmCaixa.ModeloImpressora);
                  eAuxiliar.NumeroColunas := dmCaixa.NumeroColunas;
                  eAuxiliar.NumeroColunasCondensado := dmCaixa.NumeroColunasCondensado;
                  eAuxiliar.FilaImpressao := dmCaixa.FilaImpressao;
                end;
                eAuxiliar.NumeroViasPedido := FieldByName('NumeroViasPedido').AsInteger;
                eAuxiliar.NumeroViasPedidoSemFiscal := FieldByName('NumeroViasPedidoSemFiscal').AsInteger;
                eAuxiliar.Identificacao := FieldByName('Identificacao').AsString;
                eAuxiliar.Descricao := FieldByName('Descricao').AsString;
                eAuxiliar.RazaoSocial := FieldByName('RazaoSocial').AsString;
                eAuxiliar.NomeFantasia := FieldByName('NomeFantasia').AsString;
                eAuxiliar.CNPJ := FieldByName('CNPJ').AsString;
                eAuxiliar.IE := FieldByName('IE').AsString;
                eAuxiliar.IM := FieldByName('IM').AsString;
                eAuxiliar.EnderecoCompleto := FieldByName('Endereco').AsString + ', ' +
                                      FieldByName('Numero').AsString + ', ' +
                                      FieldByName('Complemento').AsString + ', ' +
                                      FieldByName('Bairro').AsString + ', ' +
                                      FieldByName('Cidade').AsString + ', ' +
                                      FieldByName('UF').AsString + ', ' +
                                      FieldByName('CEP').AsString;
                eAuxiliar.Endereco := FieldByName('Endereco').AsString;
                eAuxiliar.Numero:= FieldByName('Numero').AsString;
                eAuxiliar.Complemento:= FieldByName('Complemento').AsString;
                eAuxiliar.Bairro := FieldByName('Bairro').AsString;
                eAuxiliar.Cidade := FieldByName('Cidade').AsString;
                eAuxiliar.UF := FieldByName('UF').AsString;
                eAuxiliar.CEP := FieldByName('CEP').AsString;
                eAuxiliar.ProconECF := FieldByName('ProconECF').AsString;
                eAuxiliar.DescricaoListaPreco := FieldByName('ListaPreco').AsString;
                eAuxiliar.TipoEstacao := TTipoEstacao(FieldByName('idTipoEstacao').AsInteger);
                eAuxiliar.TaxaServico := FieldByName('TaxaServico').AsBoolean;
                eAuxiliar.EmitirProdutosNaFita := FieldByName('EmitirProdutosNaFita').AsBoolean;
                eAuxiliar.EmitirProdutosNoFechamentoSessao := FieldByName('EmitirProdutosNoFechamentoSessao').AsBoolean;
                eAuxiliar.Estornar := FieldByName('Estornar').AsBoolean;
                eAuxiliar.Conferencia := FieldByName('Conferencia').AsBoolean;
                eAuxiliar.Balanca := FieldByName('Balanca').AsBoolean;
                eAuxiliar.PortaSerialBalanca := FieldByName('PortaSerialBalanca').AsInteger;
                eAuxiliar.IdentificarGarcomConferencia := FieldByName('IdentificarGarcomConferencia').AsBoolean;
                eAuxiliar.ModeloBalanca := TACBrBALModelo(FieldByName('ModeloBalanca').AsInteger);
                eAuxiliar.AberturaAutomaticaGaveta := FieldByName('AberturaAutomaticaGaveta').AsBoolean;
                eAuxiliar.ImprimirCupomTotalizado := FieldByName('ImprimirCupomTotalizado').AsBoolean;
                eAuxiliar.SenhaManual := FieldByName('SenhaManual').AsBoolean;
                eAuxiliar.AlturaLinhasProduto := FieldByName('AlturaLinhasProduto').AsInteger;
                eAuxiliar.TamanhoFonteLinhasProduto := FieldByName('TamanhoFonteLinhasProduto').AsInteger;
                eAuxiliar.AlturaProdutos := FieldByName('AlturaProdutos').AsInteger;
                eAuxiliar.TamanhoProdutos := FieldByName('TamanhoProdutos').AsInteger;
                eAuxiliar.TamanhoFonteProdutos := FieldByName('TamanhoFonteProdutos').AsInteger;
                if FieldByName('ValorMinimoSenha').IsNull then
                  eAuxiliar.ValorMinimoSenha := 0
                else
                  eAuxiliar.ValorMinimoSenha := FieldByName('ValorMinimoSenha').AsInteger;

                eAuxiliar.CodigoParceiroDOTZ := FieldByName('CodigoParceiroDOTZ').AsInteger;
                eAuxiliar.CodigoLojaDOTZ := FieldByName('CodigoLojaDOTZ').AsString;
                eAuxiliar.CodigoPromocaoDOTZ := FieldByName('CodigoPromocaoDOTZ').AsInteger;
                eAuxiliar.NomeArquivoDOTZ := FieldByName('NomeArquivoDOTZ').AsString;
                eAuxiliar.QtdeDigitosSenha := FieldByName('QtdeDigitosSenha').AsInteger;
                eAuxiliar.ServidorFTP := FieldByName('ServidorFTP').AsString;
                eAuxiliar.UsuarioFTP := FieldByName('UsuarioFTP').AsString;
                eAuxiliar.SenhaFTP := FieldByName('SenhaFTP').AsString;
                eAuxiliar.EstornarPorSenha := FieldByName('EstornarPorSenha').asBoolean;
                eAuxiliar.ImprimirPedido := FieldByName('ImprimirPedido').asBoolean;

                if trim(eAuxiliar.FilaImpressao) = '' then
                begin
                  raise exception.Create('Não existe fila de impressão para esta estação. Cadastre primeiro.');
                  Application.Terminate;
                end;

                case eAuxiliar.TipoEstacao of
                  teCaixaBalcao   : frmPrincipal.edtTipoEstacao.Text := 'Venda balcão';
                  teCaixaMesa     : frmPrincipal.edtTipoEstacao.Text := 'Venda mesa';
                  teCaixaCartao   : frmPrincipal.edtTipoEstacao.Text := 'Venda cartão';
                  teCaixaDelivery : frmPrincipal.edtTipoEstacao.Text := 'Venda delivery';
                  teLancamento    : frmPrincipal.edtTipoEstacao.Text := 'Lancamento';
                end;

                frmPrincipal.edtEmpresa.Text := ' ' + eAuxiliar.RazaoSocial;
                frmPrincipal.edtCNPJ.Text := ' ' + eAuxiliar.CNPJ;
                frmPrincipal.edtNomeEstacao.Text := ' ' + eAuxiliar.Descricao;
                frmPrincipal.edtListaPreco.Text := ' ' + eAuxiliar.DescricaoListaPreco;

    //          end;
            end;

            Next;
          end;

          Close;
        end;
      except
        on e : exception do
        begin
          ShowMessage('Erro buscando dados da estação : ' + sLineBreak + e.Message);
          raise Exception.Create('Erro buscando dados da estação : ' + sLineBreak + e.Message);
        end;
      end;

  //    if Assigned(idComputador) then
  //      FreeAndNil(idComputador);

      if eAuxiliar.ID = 0 then
      begin
  //      raise exception.Create('Estação não identificada. Contacte o suporte técnico.');
        ShowMessage('Estação não identificada.' + sLineBreak + 'O sistema não pode inicializar.' + sLineBreak + 'Contacte o suporte técnico.');
        Application.Terminate;
      end
      else
      begin
        dmCaixa.Estacao := eAuxiliar;

        //*** Faço o login do usuário
        frmSenha := TfrmSenha.Create(Nil);
        //*** if = mrOK ....
        flLogou := frmSenha.ShowModal = 1;
        if flLogou then
        begin
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

        dmCaixa.AtualizaPermissoes;

        FreeAndNil(frmSenha);

        if flLogou then
        begin
          dmCaixa.AbreDataSets;
          //          frmPrincipal.AtualizaPermissoes;

          //    HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics
          Application.Run;
        end
        else
          dmCaixa.Free
      end;
    end;
  end
  else
    Application.Terminate;
end.
