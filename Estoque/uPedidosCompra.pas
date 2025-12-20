unit uPedidosCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView,  cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, JvExExtCtrls, JvExtComponent, JvPanel,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvBaseEdits, cxCalc, frxClass, frxDBSet,
  frxExportImage, frxExportText, frxExportCSV, frxExportRTF, frxExportHTML,
  cxNavigator, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, frxExportPDF;

type
  TfrmPedidoCompra = class(TfrmFormPadrao)
    dbgridApuracao: TcxGrid;
    dbgridApuracaoDBTableView1: TcxGridDBTableView;
    dbgridApuracaoLevel1: TcxGridLevel;
    qryGridPadrao: TFDQuery;
    dsGridPadrao: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    btnIncluirPedidoCompra: TJvPanel;
    btnAlterarPedidoCompra: TJvPanel;
    btnExcluirPedidoCompra: TJvPanel;
    btnEditarQuantidades: TJvPanel;
    btnImprimir: TJvPanel;
    sqlGerarPedidoCompraItens: TFDQuery;
    btnGerarPedidoCompraItens: TJvPanel;
    qryGridPadraoidEmpresa: TIntegerField;
    qryGridPadraoidPedidoCompra: TIntegerField;
    qryGridPadraoidPessoa: TIntegerField;
    qryGridPadraoidUsuario: TIntegerField;
    qryGridPadraoidContagem: TIntegerField;
    qryGridPadraoDataInicioVendas: TDateField;
    qryGridPadraoDataHora: TDateTimeField;
    qryGridPadraoQtdeTickets: TIntegerField;
    qryGridPadraoFornecedor: TStringField;
    qryGridPadraoNomeUsuario: TStringField;
    qryGridPadraoDataContagem: TDateTimeField;
    dbgridApuracaoDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridApuracaoDBTableView1idPedidoCompra: TcxGridDBColumn;
    dbgridApuracaoDBTableView1idPessoa: TcxGridDBColumn;
    dbgridApuracaoDBTableView1idUsuario: TcxGridDBColumn;
    dbgridApuracaoDBTableView1idContagem: TcxGridDBColumn;
    dbgridApuracaoDBTableView1DataInicioVendas: TcxGridDBColumn;
    dbgridApuracaoDBTableView1DataHora: TcxGridDBColumn;
    dbgridApuracaoDBTableView1QtdeTickets: TcxGridDBColumn;
    dbgridApuracaoDBTableView1Fornecedor: TcxGridDBColumn;
    dbgridApuracaoDBTableView1NomeUsuario: TcxGridDBColumn;
    dbgridApuracaoDBTableView1DataContagem: TcxGridDBColumn;
    frxdbPedidoCompra: TfrxDBDataset;
    frxPedidoCompra: TfrxReport;
    qryPedidoCompra: TFDQuery;
    qryPedidoCompraCodigoFornecedor: TStringField;
    qryPedidoCompradescricao: TStringField;
    qryPedidoCompraQtde: TFloatField;
    qryPedidoCompraQtdePedido: TFloatField;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxCSVExport1: TfrxCSVExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxGIFExport1: TfrxGIFExport;
    frxTIFFExport1: TfrxTIFFExport;
    procedure btnIncluirPedidoCompraClick(Sender: TObject);
    procedure btnGerarPedidoCompraItensClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditarQuantidadesClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure frxPedidoCompraGetValue(const VarName: string;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCompra: TfrmPedidoCompra;

implementation

{$R *.dfm}

uses DataModuleCaixa, uMensagem, uPedidoCompraDados, uPedidoCompraItens,
  uPrincipal;

procedure TfrmPedidoCompra.btnEditarQuantidadesClick(Sender: TObject);
begin
  frmPedidoCompraItens := TfrmPedidoCompraItens.Create(Self);
  frmPedidoCompraItens.qryPedidoCompraItens.ParamByName('idEmpresa').Value := qryGridPadraoidEmpresa.AsInteger;
  frmPedidoCompraItens.qryPedidoCompraItens.ParamByName('idPedidoCompra').Value := qryGridPadraoidPedidoCompra.AsInteger;
  frmPedidoCompraItens.qryPedidoCompraItens.Open;
  frmPedidoCompraItens.ShowModal;
  frmPedidoCompraItens.Free;
end;

procedure TfrmPedidoCompra.btnGerarPedidoCompraItensClick(Sender: TObject);
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select * from Estoque.PedidoCompraItens where idEmpresa = %d and idPedidoCompra = %d',
      [qryGridPadraoidEmpresa.AsInteger, qryGridPadraoidPedidoCompra.AsInteger]);
    Open;

    if RecordCount > 0 then
      frmMensagem.MostraMensagem('Já existem ítens gerados para este pedido de compra.')
    else
    begin
      with sqlGerarPedidoCompraItens do
      begin
        ParamByName('idEmpresa').Value := qryGridPadraoidEmpresa.AsInteger;
        ParamByName('idPedidoCompra').Value := qryGridPadraoidPedidoCompra.AsInteger;
        ParamByName('idPessoa').Value := qryGridPadraoidPessoa.AsInteger;
        ParamByName('DataInicio').Value := qryGridPadraoDataInicioVendas.AsDateTime;
        ParamByName('DataFim').Value := qryGridPadraoDataContagem.AsDateTime;
