unit uConsultaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaVenda = class(TForm)
    Panel1: TPanel;
    pnlItens: TScrollBox;
    pnlTotal: TPanel;
    lblValorTotal: TLabel;
    btnVoltar: TImage;
    Label1: TLabel;
    pnlMesaCartao: TPanel;
    Label4: TLabel;
    pnlEditSenha: TPanel;
    edtSenha: TEdit;
    pnlPromocao: TPanel;
    lblDescricaoPromocao: TLabel;
    btnExcluirPromocao: TPanel;
    DBGrid1: TDBGrid;
    dsPagamentos: TDataSource;
    qryPagamentos: TFDQuery;
    qryPagamentosidContaPagamento: TIntegerField;
    qryPagamentosDescricao: TStringField;
    qryPagamentosvlPagamento: TCurrencyField;
    qryPagamentosDescricaoTipoPagamento: TStringField;
    qryPagamentosvlDesconto: TCurrencyField;
    qryPagamentosvlTotalPagamento: TCurrencyField;
    qryPagamentosvlTroco: TCurrencyField;
    qryPagamentosDataHora: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FidEmpresa: integer;
    FidConta: integer;
    FidCaixa: integer;
    procedure SetidCaixa(const Value: integer);
    procedure SetidConta(const Value: integer);
    procedure SetidEmpresa(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idEmpresa : integer read FidEmpresa write SetidEmpresa;
    property idCaixa : integer read FidCaixa write SetidCaixa;
    property idConta : integer read FidConta write SetidConta;

  end;

var
  frmConsultaVenda: TfrmConsultaVenda;

implementation

{$R *.dfm}

uses DataModuleCaixa, uClasses, uFuncoes;

procedure TfrmConsultaVenda.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaVenda.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;

  WindowState := wsMaximized;
end;

procedure TfrmConsultaVenda.FormShow(Sender: TObject);
var
  ValorTotal : real;

  procedure AtualizaTotalConta;
  var
    i, j : integer;
    AValorDescontoProdutos : double;
  begin
    try
      AValorDescontoProdutos := 0;
      ValorTotal := 0;

      for I := 0 to pnlItens.ControlCount - 1 do
      begin
        ValorTotal := ValorTotal + (TItem(pnlItens.Controls[i]).Produto.Valor * TItem(pnlItens.Controls[i]).Produto.Qtde);

        for j := 0 to TItem(pnlItens.Controls[i]).ControlCount -1 do
        begin
          if TItem(pnlItens.Controls[i]).Controls[j] is TItem then
            ValorTotal := ValorTotal +
               (TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Valor *
                TItem(TItem(pnlItens.Controls[i]).Controls[j]).Produto.Qtde);
        end;
      end;

      if pnlItens.ControlCount > 0 then
      begin
        AValorDescontoProdutos := RetornaPromocoes(FidEmpresa, FidCaixa, FidConta, dmCaixa.qryDescontos);
        dmCaixa.qryDescontos.Close;
      end;

      lblValorTotal.Caption := FormatFloat('0.00', ValorTotal - AValorDescontoProdutos);

      except
      on e : exception do
        raise Exception.Create('Função AtualizaTotalConta.' + sLineBreak + e.Message);
    end;
  end;
begin
  dmCaixa.AtualizaQueryItens(FidCaixa, FidConta, 0);

  edtSenha.Text := dmCaixa.qryItens.FieldByName('idMesaCartaoSenha').AsString;

  dmCaixa.AtualizaPainelItens(pnlItens, FidEmpresa, FidCaixa, FidConta, nil, nil, nil, nil, nil, true);

  with qryPagamentos do
  begin
    Close;
    ParamByName('idEmpresa').value := FidEmpresa;
    ParamByName('idCaixa').value   := FidCaixa;
    ParamByName('idConta').value   := FidConta;
    Open;
  end;

  //*** Verifico se existe promoção com ativação manual para esta conta;
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := format('select pro.Descricao from Vendas.ContaPromocoes cp inner join produtos.Promocoes pro on pro.idPromocao = cp.idPromocao ' +
      'where idEmpresa = %d and idCaixa = %d and idConta = %d',
      [FidEmpresa, FidCaixa, FidConta]);
    Open;

    if RecordCount > 0 then
    begin
      if not FieldByName('Descricao').IsNull then
      begin
        lblDescricaoPromocao.Caption := FieldByName('Descricao').AsString;
        pnlPromocao.Visible := True;
      end;
    end;

    Close;
  end;

  AtualizaTotalConta;
end;

procedure TfrmConsultaVenda.SetidCaixa(const Value: integer);
begin
  FidCaixa := Value;
end;

procedure TfrmConsultaVenda.SetidConta(const Value: integer);
begin
  FidConta := Value;
end;

procedure TfrmConsultaVenda.SetidEmpresa(const Value: integer);
begin
  FidEmpresa := Value;
end;

end.
