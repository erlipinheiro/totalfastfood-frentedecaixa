inherited frmAuditoriaEstoque: TfrmAuditoriaEstoque
  Caption = 'frmAuditoriaEstoque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TJvPanel
      Left = 87
      Top = 6
      Visible = False
      ExplicitLeft = 87
      ExplicitTop = 6
    end
    object btnIncluirContagem: TJvPanel
      Left = 260
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Incluir'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnIncluirContagemClick
    end
    object btnAlterarContagem: TJvPanel
      Left = 387
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Alterar'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
    object btnExcluirContagem: TJvPanel
      Left = 514
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Excluir'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
    end
    object btnEditarQuantidades: TJvPanel
      Left = 641
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Editar quantidades'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = btnEditarQuantidadesClick
    end
    object btnImprimirFitaContagem: TJvPanel
      Left = 766
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Imprimir fita'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = btnImprimirFitaContagemClick
    end
    object btnImprimirDiscrepancias: TJvPanel
      Left = 893
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Imprimir discrep'#226'ncias'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited pnlFundoPadrao: TPanel
    object dbgridContagens: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      object dbgridContagensDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsContagens
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skAverage
            Position = spFooter
            Column = dbgridContagensDBTableView1PercentualAcerto
            Sorted = True
          end
          item
            Kind = skAverage
            Column = dbgridContagensDBTableView1PercentualAcerto
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skAverage
            Column = dbgridContagensDBTableView1PercentualAcerto
          end>
        DataController.Summary.SummaryGroups = <>
        object dbgridContagensDBTableView1idEmpresa: TcxGridDBColumn
          DataBinding.FieldName = 'idEmpresa'
          Visible = False
        end
        object dbgridContagensDBTableView1idContagem: TcxGridDBColumn
          DataBinding.FieldName = 'idContagem'
        end
        object dbgridContagensDBTableView1idPessoaInicio: TcxGridDBColumn
          DataBinding.FieldName = 'idPessoaInicio'
          Visible = False
        end
        object dbgridContagensDBTableView1idPessoaFim: TcxGridDBColumn
          DataBinding.FieldName = 'idPessoaFim'
          Visible = False
        end
        object dbgridContagensDBTableView1DataInicio: TcxGridDBColumn
          DataBinding.FieldName = 'DataInicio'
          Options.Editing = False
        end
        object dbgridContagensDBTableView1PessoaInicio: TcxGridDBColumn
          DataBinding.FieldName = 'PessoaInicio'
          Options.Editing = False
          Width = 263
        end
        object dbgridContagensDBTableView1DataFim: TcxGridDBColumn
          DataBinding.FieldName = 'DataFim'
        end
        object dbgridContagensDBTableView1PessoaFim: TcxGridDBColumn
          DataBinding.FieldName = 'PessoaFim'
          Width = 198
        end
        object dbgridContagensDBTableView1PercentualAcerto: TcxGridDBColumn
          DataBinding.FieldName = 'PercentualAcerto'
          Width = 113
        end
        object dbgridContagensDBTableView1DataEnvioCentral: TcxGridDBColumn
          DataBinding.FieldName = 'DataEnvioCentral'
          Visible = False
        end
        object dbgridContagensDBTableView1flEnviadoCentral: TcxGridDBColumn
          DataBinding.FieldName = 'flEnviadoCentral'
          Visible = False
        end
        object dbgridContagensDBTableView1Status: TcxGridDBColumn
          DataBinding.FieldName = 'Status'
        end
      end
      object dbgridContagensLevel1: TcxGridLevel
        GridView = dbgridContagensDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Auditoria de estoque'
    Font.Height = -37
  end
  object qryContagens: TFDQuery
    OnCalcFields = qryContagensCalcFields
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select ec.*, pi.RazaoSocial as PessoaInicio, pf.RazaoSocial as P' +
        'essoaFim from Estoque.EmpresaContagens ec '
      
        'inner join Contabil.Pessoas pi on pi.idPessoa = ec.idPessoaInici' +
        'o'
      'left join Contabil.Pessoas pf on pf.idPessoa = ec.idPessoaFim'
      'order by ec.DataInicio desc')
    Left = 695
    object qryContagensidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryContagensidContagem: TIntegerField
      FieldName = 'idContagem'
      Required = True
    end
    object qryContagensidPessoaInicio: TIntegerField
      FieldName = 'idPessoaInicio'
      Required = True
    end
    object qryContagensidPessoaFim: TIntegerField
      FieldName = 'idPessoaFim'
    end
    object qryContagensDataInicio: TDateTimeField
      FieldName = 'DataInicio'
      Required = True
    end
    object qryContagensDataFim: TDateTimeField
      FieldName = 'DataFim'
    end
    object qryContagensStatus: TIntegerField
      FieldName = 'Status'
      Required = True
    end
    object qryContagensPercentualAcerto: TFloatField
      FieldName = 'PercentualAcerto'
    end
    object qryContagensDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryContagensflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
    object qryContagensPessoaInicio: TStringField
      FieldName = 'PessoaInicio'
      ReadOnly = True
      Required = True
      Size = 80
    end
    object qryContagensPessoaFim: TStringField
      FieldName = 'PessoaFim'
      ReadOnly = True
      Size = 80
    end
    object qryContagensStatusString: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusString'
      Size = 30
      Calculated = True
    end
  end
  object dsContagens: TDataSource
    DataSet = qryContagens
    Left = 780
  end
end
