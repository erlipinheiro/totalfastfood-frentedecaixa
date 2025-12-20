object frmConsultaVenda: TfrmConsultaVenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Consulta venda'
  ClientHeight = 632
  ClientWidth = 1036
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 632
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -487
    ExplicitHeight = 729
    object pnlItens: TScrollBox
      Left = 0
      Top = 82
      Width = 389
      Height = 436
      HorzScrollBar.Visible = False
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 11388366
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Visible = False
      ExplicitHeight = 485
    end
    object pnlTotal: TPanel
      Left = 0
      Top = 559
      Width = 389
      Height = 73
      Align = alBottom
      BevelOuter = bvNone
      Color = 11388366
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 520
      object lblValorTotal: TLabel
        Left = 203
        Top = 24
        Width = 181
        Height = 40
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2828473
        Font.Height = -45
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object btnVoltar: TImage
        AlignWithMargins = True
        Left = 1
        Top = 0
        Width = 65
        Height = 65
        Center = True
        Picture.Data = {
          0A544A504547496D6167659D040000FFD8FFE000104A46494600010101006000
          600000FFDB004300020101020101020202020202020203050303030303060404
          0305070607070706070708090B0908080A0807070A0D0A0A0B0C0C0C0C07090E
          0F0D0C0E0B0C0C0CFFDB004301020202030303060303060C0807080C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080020002003012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FCFB
          AF56F80DFB13FC4CFDA4AC4DEF857C337373A5AB143A85C4896B6A48E0857908
          DE41E084DC477ACEFD92FE0E45F1FF00F68FF08F846E59D6CF57BE02ECA1C318
          235696500F62634600F626BF4AFF006E9FDB9F41FD893C016FE0FF00085BD837
          8B5AD161D3EC2141F67D120C612591471D3EE277EA78EBF9651A31945CE6F447
          D9D6AB28C9420B567E797C71FD81FE2AFECF5A23EABE22F0BCDFD9117FACBFB2
          992EE087DDCC64941EEE00E7AD78E57EBC7FC131ECFE296BFF0002EFAF3E28DD
          9D4B4AD7E4371A4C1A9A192F9E1977191A52DC792FBB288C33827A29515F9E1F
          F0504F81163FB3B7ED53E23D03494F2B4698C7A858443FE58453287F2C7B23EF
          51ECA29D6A0A305523B3151AEE537096EBB1CAFECB5F1907ECFDFB427853C60F
          1BCB6FA35F07B944FBED03A98E50BFED796EF8F7C57E9EFED91FB1B7857F6FCF
          85565E28F0BDEE9E3C482D04DA3EB109CC3A84479104C472509CE0E3746D9E3E
          F29FC846528C4104107041ED5E85F05BF6AEF889FB3C2491F83FC57A968F6F2B
          6F7B51B27B666FEF7932AB47BBDF6E6951ACA29C26AE98EB51726A707668FD32
          FF00826AE8DF13BE11FC07D52D7E2BBC3A4E87A13B2694351940BAB2B78B7097
          CC7CED16E368F2C93D0120ECD95F9D7FB787C7DB5FDA4BF69FF11F8934D2C747
          DC965A7332E0C9042A104983C8DE433807901C03D2B33E337ED97F13BF681D37
          EC3E2CF17EA5A969F90C6CD163B5B6723905A38551188EC581C5798D3AD5D4A2
          A11D90A8D07193A92DD9FFD9}
        OnClick = btnVoltarClick
      end
      object Label1: TLabel
        Left = 185
        Top = 0
        Width = 45
        Height = 25
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'R$'
        Color = 11388366
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2828473
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pnlMesaCartao: TPanel
      Left = 0
      Top = 0
      Width = 389
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label4: TLabel
        Left = 9
        Top = 2
        Width = 96
        Height = 13
        Caption = 'Senha/Mesa/Cartao'
      end
      object pnlEditSenha: TPanel
        Left = 2
        Top = 16
        Width = 114
        Height = 65
        BevelOuter = bvNone
        TabOrder = 0
        object edtSenha: TEdit
          Left = 5
          Top = 1
          Width = 104
          Height = 59
          Alignment = taRightJustify
          BorderStyle = bsNone
          Color = 14120744
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -51
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '999'
        end
      end
    end
    object pnlPromocao: TPanel
      Left = 0
      Top = 518
      Width = 389
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = clGreen
      ParentBackground = False
      TabOrder = 3
      Visible = False
      ExplicitTop = 567
      object lblDescricaoPromocao: TLabel
        Left = 3
        Top = 0
        Width = 329
        Height = 38
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object btnExcluirPromocao: TPanel
        Left = 336
        Top = 2
        Width = 48
        Height = 37
        BevelOuter = bvNone
        Caption = 'X'
        Color = clGray
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 389
    Top = 0
    Width = 647
    Height = 632
    Align = alClient
    DataSource = dsPagamentos
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idContaPagamento'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataHora'
        Title.Caption = 'Data e hora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoTipoPagamento'
        Title.Caption = 'Tipo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlPagamento'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlDesconto'
        Title.Caption = 'Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlTroco'
        Title.Caption = 'Troco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlTotalPagamento'
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  object dsPagamentos: TDataSource
    DataSet = qryPagamentos
    Left = 504
    Top = 304
  end
  object qryPagamentos: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select * from viewContasPagamentos where idEmpresa = :idEmpresa ' +
        'and idCaixa = :idCaixa and idConta = :idConta')
    Left = 504
    Top = 264
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
    object qryPagamentosidContaPagamento: TIntegerField
      FieldName = 'idContaPagamento'
      Origin = 'idContaPagamento'
      Required = True
    end
    object qryPagamentosDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
    end
    object qryPagamentosvlPagamento: TCurrencyField
      FieldName = 'vlPagamento'
      Origin = 'vlPagamento'
    end
    object qryPagamentosDescricaoTipoPagamento: TStringField
      FieldName = 'DescricaoTipoPagamento'
      Origin = 'DescricaoTipoPagamento'
      Required = True
      Size = 50
    end
    object qryPagamentosvlDesconto: TCurrencyField
      FieldName = 'vlDesconto'
      Origin = 'vlDesconto'
    end
    object qryPagamentosvlTotalPagamento: TCurrencyField
      FieldName = 'vlTotalPagamento'
      Origin = 'vlTotalPagamento'
    end
    object qryPagamentosvlTroco: TCurrencyField
      FieldName = 'vlTroco'
      Origin = 'vlTroco'
    end
    object qryPagamentosDataHora: TDateTimeField
      FieldName = 'DataHora'
      Origin = 'DataHora'
    end
  end
end
