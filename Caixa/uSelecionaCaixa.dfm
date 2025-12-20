inherited frmSelecionaCaixa: TfrmSelecionaCaixa
  Caption = 'Seleciona Caixa'
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object dbgridCaixas: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      object dbgridCaixasDBTableView1: TcxGridDBTableView
        OnDblClick = dbgridCaixasDBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsCaixas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        object dbgridCaixasDBTableView1idCaixa: TcxGridDBColumn
          DataBinding.FieldName = 'idCaixa'
        end
        object dbgridCaixasDBTableView1dhAbertura: TcxGridDBColumn
          DataBinding.FieldName = 'dhAbertura'
        end
        object dbgridCaixasDBTableView1dhFechamento: TcxGridDBColumn
          DataBinding.FieldName = 'dhFechamento'
        end
        object dbgridCaixasDBTableView1UsuarioAbertura: TcxGridDBColumn
          DataBinding.FieldName = 'UsuarioAbertura'
          Width = 237
        end
        object dbgridCaixasDBTableView1UsuarioFechamento: TcxGridDBColumn
          DataBinding.FieldName = 'UsuarioFechamento'
          Width = 198
        end
        object dbgridCaixasDBTableView1vlTotalVenda: TcxGridDBColumn
          DataBinding.FieldName = 'vlTotalVenda'
          Width = 98
        end
        object dbgridCaixasDBTableView1vlInicio: TcxGridDBColumn
          DataBinding.FieldName = 'vlInicio'
          Width = 80
        end
        object dbgridCaixasDBTableView1vlDeposito: TcxGridDBColumn
          DataBinding.FieldName = 'vlDeposito'
        end
        object dbgridCaixasDBTableView1vlTroco: TcxGridDBColumn
          DataBinding.FieldName = 'vlTroco'
        end
      end
      object dbgridCaixasLevel1: TcxGridLevel
        GridView = dbgridCaixasDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Seleciona Caixa'
  end
  object dsCaixas: TDataSource
    DataSet = qryCaixas
    Left = 765
    Top = 5
  end
  object qryCaixas: TFDQuery
    CachedUpdates = True
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select c.*, pa.NomeFantasia as UsuarioAbertura, pf.NomeFantasia ' +
        'as UsuarioFechamento from vendas.caixas c'
      
        'left join Contabil.Pessoas pa on c.idUsuarioAbertura = pa.idPess' +
        'oa'
      
        'left join Contabil.Pessoas pf on c.idUsuarioAbertura = pf.idPess' +
        'oa'
      'where (c.idEmpresa = :idEmpresa)'
      ' and (not (dhFechamento is null))'
      'order by c.dhAbertura desc')
    Left = 705
    Top = 5
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object qryCaixasidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryCaixasidCaixa: TIntegerField
      FieldName = 'idCaixa'
      Required = True
    end
    object qryCaixasidUsuarioAbertura: TIntegerField
      FieldName = 'idUsuarioAbertura'
      Required = True
    end
    object qryCaixasidUsuarioFechamento: TIntegerField
      FieldName = 'idUsuarioFechamento'
    end
    object qryCaixasidListaPreco: TIntegerField
      FieldName = 'idListaPreco'
      Required = True
    end
    object qryCaixasdhAbertura: TDateTimeField
      FieldName = 'dhAbertura'
      Required = True
    end
    object qryCaixasdhFechamento: TDateTimeField
      FieldName = 'dhFechamento'
    end
    object qryCaixasvlTotalVenda: TCurrencyField
      FieldName = 'vlTotalVenda'
    end
    object qryCaixasvlInicio: TCurrencyField
      FieldName = 'vlInicio'
    end
    object qryCaixasvlDeposito: TCurrencyField
      FieldName = 'vlDeposito'
    end
    object qryCaixasvlTroco: TCurrencyField
      FieldName = 'vlTroco'
    end
    object qryCaixasDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryCaixasflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
    object qryCaixasUsuarioAbertura: TStringField
      FieldName = 'UsuarioAbertura'
      ReadOnly = True
      Size = 50
    end
    object qryCaixasUsuarioFechamento: TStringField
      FieldName = 'UsuarioFechamento'
      ReadOnly = True
      Size = 50
    end
  end
end
