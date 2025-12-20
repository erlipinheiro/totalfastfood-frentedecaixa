unit uSelecionaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TfSelecionaPessoa = class(TForm)
    pnlConveniados: TPanel;
    Panel1: TPanel;
    btnVoltar: TImage;
    btnOK: TPanel;
    qryPessoas: TFDQuery;
    dsPessoas: TDataSource;
    qryPessoasidPessoa: TIntegerField;
    qryPessoasRazaoSocial: TStringField;
    qryPessoasNomeFantasia: TStringField;
    Panel2: TPanel;
    lblSelecione: TLabel;
    qryPessoassenha: TStringField;
    dbgridPessoas: TDBGrid;
    procedure btnOKClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgridPessoasDblClick(Sender: TObject);
  private
    FidTipoPessoa: integer;
    procedure SetidTipoPessoa(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property idTipoPessoa : integer read FidTipoPessoa write SetidTipoPessoa;
  end;

var
  fSelecionaPessoa: TfSelecionaPessoa;

implementation

{$R *.dfm}

uses DataModuleCaixa;

procedure TfSelecionaPessoa.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSelecionaPessoa.btnVoltarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfSelecionaPessoa.dbgridPessoasDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfSelecionaPessoa.FormCreate(Sender: TObject);
begin
  qryPessoas.Close;
end;

procedure TfSelecionaPessoa.FormShow(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[dmCaixa.NumeroMonitor].BoundsRect;
  WindowState := wsMaximized;
  qryPessoas.Open;
end;

procedure TfSelecionaPessoa.SetidTipoPessoa(const Value: integer);
begin
  FidTipoPessoa := Value;

  qryPessoas.ParamByName('idEmpresa').Value := dmCaixa.Estacao.idEmpresa;
  qryPessoas.ParamByName('idTipoPessoa').Value := FidTipoPessoa;

  case FidTipoPEssoa of
    1 : lblSelecione.caption := 'Selecione um cliente';
    2 : lblSelecione.caption := 'Selecione um colaborador';
    3 : lblSelecione.caption := 'Selecione um fornecedor';
    4 : lblSelecione.caption := 'Selecione um prestador de serviços';
    5 : begin
      lblSelecione.caption := 'Selecione um usuário do sistema';
      qryPessoas.sql.Text := format('select distinct ep.idPessoa, p.RazaoSocial, p.NomeFantasia, p.senha from Contabil.EmpresaPessoas ep ' +
        'inner join Contabil.EmpresaPessoaTipos ept on ept.idEmpresa = ep.idEmpresa and ept.idPessoa = ep.idPessoa and ept.idTipoPessoa = %d ' +
        'inner join Contabil.TiposPessoa tp on ept.idTipoPessoa = tp.idTipoPessoa ' +
        'inner join Contabil.Pessoas p on ep.idPessoa = p.idPessoa ' +
        'inner join Seguranca.UsuarioPerfis up on up.idEmpresa = ep.idEmpresa and up.idUsuario = p.idPessoa ' +
        'where ep.idEmpresa = %d and ep.Ativa = 1 and ((up.idPerfil in ' +
        '        (select distinct idPerfil from Seguranca.PerfilControles pc where pc.idControle in ' +
        '	       (select idControle from Seguranca.Controles where idSistema=2) and Permitir = 1)) or (exists (select 1 from seguranca.Permissoes per ' +
        '		   where per.idEmpresa=ep.idEmpresa and per.idPessoa = ep.idPessoa and per.idControle in ' +
        '	       (select idControle from Seguranca.Controles where idSistema=2) and Permitir = 1))) ' +
        'order by p.RazaoSocial ', [FidTipoPessoa, dmCaixa.Estacao.idEmpresa]);

    end;
    6 : lblSelecione.caption := 'Selecione um administrador do sistema';
    7 : lblSelecione.caption := 'Selecione um garçon';
    8 : lblSelecione.caption := 'Selecione um entregador';
  end;
  case FidTipoPessoa of
    1,2,5,6,7,8 : begin
      dbgridPessoas.Columns.Items[0].Title.Caption := 'Nome';
      dbgridPessoas.Columns.Items[1].Title.Caption := 'Nome reduzido (apelido)';
    end;
    else
    begin
      dbgridPessoas.Columns.Items[0].Title.Caption := 'Razão social';
      dbgridPessoas.Columns.Items[1].Title.Caption := 'Nome de fantasia';
    end;
  end;
end;

end.
