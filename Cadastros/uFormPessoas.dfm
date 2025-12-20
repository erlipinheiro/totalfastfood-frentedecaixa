inherited frmFormCadastroPessoas: TfrmFormCadastroPessoas
  Caption = 'Cadastro de pessoas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    object btnRedefinirSenha: TJvPanel
      Left = 375
      Top = 5
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'DEFINIR SENHA'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnRedefinirSenhaClick
    end
  end
  inherited pnlFundoPadrao: TPanel
    object lbl1: TLabel
      Tag = 10
      Left = 12
      Top = 15
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = dbedtidPessoa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Tag = 10
      Left = 309
      Top = 15
      Width = 95
      Height = 13
      Caption = 'F'#237'sica ou Jur'#237'dica'
      FocusControl = dbedtidPessoa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Tag = 12
      Left = 18
      Top = 50
      Width = 32
      Height = 13
      Caption = 'Nome'
      FocusControl = dbedtRazaoSocial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedtidPessoa: TDBEdit
      Left = 56
      Top = 9
      Width = 93
      Height = 35
      CharCase = ecUpperCase
      Color = 13690861
      Ctl3D = False
      DataField = 'idPessoa'
      DataSource = dsCadastro
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object dbedtRazaoSocial: TDBEdit
      Left = 56
      Top = 50
      Width = 953
      Height = 35
      CharCase = ecUpperCase
      Color = 13690861
      Ctl3D = False
      DataField = 'RazaoSocial'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object dbcbbFisicaJuridica: TDBComboBox
      Left = 410
      Top = 6
      Width = 127
      Height = 37
      DataField = 'FisicaJuridica'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'F'
        'J')
      ParentFont = False
      TabOrder = 1
    end
    object pcPessoa: TJvPageControl
      Left = 8
      Top = 99
      Width = 1001
      Height = 557
      ActivePage = ts1
      TabHeight = 40
      TabOrder = 4
      TabWidth = 100
      object tsPessoaDados: TTabSheet
        Caption = 'Dados Principais'
        object lblNomeFantasia: TLabel
          Tag = 12
          Left = 14
          Top = 3
          Width = 100
          Height = 13
          Caption = 'Nome de Fantasia'
          FocusControl = dbedtNomeFantasia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCnpj: TLabel
          Tag = 10
          Left = 6
          Top = 72
          Width = 59
          Height = 13
          Caption = 'CNPJ / CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblInscricaoEstadual: TLabel
          Tag = 10
          Left = 532
          Top = 72
          Width = 131
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual / RG'
          FocusControl = dbedtIE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblInscricaoMunicipal: TLabel
          Tag = 10
          Left = 760
          Top = 69
          Width = 108
          Height = 13
          Caption = 'Inscri'#231#227'o Municipal'
          FocusControl = dbedtIM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lblCNAE: TLabel
          Tag = 10
          Left = 6
          Top = 136
          Width = 28
          Height = 13
          Caption = 'CNAE'
          FocusControl = dbedtCNAE
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object dbedtNomeFantasia: TDBEdit
          Left = 3
          Top = 22
          Width = 974
          Height = 35
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'NomeFantasia'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object dbedtIE: TDBEdit
          Left = 532
          Top = 88
          Width = 222
          Height = 35
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'IE'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object dbedtIM: TDBEdit
          Left = 760
          Top = 88
          Width = 217
          Height = 35
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'IM'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object dbedtCNAE: TDBEdit
          Left = 3
          Top = 155
          Width = 366
          Height = 35
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'CNAE'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Visible = False
        end
        object btnConsultarCNPJ: TButton
          Left = 375
          Top = 87
          Width = 151
          Height = 37
          Caption = 'Buscar dados pelo CNPJ'
          TabOrder = 4
        end
        object edtCNPJCPF: TcxDBMaskEdit
          Left = 3
          Top = 87
          DataBinding.DataField = 'CNPJ'
          DataBinding.DataSource = dsCadastro
          ParentFont = False
          Style.Color = 13690861
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 366
        end
      end
      object tsPessoaEndereco: TTabSheet
        Caption = 'Endere'#231'o'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lbl3: TLabel
          Tag = 12
          Left = 3
          Top = 3
          Width = 65
          Height = 13
          Caption = 'Logradouro'
          Color = clBlack
          FocusControl = dbedtLogradouro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl4: TLabel
          Tag = 10
          Left = 6
          Top = 128
          Width = 34
          Height = 13
          Caption = 'Bairro'
          Color = clBlack
          FocusControl = dbedtBairro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl5: TLabel
          Tag = 10
          Left = 6
          Top = 65
          Width = 79
          Height = 13
          Caption = 'Complemento'
          Color = clBlack
          FocusControl = dbedtComplemento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl6: TLabel
          Tag = 10
          Left = 694
          Top = 128
          Width = 20
          Height = 13
          Caption = 'CEP'
          Color = clBlack
          FocusControl = dbedtCEP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl7: TLabel
          Tag = 10
          Left = 6
          Top = 249
          Width = 68
          Height = 13
          Caption = 'Telefone #1'
          Color = clBlack
          FocusControl = dbedtTelefone1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl8: TLabel
          Tag = 10
          Left = 335
          Top = 252
          Width = 68
          Height = 13
          Caption = 'Telefone #2'
          Color = clBlack
          FocusControl = dbedtTelefone2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl9: TLabel
          Tag = 10
          Left = 686
          Top = 252
          Width = 68
          Height = 13
          Caption = 'Telefone #3'
          Color = clBlack
          FocusControl = dbedtTelefone3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl10: TLabel
          Tag = 10
          Left = 863
          Top = 3
          Width = 44
          Height = 13
          Caption = 'N'#250'mero'
          Color = clBlack
          FocusControl = dbedtNumero
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl11: TLabel
          Tag = 10
          Left = 3
          Top = 185
          Width = 112
          Height = 13
          Caption = 'C'#243'digo do munic'#237'pio'
          Color = clBlack
          FocusControl = dbedtCodigoMunicipio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl12: TLabel
          Tag = 10
          Left = 335
          Top = 185
          Width = 106
          Height = 13
          Caption = 'Nome do munic'#237'pio'
          Color = clBlack
          FocusControl = dbedtNomeMunicipio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbedtLogradouro: TDBEdit
          Left = 3
          Top = 22
          Width = 849
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Logradouro'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object dbedtBairro: TDBEdit
          Left = 3
          Top = 144
          Width = 670
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Bairro'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object dbedtComplemento: TDBEdit
          Left = 3
          Top = 80
          Width = 976
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Complemento'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object dbedtCEP: TDBEdit
          Left = 686
          Top = 144
          Width = 293
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'CEP'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object dbedtTelefone1: TDBEdit
          Left = 3
          Top = 268
          Width = 326
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Telefone1'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object dbedtTelefone2: TDBEdit
          Left = 335
          Top = 268
          Width = 338
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Telefone2'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
        end
        object dbedtTelefone3: TDBEdit
          Left = 686
          Top = 268
          Width = 293
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Telefone3'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
        end
        object dbedtNumero: TDBEdit
          Left = 866
          Top = 22
          Width = 113
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'Numero'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 7
        end
        object dbedtCodigoMunicipio: TDBEdit
          Left = 3
          Top = 204
          Width = 326
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'CodigoMunicipio'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
        end
        object dbedtNomeMunicipio: TDBEdit
          Left = 335
          Top = 203
          Width = 644
          Height = 19
          CharCase = ecUpperCase
          Color = 13690861
          Ctl3D = False
          DataField = 'NomeMunicipio'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
        end
      end
      object tsPessoaContatos: TTabSheet
        Caption = 'Contatos'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object btnIncluirPessoaContatos: TSpeedButton
          Left = 221
          Top = 433
          Width = 106
          Height = 56
          Caption = 'Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnAlterarPessoaContatos: TSpeedButton
          Left = 437
          Top = 433
          Width = 106
          Height = 56
          Caption = 'Alterar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnExcluirPessoaContatos: TSpeedButton
          Left = 653
          Top = 433
          Width = 106
          Height = 56
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl13: TLabel
          Tag = 12
          Left = 3
          Top = 3
          Width = 65
          Height = 13
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbgridDependentes: TJvDBUltimGrid
          Left = -11
          Top = -2
          Width = 1001
          Height = 429
          Ctl3D = False
          FixedColor = 8700415
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          AlternateRowColor = 8700415
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ocupacao'
              Title.Caption = 'Ocupa'#231#227'o'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Telefone1'
              Title.Caption = 'Telefone #1'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'eMail'
              Title.Caption = 'e-mail'
              Width = 411
              Visible = True
            end>
        end
      end
      object ts1: TTabSheet
        Caption = 'Tipos da pessoa'
        ImageIndex = 3
        object lbl14: TLabel
          Left = 7
          Top = 10
          Width = 80
          Height = 13
          Caption = 'Tipos dispon'#237'veis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl15: TLabel
          Left = 540
          Top = 10
          Width = 92
          Height = 13
          Caption = 'Tipos desta pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lstTipoOrigem: TListBox
          Left = 7
          Top = 28
          Width = 441
          Height = 468
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          MultiSelect = True
          ParentFont = False
          Sorted = True
          TabOrder = 0
        end
        object btnInserirTipoPessoa: TButton
          Left = 458
          Top = 72
          Width = 76
          Height = 76
          Caption = 'Inserir'
          TabOrder = 1
          OnClick = btnInserirTipoPessoaClick
        end
        object btnExcluirTipoPessoa: TButton
          Left = 458
          Top = 359
          Width = 76
          Height = 76
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirTipoPessoaClick
        end
        object lstTipoDestino: TListBox
          Left = 540
          Top = 28
          Width = 441
          Height = 468
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          MultiSelect = True
          ParentFont = False
          Sorted = True
          TabOrder = 3
        end
      end
    end
    object chkAtiva: TCheckBox
      Left = 664
      Top = 6
      Width = 113
      Height = 38
      Caption = 'Ativa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object qryCadastro: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.Pessoas')
    Left = 651
    Top = 65533
    object qryCadastroidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object strngfldCadastroRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 80
    end
    object strngfldCadastroNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object strngfldCadastroCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 50
    end
    object strngfldCadastroIE: TStringField
      FieldName = 'IE'
      Size = 50
    end
    object strngfldCadastroIEST: TStringField
      FieldName = 'IEST'
      Size = 50
    end
    object strngfldCadastroIM: TStringField
      FieldName = 'IM'
      Size = 50
    end
    object strngfldCadastroCNAE: TStringField
      FieldName = 'CNAE'
      Size = 50
    end
    object qryCadastroCRT: TIntegerField
      FieldName = 'CRT'
    end
    object strngfldCadastroLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 80
    end
    object strngfldCadastroNumero: TStringField
      FieldName = 'Numero'
    end
    object strngfldCadastroComplemento: TStringField
      FieldName = 'Complemento'
      Size = 80
    end
    object strngfldCadastroBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qryCadastroCodigoMunicipio: TIntegerField
      FieldName = 'CodigoMunicipio'
    end
    object strngfldCadastroNomeMunicipio: TStringField
      FieldName = 'NomeMunicipio'
      Size = 50
    end
    object strngfldCadastroUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object strngfldCadastroCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qryCadastroCodigoPais: TIntegerField
      FieldName = 'CodigoPais'
    end
    object strngfldCadastroNomePais: TStringField
      FieldName = 'NomePais'
      Size = 50
    end
    object strngfldCadastroTelefone1: TStringField
      FieldName = 'Telefone1'
    end
    object strngfldCadastroTelefone2: TStringField
      FieldName = 'Telefone2'
    end
    object strngfldCadastroTelefone3: TStringField
      FieldName = 'Telefone3'
    end
    object strngfldCadastroFisicaJuridica: TStringField
      FieldName = 'FisicaJuridica'
      FixedChar = True
      Size = 1
    end
    object strngfldCadastroSenha: TStringField
      FieldName = 'Senha'
      Size = 50
    end
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 716
    Top = 65533
  end
  object qryTiposPessoa: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'select * from Contabil.TiposPessoa order by Descricao')
    Left = 821
    Top = 65533
    object qryTiposPessoaidTipoPessoa: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'idTipoPessoa'
      Required = True
    end
    object strngfldTiposPessoaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object qryEmpresaPessoaTipos: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      'Select ept.*, tp.Descricao from Contabil.EmpresaPessoaTipos ept'
      
        'inner join Contabil.TiposPessoa tp on ept.idTipoPessoa = tp.idTi' +
        'poPessoa'
      'where idEmpresa = :idEmpresa and idPessoa = :idPessoa'
      'order by descricao')
    Left = 949
    Top = 65530
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryEmpresaPessoaTiposidEmpresa: TIntegerField
      FieldName = 'idEmpresa'
      Required = True
    end
    object qryEmpresaPessoaTiposidPessoa: TIntegerField
      FieldName = 'idPessoa'
      Required = True
    end
    object qryEmpresaPessoaTiposidTipoPessoa: TIntegerField
      FieldName = 'idTipoPessoa'
      Required = True
    end
    object strngfldEmpresaPessoaTiposDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 784
    Top = 49
  end
end
