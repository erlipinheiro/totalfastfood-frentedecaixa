[Setup]
AppID=InstaladorFrenteDeCaixa
AppName=TotalFastFood Frente de Caixa
AppVerName=TotalFastFood 2.0
AppPublisher=BrasilWWW Tecnologia da Informática Ltda
DefaultDirName=D:\Desenvolvimento\TotalFastFood\ERP\Frente de Caixa\Instalador
DefaultGroupName=BrasilWWW
DisableDirPage=No
DisableProgramGroupPage=yes
OutputBaseFilename=setup
PrivilegesRequired=Yes

[Files]
Source: "isql.exe"; DestDir: "{tmp}"; Flags: dontcopy
#Source: "update_V42.sql"; DestDir: "{tmp}"; Flags: dontcopy

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Code]
var
  DBPage: TInputQueryWizardPage;

procedure InitializeWizard;
begin
  DBPage := CreateInputQueryPage(wpReady,
    'Database Connection Information', 'Which database is to be updated?',
    'Please specify the server and the connection credentials, then click Next.');
  DBPage.Add('Server:', False);
  DBPage.Add('Port:', False);
  DBPage.Add('User name:', False);
  DBPage.Add('Password:', True);

  DBPage.Values[0] := GetPreviousData('Server', '');
  DBPage.Values[1] := GetPreviousData('Port', '');
  DBPage.Values[2] := GetPreviousData('UserName', '');
  DBPage.Values[3] := GetPreviousData('Password', '');
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  SetPreviousData(PreviousDataKey, 'Server', DBPage.Values[0]);
  SetPreviousData(PreviousDataKey, 'Port', DBPage.Values[1]);
  SetPreviousData(PreviousDataKey, 'UserName', DBPage.Values[2]);
  SetPreviousData(PreviousDataKey, 'Password', DBPage.Values[3]);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  if CurPageID = DBPage.ID then begin
    if DBPage.Values[0] = '' then begin
      MsgBox('You must enter the server name or address.', mbError, MB_OK);
      Result := False;
    end else if DBPage.Values[2] = '' then begin
      MsgBox('You must enter the user name.', mbError, MB_OK);
      Result := False;
    end else if DBPage.Values[3] = '' then begin
      MsgBox('You must enter the user password.', mbError, MB_OK);
      Result := False;
    end else begin
      ExtractTemporaryFile('isql.exe');
      ExtractTemporaryFile('update_V42.sql');
      if Exec(ExpandConstant('{tmp}') + '\isql.exe', '--user ' + DBPage.Values[2]
        + ' --password ' + DBPage.Values[3] + ' --database ' + DBPage.Values[0]
        + ':foo --script update_V42.sql', '',
        SW_HIDE, ewWaitUntilTerminated, ResultCode)
      then begin
        // check ResultCode and set Result accordingly
        Result := ResultCode = 0;
      end else begin
        MsgBox('Database update failed:'#10#10 + SysErrorMessage(ResultCode),
          mbError, MB_OK);
        Result := False;
      end;
    end;
  end;
end;