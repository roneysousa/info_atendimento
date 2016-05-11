inherited frmCadClientes: TfrmCadClientes
  Left = 212
  Top = 119
  Caption = 'Cadastro de Clientes'
  ClientHeight = 585
  ClientWidth = 686
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 686
    Height = 566
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        Width = 129
        DataField = 'CLI_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 64
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
      end
      object Label3: TLabel [3]
        Left = 488
        Top = 64
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = dbeCPF
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 104
        Width = 54
        Height = 13
        Caption = 'Logradouro'
        FocusControl = dbeLogradouro
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 488
        Top = 103
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit2
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 16
        Top = 144
        Width = 64
        Height = 13
        Caption = 'Complemento'
        FocusControl = DBEdit3
        Transparent = True
      end
      object Label7: TLabel [7]
        Left = 296
        Top = 144
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = dbeCEP
        Transparent = True
      end
      object Label8: TLabel [8]
        Left = 399
        Top = 144
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = cmbCidade
        Transparent = True
      end
      object Label10: TLabel [9]
        Left = 584
        Top = 144
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object Label9: TLabel [10]
        Left = 16
        Top = 184
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = cmbBairros
        Transparent = True
      end
      object Label11: TLabel [11]
        Left = 296
        Top = 184
        Width = 68
        Height = 13
        Caption = 'N'#186'. Identidade'
        FocusControl = dbeIdentidade
        Transparent = True
      end
      object Label12: TLabel [12]
        Left = 488
        Top = 184
        Width = 71
        Height = 13
        Caption = #211'rg'#227'o Emiss'#227'o'
        FocusControl = dbeOrgao
        Transparent = True
      end
      object Label13: TLabel [13]
        Left = 584
        Top = 184
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object Label14: TLabel [14]
        Left = 169
        Top = 226
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
        FocusControl = cmbEstadoCivil
        Transparent = True
      end
      object Label15: TLabel [15]
        Left = 296
        Top = 226
        Width = 97
        Height = 13
        Caption = 'Data de Nascimento'
        FocusControl = dbeDataNasc
        Transparent = True
      end
      object Label16: TLabel [16]
        Left = 426
        Top = 226
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit1
        Transparent = True
      end
      object Label17: TLabel [17]
        Left = 534
        Top = 225
        Width = 32
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit4
        Transparent = True
      end
      object Label18: TLabel [18]
        Left = 16
        Top = 270
        Width = 46
        Height = 13
        Caption = 'Nome Pai'
        FocusControl = DBEdit5
        Transparent = True
      end
      object Label19: TLabel [19]
        Left = 16
        Top = 310
        Width = 52
        Height = 13
        Caption = 'Nome M'#227'e'
        FocusControl = DBEdit6
        Transparent = True
      end
      object Label20: TLabel [20]
        Left = 16
        Top = 347
        Width = 25
        Height = 13
        Caption = 'Email'
        FocusControl = DBEdit7
        Transparent = True
      end
      object Label21: TLabel [21]
        Left = 486
        Top = 347
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
        FocusControl = cmbSituacao
        Transparent = True
      end
      object Label22: TLabel [22]
        Left = 16
        Top = 387
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
        FocusControl = DBMemo1
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 497
        Width = 678
      end
      object dbeNome: TDBEdit
        Left = 16
        Top = 80
        Width = 457
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_NOME'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeCPF: TDBEdit
        Left = 488
        Top = 80
        Width = 147
        Height = 21
        DataField = 'CLI_CPF'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 2
        OnExit = dbeCPFExit
      end
      object dbeLogradouro: TDBEdit
        Left = 16
        Top = 120
        Width = 457
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_LOGRADOURO'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 488
        Top = 119
        Width = 147
        Height = 21
        DataField = 'CLI_NUMERO'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 160
        Width = 273
        Height = 21
        DataField = 'CLI_COMPLEMENTO'
        DataSource = dsCadastro
        TabOrder = 5
      end
      object dbeCEP: TDBEdit
        Left = 296
        Top = 160
        Width = 96
        Height = 21
        DataField = 'CLI_CEP'
        DataSource = dsCadastro
        MaxLength = 9
        TabOrder = 6
      end
      object cmbCidade: TDBLookupComboBox
        Left = 399
        Top = 160
        Width = 179
        Height = 21
        DataField = 'CLI_NMCIDADE'
        DataSource = dsCadastro
        TabOrder = 7
        OnExit = cmbCidadeExit
      end
      object cmbUF: TDBComboBox
        Left = 584
        Top = 160
        Width = 49
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        DataField = 'CLI_UFCLIENTE'
        DataSource = dsCadastro
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PR'
          'PI'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 8
      end
      object cmbBairros: TDBLookupComboBox
        Left = 16
        Top = 200
        Width = 274
        Height = 21
        DataField = 'CLI_NMBAIRRO'
        DataSource = dsCadastro
        TabOrder = 9
      end
      object dbeIdentidade: TDBEdit
        Left = 296
        Top = 200
        Width = 186
        Height = 21
        DataField = 'CLI_IDENTIDADE'
        DataSource = dsCadastro
        TabOrder = 10
        OnKeyPress = dbeIdentidadeKeyPress
      end
      object dbeOrgao: TDBEdit
        Left = 488
        Top = 200
        Width = 88
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_ORGAOEMISSOR'
        DataSource = dsCadastro
        TabOrder = 11
      end
      object DBComboBox1: TDBComboBox
        Left = 584
        Top = 200
        Width = 49
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        DataField = 'CLI_UFEMISSOR'
        DataSource = dsCadastro
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PR'
          'PI'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 12
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 227
        Width = 145
        Height = 39
        Caption = '[ Sexo ] '
        Columns = 2
        DataField = 'CLI_SEXO'
        DataSource = dsCadastro
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 13
        Values.Strings = (
          'M'
          'F')
      end
      object cmbEstadoCivil: TDBLookupComboBox
        Left = 169
        Top = 242
        Width = 121
        Height = 21
        DataField = 'CLI_NMEST_CIVIL'
        DataSource = dsCadastro
        TabOrder = 14
      end
      object dbeDataNasc: TDBDateEdit
        Left = 296
        Top = 242
        Width = 121
        Height = 21
        DataField = 'CLI_DTANIVERSARIO'
        DataSource = dsCadastro
        NumGlyphs = 2
        TabOrder = 15
        OnExit = dbeDataNascExit
      end
      object DBEdit1: TDBEdit
        Left = 426
        Top = 242
        Width = 100
        Height = 21
        DataField = 'CLI_FONE1'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 16
      end
      object DBEdit4: TDBEdit
        Left = 534
        Top = 241
        Width = 100
        Height = 21
        DataField = 'CLI_CELULAR'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 17
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 286
        Width = 617
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_NOME_PAI'
        DataSource = dsCadastro
        TabOrder = 18
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 326
        Width = 617
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_NOME_MAE'
        DataSource = dsCadastro
        TabOrder = 19
      end
      object DBEdit7: TDBEdit
        Left = 16
        Top = 363
        Width = 457
        Height = 21
        CharCase = ecLowerCase
        DataField = 'CLI_EMAIL'
        DataSource = dsCadastro
        TabOrder = 20
      end
      object cmbSituacao: TDBLookupComboBox
        Left = 486
        Top = 363
        Width = 148
        Height = 21
        DataField = 'CLI_NMSITUACAO'
        DataSource = dsCadastro
        TabOrder = 21
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 403
        Width = 617
        Height = 78
        DataField = 'CLI_OBSERVACAO'
        DataSource = dsCadastro
        ScrollBars = ssVertical
        TabOrder = 22
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        Width = 678
        inherited lblConsultar: TLabel
          Left = 141
          Top = 16
        end
        inherited rgConsultar: TRadioGroup
          Height = 68
          Items.Strings = (
            '&C'#243'digo'
            '&Nome do Cliente'
            'C&PF')
        end
        inherited edtConsultar: TEdit
          Left = 141
          Top = 31
        end
        inherited btnConsultar: TBitBtn
          Left = 478
          Top = 26
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Left = 644
        Height = 465
      end
      inherited grdConsultar: TDBGrid
        Width = 644
        Height = 465
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CLI_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 317
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_CPF'
            Title.Alignment = taRightJustify
            Title.Caption = 'CPF'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_FONE1'
            Title.Alignment = taRightJustify
            Title.Caption = 'Telefone'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 566
    Width = 686
  end
  inherited dsConsultar: TDataSource
    Left = 316
    Top = 34
  end
  inherited dspConsultar: TDataSetProvider
    Left = 476
    Top = 34
  end
  inherited cdsConsultar: TClientDataSet
    Left = 548
    Top = 34
    object cdsConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object cdsConsultarCLI_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsConsultarCLI_IDENTIDADE: TStringField
      FieldName = 'CLI_IDENTIDADE'
      Size = 14
    end
    object cdsConsultarCLI_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE1'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsCliente
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select CLI_CODIGO, CLI_NOME, CLI_CPF,  CLI_IDENTIDADE, CLI_FONE1' +
      ' from CLIENTES'#13#10'order by CLI_NOME'
    Left = 388
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    Left = 196
    Top = 56
    object ppmCidades: TMenuItem
      Caption = '&Cidades'
      OnClick = ppmCidadesClick
    end
    object ppmBairros1: TMenuItem
      Caption = '&Bairros'
      OnClick = ppmBairros1Click
    end
  end
end
