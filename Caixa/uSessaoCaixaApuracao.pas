unit uSessaoCaixaApuracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Constantes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.Script, FireDAC.Comp.ScriptCommands;

type
  TfrmSessaoCaixaApuracao = class(TForm)
    Panel1: TPanel;
    btnVoltar: TImage;
    qryApuracao: TFDQuery;
    dsApuracao: TDataSource;
    qryApuracaoidEmpresa: TIntegerField;
    qryApuracaoidCaixa: TIntegerField;
    qryApuracaoidSessaoCaixa: TIntegerField;
    qryApuracaoidFormaPagamento: TIntegerField;
    qryApuracaovlApurado: TCurrencyField;
    qryApuracaovlRealizado: TCurrencyField;
    qryApuracaoDataHora: TDateTimeField;
    qryApuracaoDescricao: TStringField;
    qryApuracaoImagem: TBlobField;
    pnlTitulo: TPanel;
    btnSalvar: TPanel;
    qryProdutosVendidos: TFDQuery;
    DBGrid1: TDBGrid;
    LinkLabel1: TLinkLabel;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSessaoCaixaApuracao: TfrmSessaoCaixaApuracao;

implementation

{$R *.dfm}

uses DataModuleCaixa, uPrincipal, uSenha, uAberturaSessaoCaixa, uPergunta,
  uMensagem, uMensagensErro;

procedure TfrmSessaoCaixaApuracao.btnSalvarClick(Sender: TObject);
var
  EstacaoAuxiliar : TEstacao;
  function VerificaApuracao : boolean;
  begin
    result := true;
    with qryApuracao do
    begin
      First;

      while not EOF do
      begin
        if FieldByName('vlApurado').IsNull then
        begin
          Result := False;
          break;
        end;
        Next;
      end;
    end;

  end;
  function FechaSessaoCaixa : boolean;
  begin
    result := false;

    //*** Primeiro fecho a sessao atual
    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;

      SQL.Text := Format('update Vendas.SessoesCaixa set dhFechamento = GETDATE(), idUsuarioFechamento = %d where idEmpresa = %d and idCaixa = %d and idSessaoCaixa = %d',
        [dmCaixa.Usuario.ID, dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa]);

      Execute;

      if RowsAffected > 0 then
      begin
        EstacaoAuxiliar := dmCaixa.Estacao;
        EstacaoAuxiliar.Caixa.idSessaoCaixa := -1;
        dmCaixa.Estacao := EstacaoAuxiliar;

        frmPrincipal.btnAbrirSessaoCaixa.Visible := True;
        frmPrincipal.btnFecharSessaoCaixa.Visible := False;
        frmPrincipal.btnVender.Visible := False;

        result := true;
      end
      else
        raise Exception.Create('Erro fechando a sessão de caixa.');

      Free;
    end;
  end;

  function ExcluiContasEmAberto : boolean;
  var
    ScriptAuxiliar : TFDScript;
  begin
    result := false;
    //*** Primeiro fecho a sessao atual
    ScriptAuxiliar := TFDScript.Create(Self);
    with ScriptAuxiliar do
    begin
      Connection := dmCaixa.dbTotalFastFood;

      SQLScripts.Add;

      SQLScripts[0].SQL.Add('declare @idEmpresa as int;');
      SQLScripts[0].SQL.Add('declare @idCaixa as int;');
      SQLScripts[0].SQL.Add('declare @idSessaoCaixa as int;');

      SQLScripts[0].SQL.Add(Format('select @idEmpresa = %d;', [dmCaixa.Estacao.idEmpresa]));
      SQLScripts[0].SQL.Add(Format('select @idCaixa = %d;', [dmCaixa.Estacao.Caixa.idCaixa]));
      SQLScripts[0].SQL.Add(Format('select @idSessaoCaixa = %d;', [dmCaixa.Estacao.Caixa.idSessaoCaixa]));

      SQLScripts[0].SQL.Add('delete from Vendas.ContaHistorico where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.ContaPagamentos where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idSessaoCaixa = @idSessaoCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.ContaPromocoes where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.ItemObservacoesManuais where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.ItemObservacoes where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.Itens where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.ItensEstorno where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.Pedidos where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idConta in');
      SQLScripts[0].SQL.Add('(select idconta from Vendas.contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13));');

      SQLScripts[0].SQL.Add('delete from Vendas.Contas where (idEmpresa = @idEmpresa) and (idCaixa = @idCaixa) and (idSessaoCaixa = @idSessaoCaixa) and (DataFim is null) and (idTipoVenda=1) and (status <> 13);');

      ValidateAll;
      result := ExecuteAll;
      FreeAndNil(ScriptAuxiliar);
    end;
  end;
