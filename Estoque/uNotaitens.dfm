inherited frmNotaItem: TfrmNotaItem
  ActiveControl = edtCodigo
  Caption = 'frmNotaItem'
  ExplicitTop = -39
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    TabOrder = 2
  end
  inherited pnlFundoPadrao: TPanel
    object cxPageControl1: TcxPageControl
      Left = 8
      Top = 6
      Width = 1009
      Height = 587
      Color = clSilver
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.TabHeight = 40
      Properties.TabWidth = 200
      ClientRectBottom = 583
      ClientRectLeft = 4
      ClientRectRight = 1005
      ClientRectTop = 46
      object cxTabSheet1: TcxTabSheet
        Caption = 'Dados do '#237'tem'
        Color = clWhite
        ImageIndex = 0
        ParentColor = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label2: TLabel
          Left = 22
          Top = 11
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          Color = clWhite
          FocusControl = edtCodigo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label3: TLabel
          Left = 22
          Top = 78
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          Color = clWhite
          FocusControl = edtDescricao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 22
          Top = 136
          Width = 39
          Height = 13
          Caption = 'Unidade'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 172
          Top = 140
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          Color = clWhite
          FocusControl = edtQtde
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 431
          Top = 140
          Width = 63
          Height = 13
          Caption = 'Valor unit'#225'rio'
          Color = clWhite
          FocusControl = edtUnitario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label7: TLabel
          Left = 709
          Top = 136
          Width = 80
          Height = 13
          Caption = 'Valor do produto'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label1: TLabel
          Left = 15
          Top = 209
          Width = 56
          Height = 13
          Caption = 'C'#243'digo EAN'
          FocusControl = cxDBTextEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 253
          Top = 209
          Width = 22
          Height = 13
          Caption = 'NCM'
          FocusControl = cxDBTextEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 709
          Top = 197
          Width = 85
          Height = 13
          Caption = '(+) Valor do frete'
          FocusControl = edtValorFrete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 709
          Top = 252
          Width = 94
          Height = 13
          Caption = '(+) Valor do seguro'
          FocusControl = edtValorSeguro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 709
          Top = 314
          Width = 101
          Height = 13
          Caption = '(-) Valor do desconto'
          FocusControl = edtValorDesconto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 709
          Top = 376
          Width = 77
          Height = 13
          Caption = '(+) Valor outros'
          FocusControl = edtValorOutros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 715
          Top = 432
          Width = 87
          Height = 13
          Caption = 'Valor total do '#237'tem'
          Color = clNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object btnSelecionaProdutoFornecedor: TButton
          Left = 272
          Top = 30
          Width = 199
          Height = 37
          Caption = 'Pesquisar produtos deste fornecedor'
          Default = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnSelecionaProdutoFornecedorClick
        end
        object edtUnidade: TcxDBComboBox
          Left = 15
          Top = 155
          DataBinding.DataField = 'uCom'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Properties.Items.Strings = (
            'UN'
            'KG'
            'CX'
            'PT'
            'LT')
          Properties.MaxLength = 0
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 146
        end
        object edtCodigo: TcxDBTextEdit
          Left = 15
          Top = 30
          DataBinding.DataField = 'cProd'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          OnExit = edtCodigoExit
          Width = 251
        end
        object edtDescricao: TcxDBTextEdit
          Left = 13
          Top = 93
          DataBinding.DataField = 'xProd'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 977
        end
        object edtQtde: TcxDBCalcEdit
          Left = 167
          Top = 155
          DataBinding.DataField = 'qCom'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Properties.OnChange = edtQtdePropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 250
        end
        object edtUnitario: TcxDBCurrencyEdit
          Left = 423
          Top = 155
          DataBinding.DataField = 'vunCom'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
          Properties.OnChange = edtQtdePropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 250
        end
        object pnlValorTotal: TPanel
          Left = 678
          Top = 155
          Width = 312
          Height = 36
          Alignment = taRightJustify
          BevelOuter = bvNone
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 15
          Top = 228
          DataBinding.DataField = 'cEAN'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 196
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 217
          Top = 228
          DataBinding.DataField = 'NCM'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 311
        end
        object edtValorFrete: TcxDBCurrencyEdit
          Left = 678
          Top = 216
          DataBinding.DataField = 'vFrete'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 312
        end
        object edtValorSeguro: TcxDBCurrencyEdit
          Left = 678
          Top = 271
          DataBinding.DataField = 'vSeg'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 10
          Width = 312
        end
        object edtValorDesconto: TcxDBCurrencyEdit
          Left = 679
          Top = 333
          DataBinding.DataField = 'vDesc'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 11
          Width = 311
        end
        object edtValorOutros: TcxDBCurrencyEdit
          Left = 679
          Top = 392
          DataBinding.DataField = 'vOutro'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 12
          Width = 311
        end
        object pnlValorTotalItem: TPanel
          Left = 678
          Top = 451
          Width = 312
          Height = 36
          Alignment = taRightJustify
          BevelOuter = bvNone
          Color = 16744448
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 13
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Dados dos impostos'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label42: TLabel
          Left = 760
          Top = 352
          Width = 20
          Height = 13
          Caption = 'vIPI'
          FocusControl = cxDBCurrencyEdit12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 624
          Top = 352
          Width = 20
          Height = 13
          Caption = 'pIPI'
          FocusControl = cxDBCalcEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 472
          Top = 352
          Width = 27
          Height = 13
          Caption = 'vUnid'
          FocusControl = cxDBCurrencyEdit11
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 328
          Top = 352
          Width = 27
          Height = 13
          Caption = 'qUnid'
          FocusControl = cxDBCalcEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 184
          Top = 352
          Width = 33
          Height = 13
          Caption = 'vBCIPI'
          FocusControl = cxDBCurrencyEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 16
          Top = 352
          Width = 33
          Height = 13
          Caption = 'IPICST'
          FocusControl = cxDBSpinEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 624
          Top = 288
          Width = 23
          Height = 13
          Caption = 'cEnq'
          FocusControl = cxDBTextEdit10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 472
          Top = 288
          Width = 26
          Height = 13
          Caption = 'qSelo'
          FocusControl = cxDBSpinEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 320
          Top = 288
          Width = 25
          Height = 13
          Caption = 'cSelo'
          FocusControl = cxDBTextEdit9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 176
          Top = 288
          Width = 47
          Height = 13
          Caption = 'CNPJProd'
          FocusControl = cxDBTextEdit8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 16
          Top = 288
          Width = 25
          Height = 13
          Caption = 'clEnq'
          FocusControl = cxDBTextEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 320
          Top = 216
          Width = 31
          Height = 13
          Caption = 'vICMS'
          FocusControl = cxDBCurrencyEdit9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 176
          Top = 216
          Width = 43
          Height = 13
          Caption = 'vICMSST'
          FocusControl = cxDBCurrencyEdit8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 16
          Top = 216
          Width = 43
          Height = 13
          Caption = 'pICMSST'
          FocusControl = cxDBCalcEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 784
          Top = 80
          Width = 31
          Height = 13
          Caption = 'vBCST'
          FocusControl = cxDBCurrencyEdit7
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 632
          Top = 80
          Width = 45
          Height = 13
          Caption = 'modBCST'
          FocusControl = cxDBSpinEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 472
          Top = 80
          Width = 31
          Height = 13
          Caption = 'pICMS'
          FocusControl = cxDBCalcEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 320
          Top = 80
          Width = 19
          Height = 13
          Caption = 'vBC'
          FocusControl = cxDBCurrencyEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 176
          Top = 80
          Width = 38
          Height = 13
          Caption = 'pRedBC'
          FocusControl = cxDBCalcEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 16
          Top = 80
          Width = 33
          Height = 13
          Caption = 'modBC'
          FocusControl = cxDBSpinEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 784
          Top = 8
          Width = 34
          Height = 13
          Caption = 'CSOSN'
          FocusControl = cxDBSpinEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 632
          Top = 8
          Width = 19
          Height = 13
          Caption = 'CST'
          FocusControl = cxDBSpinEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 472
          Top = 8
          Width = 20
          Height = 13
          Caption = 'Orig'
          FocusControl = cxDBSpinEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 320
          Top = 8
          Width = 25
          Height = 13
          Caption = 'UFST'
          FocusControl = cxDBTextEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 320
          Top = 144
          Width = 36
          Height = 13
          Caption = 'vunTrib'
          FocusControl = cxDBCurrencyEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 176
          Top = 144
          Width = 24
          Height = 13
          Caption = 'qTrib'
          FocusControl = cxDBCalcEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 16
          Top = 144
          Width = 24
          Height = 13
          Caption = 'uTrib'
          FocusControl = cxDBTextEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 176
          Top = 8
          Width = 43
          Height = 13
          Caption = 'cEANTrib'
          FocusControl = cxDBTextEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 16
          Top = 8
          Width = 27
          Height = 13
          Caption = 'CFOP'
          FocusControl = cxDBTextEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 16
          Top = 24
          DataBinding.DataField = 'CFOP'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          Width = 121
        end
        object cxDBCurrencyEdit12: TcxDBCurrencyEdit
          Left = 760
          Top = 368
          DataBinding.DataField = 'vIPI'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 28
          Width = 121
        end
        object cxDBCalcEdit6: TcxDBCalcEdit
          Left = 624
          Top = 368
          DataBinding.DataField = 'pIPI'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 27
          Width = 121
        end
        object cxDBCurrencyEdit11: TcxDBCurrencyEdit
          Left = 472
          Top = 368
          DataBinding.DataField = 'vUnid'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 26
          Width = 121
        end
        object cxDBCalcEdit5: TcxDBCalcEdit
          Left = 328
          Top = 368
          DataBinding.DataField = 'qUnid'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 25
          Width = 121
        end
        object cxDBCurrencyEdit10: TcxDBCurrencyEdit
          Left = 184
          Top = 368
          DataBinding.DataField = 'vBCIPI'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 24
          Width = 121
        end
        object cxDBSpinEdit7: TcxDBSpinEdit
          Left = 16
          Top = 368
          DataBinding.DataField = 'IPICST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 23
          Width = 121
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 624
          Top = 304
          DataBinding.DataField = 'cEnq'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 22
          Width = 121
        end
        object cxDBSpinEdit6: TcxDBSpinEdit
          Left = 472
          Top = 304
          DataBinding.DataField = 'qSelo'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 21
          Width = 121
        end
        object cxDBTextEdit9: TcxDBTextEdit
          Left = 320
          Top = 304
          DataBinding.DataField = 'cSelo'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 20
          Width = 121
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 176
          Top = 304
          DataBinding.DataField = 'CNPJProd'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 19
          Width = 121
        end
        object cxDBTextEdit7: TcxDBTextEdit
          Left = 16
          Top = 304
          DataBinding.DataField = 'clEnq'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 18
          Width = 121
        end
        object cxDBCurrencyEdit9: TcxDBCurrencyEdit
          Left = 320
          Top = 232
          DataBinding.DataField = 'vICMS'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 17
          Width = 121
        end
        object cxDBCurrencyEdit8: TcxDBCurrencyEdit
          Left = 176
          Top = 232
          DataBinding.DataField = 'vICMSST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 16
          Width = 121
        end
        object cxDBCalcEdit4: TcxDBCalcEdit
          Left = 16
          Top = 232
          DataBinding.DataField = 'pICMSST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 15
          Width = 121
        end
        object cxDBCurrencyEdit7: TcxDBCurrencyEdit
          Left = 784
          Top = 96
          DataBinding.DataField = 'vBCST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 11
          Width = 121
        end
        object cxDBSpinEdit5: TcxDBSpinEdit
          Left = 632
          Top = 96
          DataBinding.DataField = 'modBCST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 10
          Width = 121
        end
        object cxDBCalcEdit3: TcxDBCalcEdit
          Left = 472
          Top = 96
          DataBinding.DataField = 'pICMS'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 121
        end
        object cxDBCurrencyEdit6: TcxDBCurrencyEdit
          Left = 320
          Top = 96
          DataBinding.DataField = 'vBC'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 121
        end
        object cxDBCalcEdit2: TcxDBCalcEdit
          Left = 176
          Top = 96
          DataBinding.DataField = 'pRedBC'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 121
        end
        object cxDBSpinEdit4: TcxDBSpinEdit
          Left = 16
          Top = 96
          DataBinding.DataField = 'modBC'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 6
          Width = 121
        end
        object cxDBSpinEdit3: TcxDBSpinEdit
          Left = 784
          Top = 24
          DataBinding.DataField = 'CSOSN'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 121
        end
        object cxDBSpinEdit2: TcxDBSpinEdit
          Left = 632
          Top = 24
          DataBinding.DataField = 'CST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 121
        end
        object cxDBSpinEdit1: TcxDBSpinEdit
          Left = 472
          Top = 24
          DataBinding.DataField = 'Orig'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 121
        end
        object cxDBTextEdit6: TcxDBTextEdit
          Left = 320
          Top = 24
          DataBinding.DataField = 'UFST'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 121
        end
        object cxDBCurrencyEdit5: TcxDBCurrencyEdit
          Left = 320
          Top = 160
          DataBinding.DataField = 'vunTrib'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 14
          Width = 121
        end
        object cxDBCalcEdit1: TcxDBCalcEdit
          Left = 176
          Top = 160
          DataBinding.DataField = 'qTrib'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 13
          Width = 121
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 16
          Top = 160
          DataBinding.DataField = 'uTrib'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 12
          Width = 121
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 176
          Top = 24
          DataBinding.DataField = 'cEANTrib'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 121
        end
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = #205'tem da nota'
    TabOrder = 0
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 800
    Top = 10
  end
  object qryCadastro: TFDQuery
    BeforePost = qryCadastroBeforePost
    OnNewRecord = qryCadastroNewRecord
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.NotaItens where 1=0')
    Left = 740
    Top = 10
    object qryCadastroidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidPessoa: TIntegerField
      FieldName = 'idPessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidNota: TIntegerField
      FieldName = 'idNota'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidItem: TIntegerField
      FieldName = 'idItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidItemNFE: TIntegerField
      FieldName = 'idItemNFE'
    end
    object qryCadastrocProd: TStringField
      FieldName = 'cProd'
      Size = 50
    end
    object qryCadastronItem: TIntegerField
      FieldName = 'nItem'
    end
    object qryCadastrocEAN: TStringField
      FieldName = 'cEAN'
    end
    object qryCadastroxProd: TStringField
      FieldName = 'xProd'
      Size = 120
    end
    object qryCadastroNCM: TStringField
      FieldName = 'NCM'
    end
    object qryCadastroCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryCadastrouCom: TStringField
      FieldName = 'uCom'
      Size = 10
    end
    object qryCadastroqCom: TFloatField
      FieldName = 'qCom'
    end
    object qryCadastrovunCom: TCurrencyField
      FieldName = 'vunCom'
    end
    object qryCadastrovProd: TCurrencyField
      FieldName = 'vProd'
    end
    object qryCadastrocEANTrib: TStringField
      FieldName = 'cEANTrib'
    end
    object qryCadastrouTrib: TStringField
      FieldName = 'uTrib'
      Size = 10
    end
    object qryCadastroqTrib: TFloatField
      FieldName = 'qTrib'
    end
    object qryCadastrovunTrib: TCurrencyField
      FieldName = 'vunTrib'
    end
    object qryCadastrovFrete: TCurrencyField
      FieldName = 'vFrete'
    end
    object qryCadastrovSeg: TCurrencyField
      FieldName = 'vSeg'
    end
    object qryCadastrovDesc: TCurrencyField
      FieldName = 'vDesc'
    end
    object qryCadastrovOutro: TCurrencyField
      FieldName = 'vOutro'
    end
    object qryCadastroIndTot: TIntegerField
      FieldName = 'IndTot'
    end
    object qryCadastroxPed: TStringField
      FieldName = 'xPed'
    end
    object qryCadastronItemPed: TIntegerField
      FieldName = 'nItemPed'
    end
    object qryCadastroDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryCadastroflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
    object qryCadastroUFST: TStringField
      FieldName = 'UFST'
      Origin = 'UFST'
      FixedChar = True
      Size = 2
    end
    object qryCadastroOrig: TIntegerField
      FieldName = 'Orig'
      Origin = 'Orig'
    end
    object qryCadastroCST: TIntegerField
      FieldName = 'CST'
      Origin = 'CST'
    end
    object qryCadastroCSOSN: TIntegerField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
    end
    object qryCadastromodBC: TIntegerField
      FieldName = 'modBC'
      Origin = 'modBC'
    end
    object qryCadastropRedBC: TFloatField
      FieldName = 'pRedBC'
      Origin = 'pRedBC'
    end
    object qryCadastrovBC: TCurrencyField
      FieldName = 'vBC'
      Origin = 'vBC'
    end
    object qryCadastropICMS: TFloatField
      FieldName = 'pICMS'
      Origin = 'pICMS'
    end
    object qryCadastromodBCST: TIntegerField
      FieldName = 'modBCST'
      Origin = 'modBCST'
    end
    object qryCadastrovBCST: TCurrencyField
      FieldName = 'vBCST'
      Origin = 'vBCST'
    end
    object qryCadastropICMSST: TFloatField
      FieldName = 'pICMSST'
      Origin = 'pICMSST'
    end
    object qryCadastrovICMSST: TCurrencyField
      FieldName = 'vICMSST'
      Origin = 'vICMSST'
    end
    object qryCadastrovICMS: TCurrencyField
      FieldName = 'vICMS'
      Origin = 'vICMS'
    end
    object qryCadastroclEnq: TStringField
      FieldName = 'clEnq'
      Origin = 'clEnq'
      Size = 10
    end
    object qryCadastroCNPJProd: TStringField
      FieldName = 'CNPJProd'
      Origin = 'CNPJProd'
    end
    object qryCadastrocSelo: TStringField
      FieldName = 'cSelo'
      Origin = 'cSelo'
      Size = 10
    end
    object qryCadastroqSelo: TIntegerField
      FieldName = 'qSelo'
      Origin = 'qSelo'
    end
    object qryCadastrocEnq: TStringField
      FieldName = 'cEnq'
      Origin = 'cEnq'
      Size = 10
    end
    object qryCadastroIPICST: TIntegerField
      FieldName = 'IPICST'
      Origin = 'IPICST'
    end
    object qryCadastrovBCIPI: TCurrencyField
      FieldName = 'vBCIPI'
      Origin = 'vBCIPI'
    end
    object qryCadastroqUnid: TFloatField
      FieldName = 'qUnid'
      Origin = 'qUnid'
    end
    object qryCadastrovUnid: TCurrencyField
      FieldName = 'vUnid'
      Origin = 'vUnid'
    end
    object qryCadastropIPI: TFloatField
      FieldName = 'pIPI'
      Origin = 'pIPI'
    end
    object qryCadastrovIPI: TCurrencyField
      FieldName = 'vIPI'
      Origin = 'vIPI'
    end
  end
end
