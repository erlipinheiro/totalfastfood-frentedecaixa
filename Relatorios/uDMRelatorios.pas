unit uDMRelatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxExportPDF, frxExportHTML,
  frxExportRTF, frxExportImage, frxExportText, frxClass, frxExportCSV, frxDBSet;

type
  TdmRelatorios = class(TDataModule)
    dsCMVEstoque: TDataSource;
    dsContagemFinal: TDataSource;
    dsContagemInicial: TDataSource;
    dsPlanoContas: TDataSource;
    frxCMVEstoque: TfrxReport;
    frxComprasPorFornecedor: TfrxReport;
    frxComprasPorPlanoContas: TfrxReport;
    frxdbCMVEstoque: TfrxDBDataset;
    frxdbComprasPorFornecedor: TfrxDBDataset;
    frxdbComprasPorPlanoContas: TfrxDBDataset;
    frxdbComprasPorProduto: TfrxDBDataset;
    frxdbDRE: TfrxDBDataset;
    frxdbGastosDiarios: TfrxDBDataset;
    frxdbGastosEmDinheiro: TfrxDBDataset;
    frxdbPlanoContas: TfrxDBDataset;
    frxdbValorEstoque: TfrxDBDataset;
    frxDRE: TfrxReport;
    frxGastosDiarios: TfrxReport;
    frxGastosEmDinheiro: TfrxReport;
    frxValorEstoque: TfrxReport;
    qryCMVEstoque: TFDQuery;
    qryCMVEstoqueidProduto: TIntegerField;
    qryCMVEstoquecdProduto: TStringField;
    qryCMVEstoqueDescricao: TStringField;
    qryCMVEstoqueEstoqueInicial: TFloatField;
    qryCMVEstoqueEntrada: TFloatField;
    qryCMVEstoqueContagemFinal: TFloatField;
    qryCMVEstoqueSubTotal: TFloatField;
    qryCMVEstoqueUso: TFloatField;
    qryCMVEstoqueVendas: TFloatField;
    qryCMVEstoqueColaboradores: TFloatField;
    qryCMVEstoqueDiferenca: TFloatField;
    qryCMVEstoqueDiferencaPercentual: TFloatField;
    qryCMVEstoqueValorMedio: TFloatField;
    qryCMVEstoqueUsoEmReais: TFloatField;
    qryCMVEstoqueVendasEmReais: TFloatField;
    qryCMVEstoqueDiferencaEmReais: TFloatField;
    qryCMVEstoqueDiferencaEmReaisPercentual: TFloatField;
    qryComprasPorFornecedor: TFDQuery;
    qryComprasPorFornecedorRazaoSocial: TStringField;
    qryComprasPorFornecedorNomeFantasia: TStringField;
    qryComprasPorFornecedorTotalCompras: TCurrencyField;
    qryComprasPorPlanoContas: TFDQuery;
    qryComprasPorProduto: TFDQuery;
    qryAuditoriaFinal: TFDQuery;
    qryAuditoriaFinalidEmpresa: TIntegerField;
    qryAuditoriaFinalidContagem: TIntegerField;
    qryAuditoriaFinalidPessoaInicio: TIntegerField;
    qryAuditoriaFinalidPessoaFim: TIntegerField;
    qryAuditoriaFinalDataInicio: TDateTimeField;
    qryAuditoriaFinalDataFim: TDateTimeField;
    qryAuditoriaFinalStatus: TIntegerField;
    qryAuditoriaFinalPercentualAcerto: TFloatField;
    qryAuditoriaFinalDataEnvioCentral: TDateTimeField;
    qryAuditoriaFinalflEnviadoCentral: TBooleanField;
    qryAuditoriaInicial: TFDQuery;
    qryAuditoriaInicialidEmpresa: TIntegerField;
    qryAuditoriaInicialidContagem: TIntegerField;
    qryAuditoriaInicialidPessoaInicio: TIntegerField;
    qryAuditoriaInicialidPessoaFim: TIntegerField;
    qryAuditoriaInicialDataInicio: TDateTimeField;
    qryAuditoriaInicialDataFim: TDateTimeField;
    qryAuditoriaInicialStatus: TIntegerField;
    qryAuditoriaInicialPercentualAcerto: TFloatField;
    qryAuditoriaInicialDataEnvioCentral: TDateTimeField;
    qryAuditoriaInicialflEnviadoCentral: TBooleanField;
    qryDRE: TFDQuery;
    qryDRETotalEmVendas: TCurrencyField;
    qryDRECMV: TFloatField;
    qryDREImpostos: TFloatField;
    qryDRERoyalties: TFloatField;
    qryDREMarketing: TFloatField;
    qryDRECartao: TFloatField;
    qryDRECMVPercentual: TFloatField;
    qryDREDespesasOperacionais2: TFloatField;
    qryDREDespesasOperacionaisPercentual: TFloatField;
    qryDREPessoal: TFloatField;
    qryDREPessoalPercentual: TFloatField;
    qryDREServicosEssenciais: TFloatField;
    qryDREServicosEssenciaisPercentual: TFloatField;
    qryDREDemaisDespesas: TFloatField;
    qryDREDemaisDespesasPercentual: TFloatField;
    qryDREOcupacao: TFloatField;
    qryDREOcupacaoPercentual: TFloatField;
    qryDRESalarios: TFloatField;
    qryDRESalariosPercentual: TFloatField;
    qryDREHorasExtras: TFloatField;
    qryDREHorasExtrasPercentual: TFloatField;
    qryDREFerias13: TFloatField;
    qryDREFerias13Percentual: TFloatField;
    qryDREAlimentacao: TFloatField;
    qryDREAlimentacaoPercentual: TFloatField;
    qryDREFGTS: TFloatField;
    qryDREFGTSPercentual: TFloatField;
    qryDREValeTransporte: TFloatField;
    qryDREValeTransportePercentual: TFloatField;
    qryDRETelefone: TFloatField;
    qryDRETelefonePercentual: TFloatField;
    qryDREEnergia: TFloatField;
    qryDREEnergiaPercentual: TFloatField;
    qryDREAgua: TFloatField;
    qryDREAguaPercentual: TFloatField;
    qryDREMaterialLimpeza: TFloatField;
    qryDREMaterialLimpezaPercentual: TFloatField;
    qryDREManutencao: TFloatField;
    qryDREManutencaoPercentual: TFloatField;
    qryDRETerceiros: TFloatField;
    qryDRETerceirosPercentual: TFloatField;
    qryDREOutrasDespesas: TFloatField;
    qryDREOutrasDespesasPercentual: TFloatField;
    qryDREAluguel: TFloatField;
    qryDREAluguelPercentual: TFloatField;
    qryDRECondominio: TFloatField;
    qryDRECondominioPercentual: TFloatField;
    qryDREFundoPromocao: TFloatField;
    qryDREFundoPromocaoPercentual: TFloatField;
    qryDREIPTU: TFloatField;
    qryDREIPTUPercentual: TFloatField;
    qryDREGas: TFloatField;
    qryDREGasPercentual: TFloatField;
    qryGastosDiarios: TFDQuery;
    qryGastosDiariosDataEmissao: TDateTimeField;
    qryGastosDiariosNomeFantasia: TStringField;
    qryGastosDiariosxProd: TStringField;
    qryGastosDiariosqcom: TFloatField;
    qryGastosDiariosvuncom: TCurrencyField;
    qryGastosDiariosvProd: TCurrencyField;
    qryGastosDiariosidNota: TIntegerField;
    qryGastosDiariosValorTotal: TCurrencyField;
    qryGastosDiariosDescricao: TStringField;
    qryGastosEmDinheiro: TFDQuery;
    qryGastosEmDinheiroDataEmissao: TDateTimeField;
    qryGastosEmDinheiroNomeFantasia: TStringField;
    qryGastosEmDinheiroValorTotal: TCurrencyField;
    qryPlanoContas: TFDQuery;
    qryPlanoContasidPlanoContas: TIntegerField;
    qryPlanoContasidPlanoContasPai: TIntegerField;
    qryValorEstoque: TFDQuery;
    qryValorEstoquecdProduto: TStringField;
    qryValorEstoqueDescricao: TStringField;
    qryValorEstoqueValorUnitario: TFloatField;
    qryValorEstoqueQtde: TFloatField;
    qryAuditoriaInicialRazaoSocial: TStringField;
    qryAuditoriaInicialTotal: TCurrencyField;
    qryAuditoriaFinalRazaoSocial: TStringField;
    qryAuditoriaFinalTotal: TCurrencyField;
    dsPessoas: TDataSource;
    qryPessoas: TFDQuery;
    frxReport1: TfrxReport;
    qryNotas: TFDQuery;
    frxdbNotas: TfrxDBDataset;
    qryNotasidEmpresa: TIntegerField;
    qryNotasidPessoa: TIntegerField;
    qryNotasidNota: TIntegerField;
    qryNotasNumeroNota: TStringField;
    qryNotasChaveNFE: TStringField;
    qryNotasidTipoNota: TIntegerField;
    qryNotasDataEmissao: TDateTimeField;
    qryNotasDataEntradaEstoque: TDateTimeField;
    qryNotasValorTotal: TCurrencyField;
    qryNotasEntradaSaida: TStringField;
    qryNotasDataEnvioCentral: TDateTimeField;
    qryNotasflEnviadoCentral: TBooleanField;
    dsComprasPorFornecedor: TDataSource;
    qryComprasPorFornecedoridPessoa: TIntegerField;
    frxVendasResumido: TfrxReport;
    frxDBVendasResumido: TfrxDBDataset;
    qryVendasResumido: TFDQuery;
    qryVendasResumidoRazaoSocial: TStringField;
    qryVendasResumidoDataFim: TDateTimeField;
    qryVendasResumidoidMesaCartaoSenha: TIntegerField;
    qryVendasResumidoValor: TCurrencyField;
    qryVendasResumidoNumeroCupom: TStringField;
    dsConvenios: TDataSource;
    qryConvenios: TFDQuery;
    qryConveniosidConvenio: TIntegerField;
    qryConveniosDescricao: TStringField;
    qryConveniosDataInicio: TDateTimeField;
    dsFormasPagamento: TDataSource;
    qryFormasPagamento: TFDQuery;
    qryFormasPagamentoidFormaPagamento: TIntegerField;
    qryFormasPagamentoDescricao: TStringField;
    qryFormasPagamentoDescricaoTipoPagamento: TStringField;
    frxCMVComCompras: TfrxReport;
    qryComprasPorProdutoDescricao: TStringField;
    qryComprasPorProdutocProd: TStringField;
    qryComprasPorProdutoxProd: TStringField;
    qryComprasPorProdutoqCom: TFloatField;
    qryComprasPorProdutouCom: TStringField;
    qryComprasPorProdutovunCom: TCurrencyField;
    qryComprasPorProdutoidProduto: TIntegerField;
    qryComprasPorProdutoSigla: TStringField;
    qryComprasPorProdutoQuantidadeRelacionada: TFloatField;
    qryComprasPorProdutoidNota: TIntegerField;
    qryComprasPorProdutoNumeroNota: TStringField;
    qryComprasPorProdutoDataEntradaEstoque: TDateTimeField;
    qryComprasPorProdutoValorTotal: TCurrencyField;
    qryComprasPorProdutoNomeFantasia: TStringField;
    qryComprasPorProdutoidPessoa: TIntegerField;
    qryComprasPorProdutoidItem: TIntegerField;
    qryComprasPorProdutoQuantidadeEntradaEstoque: TFloatField;
    FDQuery1: TFDQuery;
    qryComprasPorPlanoContascdProduto: TStringField;
    qryComprasPorPlanoContasidPlanoContas: TIntegerField;
    qryComprasPorPlanoContasDescricao: TStringField;
    qryComprasPorPlanoContasUnidade: TStringField;
    qryComprasPorPlanoContasTotalEntrada: TFloatField;
    qryComprasPorPlanoContasQtdeTotal: TFloatField;
    qryComprasPorPlanoContasPrecoMedio: TCurrencyField;
    qryComprasPorPlanoContasValorTotal: TFloatField;
    dsComprasPorPlanoContas: TDataSource;
    qryPlanoContasDescricao: TStringField;
    qryPlanoContasCaminho: TStringField;
    frxCSVExport1: TfrxCSVExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxGIFExport1: TfrxGIFExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxBMPExport1: TfrxBMPExport;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    procedure frxValorEstoqueGetValue(const VarName: string;
      var Value: Variant);
    procedure frxCMVEstoqueGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
    function AbreQueryPessoas (Const sTipoPessoa : string) : integer;
  end;

