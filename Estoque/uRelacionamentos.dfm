inherited frmRelacionamentos: TfrmRelacionamentos
  Caption = 'Alterar relacionamentos de produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TJvPanel
      Visible = False
    end
    object btnAlterarRelacionamento: TJvPanel
      Left = 361
      Top = 6
      Width = 248
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'Alterar relacionamento'
      Color = 4398052
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnAlterarRelacionamentoClick
    end
  end
  inherited pnlFundoPadrao: TPanel
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 1024
      Height = 99
      Align = alTop
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 0
      object lblUsuario: TLabel
        Left = 16
        Top = 6
        Width = 177
        Height = 23
        Caption = 'Nome do fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
      end
      object btnSelecionaUsuario: TPanel
        Left = 931
        Top = 29
        Width = 65
        Height = 55
        BevelOuter = bvNone
        Caption = '...'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -43
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnSelecionaUsuarioClick
      end
      object Panel2: TPanel
        Left = 16
        Top = 29
        Width = 915
        Height = 55
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object lblNomeFornecedor: TLabel
          Left = 8
          Top = 4
          Width = 901
          Height = 48
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -43
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 99
      Width = 1024
      Height = 563
      Align = alClient
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsProdutos
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid1DBTableView1cprod: TcxGridDBColumn
          Caption = 'C'#243'digo fornecedor'
          DataBinding.FieldName = 'cprod'
          Width = 111
        end
        object cxGrid1DBTableView1xprod: TcxGridDBColumn
          Caption = 'Descri'#231#227'o na nota'
          DataBinding.FieldName = 'xprod'
          Width = 362
        end
        object cxGrid1DBTableView1descricao: TcxGridDBColumn
          Caption = 'Produto relacionado'
          DataBinding.FieldName = 'descricao'
          Width = 391
        end
        object cxGrid1DBTableView1QuantidadeRelacionada: TcxGridDBColumn
          Caption = 'Qtde relacionada'
          DataBinding.FieldName = 'QuantidadeRelacionada'
          Width = 135
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Relacionamentos de produtos'
  end
  object qryProdutos: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select distinct xprod, p.descricao, rep.idProduto, cprod, rep.qt' +
        'de as QuantidadeRelacionada  '
      'FROM            '
      'Contabil.NotaItens AS ni '
      
        'INNER JOIN Contabil.Notas AS n ON ni.idEmpresa = n.idEmpresa AND' +
        ' ni.idNota = n.idNota '
      
        'INNER JOIN Estoque.RelacaoEntreProdutos AS rep ON ni.idEmpresa =' +
        ' rep.idEmpresa AND n.idPessoa = rep.idPessoa AND ni.cProd = rep.' +
        'CodigoFornecedor '
      
        'INNER JOIN Produtos.Produtos AS p ON rep.idProduto = p.idProduto' +
        ' '
      'INNER JOIN Produtos.Unidades AS u ON p.idUnidade = u.idUnidade '
      'INNER JOIN Contabil.Pessoas AS pes ON n.idPessoa = pes.idPessoa'
      'where ni.idPessoa=:idPessoa order by xprod'
      '')
    Left = 409
    Top = 14
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryProdutosxprod: TStringField
      FieldName = 'xprod'
      Origin = 'xprod'
      Size = 120
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 50
    end
    object qryProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'idProduto'
      Required = True
    end
    object qryProdutoscprod: TStringField
      FieldName = 'cprod'
      Origin = 'cprod'
      Size = 50
    end
    object qryProdutosQuantidadeRelacionada: TFloatField
      FieldName = 'QuantidadeRelacionada'
      Origin = 'QuantidadeRelacionada'
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 484
    Top = 14
  end
end
