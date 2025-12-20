unit uMenuFiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, JvExExtCtrls,
  JvExtComponent, JvPanel, Vcl.Imaging.jpeg, Vcl.ExtCtrls, ACBrDevice, JvWizard,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvSpin, JvExControls, JvCalendar, ACBrPAFClass,
  System.Math, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdException, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TNomeRelatorioMenuFiscal = (mfNenhum, mfLX, mfRZ, mfLMFC, mfLMFS, mfMF, mfEspelhoMFD, mfArqMFD, mfCAT52,
    mfMeiosPagamento, mfDAVEmitidos, mfIdentificacaoPAFCEF, mfConfiguracoesPAFECF);
  TfrmMenuFiscal = class(TfrmFormPadrao)
    wzRelatorioMenuFiscal: TJvWizard;
    tsEscolhaRelatorio: TJvWizardInteriorPage;
    Panel3: TPanel;
    btnLeituraX: TPanel;
    btnEspelhoMFD: TPanel;
    btnLMFC: TPanel;
    btnConsultarProdutos: TPanel;
    btnLMFS: TPanel;
    btnArquivoMFD: TPanel;
    btnCAT52: TPanel;
    btnMeiosPagamento: TPanel;
    btnDAVEmitidos: TPanel;
    btnIdentificacaPAFECF: TPanel;
    btnConfiguracoesPAFECF: TPanel;
    btnReduzaoZ: TPanel;
    tsOpcoesRelatorio: TJvWizardInteriorPage;
    chkMenuFiscalGerarArquivo: TCheckBox;
    chkMenuFiscalCotepe1704: TCheckBox;
    rgTipoEmissao: TRadioGroup;
    tsPeriodo: TJvWizardInteriorPage;
    edtDataInicial: TJvMonthCalendar2;
    Panel1: TPanel;
    Panel2: TPanel;
    edtDataFinal: TJvMonthCalendar2;
    tsIntervaloCOO: TJvWizardInteriorPage;
    Panel4: TPanel;
    Panel5: TPanel;
    edtInicioIntervalo: TJvSpinEdit;
    edtFimIntervalo: TJvSpinEdit;
    dlgDialogoSalvar: TSaveDialog;
    btnCancelaUltimoCupomFiscal: TPanel;
    IdFTP1: TIdFTP;
    qrySenha: TFDQuery;
    qrySenhaidPessoa: TIntegerField;
    qrySenhaRazaoSocial: TStringField;
    qrySenhaNomeFantasia: TStringField;
    qrySenhaSenha: TStringField;
    dsSenha: TDataSource;
    dspSenha: TDataSetProvider;
    cdsSenha: TClientDataSet;
    cdsSenhaidPessoa: TIntegerField;
    cdsSenhaRazaoSocial: TStringField;
    cdsSenhaNomeFantasia: TStringField;
    cdsSenhaSenha: TStringField;
    qryGarcons: TFDQuery;
    intgrfld1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    dspGarcons: TDataSetProvider;
    cdsGarcons: TClientDataSet;
    intgrfld2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    dsGarcons: TDataSource;
    procedure btnLeituraXClick(Sender: TObject);
    procedure btnReduzaoZClick(Sender: TObject);
    procedure btnLMFCClick(Sender: TObject);
    procedure edtInicioIntervaloChange(Sender: TObject);
    procedure wzRelatorioMenuFiscalActivePageChanged(Sender: TObject);
    procedure tsOpcoesRelatorioNextButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure wzRelatorioMenuFiscalFinishButtonClick(Sender: TObject);
    procedure btnCancelaUltimoCupomFiscalClick(Sender: TObject);
    procedure btnEspelhoMFDClick(Sender: TObject);
    procedure btnArquivoMFDClick(Sender: TObject);
    procedure btnConsultarProdutosClick(Sender: TObject);
    procedure btnCAT52Click(Sender: TObject);
    procedure btnLMFSClick(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function NaoExisteRestricoes : boolean;
  public
    { Public declarations }
    UltimaPagina : TJvWizardInteriorPage;
    NomeRelatorio : TNomeRelatorioMenuFiscal;
    PathArquivo: string;
    procedure ImprimeLMFC;
    procedure ImprimeLMFS;
    procedure ImprimeEspelhoMFD;
    procedure ImprimeCAT52;
  end;

var
  frmMenuFiscal: TfrmMenuFiscal;

implementation

{$R *.dfm}

uses uPrincipal, uMensagem, DataModuleCaixa, frmBobinaECF;

procedure TfrmMenuFiscal.btnArquivoMFDClick(Sender: TObject);
var
  PathArquivo: String;
begin
  dlgDialogoSalvar.DefaultExt := '.mfd';
  dlgDialogoSalvar.Filter := 'Arquivos binários MF|*.mfd';

  if dlgDialogoSalvar.Execute then
  begin
    PathArquivo := dlgDialogoSalvar.FileName;

    frmPrincipal.ACBrECF1.PafMF_ArqMFD_Binario(PathArquivo);

    // será gerado o arquivo bináio e o arquivo .txt com a assinatura EAD
    frmMensagem.MostraMensagem(Format('Arquivo MFD gerado com sucesso em:'#13#10' "%s"', [PathArquivo]));
  end;
end;

procedure TfrmMenuFiscal.btnCancelaUltimoCupomFiscalClick(Sender: TObject);
begin
  frmPrincipal.ACBrECF1.CancelaCupom;
end;

procedure TfrmMenuFiscal.btnCAT52Click(Sender: TObject);
begin
  tsOpcoesRelatorio.Enabled := False;
  tsPeriodo.Enabled := True;
  tsIntervaloCOO.Enabled := False;

  UltimaPagina := tsPeriodo;
  NomeRelatorio := mfCAT52;
  wzRelatorioMenuFiscal.ActivePage := tsPeriodo;
end;

procedure TfrmMenuFiscal.btnConsultarProdutosClick(Sender: TObject);
var
  PathArquivo: String;
begin
  dlgDialogoSalvar.DefaultExt := '.mf';
  dlgDialogoSalvar.Filter := 'Arquivos binários MF|*.mf';

  if dlgDialogoSalvar.Execute then
  begin
    PathArquivo := dlgDialogoSalvar.FileName;
    frmPrincipal.ACBrECF1.PafMF_ArqMF_Binario(PathArquivo);

    // será gerado o arquivo bináio e o arquivo .txt com a assinatura EAD

    frmMensagem.MostraMensagem(Format('Arquivo MF gerado com sucesso em:'#13#10' "%s"', [PathArquivo]));
  end;
end;

procedure TfrmMenuFiscal.btnEspelhoMFDClick(Sender: TObject);
begin
  tsOpcoesRelatorio.Enabled := True;
  tsPeriodo.Enabled := True;
  tsIntervaloCOO.Enabled := False;

  UltimaPagina := tsEscolhaRelatorio;
  NomeRelatorio := mfEspelhoMFD;
  wzRelatorioMenuFiscal.ActivePage := tsOpcoesRelatorio;
end;

procedure TfrmMenuFiscal.btnLeituraXClick(Sender: TObject);
begin
  frmPrincipal.ACBrECF1.PafMF_LX_Impressao;
end;

procedure TfrmMenuFiscal.btnLMFSClick(Sender: TObject);
begin
  tsOpcoesRelatorio.Enabled := True;
  tsPeriodo.Enabled := False;
  tsIntervaloCOO.Enabled := False;

  UltimaPagina := tsEscolhaRelatorio;
  NomeRelatorio := mfLMFS;
  wzRelatorioMenuFiscal.ActivePage := tsOpcoesRelatorio;
end;

procedure TfrmMenuFiscal.btnLMFCClick(Sender: TObject);
begin
  tsOpcoesRelatorio.Enabled := True;
  tsPeriodo.Enabled := False;
  tsIntervaloCOO.Enabled := False;

  UltimaPagina := tsEscolhaRelatorio;
  NomeRelatorio := mfLMFC;
  wzRelatorioMenuFiscal.ActivePage := tsOpcoesRelatorio;
end;

procedure TfrmMenuFiscal.btnReduzaoZClick(Sender: TObject);
Var
  Resp : TModalResult ;
begin
  if frmPrincipal.ACBrECF1.Estado <> estRequerZ then
  begin
     if MessageDlg('A Redução Z pode Bloquear o seu ECF até as 12:00pm'+#10+#10+
                  'Continua assim mesmo ?',mtWarning,mbYesNoCancel,0) <> mrYes then
        exit ;

     if MessageDlg('Você tem certeza ?',mtWarning,mbYesNoCancel,0) <> mrYes then
        exit ;
  end ;

  Resp := MessageDlg('Enviar hora atual ?',mtConfirmation,mbYesNoCancel,0) ;

  if Resp = mrYes then
     frmPrincipal.ACBrECF1.ReducaoZ( now )
  else if Resp = mrNo then
     frmPrincipal.ACBrECF1.ReducaoZ( )
  else
     exit ;
end;

procedure TfrmMenuFiscal.edtInicioIntervaloChange(Sender: TObject);
begin
  inherited;

  if edtInicioIntervalo.Value > 0 then
    edtFimIntervalo.MinValue := edtInicioIntervalo.Value;
end;

procedure TfrmMenuFiscal.FormCreate(Sender: TObject);
begin
  inherited;

  edtDataInicial.DateFirst := Now;
  edtDataInicial.Today := Now;
  edtDataFinal.DateFirst := Now;
  edtDataFinal.Today := Now;
end;

procedure TfrmMenuFiscal.IdFTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  inherited;
  fBobinaECF.AtualizaBobina('Outras informações: ' + AStatusText);
end;

procedure TfrmMenuFiscal.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
Var
  Transferido : Integer;
begin
  Transferido := AWorkCount div 1024;
//  fBobinaECF.pb1.Position := AWorkCount;
end;

procedure TfrmMenuFiscal.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  inherited;
  fBobinaECF.Visible := True;
//  fBobinaECF.pb1.Position := 0;
//  fBobinaECF.pb1.Max := AWorkCountMax;
end;

procedure TfrmMenuFiscal.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
//  fBobinaECF.pb1.Position := fBobinaECF.pb1.Max;
  fBobinaECF.AtualizaBobina('Arquivo enviado com sucesso.');
  Sleep(2000);
  if IdFTP1.Connected then
    IdFTP1.Disconnect;

  Self.Close;
end;

procedure TfrmMenuFiscal.ImprimeCAT52;
begin
  dlgDialogoSalvar.DefaultExt := '.txt';
  dlgDialogoSalvar.Filter := 'Arquivos texto|*.txt';

  if dlgDialogoSalvar.Execute then
  begin
    PathArquivo := dlgDialogoSalvar.FileName;

    frmPrincipal.ACBrECF1.PafMF_GerarCAT52(edtDataInicial.DateFirst, edtDataFinal.DateFirst, PathArquivo);

    frmMensagem.MostraMensagem(Format('Arquivos gerados com sucesso em:'#13#10' "%s"', [PathArquivo]));
  end;
end;

procedure TfrmMenuFiscal.ImprimeEspelhoMFD;
begin
  dlgDialogoSalvar.DefaultExt := '.txt';
  dlgDialogoSalvar.Filter := 'Arquivos texto|*.txt';

  if dlgDialogoSalvar.Execute then
  begin
    PathArquivo := dlgDialogoSalvar.FileName;

    if rgTipoEmissao.ItemIndex = 0 then
      frmPrincipal.ACBrECF1.PafMF_MFD_Espelho(edtDataInicial.DateFirst, edtDataFinal.DateFirst, PathArquivo)
    else
      frmPrincipal.ACBrECF1.PafMF_MFD_Espelho(edtInicioIntervalo.Value, edtFimIntervalo.Value, PathArquivo);

    frmMensagem.MostraMensagem(Format('Arquivo gerado com sucesso em:'#13#10' "%s"', [PathArquivo]));
  end;
end;

procedure TfrmMenuFiscal.ImprimeLMFC;
begin
  if chkMenuFiscalGerarArquivo.Checked then
  begin
    dlgDialogoSalvar.DefaultExt := '.txt';
    dlgDialogoSalvar.Filter := 'Arquivos texto|*.txt';

    if dlgDialogoSalvar.Execute then
    begin
      PathArquivo := dlgDialogoSalvar.FileName;

      if chkMenuFiscalCotepe1704.Checked then
      begin
        if rgTipoEmissao.ItemIndex = 0 then
          frmPrincipal.ACBrECF1.PafMF_LMFC_Cotepe1704(edtDataInicial.DateFirst, edtDataFinal.DateFirst, PathArquivo)
        else
          frmPrincipal.ACBrECF1.PafMF_LMFC_Cotepe1704(edtInicioIntervalo.Value, edtFimIntervalo.Value, PathArquivo);
      end
      else
      begin
        if rgTipoEmissao.ItemIndex = 0 then
          frmPrincipal.ACBrECF1.PafMF_LMFC_Espelho(edtDataInicial.DateFirst, edtDataFinal.DateFirst, PathArquivo)
        else
          frmPrincipal.ACBrECF1.PafMF_LMFC_Espelho(edtInicioIntervalo.Value, edtFimIntervalo.Value, PathArquivo);
      end;

      frmMensagem.MostraMensagem(Format('Arquivo gerado com sucesso em:'#13#10' "%s"', [PathArquivo]));
    end;
  end
  else
  begin
    if rgTipoEmissao.ItemIndex = 0 then
      frmPrincipal.ACBrECF1.PafMF_LMFC_Impressao(edtDataInicial.DateFirst, edtDataFinal.DateFirst)
    else
      frmPrincipal.ACBrECF1.PafMF_LMFC_Impressao(edtInicioIntervalo.Value, edtFimIntervalo.Value);
  end;
end;

procedure TfrmMenuFiscal.ImprimeLMFS;
var
  PathArquivo: string;
begin
  if chkMenuFiscalGerarArquivo.Checked then
  begin
    dlgDialogoSalvar.DefaultExt := '.txt';
    dlgDialogoSalvar.Filter := 'Arquivos texto|*.txt';

    if dlgDialogoSalvar.Execute then
    begin
      PathArquivo := dlgDialogoSalvar.FileName;
      if rgTipoEmissao.ItemIndex = 0 then
        frmPrincipal.ACBrECF1.PafMF_LMFS_Espelho(edtDataInicial.DateFirst, edtDataFinal.DateFirst, PathArquivo)
      else
        frmPrincipal.ACBrECF1.PafMF_LMFS_Espelho(edtInicioIntervalo.Value, edtFimIntervalo.Value, PathArquivo);

      frmMensagem.MostraMensagem(Format('Arquivo gerado com sucesso em:'#13#10' "%s"', [PathArquivo]));
    end;
  end
  else
  begin
    if rgTipoEmissao.ItemIndex = 0 then
      frmPrincipal.ACBrECF1.PafMF_LMFS_Impressao(edtDataInicial.DateFirst, edtDataFinal.DateFirst)
    else
      frmPrincipal.ACBrECF1.PafMF_LMFS_Impressao(edtInicioIntervalo.Value, edtFimIntervalo.Value);
  end;
end;

function TfrmMenuFiscal.NaoExisteRestricoes: boolean;
  function PeriodoOK : boolean;
  begin
    result := True;

    if edtDataFinal.DateFirst < edtDataInicial.DateFirst then
      result := False;
  end;
  function IntervaloOK : boolean;
  begin
    result := True;

    if edtfimIntervalo.value = 0 then
    begin
      result := False;
      frmMensagem.MostraMensagemErro('O fim do intervalo deve ser maior que zero.');
    end
    else if edtInicioIntervalo.Value > edtFimIntervalo.Value then
    begin
      result := False;
      frmMensagem.MostraMensagemErro('O fim do intervalo deve ser maior que o início do intervalo.');
    end;

  end;
begin
  result := True;

  case NomeRelatorio of
    mfLX,
    mfRZ,
    mfLMFC,
    mfLMFS,
    mfMF,
    mfEspelhoMFD,
    mfArqMFD,
    mfMeiosPagamento,
    mfDAVEmitidos,
    mfIdentificacaoPAFCEF,
    mfConfiguracoesPAFECF: begin
      if rgTipoEmissao.ItemIndex = 0 then
        result := PeriodoOK
      else
        result := IntervaloOK;
    end;
    mfCAT52 : result := PeriodoOK;
  end;
end;

procedure TfrmMenuFiscal.tsOpcoesRelatorioNextButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  inherited;

  case rgTipoEmissao.ItemIndex of
    0 : begin
      tsPeriodo.Enabled := True;
      UltimaPagina := tsPeriodo;
    end;
    1 : begin
      tsIntervaloCOO.Enabled := True;
      UltimaPagina := tsIntervaloCOO;
    end;
  end;
end;

procedure TfrmMenuFiscal.wzRelatorioMenuFiscalActivePageChanged(
  Sender: TObject);
begin
  inherited;
  if Self.Showing then
  begin
    if wzRelatorioMenuFiscal.ActivePage = UltimaPagina then
      wzRelatorioMenuFiscal.ActivePage.EnabledButtons := [bkBack, bkFinish]
    else if wzRelatorioMenuFiscal.ActivePageIndex = 0 then
      wzRelatorioMenuFiscal.ActivePage.EnabledButtons := [bkNext]
    else
      wzRelatorioMenuFiscal.ActivePage.EnabledButtons := [bkBack, bkNext];

    wzRelatorioMenuFiscal.ActivePage.VisibleButtons := [];
    if bkStart in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkStart];
    if bkLast in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkLast];
    if bkBack in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkBack];
    if bkNext in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkNext];
    if bkFinish in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkFinish];
    if bkCancel in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkCancel];
    if bkHelp in wzRelatorioMenuFiscal.ActivePage.EnabledButtons then
      wzRelatorioMenuFiscal.ActivePage.VisibleButtons := wzRelatorioMenuFiscal.ActivePage.VisibleButtons + [bkHelp];
  end;

end;

procedure TfrmMenuFiscal.wzRelatorioMenuFiscalFinishButtonClick(
  Sender: TObject);
begin
  if NaoExisteRestricoes then
  begin
    case NomeRelatorio of
      mfLMFC: ImprimeLMFC;
      mfLMFS: ImprimeLMFS;
      mfMF: ;
      mfEspelhoMFD: ImprimeEspelhoMFD;
      mfArqMFD: ;
      mfCAT52: ImprimeCAT52;
      mfMeiosPagamento: ;
      mfDAVEmitidos: ;
      mfIdentificacaoPAFCEF: ;
      mfConfiguracoesPAFECF: ;
    end;
  end;

  wzRelatorioMenuFiscal.ActivePage := tsEscolhaRelatorio;
end;

end.
