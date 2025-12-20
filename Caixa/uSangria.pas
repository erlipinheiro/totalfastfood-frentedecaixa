unit uSangria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, ACBRPosPrinter;

type
  TfrmSangria = class(TfrmFormPadrao)
    Label1: TLabel;
    Label2: TLabel;
    mMotivo: TMemo;
    edtValor: TEdit;
    procedure btnOKPadraoClick(Sender: TObject);
    procedure mMotivoEnter(Sender: TObject);
  private
    FValorSangria: Extended;
    procedure SetValorSangria(const Value: Extended);
    { Private declarations }
  public
    { Public declarations }
    property ValorSangria : Extended read FValorSangria write SetValorSangria;
  end;

var
  frmSangria: TfrmSangria;

implementation

{$R *.dfm}

uses uMensagem, DataModuleCaixa, uPrincipal, uClasses, uFuncoes;

procedure TfrmSangria.btnOKPadraoClick(Sender: TObject);
begin
  if TryStrToFloat(edtValor.Text, FValorSangria) then
  begin
    if fValorSangria <= 0 then
      frmMensagem.MostraMensagem('O valor da sangria deve ser maior que 0.')
    else
    begin
      if Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.SessaoCaixaSangrias', ['idEmpresa', 'idCaixa', 'idSessaoCaixa',
        'idUsuario', 'dhSangria', 'vlSangria', 'Motivo'],
        [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa,
         dmCaixa.Usuario.ID, Now, fValorSangria, mMotivo.Lines.Text]) > 0 then
      begin
        with frmPrincipal.impressora do
        begin
          if Ativo then
            Desativar;
          ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
          Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
          Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
          Ativar;
          //*** Imprimo o cabecalho
          PularLinhas(1);
          ImprimirLinha('<e><n>SANGRIA</e></n>');
          PularLinhas(1);
          ImprimirLinha(LeftPad('EMPRESA', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.NomeFantasia);
          ImprimirLinha(LeftPad('CNPJ', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.CNPJ);
          ImprimirLinha(LeftPad('USUARIO', ' ', 12) + ' : ' + dmCaixa.Usuario.Nome);
          ImprimirLinha(LeftPad('ESTACAO', ' ', 12) + ' : ' + dmCaixa.Estacao.Dados.Descricao);
          ImprimirLinha(LeftPad('DATA CAIXA', ' ', 12) + ' : ' + FormatDateTime('dd/MM/yy', dmCaixa.Estacao.Caixa.dhAberturaCaixa));
          ImprimirLinha(LeftPad('SESSAO CAIXA', ' ', 12) + ' : ' + IntToStr(dmCaixa.Estacao.Caixa.idSessaoCaixa));
          ImprimirLinha(LeftPad('ABERTURA', ' ', 12) + ' : ' + FormatDateTime('dd/MM/yy hh:NN:ss', dmCaixa.Estacao.Caixa.dhAberturaSessaoCaixa));
          PularLinhas(1);
          ImprimirLinha(StringOfChar('-', ColunasFonteNormal));
          ImprimirLinha('DATA SANGRIA : ' + FormatDateTime('dd/MM/yy HH:nn:SS', Now));
          PularLinhas(1);
          ImprimirLinha('<e>VALOR R$ ' + FloatToStr(fValorSangria) + '</e>');
          PularLinhas(1);
          ImprimirLinha(mMotivo.Lines.Text);
          PularLinhas(1);
          ImprimirLinha(StringOfChar('-', ColunasFonteNormal));

          PularLinhas(3);
          CortarPapel;
          Desativar;
        end;

        inherited;
      end
      else
        raise Exception.Create('Erro inserindo sangria.');
    end;
  end
  else
    frmMensagem.MostraMensagem('Verifique o valor digitado.')
end;

procedure TfrmSangria.mMotivoEnter(Sender: TObject);
begin
  inherited;

  mMotivo.SelectAll;
end;

procedure TfrmSangria.SetValorSangria(const Value: Extended);
begin
  FValorSangria := Value;
  edtValor.Text := FloatToStr(Value);
end;

end.
