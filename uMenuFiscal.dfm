inherited frmMenuFiscal: TfrmMenuFiscal
  ActiveControl = Panel3
  Caption = 'frmMenuFiscal'
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TPanel
      Enabled = False
      Visible = False
    end
  end
  inherited pnlFundoPadrao: TPanel
    object wzRelatorioMenuFiscal: TJvWizard
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      ActivePage = tsEscolhaRelatorio
      ButtonBarHeight = 42
      ButtonStart.Caption = 'To &Start Page'
      ButtonStart.NumGlyphs = 1
      ButtonStart.Width = 85
      ButtonLast.Caption = 'To &Last Page'
      ButtonLast.NumGlyphs = 1
      ButtonLast.Width = 85
      ButtonBack.Caption = '< &Voltar'
      ButtonBack.NumGlyphs = 1
      ButtonBack.Width = 75
      ButtonNext.Caption = '&Pr'#243'ximo >'
      ButtonNext.NumGlyphs = 1
      ButtonNext.Width = 75
      ButtonFinish.Caption = '&Executar'
      ButtonFinish.NumGlyphs = 1
      ButtonFinish.Width = 75
      ButtonCancel.Caption = 'Cancel'
      ButtonCancel.NumGlyphs = 1
      ButtonCancel.ModalResult = 2
      ButtonCancel.Width = 75
      ButtonHelp.Caption = '&Help'
      ButtonHelp.NumGlyphs = 1
      ButtonHelp.Width = 75
      ShowRouteMap = False
      OnFinishButtonClick = wzRelatorioMenuFiscalFinishButtonClick
      OnActivePageChanged = wzRelatorioMenuFiscalActivePageChanged
      Color = clWhite
      DesignSize = (
        1024
        662)
      object tsEscolhaRelatorio: TJvWizardInteriorPage
        Header.Title.Color = clNone
        Header.Title.Text = 'Escolha a fun'#231#227'o do ECF que deseja executar.'
        Header.Title.Anchors = [akLeft, akTop, akRight]
        Header.Title.Font.Charset = DEFAULT_CHARSET
        Header.Title.Font.Color = clWindowText
        Header.Title.Font.Height = -16
        Header.Title.Font.Name = 'Tahoma'
        Header.Title.Font.Style = [fsBold]
        Header.Subtitle.Color = clNone
        Header.Subtitle.Visible = False
        Header.Subtitle.Text = 'Subtitle'
        Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
        Header.Subtitle.Font.Charset = DEFAULT_CHARSET
        Header.Subtitle.Font.Color = clWindowText
        Header.Subtitle.Font.Height = -11
        Header.Subtitle.Font.Name = 'Tahoma'
        Header.Subtitle.Font.Style = []
        EnabledButtons = [bkBack, bkNext]
        Caption = 'tsEscolhaRelatorio'
        object Panel3: TPanel
          Left = 0
          Top = 70
          Width = 1024
          Height = 550
          Align = alClient
          BevelOuter = bvNone
          Caption = 'CCCCCCCCCCCCCCobject btnConsultarProdutos: TPanel'
          Color = 9803052
          ParentBackground = False
          TabOrder = 0
          object btnLeituraX: TPanel
            Left = 43
            Top = 36
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'LX - LEITURA X'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = btnLeituraXClick
          end
          object btnEspelhoMFD: TPanel
            Left = 675
            Top = 36
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'ESPELHO MFD - MEM'#211'RIA FITA DETALHE'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            OnClick = btnEspelhoMFDClick
          end
          object btnLMFC: TPanel
            Left = 43
            Top = 126
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'LMFC - LEITURA DA MEM'#211'RIA FISCAL COMPLETA'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            OnClick = btnLMFCClick
          end
          object btnConsultarProdutos: TPanel
            Left = 43
            Top = 303
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'ARQUIVO MF - MEM'#211'RIA FISCAL'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 3
            OnClick = btnConsultarProdutosClick
          end
          object btnLMFS: TPanel
            Left = 43
            Top = 216
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'LMFC - LEITURA DA MEM'#211'RIA FISCAL SIMPLIFICADA'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 4
            OnClick = btnLMFSClick
          end
          object btnArquivoMFD: TPanel
            Left = 675
            Top = 126
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'ARQUIVO MFD - MEM'#211'RIA FITA DETALHE'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 5
            OnClick = btnArquivoMFDClick
          end
          object btnCAT52: TPanel
            Left = 675
            Top = 216
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'CAT 52'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 6
            OnClick = btnCAT52Click
          end
          object btnMeiosPagamento: TPanel
            Left = 675
            Top = 303
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'MEIOS DE PAGAMENTO'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 7
          end
          object btnDAVEmitidos: TPanel
            Left = 359
            Top = 126
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'DAV Emitidos'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 8
          end
          object btnIdentificacaPAFECF: TPanel
            Left = 359
            Top = 216
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'IDENTIFICA'#199#195'O PAF-ECF'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 9
          end
          object btnConfiguracoesPAFECF: TPanel
            Left = 359
            Top = 303
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'CONFIGURA'#199#213'ES PAF-ECF'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 10
          end
          object btnReduzaoZ: TPanel
            Left = 359
            Top = 36
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'RZ - REDU'#199#195'O Z'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 11
            OnClick = btnReduzaoZClick
          end
          object btnCancelaUltimoCupomFiscal: TPanel
            Left = 43
            Top = 393
            Width = 302
            Height = 76
            BevelOuter = bvNone
            Caption = 'CANCELA '#218'LTIMO CUPOM FISCAL'
            Color = 13619036
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15266807
            Font.Height = -11
            Font.Name = 'Roboto'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 12
            OnClick = btnCancelaUltimoCupomFiscalClick
          end
        end
      end
      object tsOpcoesRelatorio: TJvWizardInteriorPage
        Header.Title.Color = clNone
        Header.Title.Text = 'Op'#231#245'es do relat'#243'rio'
        Header.Title.Anchors = [akLeft, akTop, akRight]
        Header.Title.Font.Charset = DEFAULT_CHARSET
        Header.Title.Font.Color = clWindowText
        Header.Title.Font.Height = -16
        Header.Title.Font.Name = 'Tahoma'
        Header.Title.Font.Style = [fsBold]
        Header.Subtitle.Color = clNone
        Header.Subtitle.Text = 'Escolha a forma como os relat'#243'rios ser'#227'o emitidos.'
        Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
        Header.Subtitle.Font.Charset = DEFAULT_CHARSET
        Header.Subtitle.Font.Color = clWindowText
        Header.Subtitle.Font.Height = -11
        Header.Subtitle.Font.Name = 'Tahoma'
        Header.Subtitle.Font.Style = []
        EnabledButtons = [bkBack, bkNext]
        OnNextButtonClick = tsOpcoesRelatorioNextButtonClick
        object chkMenuFiscalGerarArquivo: TCheckBox
          Left = 34
          Top = 84
          Width = 468
          Height = 17
          Caption = 'Efetuar a gera'#231#227'o de arquivo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object chkMenuFiscalCotepe1704: TCheckBox
          Left = 34
          Top = 115
          Width = 719
          Height = 17
          Caption = 
            'Gerar o arquivo no formato do ato Cotepe 17/04 (Somente para os ' +
            'menus: LMFC, Arq.MFD)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object rgTipoEmissao: TRadioGroup
          Left = 34
          Top = 160
          Width = 943
          Height = 105
          Caption = '  Tipo de emiss'#227'o  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Por intervalo de datas'
            'Por intervalo de COO (Contador de Ordem de Opera'#231#227'o)')
          ParentFont = False
          TabOrder = 2
        end
      end
      object tsPeriodo: TJvWizardInteriorPage
        Header.Title.Color = clNone
        Header.Title.Text = 'Escolha o per'#237'odo'
        Header.Title.Anchors = [akLeft, akTop, akRight]
        Header.Title.Font.Charset = DEFAULT_CHARSET
        Header.Title.Font.Color = clWindowText
        Header.Title.Font.Height = -16
        Header.Title.Font.Name = 'Tahoma'
        Header.Title.Font.Style = [fsBold]
        Header.Subtitle.Color = clNone
        Header.Subtitle.Text = 
          'Selecione o per'#237'odo inicial e final desejado para este relat'#243'rio' +
          '.'
        Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
        Header.Subtitle.Font.Charset = DEFAULT_CHARSET
        Header.Subtitle.Font.Color = clWindowText
        Header.Subtitle.Font.Height = -11
        Header.Subtitle.Font.Name = 'Tahoma'
        Header.Subtitle.Font.Style = []
        EnabledButtons = [bkBack, bkFinish]
        object edtDataInicial: TJvMonthCalendar2
          Left = 3
          Top = 115
          Width = 504
          Height = 390
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabStop = True
          TabOrder = 0
          Colors.TitleBackColor = 16744448
          DateFirst = 42100.000000000000000000
          MaxSelCount = 1
          WeekNumbers = True
          Today = 42100.974806099530000000
        end
        object Panel1: TPanel
          Left = 3
          Top = 78
          Width = 504
          Height = 31
          BevelOuter = bvNone
          Caption = 'Data de in'#237'cio'
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object Panel2: TPanel
          Left = 513
          Top = 78
          Width = 504
          Height = 31
          BevelOuter = bvNone
          Caption = 'Data de fim'
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
        object edtDataFinal: TJvMonthCalendar2
          Left = 513
          Top = 115
          Width = 504
          Height = 390
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabStop = True
          TabOrder = 3
          Colors.TitleBackColor = 16744448
          DateFirst = 41605.000000000000000000
          MaxSelCount = 1
          WeekNumbers = True
          Today = 41605.752316365740000000
        end
      end
      object tsIntervaloCOO: TJvWizardInteriorPage
        Header.Title.Color = clNone
        Header.Title.Text = 'Escolha o intervalo de COO'
        Header.Title.Anchors = [akLeft, akTop, akRight]
        Header.Title.Font.Charset = DEFAULT_CHARSET
        Header.Title.Font.Color = clWindowText
        Header.Title.Font.Height = -16
        Header.Title.Font.Name = 'Tahoma'
        Header.Title.Font.Style = [fsBold]
        Header.Subtitle.Color = clNone
        Header.Subtitle.Text = 'Selecione o intervalo entre os COOs que deseja.'
        Header.Subtitle.Anchors = [akLeft, akTop, akRight, akBottom]
        Header.Subtitle.Font.Charset = DEFAULT_CHARSET
        Header.Subtitle.Font.Color = clWindowText
        Header.Subtitle.Font.Height = -11
        Header.Subtitle.Font.Name = 'Tahoma'
        Header.Subtitle.Font.Style = []
        EnabledButtons = [bkBack, bkFinish]
        object Panel4: TPanel
          Left = 16
          Top = 83
          Width = 465
          Height = 31
          BevelOuter = bvNone
          Caption = 'In'#237'cio do intervalo'
          Color = 16744448
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 520
          Top = 83
          Width = 489
          Height = 31
          BevelOuter = bvNone
          Caption = 'Fim do intervalo'
          Color = 16744448
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Roboto'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
        object edtInicioIntervalo: TJvSpinEdit
          Left = 16
          Top = 120
          Width = 465
          Height = 111
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -85
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = edtInicioIntervaloChange
        end
        object edtFimIntervalo: TJvSpinEdit
          Left = 520
          Top = 120
          Width = 489
          Height = 111
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -85
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Menu fiscal'
  end
  object dlgDialogoSalvar: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Title = 'Salvar arquivo texto'
    Left = 559
    Top = 75
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    OnWork = IdFTP1Work
    OnWorkBegin = IdFTP1WorkBegin
    OnWorkEnd = IdFTP1WorkEnd
    IPVersion = Id_IPv4
    Passive = True
    PassiveUseControlHost = True
    ConnectTimeout = 0
    ListenTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 0
    Left = 472
    Top = 71
  end
  object qrySenha: TFDQuery
    SQL.Strings = (
      'select p.idPessoa, p.RazaoSocial, p.NomeFantasia, p.Senha '
      'from Contabil.Pessoas p'
      
        'where idPessoa in (select idPessoa from Contabil.EmpresaPessoaTi' +
        'pos ept where (ept.idPessoa = p.idPessoa) and (ept.idEmpresa = 1' +
        ') and (idTipoPessoa=5))'
      'Order by p.NomeFantasia')
    Left = 193
    Top = 164
    object qrySenhaidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object qrySenhaRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object qrySenhaNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object qrySenhaSenha: TStringField
      FieldName = 'Senha'
      Size = 50
    end
  end
  object dsSenha: TDataSource
    DataSet = cdsSenha
    Left = 193
    Top = 299
  end
  object dspSenha: TDataSetProvider
    DataSet = qrySenha
    Left = 193
    Top = 209
  end
  object cdsSenha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSenha'
    Left = 193
    Top = 254
    object cdsSenhaidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object cdsSenhaRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object cdsSenhaNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object cdsSenhaSenha: TStringField
      FieldName = 'Senha'
      Size = 50
    end
  end
  object qryGarcons: TFDQuery
    SQL.Strings = (
      'select * from Contabil.Pessoas p with (nolock)'
      
        'where Exists (select 1 from Contabil.EmpresaPessoaTipos ept wher' +
        'e ept.idEmpresa = :idEmpresa and ept.idPessoa = p.idPessoa and i' +
        'dTipoPessoa = 7)')
    Left = 753
    Top = 34
    ParamData = <
      item
        Name = 'idEmpresa'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object intgrfld1: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object StringField2: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'Senha'
      Size = 50
    end
  end
  object dspGarcons: TDataSetProvider
    DataSet = qryGarcons
    Left = 753
    Top = 79
  end
  object cdsGarcons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGarcons'
    Left = 753
    Top = 124
    object intgrfld2: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object StringField4: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object StringField5: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'Senha'
      Size = 50
    end
  end
  object dsGarcons: TDataSource
    DataSet = cdsGarcons
    Left = 753
    Top = 169
  end
end
