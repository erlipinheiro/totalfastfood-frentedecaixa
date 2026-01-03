unit uGerenciaNFCes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.jpeg, ACBrValidador;

type
  TfrmGerenciarNFCes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    edtDataInicial: TDateTimePicker;
    edtDatafinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    qryNFCes: TFDQuery;
    dsNFCes: TDataSource;
    btnEnviar: TButton;
    btnConsultar: TButton;
    btnImprimir: TButton;
    btnCancelar: TButton;
    btnVoltar: TImage;
    Memo1: TMemo;
    qryNFCesidEmpresa: TIntegerField;
    qryNFCesidCaixa: TIntegerField;
    qryNFCesidConta: TIntegerField;
    qryNFCesidMesaCartaoSenha: TIntegerField;
    qryNFCesDatafim: TDateTimeField;
    qryNFCesValor: TCurrencyField;
    qryNFCesNumeroNFE: TIntegerField;
    qryNFCesSituacaoNFE: TStringField;
    qryNFCesProtocoloNFE: TStringField;
    qryNFCesDataHoraAutorizacaoNFE: TDateTimeField;
    qryNFCescStat: TIntegerField;
    qryNFCesNFE: TStringField;
    qryNFCesDescricao: TStringField;
    btnReimprimirPedido: TButton;
    qryNFCesidTipoVenda: TIntegerField;
    btnVisualizarPedido: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnReimprimirPedidoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnVisualizarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    procedure LogsNFE(const ALogLine: string;  var Tratado: Boolean);
  public
    { Public declarations }
  end;

var
  frmGerenciarNFCes: TfrmGerenciarNFCes;

implementation

{$R *.dfm}

uses
  DataModuleCaixa, uDadosConsumidor, uMensagem, DateUtils, pcnConversao,
  uPrincipal, ACBrPosPrinter, uFuncoes, Constantes, uConsultaVenda;

procedure TfrmGerenciarNFCes.btnVisualizarPedidoClick(Sender: TObject);
begin
  if qryNFCes.RecordCount > 0 then
  begin
    frmConsultaVenda := TfrmConsultaVenda.Create(Self);
    frmConsultaVenda.idEmpresa := qryNFCesidEmpresa.Value;
    frmConsultaVenda.idCaixa := qryNFCesidCaixa.Value;
    frmConsultaVenda.idConta := qryNFCesidConta.Value;
    frmConsultaVenda.ShowModal;
    FreeAndNil(frmConsultaVenda);
  end
  else
    frmMensagem.MostraMensagem('Não existe venda para visualizar.');
end;

procedure TfrmGerenciarNFCes.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerenciarNFCes.btnImprimirClick(Sender: TObject);
var
  sMes : string;
  sArquivo : string;
begin
  dmCaixa.ACBrNFe1.NotasFiscais.Clear;
  sMes := IntToStr(MonthOf(qryNFCes.FieldByName('DataFim').AsDateTime));

  if Length(sMes) = 1 then
    sMes := '0' + sMes;

  sArquivo := StringReplace(qryNFCes.FieldByName('NFE').AsString,'NFe','',[rfIgnoreCase]) + '-nfe.xml';
  sArquivo := dmCaixa.ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\' + IntToStr(YearOf(Now)) + sMes + '\' + sArquivo;
  if FileExists(sArquivo) then
  begin
    dmCaixa.ACBrNFe1.NotasFiscais.LoadFromFile(sArquivo, False);
    if dmCaixa.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
    begin
//      dmCaixa.ACBrNFeDANFCEFR1.Impressora := dmCaixa.Estacao.Impressora.FilaImpressao;
//      dmCaixa.ACBrNFeDANFCEFR1.FastFile   := dmCaixa.Estacao.Impressora.ArquivoDanfe;
//      dmCaixa.ACBrNFe1.DANFE := dmCaixa.ACBrNFeDANFCEFR1;

      dmCaixa.ACBrNFe1.NotasFiscais.Items[0].Imprimir;
    end;
  end;
end;

procedure TfrmGerenciarNFCes.btnReimprimirPedidoClick(Sender: TObject);
var
  i : integer;
  ValorDescontos : real;
