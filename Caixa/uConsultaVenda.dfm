inherited frmConsultaVenda: TfrmConsultaVenda
  Caption = 'frmConsultaVenda'
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    Top = 704
    Height = 64
    ExplicitTop = 704
    ExplicitHeight = 64
    inherited btnOKPadrao: TJvPanel
      Enabled = False
      Visible = False
    end
    object JvPanel1: TJvPanel
      Left = 87
      Top = 5
      Width = 330
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'EMITIR CUPOM FISCAL'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -29
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnOKPadraoClick
    end
  end
  inherited pnlFundoPadrao: TPanel
    Height = 663
    ParentFont = False
    ExplicitHeight = 663
    object Panel1: TPanel
      Left = 8
      Top = 14
      Width = 1009
      Height = 43
      BevelOuter = bvNone
      Color = 13690861
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 64
        Height = 25
        Caption = 'Data  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 231
        Top = 8
        Width = 224
        Height = 25
        Caption = 'Mesa / Senha / Cart'#227'o :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 567
        Top = 8
        Width = 219
        Height = 25
        Caption = 'N'#250'mero cupom fiscal : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlData: TPanel
        Left = 78
        Top = 5
        Width = 147
        Height = 33
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlData'
        Color = 15792377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object pnlMesaSenhaCartao: TPanel
        Left = 461
        Top = 5
        Width = 100
        Height = 33
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlData'
        Color = 15792377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object pnlCupomFiscal: TPanel
        Left = 784
        Top = 2
        Width = 217
        Height = 33
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnlCupomFiscal'
        Color = 15792377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object pnlPagamentos: TPanel
      Left = 432
      Top = 72
      Width = 585
      Height = 577
      BevelOuter = bvNone
      Color = 13690861
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 8
        Top = 8
        Width = 569
        Height = 561
        DataSource = dsContaPagamentos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlPagamento'
            Title.Caption = 'Valor do pagamento'
            Width = 178
            Visible = True
          end>
      end
    end
    object pnlItens: TScrollBox
      Left = 8
      Top = 72
      Width = 409
      Height = 577
      HorzScrollBar.Visible = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 11388366
      Ctl3D = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Consulta venda'
  end
  object dsContaPagamentos: TDataSource
    DataSet = qryContaPagamentos
    Left = 796
    Top = 61
  end
  object qryContaPagamentos: TFDQuery
    MasterFields = 'idEmpresa;idCaixa;idConta'
    DetailFields = 'idEmpresa;idCaixa;idConta'
    Connection = dmCaixa.dbTotalFastFood
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select cp.idEmpresa, cp.idCaixa, cp.idSessaoCaixa, cp.idConta, f' +
        'p.Descricao, cp.vlPagamento from Vendas.ContaPagamentos cp '
      
        'inner join Contabil.FormasPagamento fp on cp.idFormaPagamento = ' +
        'fp.idFormaPagamento '
      
        'where cp.idEmpresa = :idEmpresa and cp.idCaixa = :idCaixa and cp' +
        '.idConta = :idConta')
    Left = 796
    Top = 16
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDCAIXA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDCONTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryContaPagamentosDescricao: TStringField
      DisplayWidth = 56
      FieldName = 'Descricao'
      ReadOnly = True
      Required = True
    end
    object qryContaPagamentosvlPagamento: TCurrencyField
      DisplayWidth = 24
      FieldName = 'vlPagamento'
    end
  end
end
