unit uAuditoriaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  cxCustomData, ACBRPosPrinter,
  cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxNavigator, FireDAC.Stan.Intf,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmAuditoriaEstoque = class(TfrmFormPadrao)
    btnIncluirContagem: TJvPanel;
    btnAlterarContagem: TJvPanel;
    btnExcluirContagem: TJvPanel;
    btnEditarQuantidades: TJvPanel;
    btnImprimirFitaContagem: TJvPanel;
    btnImprimirDiscrepancias: TJvPanel;
    qryContagens: TFDQuery;
    qryContagensidEmpresa: TIntegerField;
    qryContagensidContagem: TIntegerField;
    qryContagensidPessoaInicio: TIntegerField;
    qryContagensidPessoaFim: TIntegerField;
    qryContagensDataInicio: TDateTimeField;
    qryContagensDataFim: TDateTimeField;
    qryContagensStatus: TIntegerField;
    qryContagensPercentualAcerto: TFloatField;
    qryContagensDataEnvioCentral: TDateTimeField;
    qryContagensflEnviadoCentral: TBooleanField;
    qryContagensPessoaInicio: TStringField;
    qryContagensPessoaFim: TStringField;
    qryContagensStatusString: TStringField;
    dsContagens: TDataSource;
    dbgridContagens: TcxGrid;
    dbgridContagensDBTableView1: TcxGridDBTableView;
    dbgridContagensDBTableView1idEmpresa: TcxGridDBColumn;
    dbgridContagensDBTableView1idContagem: TcxGridDBColumn;
    dbgridContagensDBTableView1idPessoaInicio: TcxGridDBColumn;
    dbgridContagensDBTableView1idPessoaFim: TcxGridDBColumn;
    dbgridContagensDBTableView1DataInicio: TcxGridDBColumn;
    dbgridContagensDBTableView1PessoaInicio: TcxGridDBColumn;
    dbgridContagensDBTableView1DataFim: TcxGridDBColumn;
    dbgridContagensDBTableView1PessoaFim: TcxGridDBColumn;
    dbgridContagensDBTableView1PercentualAcerto: TcxGridDBColumn;
    dbgridContagensDBTableView1DataEnvioCentral: TcxGridDBColumn;
    dbgridContagensDBTableView1flEnviadoCentral: TcxGridDBColumn;
    dbgridContagensDBTableView1Status: TcxGridDBColumn;
    dbgridContagensLevel1: TcxGridLevel;
    procedure btnIncluirContagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryContagensCalcFields(DataSet: TDataSet);
    procedure btnImprimirFitaContagemClick(Sender: TObject);
    procedure btnEditarQuantidadesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditoriaEstoque: TfrmAuditoriaEstoque;

implementation

{$R *.dfm}

uses uPergunta, DataModuleCaixa, uPrincipal, uAuditoriaEstoqueProdutos,
  uMensagem, uClasses, uFuncoes;

procedure TfrmAuditoriaEstoque.btnEditarQuantidadesClick(Sender: TObject);
begin
  frmAuditoriaEstoqueProdutos := TfrmAuditoriaEstoqueProdutos.Create(Self);
  frmAuditoriaEstoqueProdutos.idContagem := qryContagensidContagem.AsInteger;
  frmAuditoriaEstoqueProdutos.ShowModal;
  frmAuditoriaEstoqueProdutos.Free;
end;

procedure TfrmAuditoriaEstoque.btnImprimirFitaContagemClick(Sender: TObject);
var
  i : integer;
