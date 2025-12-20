unit uPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, ACBrBase, ACBrValidador, System.Math, System.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask;

type
  TfrmPagamento = class(TForm)
    pnlTotalPagar: TPanel;
    edtTotalPagar: TPanel;
    qryContaPagamentos: TFDQuery;
    dsContasPagamentos: TDataSource;
    pnlValorPago: TPanel;
    edtValorPago: TPanel;
    pnlTroco: TPanel;
    edtTroco: TPanel;
    pnlValorRestante: TPanel;
    edtValorRestante: TPanel;
    dbgrdPagamentos: TDBGrid;
    btnFinalizar: TPanel;
    btnCancelar: TPanel;
    btnNovoPagamento: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    lblRazaoSocial: TLabel;
    edtNome: TEdit;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    rgTipoDocumento: TRadioGroup;
    edtDocumento: TMaskEdit;
    Panel2: TPanel;
    edtDesconto: TPanel;
    ACBrValidador1: TACBrValidador;
    chkEmitirDFE: TCheckBox;
    chkEmitirViaCliente: TCheckBox;
    chkEmitirPedido: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNovoPagamentoClick(Sender: TObject);
    procedure dbgrdPagamentosDblClick(Sender: TObject);
    procedure rgTipoDocumentoClick(Sender: TObject);
  private
    { Private declarations }
    FValorAPagar : real;
    FValorPago : real;
    FidConvenio: integer;
    FidPessoa: integer;
    FValorDesconto: real;
    FValorTroco : real;
    FidUsuarioDesconto: integer;
    Function BuscaPagamento : boolean;
    procedure setValorAPagar(const Value : real);
    procedure setValorPago(const Value : real);
    Function AtualizaPagamentos : boolean;
    procedure SetidConvenio(const Value: integer);
    procedure SetidPessoa(const Value: integer);
    procedure SetValorDesconto(const Value: real);
    procedure SetidUsuarioDesconto(const Value: integer);
  public
    { Public declarations }
    property idConvenio : integer read FidConvenio write SetidConvenio;
    property idPessoa : integer read FidPessoa write SetidPessoa;
    property idUsuarioDesconto : integer read FidUsuarioDesconto write SetidUsuarioDesconto;
    property ValorAPagar : real read FValorAPagar write setValorAPagar;
    property ValorPago : real read FValorPago write setValorPago;
    property ValorDesconto : real read FValorDesconto write SetValorDesconto;
  end;

var
  frmPagamento: TfrmPagamento;

implementation

{$R *.dfm}

uses DataModuleCaixa, uTipoPagamento, uConta, uPrincipal, uClasses, uMensagem,
  uSenha, uFuncoes, ACBRPosPrinter;

procedure TfrmPagamento.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPagamento.btnFinalizarClick(Sender: TObject);
  function RetornaTotalPago : real;
  begin
    result := 0;
    with qryContaPagamentos do
    begin
      First;
      while not eof do
      begin
        Result := Result + FieldByName('vlPagamento').AsFloat - FieldByName('vlDesconto').AsFloat;
        Next;
      end;
    end;

    result := result + FValorDesconto;
  end;
  function NaoExisteRestricao : boolean;
  begin
    result := True;

    if Trim(edtDocumento.text) <> '' then
    begin
      case rgTipoDocumento.ItemIndex of
        1 : begin
          ACBrValidador1.TipoDocto := docCPF;
          ACBrValidador1.Documento := edtDocumento.Text;
          if not ACBrValidador1.Validar then
          begin
            result := False;
            frmMensagem.MostraMensagem('CPF inválido. ' + ACBrValidador1.MsgErro);
            edtDocumento.Clear;
            edtDocumento.SetFocus;
          end;
        end;
        2 : begin
          ACBrValidador1.TipoDocto := docCNPJ;
          ACBrValidador1.Documento := edtDocumento.Text;
          if not ACBrValidador1.Validar then
          begin
            result := False;
            frmMensagem.MostraMensagem('CNPJ inválido. ' + ACBrValidador1.MsgErro);
            edtDocumento.Clear;
            edtDocumento.SetFocus;
          end;
        end;
      end;
    end
    else if CompareValue(ValorAPagar , ValorPago) = GreaterThanValue then
    begin
      result := False;
      frmMensagem.MostraMensagem('Valor a pagar maior que valor pago.');
    end
    else if CompareValue(RetornaTotalPago, ValorAPagar) = GreaterThanValue  then
    begin
      result := False;
      frmMensagem.MostraMensagem('Valor pago não pode ser maior que o valor a pagar.');
    end
    else if (not AtualizaPagamentos) then
      Result := False;
  end;

  function DescontoOK : boolean;
  begin
    result := True;

    if FValorDesconto > 0 then
      result := dmCaixa.SenhaOK(24, FidUsuarioDesconto);
  end;
