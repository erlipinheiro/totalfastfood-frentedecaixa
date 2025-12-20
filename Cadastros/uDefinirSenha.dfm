inherited frmDefinirSenha: TfrmDefinirSenha
  Caption = 'frmDefinirSenha'
  ExplicitTop = -73
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object lblNome: TLabel
      Tag = 12
      Left = 304
      Top = 95
      Width = 80
      Height = 13
      Caption = 'Digite a senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Tag = 12
      Left = 304
      Top = 197
      Width = 148
      Height = 13
      Caption = 'Digite novamente a senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtSenha: TEdit
      Left = 304
      Top = 112
      Width = 425
      Height = 58
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -43
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
    object edtConfirmacaoSenha: TEdit
      Left = 304
      Top = 216
      Width = 425
      Height = 58
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -43
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Senha'
  end
end
