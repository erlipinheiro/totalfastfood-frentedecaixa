unit uFormPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, Vcl.Buttons, cxTextEdit, cxMaskEdit, cxDBEdit,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, Vcl.Mask, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, ACBrBase, ACBrValidador, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmFormCadastroPessoas = class(TfrmFormPadrao)
    qryCadastro: TFDQuery;
    qryCadastroidPessoa: TIntegerField;
    strngfldCadastroRazaoSocial: TStringField;
    strngfldCadastroNomeFantasia: TStringField;
    strngfldCadastroCNPJ: TStringField;
    strngfldCadastroIE: TStringField;
    strngfldCadastroIEST: TStringField;
    strngfldCadastroIM: TStringField;
    strngfldCadastroCNAE: TStringField;
    qryCadastroCRT: TIntegerField;
    strngfldCadastroLogradouro: TStringField;
    strngfldCadastroNumero: TStringField;
    strngfldCadastroComplemento: TStringField;
    strngfldCadastroBairro: TStringField;
    qryCadastroCodigoMunicipio: TIntegerField;
    strngfldCadastroNomeMunicipio: TStringField;
    strngfldCadastroUF: TStringField;
    strngfldCadastroCEP: TStringField;
    qryCadastroCodigoPais: TIntegerField;
    strngfldCadastroNomePais: TStringField;
    strngfldCadastroTelefone1: TStringField;
    strngfldCadastroTelefone2: TStringField;
    strngfldCadastroTelefone3: TStringField;
    strngfldCadastroFisicaJuridica: TStringField;
    strngfldCadastroSenha: TStringField;
    dsCadastro: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    lblNome: TLabel;
    dbedtidPessoa: TDBEdit;
    dbedtRazaoSocial: TDBEdit;
    dbcbbFisicaJuridica: TDBComboBox;
    pcPessoa: TJvPageControl;
    tsPessoaDados: TTabSheet;
    lblNomeFantasia: TLabel;
    lblCnpj: TLabel;
    lblInscricaoEstadual: TLabel;
    lblInscricaoMunicipal: TLabel;
    lblCNAE: TLabel;
    dbedtNomeFantasia: TDBEdit;
    dbedtIE: TDBEdit;
    dbedtIM: TDBEdit;
    dbedtCNAE: TDBEdit;
    btnConsultarCNPJ: TButton;
    edtCNPJCPF: TcxDBMaskEdit;
    tsPessoaEndereco: TTabSheet;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    dbedtLogradouro: TDBEdit;
    dbedtBairro: TDBEdit;
    dbedtComplemento: TDBEdit;
    dbedtCEP: TDBEdit;
    dbedtTelefone1: TDBEdit;
    dbedtTelefone2: TDBEdit;
    dbedtTelefone3: TDBEdit;
    dbedtNumero: TDBEdit;
    dbedtCodigoMunicipio: TDBEdit;
    dbedtNomeMunicipio: TDBEdit;
    tsPessoaContatos: TTabSheet;
    btnIncluirPessoaContatos: TSpeedButton;
    btnAlterarPessoaContatos: TSpeedButton;
    btnExcluirPessoaContatos: TSpeedButton;
    lbl13: TLabel;
    dbgridDependentes: TJvDBUltimGrid;
    ts1: TTabSheet;
    lbl14: TLabel;
    lstTipoOrigem: TListBox;
    btnInserirTipoPessoa: TButton;
    btnExcluirTipoPessoa: TButton;
    lstTipoDestino: TListBox;
    lbl15: TLabel;
    qryTiposPessoa: TFDQuery;
    qryTiposPessoaidTipoPessoa: TIntegerField;
    strngfldTiposPessoaDescricao: TStringField;
    qryEmpresaPessoaTipos: TFDQuery;
    qryEmpresaPessoaTiposidEmpresa: TIntegerField;
    qryEmpresaPessoaTiposidPessoa: TIntegerField;
    qryEmpresaPessoaTiposidTipoPessoa: TIntegerField;
    strngfldEmpresaPessoaTiposDescricao: TStringField;
    btnRedefinirSenha: TJvPanel;
    chkAtiva: TCheckBox;
    ACBrValidador1: TACBrValidador;
    procedure btnInserirTipoPessoaClick(Sender: TObject);
    procedure btnExcluirTipoPessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKPadraoClick(Sender: TObject);
    procedure btnVoltarPadraoClick(Sender: TObject);
    procedure btnRedefinirSenhaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    idPessoa : integer;
  public
    { Public declarations }
    flInserindo : boolean;
  end;

var
  frmFormCadastroPessoas: TfrmFormCadastroPessoas;

implementation

{$R *.dfm}

uses DataModuleCaixa, uMensagem, uDefinirSenha, uFuncoes;

procedure TfrmFormCadastroPessoas.btnExcluirTipoPessoaClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;

  for I := lstTipoDestino.Items.Count - 1 downto 0 do
  begin
    if lstTipoDestino.Selected[i] then
    begin
      lstTipoOrigem.Items.Add(lstTipoDestino.Items.Strings[i]);
      lstTipoDestino.Items.Delete(i);
    end;
  end;