begin
  if DescontoOK then
  begin
    if NaoExisteRestricao then
      ModalResult := mrOK;
  end;
end;

procedure TfrmPagamento.btnNovoPagamentoClick(Sender: TObject);
begin
  BuscaPagamento;
end;

function TfrmPagamento.BuscaPagamento : boolean;
var
  ValorValeTroco: double;
  aIDContaPagamento : integer;
  i : integer;
  fl_TEF_OK : Boolean;
  sRede, sNSU, sNumeroCartao, sNomeCartao, sTipoCartao, sNomeClienteCartao, sAutorizacao : string;
begin
  result := False;
  frmTipoPagamento := TfrmTipoPagamento.Create(Self);
  try
    frmTipoPagamento.ValorAPagar := self.ValorAPagar - Self.ValorPago;
    frmTipoPagamento.ValorPagamento := self.ValorAPagar - Self.ValorPago;
    frmTipoPagamento.ValorRestante := 0;
    frmTipoPagamento.ValorDesconto := 0;

    if qryContaPagamentos.RecordCount > 0 then
    begin
      frmTipoPagamento.btnConvenio.Visible := False;
      frmTipoPagamento.btnColaborador.Visible := False;
    end;

    if frmTipoPagamento.ShowModal = IDOK then
    begin
      try
        if (frmTipoPagamento.idFormaPagamento >= 0) and (frmTipoPagamento.ValorPagamento <= 0) then
          frmMensagem.MostraMensagem('Valor do pagamento não pode ser menor ou igual a zero.')
        else
        begin
          fl_TEF_OK := True;
          if frmTipoPagamento.TEF then
          begin
            frmConta.TipoTransacao := frmTipoPagamento.TipoTransacao;
            frmConta.RedeAdquirente:= frmTipoPagamento.RedeAdquirente;

            if not frmConta.ACBrTEFD1.CRT(frmTipoPagamento.ValorPagamento , '02') then
              fl_TEF_OK := False;
          end;

          if fl_TEF_OK then
          begin
            if frmTipoPagamento.EntraNaVenda then
            begin
              //*** Vendas normais
              if (frmTipoPagamento.idFormaPagamento = -2) then
              begin
                SetidConvenio(frmTipoPagamento.idConvenio);
                SetidPessoa(frmTipoPagamento.idPessoa);
              end;

              Self.ValorPago := Self.ValorPago + frmTipoPagamento.ValorPagamento +frmTipoPagamento.ValorDesconto;
            end
            else
            begin
              //*** Colaboradores ou convenio
              SetidConvenio(-1);
              SetidPessoa(frmTipoPagamento.idPessoa);
              Self.ValorPago := Self.ValorAPagar;
            end;

            ValorDesconto := frmTipoPagamento.ValorDesconto;

            ValorValeTroco := 0;

            if frmTipoPagamento.EmitirValeTroco then
            begin
              if frmTipoPagamento.ValorRestante <> 0 then
                ValorValeTroco := Abs(frmTipoPagamento.ValorRestante);
            end;

            aIDContaPagamento := RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Vendas.ContaPagamentosSequence');

            if aIDContaPagamento <= 0 then
              raise Exception.Create('Não foi possível receber o ID do pagamento.');

            if frmTipoPagamento.TEF then
            begin
              i := frmConta.ACBrTEFD1.RespostasPendentes.Count - 1;
              with frmConta.ACBrTEFD1.RespostasPendentes[i] do
              begin
                sRede              := LeInformacao(10, i).AsString;
                sNSU               := LeInformacao(12, i).AsString;
                sNumeroCartao      := LeInformacao(740, i).AsString;
                sNomeCartao        := LeInformacao(40, i).AsString;
                sTipoCartao        := LeInformacao(731, i).AsString;
                sNomeClienteCartao := LeInformacao(741, i).AsString;
                sAutorizacao       := LeInformacao(13, i).AsString;
              end;

              Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ContaPagamentos', ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idContaPagamento', 'idFormaPagamento', 'vlTotalPagamento',
                  'vlPagamento', 'vlTroco', 'vlDesconto', 'vlValeTroco', 'Rede', 'NSU', 'NumeroCartao', 'NomeCartao', 'TipoCartao', 'NomeClienteCartao', 'Autorizacao'],
                  [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa, frmConta.idConta, aIDContaPagamento,
                   frmTipoPagamento.idFormaPagamento, frmTipoPagamento.ValorPagamento, frmTipoPagamento.ValorPagamento,
                   frmTipoPagamento.ValorRestante, frmTipoPagamento.ValorDesconto, ValorValeTroco,sRede, sNSU, sNumeroCartao,
                   sNomeCartao, sTipoCartao, sNomeClienteCartao, sAutorizacao]);

              frmPrincipal.Impressora.Desativar;
              frmPrincipal.Impressora.ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
              frmPrincipal.Impressora.Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
              frmPrincipal.Impressora.Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
              frmPrincipal.Impressora.LinhasEntreCupons := dmCaixa.Estacao.Impressora.LinhasEntreCupons;

