unit uPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxClasses, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvExExtCtrls, JvExtComponent, JvPanel, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TfrmPessoas = class(TfrmFormPadrao)
    qryCadastroPessoas: TFDQuery;
    dsCadastroPessoas: TDataSource;
    dbgridPrincipal: TcxGrid;
    dbgridPrincipalDBTableView1: TcxGridDBTableView;
    dbgridPrincipalDBTableView1idPessoa: TcxGridDBColumn;
    dbgridPrincipalDBTableView1RazaoSocial: TcxGridDBColumn;
    dbgridPrincipalDBTableView1NomeFantasia: TcxGridDBColumn;
    dbgridPrincipalDBTableView1CNPJ: TcxGridDBColumn;
    dbgridPrincipalDBTableView1IE: TcxGridDBColumn;
    dbgridPrincipalDBTableView1IEST: TcxGridDBColumn;
    dbgridPrincipalDBTableView1IM: TcxGridDBColumn;
    dbgridPrincipalDBTableView1CNAE: TcxGridDBColumn;
    dbgridPrincipalDBTableView1CRT: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Logradouro: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Numero: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Complemento: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Bairro: TcxGridDBColumn;
    dbgridPrincipalDBTableView1CodigoMunicipio: TcxGridDBColumn;
    dbgridPrincipalDBTableView1NomeMunicipio: TcxGridDBColumn;
    dbgridPrincipalDBTableView1UF: TcxGridDBColumn;
    dbgridPrincipalDBTableView1CEP: TcxGridDBColumn;
    dbgridPrincipalDBTableView1CodigoPais: TcxGridDBColumn;
    dbgridPrincipalDBTableView1NomePais: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Telefone1: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Telefone2: TcxGridDBColumn;
    dbgridPrincipalDBTableView1Telefone3: TcxGridDBColumn;
    dbgridPrincipalDBTableView1FisicaJuridica: TcxGridDBColumn;
    dbgridPrincipalDBTableView1TipoPessoa: TcxGridDBColumn;
    dbgridPrincipalLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    btnIncluir: TJvPanel;
    btnAlterar: TJvPanel;
    btnRedefinirSenha: TJvPanel;
    btnPermissoes: TJvPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRedefinirSenhaClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPermissoesClick(Sender: TObject);
    procedure dbgridPrincipalDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

{$R *.dfm}

uses DataModuleCaixa, uDefinirSenha, uFormPessoas, uPermissoes;

procedure TfrmPessoas.btnAlterarClick(Sender: TObject);
begin
  frmFormCadastroPessoas := TfrmFormCadastroPessoas.Create(Self);
  frmFormCadastroPessoas.flInserindo := False;
  frmFormCadastroPessoas.qryCadastro.Locate('idPessoa', qryCadastroPessoas.FieldByName('idPessoa').AsInteger, [loPartialKey, loCaseInsensitive]);
  if frmFormCadastroPessoas.ShowModal = mrOK then
    qryCadastroPessoas.Refresh;
  frmFormCadastroPessoas.Close;
end;

procedure TfrmPessoas.btnIncluirClick(Sender: TObject);
begin
  frmFormCadastroPessoas := TfrmFormCadastroPessoas.Create(Self);
  frmFormCadastroPessoas.flInserindo := True;
  if frmFormCadastroPessoas.ShowModal = mrOK then
    qryCadastroPessoas.Refresh;
  frmFormCadastroPessoas.Close;
end;

procedure TfrmPessoas.btnPermissoesClick(Sender: TObject);
begin
  frmPermissoes := TfrmPermissoes.Create(Self);
  frmPermissoes.idPessoa := qryCadastroPessoas.FieldByName('idPessoa').asInteger;
  frmPermissoes.ShowModal;
  frmPermissoes.Free;
end;

procedure TfrmPessoas.btnRedefinirSenhaClick(Sender: TObject);
begin
  inherited;

  frmDefinirSenha := TfrmDefinirSenha.Create(Self);

  if frmDefinirSenha.ShowModal = mrOK then
  begin
    with dmCaixa.qryAuxiliar do
    begin
      Close;
      SQL.Text := 'update Contabil.Pessoas set senha = ' + QuotedStr (frmDefinirSenha.edtSenha.Text) +
        ' where idPessoa = ' + qryCadastroPessoas.FieldByName('idPessoa').AsString;
      ExecSQL;

      if RowsAffected <= 0 then
        raise Exception.Create('Erro inserindo a senha na pessoa. Operação não concluída.');

      Close;
    end;
  end;

  frmDefinirSenha.Free;
end;

procedure TfrmPessoas.dbgridPrincipalDBTableView1DblClick(Sender: TObject);
begin
  inherited;

  btnAlterarClick(Self);
end;

procedure TfrmPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  qryCadastroPessoas.Close;
end;

procedure TfrmPessoas.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadastroPessoas.ParamByName('idEmpresa').AsInteger := dmCaixa.Estacao.idEmpresa;
  qryCadastroPessoas.Open;
end;

procedure TfrmPessoas.FormShow(Sender: TObject);
begin
  inherited;

  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
end;

end.
