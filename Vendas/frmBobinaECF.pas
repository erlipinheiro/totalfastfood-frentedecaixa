unit frmBobinaECF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.StdCtrls, SHDocVw, Vcl.OleCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  ActiveX, MSHTML, Vcl.ComCtrls;

type
  TfBobinaECF = class(TfrmFormPadrao)
    mmoECF: TMemo;
    wbBobina: TWebBrowser;
    procedure btnVoltarPadraoClick(Sender: TObject);
  private
    { Private declarations }
    reverso : boolean;
    procedure Registrar(FMensagem : string);
  public
    { Public declarations }
    fMemoBobina : TMemo;

    Procedure AtualizaBobina(Const Linha : string; Const SemFormatacao : boolean = False);
    procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
    procedure WB_ScrollToBottom(WebBrowser1: TWebBrowser);
  end;

var
  fBobinaECF: TfBobinaECF;

implementation

{$R *.dfm}

uses DataModuleCaixa;

{ TfBobinaECF }


procedure TfBobinaECF.btnVoltarPadraoClick(Sender: TObject);
begin
  Close;
end;

procedure TfBobinaECF.Registrar(FMensagem: string);
var
  LogFile : TextFile;
  Arquivo : string;
begin
  try

    Arquivo := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'debug ' +
      dmCaixa.Estacao.ID.ToString + '-' + FormatDateTime('dd-mm-yy', Now) + '.log';
    AssignFile (LogFile, Arquivo);

    if FileExists (Arquivo) then
      Append (LogFile)
    else
      Rewrite (LogFile);

    Writeln (LogFile, FormatDateTime('dd/mm/yy hh:MM:ss', Now) + ' ' + FMensagem);

    CloseFile (LogFile);
  except
    sleep(100);
  end;
end;

procedure TfBobinaECF.WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;

begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
   Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TfBobinaECF.WB_ScrollToBottom(WebBrowser1: TWebBrowser);
var
  scrollpos: Integer;
  pw : IHTMLWindow2;
  Doc: IHTMLDocument2;
begin
  Doc := WebBrowser1.Document as IHTMLDocument2;
  pw := IHTMLWindow2(Doc.parentWindow);
  scrollPos := pw.screen.height;
  pw.scrollBy(0, scrollpos);
end;


procedure TfBobinaECF.AtualizaBobina(const Linha: string; Const SemFormatacao : boolean = False);
begin
  if assigned(fBobinaECF) then
  begin
    fBobinaECF.mmoECF.Text := fBobinaECF.mmoECF.Text + '<h1>' + Linha + '</h1>';
    WB_LoadHTML(fBobinaECF.wbBobina, fBobinaECF.mmoECF.Text);
    WB_ScrollToBottom(fBobinaECF.wbBobina);

    Registrar(Linha);

    Application.ProcessMessages ;
  end;
end;

end.
