inherited fBobinaECF: TfBobinaECF
  Hint = 'Impress'#227'o do cupom fiscal'
  Caption = 'fBobinaECF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TPanel
      Enabled = False
      Visible = False
    end
  end
  inherited pnlFundoPadrao: TPanel
    object mmoECF: TMemo
      Left = 280
      Top = 6
      Width = 737
      Height = 307
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object wbBobina: TWebBrowser
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 592
      ControlData = {
        4C000000D56900006B4400000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Finalizando venda...'
  end
end