begin
  with dmCaixa.qryAuxiliar do
  begin
    Close;
    SQL.Text := Format('select ecp.*, p.Descricao, g.Descricao as DescricaoProduto, sg.Descricao as DescricaoSubGrupoProduto, l.Descricao as DescricaoLinhaProduto ' +
                       'from Estoque.EmpresaContagemProdutos ecp ' +
                       'inner join Produtos.Produtos p on ecp.idProduto = p.idProduto ' +
                       'inner join Produtos.SubGrupos sg on p.idSubGrupo = sg.idSubGrupo ' +
                       'inner join Produtos.Grupos g on sg.idGrupo = g.idGrupo ' +
                       'inner join Produtos.Linhas l on p.idLinha = l.idLinha ' +
                       'where ecp.idEmpresa = %d and ecp.idContagem = %d ' +
                       'order by descricao',
                [dmCaixa.Estacao.idEmpresa, qryContagensidContagem.AsInteger]);
    Open;

    if RecordCount > 0 then
    begin
      //***
      with frmPrincipal.impressora do
      begin
        if Ativo then
          Desativar;
        ColunasFonteNormal := dmCaixa.Estacao.Impressora.NumeroColunas;
        Porta := dmCaixa.Estacao.Impressora.FilaImpressao;
        Modelo := TACBrPosPrinterModelo(dmCaixa.Estacao.Impressora.ModeloImpressora);
        Ativar;

        ImprimirLinha('<e><n>Contagem de Estoque');
        ImprimirLinha('Data : ' + FormatDateTime('dd/mm/yy hh:nn:ss', qryContagensDataInicio.AsDateTime) + '</e></n>');

        ImprimirLinha(StringOfChar('-', ColunasFonteNormal));

        i := 0;
        while not Eof do
        begin
          ImprimirLinha(LeftPad(Copy(FieldByName('Descricao').AsString, 1 , 30), ' ', 30) + ' : _________');

          if i = 62 then
          begin
            ImprimirLinha(StringOfChar('-', ColunasFonteNormal));
            PularLinhas(5);
            i := 0;
          end
          else
            inc (i);
          Next;
        end;

        PularLinhas(3);
        CortarPapel;
        Desativar;
      end;
    end
    else
      frmMensagem.MostraMensagem('Nenhum produto foi encontrado para esta contagem.');
  end;
end;

procedure TfrmAuditoriaEstoque.btnIncluirContagemClick(Sender: TObject);
var
  i : integer;
  j : integer;
  descricao : string;
  qtde : string;
begin
  try
//    dmCaixa.dbTotalFastFood.StartTransaction;

    with qryContagens do
    begin
      try
        Insert;

        qryContagensidEmpresa.Value      := dmCaixa.Estacao.idEmpresa;
        qryContagensidContagem.Value     := RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Estoque.ContagensSequence');
        qryContagensidPessoaInicio.Value := dmCaixa.Usuario.ID;
        qryContagensDataInicio.Value     := Now;
        qryContagensStatus.Value         := 1;
        Post;
      except
        on e : Exception do
          raise Exception.Create('Erro inserindo nova contagem. ' + sLineBreak + e.Message);
      end;
    end;

    with TFDQuery.Create(Self) do
    begin
      Connection := dmCaixa.dbTotalFastFood;

      try
        //*** Agora insiro os ítens na contagem
        SQL.Text := Format('insert into Estoque.EmpresaContagemProdutos (idEmpresa, idContagem, idProduto) ' +
          ' select ep.idEmpresa, %d, ep.idProduto from Vendas.EmpresaProdutos ep inner join Produtos.Produtos p on p.idProduto = ep.idProduto ' +
          'where ep.idEmpresa = %d and p.IncluirNaContagem = 1', [qryContagensidContagem.AsInteger, dmCaixa.Estacao.idEmpresa]);
        Execute;

        if RowsAffected <= 0 then
          raise Exception.Create('Nenhum produto foi adicionado a contagem.');
      except
        on e : exception do
          raise Exception.Create('Erro inserindo ítens da contagem. ' + sLineBreak + SQL.Text + sLineBreak + e.Message);
      end;

      Free;
    end;

//    dmCaixa.dbTotalFastFood.Commit;
    frmPergunta.LimpaFormulario;
    frmPergunta.lblPergunta.Caption := 'Deseja imprimir fita da contagem?';
    if frmPergunta.ShowModal = mrOk then
      btnImprimirFitaContagemClick(btnIncluirContagem);
  except
    on e : exception do
    begin
//      dmCaixa.dbTotalFastFood.Rollback;
    end;
  end;
end;

procedure TfrmAuditoriaEstoque.FormShow(Sender: TObject);
begin
  inherited;

  with qryContagens do
  begin
    Close;
    SQL.Text := Format('select ec.*, pi.RazaoSocial as PessoaInicio, pf.RazaoSocial as PessoaFim from Estoque.EmpresaContagens ec ' +
      'inner join Contabil.Pessoas pi on pi.idPessoa = ec.idPessoaInicio ' +
      'left join Contabil.Pessoas pf on pf.idPessoa = ec.idPessoaFim ' +
      'where ec.idEmpresa = %d ' +
      'order by ec.DataInicio desc ', [dmCaixa.Estacao.idEmpresa]);
    Open;
  end;
end;

procedure TfrmAuditoriaEstoque.qryContagensCalcFields(DataSet: TDataSet);
begin
  inherited;
  case qryContagensStatus.AsInteger of
    1 : qryContagensStatusString.Value := 'Em contagem';
    2 : qryContagensStatusString.Value := 'Contagem efetuada';
    3 : qryContagensStatusString.Value := 'Contagem conferida';
  end;
end;

end.