begin
  if qryNFCes.RecordCount > 0 then
  begin
    ValorDescontos := RetornaPromocoes(dmCaixa.Estacao.idEmpresa, qryNFCesidCaixa.Value, qryNFCesidConta.Value, dmCaixa.qryDescontos);
    dmCaixa.qryDescontos.Close;
    ImprimePedido(Self, dmCaixa.dbTotalFastFood, frmPrincipal.Impressora, dmCaixa.Estacao, TTipoVenda(qryNFCesidTipoVenda.Value), qryNFCesidConta.Value,
      0 , qryNFCesidMesaCartaoSenha.Value, '', qryNFCesValor.AsString, '', True, False, True, False, False, dmCaixa.qryDescontos) ;
  end
  else
    frmMensagem.MostraMensagem('Selecione um pedido primeiro.');
end;

procedure TfrmGerenciarNFCes.Button1Click(Sender: TObject);
begin
  with qryNFCes do
  begin
    Close;
    SQL.Text := format('select c.idEmpresa, c.idCaixa, c.idConta, c.idMesaCartaoSenha, c.Datafim, c.idTipoVenda, ' +
      'c.Valor - case when valordesconto is null then 0 else ValorDesconto end as Valor,   ' +
      'NumeroNFE, SituacaoNFE, ProtocoloNFE, DataHoraAutorizacaoNFE, cStat, NFE, ' +
      'conv.Descricao ' +
      'from Vendas.Contas c ' +
      'inner join Vendas.Caixas ca on c.idEmpresa = ca.idEmpresa and c.idCaixa = ca.idCaixa ' +
      'left join Vendas.Convenios conv on c.idConvenio = conv.idConvenio ' +
      'where c.idEmpresa = %d and c.idConvenio <> -1 and ca.dhAbertura >= ' +
        QuotedStr(FormatDateTime('dd-mm-yy', edtDataInicial.Date)) + '  and ca.dhAbertura < ' +
        QuotedStr(FormatDateTime('dd-mm-yy', edtDatafinal.Date + 1)) +
      'order by DataFim desc', [dmCaixa.Estacao.idEmpresa]);
    Open;

    btnEnviar.Visible := RecordCount > 0;
    btnConsultar.Visible := RecordCount > 0;
    btnImprimir.Visible := RecordCount > 0;
    btnCancelar.Visible := RecordCount > 0;
  end;
end;

procedure TfrmGerenciarNFCes.DBGrid1DblClick(Sender: TObject);
begin
  if qryNFCes.RecordCount > 0 then
  begin
    frmConsultaVenda := TfrmConsultaVenda.Create(Self);
    frmConsultaVenda.idEmpresa := qryNFCesidEmpresa.Value;
    frmConsultaVenda.idCaixa := qryNFCesidCaixa.Value;
    frmConsultaVenda.idConta := qryNFCesidConta.Value;
    frmConsultaVenda.ShowModal;
    FreeAndNil(frmConsultaVenda);
  end
  else
    frmMensagem.MostraMensagem('Não existe venda para visualizar.');
end;

procedure TfrmGerenciarNFCes.btnCancelarClick(Sender: TObject);
var
  sMes : string;
  sArquivo : string;
  idLote : string;
begin
  dmCaixa.ACBrNFe1.NotasFiscais.Clear;
  sMes := IntToStr(MonthOf(qryNFCes.FieldByName('DataFim').AsDateTime));

  if Length(sMes) = 1 then
    sMes := '0' + sMes;

  sArquivo := StringReplace(qryNFCes.FieldByName('NFE').AsString,'NFe','',[rfIgnoreCase]) + '-nfe.xml';
  sArquivo := dmCaixa.ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\' + IntToStr(YearOf(Now)) + sMes + '\' + sArquivo;
  if FileExists(sArquivo) then
  begin
    dmCaixa.ACBrNFe1.NotasFiscais.LoadFromFile(sArquivo, False);
    idLote := '1';
    if not(InputQuery('WebServices Eventos: Cancelamento', 'Identificador de controle do Lote de envio do Evento', idLote)) then
       exit;
    sArquivo := '';
    if not(InputQuery('WebServices Eventos: Cancelamento', 'Justificativa', sArquivo)) then
       exit;
    dmCaixa.ACBrNFe1.EventoNFe.Evento.Clear;
    dmCaixa.ACBrNFe1.EventoNFe.idLote := StrToInt(idLote) ;
    with dmCaixa.ACBrNFe1.EventoNFe.Evento.Add do
    begin
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := sArquivo;
    end;

    dmCaixa.ACBrNFe1.EnviarEvento(StrToInt(idLote));

    if dmCaixa.ACBrNFe1.WebServices.EnvEvento.cStat = 135 then
    with qryNFCes do
    begin
      edit;
      FieldByName('cstat').Value := dmCaixa.ACBrNFe1.WebServices.EnvEvento.cStat;
      FieldByName('SituacaoNFE').Value := 'X';
      post;
    end
    else
    begin
      frmMensagem.MostraMensagemErro(format('Ocorreu o seguinte erro ao cancelar a nota fiscal eletrônica:'  + sLineBreak +
          'Código:%d' + sLineBreak +
          'Motivo: %s', [
            dmCaixa.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
            dmCaixa.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
        ]));
    end;

    frmMensagem.MostraMensagem(dmCaixa.ACBrNFe1.WebServices.EnvEvento.RetWS);
  end;
