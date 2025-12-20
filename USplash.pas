unit USplash;

interface

uses
  Windows, StdCtrls, jpeg, Classes, Controls, ExtCtrls, Forms,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdSNTP,
  WinSock, IdDNSResolver, DateUtils, SysUtils, FMTBcd, DB, SqlExpr,
  Types, MEssages, Vcl.ComCtrls, System.IniFiles, IdTCPConnection, IdTCPClient,
  IdHTTP, System.IOUtils, IdAuthentication;

type
  TfrmSplash = class(TForm)
    lblVersao: TLabel;
    lblStatus: TLabel;
    pbSplash: TProgressBar;
    pnlTotalFastFood: TPanel;
    pnl1: TPanel;
    imgSplash: TImage;
    pnlSplash: TPanel;
    IdHTTP1: TIdHTTP;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    //*** Observatorio Nacional
    { Private declarations }
    FBytesToTransfer: Int64;
    Function RetornaVersaoExe: String;
  public
    { Public declarations }
    AiniFile : TIniFile;
    ATotal : integer;
    VersaoEXE : string;
    procedure AtualizaVersao(Const HostAtualizacao : string);
    procedure AtualizaStatus(Status: string);
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses uPrincipal, DataModuleCaixa;

{ TfrmSplash }

procedure TfrmSplash.AtualizaStatus(Status: string);
begin
  Self.BringToFront;
  lblStatus.Caption := Status;
  Application.ProcessMessages;
end;

procedure TfrmSplash.AtualizaVersao(const HostAtualizacao: string);
var
  sVersaoEXE, sAuxiliar : string;
  Caminho : string;
  bDownloaded: boolean;
  fileBat: TStringList;
  cAppName: string;
  cBatName: string;
  f : TextFile;
  MyFile : TFileStream;
begin
  Application.ProcessMessages;
  bDownloaded := false;
  sVersaoEXE := RetornaVersaoExe;
  cAppName := 'TotalFastFood.ERP.FrenteDeCaixa.exe';
  sAuxiliar := '';

  if FileExists('FrenteDeCaixaVersaoAtual.txt') then
    DeleteFile('FrenteDeCaixaVersaoAtual.txt');

  if FileExists(cAppName + '.tmp') then
    DeleteFile(cAppName + '.tmp');

  MyFile := TFileStream.Create('FrenteDeCaixaVersaoAtual.txt', fmCreate);

  try
    try
      IdHTTP1.Get(HostAtualizacao + '/TotalFastFood.ERP.FrenteDeCaixa.txt', MyFile);
      AtualizaStatus('Download do arquivo de versão, feito com sucesso!');
      bDownloaded := true;
    except
      bDownloaded := False;
    end;
  finally
    FreeAndNil(MyFile);
    if bDownloaded then
    begin
      try
        AssignFile(f, 'FrenteDeCaixaVersaoAtual.txt');
        FileMode := fmOpenRead;
        Reset(f);
        Readln(f, sAuxiliar);
        CloseFile(f);
      except
        sAuxiliar := '';
        //Nao faz nada
      end;

      AtualizaStatus('Comparando versões Atual - ' + sVersaoEXE + ', versão Disponível - ' + sAuxiliar);

      if (trim(sAuxiliar) <> '') and (sVersaoEXE <> sAuxiliar) then
      begin
        AtualizaStatus('Existe versão mais recente, atualizando...');
        MyFile := TFileStream.Create(cAppName + '.tmp', fmCreate);
        bDownloaded := False;
        try
          try
            IdHTTP1.Get(HostAtualizacao + '/TotalFastFood.ERP.FrenteDeCaixa.exe', MyFile);
            AtualizaStatus('Fez o download do arquivo...');
            bDownloaded := True;
          except
            bDownloaded := True;
          end;
        finally
          FreeAndNil(MyFile);
          if bDownloaded then
          begin
            AtualizaStatus('Trocando os executáveis');
            try
              fileBat := TStringList.Create;
              fileBat.Clear;
              cBatName := System.IOUtils.TPath.GetTempFileName + '.bat';
              fileBat.Add(':Label1');
              fileBat.Add('@echo off');
              fileBat.Add('del "' + cAppName+'"');
              fileBat.Add('taskkill /f /im "'+ ExtractFileName(cAppName) +'"');
              fileBat.Add('if Exist "' + cAppName + '" goto Label1');
              fileBat.Add('Move "' + cAppName +  '.tmp ' +
                '" "' + cAppName +'"');
              fileBat.Add('Call ' + cAppName);
              fileBat.Add(':Label2');
              fileBat.Add('del "' + cBatName + '"');
              fileBat.Add('if Exist "' + cBatName + '" goto Label2');
              fileBat.SaveToFile(cBatName);
              WinExec(PAnsiChar(AnsiString(cBatName)), SW_HIDE);
              AtualizaStatus('Atualização efetuada com sucesso');
            finally
              fileBat.Free;
              Application.Terminate;
            end;
          end;
        end;
      end;
    end
    else
      AtualizaStatus('Não foi possível fazer o download do arquivo de versão.');
  end;
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  BoundsRect := Screen.Monitors[0].BoundsRect;
  VersaoEXE := RetornaVersaoExe;
  lblVersao.Caption := 'Versão - ' + VersaoExe;
  AiniFile := TIniFile.Create('TotalFastFoodFrenteDeCaixa.ini');
end;


procedure TfrmSplash.FormShow(Sender: TObject);
begin
  pnlSplash.Left := Trunc((Self.Width / 2) - (pnlSplash.Width / 2));
end;

procedure TfrmSplash.IdHTTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  if FBytesToTransfer = 0 then // No Update File
      Exit;

  pbSplash.Position := Round((AWorkCount / FBytesToTransfer) * 100);
end;

procedure TfrmSplash.IdHTTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  FBytesToTransfer := AWorkCountMax;
  pbSplash.Position := 0;
  pbSplash.Max := 100;
end;

procedure TfrmSplash.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  FBytesToTransfer := 0;

  pbSplash.Position := 100;
end;

function TfrmSplash.RetornaVersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
  Arquivo : String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord(F^.dwFileVersionMs),
        HiWord(F^.dwFileVersionLs), Loword(F^.dwFileVersionLs)]
      );
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

end.
