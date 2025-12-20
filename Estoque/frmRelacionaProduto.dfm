inherited fRelacionaProduto: TfRelacionaProduto
  Caption = 'Relaciona produto'
  ClientHeight = 654
  ExplicitHeight = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 654
    ExplicitHeight = 654
    inherited pnlTitulo: TPanel
      Caption = 'Relaciona produto'
      ExplicitWidth = 764
      inherited Image1: TImage
        Left = 627
        ExplicitLeft = 627
      end
    end
    inherited pnlBotoes: TPanel
      Top = 585
      ExplicitTop = 585
      ExplicitWidth = 764
      object Label3: TLabel [0]
        Left = 339
        Top = 25
        Width = 115
        Height = 13
        Caption = 'Quantidade a relacionar'
      end
      inherited btnCancelar: TButton
        Left = 10
        ExplicitLeft = 10
      end
      inherited btnOK: TButton
        Caption = 'Relacionar'
        OnClick = btnOKClick
      end
      object edtQuantidade: TEdit
        Left = 460
        Top = 1
        Width = 186
        Height = 60
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Button1: TButton
        Left = 106
        Top = 8
        Width = 167
        Height = 50
        Caption = 'Cadastrar novo produto'
        ModalResult = 2
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object Panel1: TPanel
      Left = 7
      Top = 54
      Width = 754
      Height = 76
      Color = 10672889
      ParentBackground = False
      TabOrder = 2
      object Label1: TLabel
        Left = 15
        Top = 11
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 206
        Top = 10
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object pnlCodigo: TPanel
        Left = 10
        Top = 30
        Width = 185
        Height = 41
        Alignment = taRightJustify
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object pnlDescricao: TPanel
        Left = 201
        Top = 29
        Width = 545
        Height = 41
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
  object qryProdutos: TFDQuery
    Connection = dmPrincipal.conTotalFastFood
    SQL.Strings = (
      
        'select idEmpresa, idProduto, cdProduto, Descricao, CodigoBarras,' +
        ' DescricaoGrupo, DescricaoSubGrupo, DescricaoLinhaProduto, '
      
        'DescricaoProdutoTipos, DescricaoPlanoContas, Sigla, NCM, Control' +
        'aEstoque from viewProdutos where '
      
        'idProduto in (select idProduto from Produtos.ProdutoTipos where ' +
        'idTipo in (2,3,4))'
      'and  idEmpresa = :idEmpresa'
      'order by descricao')
    Left = 409
    Top = 14
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryProdutosidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
      ReadOnly = True
      Required = True
    end
    object qryProdutoscdProduto: TStringField
      FieldName = 'cdProduto'
      ReadOnly = True
      Required = True
    end
    object qryProdutosDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qryProdutosCodigoBarras: TStringField
      FieldName = 'CodigoBarras'
      ReadOnly = True
      Size = 30
    end
    object qryProdutosDescricaoGrupo: TStringField
      FieldName = 'DescricaoGrupo'
      ReadOnly = True
      Size = 50
    end
    object qryProdutosDescricaoSubGrupo: TStringField
      FieldName = 'DescricaoSubGrupo'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qryProdutosDescricaoLinhaProduto: TStringField
      FieldName = 'DescricaoLinhaProduto'
      ReadOnly = True
      Size = 50
    end
    object qryProdutosDescricaoProdutoTipos: TStringField
      FieldName = 'DescricaoProdutoTipos'
      ReadOnly = True
      Size = 255
    end
    object qryProdutosDescricaoPlanoContas: TStringField
      FieldName = 'DescricaoPlanoContas'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qryProdutosSigla: TStringField
      FieldName = 'Sigla'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryProdutosNCM: TStringField
      FieldName = 'NCM'
      ReadOnly = True
      Size = 30
    end
    object qryProdutosControlaEstoque: TBooleanField
      FieldName = 'ControlaEstoque'
      ReadOnly = True
      Required = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 484
    Top = 14
  end
end
