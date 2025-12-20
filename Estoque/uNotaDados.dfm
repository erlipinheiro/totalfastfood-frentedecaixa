inherited frmNotaDados: TfrmNotaDados
  Caption = 'frmNotaDados'
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    TabOrder = 2
    inherited btnOKPadrao: TJvPanel
      Left = 889
      Top = 6
      ExplicitLeft = 889
      ExplicitTop = 6
    end
  end
  inherited pnlFundoPadrao: TPanel
    object Label6: TLabel
      Left = 7
      Top = 6
      Width = 60
      Height = 13
      Caption = 'NumeroNota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 141
      Top = 6
      Width = 50
      Height = 13
      Caption = 'ChaveNFE'
      FocusControl = cxDBTextEdit1
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 141
      Top = 22
      DataBinding.DataField = 'ChaveNFE'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 876
    end
    object pcNotas: TPageControl
      Left = 7
      Top = 65
      Width = 1010
      Height = 591
      ActivePage = tsProdutos
      TabHeight = 40
      TabOrder = 1
      TabWidth = 100
      object tsDadosNota: TTabSheet
        Caption = 'Dados da nota'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 7
          Top = 60
          Width = 79
          Height = 13
          Caption = 'Data de emiss'#227'o'
          FocusControl = cxDBDateEdit1
        end
        object Label3: TLabel
          Left = 558
          Top = 60
          Width = 81
          Height = 13
          Caption = 'Entrada ou saida'
        end
        object Label4: TLabel
          Left = 739
          Top = 60
          Width = 60
          Height = 13
          Caption = 'Tipo da nota'
        end
        object Label8: TLabel
          Left = 7
          Top = 1
          Width = 97
          Height = 13
          Caption = 'Nome / Raz'#227'o Social'
        end
        object Label5: TLabel
          Left = 279
          Top = 64
          Width = 136
          Height = 13
          Caption = 'Data de entrada no estoque'
          FocusControl = cxDBDateEdit2
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 3
          Top = 79
          DataBinding.DataField = 'DataEmissao'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 270
        end
        object cbEntradaSaida: TDBComboBox
          Left = 555
          Top = 79
          Width = 178
          Height = 37
          DataField = 'EntradaSaida'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'E'
            'S')
          ParentFont = False
          TabOrder = 0
        end
        object cxDBDateEdit2: TcxDBDateEdit
          Left = 279
          Top = 79
          DataBinding.DataField = 'DataEntradaEstoque'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 270
        end
        object cbPessoas: TMycxDBLookupComboBox
          Left = 3
          Top = 16
          DataBinding.DataField = 'idPessoa'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Properties.KeyFieldNames = 'idPessoa'
          Properties.ListColumns = <
            item
              FieldName = 'RazaoSocial'
            end
            item
              FieldName = 'NomeFantasia'
            end>
          Properties.ListSource = dmNotas.dsPessoas
          Properties.Buttons = <
            item
            end>
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 982
        end
        object cbTipoNota: TMycxDBLookupComboBox
          Left = 739
          Top = 79
          DataBinding.DataField = 'idTipoNota'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Properties.KeyFieldNames = 'idTipoNota'
          Properties.ListColumns = <
            item
              FieldName = 'Descricao'
            end>
          Properties.ListSource = dmNotas.dsTiposNota
          Properties.Buttons = <
            item
            end>
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 246
        end
      end
      object tsProdutos: TTabSheet
        Caption = #205'tens'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object btnIncluirNotaItem: TSpeedButton
          Left = 237
          Top = 477
          Width = 106
          Height = 61
          Caption = 'Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnIncluirNotaItemClick
        end
        object btnAlterarNotaItem: TSpeedButton
          Left = 463
          Top = 477
          Width = 106
          Height = 61
          Caption = 'Alterar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnAlterarNotaItemClick
        end
        object btnExcluirNotaItem: TSpeedButton
          Left = 689
          Top = 477
          Width = 106
          Height = 61
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnExcluirNotaItemClick
        end
        object dbgridItens: TcxGrid
          Left = 3
          Top = 3
          Width = 996
          Height = 462
          TabOrder = 0
          object dbgridItensDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmNotas.dsItens
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
              end
              item
                Kind = skSum
                Column = dbgridItensDBTableView1vProd
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.Content = cxStyle3
            Styles.ContentEven = cxStyle1
            Styles.Header = cxStyle2
            object dbgridItensDBTableView1idEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'idEmpresa'
              Visible = False
            end
            object dbgridItensDBTableView1idPessoa: TcxGridDBColumn
              DataBinding.FieldName = 'idPessoa'
              Visible = False
            end
            object dbgridItensDBTableView1idNota: TcxGridDBColumn
              DataBinding.FieldName = 'idNota'
              Visible = False
            end
            object dbgridItensDBTableView1idItem: TcxGridDBColumn
              DataBinding.FieldName = 'idItem'
              Visible = False
            end
            object dbgridItensDBTableView1idItemNFE: TcxGridDBColumn
              Caption = 'ID'
              DataBinding.FieldName = 'idItemNFE'
              Width = 40
            end
            object dbgridItensDBTableView1cProd: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'cProd'
              Width = 140
            end
            object dbgridItensDBTableView1cEAN: TcxGridDBColumn
              DataBinding.FieldName = 'cEAN'
              Visible = False
            end
            object dbgridItensDBTableView1xProd: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'xProd'
              Width = 339
            end
            object dbgridItensDBTableView1NCM: TcxGridDBColumn
              DataBinding.FieldName = 'NCM'
              Visible = False
            end
            object dbgridItensDBTableView1CFOP: TcxGridDBColumn
              DataBinding.FieldName = 'CFOP'
              Visible = False
            end
            object dbgridItensDBTableView1uCom: TcxGridDBColumn
              Caption = 'Und.'
              DataBinding.FieldName = 'uCom'
              Width = 100
            end
            object dbgridItensDBTableView1vunCom: TcxGridDBColumn
              Caption = 'Unit'#225'rio'
              DataBinding.FieldName = 'vunCom'
              Width = 104
            end
            object dbgridItensDBTableView1qCom: TcxGridDBColumn
              Caption = 'Qtde'
              DataBinding.FieldName = 'qCom'
              Width = 86
            end
            object dbgridItensDBTableView1vProd: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'vProd'
              Width = 154
            end
            object dbgridItensDBTableView1cEANTrib: TcxGridDBColumn
              DataBinding.FieldName = 'cEANTrib'
              Visible = False
            end
            object dbgridItensDBTableView1uTrib: TcxGridDBColumn
              DataBinding.FieldName = 'uTrib'
              Visible = False
            end
            object dbgridItensDBTableView1qTrib: TcxGridDBColumn
              DataBinding.FieldName = 'qTrib'
              Visible = False
            end
            object dbgridItensDBTableView1vunTrib: TcxGridDBColumn
              DataBinding.FieldName = 'vunTrib'
              Visible = False
            end
            object dbgridItensDBTableView1vFrete: TcxGridDBColumn
              DataBinding.FieldName = 'vFrete'
              Visible = False
            end
            object dbgridItensDBTableView1vSeg: TcxGridDBColumn
              DataBinding.FieldName = 'vSeg'
              Visible = False
            end
            object dbgridItensDBTableView1vDesc: TcxGridDBColumn
              DataBinding.FieldName = 'vDesc'
              Visible = False
            end
            object dbgridItensDBTableView1vOutro: TcxGridDBColumn
              DataBinding.FieldName = 'vOutro'
              Visible = False
            end
            object dbgridItensDBTableView1IndTot: TcxGridDBColumn
              DataBinding.FieldName = 'IndTot'
              Visible = False
            end
            object dbgridItensDBTableView1xPed: TcxGridDBColumn
              DataBinding.FieldName = 'xPed'
              Visible = False
            end
            object dbgridItensDBTableView1nItemPed: TcxGridDBColumn
              DataBinding.FieldName = 'nItemPed'
              Visible = False
            end
            object dbgridItensDBTableView1DataEnvioCentral: TcxGridDBColumn
              DataBinding.FieldName = 'DataEnvioCentral'
              Visible = False
            end
            object dbgridItensDBTableView1flEnviadoCentral: TcxGridDBColumn
              DataBinding.FieldName = 'flEnviadoCentral'
              Visible = False
            end
          end
          object dbgridItensLevel1: TcxGridLevel
            GridView = dbgridItensDBTableView1
          end
        end
      end
      object tsVencimentos: TTabSheet
        Caption = 'Vencimentos'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object btnIncluirVencimentos: TSpeedButton
          Left = 227
          Top = 477
          Width = 106
          Height = 61
          Caption = 'Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnIncluirVencimentosClick
        end
        object btnAlterarVencimentos: TSpeedButton
          Left = 430
          Top = 477
          Width = 106
          Height = 61
          Caption = 'Alterar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnExcluirVencimentos: TSpeedButton
          Left = 633
          Top = 477
          Width = 106
          Height = 61
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnExcluirVencimentosClick
        end
        object dbgridVencimentos: TcxGrid
          Left = 3
          Top = 3
          Width = 996
          Height = 468
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmNotas.dsVencimentos
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NavigatorOffset = 80
            OptionsView.GroupByBox = False
            Styles.Content = cxStyle1
            Styles.Header = cxStyle1
            object cxGridDBTableView1idEmpresa: TcxGridDBColumn
              DataBinding.FieldName = 'idEmpresa'
              Visible = False
            end
            object cxGridDBTableView1idPessoa: TcxGridDBColumn
              DataBinding.FieldName = 'idPessoa'
              Visible = False
            end
            object cxGridDBTableView1idNota: TcxGridDBColumn
              DataBinding.FieldName = 'idNota'
              Visible = False
            end
            object cxGridDBTableView1idVencimento: TcxGridDBColumn
              Caption = 'ID'
              DataBinding.FieldName = 'idVencimento'
              Width = 70
            end
            object cxGridDBTableView1idTipoVencimento: TcxGridDBColumn
              DataBinding.FieldName = 'idTipoVencimento'
              Visible = False
            end
            object cxGridDBTableView1Codigo: TcxGridDBColumn
              DataBinding.FieldName = 'Codigo'
              Width = 83
            end
            object cxGridDBTableView1DescricaoFormaPagamento: TcxGridDBColumn
              DataBinding.FieldName = 'DescricaoFormaPagamento'
              Width = 470
            end
            object cxGridDBTableView1ValorAPagar: TcxGridDBColumn
              DataBinding.FieldName = 'ValorAPagar'
              Width = 153
            end
            object cxGridDBTableView1DataVencimento: TcxGridDBColumn
              DataBinding.FieldName = 'DataVencimento'
              Width = 179
            end
            object cxGridDBTableView1DataEnvioCentral: TcxGridDBColumn
              DataBinding.FieldName = 'DataEnvioCentral'
              Visible = False
            end
            object cxGridDBTableView1flEnviadoCentral: TcxGridDBColumn
              DataBinding.FieldName = 'flEnviadoCentral'
              Visible = False
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
    object cxDBCurrencyEdit1: TcxDBCurrencyEdit
      Left = 14
      Top = 22
      DataBinding.DataField = 'NumeroNota'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 121
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Dados da nota'
    TabOrder = 0
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 416
    Top = 432
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16768959
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 728
    Top = 3
  end
  object qryCadastro: TFDQuery
    OnNewRecord = qryCadastroNewRecord
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.Notas  where 1=0')
    Left = 637
    Top = 3
    object qryCadastroidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCadastroidPessoa: TIntegerField
      FieldName = 'idPessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCadastroidNota: TIntegerField
      FieldName = 'idNota'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroNumeroNota: TStringField
      FieldName = 'NumeroNota'
      Size = 50
    end
    object qryCadastroidTipoNota: TIntegerField
      FieldName = 'idTipoNota'
      Required = True
    end
    object qryCadastroDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Required = True
    end
    object qryCadastroValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
    object qryCadastroEntradaSaida: TStringField
      FieldName = 'EntradaSaida'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCadastroDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryCadastroflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
    object qryCadastroChaveNFE: TStringField
      FieldName = 'ChaveNFE'
      Origin = 'ChaveNFE'
      Size = 50
    end
    object qryCadastroDataEntradaEstoque: TDateTimeField
      FieldName = 'DataEntradaEstoque'
      Origin = 'DataEntradaEstoque'
    end
  end
end
