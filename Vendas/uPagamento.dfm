object frmPagamento: TfrmPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Fechamento de conta'
  ClientHeight = 768
  ClientWidth = 1024
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
  object pnlTotalPagar: TPanel
    Left = 8
    Top = 0
    Width = 1000
    Height = 80
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' TOTAL A PAGAR'
    Color = 13691118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3101544
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object edtTotalPagar: TPanel
      Left = 663
      Top = 2
      Width = 324
      Height = 78
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'R$ 999,99'
      Color = 13691118
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3025336
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlValorPago: TPanel
    Left = 8
    Top = 88
    Width = 1000
    Height = 112
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' VALOR PAGO'
    Color = 13691118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3101544
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      1000
      112)
    object edtValorPago: TPanel
      Left = 662
      Top = 9
      Width = 324
      Height = 103
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'R$ 999,99'
      Color = 13691118
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3971964
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object dbgrdPagamentos: TDBGrid
      Left = 288
      Top = 3
      Width = 401
      Height = 105
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 14938613
      Ctl3D = False
      DataSource = dsContasPagamentos
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = 3101544
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrdPagamentosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlPagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 3971964
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Width = 130
          Visible = True
        end>
    end
  end
  object pnlTroco: TPanel
    Left = 8
    Top = 292
    Width = 1000
    Height = 80
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' TROCO'
    Color = 13691118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3101544
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object edtTroco: TPanel
      Left = 662
      Top = -1
      Width = 324
      Height = 81
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'R$ 999,99'
      Color = 13691118
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10381351
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlValorRestante: TPanel
    Left = 8
    Top = 378
    Width = 1000
    Height = 80
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' VALOR RESTANTE'
    Color = 13691118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3101544
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object edtValorRestante: TPanel
      Left = 663
      Top = -2
      Width = 324
      Height = 82
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'R$ 999,99'
      Color = 13691118
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7499743
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object btnFinalizar: TPanel
    Left = 8
    Top = 703
    Width = 323
    Height = 58
    Caption = 'FINALIZAR'
    Color = 3971964
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14938613
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    OnClick = btnFinalizarClick
  end
  object btnCancelar: TPanel
    Left = 350
    Top = 703
    Width = 323
    Height = 58
    Caption = 'CANCELAR'
    Color = 3025336
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14938613
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnNovoPagamento: TPanel
    Left = 693
    Top = 703
    Width = 315
    Height = 58
    Caption = 'NOVO PAGAMENTO'
    Color = 10381351
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14938613
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
    OnClick = btnNovoPagamentoClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 464
    Width = 1000
    Height = 225
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 13691118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3101544
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 249
      Height = 125
      Alignment = taCenter
      AutoSize = False
      Caption = 'IDENTIFICA'#199#195'O '#13#10'DO '#13#10'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblRazaoSocial: TLabel
      Left = 255
      Top = 55
      Width = 122
      Height = 14
      Caption = 'NOME / RAZ'#195'O SOCIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblEndereco: TLabel
      Left = 255
      Top = 119
      Width = 55
      Height = 14
      Caption = 'ENDERE'#199'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtNome: TEdit
      Left = 255
      Top = 70
      Width = 731
      Height = 43
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14938613
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 60
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object edtEndereco: TEdit
      Left = 255
      Top = 134
      Width = 731
      Height = 45
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14938613
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object rgTipoDocumento: TRadioGroup
      Left = 255
      Top = 0
      Width = 266
      Height = 49
      Caption = 'Selecione o tipo do documento'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Nenhum'
        'CPF'
        'CNPJ')
      ParentFont = False
      TabOrder = 2
      OnClick = rgTipoDocumentoClick
    end
    object edtDocumento: TMaskEdit
      Left = 527
      Top = 0
      Width = 459
      Height = 47
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = ''
      Visible = False
    end
    object chkEmitirDFE: TCheckBox
      Left = 16
      Top = 131
      Width = 121
      Height = 26
      Caption = 'Emitir DFE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object chkEmitirViaCliente: TCheckBox
      Left = 16
      Top = 163
      Width = 209
      Height = 26
      Caption = 'Emitir via do cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object chkEmitirPedido: TCheckBox
      Left = 16
      Top = 195
      Width = 209
      Height = 26
      Caption = 'Emitir pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3101544
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 206
    Width = 1000
    Height = 80
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'DESCONTO'
    Color = 13691118
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3101544
    Font.Height = -43
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
    object edtDesconto: TPanel
      Left = 662
      Top = -6
      Width = 324
      Height = 86
      Alignment = taRightJustify
      BevelOuter = bvNone
      Caption = 'R$ 999,99'
      Color = 13691118
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4227327
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object qryContaPagamentos: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select * from viewContasPagamentos with (NOLOCK) where idEmpresa' +
        ' = :idEmpresa and idCaixa = :idCaixa and idConta = :idConta')
    Left = 432
    Top = 207
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IDCAIXA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1375
      end
      item
        Name = 'IDCONTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 170384
      end>
  end
  object dsContasPagamentos: TDataSource
    DataSet = qryContaPagamentos
    Left = 432
    Top = 251
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 179
    Top = 581
  end
end
