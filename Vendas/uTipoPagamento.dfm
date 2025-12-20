object frmTipoPagamento: TfrmTipoPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Formas de Pagamento'
  ClientHeight = 768
  ClientWidth = 1024
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Teclado: TTouchKeyboard
    Left = 460
    Top = 320
    Width = 536
    Height = 409
    Color = 13690861
    DrawingStyle = dsGradient
    GradientEnd = 13690861
    GradientStart = 887505
    Layout = 'NumPad'
    ParentColor = False
    Visible = False
  end
  object pnlFormasPagamento: TScrollBox
    Left = 426
    Top = 0
    Width = 598
    Height = 768
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object DBImage1: TDBImage
    Left = 876
    Top = 172
    Width = 105
    Height = 105
    DataField = 'Imagem'
    DataSource = dsFormasPagamento
    TabOrder = 2
    Visible = False
  end
  object pnlEsquerda: TPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 768
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object btnCancelar: TPanel
      Left = 8
      Top = 664
      Width = 409
      Height = 85
      Caption = 'CANCELAR'
      Color = 3025336
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14938613
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnColaborador: TPanel
      Left = 8
      Top = 570
      Width = 409
      Height = 85
      Caption = 'COLABORADOR'
      Color = 887505
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14938613
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnColaboradorClick
    end
    object btnConvenio: TPanel
      Left = 8
      Top = 388
      Width = 409
      Height = 85
      Caption = 'CONV'#202'NIO'
      Color = 3971964
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14938613
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnConvenioClick
    end
    object pnlValorRestante: TPanel
      Left = 8
      Top = 260
      Width = 409
      Height = 122
      Color = 13691118
      ParentBackground = False
      TabOrder = 3
      object lblRestanteTroco: TLabel
        Left = 17
        Top = 6
        Width = 94
        Height = 14
        Caption = 'VALOR RESTANTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3101544
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtValorRestante: TEdit
        Left = 17
        Top = 26
        Width = 384
        Height = 85
        Color = 16762508
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edtValorPagamentoKeyPress
      end
    end
    object Panel1: TPanel
      Left = 8
      Top = 129
      Width = 409
      Height = 123
      Color = 13691118
      ParentBackground = False
      TabOrder = 4
      object Label3: TLabel
        Left = 17
        Top = 6
        Width = 58
        Height = 14
        Caption = 'DESCONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3101544
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtValorDesconto: TEdit
        Left = 17
        Top = 26
        Width = 384
        Height = 85
        Color = 12040191
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtValorDescontoChange
        OnKeyPress = edtValorPagamentoKeyPress
      end
    end
    object pnlValorPagamento: TPanel
      Left = 8
      Top = 0
      Width = 409
      Height = 123
      Color = 13691118
      ParentBackground = False
      TabOrder = 5
      object Label1: TLabel
        Left = 17
        Top = 6
        Width = 174
        Height = 14
        Caption = 'DIGITE O VALOR DO PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3101544
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtValorPagamento: TEdit
        Left = 17
        Top = 26
        Width = 384
        Height = 85
        Color = 13882281
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtValorPagamentoChange
        OnKeyPress = edtValorPagamentoKeyPress
        OnMouseDown = edtValorPagamentoMouseDown
      end
    end
    object btnCortesia: TPanel
      Left = 8
      Top = 479
      Width = 409
      Height = 85
      Caption = 'CORTESIA'
      Color = 16744448
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14938613
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = btnCortesiaClick
    end
  end
  object qryFormasPagamento: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select eefp.idFormaPagamento, fp.idTipoPagamento, fp.Descricao, ' +
        'fp.EmitirValeTroco, fp.Imagem, fp.Ordem, tp.TEF, tp.TIPOTRANSACA' +
        'O, ra.DESCRICAO as DescricaoRedeAdquirente, fp.EntraNaVenda'
      'from Vendas.EmpresaEstacaoFormasPagamento eefp'
      
        'inner join Vendas.EmpresaFormasPagamento efp on eefp.idEmpresa =' +
        ' efp.idEmpresa and eefp.idFormaPagamento = efp.idFormaPagamento'
      
        'inner join Contabil.FormasPagamento fp on eefp.idFormaPagamento ' +
        '= fp.idFormaPagamento'
      
        'inner join Contabil.TiposPagamento tp on fp.idTipoPagamento = tp' +
        '.idTipoPagamento'
      
        'left join Contabil.FormaPagamentoRedeAdquirente fpra on fpra.IDF' +
        'ORMAPAGAMENTO = eefp.idFormaPagamento'
      
        'left join Contabil.RedesAdquirentes ra on ra.IDREDEADQUIRENTE = ' +
        'fpra.IDREDEADQUIRENTE'
      
        'where eefp.idEmpresa = :idEmpresa and eefp.idEstacao = :idEstaca' +
        'o and fp.Ativa = 1 and efp.Ativa = 1 and fp.ExibirFormaPagamento' +
        ' = 1'
      'Order by Ordem')
    Left = 790
    Top = 50
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IDESTACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsFormasPagamento: TDataSource
    DataSet = qryFormasPagamento
    Left = 790
    Top = 100
  end
  object qryPessoas: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'with ConvenioColaboradores as'
      
        '(select ep.idPessoa, tp.Descricao, ept.idTipoPessoa from Contabi' +
        'l.EmpresaPessoas ep  '
      
        'inner join Contabil.EmpresaPessoaTipos ept on ept.idEmpresa = ep' +
        '.idEmpresa and ept.idPessoa = ep.idPessoa and ept.idTipoPessoa i' +
        'n (2,7) '
      
        'inner join Contabil.TiposPessoa tp on ept.idTipoPessoa = tp.idTi' +
        'poPessoa'
      'where ep.idEmpresa = :idEmpresa)'
      ''
      
        'select cc.idPessoa, p.RazaoSocial, p.CNPJ, idTipoPessoa, Descric' +
        'ao  from ConvenioColaboradores cc '
      'inner join Contabil.Pessoas p on cc.idPessoa = p.idPessoa')
    Left = 475
    Top = 425
    ParamData = <
      item
        Name = 'idEmpresa'
      end>
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'idFormaPagamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField1: TStringField
      FieldName = 'Descricao'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'idTipoPagamento'
      Required = True
    end
    object BooleanField1: TBooleanField
      FieldName = 'Ativa'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Ordem'
      Required = True
    end
    object BlobField1: TBlobField
      FieldName = 'Imagem'
    end
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 475
    Top = 475
  end
end
