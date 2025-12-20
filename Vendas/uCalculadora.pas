{This project is totally Freeware, and I don't care if you use
any of it anywhere.  I don't even care if you make money off of it,
because it is basically a simple calculator, although I wouldn't
mind any email if you did get something out of it.  You can change
any part of the code if you wish.

Douglas Tietjen
http://www.delphipages.com
Support@Delphipages.com
}

unit uCalculadora;  //Name of the Unit File

interface   //Everything under Interface is available to other Unit Files

uses     //Different .dcu or .pas files that this program uses
  Windows, SysUtils, Classes, Forms, Dialogs,
  ExtCtrls, Controls, StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type //Different Class and Object types defined
  TTipoFormlario = (tfNenhum, tfCalc, tfSenha, tfCriaMesa);
  TfCalculadora = class(TForm)
    pNumbers: TPanel;
    pClear: TPanel;
    btnClear: TButton;
    btnCancelEntry: TButton;
    btnPlusMinus: TButton;
    Panel1: TPanel;
    pnlTOP: TPanel;
    eDisplay: TEdit;
    btnBackSpace: TButton;
    pnlNumero: TPanel;
    pnlGarcom: TPanel;
    btn1: TButton;
    btn4: TButton;
    btn7: TButton;
    btn0: TButton;
    btnDecimal: TButton;
    btn9: TButton;
    btn8: TButton;
    btn5: TButton;
    btn6: TButton;
    btn3: TButton;
    btn2: TButton;
    btnPercent: TButton;
    btnMinus: TButton;
    btnMultiply: TButton;
    btnDivide: TButton;
    btnPlus: TButton;
    lblUsuario: TLabel;
    btnEnter: TButton;
    btnEquals: TButton;
    pnlNomeGarcom: TPanel;
    btnSelecionaGarcom: TPanel;
    chkBalcao: TCheckBox;
    procedure btn1Click(Sender: TObject);  //Procedures Defined for Unit
    procedure btnEqualsClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure btnMultiplyClick(Sender: TObject);
    procedure btnDivideClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDecimalClick(Sender: TObject);
    procedure NumberClick(Number: Integer);
    procedure OperatorClick(Operator: Char);
    procedure btnPercentClick(Sender: TObject);
    procedure btnCancelEntryClick(Sender: TObject);
    procedure btnPlusMinusClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnBackSpaceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionaGarcomClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }         //Variables used in Program
    Calc1, Calc2: Extended;              //defined by type
    DecimalFlag: Boolean;            //Private: Only used in this unit file
    NumOps: Integer;
    LastInput: String;
    OpFlag: Char;
    TempReadout: String;
    FidGarcom: integer;
    FTipoFormulario: TTipoFormlario;
    procedure SetidGarcom(const Value: integer);
    procedure SetTipoFormulario(const Value: TTipoFormlario);

  public
    { Public declarations }
    property idGarcom : integer read FidGarcom write SetidGarcom;
    property TipoFormulario : TTipoFormlario read FTipoFormulario write SetTipoFormulario;
  end;

var
  fCalculadora: TfCalculadora;                          //Form Name assigned to Form Class

implementation    //Implementations of any procedures and functions defined


uses uMensagem, DataModuleCaixa, uSelecionaPessoa, uSenha;                  //above

{$R *.DFM}        //Including all .DFM files

procedure TfCalculadora.NumberClick(Number: Integer);  //Procedures Implemented under Implementation Section
begin                                           //Gets value of Integer and runs procedure
  If LastInput <> 'NUMS' then  //LastInput is a string, starts off with nothing
  begin
     eDisplay.Text := FloatToStr(0);
     DecimalFlag := False;
  end;

  If DecimalFlag = True then   //If True then it adds numbers after Decimal spot
  begin
     eDisplay.Text := eDisplay.Text + intToStr(Number);  //Example: String'123.5'+'4'
  end
  else
  begin
     //Copy selects only a portion of Entry.  Pos gets Position of the Format 0, and uses the Lenght of the Display -0 + Number Sent in Value
     // and it needs to work this way to add new numbers to the same line, and erase the zero.
     eDisplay.Text := Copy(eDisplay.Text, Pos(eDisplay.Text, FloatToStr(0)), Length(eDisplay.Text)-0)+InttoStr(Number);
     eDisplay.Text := (FloatToStr(StrToFloat(eDisplay.Text)));
     //Resets number into same Format as before
  end;

  If LastInput = 'NEG' Then   //If Negative Number
  begin
     eDisplay.Text := '-' + eDisplay.Text;  //Display a Negative sign
  end;
  LastInput := 'NUMS';    //Set LastInput as a Number

end;