//              frmPrincipal.Impressora.CortaPapel := not dmCaixa.Estacao.Faturamento.TEF;

              try
//                frmPrincipal.Impressora.Ativar;
//                frmConta.ACBrTEFD1.ImprimirTransacoesPendentes;
//                frmPrincipal.Impressora.CortarPapel;
              except
                on e : exception do
                begin
                  frmMensagem.MostraMensagemErro('A impressora do cupom está desligada ou sem acesso.');
                  raise Exception.Create('Não foi possível ativar a impressora ' + dmCaixa.Estacao.Impressora.NomeImpressora + slinebreak + e.message);
                end;
              end;
            end
            else
            begin
              //*** Se houver troco, mudo o valor do pagamento para o valor a ser pago
              if frmTipoPagamento.ValorRestante < 0 then
                Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ContaPagamentos', ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idContaPagamento', 'idFormaPagamento', 'vlTotalPagamento',
                                'vlPagamento', 'vlTroco', 'vlDesconto', 'vlValeTroco'],
                                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa, frmConta.idConta, aIDContaPagamento,
                                 frmTipoPagamento.idFormaPagamento, frmTipoPagamento.ValorPagamento, frmTipoPagamento.ValorPagamento+ frmTipoPagamento.ValorRestante,
                                 frmTipoPagamento.ValorRestante, frmTipoPagamento.ValorDesconto, ValorValeTroco])
              else
                Inserir(Self, dmCaixa.dbTotalFastFood, 'Vendas.ContaPagamentos', ['idEmpresa', 'idCaixa', 'idSessaoCaixa', 'idConta', 'idContaPagamento', 'idFormaPagamento', 'vlTotalPagamento',
                                'vlPagamento', 'vlTroco', 'vlDesconto', 'vlValeTroco'],
                                [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa, frmConta.idConta, aIDContaPagamento,
                                 frmTipoPagamento.idFormaPagamento, frmTipoPagamento.ValorPagamento, frmTipoPagamento.ValorPagamento,
                                 frmTipoPagamento.ValorRestante, frmTipoPagamento.ValorDesconto, ValorValeTroco]);
            end;
          end;

          qryContaPagamentos.Refresh;
          result := True;
        end;
      except
        on e : exception do
        begin
          if Assigned(frmTipoPagamento) then
            if frmTipoPagamento.TEF then
            begin
              frmConta.ACBrTEFD1.CancelarTransacoesPendentes;
            end;

          frmMensagem.MostraMensagemErro('Erro inserindo pagamento. ' + sLineBreak +
            e.Message + sLineBreak + 'Forma de pagamento : ' + IntToStr(frmTipoPagamento.idFormaPagamento));
        end;
      end;
    end
  finally
    frmTipoPagamento.Free;
  end;
end;
procedure TfrmPagamento.dbgrdPagamentosDblClick(Sender: TObject);
begin
  if (qryContaPagamentos.Active) and (qryContaPagamentos.RecordCount > 0) then
  begin
    try
      with TFDQuery.Create(Self) do
      begin
        Connection := dmCaixa.dbTotalFastFood;
        SQL.Text := Format('delete from Vendas.ContaPagamentos where idEmpresa = %d and idCaixa = %d and idConta = %d and idContaPagamento = %d',
          [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, qryContaPagamentos.FieldByName('idConta').AsInteger,
           qryContaPagamentos.FieldByName('idContaPagamento').AsInteger]);

        ExecSQL;

        Free;
      end;

      AtualizaPagamentos;

      qryContaPagamentos.Close;
      qryContaPagamentos.Active := True;
    except
      on e : exception do
        raise exception.Create('Erro tentando excluir pagamento - ' + e.Message);
    end;
  end;
end;

procedure TfrmPagamento.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;

  DrawRounded(pnlTotalPagar);
  DrawRounded(pnlValorPago);
  DrawRounded(pnlTroco);
  DrawRounded(pnlValorRestante);
  DrawRounded(btnFinalizar);
  DrawRounded(btnCancelar);
  DrawRounded(btnNovoPagamento);

  SetidConvenio(-100);
  SetidPessoa(-1);
  chkEmitirDFE.Checked := false;
  chkEmitirViaCliente.Checked := True;
  chkEmitirPedido.Checked := True;
end;

