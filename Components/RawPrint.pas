unit RawPrint;

{ Invisible Printer Component that allows to send stuff directly to the spooler,
  bypassing the printer driver. Ideal for bar code printers and other stuff.
  Modelled by bhoc@surfeu.ch
  This code is GPL.
  HOWTO:
  MyPrinter := TRawPrint.Create(nil);
  MyPrinter.DeviceName := 'HP LaserJet Series II';
  MyPrinter.JobName := 'MyJob';
  if MyPrinter.OpenDevice then
  begin
    MyPrinter.WriteString('This is page 1');
    MyPrinter.NewPage;
    MyPrinter.WriteString('This is page 2');
    MyPrinter.CloseDevice;
  end;
  MyPrinter.Destroy;
}

// {$ASSERTIONS OFF}

interface

uses
  Windows, WinSpool, Printers, Dialogs, Classes;

type
  TError = procedure(Sender: TObject; var ErrorMessage: String) of object;
  TRawPrint = class(TComponent)
  private
    { Private declarations }
    MyDeviceName: String;
    MyJobName: String;
    MyError: TError;
    hPrinter: Cardinal;
    IsOpenDevice: Boolean;
    IsOpenPage: Boolean;
  protected
    { Protected declarations }
    function GetLastErrMsg: String;
    procedure RaiseError(ErrMsg: String);
  public
    { Public declarations }
    function OpenDevice: Boolean;
    function CloseDevice: Boolean;
    function WriteString(Text: String): Boolean;
    function NewPage: Boolean;
    procedure SelectPrinter;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property DeviceName: String read MyDeviceName write MyDeviceName;
    property JobName: String read MyJobName write MyJobName;
    property OnError: TError read MyError write MyError;
  end;

procedure Register;

implementation

constructor TRawPrint.Create(AOwner : TComponent);
begin
  inherited;
  MyDeviceName := Printer.Printers.Strings[Printer.PrinterIndex];
  MyJobName := 'RawPrint';
  IsOpenDevice := False;
  IsOpenPage := False;
end;

destructor TRawPrint.Destroy;
begin
  if IsOpenDevice then CloseDevice;
  inherited;
end;

procedure Register;
begin
  RegisterComponents('bhoc@surfeu.ch', [TRawPrint]);
end;

function TRawPrint.OpenDevice: Boolean;
type _DocInfo = record
     pDocName: PAnsiChar;
     pOutputFile: PAnsiChar;
     pDatatype: PAnsiChar;
   end;
var DocInfo: _DocInfo;
begin
  Result := True;
  if not OpenPrinter(PChar(DeviceName), hPrinter, nil) then begin
    RaiseError(GetLastErrMsg);
    Result := False;
  end else begin
    DocInfo.pDocName := pChar(JobName);
    DocInfo.pOutputFile := pChar(#0);
    DocInfo.pDatatype := pChar(#0);
    if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then begin
      RaiseError(GetLastErrMsg);
      ClosePrinter(hPrinter);
      Result := False;
    end else begin
      IsOpenDevice := True;
      NewPage;
    end;
  end;
end;

function TRawPrint.NewPage: Boolean;
begin
  Result := True;
  if IsOpenDevice then begin
    if IsOpenPage then begin
      if not EndPagePrinter(hPrinter) then begin
        RaiseError(GetLastErrMsg);
      end;
    end;
    if not StartPagePrinter(hPrinter) then begin
      RaiseError(GetLastErrMsg);
      Result := False;
    end else begin
      IsOpenPage := True;
    end;
  end;
end;

function TRawPrint.WriteString(Text: String): Boolean;
var WrittenChars: Cardinal;
begin
  Result := False;
  if IsOpenDevice then begin
    Result := True;
    if not WritePrinter(hPrinter, PChar(Text), Length(Text), WrittenChars) then begin
      RaiseError(GetLastErrMsg);
      Result := False;
    end;
  end;
end;

function TRawPrint.CloseDevice: Boolean;
begin
  Result := True;
  if IsOpenDevice then begin
    if IsOpenPage then begin;
      if not EndPagePrinter(hPrinter) then begin
        RaiseError(GetLastErrMsg);
      end;
    end;
    if not EndDocPrinter(hPrinter) then begin
      RaiseError(GetLastErrMsg);
      Result := False;
    end else begin
      if not ClosePrinter(hPrinter) then begin
        RaiseError(GetLastErrMsg);
        Result := False;
      end else begin
        Result := True;
        IsOpenDevice := False;
      end;
    end;
  end;
end;

procedure TRawPrint.RaiseError(ErrMsg: String);
begin
  if Assigned(OnError) then MyError(Self,ErrMsg);
end;

function TRawPrint.GetLastErrMsg: String;
var Buf: Array[0..499] of char;
    BufLen: Integer;
begin
  BufLen := FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, GetLastError, 0, Buf, SizeOf(Buf), nil);
  Result := Copy(Buf, 1, BufLen);
end;

Procedure TRawPrint.SelectPrinter;
var PrtDlg: TPrintDialog;
begin
  PrtDlg := TPrintDialog.Create(Self);
  prtdlg.Options := [poPrintToFile];
  if PrtDlg.Execute then begin
    DeviceName := Printer.Printers.Strings[Printer.PrinterIndex];
  end;
  PrtDlg.Free;
end;

end.
