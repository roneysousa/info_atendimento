object frmEditarBaixaCP: TfrmEditarBaixaCP
  Left = 208
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar Conta a Pagar'
  ClientHeight = 514
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Fornecedor'
      Transparent = True
    end
    object DBText1: TDBText
      Left = 496
      Top = 29
      Width = 80
      Height = 22
      AutoSize = True
      Color = clBtnFace
      DataField = 'PAG_IDCONTA'
      DataSource = dsCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 496
      Top = 13
      Width = 51
      Height = 13
      Caption = 'N'#186'.Compra'
      Transparent = True
    end
    object DBText2: TDBText
      Left = 452
      Top = 53
      Width = 80
      Height = 22
      Alignment = taRightJustify
      AutoSize = True
      Color = clBtnFace
      DataField = 'PAG_NRPARCELA'
      DataSource = dsCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 532
      Top = 53
      Width = 5
      Height = 22
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 539
      Top = 53
      Width = 80
      Height = 22
      AutoSize = True
      Color = clBtnFace
      DataField = 'PAG_QTPARCELAS'
      DataSource = dsCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object cmbFornecedores: TDBLookupComboBox
      Left = 24
      Top = 32
      Width = 447
      Height = 21
      Color = clSilver
      DataField = 'PAG_NMFORN'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TabStop = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 596
    Height = 384
    Align = alClient
    TabOrder = 1
    object Label5: TLabel
      Left = 24
      Top = 8
      Width = 68
      Height = 13
      Caption = 'N'#186' Nota Fiscal'
      FocusControl = dbeNotaFiscal
      Transparent = True
    end
    object Label6: TLabel
      Left = 149
      Top = 8
      Width = 39
      Height = 13
      Caption = 'N'#186' S'#233'rie'
      FocusControl = dbeSerie
      Transparent = True
    end
    object Label7: TLabel
      Left = 191
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Data da Compra'
    end
    object Label8: TLabel
      Left = 24
      Top = 46
      Width = 43
      Height = 13
      Caption = 'Natureza'
      FocusControl = cmbNatureza
    end
    object Label9: TLabel
      Left = 24
      Top = 84
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = mmoDescricao
      Transparent = True
    end
    object Label10: TLabel
      Left = 24
      Top = 187
      Width = 100
      Height = 13
      Caption = 'Data de &Vencimento:'
      Transparent = True
    end
    object Label11: TLabel
      Left = 150
      Top = 187
      Width = 81
      Height = 13
      Caption = 'Valor da &Parcela:'
      FocusControl = dbeVALOR
      Transparent = True
    end
    object Label19: TLabel
      Left = 289
      Top = 187
      Width = 33
      Height = 13
      Caption = 'Atraso:'
      FocusControl = DBEdit5
    end
    object Label12: TLabel
      Left = 24
      Top = 224
      Width = 34
      Height = 13
      Caption = 'Banco:'
      Transparent = True
    end
    object Label13: TLabel
      Left = 196
      Top = 224
      Width = 42
      Height = 13
      Caption = 'Ag'#234'ncia:'
      FocusControl = dbeNRAGEN
      Transparent = True
    end
    object Label14: TLabel
      Left = 254
      Top = 224
      Width = 31
      Height = 13
      Caption = 'Conta:'
      FocusControl = dbeNRCONT
      Transparent = True
    end
    object Label15: TLabel
      Left = 369
      Top = 224
      Width = 58
      Height = 13
      Caption = 'N'#186'. Cheque:'
      FocusControl = dbeNRCHEQ
      Transparent = True
    end
    object Label16: TLabel
      Left = 24
      Top = 262
      Width = 75
      Height = 13
      Caption = 'Valor dos Juros:'
      FocusControl = dbeVLJURO
      Transparent = True
    end
    object Label17: TLabel
      Left = 150
      Top = 262
      Width = 49
      Height = 13
      Caption = 'Desconto:'
      FocusControl = dbeVLDESC
      Transparent = True
    end
    object Label18: TLabel
      Left = 289
      Top = 263
      Width = 83
      Height = 13
      Caption = 'Data Pagamento:'
      Transparent = True
    end
    object Label20: TLabel
      Left = 24
      Top = 301
      Width = 55
      Height = 13
      Caption = 'Valor Pago:'
      FocusControl = dbeVLPAGO
      Transparent = True
    end
    object lblModalidade: TLabel
      Left = 150
      Top = 301
      Width = 55
      Height = 13
      Caption = 'Modalidade'
      FocusControl = cmbModalidades
      Transparent = True
      Visible = False
    end
    object Label21: TLabel
      Left = 480
      Top = 5
      Width = 95
      Height = 13
      Caption = 'Valor da Parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbeNotaFiscal: TDBEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      DataField = 'PAG_NUMERONOTAFISCAL'
      DataSource = dsCadastro
      TabOrder = 0
    end
    object dbeSerie: TDBEdit
      Left = 149
      Top = 24
      Width = 40
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PAG_SERIENOTAFISCAL'
      DataSource = dsCadastro
      TabOrder = 1
    end
    object dbeDTCOMP: TDBDateEdit
      Left = 191
      Top = 24
      Width = 121
      Height = 21
      TabStop = False
      DataField = 'PAG_DTCOMPRA'
      DataSource = dsCadastro
      ReadOnly = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object cmbNatureza: TDBLookupComboBox
      Left = 24
      Top = 62
      Width = 288
      Height = 21
      DataField = 'PAG_NMNATU'
      DataSource = dsCadastro
      TabOrder = 3
    end
    object mmoDescricao: TDBMemo
      Left = 24
      Top = 100
      Width = 450
      Height = 85
      DataField = 'PAG_DESCRICAO'
      DataSource = dsCadastro
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object dbeVALOR: TDBEdit
      Left = 150
      Top = 202
      Width = 134
      Height = 21
      DataField = 'PAG_VALORPARCELA'
      DataSource = dsCadastro
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 289
      Top = 202
      Width = 66
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'PAG_ATRASO'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 7
    end
    object dbeNRAGEN: TDBEdit
      Left = 196
      Top = 240
      Width = 53
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PAG_AGENCIA'
      DataSource = dsCadastro
      TabOrder = 9
    end
    object dbeNRCONT: TDBEdit
      Left = 254
      Top = 240
      Width = 109
      Height = 21
      DataField = 'PAG_NRCONTA'
      DataSource = dsCadastro
      TabOrder = 10
      OnExit = dbeNRCONTExit
    end
    object dbeNRCHEQ: TDBEdit
      Left = 369
      Top = 240
      Width = 107
      Height = 21
      DataField = 'PAG_NRCHEQUE'
      DataSource = dsCadastro
      TabOrder = 11
      OnExit = dbeNRCHEQExit
    end
    object dbeVLJURO: TDBEdit
      Left = 24
      Top = 278
      Width = 121
      Height = 21
      DataField = 'PAG_VALORJUROS'
      DataSource = dsCadastro
      TabOrder = 12
      OnExit = dbeVLJUROExit
    end
    object dbeVLDESC: TDBEdit
      Left = 150
      Top = 278
      Width = 134
      Height = 21
      DataField = 'PAG_VALORDESCONTO'
      DataSource = dsCadastro
      TabOrder = 13
      OnExit = dbeVLDESCExit
    end
    object dbeVLPAGO: TDBEdit
      Left = 24
      Top = 317
      Width = 121
      Height = 21
      DataField = 'PAG_VALORPAGO'
      DataSource = dsCadastro
      TabOrder = 15
      OnExit = dbeVLPAGOExit
    end
    object dbeDTVENC: TDBDateEdit
      Left = 24
      Top = 202
      Width = 121
      Height = 21
      DataField = 'PAG_DTVENCIMENTO'
      DataSource = dsCadastro
      NumGlyphs = 2
      TabOrder = 5
      OnExit = dbeDTVENCExit
    end
    object dbeDTPAGA: TDBDateEdit
      Left = 289
      Top = 278
      Width = 121
      Height = 21
      DataField = 'PAG_DTPAGAMENTO'
      DataSource = dsCadastro
      NumGlyphs = 2
      TabOrder = 14
      OnExit = dbeDTPAGAExit
    end
    object cmbBancos: TDBLookupComboBox
      Left = 24
      Top = 240
      Width = 166
      Height = 21
      DataField = 'PAG_NMBANCO'
      DataSource = dsCadastro
      TabOrder = 8
    end
    object cmbModalidades: TDBLookupComboBox
      Left = 150
      Top = 317
      Width = 259
      Height = 21
      DataField = 'PAG_NMMODALIDADE'
      DataSource = dsCadastro
      TabOrder = 16
      Visible = False
    end
    object DBEdit1: TDBEdit
      Left = 432
      Top = 20
      Width = 144
      Height = 30
      TabStop = False
      Color = clSilver
      DataField = 'PAG_VALORPARCELA'
      DataSource = dsCadastro
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 473
    Width = 596
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object btOK: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Visible = False
      Kind = bkOK
    end
    object BtCancelar: TBitBtn
      Left = 474
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cancelar'
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtCancelarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
        0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
        0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
        1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
        3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
        5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
        2828281F05002828282828282828282828282817050713282828282828282828
        2828282817060715282828282828282828282828281507062328280004040404
        040404232828000701282802090807070707061B28282706062328040B090711
        2727272828282800071328060D070A07232828282828281C070128070E13020B
        082028282828281C0701280F101D28020D0818282828280107132816191E2828
        140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
        282827140808041B282828282828282828282828282828282828282828282828
        2828282828282828282828282828282828282828282828282828}
    end
    object BtGravar: TBitBtn
      Left = 389
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Gravar altera'#231#227'o'
      Caption = '&Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtGravarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000942929009431
        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
        33343433332505050B4848191516111B27384647452D0002131048191515111A
        05184046492E0102121048191515111C03032F42493200011210481915151120
        0601243A493200011210481915151221231D1F27322C04041310481915151515
        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
        4343434343434630130F4848092D3A363636363636363A2A0748}
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = dmFinanceiro.cdsContaPagar
    Left = 336
    Top = 224
  end
end
