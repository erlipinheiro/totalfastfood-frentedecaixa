object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 539
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 884
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnVoltar: TImage
      AlignWithMargins = True
      Left = 4
      Top = 2
      Width = 65
      Height = 45
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
    object btnEnviar: TButton
      Left = 288
      Top = 3
      Width = 129
      Height = 35
      Caption = 'Enviar'
      TabOrder = 0
      OnClick = btnEnviarClick
    end
    object Button3: TButton
      Left = 423
      Top = 3
      Width = 129
      Height = 35
      Caption = 'Consultar'
      TabOrder = 1
    end
    object Button4: TButton
      Left = 558
      Top = 3
      Width = 129
      Height = 35
      Caption = 'Imprimir'
      TabOrder = 2
    end
    object Button5: TButton
      Left = 693
      Top = 3
      Width = 129
      Height = 35
      Caption = 'Cancelar'
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 884
    Height = 423
    Align = alClient
    DataSource = dsNFCes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Data inicial'
    end
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 46
      Height = 13
      Caption = 'Data final'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 112
      Top = 8
      Width = 89
      Height = 21
      Date = 43132.657409155090000000
      Time = 43132.657409155090000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 112
      Top = 35
      Width = 89
      Height = 21
      Date = 43132.657409155090000000
      Time = 43132.657409155090000000
      TabOrder = 1
    end
    object Button1: TButton
      Left = 248
      Top = 8
      Width = 129
      Height = 48
      Caption = 'Pesquisar'
      TabOrder = 2
    end
  end
  object qryNFCes: TFDQuery
    Active = True
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select c.idEmpresa, c.idCaixa, c.idConta, c.Datafim, '
      
        'c.Valor - case when valordesconto is null then 0 else ValorDesco' +
        'nto end as Valor, '
      
        'NumeroNFE, SituacaoNFE, ProtocoloNFE, DataHoraAutorizacaoNFE, cS' +
        'tat, NFE from Vendas.Contas c '
      
        'inner join Vendas.Caixas ca on c.idEmpresa = ca.idEmpresa and c.' +
        'idCaixa = ca.idCaixa'
      
        'where c.idEmpresa = :idEmpresa and idConvenio <> -1 and ca.dhAbe' +
        'rtura >= :DataInicial and ca.dhAbertura < :DataFinal'
      'order by NumeroNFE')
    Left = 592
    Top = 248
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 20
      end
      item
        Name = 'DATAINICIAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 43132d
      end
      item
        Name = 'DATAFINAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 43133d
      end>
  end
  object dsNFCes: TDataSource
    DataSet = qryNFCes
    Left = 592
    Top = 296
  end
end
