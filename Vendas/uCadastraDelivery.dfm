inherited fCadastraCliente: TfCadastraCliente
  Caption = 'Cadastro de clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundoPadrao: TPanel
    object Label2: TLabel
      Left = 14
      Top = 72
      Width = 76
      Height = 13
      Caption = 'Nome do cliente'
    end
    object Label4: TLabel
      Left = 176
      Top = 134
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 16
      Top = 260
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label6: TLabel
      Left = 161
      Top = 260
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object Label10: TLabel
      Left = 14
      Top = 134
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label12: TLabel
      Left = 662
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Telefone3'
    end
    object Label1: TLabel
      Left = 14
      Top = 413
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label7: TLabel
      Left = 16
      Top = 196
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label8: TLabel
      Left = 335
      Top = 196
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 855
      Top = 196
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label3: TLabel
      Left = 14
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Telefone1'
    end
    object Label14: TLabel
      Left = 335
      Top = 10
      Width = 48
      Height = 13
      Caption = 'Telefone2'
    end
    object Label11: TLabel
      Left = 16
      Top = 316
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object Label13: TLabel
      Left = 16
      Top = 367
      Width = 28
      Height = 13
      Caption = 'e-mail'
    end
    object Button1: TButton
      Left = 127
      Top = 151
      Width = 43
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      OnClick = Button1Click
    end
    object edtTelefone1: TEdit
      Left = 8
      Top = 29
      Width = 321
      Height = 21
      TabOrder = 0
    end
    object edtTelefone2: TEdit
      Left = 335
      Top = 29
      Width = 321
      Height = 21
      TabOrder = 1
    end
    object edtTelefone3: TEdit
      Left = 662
      Top = 29
      Width = 321
      Height = 21
      TabOrder = 2
    end
    object edtNome: TEdit
      Left = 8
      Top = 91
      Width = 975
      Height = 21
      TabOrder = 3
    end
    object edtCEP: TEdit
      Left = 8
      Top = 153
      Width = 113
      Height = 21
      TabOrder = 4
    end
    object edtEndereco: TEdit
      Left = 176
      Top = 153
      Width = 807
      Height = 21
      TabOrder = 6
    end
    object edtBairro: TEdit
      Left = 8
      Top = 215
      Width = 321
      Height = 21
      TabOrder = 7
    end
    object edtCidade: TEdit
      Left = 335
      Top = 215
      Width = 514
      Height = 21
      TabOrder = 8
    end
    object edtUF: TEdit
      Left = 855
      Top = 215
      Width = 128
      Height = 21
      TabOrder = 9
    end
    object edtNumero: TEdit
      Left = 8
      Top = 279
      Width = 137
      Height = 21
      TabOrder = 10
    end
    object edtComplemento: TEdit
      Left = 161
      Top = 279
      Width = 822
      Height = 21
      TabOrder = 11
    end
    object edtReferencia: TEdit
      Left = 8
      Top = 335
      Width = 975
      Height = 21
      TabOrder = 12
    end
    object memoObservacoes: TMemo
      Left = 8
      Top = 432
      Width = 975
      Height = 224
      TabOrder = 14
    end
    object edtEmail: TEdit
      Left = 8
      Top = 386
      Width = 975
      Height = 21
      TabOrder = 13
    end
  end
  inherited pnlTituloPadrao: TPanel
    Caption = 'Cadastro de cliente'
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 280
    Top = 424
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsRepublicaVirtual
    PesquisarIBGE = True
    Left = 496
    Top = 368
  end
end
