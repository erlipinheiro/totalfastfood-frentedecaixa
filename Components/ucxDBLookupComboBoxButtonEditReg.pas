unit ucxDBLookupComboBoxButtonEditReg;

interface

procedure Register;

resourcestring
  scxSEditRepositoryLookupComboBoxButtonItem = 'LookupComboBoxButton|Represents a lookup combo box control with a button';

implementation

uses
  System.Classes, cxClasses, cxEdit, cxEditRepositoryEditor,    DesignIntf,
  // added all the following units just for test (from cxDBExtLookupComboBox)
  Windows, vcl.Controls, DB, vcl.Graphics, Messages, SysUtils, vcl.Forms,
  cxControls, cxCustomData, cxDB, cxDBData, cxDBEdit,
  cxDBLookupEdit, cxEditConsts, cxLookAndFeels, cxLookupEdit,
  ucxDBLookupComboBoxButtonEdit;

procedure Register;
begin
  ForceDemandLoadState(dlDisable); // So that we can use properties (f. grids) without component
  RegisterComponents('BrasilWWW', [TMycxLookupComboBox]);
  RegisterComponents('BrasilWWW', [TMycxDBLookupComboBox]);
end;

initialization
  RegisterEditRepositoryItem(TMycxEditRepositoryLookupComboBoxItem, '_LookupTestEdit|Ext lookup combo with buttons');

finalization
  UnregisterEditRepositoryItem(TMycxEditRepositoryLookupComboBoxItem);

end.
