inherited frmSangria: TfrmSangria
  Caption = 'Sangria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object Label1: TLabel
      Left = 444
      Top = 72
      Width = 136
      Height = 23
      Caption = 'Valor da sangria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 485
      Top = 203
      Width = 54
      Height = 23
      Caption = 'Motivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object mMotivo: TMemo
      Left = 25
      Top = 232
      Width = 971
      Height = 411
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -43
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'DIMINUIR VALOR EM DINHEIRO DO CAIXA')
      ParentFont = False
      TabOrder = 0
      OnEnter = mMotivoEnter
    end
    object edtValor: TEdit
      Left = 330
      Top = 101
      Width = 357
      Height = 83
      Color = 14938613
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3971964
      Font.Height = -64
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Sangria'
  end
end
