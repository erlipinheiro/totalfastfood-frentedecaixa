unit uAtualizaBD;

interface

uses
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Data.DB, System.classes, Firedac.Stan.Error,
  System.SysUtils, FireDAC.Comp.Script;

type
  TTipoBancoDados = (bdNenhum, bdFrenteDeCaixa, bdRetaguarda, bdReplicador, bdMonitorNFE);
type TAtualizaBD = class
  private
    FBD: TFDConnection;
    FQry : TFDQuery;
    FScript : TFDScript;
    FVersaoBDFrenteDeCaixa: Integer;
    FVersaoBDRetaguarda: Integer;
    FVersaoBDReplicador: Integer;
    FVersaoBDMonitorNFE: Integer;
    procedure SetBD(const Value: TFDConnection);
    procedure InsereCampo(Const ATabela : string; Const ACampo : string; Const AFieldType : TFieldType;
      const AValor : Variant; const ATamanho : Variant; Const AValorPadrao : Variant);
    procedure SetVersaoBDFrenteDeCaixa(const Value: Integer);
    procedure SetVersaoBDMonitorNFE(const Value: Integer);
    procedure SetVersaoBDReplicador(const Value: Integer);
    procedure SetVersaoBDRetaguarda(const Value: Integer);
public
  constructor Create(AOwner: TComponent);
  destructor Destroy;

  procedure AtualizaBancoDeDados(Const ATipoBancoDados : TTipoBancoDados; Const AVersao : integer; Const AScript : TStringList);
  property BD : TFDConnection read FBD write SetBD;
  property VersaoBDFrenteDeCaixa : Integer read FVersaoBDFrenteDeCaixa write SetVersaoBDFrenteDeCaixa;
  property VersaoBDRetaguarda : Integer read FVersaoBDRetaguarda write SetVersaoBDRetaguarda;
  property VersaoBDReplicador : Integer read FVersaoBDReplicador write SetVersaoBDReplicador;
  property VersaoBDMonitorNFE : Integer read FVersaoBDMonitorNFE write SetVersaoBDMonitorNFE;
end;

implementation

const
  cVersaoBanco = 2;


{ TAtualizaBD }

procedure TAtualizaBD.AtualizaBancoDeDados(Const ATipoBancoDados : TTipoBancoDados; Const AVersao : integer; Const AScript : TStringList);
var
  flAtualizar : Boolean;
begin
  flAtualizar := False;

  case ATipoBancoDados of
    bdFrenteDeCaixa: flAtualizar := AVersao  < FVersaoBDFrenteDeCaixa;
    bdRetaguarda:  flAtualizar := AVersao  < FVersaoBDRetaguarda;
    bdReplicador:  flAtualizar := AVersao  < FVersaoBDReplicador;
    bdMonitorNFE:  flAtualizar := AVersao  < FVersaoBDMonitorNFE;
  end;

  if flAtualizar then
    FScript.ExecuteScript(AScript);
end;

constructor TAtualizaBD.Create(AOwner: TComponent);
var
  i : integer;
  function VerificaTabelaConfiguracao : integer;
  begin
    try
      FQry.Open('select  from Configuracoes.Versoes where 0 = 1');
      Result := 1;
    except
      on E: EFDDBEngineException do
        if E.Kind = ekObjNotExists then
          Result := -1
        else
          raise;
    end;
  end;

  procedure CriaTabelaVersoes;
  begin
    FBD.ExecSQL('CREATE TABLE [Configuracoes].[Versoes]( ' +
        '[VersaoBDFrenteDeCaixa] [int] NULL, ' +
        '[VersaoBDRetaguarda] [int] NULL, ' +
        '[VersaoBDReplicador] [int] NULL, ' +
        '[VersaoBDMonitorNFE] [int] NULL ' +
      ') ON [PRIMARY]');
    FBD.ExecSQL('update Configuracoes.Versoes set VersaoBDFrenteDeCaixa = 0, VersaoBDRetaguarda = 0, VersaoBDReplicador = 0, VersaoBDMonitorNFE = 0');
  end;

  procedure CarregaVersoes;
  begin
    with FQry do
    begin
      Close;
      SQL.Text := 'select * from Configuracoes.Versoes';
      Open;

      if RecordCount > 0 then
      begin
        FVersaoBDFrenteDeCaixa := FieldByName('VersaoBDFrenteDeCaixa').AsInteger;
        FVersaoBDRetaguarda    := FieldByName('VersaoBDRetaguarda').AsInteger;
        FVersaoBDReplicador    := FieldByName('VersaoBDReplicador').AsInteger;
        FVersaoBDMonitorNFE    := FieldByName('VersaoBDMonitorNFE').AsInteger;
      end
      else
        raise Exception.Create('Erro buscando dados das versões dos bancos de dados');

      Close;
    end;
  end;

begin
  FQry := TFDQuery.Create(AOwner);
  FQry.Connection := FBD;

  FScript := TFDScript.Create(AOwner);
  FScript.Connection := FBD;

  i := VerificaTabelaConfiguracao;

  FVersaoBDFrenteDeCaixa := 0;
  FVersaoBDRetaguarda    := 0;
  FVersaoBDReplicador    := 0;
  FVersaoBDMonitorNFE    := 0;

  if i = -1 then
    CriaTabelaVersoes
  else
    CarregaVersoes;
end;

destructor TAtualizaBD.Destroy;
begin
  if Assigned(FQry) then
  begin
    FQry.Close;
    FreeAndNil(FQry);
  end;
end;

procedure TAtualizaBD.InsereCampo(const ATabela, ACampo: string;
  const AFieldType: TFieldType; const AValor, ATamanho, AValorPadrao: Variant);
begin
  with TFDQuery.Create(Nil) do
  begin
    Connection := FBD;
  end;
end;

procedure TAtualizaBD.SetBD(const Value: TFDConnection);
begin
  FBD := Value;
end;

procedure TAtualizaBD.SetVersaoBDFrenteDeCaixa(const Value: Integer);
begin
  FVersaoBDFrenteDeCaixa := Value;
end;

procedure TAtualizaBD.SetVersaoBDMonitorNFE(const Value: Integer);
begin
  FVersaoBDMonitorNFE := Value;
end;

procedure TAtualizaBD.SetVersaoBDReplicador(const Value: Integer);
begin
  FVersaoBDReplicador := Value;
end;

procedure TAtualizaBD.SetVersaoBDRetaguarda(const Value: Integer);
begin
  FVersaoBDRetaguarda := Value;
end;

end.



