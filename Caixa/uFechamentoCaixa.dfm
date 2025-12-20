inherited frmFechamentoCaixa: TfrmFechamentoCaixa
  Caption = 'frmFechamentoCaixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object Label1: TLabel
      Left = 270
      Top = 82
      Width = 145
      Height = 23
      Caption = 'Valor do dep'#243'sito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 270
      Top = 236
      Width = 117
      Height = 23
      Caption = 'Valor do troco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtValorDeposito: TEdit
      Left = 270
      Top = 111
      Width = 484
      Height = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtValorDepositoChange
      OnKeyPress = edtValorDepositoKeyPress
    end
    object edtValorTroco: TEdit
      Left = 270
      Top = 265
      Width = 484
      Height = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edtValorTrocoChange
      OnKeyPress = edtValorDepositoKeyPress
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Fechamento do caixa geral do dia'
  end
end
