unit uVerificaVersaoEXE;

interface
Uses
  System.IniFiles, Vcl.Forms, System.SysUtils, Winapi.Windows;


  function ExisteAtualizacaoEXE : boolean;

implementation

//Retorna o caminho do arquivo INI
Function GetCaminhoIniFile:String;
var
  WinDir: PWideChar;
begin
  WinDir := StrAlloc(MAX_PATH);
  GetWindowsDirectory(WinDir, MAX_PATH);
  Result := string(WinDir);
  if Result[Length(Result)] <> '\' then
    Result := Result + '\' + 'TotalFastFoodFrenteDeCaixa.ini';
  StrDispose(WinDir);
end;

function  EncontrouIni: Boolean;
begin
  result :=True;
 //se não encontrar o arquivo ini, retorna falseo e exibe mesnagem
  if not FileExists(GetCaminhoIniFile) then
  begin
     Application.MessageBox(Pchar('O arquivo de configurações não foi encontrado.'+#13+
                               GetCaminhoIniFile), 'Atenção', MB_OK+MB_ICONEXCLAMATION);
     result :=False;
  end;
end;

function  ValidaArquivos(exeLocal, exeRemoto:String): Boolean;
begin
  result:=True;
   //verifica se se o arquivo local existe
   if not FileExists(exeLocal) then
   begin
       Application.MessageBox(Pchar('O arquivo local não foi encontrado.'+#13+
                                exeLocal), 'Atenção', MB_OK+MB_ICONEXCLAMATION);
       result :=False;
   end else
   //verifica se o arquivo remoto existe
   if not FileExists(exeRemoto) then
   begin
       Application.MessageBox(Pchar('O arquivo Remoto não foi encontrado.'+#13+
                                exeRemoto), 'Atenção', MB_OK+MB_ICONEXCLAMATION);
       result :=False;
   end;
end;


{Função que retorna a versão do executável
para ativar o controle de versões de seu executável, no delphi, com o projeto aberto,
vá em Project=>Options=>Version Info e marque a opção Include version information in project}
function RetornaVersao(sFileName:string): string;
var
  VerInfoSize  : DWORD;
  VerInfo      : Pointer;
  VerValueSize : DWORD;
  VerValue     : PVSFixedFileInfo;
  Dummy        : DWORD;
begin
try
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
  except //se ocorrer um erro retorna a versão 1.0.0.0, vai ocoorer um erro se o arquivo não tiver versão
    Result:='1.0.0.0';
 end;
end;



function ExisteAtualizacaoEXE : boolean;
var
  ini       :TIniFile;
  exeLocal  :String;
  exeRemoto :string;
begin
  result := False;
  Application.Initialize;
  Application.MainFormOnTaskbar := False;

  //Se encontrou o arquivo ini
  if EncontrouIni then
  begin
    //cria o  IniFile
    ini       :=TIniFile.Create(GetCaminhoIniFile);

    //passa para as variáveis os caminhso dos arquivos
    exeLocal  :=ini.ReadString('ARQUIVOS', 'exeLocal', '');
    exeRemoto :=ini.ReadString('ARQUIVOS', 'exeRemoto', '');

    //valida os arquivos
    if ValidaArquivos(exeLocal, exeRemoto) then
    begin
      if RetornaVersao(exeLocal) <>  RetornaVersao(exeRemoto)  then
      begin
        WinExec(PAnsiChar('AtualizaVersao.exe'), 0);
        result := True;
      end;
    end;

    ini.Free; //remove o objeto
  end;
end;
end.



