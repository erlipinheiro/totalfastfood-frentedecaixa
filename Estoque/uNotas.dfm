inherited frmNotas: TfrmNotas
  Caption = 'frmNotas'
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TJvPanel
      Left = 100
      Top = 6
      Visible = False
      ExplicitLeft = 100
      ExplicitTop = 6
    end
    object btnNovaNota: TJvPanel
      Left = 365
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'NOVA'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnNovaNotaClick
    end
    object btnAlterar: TJvPanel
      Left = 625
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'ALTERAR'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnExcluir: TJvPanel
      Left = 760
      Top = 5
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'EXCLUIR'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnExportar: TJvPanel
      Left = 895
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'EXPORTAR'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object btnNovaNFE: TJvPanel
      Left = 492
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'NOVA NFE'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = btnNovaNFEClick
    end
  end
  inherited pnlFundoPadrao: TPanel
    object dbgridPrincipal: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      object dbgridPrincipalDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsGridPadrao
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skSum
            Position = spFooter
            Column = dbgridPrincipalDBTableView1ValorTotal
          end
          item
            Kind = skSum
            Column = dbgridPrincipalDBTableView1ValorTotal
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            Column = dbgridPrincipalDBTableView1ValorTotal
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhum dado a visualizar>'
        OptionsView.ShowEditButtons = gsebAlways
        OptionsView.Footer = True
        OptionsView.Indicator = True
        Styles.ContentEven = cxStyle1
        object dbgridPrincipalDBTableView1idEmpresa: TcxGridDBColumn
          DataBinding.FieldName = 'idEmpresa'
          Visible = False
        end
        object dbgridPrincipalDBTableView1idPessoa: TcxGridDBColumn
          DataBinding.FieldName = 'idPessoa'
          Visible = False
        end
        object dbgridPrincipalDBTableView1idNota: TcxGridDBColumn
          DataBinding.FieldName = 'idNota'
          Visible = False
        end
        object dbgridPrincipalDBTableView1RazaoSocial: TcxGridDBColumn
          DataBinding.FieldName = 'RazaoSocial'
          Width = 248
        end
        object dbgridPrincipalDBTableView1NomeFantasia: TcxGridDBColumn
          DataBinding.FieldName = 'NomeFantasia'
          Width = 141
        end
        object dbgridPrincipalDBTableView1NumeroNota: TcxGridDBColumn
          DataBinding.FieldName = 'NumeroNota'
        end
        object dbgridPrincipalDBTableView1Descricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          Width = 123
        end
        object dbgridPrincipalDBTableView1idTipoNota: TcxGridDBColumn
          DataBinding.FieldName = 'idTipoNota'
          Visible = False
        end
        object dbgridPrincipalDBTableView1DataEmissao: TcxGridDBColumn
          DataBinding.FieldName = 'DataEmissao'
          Width = 80
        end
        object dbgridPrincipalDBTableView1ValorTotal: TcxGridDBColumn
          DataBinding.FieldName = 'ValorTotal'
          Width = 127
        end
        object dbgridPrincipalDBTableView1EntradaSaida: TcxGridDBColumn
          DataBinding.FieldName = 'EntradaSaida'
          Width = 76
        end
        object dbgridPrincipalDBTableView1DataEnvioCentral: TcxGridDBColumn
          DataBinding.FieldName = 'DataEnvioCentral'
          Visible = False
        end
        object dbgridPrincipalDBTableView1flEnviadoCentral: TcxGridDBColumn
          DataBinding.FieldName = 'flEnviadoCentral'
          Visible = False
        end
      end
      object dbgridPrincipalLevel1: TcxGridLevel
        GridView = dbgridPrincipalDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Cadastro de notas'
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel|*.XLS|Excel 2010|*.xlsx|HTML|*.html|XML|*.xml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 310
    Top = 340
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 310
    Top = 295
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
  end
  object qryGridPadrao: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select n.*, p.RazaoSocial, p.NomeFantasia, tn.Descricao from Con' +
        'tabil.Notas n'
      'inner join Contabil.Pessoas p on n.idPessoa = p.idPessoa'
      'inner join Contabil.TiposNota tn on tn.idTipoNota = n.idTipoNota')
    Left = 219
    Top = 343
    object qryGridPadraoidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryGridPadraoidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object qryGridPadraoidNota: TIntegerField
      FieldName = 'idNota'
      Required = True
    end
    object qryGridPadraoRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryGridPadraoNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGridPadraoNumeroNota: TStringField
      FieldName = 'NumeroNota'
      Size = 50
    end
    object qryGridPadraoDescricao: TStringField
      FieldName = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryGridPadraoidTipoNota: TIntegerField
      FieldName = 'idTipoNota'
      Required = True
    end
    object qryGridPadraoDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Required = True
    end
    object qryGridPadraoValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
      Required = True
    end
    object qryGridPadraoEntradaSaida: TStringField
      FieldName = 'EntradaSaida'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryGridPadraoDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryGridPadraoflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
  end
  object dsGridPadrao: TDataSource
    DataSet = qryGridPadrao
    Left = 221
    Top = 384
  end
end
