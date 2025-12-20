inherited frmNotaVencimentos: TfrmNotaVencimentos
  Caption = 'frmNotaVencimento'
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    ExplicitTop = 105
    ExplicitWidth = 770
    inherited btnOKPadrao: TJvPanel
      Left = 639
      Top = 6
      ExplicitLeft = 639
      ExplicitTop = 6
    end
  end
  inherited pnlFundoPadrao: TPanel
    ExplicitWidth = 770
    ExplicitHeight = 64
    object Label4: TLabel
      Left = 15
      Top = 10
      Width = 93
      Height = 13
      Caption = 'Tipo do vencimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 66
      Width = 33
      Height = 13
      Caption = 'Codigo'
      FocusControl = cxDBTextEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 383
      Top = 66
      Width = 59
      Height = 13
      Caption = 'ValorAPagar'
      FocusControl = cxDBCurrencyEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 726
      Top = 66
      Width = 78
      Height = 13
      Caption = 'DataVencimento'
      FocusControl = cxDBDateEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbTipoVencimento: TMycxDBLookupComboBox
      Left = 8
      Top = 25
      DataBinding.DataField = 'idTipoVencimento'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Properties.KeyFieldNames = 'idTipoPagamento'
      Properties.ListColumns = <
        item
          FieldName = 'Descricao'
        end>
      Properties.ListSource = dmNotas.dsTiposPagamento
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
      TabOrder = 0
      Width = 1009
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 8
      Top = 81
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 353
    end
    object cxDBCurrencyEdit1: TcxDBCurrencyEdit
      Left = 383
      Top = 81
      DataBinding.DataField = 'ValorAPagar'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 322
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 726
      Top = 81
      DataBinding.DataField = 'DataVencimento'
      DataBinding.DataSource = dsCadastro
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 291
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Vencimento da nota'
    ExplicitWidth = 770
  end
  object qryCadastro: TFDQuery
    OnNewRecord = qryCadastroNewRecord
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.NotaVencimentos where 1=0')
    Left = 619
    Top = 2
    object qryCadastroidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidPessoa: TIntegerField
      FieldName = 'idPessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidNota: TIntegerField
      FieldName = 'idNota'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadastroidVencimento: TIntegerField
      FieldName = 'idVencimento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCadastroidTipoVencimento: TIntegerField
      FieldName = 'idTipoVencimento'
    end
    object qryCadastroCodigo: TStringField
      FieldName = 'Codigo'
    end
    object qryCadastroValorAPagar: TCurrencyField
      FieldName = 'ValorAPagar'
    end
    object qryCadastroDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object qryCadastroDataEnvioCentral: TDateTimeField
      FieldName = 'DataEnvioCentral'
    end
    object qryCadastroflEnviadoCentral: TBooleanField
      FieldName = 'flEnviadoCentral'
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 684
    Top = 2
  end
end
