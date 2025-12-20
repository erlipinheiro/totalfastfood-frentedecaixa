object dmNotas: TdmNotas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 442
  Width = 933
  object qryPessoas: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select idPessoa, RazaoSocial, NomeFantasia from Contabil.Pessoas' +
        ' '
      
        'WHERE exists (select 1 from contabil.EmpresaPessoas where idEmpr' +
        'esa = :idEmpresa  and idpessoa = contabil.pessoas.idPessoa)'
      'order by RazaoSocial')
    Left = 45
    Top = 15
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPessoasidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object qryPessoasRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object qryPessoasNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 45
    Top = 60
  end
  object qryTiposNota: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.TiposNota order by descricao')
    Left = 300
    Top = 15
    object qryTiposNotaidTipoNota: TIntegerField
      FieldName = 'idTipoNota'
      Required = True
    end
    object qryTiposNotaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object dsTiposNota: TDataSource
    DataSet = qryTiposNota
    Left = 300
    Top = 60
  end
  object qryTiposPagamento: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.TiposPagamento order by descricao')
    Left = 410
    Top = 15
    object qryTiposPagamentoidTipoPagamento: TIntegerField
      FieldName = 'idTipoPagamento'
      Required = True
    end
    object qryTiposPagamentoDescricao: TStringField
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
    object qryTiposPagamentoIndiceECF: TStringField
      FieldName = 'IndiceECF'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object dsTiposPagamento: TDataSource
    DataSet = qryTiposPagamento
    Left = 410
    Top = 60
  end
  object qryItens: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.NotaItens'
      'where idEmpresa = :idEmpresa and idNota = :idNota')
    Left = 120
    Top = 15
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 58
      end
      item
        Name = 'IDNOTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2828
      end>
    object qryItensidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensidPessoa: TIntegerField
      FieldName = 'idPessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensidNota: TIntegerField
      FieldName = 'idNota'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItensidItem: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'idItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryItensidItemNFE: TIntegerField
      FieldName = 'idItemNFE'
    end
    object qryItenscProd: TStringField
      FieldName = 'cProd'
      Size = 50
    end
    object qryItensnItem: TIntegerField
      FieldName = 'nItem'
    end
    object qryItenscEAN: TStringField
      FieldName = 'cEAN'
    end
    object qryItensxProd: TStringField
      FieldName = 'xProd'
      Size = 120
    end
    object qryItensNCM: TStringField
      FieldName = 'NCM'
    end
    object qryItensCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryItensuCom: TStringField
      FieldName = 'uCom'
      Size = 10
    end
    object qryItensqCom: TFloatField
      FieldName = 'qCom'
    end
    object qryItensvunCom: TCurrencyField
      FieldName = 'vunCom'
    end
    object qryItensvProd: TCurrencyField
      FieldName = 'vProd'
    end
    object qryItenscEANTrib: TStringField
      FieldName = 'cEANTrib'
    end
    object qryItensuTrib: TStringField
      FieldName = 'uTrib'
      Size = 10
    end
    object qryItensqTrib: TFloatField
      FieldName = 'qTrib'
    end
    object qryItensvunTrib: TCurrencyField
      FieldName = 'vunTrib'
    end
    object qryItensvFrete: TCurrencyField
      FieldName = 'vFrete'
    end
    object qryItensvSeg: TCurrencyField
      FieldName = 'vSeg'
    end
    object qryItensvDesc: TCurrencyField
      FieldName = 'vDesc'
    end
    object qryItensvOutro: TCurrencyField
      FieldName = 'vOutro'
    end
    object qryItensIndTot: TIntegerField
      FieldName = 'IndTot'
    end
    object qryItensxPed: TStringField
      FieldName = 'xPed'
    end
    object qryItensnItemPed: TIntegerField
      FieldName = 'nItemPed'
    end
    object qryItensDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryItensflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
  end
  object dsItens: TDataSource
    DataSet = qryItens
    Left = 120
    Top = 60
  end
  object qryVencimentos: TFDQuery
    MasterFields = 'idEmpresa;idNota'
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.NotaVencimentos'
      'where idEmpresa = :idEmpresa and idNota = :idNota')
    Left = 210
    Top = 15
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDNOTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVencimentosidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVencimentosidPessoa: TIntegerField
      FieldName = 'idPessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVencimentosidNota: TIntegerField
      FieldName = 'idNota'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVencimentosidVencimento: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'idVencimento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryVencimentosidTipoVencimento: TIntegerField
      FieldName = 'idTipoVencimento'
    end
    object qryVencimentosCodigo: TStringField
      FieldName = 'Codigo'
    end
    object strngfldVencimentosDescricaoFormaPagamento: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoFormaPagamento'
      LookupDataSet = qryFormasPagamento
      LookupKeyFields = 'idFormaPagamento'
      LookupResultField = 'Descricao'
      KeyFields = 'idTipoVencimento'
      Size = 50
      Lookup = True
    end
    object qryVencimentosValorAPagar: TCurrencyField
      FieldName = 'ValorAPagar'
    end
    object qryVencimentosDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object qryVencimentosDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryVencimentosflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
  end
  object dsVencimentos: TDataSource
    DataSet = qryVencimentos
    Left = 210
    Top = 60
  end
  object qryPessoaProdutos: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select cProd, xProd from Contabil.NotaItens ni where idPessoa = ' +
        ':idPessoa and cProd = :Codigo')
    Left = 515
    Top = 15
    ParamData = <
      item
        Name = 'idPessoa'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Codigo'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryFormasPagamento: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.FormasPagamento order by descricao')
    Left = 638
    Top = 12
  end
  object dsFormasPagamento: TDataSource
    DataSet = qryFormasPagamento
    Left = 634
    Top = 60
  end
end
