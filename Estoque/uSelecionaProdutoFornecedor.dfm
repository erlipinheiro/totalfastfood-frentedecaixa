inherited frmSelecionaProdutoFornecedor: TfrmSelecionaProdutoFornecedor
  Caption = 'frmSelecionaProdutoFornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object dbgridProdutosFornecedores: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      ExplicitTop = -1
      object dbgridProdutosFornecedoresDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsProdutosFornecedores
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        object dbgridProdutosFornecedoresDBTableView1cProd: TcxGridDBColumn
          DataBinding.FieldName = 'cProd'
        end
        object dbgridProdutosFornecedoresDBTableView1xProd: TcxGridDBColumn
          DataBinding.FieldName = 'xProd'
        end
      end
      object dbgridProdutosFornecedoresLevel1: TcxGridLevel
        GridView = dbgridProdutosFornecedoresDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Selecione um produto do fornecedor'
  end
  object qryProdutosFornecedores: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'with ProdutosFornecedores as'
      '('
      'select ni.* from Contabil.NotaItens ni'
      
        'inner join Contabil.Notas n on n.idEmpresa = ni.idEmpresa and n.' +
        'idPessoa = ni.idPessoa and n.idNota = ni.idNota'
      'where n.idEmpresa = :idEmpresa and n.idPessoa = :idPessoa'
      ')'
      ''
      'select cProd, xProd, 1 from ProdutosFornecedores'
      'group by cProd, xProd'
      'order by xProd')
    Left = 705
    Top = 5
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'idPessoa'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryProdutosFornecedorescProd: TStringField
      FieldName = 'cProd'
      Size = 50
    end
    object qryProdutosFornecedoresxProd: TStringField
      FieldName = 'xProd'
      Size = 120
    end
  end
  object dsProdutosFornecedores: TDataSource
    DataSet = qryProdutosFornecedores
    Left = 840
    Top = 5
  end
end
