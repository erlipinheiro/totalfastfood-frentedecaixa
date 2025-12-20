unit ucxDBLookupComboBoxButtonEdit;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLookupDBGrid, cxFilter, cxEditConsts, cxFilterControlUtils;

resourcestring
  mycxLookupComboboxItem = 'MycxLookupComboBox|MycxLookupComboBox';

type
  TMycxLookupComboBoxProperties = class(TcxLookupComboBoxProperties)
  private
  public
    class function GetContainerClass: TcxContainerClass; override;
  published
    property ButtonsViewStyle;
    property Buttons;
    property OnButtonClick;
  end;

  TcxMyFilterPopupEditHelper = class(TcxFilterLookupComboBoxHelper);
  TMycxEditRepositoryItem = class(TcxEditRepositoryItem);

  TMycxDBLookupComboBox = class(TcxDBLookupComboBox)
  private
    { Private declarations }
    function GetProperties: TMycxLookupComboBoxProperties;
    procedure SetProperties(Value: TMycxLookupComboBoxProperties);
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  protected
    { Protected declarations }
//    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
    procedure PropertiesChanged(Sender: TObject); override;
  public
    { Public declarations }
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue; AEditFocused: Boolean); override;
  published
    { Published declarations }
    property Properties : TMycxLookupComboBoxProperties read GetProperties write SetProperties;
  end;

  TMycxLookupComboBox = class(TcxLookupComboBox)
  private
    { Private declarations }
    function GetProperties: TMycxLookupComboBoxProperties;
    procedure SetProperties(Value: TMycxLookupComboBoxProperties);
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; static;
  protected
    { Protected declarations }
//    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
  public
    { Public declarations }
    procedure PrepareEditValue(const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue; AEditFocused: Boolean); override;
  published
    { Published declarations }
    property Properties : TMycxLookupComboBoxProperties read GetProperties write SetProperties;
  end;

  TMycxEditRepositoryLookupComboBoxItem = class(TcxEditRepositoryItem)
  private
    function GetProperties: TMycxLookupComboBoxProperties;
    procedure SetProperties(Value: TMycxLookupComboBoxProperties);
  public
    class function GetEditPropertiesClass: TcxCustomEditPropertiesClass; override;
  published
    property Properties: TMycxLookupComboBoxProperties read GetProperties write SetProperties;
  end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('BrasilWWW', [TMycxDBLookupComboBox]);
  RegisterComponents('BrasilWWW', [TMycxLookupComboBox]);
end;

{ TMycxLookupComboBoxProperties }

class function TMycxLookupComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TMycxLookupComboBox;
end;


//procedure TMycxDBLookupComboBox.DoButtonClick(AButtonVisibleIndex: Integer);
//begin
//  if AButtonVisibleIndex = 1 then
//  begin
//    if Assigned(FProperties.OnButtonClick) then
//        FProperties.OnButtonClick(Self, AButtonVisibleIndex);
//
//    if RepositoryItem <> nil then
//    begin
//      if Assigned(ActiveProperties.OnButtonClick) then
//        ActiveProperties.OnButtonClick(Self, AButtonVisibleIndex);
//    end;
//  end;
//end;

function TMycxDBLookupComboBox.GetProperties: TMycxLookupComboBoxProperties;
begin
  Result := TMycxLookupComboBoxProperties(FProperties);
end;

procedure TMycxDBLookupComboBox.SetProperties(Value: TMycxLookupComboBoxProperties);
begin
  FProperties.Assign(Value);
end;


{ TMycxDBLookupComboBox }

class function TMycxDBLookupComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TMycxLookupComboBoxProperties;
end;

procedure TMycxDBLookupComboBox.PrepareEditValue(
  const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue;
  AEditFocused: Boolean);
begin
  inherited PrepareEditValue(ADisplayValue, EditValue, AEditFocused);

end;


procedure TMycxDBLookupComboBox.PropertiesChanged(Sender: TObject);
begin
  inherited PropertiesChanged(Sender);
end;

{TMycxEditRepositoryLookupComboBoxItem }

class function TMycxEditRepositoryLookupComboBoxItem.GetEditPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TMycxLookupComboBoxProperties;
end;

function TMycxEditRepositoryLookupComboBoxItem.GetProperties: TMycxLookupComboBoxProperties;
begin
  Result := inherited Properties as TMycxLookupComboBoxProperties;
end;

procedure TMycxEditRepositoryLookupComboBoxItem.SetProperties(Value: TMycxLookupComboBoxProperties);
begin
  inherited Properties := Value;
end;

{ TMycxLookupComboBox }
//procedure TMycxLookupComboBox.DoButtonClick(AButtonVisibleIndex: Integer);
//begin
//  if AButtonVisibleIndex = 1 then
//  begin
//    with Properties do
//      if Assigned(OnButtonClick) then
//        OnButtonClick(Self);
//    if RepositoryItem <> nil then
//      with ActiveProperties do
//        if Assigned(OnButtonClick) then
//          OnButtonClick(Self, AButtonVisibleIndex);
//  end;
//end;

function TMycxLookupComboBox.GetProperties: TMycxLookupComboBoxProperties;
begin
  Result := TMycxLookupComboBoxProperties(FProperties);
end;

class function TMycxLookupComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TMycxLookupComboBoxProperties;
end;

procedure TMycxLookupComboBox.PrepareEditValue(
  const ADisplayValue: TcxEditValue; out EditValue: TcxEditValue;
  AEditFocused: Boolean);
begin
  inherited PrepareEditValue(ADisplayValue, EditValue, AEditFocused);
end;

procedure TMycxLookupComboBox.SetProperties(Value: TMycxLookupComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

initialization
  GetRegisteredEditProperties.Register(TMycxLookupComboBoxProperties, mycxLookupComboboxItem );
  RegisterClass(TMycxEditRepositoryLookupComboBoxItem);
end.



