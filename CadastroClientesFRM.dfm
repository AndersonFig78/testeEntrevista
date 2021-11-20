object CadastroClientes_FRM: TCadastroClientes_FRM
  Left = 278
  Top = 143
  Caption = 'Cadastro de Clientes'
  ClientHeight = 758
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 4
    Width = 909
    Height = 761
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro de Cliente'
      DesignSize = (
        901
        733)
      object lblNome: TLabel
        Left = 9
        Top = 34
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedtNome
      end
      object lblIdentidade: TLabel
        Left = 9
        Top = 78
        Width = 50
        Height = 13
        Caption = 'Identidade'
        FocusControl = dbedtIdentidade
      end
      object lblCPF: TLabel
        Left = 285
        Top = 78
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = dbedtCPF
      end
      object lblEmail: TLabel
        Left = 9
        Top = 122
        Width = 25
        Height = 13
        Caption = 'Email'
        FocusControl = dbedtEmail
      end
      object lblCEP: TLabel
        Left = 9
        Top = 166
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = dbedtCEP
      end
      object lblLogradouro: TLabel
        Left = 9
        Top = 210
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = dbedtLogradouro
      end
      object lblNumero: TLabel
        Left = 9
        Top = 254
        Width = 37
        Height = 13
        Caption = 'Numero'
        FocusControl = dbedtNumero
      end
      object lblComplemento: TLabel
        Left = 9
        Top = 298
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = dbedtComplemento
      end
      object lblBairro: TLabel
        Left = 9
        Top = 342
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbedtBairro
      end
      object lblCidade: TLabel
        Left = 9
        Top = 386
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = dbedtCidade
      end
      object lblEstado: TLabel
        Left = 253
        Top = 386
        Width = 33
        Height = 13
        Caption = 'Estado'
        FocusControl = dbedtEstado
      end
      object lblPais: TLabel
        Left = 301
        Top = 386
        Width = 20
        Height = 13
        Caption = 'Pais'
        FocusControl = dbedtPais
      end
      object lblTelefone: TLabel
        Left = 9
        Top = 430
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = dbedtTelefone
      end
      object tlbComandos: TToolBar
        Left = 0
        Top = 0
        Width = 901
        Height = 29
        ButtonWidth = 73
        Caption = 'tlbComandos'
        TabOrder = 0
        object btnNovo: TBitBtn
          Left = 0
          Top = 0
          Width = 57
          Height = 22
          Caption = '&Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnCancelar: TBitBtn
          Left = 57
          Top = 0
          Width = 57
          Height = 22
          Caption = '&Cancelar'
          TabOrder = 1
          OnClick = btnCancelarClick
        end
        object btnGravar: TBitBtn
          Left = 114
          Top = 0
          Width = 57
          Height = 22
          Caption = '&Gravar'
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnExcluir: TBitBtn
          Left = 171
          Top = 0
          Width = 57
          Height = 22
          Caption = '&Excluir'
          TabOrder = 3
          OnClick = btnExcluirClick
        end
        object btnExportar: TButton
          Left = 228
          Top = 0
          Width = 57
          Height = 22
          Caption = 'E&xportar'
          TabOrder = 4
          OnClick = btnExportarClick
        end
      end
      object dbedtNome: TDBEdit
        Left = 8
        Top = 50
        Width = 886
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Nome'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 1
      end
      object dbedtIdentidade: TDBEdit
        Left = 9
        Top = 94
        Width = 264
        Height = 21
        DataField = 'Identidade'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 2
      end
      object dbedtCPF: TDBEdit
        Left = 285
        Top = 94
        Width = 147
        Height = 21
        DataField = 'CPF'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 3
      end
      object dbedtEmail: TDBEdit
        Left = 8
        Top = 138
        Width = 886
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Email'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 4
      end
      object dbgrdCadastroCliente: TDBGrid
        Left = 9
        Top = 472
        Width = 885
        Height = 261
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 14
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Identidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Logradouro'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complemento'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estado'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pais'
            Width = 100
            Visible = True
          end>
      end
      object dbedtCEP: TDBEdit
        Left = 9
        Top = 182
        Width = 108
        Height = 21
        DataField = 'CEP'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 5
        OnExit = dbedtCEPExit
      end
      object dbedtLogradouro: TDBEdit
        Left = 8
        Top = 226
        Width = 886
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Logradouro'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 6
      end
      object dbedtNumero: TDBEdit
        Left = 8
        Top = 271
        Width = 56
        Height = 21
        DataField = 'Numero'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 7
      end
      object dbedtComplemento: TDBEdit
        Left = 8
        Top = 314
        Width = 886
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Complemento'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 8
      end
      object dbedtBairro: TDBEdit
        Left = 8
        Top = 358
        Width = 886
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Bairro'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 9
      end
      object dbedtCidade: TDBEdit
        Left = 8
        Top = 402
        Width = 234
        Height = 21
        DataField = 'Cidade'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 10
      end
      object dbedtEstado: TDBEdit
        Left = 253
        Top = 402
        Width = 30
        Height = 21
        DataField = 'Estado'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 11
      end
      object dbedtPais: TDBEdit
        Left = 301
        Top = 402
        Width = 113
        Height = 21
        DataField = 'Pais'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 12
      end
      object dbedtTelefone: TDBEdit
        Left = 9
        Top = 446
        Width = 147
        Height = 21
        AutoSelect = False
        DataField = 'Telefone'
        DataSource = dtmdlCadastroCliente.dsCadastroCliente
        TabOrder = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object lblConfigEmail: TLabel
        Left = 12
        Top = 8
        Width = 138
        Height = 13
        Caption = 'E-mail que enviar'#225' os e-mail'#39's'
      end
      object Label1: TLabel
        Left = 12
        Top = 51
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object lblHost: TLabel
        Left = 12
        Top = 100
        Width = 22
        Height = 13
        Caption = 'Host'
      end
      object lblConfigPorta: TLabel
        Left = 156
        Top = 100
        Width = 25
        Height = 13
        Caption = 'Porta'
      end
      object Label2: TLabel
        Left = 12
        Top = 152
        Width = 85
        Height = 13
        Caption = 'E-mail destinat'#225'rio'
      end
      object txtConfigEmailRemetente: TEdit
        Left = 12
        Top = 24
        Width = 429
        Height = 21
        TabOrder = 0
        Text = 'anderson.desenvolvimento@gmail.com'
      end
      object txtConfigSenha: TEdit
        AlignWithMargins = True
        Left = 12
        Top = 70
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
        Text = 'senha'
      end
      object txtConfigHost: TEdit
        Left = 12
        Top = 119
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'smtp.gmail.com'
      end
      object txtConfigPorta: TEdit
        Left = 156
        Top = 119
        Width = 37
        Height = 21
        TabOrder = 3
        Text = '465'
      end
      object txtConfigEmailDestinatario: TEdit
        Left = 12
        Top = 168
        Width = 429
        Height = 21
        TabOrder = 4
        Text = 'anderson.desenvolvimento@gmail.com'
      end
    end
  end
end