begin
  if VerificaApuracao then
  begin
    if ExcluiContasEmAberto then
    begin
      if dmCaixa.ImprimeFita(dmCaixa.Estacao.Caixa.idCaixa, 0, dmCaixa.Estacao.Caixa.idSessaoCaixa, dmCaixa.Estacao.EmitirProdutosNoFechamentoSessao, True) then
      begin
        if FechaSessaoCaixa then
        begin
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
              end;
              frmAberturaSessaoCaixa.Free;
            end;
            frmsenha.Free;
          end
          else
          begin
            frmPrincipal.btnAbrirSessaoCaixa.Visible := True;
            frmPrincipal.btnFecharSessaoCaixa.Visible := False;
            frmPrincipal.btnVender.Visible := False;
          end;
        end;
        ModalResult := mrOK;
      end;
    end
    else
      frmMensagem.MostraMensagem('Não foi possível fechar o turno. Contacte o suporte técnico');
  end;
end;

procedure TfrmSessaoCaixaApuracao.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSessaoCaixaApuracao.FormShow(Sender: TObject);
var
  flOK : Boolean;
begin
  with qryApuracao do
  begin
    Close;
    SQL.Text := Format('Select sca.*, fp.Descricao, fp.Imagem from Vendas.SessaoCaixaApuracoes  sca ' +
      'inner join Contabil.FormasPagamento fp on sca.idFormaPagamento = fp.idFormaPagamento ' +
      'where sca.idEmpresa = %d and sca.idCaixa = %d and sca.idSessaoCaixa = %d',
      [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa]);
    Open;

    if (RecordCount = 1) and (FieldByName('idFormaPagamento').AsInteger  = -3) then
      Delete;

    if RecordCount <= 0 then
    begin
      with TFDQuery.Create(Self) do
      begin
        Connection := dmCaixa.dbTotalFastFood;

        SQL.Text := Format(
         'declare @idEmpresa int = %d; ' +
         'declare @idCaixa int = %d; ' +
         'declare @idSessaoCaixa int = %d; ' +
         ' insert into Vendas.SessaoCaixaApuracoes (idEmpresa, idCaixa, idSessaoCaixa, idFormaPagamento, DataHora)' +
         ' select distinct @idEmpresa, @idCaixa, @idSessaoCaixa, idFormaPagamento, getdate() from vendas.ContaPagamentos  ' +
         ' where idEmpresa = @idEmpresa and idCaixa = @idCaixa and idSessaoCaixa = @idSessaoCaixa ' +
         ' union all ' +
         ' select @idEmpresa, @idCaixa, @idSessaoCaixa, -3, getdate() ',
         [dmCaixa.Estacao.idEmpresa, dmCaixa.Estacao.Caixa.idCaixa, dmCaixa.Estacao.Caixa.idSessaoCaixa]);
        Execute;

        flOK := RowsAffected <= 0;

        if flOK then
          frmMensagem.MostraMensagemErro('Não foi possível inserir a apuração das formas de pagamento para esta sessão de caixa. Reinicie o sistema.')
        else
          qryApuracao.Refresh;

        Free;
      end;
    end;

    if flOK then
    begin
      Close;
      Open;
    end;
  end;
end;

end.