end;

procedure TfrmFormCadastroPessoas.btnInserirTipoPessoaClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;

  with lstTipoOrigem do
  begin
    for I := lstTipoOrigem.Items.Count - 1 downto 0 do
    begin
      if lstTipoOrigem.Selected[i] then
      begin
        lstTipoDestino.Items.Add(lstTipoOrigem.Items.Strings[i]);
        lstTipoOrigem.Items.Delete(i);
      end;
    end;
  end;
end;

procedure TfrmFormCadastroPessoas.btnOKPadraoClick(Sender: TObject);
var
  i : Integer;

  procedure InserePermissoes;
  begin
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'Select * from Seguranca.Controles order by idControle';
      Open;
      While not EOF do
      begin
        if Inserir(Self, dmCaixa.dbTotalFastFood, 'Seguranca.Permissoes', ['idEmpresa', 'idPessoa', 'idControle', 'chave'],
          [qryCadastro.FieldByName('idEmpresa').AsInteger, qryCadastro.FieldByName('idEmpresa').AsInteger,
           FieldByName('idControle').AsInteger, '0']) <= 0 then
          raise exception.Create('Erro inserindo permissão do usuário.');

        Next;
      end;
      Close;
    end;

  end;

  function NaoExisteRestricoes : boolean;
  begin
    result := True;

    if trim(qryCadastro.FieldByName('RazaoSocial').AsString) = '' then
    begin
      result := False;
      frmMensagem.MostraMensagem('Você deve preencher o campo NOME.');
      if dbedtRazaoSocial.CanFocus then
        dbedtRazaoSocial.SetFocus;
    end
    else if trim(qryCadastro.FieldByName('FisicaJuridica').AsString) = '' then
    begin
      result := False;
      frmMensagem.MostraMensagem('Você deve preencher o campo FÍSICA ou JURÍDICA.');
      if dbcbbFisicaJuridica.CanFocus then
        dbcbbFisicaJuridica.SetFocus;
    end
    else if trim(qryCadastro.FieldByName('CNPJ').AsString) = '' then
    begin
      result := False;
      frmMensagem.MostraMensagem('Você deve preencher o campo CNPJ / CPF.');
      if edtCNPJCPF.CanFocus then
        edtCNPJCPF.SetFocus;
    end
    else if trim(qryCadastro.FieldByName('FisicaJuridica').AsString) = '' then
    begin
      result := False;
      frmMensagem.MostraMensagem('Você deve preencher o campo Física ou Jurídica.');
      if dbcbbFisicaJuridica.CanFocus then
        dbcbbFisicaJuridica.SetFocus;
    end
    else
    begin
      ACBrValidador1.Documento := qryCadastro.FieldByName('CNPJ').AsString;
      if UpperCase(qryCadastro.FieldByName('FisicaJuridica').AsString) = 'F' then
        ACBrValidador1.TipoDocto := docCPF
      else
        ACBrValidador1.TipoDocto := docCNPJ;

      if Not ACBrValidador1.Validar then
      begin
        if ACBrValidador1.TipoDocto = docCPF then
          frmMensagem.MostraMensagem('CPF inválido.')
        else
          frmMensagem.MostraMensagem('CNPJ inválido.');
        result := false;
        if edtCNPJCPF.CanFocus then
          edtCNPJCPF.SetFocus;
      end;
    end;
  end;
