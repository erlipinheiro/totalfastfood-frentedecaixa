inherited frmNotaDados: TfrmNotaDados
  ActiveControl = cxDBTextEdit2
  Caption = 'frmNotaDados'
  ExplicitTop = -121
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    TabOrder = 2
    inherited btnOKPadrao: TJvPanel
      Left = 726
      Top = 6
      ExplicitLeft = 726
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
      FocusControl = cxDBTextEdit2
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
    object lbl1: TLabel
      Left = 8
      Top = 110
      Width = 79
      Height = 13
      Caption = 'Data de emiss'#227'o'
      FocusControl = cxDBDateEdit1
    end
    object lbl2: TLabel
      Left = 374
      Top = 112
      Width = 81
      Height = 13
      Caption = 'Entrada ou saida'
    end
    object lbl3: TLabel
      Left = 511
      Top = 111
      Width = 60
      Height = 13
      Caption = 'Tipo da nota'
    end
    object lbl4: TLabel
      Left = 10
      Top = 49
      Width = 97
      Height = 13
      Caption = 'Nome / Raz'#227'o Social'
    end
    object lbl5: TLabel
      Left = 191
      Top = 112
      Width = 136
      Height = 13
      Caption = 'Data de entrada no estoque'
      FocusControl = cxDBDateEdit2
    end
    object dbgridItens: TcxGrid
      Left = 10
      Top = 170
      Width = 999
      Height = 355
      TabOrder = 7
      object dbgridItensDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dmNotas.dsItens
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object dbgridItensDBTableView1idEmpresa: TcxGridDBColumn
          DataBinding.FieldName = 'idEmpresa'
        end
        object dbgridItensDBTableView1idPessoa: TcxGridDBColumn
          DataBinding.FieldName = 'idPessoa'
        end
        object dbgridItensDBTableView1idNota: TcxGridDBColumn
          DataBinding.FieldName = 'idNota'
        end
        object dbgridItensDBTableView1idItem: TcxGridDBColumn
          DataBinding.FieldName = 'idItem'
        end
        object dbgridItensDBTableView1idItemNFE: TcxGridDBColumn
          DataBinding.FieldName = 'idItemNFE'
        end
        object dbgridItensDBTableView1cProd: TcxGridDBColumn
          DataBinding.FieldName = 'cProd'
        end
        object dbgridItensDBTableView1nItem: TcxGridDBColumn
          DataBinding.FieldName = 'nItem'
        end
        object dbgridItensDBTableView1cEAN: TcxGridDBColumn
          DataBinding.FieldName = 'cEAN'
        end
        object dbgridItensDBTableView1xProd: TcxGridDBColumn
          DataBinding.FieldName = 'xProd'
        end
        object dbgridItensDBTableView1NCM: TcxGridDBColumn
          DataBinding.FieldName = 'NCM'
        end
        object dbgridItensDBTableView1CFOP: TcxGridDBColumn
          DataBinding.FieldName = 'CFOP'
        end
        object dbgridItensDBTableView1uCom: TcxGridDBColumn
          DataBinding.FieldName = 'uCom'
        end
        object dbgridItensDBTableView1qCom: TcxGridDBColumn
          DataBinding.FieldName = 'qCom'
        end
        object dbgridItensDBTableView1vunCom: TcxGridDBColumn
          DataBinding.FieldName = 'vunCom'
        end
        object dbgridItensDBTableView1vProd: TcxGridDBColumn
          DataBinding.FieldName = 'vProd'
        end
        object dbgridItensDBTableView1cEANTrib: TcxGridDBColumn
          DataBinding.FieldName = 'cEANTrib'
        end
        object dbgridItensDBTableView1uTrib: TcxGridDBColumn
          DataBinding.FieldName = 'uTrib'
        end
        object dbgridItensDBTableView1qTrib: TcxGridDBColumn
          DataBinding.FieldName = 'qTrib'
        end
        object dbgridItensDBTableView1vunTrib: TcxGridDBColumn
          DataBinding.FieldName = 'vunTrib'
        end
        object dbgridItensDBTableView1vFrete: TcxGridDBColumn
          DataBinding.FieldName = 'vFrete'
        end
        object dbgridItensDBTableView1vSeg: TcxGridDBColumn
          DataBinding.FieldName = 'vSeg'
        end
        object dbgridItensDBTableView1vDesc: TcxGridDBColumn
          DataBinding.FieldName = 'vDesc'
        end
        object dbgridItensDBTableView1vOutro: TcxGridDBColumn
          DataBinding.FieldName = 'vOutro'
        end
        object dbgridItensDBTableView1IndTot: TcxGridDBColumn
          DataBinding.FieldName = 'IndTot'
        end
        object dbgridItensDBTableView1xPed: TcxGridDBColumn
          DataBinding.FieldName = 'xPed'
        end
        object dbgridItensDBTableView1nItemPed: TcxGridDBColumn
          DataBinding.FieldName = 'nItemPed'
        end
        object dbgridItensDBTableView1DataEnvioCentral: TcxGridDBColumn
          DataBinding.FieldName = 'DataEnvioCentral'
        end
        object dbgridItensDBTableView1flEnviadoCentral: TcxGridDBColumn
          DataBinding.FieldName = 'flEnviadoCentral'
        end
      end
      object dbgridItensLevel1: TcxGridLevel
        GridView = dbgridItensDBTableView1
      end
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 141
      Top = 22
      DataBinding.DataField = 'ChaveNFE'
      DataBinding.DataSource = dsCadastro
      TabOrder = 1
      Width = 868
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 7
      Top = 22
      DataBinding.DataField = 'NumeroNota'
      DataBinding.DataSource = dsCadastro
      TabOrder = 0
      Width = 128
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 8
      Top = 127
      DataBinding.DataField = 'DataEmissao'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 177
    end
    object cbPessoas: TMycxDBLookupComboBox
      Left = 8
      Top = 68
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
      Properties.MaxLength = 0
      Properties.Buttons = <
        item
        end
        item
          Kind = bkEllipsis
        end>
      Style.Color = 13690861
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 1001
    end
    object cbTipoNota: TMycxDBLookupComboBox
      Left = 511
      Top = 127
      DataBinding.DataField = 'idTipoNota'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Properties.KeyFieldNames = 'idTipoNota'
      Properties.ListColumns = <
        item
          FieldName = 'Descricao'
        end>
      Properties.ListSource = dmNotas.dsTiposNota
      Properties.MaxLength = 0
      Properties.Buttons = <
        item
        end
        item
          Kind = bkEllipsis
        end>
      Style.Color = 13690861
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 498
    end
    object dbcbbEntradaSaida: TDBComboBox
      Left = 374
      Top = 127
      Width = 121
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
      TabOrder = 5
    end
    object cxDBDateEdit2: TcxDBDateEdit
      Left = 191
      Top = 127
      DataBinding.DataField = 'DataEntradaEstoque'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 177
    end
    object dbgridVencimentos: TcxGrid
      Left = 10
      Top = 531
      Width = 999
      Height = 125
      TabOrder = 8
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dmNotas.dsVencimentos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGridDBTableView1idEmpresa: TcxGridDBColumn
          DataBinding.FieldName = 'idEmpresa'
        end
        object cxGridDBTableView1idPessoa: TcxGridDBColumn
          DataBinding.FieldName = 'idPessoa'
        end
        object cxGridDBTableView1idNota: TcxGridDBColumn
          DataBinding.FieldName = 'idNota'
        end
        object cxGridDBTableView1idVencimento: TcxGridDBColumn
          DataBinding.FieldName = 'idVencimento'
        end
        object cxGridDBTableView1idTipoVencimento: TcxGridDBColumn
          DataBinding.FieldName = 'idTipoVencimento'
        end
        object cxGridDBTableView1Codigo: TcxGridDBColumn
          DataBinding.FieldName = 'Codigo'
        end
        object cxGridDBTableView1ValorAPagar: TcxGridDBColumn
          DataBinding.FieldName = 'ValorAPagar'
        end
        object cxGridDBTableView1DataVencimento: TcxGridDBColumn
          DataBinding.FieldName = 'DataVencimento'
        end
        object cxGridDBTableView1DataEnvioCentral: TcxGridDBColumn
          DataBinding.FieldName = 'DataEnvioCentral'
        end
        object cxGridDBTableView1flEnviadoCentral: TcxGridDBColumn
          DataBinding.FieldName = 'flEnviadoCentral'
          Width = 96
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Dados da nota'
    TabOrder = 0
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 424
    Top = 280
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 8421631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
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
    Left = 698
    Top = 65532
  end
  object qryCadastro: TFDQuery
    OnNewRecord = qryCadastroNewRecord
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.Notas  where 1=0')
    Left = 638
    Top = 65532
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
