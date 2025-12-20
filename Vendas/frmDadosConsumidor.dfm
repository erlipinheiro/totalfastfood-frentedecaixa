object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Dados do consumidor'
  ClientHeight = 477
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 816
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnFinalizar: TPanel
      Left = 400
      Top = 6
      Width = 401
      Height = 58
      Caption = 'Usar dados do consumidor'
      Color = 3971964
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14938613
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object btnCancelar: TPanel
      Left = 8
      Top = 6
      Width = 323
      Height = 58
      Caption = 'N'#227'o identificar'
      Color = 3025336
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14938613
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    Color = 13691118
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 552
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label2: TLabel
      Left = 8
      Top = 179
      Width = 122
      Height = 14
      Caption = 'NOME / RAZ'#195'O SOCIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 106
      Width = 99
      Height = 14
      Caption = 'Inscricao Estadual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDocumento: TMaskEdit
      Left = 8
      Top = 53
      Width = 386
      Height = 47
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
      Visible = False
    end
    object edtIE: TMaskEdit
      Left = 8
      Top = 126
      Width = 386
      Height = 47
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = ''
      Visible = False
    end
    object edtNome: TEdit
      Left = 8
      Top = 199
      Width = 793
      Height = 43
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14938613
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 60
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 192
      Height = 39
      Caption = 'Selecione o tipo do documento'
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'CPF'
        'CNPJ')
      ParentFont = False
      TabOrder = 3
    end
  end
end