end;

procedure TfrmGerenciarNFCes.btnConsultarClick(Sender: TObject);
begin
  if trim(qryNFCes.FieldByName('NFE').AsString) <> '' then
  begin
    try
      dmCaixa.ACBrNFe1.NotasFiscais.Clear;
      dmCaixa.ACBrNFe1.WebServices.Consulta.NFeChave := StringReplace(qryNFCes.FieldByName('NFE').AsString,'NFe','',[rfIgnoreCase]);
      dmCaixa.ACBrNFe1.WebServices.Consulta.Executar;
      frmMensagem.MostraMensagem('Retorno da consulta - ' + dmCaixa.ACBrNFe1.WebServices.Consulta.XMotivo);
    except
      on e : exception do
      begin
        frmMensagem.MostraMensagemErro('Retorno consultar NFE --> IDConta = ' + qryNFCes.FieldByName('idconta').AsString + ', NFE = ' +
            QuotedStr(dmCaixa.ACBrNFe1.WebServices.Consulta.NFeChave) + ', código de retorno : ' +
            dmCaixa.ACBrNFe1.WebServices.Consulta.cStat.ToString + ', mensagem de retorno : ' + dmCaixa.ACBrNFe1.WebServices.Consulta.xMotivo +
            ', Exceção retornada --> ' + e.Message);
      end;
    end;
  end;
end;

procedure TfrmGerenciarNFCes.btnEnviarClick(Sender: TObject);
var
  TipoDocumento : TACBrValTipoDocto;
begin
  dmCaixa.ACBrNFe1.NotasFiscais.Clear;
  dmCaixa.ACBrNFe1.OnGerarLog := LogsNFE;
  frmDadosConsumidor := TfrmDadosConsumidor.Create(Self);
  frmDadosConsumidor.ShowModal;
  if frmDadosConsumidor.RadioGroup1.ItemIndex = 0 then
    TipoDocumento := docCPF
  else
    TipoDocumento := docCNPJ;

  Memo1.Visible := True;
  if dmCaixa.EmiteNFCe(qryNFCes.FieldByName('idConta').AsInteger, trim(frmDadosConsumidor.edtDocumento.Text), TipoDocumento,
    frmDadosConsumidor.edtNome.Text, frmDadosConsumidor.edtIE.Text, qryNFCes.FieldByName('idMesaCartaoSenha').AsInteger,
    False, qryNFCes.FieldByName('Descricao').AsString,
    qryNFCes.FieldByName('idCaixa').AsInteger) then
    qryNFCes.Refresh;


  frmDadosConsumidor.Free;

  Memo1.Visible := False;
  dmCaixa.ACBrNFe1.OnGerarLog := Nil;
end;

procedure TfrmGerenciarNFCes.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  edtDataInicial.Date := Now;
  edtDatafinal.Date := Now;
end;

procedure TfrmGerenciarNFCes.FormShow(Sender: TObject);
begin
  frmPrincipal.Impressora.Ativo := False;
  frmPrincipal.Impressora.Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
  frmPrincipal.Impressora.ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
  frmPrincipal.Impressora.Modelo := dmCaixa.Estacao.Impressora.ModeloImpressora;
  frmPrincipal.Impressora.Ativar;
end;

procedure TfrmGerenciarNFCes.LogsNFE(const ALogLine: string;
  var Tratado: Boolean);
begin
  Memo1.Lines.Add(ALogLine);
  Tratado := True;
end;

end.