begin
  if NaoExisteRestricoes then
  begin
    qryCadastro.Post;
    if flInserindo then
    begin
      try
        //*** Insiro a pessoa na empresa
        //*** Agora o coloco na empresa
        Inserir(Self, dmCaixa.dbTotalFastFood, 'Contabil.EmpresaPessoas', ['idEmpresa', 'idPessoa', 'Ativa'], [dmCaixa.Estacao.idEmpresa, idPessoa, chkAtiva.Checked]);
      except on E: Exception do
        raise Exception.Create('Erro inserindo a pessoa na empresa.' + sLineBreak + e.Message);
      end;
    end
    else
    begin
      try
        if chkAtiva.Checked then
          Atualizar(dmCaixa.dbTotalFastFood, 'Contabil.EmpresaPessoas', ['idEmpresa', 'idPessoa'],
            [dmCaixa.Estacao.idEmpresa, qryCadastro.FieldByName('idPessoa').AsInteger],
            ['Ativa'], [1])
        else
          Atualizar(dmCaixa.dbTotalFastFood, 'Contabil.EmpresaPessoas', ['idEmpresa', 'idPessoa'],
            [dmCaixa.Estacao.idEmpresa, qryCadastro.FieldByName('idPessoa').AsInteger],
            ['Ativa'], [0]);
      except on E: Exception do
        begin
          if chkAtiva.Checked then
            raise Exception.Create('Erro atualizando status da pessoa na empresa.' + sLineBreak +
              'idEmpresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa) + sLineBreak +
              'idPessoa = ' + IntToStr(qryCadastro.FieldByName('idPessoa').AsInteger) + sLineBreak +
              'Ativa = 1')
          else
            raise Exception.Create('Erro atualizando status da pessoa na empresa.' + sLineBreak +
              'idEmpresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa) + sLineBreak +
              'idPessoa = ' + IntToStr(qryCadastro.FieldByName('idPessoa').AsInteger) + sLineBreak +
              'Ativa = 0');
        end;
      end;
    end;

    try
      with dmCaixa.qryAuxiliar do
      begin
        Close;
        SQL.Text := 'delete from Contabil.EmpresaPessoaTipos where idEmpresa = ' + IntToStr(dmCaixa.Estacao.idEmpresa) +
          ' and idPessoa = ' + qryCadastroidPessoa.AsString;
        SQL.Text := UpperCase(SQL.Text);
        Execute;
      end;

      //*** Agora incluo se tiver na lista...
      for i := 0 to lstTipoDestino.Count - 1 do
      begin
        if qryTiposPessoa.Locate('descricao', lstTipoDestino.Items.Strings[i], []) then
        begin
          Inserir(Self, dmCaixa.dbTotalFastFood, 'Contabil.EmpresaPessoaTipos', ['idEmpresa', 'idPessoa','idTipoPessoa'],
            [dmCaixa.Estacao.idEmpresa, qryCadastro.FieldByName('idPessoa').AsInteger,
              qryTiposPessoa.FieldByName('idTipoPessoa').AsInteger]);

          //*** Se for usuário marco para fazer a inclusão das permissões
          if flInserindo then
          begin
            if qryTiposPessoa.FieldByName('idTipoPessoa').AsInteger = 5 then
              InserePermissoes;
          end;
        end;
      end;

      inherited;
    except
      on e : exception do
        Exception.Create('Erro gravando tipos do Pessoa. ' + e.Message);
    end;
  end;
end;

procedure TfrmFormCadastroPessoas.btnRedefinirSenhaClick(Sender: TObject);
begin
  frmDefinirSenha := TfrmDefinirSenha.Create(Self);

  if frmDefinirSenha.ShowModal = mrOK then
    qryCadastro.FieldByName('Senha').Value := frmDefinirSenha.edtSenha.Text;

  frmDefinirSenha.Free;
end;

procedure TfrmFormCadastroPessoas.btnVoltarPadraoClick(Sender: TObject);
begin
  inherited;

  //*** Cancelo tudo
  qryCadastro.Cancel;
end;

procedure TfrmFormCadastroPessoas.FormCreate(Sender: TObject);
begin
  inherited;

  flInserindo := False;
  qryCadastro.Open;
  qryTiposPessoa.Open;
  qryEmpresaPessoaTipos.Open;
end;

procedure TfrmFormCadastroPessoas.FormShow(Sender: TObject);
begin
  inherited;
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;

  if not flInserindo then
  begin
    with qryEmpresaPessoaTipos do
    begin
      Close;
      ParamByName('idEmpresa').value := dmCaixa.Estacao.idEmpresa;
      ParamByName('idPessoa').Value := qryCadastro.FieldByName('idPessoa').AsInteger;
      Open;
    end;

    //*** Buscando dados da pessoa na empresa
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := Format('Select * from Contabil.EmpresaPessoas where idEmpresa = %d and idPessoa = %d', 
        [dmCaixa.Estacao.idEmpresa, qryCadastro.FieldByName('idPessoa').AsInteger]);
      Open;

      if RecordCount <= 0 then
        raise Exception.Create('Erro buscando dados da pessoa na empresa.' + sLineBreak + 'A pessoa existe nesta empresa?');

      chkAtiva.Checked := FieldByName('Ativa').AsBoolean;
      Close;      
    end;

    
    qryCadastro.Edit;
  end
  else
  begin
    qryCadastro.Insert;

    idPEssoa := RetornaValorSequence(dmCaixa.dbTotalFastFood, 'Contabil.PessoasSequence');
    chkAtiva.Checked := True;

    if not idPessoa > 0 then
    begin
      raise Exception.Create('O valor da sequence retornado para o ID da pessoa é inválido.');
      ModalResult := mrCancel;
    end
    else
      qryCadastro.FieldByName('idPessoa').Value := idPessoa;
  end;

  lstTipoOrigem.Items.Clear;
  lstTipoDestino.Items.Clear;
  with qryTiposPessoa do
  begin
    First;
    if (RecordCount > 0) then
    begin
      //*** Preencho a lista de Origem
      while not eof do
      begin
        if not qryEmpresaPessoaTipos.Locate('idTipoPessoa', FieldByName('idTipoPessoa').AsInteger, []) then
          lstTipoOrigem.Items.Add(FieldByName('descricao').AsString);
        Next;
      end;
    end;
  end;

  qryEmpresaPessoaTipos.First;
  while not qryEmpresaPessoaTipos.eof do
  begin
    lstTipoDestino.Items.Add(qryEmpresaPessoaTipos.FieldByName('descricao').AsString);
    qryEmpresaPessoaTipos.Next;
  end;

end;

end.
