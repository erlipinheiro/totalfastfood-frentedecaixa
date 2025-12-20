inherited frmSelecionaTipoVenda: TfrmSelecionaTipoVenda
  Caption = 'Seleciona tipo de venda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    Color = 8421440
    object btnBalcao: TPanel
      Left = 67
      Top = 76
      Width = 334
      Height = 221
      BevelOuter = bvNone
      Caption = 'Balc'#227'o'
      Color = 13619036
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7697724
      Font.Height = -43
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnBalcaoClick
    end
    object btnMesa: TPanel
      Left = 611
      Top = 76
      Width = 334
      Height = 221
      BevelOuter = bvNone
      Caption = 'Mesa'
      Color = 33023
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -43
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnBalcaoClick
    end
    object btnCartao: TPanel
      Left = 611
      Top = 364
      Width = 334
      Height = 221
      BevelOuter = bvNone
      Caption = 'Cartao'
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -43
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnBalcaoClick
    end
    object btnDelivery: TPanel
      Left = 67
      Top = 364
      Width = 334
      Height = 221
      BevelOuter = bvNone
      Caption = 'Delivery'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7697724
      Font.Height = -43
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = btnBalcaoClick
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Selecione um tipo de venda'
  end
end