var
  dmRelatorios: TdmRelatorios;

implementation


uses DataModuleCaixa, uRelatorios;

{$R *.dfm}

function TdmRelatorios.AbreQueryPessoas(const sTipoPessoa: string): integer;
begin
  result := 0;
  with qryPessoas do
  begin
    try
      Close;
      SQL.Clear;
      SQL.Text := Format('select ep.idEmpresa, ep.idPessoa, p.RazaoSocial, p.NomeFantasia, p.CNPJ, p.NomeMunicipio from Contabil.EmpresaPessoas ep ' +
                  'inner join Contabil.Pessoas p on ep.idPessoa = p.idPessoa ' +
                  'where ep.idEmpresa = %d and ep.idPessoa in (select idPessoa from Contabil.EmpresaPessoaTipos where idTipoPessoa = %s) ' +
                  'order by p.RazaoSocial ', [dmCaixa.Estacao.idEmpresa, stipoPessoa]);
      Open;

      result := RecordCount;
    except
      on e : exception do
      begin
        result := -1;
        raise Exception.Create('Buscando dados das pessoas. ' + sLineBreak + SQL.Text + sLineBreak + e.Message);
      end;
    end;
  end;
end;

procedure TdmRelatorios.frxCMVEstoqueGetValue(const VarName: string;
  var Value: Variant);