//        ParamByName('idContagemFinal').Value := qryGridPadraoidContagem.AsInteger;
        ParamByName('qtdeVendasProjetada').Value := qryGridPadraoQtdeTickets.AsInteger;
        Execute;

        if RowsAffected <= 0 then
          frmMensagem.MostraMensagemErro('Não foi inserido nenhum ítem neste pedido para estes parâmetros.')
        else
          frmMensagem.MostraMensagem('Ítens do pedido gerado com sucesso.');
      end;
    end;

    Close;
  end;
end;

procedure TfrmPedidoCompra.btnImprimirClick(Sender: TObject);
begin
  with qryPedidoCompra do
  begin
    Close;
    ParamByName('idEmpresa').Value := qryGridPadraoidEmpresa.AsInteger;
    ParamByName('idPedidoCompra').Value := qryGridPadraoidPedidoCompra.AsInteger;
    Open;

    if RecordCount > 0 then
    begin
      if frxPedidoCompra.PrepareReport(True) then
        frxPedidoCompra.ShowReport(True);
    end
    else
      frmMensagem.MostraMensagem('Nenhum produto foi encontrado para esta contagem.');
  end;

{  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select rep.CodigoFornecedor, p.descricao, rep.Qtde, pci.QtdePedido from Estoque.PedidoCompraItens  pci ' +
      'inner join Estoque.PedidosCompra pc on pci.idEmpresa = pc.idEmpresa and pci.idPedidoCompra = pc.idPedidoCompra ' +
      'inner join Produtos.Produtos p on pci.idProduto = p.idProduto ' +
      'inner join Estoque.RelacaoEntreProdutos rep on rep.idEmpresa = pci.idEmpresa and rep.idPessoa = pc.idPessoa and rep.idProduto = pci.idProduto ' +
      'where (pc.idEmpresa = %d) and (pc.idPedidoCompra = %d) and (QtdePedido > 0)' +
      'order by p.Descricao', [qryGridPadraoidEmpresa.AsInteger, qryGridPadraoidPedidoCompra.AsInteger]);
    Open;

    if RecordCount > 0 then
    begin
      //***
      with frmPrincipal.impressora do
      begin
        InicializaImpressao;

        ImprimeExpandido('Pedido de compra', True);
        ImprimeExpandido('Data : ' + FormatDateTime('dd/mm/yy hh:nn:ss', qryGridPadraoDataHora.AsDateTime), True);

        Imprime(StringOfChar('-', 48));
        ImprimeCondensado('Cod. Forn. Descricao                 Qtde Pacote Qtde Pedido');
        Imprime(StringOfChar('-', 48));
        while not Eof do
        begin
          ImprimeCondensado(LeftPad(Copy(FieldByName('CodigoFornecedor').AsString, 1 , 10), ' ', 10) +
            LeftPad(Copy(FieldByName('Descricao').AsString, 1 , 30), ' ', 30) +
            RightPad(FieldByName('Qtde').AsString, ' ', 8) +
            RightPad(FieldByName('QtdePedido').AsString, ' ', 8));

          Next;
        end;

        FinalizaImpressao(tcParcial);
      end;
    end
    else
      ShowMessage('Nenhum produto foi encontrado para esta contagem.');
  end;
}
end;

procedure TfrmPedidoCompra.btnIncluirPedidoCompraClick(Sender: TObject);

begin
  frmPedidoCompraDados := TfrmPedidoCompraDados.Create(Self);
  frmPedidoCompraDados.qryCadastro.Insert;
  if frmPedidoCompraDados.ShowModal = mrOk then
  begin
    qryGridPadrao.Close;
    qryGridPadrao.Open;
  end;

  frmPedidoCompraDados.Close;
end;

procedure TfrmPedidoCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  qryGridPadrao.Close;
end;

procedure TfrmPedidoCompra.FormCreate(Sender: TObject);
begin
  inherited;

  with qryGridPadrao do
  begin
    Close;
    ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
    Open;
  end;
end;

procedure TfrmPedidoCompra.frxPedidoCompraGetValue(const VarName: string;
  var Value: Variant);
begin
  if UpperCase(VarName) = 'DATA' then
    Value := qryGridPadraoDataHora.AsString
  else if UpperCase(VarName) = 'CODIGO' then
    Value := qryGridPadraoidPedidoCompra.AsString
  else if UpperCase(VarName) = 'LOJA' then
    Value := IntToStr(dmCaixa.Estacao.idEmpresa)
  else if UpperCase(VarName) = 'NOMELOJA' then
    Value := dmCaixa.Estacao.Dados.NomeFantasia;
end;

end.
