inherited frmPessoas: TfrmPessoas
  Caption = 'Cadastro de pessoas'
  ExplicitTop = -73
  ExplicitWidth = 1024
  ExplicitHeight = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBotoesPadrao: TPanel
    inherited btnOKPadrao: TJvPanel
      Left = 87
      Top = 6
      Visible = False
      ExplicitLeft = 87
      ExplicitTop = 6
    end
    object btnIncluir: TJvPanel
      Left = 751
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'INCLUIR'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnAlterar: TJvPanel
      Left = 878
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'ALTERAR'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnRedefinirSenha: TJvPanel
      Left = 287
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'REDEFINIR SENHA'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = btnRedefinirSenhaClick
    end
    object btnPermissoes: TJvPanel
      Left = 414
      Top = 6
      Width = 121
      Height = 55
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Caption = 'PERMISS'#213'ES'
      Color = 4210816
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13690861
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = btnPermissoesClick
    end
  end
  inherited pnlFundoPadrao: TPanel
    object dbgridPrincipal: TcxGrid
      Left = 0
      Top = 0
      Width = 1024
      Height = 662
      Align = alClient
      TabOrder = 0
      object dbgridPrincipalDBTableView1: TcxGridDBTableView
        OnDblClick = dbgridPrincipalDBTableView1DblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsCadastroPessoas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhum dado a visualizar>'
        OptionsView.ShowEditButtons = gsebAlways
        OptionsView.DataRowHeight = 31
        OptionsView.Indicator = True
        Styles.ContentEven = cxStyle1
        Styles.ContentOdd = cxStyle2
        Styles.Header = cxStyle3
        object dbgridPrincipalDBTableView1idPessoa: TcxGridDBColumn
          DataBinding.FieldName = 'idPessoa'
          Visible = False
        end
        object dbgridPrincipalDBTableView1RazaoSocial: TcxGridDBColumn
          DataBinding.FieldName = 'RazaoSocial'
          Width = 375
        end
        object dbgridPrincipalDBTableView1NomeFantasia: TcxGridDBColumn
          DataBinding.FieldName = 'NomeFantasia'
          Width = 222
        end
        object dbgridPrincipalDBTableView1CNPJ: TcxGridDBColumn
          DataBinding.FieldName = 'CNPJ'
          Width = 150
        end
        object dbgridPrincipalDBTableView1IE: TcxGridDBColumn
          DataBinding.FieldName = 'IE'
          Visible = False
          Width = 158
        end
        object dbgridPrincipalDBTableView1IEST: TcxGridDBColumn
          DataBinding.FieldName = 'IEST'
          Visible = False
          Width = 130
        end
        object dbgridPrincipalDBTableView1IM: TcxGridDBColumn
          DataBinding.FieldName = 'IM'
          Visible = False
        end
        object dbgridPrincipalDBTableView1CNAE: TcxGridDBColumn
          DataBinding.FieldName = 'CNAE'
          Visible = False
        end
        object dbgridPrincipalDBTableView1CRT: TcxGridDBColumn
          DataBinding.FieldName = 'CRT'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Logradouro: TcxGridDBColumn
          DataBinding.FieldName = 'Logradouro'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Numero: TcxGridDBColumn
          DataBinding.FieldName = 'Numero'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Complemento: TcxGridDBColumn
          DataBinding.FieldName = 'Complemento'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Bairro: TcxGridDBColumn
          DataBinding.FieldName = 'Bairro'
          Visible = False
        end
        object dbgridPrincipalDBTableView1CodigoMunicipio: TcxGridDBColumn
          DataBinding.FieldName = 'CodigoMunicipio'
          Visible = False
        end
        object dbgridPrincipalDBTableView1NomeMunicipio: TcxGridDBColumn
          DataBinding.FieldName = 'NomeMunicipio'
          Visible = False
        end
        object dbgridPrincipalDBTableView1UF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          Visible = False
        end
        object dbgridPrincipalDBTableView1CEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
          Visible = False
        end
        object dbgridPrincipalDBTableView1CodigoPais: TcxGridDBColumn
          DataBinding.FieldName = 'CodigoPais'
          Visible = False
        end
        object dbgridPrincipalDBTableView1NomePais: TcxGridDBColumn
          DataBinding.FieldName = 'NomePais'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Telefone1: TcxGridDBColumn
          DataBinding.FieldName = 'Telefone1'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Telefone2: TcxGridDBColumn
          DataBinding.FieldName = 'Telefone2'
          Visible = False
        end
        object dbgridPrincipalDBTableView1Telefone3: TcxGridDBColumn
          DataBinding.FieldName = 'Telefone3'
          Visible = False
        end
        object dbgridPrincipalDBTableView1FisicaJuridica: TcxGridDBColumn
          DataBinding.FieldName = 'FisicaJuridica'
          Visible = False
        end
        object dbgridPrincipalDBTableView1TipoPessoa: TcxGridDBColumn
          DataBinding.FieldName = 'TiposDaPessoa'
          Width = 229
        end
      end
      object dbgridPrincipalLevel1: TcxGridLevel
        GridView = dbgridPrincipalDBTableView1
      end
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Pessoas (f'#237'sicas ou jur'#237'dicas)'
  end
  object qryCadastroPessoas: TFDQuery
    Connection = dmCaixa.dbTotalFastFood
    SQL.Strings = (
      
        'select *, Contabil.RetornaEmpresaPessoaTipos(:idEmpresa, idPesso' +
        'a) as TiposDaPessoa '
      'from Contabil.Pessoas '
      
        'where exists (select 1 from contabil.empresapessoas ep where ep.' +
        'idEmpresa = :idEmpresa and ep.idPessoa = Contabil.Pessoas.idPess' +
        'oa) '
      'order by RazaoSocial')
    Left = 732
    Top = 5
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsCadastroPessoas: TDataSource
    DataSet = qryCadastroPessoas
    Left = 838
    Top = 5
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 13750693
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