begin
  inherited;

  if UpperCase(VarName) = 'INICIO' then
    Value := DateToStr(frmRelatorios.edtDataInicial.DateFirst)
  else if UpperCase(VarName) = 'FIM' then
    Value := DateToStr(frmRelatorios.edtDataFinal.DateFirst)
  else if UpperCase(VarName) = 'FATURAMENTO' then
  begin
    with dmCaixa.qryTotalVendaPeriodo do
    begin
      Close;

      ParamByName('datainicial').Value := frmRelatorios.edtDataInicial.DateFirst;
      ParamByName('datafinal').Value := frmRelatorios.edtDataFinal.DateFirst;
      ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;

      Open;

      if RecordCount <= 0 then
        raise Exception.Create('Erro buscando total em vendas no período.')
      else
        Value := Fields.Fields[0].AsCurrency;

      Close;
    end;
  end;

end;

procedure TdmRelatorios.frxValorEstoqueGetValue(const VarName: string;
  var Value: Variant);
begin
  if UpperCase(VarName) = 'DATA' then
    Value := dmRelatorios.qryAuditoriaInicialDataInicio.AsString
  else if UpperCase(VarName) = 'CODIGO' then
    Value := dmRelatorios.qryAuditoriaInicialidContagem.AsString;
end;

end.