procedure TfCalculadora.OperatorClick(Operator: Char);
begin
     //Operator Click
   TempReadout := eDisplay.Text;   //Assign TempReadout as Your Number typed
   if LastInput = 'NUMS' Then      //If you typed a number last then
   Begin
      NumOps := NumOps + 1;        //Your Number Option is Value + 1
   End;

   Case NumOps of         //If Number Option is 0 then
      0: Begin            //Check for Negative or Positive
            If (Operator = '-') and (LastInput <> 'NEG') then
            begin
               eDisplay.Text := '-' + eDisplay.Text;
               LastInput := 'NEG';
            end;          //set LastInput to Negative if it was Negative
         End;
      1: Begin            //If Number Option is 1 then
            Calc1 := strToFloat(eDisplay.Text);  //Assign Calc1 to First Number
            if (Operator = '-') and (LastInput <> 'NUMS') and (OpFlag <> '=') Then
            Begin
               eDisplay.Text := '-';
               LastInput := 'NEG';
            End;
         End;
      2: Begin            //If Number Option is 2 then
         Calc2 := strtoFloat(TempReadout);  //Calc2 is assigned as your second Number
         Case OpFlag of                     //used in calculating first from second
            '+': Calc1 := Calc1 + Calc2;
            '-': Calc1 := Calc1 - Calc2; //Depending on what Operator you clicked on
            '*': Calc1 := Calc1 * Calc2; //depends what is caluclated
            '/': Begin
                   if Calc2 = 0 Then
                     frmMensagem.MostraMensagem('Não pode dividir por zero') //If Calc2 is 0 it cannot calculate,
                   else                                    //so it shows a message showing so.
                    Calc1 := Calc1 / Calc2; //If not 0 it divides
                 end;
            '=': Calc1 := Calc2; //= Only used if you type in a calculation get the total hit another number and hit =, stops errors
            '%': Calc1 := Calc1 * Calc2; //Calculates Percentage (Look at OnbtnPercentClick Procedure)
         end;
         eDisplay.Text := FloattoStrF(Calc1, ffGeneral, 20, 2);  //Set answer in this Format
         NumOps := 1;   //Number Option is set back to one
         End;
   end;
   if LastInput <> 'NEG' then  //Only if a positive number
   begin
      LastInput := 'None';  //Set LastInput as Nothing again, to start a new calculation
      OpFlag := Operator; //Last Operator you clicked on gets assigned to OpFlag
   End;

end;

procedure TfCalculadora.btnSelecionaGarcomClick(Sender: TObject);
var
  i : integer;
begin
  if not chkBalcao.Checked then
  begin
    frmSenha := TfrmSenha.Create(Application);
    //*** if = mrOK ....
    if frmSenha.ShowModal = mrOK then
    begin
      SetidGarcom(frmSenha.idUsuario);
      pnlNomeGarcom.Caption := frmSenha.lblNomeUsuario.Caption;
      if TryStrToInt(eDisplay.Text, i) then
        ModalResult := mrOk;
    end;

    frmSenha.Free;
  end
  else
    frmMensagem.MostraMensagem('Venda marcada como balcão, desmarque antes.');
end;

procedure TfCalculadora.SetidGarcom(const Value: integer);
begin
  FidGarcom := Value;
end;

procedure TfCalculadora.SetTipoFormulario(const Value: TTipoFormlario);
begin
  FTipoFormulario := Value;
  if TipoFormulario in [tfCriaMesa, tfSenha] then
  begin
    if TipoFormulario = tfSenha then
      pnlGarcom.Visible := False;
    btnPlus.Visible := False;
    btnPlusMinus.Visible := False;
    btnCancelEntry.Visible := False;
    pClear.Visible := False;
    btnClear.Visible := False;
    btnPlus.Visible := False;
    btnDecimal.Visible := False;
    btnDivide.Visible := False;
    btnPercent.Visible := False;
    btnMultiply.Visible := False;
    btnEquals.Visible := False;
    btnPlus.Visible := False;
    btnMinus.Visible := False;
  end;
end;

procedure TfCalculadora.btn1Click(Sender: TObject);  //Procedure being implemented
begin                                         //Starts all procedures
  NumberClick(StrToInt(TButton(Sender).Caption));     //Calls NumberClick Procedure with Value of Number
end;      //Ends all Procedures

procedure TfCalculadora.btnEqualsClick(Sender: TObject);   //Equal Button pressed
begin
  OperatorClick('=');   //Runs OperatorClick Procedure sending Value of Operator you typed
end;

procedure TfCalculadora.btnPlusClick(Sender: TObject); // + Button Clicked
begin
  OperatorClick('+');
end;

procedure TfCalculadora.btnMinusClick(Sender: TObject);
begin
  OperatorClick('-');
end;

procedure TfCalculadora.btnMultiplyClick(Sender: TObject);
begin
  OperatorClick('*');
end;

procedure TfCalculadora.btnDivideClick(Sender: TObject);
begin
  OperatorClick('/');
end;

procedure TfCalculadora.btnClearClick(Sender: TObject);
begin
  eDisplay.Text := FloatToStr(0);   //Sets All Values back to nothing
  Calc1 := 0;
  Calc2 := 0;
  FormActivate(Sender);       //Calls Same Procedure as was run when form was Activated
end;

