inherited frmPedidoCompraDados: TfrmPedidoCompraDados
  Caption = 'Pedido de compra'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object Label2: TLabel
      Left = 10
      Top = 66
      Width = 51
      Height = 13
      Caption = 'Data inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 197
      Top = 66
      Width = 49
      Height = 13
      Caption = 'Contagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 563
      Top = 66
      Width = 155
      Height = 13
      Caption = 'Quantidade de tickets projetada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 9
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 368
      Top = 66
      Width = 159
      Height = 13
      Caption = 'Quantidade de tickets no per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtFornecedor: TDBLookupComboBox
      Left = 8
      Top = 28
      Width = 1003
      Height = 31
      DataField = 'idPessoa'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'idPessoa'
      ListField = 'NomeFantasia'
      ListSource = dsFornecedores
      ParentFont = False
      TabOrder = 0
    end
    object edtContagem: TDBLookupComboBox
      Left = 192
      Top = 85
      Width = 159
      Height = 31
      DataField = 'idContagem'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'idContagem'
      ListField = 'DataInicio'
      ListSource = dsAuditoriasEstoque
      ParentFont = False
      TabOrder = 1
    end
    object pnlTicketsNoPeriodo: TPanel
      Left = 362
      Top = 85
      Width = 185
      Height = 31
      Color = clYellow
      ParentBackground = False
      TabOrder = 2
    end
    object edtDataInicial: TcxDBDateEdit
      Left = 8
      Top = 85
      DataBinding.DataField = 'DataInicioVendas'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 173
    end
    object edtQtdeTickets: TcxDBCalcEdit
      Left = 565
      Top = 85
      DataBinding.DataField = 'QtdeTickets'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 191
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Pedido de compra'
  end
  object qryCadastro: TFDQuery
    OnNewRecord = qryCadastroNewRecord
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Estoque.PedidosCompra  where 1=0')
    Left = 665
    object qryCadastroidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryCadastroidPedidoCompra: TIntegerField
      FieldName = 'idPedidoCompra'
      Required = True
    end
    object qryCadastroidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object qryCadastroidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Required = True
    end
    object qryCadastroidContagem: TIntegerField
      FieldName = 'idContagem'
      Required = True
    end
    object qryCadastroDataInicioVendas: TDateField
      FieldName = 'DataInicioVendas'
      Required = True
    end
    object qryCadastroDataHora: TDateTimeField
      FieldName = 'DataHora'
      Required = True
    end
    object qryCadastroQtdeTickets: TIntegerField
      FieldName = 'QtdeTickets'
      Required = True
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    OnDataChange = dsCadastroDataChange
    Left = 730
  end
  object qryFornecedores: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select idPessoa, NomeFantasia from Contabil.Pessoas where idPess' +
        'oa in (select idPessoa from Contabil.EmpresaPessoaTipos ept wher' +
        'e ept.idEmpresa = :idEmpresa and ept.idTipoPessoa = 3)'
      'and Not idpessoa in (-1)'
      'order by NomeFantasia')
    Left = 90
    Top = 65531
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dsFornecedores: TDataSource
    DataSet = qryFornecedores
    Left = 195
    Top = 65531
  end
  object dsAuditoriasEstoque: TDataSource
    DataSet = qryAuditoriasEstoque
    Left = 400
  end
  object qryAuditoriasEstoque: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select * from Estoque.EmpresaContagens where idEmpresa = :idEmpr' +
        'esa order by datainicio desc')
    Left = 295
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryAuditoriasEstoqueidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryAuditoriasEstoqueidContagem: TIntegerField
      FieldName = 'idContagem'
      Required = True
    end
    object qryAuditoriasEstoqueidPessoaInicio: TIntegerField
      FieldName = 'idPessoaInicio'
      Required = True
    end
    object qryAuditoriasEstoqueidPessoaFim: TIntegerField
      FieldName = 'idPessoaFim'
    end
    object qryAuditoriasEstoqueDataInicio: TDateTimeField
      FieldName = 'DataInicio'
      Required = True
    end
    object qryAuditoriasEstoqueDataFim: TDateTimeField
      FieldName = 'DataFim'
    end
    object qryAuditoriasEstoqueStatus: TIntegerField
      FieldName = 'Status'
      Required = True
    end
    object qryAuditoriasEstoquePercentualAcerto: TFloatField
      FieldName = 'PercentualAcerto'
    end
    object qryAuditoriasEstoqueDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryAuditoriasEstoqueflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 20
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
