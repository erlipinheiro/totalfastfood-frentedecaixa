inherited frmAuditoriaEstoqueProdutos: TfrmAuditoriaEstoqueProdutos
  Caption = 'frmAuditoriaEstoqueProdutos'
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TJvPanel
      Visible = False
    end
  end
  inherited pnlFundoPadrao: TPanel
    object Splitter1: TSplitter
      Left = 0
      Top = 567
      Width = 1024
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 456
    end
    object dbgridContagemEstoqueProdutos: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 567
      Align = alClient
      TabOrder = 0
      object dbgridContagemEstoqueProdutosDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsContagemProdutos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        Styles.Content = cxStyle1
        Styles.ContentEven = cxStyle1
        Styles.ContentOdd = cxStyle2
        object dbgridContagemEstoqueProdutosDBTableView1cdProduto: TcxGridDBColumn
          DataBinding.FieldName = 'cdProduto'
          Width = 59
        end
        object dbgridContagemEstoqueProdutosDBTableView1Descricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          Width = 126
        end
        object dbgridContagemEstoqueProdutosDBTableView1DescricaoGrupo: TcxGridDBColumn
          DataBinding.FieldName = 'DescricaoGrupo'
          Width = 109
        end
        object dbgridContagemEstoqueProdutosDBTableView1DescricaoSubGrupo: TcxGridDBColumn
          DataBinding.FieldName = 'DescricaoSubGrupo'
          Width = 132
        end
        object dbgridContagemEstoqueProdutosDBTableView1DescricaoLinhaProduto: TcxGridDBColumn
          DataBinding.FieldName = 'DescricaoLinhaProduto'
          Width = 138
        end
        object dbgridContagemEstoqueProdutosDBTableView1DescricaoUnidadePacote: TcxGridDBColumn
          DataBinding.FieldName = 'DescricaoUnidadePacote'
          Width = 105
        end
        object dbgridContagemEstoqueProdutosDBTableView1qtdePacote: TcxGridDBColumn
          DataBinding.FieldName = 'qtdePacote'
          Width = 72
        end
        object dbgridContagemEstoqueProdutosDBTableView1QtdeInteira: TcxGridDBColumn
          DataBinding.FieldName = 'QtdeInteira'
          Width = 77
        end
        object dbgridContagemEstoqueProdutosDBTableView1QtdeFracionada: TcxGridDBColumn
          DataBinding.FieldName = 'QtdeFracionada'
          Width = 96
        end
        object dbgridContagemEstoqueProdutosDBTableView1Total: TcxGridDBColumn
          DataBinding.FieldName = 'Total'
          Width = 85
        end
      end
      object dbgridContagemEstoqueProdutosLevel1: TcxGridLevel
        GridView = dbgridContagemEstoqueProdutosDBTableView1
      end
    end
    object cxGridRelacaoEntreProdutos: TcxGrid
      Left = 0
      Top = 570
      Width = 1024
      Height = 92
      Align = alBottom
      TabOrder = 1
      object cxGridRelacaoEntreProdutosDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsRelacaoEntreProdutos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridRelacaoEntreProdutosDBTableView1RazaoSocial: TcxGridDBColumn
          DataBinding.FieldName = 'RazaoSocial'
        end
        object cxGridRelacaoEntreProdutosDBTableView1NomeFantasia: TcxGridDBColumn
          DataBinding.FieldName = 'NomeFantasia'
        end
        object cxGridRelacaoEntreProdutosDBTableView1CodigoFornecedor: TcxGridDBColumn
          DataBinding.FieldName = 'CodigoFornecedor'
        end
        object cxGridRelacaoEntreProdutosDBTableView1Qtde: TcxGridDBColumn
          DataBinding.FieldName = 'Qtde'
        end
      end
      object cxGridRelacaoEntreProdutosLevel1: TcxGridLevel
        GridView = cxGridRelacaoEntreProdutosDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Editar a quantidade de produtos da auditoria'
    Font.Height = -37
  end
  object qryContagemProdutos: TFDQuery
    OnCalcFields = qryContagemProdutosCalcFields
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select ecp.*, vp.cdProduto, vp.Descricao, DescricaoGrupo, Descri' +
        'caoSubGrupo, DescricaoLinhaProduto, vp.idUnidadePacote, '
      ' vp.qtdePacote, vp.DescricaoUnidadePacote   '
      'from Estoque.EmpresaContagemProdutos ecp'
      
        'inner join viewProdutos vp on vp.idEmpresa = ecp.idEmpresa and e' +
        'cp.idProduto = vp.idProduto and vp.idTipo = 2'
      
        'where ecp.idEmpresa = :idEmpresa and ecp.idContagem = :idContage' +
        'm'
      'order by descricao')
    Left = 525
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
        Value = 21
      end
      item
        Name = 'idContagem'
        DataType = ftInteger
        ParamType = ptInput
        Value = 5
      end>
    object qryContagemProdutosidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryContagemProdutosidContagem: TIntegerField
      FieldName = 'idContagem'
      Required = True
    end
    object qryContagemProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
      Required = True
    end
    object qryContagemProdutosQtdeInteira: TFloatField
      FieldName = 'QtdeInteira'
    end
    object qryContagemProdutosQtdeFracionada: TFloatField
      FieldName = 'QtdeFracionada'
    end
    object qryContagemProdutosQtdeDiferenca: TFloatField
      FieldName = 'QtdeDiferenca'
    end
    object qryContagemProdutosDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryContagemProdutosflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
    object qryContagemProdutoscdProduto: TStringField
      FieldName = 'cdProduto'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryContagemProdutosDescricao: TStringField
      FieldName = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryContagemProdutosDescricaoGrupo: TStringField
      FieldName = 'DescricaoGrupo'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryContagemProdutosDescricaoSubGrupo: TStringField
      FieldName = 'DescricaoSubGrupo'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryContagemProdutosDescricaoLinhaProduto: TStringField
      FieldName = 'DescricaoLinhaProduto'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryContagemProdutosidUnidadePacote: TIntegerField
      FieldName = 'idUnidadePacote'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryContagemProdutosqtdePacote: TFloatField
      FieldName = 'qtdePacote'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryContagemProdutosDescricaoUnidadePacote: TStringField
      FieldName = 'DescricaoUnidadePacote'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryContagemProdutosTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      ProviderFlags = []
      Calculated = True
    end
  end
  object dsContagemProdutos: TDataSource
    DataSet = qryContagemProdutos
    Left = 650
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 115
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
      Color = 15132330
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object qryRelacaoEntreProdutos: TFDQuery
    MasterSource = dsContagemProdutos
    MasterFields = 'idProduto'
    DetailFields = 'idProduto'
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select p.idPessoa, rep.idProduto, p.RazaoSocial, p.NomeFantasia,' +
        ' rep.CodigoFornecedor, rep.Qtde from Estoque.RelacaoEntreProduto' +
        's rep'
      'inner join Contabil.Pessoas p on rep.idPessoa = p.idPessoa'
      'where rep.idpessoa <> -1'
      
        'group by p.idPessoa, rep.idProduto, p.RazaoSocial, p.NomeFantasi' +
        'a, rep.CodigoFornecedor, rep.Qtde '
      'order by p.NomeFantasia')
    Left = 440
    Top = 545
    ParamData = <
      item
        Name = 'idProduto'
        DataType = ftString
      end>
    object qryRelacaoEntreProdutosidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object qryRelacaoEntreProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
      ReadOnly = True
      Required = True
    end
    object qryRelacaoEntreProdutosRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object qryRelacaoEntreProdutosNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object qryRelacaoEntreProdutosCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      ReadOnly = True
      Required = True
    end
    object qryRelacaoEntreProdutosQtde: TFloatField
      FieldName = 'Qtde'
      ReadOnly = True
    end
  end
  object dsRelacaoEntreProdutos: TDataSource
    DataSet = qryRelacaoEntreProdutos
    Left = 565
    Top = 545
  end
end
