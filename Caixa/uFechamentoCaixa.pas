unit uFechamentoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.StdCtrls, Vcl.Mask,
  
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Constantes;

type
  TfrmFechamentoCaixa = class(TfrmFormPadrao)
    Label1: TLabel;
    edtValorDeposito: TEdit;
    edtValorTroco: TEdit;
    Label2: TLabel;
    procedure btnOKPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorDepositoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorDepositoChange(Sender: TObject);
    procedure edtValorTrocoChange(Sender: TObject);
  private
    FValorTroco: Extended;
    FValorDeposito: Extended;
    procedure SetValorDeposito(const Value: Extended);
    procedure SetValorTroco(const Value: Extended);
    { Private declarations }
  public
    { Public declarations }
    property ValorDeposito : Extended read FValorDeposito write SetValorDeposito;
    property ValorTroco : Extended read FValorTroco write SetValorTroco;
  end;

var
  frmFechamentoCaixa: TfrmFechamentoCaixa;

implementation

{$R *.dfm}

uses
  uMensagem, DataModuleCaixa, uSenha, uPrincipal, uFuncoes;

procedure TfrmFechamentoCaixa.btnOKPadraoClick(Sender: TObject);
var
  EstacaoAuxiliar : TEstacao;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select idSessaoCaixa from Vendas.SessoesCaixa where (idEmpresa = %d) and (idCaixa = %d) and idUsuarioFechamento is null',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa]);
    Open;

    if RecordCount > 0 then
      frmMensagem.MostraMensagem('Existe sessão de caixa em aberto. Feche primeiro.')
    else
    begin
      frmSenha := TfrmSenha.Create(Self);
      if frmSenha.ShowModal = mrOk then
      begin
        Close;
        if Atualizar(dmCaixa.dbTotalFastFood, 'Vendas.Caixas', ['idEmpresa','idCaixa'], [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa],
          ['idUsuarioFechamento', 'dhFechamento', 'vlDeposito', 'vlTroco'],
          [dmCaixa.Usuario.id, Now, fValorDeposito, fValorTroco]) > 0 then
        begin
          //*** Sai a fita
          dmCaixa.ImprimeFita(dmCaixa.Estacao.Caixa.idCaixa, 0, 0, dmCaixa.Estacao.EmitirProdutosNaFita, True, True);

          EstacaoAuxiliar := dmCaixa.Estacao;
          EstacaoAuxiliar.Caixa.idCaixa := -1;
          EstacaoAuxiliar.Caixa.idSessaoCaixa := -1;
          EstacaoAuxiliar.Caixa.dhAberturaCaixa := 0;
          EstacaoAuxiliar.Caixa.dhAberturaSessaoCaixa := 0;
          dmCaixa.Estacao := EstacaoAuxiliar;

          frmPrincipal.AtualizaBotoes;

          inherited;
        end
        else
          frmMensagem.MostraMensagem('O caixa geral não foi fechado. Verifique.');
      end;
      frmSenha.Free;
    end;
  end;
end;

procedure TfrmFechamentoCaixa.edtValorDepositoChange(Sender: TObject);
begin
  inherited;

  TryStrToFloat(edtValorDeposito.Text, FValorDeposito);
end;

procedure TfrmFechamentoCaixa.edtValorDepositoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in [#8, '0'..'9', '-', FormatSettings.DecimalSeparator]) then
  begin
    ShowMessage('Caracter inválido: ' + Key);
    Key := #0;
  end
  else if ((Key = FormatSettings.DecimalSeparator) or (Key = '-')) and (Pos(Key, (Sender as TEdit).Text) > 0) then
  begin
    ShowMessage('Caracter inválido: dois ' + Key);
    Key := #0;
  end
  else if (Key = '-') and ((Sender as TEdit).SelStart <> 0) then
  begin
    ShowMessage('Somente números são aceitos: ' + Key);
    Key := #0;
  end;

end;

procedure TfrmFechamentoCaixa.edtValorTrocoChange(Sender: TObject);
begin
  inherited;

  TryStrToFloat(edtValorTroco.Text, FValorTroco);
end;

procedure TfrmFechamentoCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  FValorTroco    := 0;
  FValorDeposito := 0;
end;

procedure TfrmFechamentoCaixa.SetValorDeposito(const Value: Extended);
begin
  FValorDeposito := Value;
end;

procedure TfrmFechamentoCaixa.SetValorTroco(const Value: Extended);
begin
  FValorTroco := Value;
end;

end.












