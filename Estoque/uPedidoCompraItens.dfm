inherited frmPedidoCompraItens: TfrmPedidoCompraItens
  Caption = 'frmPedidoCompraItens'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object dbgridPedidoCompra: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      object dbgridPedidoCompraDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnEditKeyDown = dbgridPedidoCompraDBTableView1EditKeyDown
        DataController.DataSource = dsPedidoCompraItens
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        Styles.Content = cxStyle1
        Styles.ContentEven = cxStyle3
        object dbgridPedidoCompraDBTableView1idEmpresa: TcxGridDBColumn
          DataBinding.FieldName = 'idEmpresa'
          Visible = False
        end
        object dbgridPedidoCompraDBTableView1idPedidoCompra: TcxGridDBColumn
          DataBinding.FieldName = 'idPedidoCompra'
          Visible = False
        end
        object dbgridPedidoCompraDBTableView1idPedidoCompraItem: TcxGridDBColumn
          DataBinding.FieldName = 'idPedidoCompraItem'
          Visible = False
        end
        object dbgridPedidoCompraDBTableView1idProduto: TcxGridDBColumn
          DataBinding.FieldName = 'idProduto'
          Visible = False
        end
        object dbgridPedidoCompraDBTableView1cdProduto: TcxGridDBColumn
          DataBinding.FieldName = 'cdProduto'
          Options.Editing = False
          Width = 67
        end
        object dbgridPedidoCompraDBTableView1CodigoFornecedor: TcxGridDBColumn
          DataBinding.FieldName = 'CodigoFornecedor'
          Options.Editing = False
          Width = 107
        end
        object dbgridPedidoCompraDBTableView1Descricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          Options.Editing = False
          Width = 291
        end
        object dbgridPedidoCompraDBTableView1QtdeNoEstoque: TcxGridDBColumn
          DataBinding.FieldName = 'QtdeNoEstoque'
          Options.Editing = False
          Width = 94
        end
        object dbgridPedidoCompraDBTableView1MTC: TcxGridDBColumn
          DataBinding.FieldName = 'MTC'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          Options.Editing = False
          Width = 64
        end
        object dbgridPedidoCompraDBTableView1QtdePorTickets: TcxGridDBColumn
          DataBinding.FieldName = 'QtdePorTickets'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          Options.Editing = False
        end
        object dbgridPedidoCompraDBTableView1QtdeSugerida: TcxGridDBColumn
          DataBinding.FieldName = 'QtdeSugerida'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          Options.Editing = False
          Width = 88
        end
        object dbgridPedidoCompraDBTableView1qtde: TcxGridDBColumn
          Caption = 'Qtde relacionada'
          DataBinding.FieldName = 'qtde'
          Width = 99
        end
        object dbgridPedidoCompraDBTableView1QtdePedido: TcxGridDBColumn
          DataBinding.FieldName = 'QtdePedido'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 3
          Properties.DisplayFormat = ' ,0.000;- ,0.000'
          Width = 84
        end
      end
      object dbgridPedidoCompraLevel1: TcxGridLevel
        GridView = dbgridPedidoCompraDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Pedido de compra'
  end
  object qryPedidoCompraItens: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select pci.*, p.cdProduto, p.Descricao, rep.CodigoFornecedor, re' +
        'p.qtde, '
      
        '((case when ecp.QtdeInteira is null then 0 else ecp.QtdeInteira ' +
        'end * rep.qtde) + (case when ecp.QtdeFracionada is null then 0 e' +
        'lse ecp.QtdeFracionada end))  as QtdeNoEstoque from Estoque.Pedi' +
        'doCompraItens  pci'
      
        'inner join Estoque.PedidosCompra pc on pci.idEmpresa = pc.idEmpr' +
        'esa and pci.idPedidoCompra = pc.idPedidoCompra'
      
        'left join Estoque.RelacaoEntreProdutos rep on rep.idEmpresa = pc' +
        'i.idEmpresa and rep.idPessoa = pc.idPessoa and rep.idProduto = p' +
        'ci.idProduto'
      
        'left join Estoque.EmpresaContagemProdutos ecp on ecp.idEmpresa =' +
        ' pci.idEmpresa and ecp.idContagem = pc.idContagem and ecp.idProd' +
        'uto = pci.idProduto'
      'inner join Produtos.Produtos p on p.idProduto = pci.idProduto'
      
        'where pci.idEmpresa = :idEmpresa and pci.idPedidoCompra = :idPed' +
        'idoCompra'
      'order by p.Descricao')
    Left = 725
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
        Value = 22
      end
      item
        Name = 'idPedidoCompra'
        DataType = ftInteger
        ParamType = ptInput
        Value = 33
      end>
    object qryPedidoCompraItensidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoCompraItensidPedidoCompra: TIntegerField
      FieldName = 'idPedidoCompra'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidoCompraItensidPedidoCompraItem: TIntegerField
      FieldName = 'idPedidoCompraItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryPedidoCompraItensidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object qryPedidoCompraItensQtdeEstoque: TFloatField
      FieldName = 'QtdeEstoque'
    end
    object qryPedidoCompraItensQtdePedido: TFloatField
      FieldName = 'QtdePedido'
    end
    object qryPedidoCompraItensQtdeUsada: TFloatField
      FieldName = 'QtdeUsada'
    end
    object qryPedidoCompraItensMTC: TFloatField
      FieldName = 'MTC'
    end
    object qryPedidoCompraItensQtdePorTickets: TFloatField
      FieldName = 'QtdePorTickets'
    end
    object qryPedidoCompraItensQtdeSugerida: TFloatField
      FieldName = 'QtdeSugerida'
    end
    object qryPedidoCompraItenscdProduto: TStringField
      FieldName = 'cdProduto'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPedidoCompraItensDescricao: TStringField
      FieldName = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPedidoCompraItensCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPedidoCompraItensqtde: TFloatField
      FieldName = 'qtde'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPedidoCompraItensQtdeNoEstoque: TFloatField
      FieldName = 'QtdeNoEstoque'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsPedidoCompraItens: TDataSource
    DataSet = qryPedidoCompraItens
    Left = 845
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 135
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
      AssignedValues = [svColor]
      Color = clHighlight
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
