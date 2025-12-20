unit udmNotas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmNotas = class(TDataModule)
    qryPessoas: TFDQuery;
    qryPessoasidPessoa: TIntegerField;
    qryPessoasRazaoSocial: TStringField;
    qryPessoasNomeFantasia: TStringField;
    dsPessoas: TDataSource;
    qryTiposNota: TFDQuery;
    dsTiposNota: TDataSource;
    qryTiposNotaidTipoNota: TIntegerField;
    qryTiposNotaDescricao: TStringField;
    qryTiposPagamento: TFDQuery;
    dsTiposPagamento: TDataSource;
    qryTiposPagamentoidTipoPagamento: TIntegerField;
    qryTiposPagamentoDescricao: TStringField;
    qryTiposPagamentoIndiceECF: TStringField;
    qryItens: TFDQuery;
    qryItensidEmpresa: TIntegerField;
    qryItensidPessoa: TIntegerField;
    qryItensidNota: TIntegerField;
    qryItensidItem: TIntegerField;
    qryItensidItemNFE: TIntegerField;
    qryItenscProd: TStringField;
    qryItensnItem: TIntegerField;
    qryItenscEAN: TStringField;
    qryItensxProd: TStringField;
    qryItensNCM: TStringField;
    qryItensCFOP: TStringField;
    qryItensuCom: TStringField;
    qryItensqCom: TFloatField;
    qryItensvunCom: TCurrencyField;
    qryItensvProd: TCurrencyField;
    qryItenscEANTrib: TStringField;
    qryItensuTrib: TStringField;
    qryItensqTrib: TFloatField;
    qryItensvunTrib: TCurrencyField;
    qryItensvFrete: TCurrencyField;
    qryItensvSeg: TCurrencyField;
    qryItensvDesc: TCurrencyField;
    qryItensvOutro: TCurrencyField;
    qryItensIndTot: TIntegerField;
    qryItensxPed: TStringField;
    qryItensnItemPed: TIntegerField;
    qryItensDataEnvioCentral: TDateTimeField;
    qryItensflEnviadoCentral: TBooleanField;
    dsItens: TDataSource;
    qryVencimentos: TFDQuery;
    qryVencimentosidEmpresa: TIntegerField;
    qryVencimentosidPessoa: TIntegerField;
    qryVencimentosidNota: TIntegerField;
    qryVencimentosidVencimento: TIntegerField;
    qryVencimentosidTipoVencimento: TIntegerField;
    qryVencimentosCodigo: TStringField;
    qryVencimentosValorAPagar: TCurrencyField;
    qryVencimentosDataVencimento: TDateTimeField;
    qryVencimentosDataEnvioCentral: TDateTimeField;
    qryVencimentosflEnviadoCentral: TBooleanField;
    dsVencimentos: TDataSource;
    qryPessoaProdutos: TFDQuery;
    qryFormasPagamento: TFDQuery;
    dsFormasPagamento: TDataSource;
    strngfldVencimentosDescricaoFormaPagamento: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmNotas: TdmNotas;

implementation

uses DataModuleCaixa;

{$R *.dfm}

procedure TdmNotas.DataModuleCreate(Sender: TObject);
begin
  qryTiposNota.Open;
  qryTiposPagamento.Open;
end;

end.