procedure TfCalculadora.FormActivate(Sender: TObject);
begin
     DecimalFlag := False;    //Decimal can be typed in
     NumOps := 0;             //0 Set as NumOps
     LastInput := 'NONE';     //NONE or no Last Input
     OpFlag := ' ';           //Operator Flag is Nothing
     eDisplay.Text := FloatToStr(0); //Format used for numbers.
end;


procedure TfCalculadora.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i : integer;
begin
  if Trim(eDisplay.Text) = '' then
    CanClose := False
  else if (TipoFormulario = tfCriaMesa) and (idGarcom <= 0) then
  Begin
    CanClose := False;
    frmMensagem.MostraMensagemErro('Você deve selecionar um garçom primeiro.');
    btnSelecionaGarcomClick(Self);
  end;
end;

procedure TfCalculadora.FormCreate(Sender: TObject);
begin
  FidGarcom := -1;
  FTipoFormulario := tfNenhum;
end;

procedure TfCalculadora.btnDecimalClick(Sender: TObject);
begin
     If LastInput = 'NEG' then
        eDisplay.Text := FloatToStr(-0)  //displays Negative sign in front of value
     Else
     begin
        if LastInput <> 'NUMS' Then
           eDisplay.Text := FloatToStr(0);  //does not display negative value
     end;

     if DecimalFlag = False then
        eDisplay.Text := eDisplay.Text + ','; //If Decimal has not been typed, decimal is inserted

     DecimalFlag := True;    //decimal flag shows that you can not type another decimal
     LastInput := 'NUMS';    //Changes to show that you did type a number last
end;


procedure TfCalculadora.btnPercentClick(Sender: TObject);
begin                         //Divides Your number typed in by 100
   eDisplay.Text := FloatToStr(strToFloat(eDisplay.Text) / 100);
   LastInput := 'None';       //Resets LastInput as Nothing
   OpFlag := '%';             //Sends operator of % which * First Number by this Divided Number
   NumOps := NumOps + 1;      // Adds one to the option number
   DecimalFlag := True;       //Decimal can be typed in again
   OperatorClick('=');  //Operater Click Procedure with value of = is sent to show you total
end;

procedure TfCalculadora.btnBackSpaceClick(Sender: TObject);
begin
  if Length(eDisplay.Text) > 1 then
    eDisplay.Text := Copy(eDisplay.Text, 1, Length(eDisplay.Text) - 1)
  else
    eDisplay.Text := '';
end;

procedure TfCalculadora.btnCancelEntryClick(Sender: TObject);
begin
   eDisplay.Text := FloatToStr(0); //Sets Value to 0 for new Calculation
   DecimalFlag := False;                           //Decimal can be typed in
   LastInput := 'CE';                              //Last Input basically set to nothing again
end;

procedure TfCalculadora.btnPlusMinusClick(Sender: TObject);
var
  f : double;
begin
  if TryStrToFloat(eDisplay.Text, f) then
  begin
    if (strToFloat(eDisplay.Text) > 0) then       //If Value on Screen is Positive
      eDisplay.Text := '-' + eDisplay.Text     //Changes it to a negative value
    else if (strToFloat(eDisplay.Text) = 0) then    //If Value is Zero, it does not change
      eDisplay.Text := '0'
    else                                     //If Value on Screen is a Negative
      eDisplay.Text := Copy(eDisplay.Text, 2, Length(eDisplay.Text));
                                               //Changes it to a Positive Value
  end
  else
    frmMensagem.MostraMensagemErro('Não é um valor válido.');
end;

procedure TfCalculadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case key of
       VK_DELETE: btnclear.click;  //If Delete Key is Clicked on, Clear procedure
     end;
end;

procedure TfCalculadora.FormKeyPress(Sender: TObject; var Key: Char);
begin
     case key of             //Checks for KeyStrokes from Keyboard
          #49: btn1.Click;   //Key 1 was pressed, and btn1.Click procedure was
          #50: btn2.Click;                                      //implemented.
          #51: btn3.Click;
          #52: btn4.Click;
          #53: btn5.Click;
          #54: btn6.Click;
          #55: btn7.Click;
          #56: btn8.Click;
          #57: btn9.Click;
          #48: btn0.Click;
     else
       if not (TipoFormulario in [tfCriaMesa, tfSenha]) then
       begin
          case key of
            #46: btnDecimal.Click;
            #8 : btnCancelEntry.Click; //Cancel Entry Pushed  Key(Backspace)
            #37: btnPercent.Click;     //Percent Key Pushed   Key(Shift+5)
            #43: btnPlus.Click;        //Add
            #45: btnMinus.Click;       //Subtract
            #42: btnMultiply.Click;    //Multiply
            #47: btnDivide.Click;      //Divide
            #27: btnClear.Click;       //Clear      Key(Escape)
            #13: btnequals.click;     //Equal Button Procedure Called
          end;
       end;
     end;
end;

procedure TfCalculadora.FormShow(Sender: TObject);
begin
//  if TipoFormulario = tfCriaMesa then
//    btnSelecionaGarcomClick(Self);
end;

end.