procedure TfrmPagamento.FormShow(Sender: TObject);
begin
  chkEmitirViaCliente.Checked := dmCaixa.Estacao.Faturamento.EmitirViaCliente;
  if dmCaixa.Estacao.Faturamento.EmitirDFEAutomaticamente then
  begin
    chkEmitirDFE.Checked := True;
    chkEmitirDFE.Visible := False;
  end
  else
  begin
    chkEmitirDFE.Checked := false;
    chkEmitirDFE.Visible := True;
  end;

  with qryContaPagamentos do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    ParamByName('idCaixa').Value := dmCaixa.Estacao.Caixa.idCaixa;
    ParamByName('idConta').Value := frmConta.idConta;
    Open;
  end;

  AtualizaPagamentos;
end;

procedure TfrmPagamento.rgTipoDocumentoClick(Sender: TObject);
begin
  lblRazaoSocial.Visible := False;
  lblEndereco.Visible := False;
  edtNome.Visible := False;
  edtDocumento.Visible := False;
  edtEndereco.Visible := False;
  case rgTipoDocumento.ItemIndex of
    1 : begin
      lblRazaoSocial.Visible := True;
      lblEndereco.Visible := True;
      edtNome.Visible := True;
      edtDocumento.Visible := True;
      edtEndereco.Visible := True;
      edtDocumento.EditMask:= '999.999.999-99;0;_';
    end;
    2 : begin
      lblRazaoSocial.Visible := True;
      lblEndereco.Visible := True;
      edtDocumento.Visible := True;
      edtNome.Visible := True;
      edtEndereco.Visible := True;
      edtDocumento.EditMask:= '99.999.999/9999-99;0;_';
    end;
    3 : begin
      edtDocumento.Visible := True;
      edtDocumento.EditMask:= '9999-9999-9999-9999;0;_';
    end;
  end;

  if rgTipoDocumento.ItemIndex <> 0 then
    if edtDocumento.CanFocus then
      edtDocumento.SetFocus;
end;

procedure TfrmPagamento.SetidConvenio(const Value: integer);
begin
  FidConvenio := Value;
end;

procedure TfrmPagamento.SetidPessoa(const Value: integer);
begin
  FidPessoa := Value;
end;

procedure TfrmPagamento.SetidUsuarioDesconto(const Value: integer);
begin
  FidUsuarioDesconto := Value;
end;

procedure TfrmPagamento.setValorAPagar(const Value : real);
begin
  FValorAPagar := Value;
  edtTotalPagar.Caption := FormatFloat('0.00', Value);
end;

procedure TfrmPagamento.SetValorDesconto(const Value: real);
begin
  FValorDesconto := Value;
  edtDesconto.Caption := FormatFloat('0.00', Value);
end;

procedure TfrmPagamento.setValorPago(const Value : real);
begin
  FValorPago := Value;

  edtValorPago.Caption := FormatFloat('0.00', FValorPago);
  edtDesconto.Caption := FormatFloat('0.00', FValorDesconto);

  if FValorPago >= ValorAPagar then
  begin
    edtTroco.Caption := FormatFloat('0.00', FValorPago - ValorAPagar + FValorDesconto);
    edtValorRestante.Caption := '0,00';
    btnNovoPagamento.Enabled := False;
  end
  else if FValorPago < ValorAPagar then
  begin
    btnNovoPagamento.Enabled := True;
    edtTroco.Caption := '';;
    edtValorRestante.Caption := FormatFloat('0.00', FValorAPagar - ValorPago - FValorDesconto);
  end
end;

Function TfrmPagamento.AtualizaPagamentos : boolean;
var
  valorAuxiliar : real;
  Cancelar : boolean;
  V1, V2 : real;

  function TBRound(Value: Extended; Decimals: integer): Extended;
  var
    Factor, Fraction: Extended;
  begin
    Factor := IntPower(10, Decimals);
    { A conversão para string e depois para float evita
      erros de arredondamentos indesejáveis. }
    Value := StrToFloat(FloatToStr(Value * Factor));
    Result := Int(Value);
    Fraction := Frac(Value);
    if Fraction >= 0.5 then
      Result := Result + 1
    else if Fraction <= -0.5 then
      Result := Result - 1;
    Result := Result / Factor;
  end;

begin
  result   := False;
  Cancelar := False;

  valorAuxiliar := 0;

  with qryContaPagamentos do
  begin
    Close;
    Open;
    First;
    while not eof do
    begin
      valorAuxiliar := valorAuxiliar + FieldByName('vlPagamento').AsFloat + FieldByName('vlDesconto').AsFloat;
      if FieldByName('idFormaPagamento').AsInteger = -1 then
        idConvenio := -1;

      Next;
    end;
  end;


  setValorPago(valorAuxiliar);


  if TBRound(ValorPago, 2) < TBRound(ValorAPagar, 2) then
  begin
    repeat
      Cancelar := Not BuscaPagamento;
    until (TBRound(ValorPago, 2) >= TBRound(ValorAPagar, 2)) or (Cancelar);
  end;

  result := Not (Cancelar);
end;

end.
