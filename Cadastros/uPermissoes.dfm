inherited frmPermissoes: TfrmPermissoes
  Caption = 'frmPermissoes'
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TJvPanel
      Left = 891
      ExplicitLeft = 891
    end
    object btnMarcarTudo: TJvPanel
      Left = 195
      Top = 5
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'MARCAR TUDO'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnMarcarTudoClick
    end
    object btnDesmarcarTudo: TJvPanel
      Left = 339
      Top = 5
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'DESMARCAR TUDO'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnDesmarcarTudoClick
    end
  end
  inherited pnlFundoPadrao: TPanel
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsPermissoes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Styles.Content = cxStyle1
        Styles.ContentOdd = cxStyle2
        Styles.Header = cxStyle1
        object cxGrid1DBTableView1Descricao: TcxGridDBColumn
          DataBinding.FieldName = 'Descricao'
          Width = 454
        end
        object cxGrid1DBTableView1DescricaoModulo: TcxGridDBColumn
          DataBinding.FieldName = 'DescricaoModulo'
          Width = 430
        end
        object cxGrid1DBTableView1Permitir: TcxGridDBColumn
          DataBinding.FieldName = 'Permitir'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Width = 107
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Permiss'#245'es'
  end
  object qryPermissoes: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select p.*, c.Descricao, m.descricao as DescricaoModulo from Seg' +
        'uranca.Permissoes p '
      'inner join seguranca.controles c on p.idControle = c.idControle'
      'inner join seguranca.Modulos m on c.idModulo=m.idModulo'
      'where p.idEmpresa = :idEmpresa and p.idPessoa = :idPessoa'
      'order by c.Descricao')
    Left = 732
    Top = 65533
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 58
      end
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsPermissoes: TDataSource
    DataSet = qryPermissoes
    Left = 838
    Top = 65533
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13224340
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
