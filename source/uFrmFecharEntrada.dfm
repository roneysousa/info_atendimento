object frmFecharEntrada: TfrmFecharEntrada
  Left = 173
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Entrada de Mercadorias'
  ClientHeight = 371
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 330
    Align = alClient
    TabOrder = 0
    object Label8: TLabel
      Left = 29
      Top = 56
      Width = 114
      Height = 13
      Caption = 'Valores da Mercadorias:'
      Transparent = True
    end
    object Label9: TLabel
      Left = 29
      Top = 94
      Width = 77
      Height = 13
      Caption = 'B. Calculo ICMS'
      Transparent = True
    end
    object Label10: TLabel
      Left = 312
      Top = 94
      Width = 68
      Height = 13
      Caption = 'Valor do ICMS'
      Transparent = True
    end
    object Label11: TLabel
      Left = 29
      Top = 131
      Width = 71
      Height = 13
      Caption = 'B. Substitui'#231#227'o'
      Transparent = True
    end
    object Label12: TLabel
      Left = 312
      Top = 131
      Width = 100
      Height = 13
      Caption = 'Valor de Substitui'#231#227'o'
      Transparent = True
    end
    object Label13: TLabel
      Left = 29
      Top = 167
      Width = 48
      Height = 13
      Caption = 'Tipo Frete'
      Transparent = True
    end
    object Label14: TLabel
      Left = 312
      Top = 167
      Width = 66
      Height = 13
      Caption = 'Valor do Frete'
      Transparent = True
    end
    object Label15: TLabel
      Left = 29
      Top = 205
      Width = 55
      Height = 13
      Caption = 'Valor do IPI'
      Transparent = True
    end
    object Label16: TLabel
      Left = 312
      Top = 205
      Width = 76
      Height = 13
      Caption = 'Valor do Seguro'
      Transparent = True
    end
    object Label17: TLabel
      Left = 29
      Top = 242
      Width = 81
      Height = 13
      Caption = 'Outras Despesas'
      Transparent = True
    end
    object Label18: TLabel
      Left = 312
      Top = 242
      Width = 93
      Height = 13
      Caption = 'Desconto/Repasse'
      Transparent = True
    end
    object Label19: TLabel
      Left = 29
      Top = 280
      Width = 65
      Height = 13
      Caption = 'Valor da Nota'
      Transparent = True
    end
    object Label20: TLabel
      Left = 29
      Top = 17
      Width = 75
      Height = 13
      Caption = 'Transportadora:'
      Transparent = True
    end
    object spTransportadora: TSpeedButton
      Left = 148
      Top = 33
      Width = 23
      Height = 22
      Hint = 'Localizar Transportadora'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777770077777777777770FF077777777777077FF07777
        7777770777FF077777777770777FFF00777777790777F1111077777790771117
        0B77777770799170B77777777709990B77777777770990B77777777777090B77
        777777777770B777777777777777777777777777777777777777}
      OnClick = spTransportadoraClick
    end
    object Label5: TLabel
      Left = 224
      Top = 405
      Width = 65
      Height = 13
      Caption = 'Data Emiss'#227'o'
      Transparent = True
    end
    object Label4: TLabel
      Left = 224
      Top = 426
      Width = 59
      Height = 13
      Caption = 'Data Pedido'
      Transparent = True
    end
    object edtVLMERC: TCurrencyEdit
      Left = 29
      Top = 71
      Width = 200
      Height = 21
      TabStop = False
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      ReadOnly = True
      TabOrder = 1
      OnExit = edtVLMERCExit
    end
    object edtBASEICMS: TCurrencyEdit
      Left = 29
      Top = 108
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 2
    end
    object edtBASESUBS: TCurrencyEdit
      Left = 29
      Top = 144
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 4
    end
    object edtVLSUBST: TCurrencyEdit
      Left = 312
      Top = 144
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 5
      OnExit = edtVLSUBSTExit
    end
    object cmbTPFRETE: TComboBox
      Left = 29
      Top = 181
      Width = 200
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 6
      Items.Strings = (
        'CIF'
        'FOB')
    end
    object edtVLFRETE: TCurrencyEdit
      Left = 312
      Top = 181
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 7
    end
    object edtVLIPI: TCurrencyEdit
      Left = 29
      Top = 219
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 8
      OnExit = edtVLIPIExit
    end
    object edtVLSEGURO: TCurrencyEdit
      Left = 312
      Top = 219
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 9
      OnExit = edtVLSEGUROExit
    end
    object edtDespesas: TCurrencyEdit
      Left = 29
      Top = 257
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 10
      OnExit = edtDespesasExit
    end
    object edtDesconto: TCurrencyEdit
      Left = 312
      Top = 257
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 11
      OnExit = edtDescontoExit
    end
    object edtVLNOTA: TCurrencyEdit
      Left = 29
      Top = 295
      Width = 200
      Height = 21
      TabStop = False
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      ReadOnly = True
      TabOrder = 12
      OnExit = edtVLNOTAExit
    end
    object edtVLICMS: TCurrencyEdit
      Left = 312
      Top = 108
      Width = 200
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00;-0.00'
      TabOrder = 3
    end
    object edtCDTRANSP: TEdit
      Left = 29
      Top = 33
      Width = 120
      Height = 21
      MaxLength = 5
      TabOrder = 0
      OnChange = edtCDTRANSPChange
      OnExit = edtCDTRANSPExit
      OnKeyPress = edtCDTRANSPKeyPress
    end
    object dbeDTPEDI: TMaskEdit
      Left = 308
      Top = 420
      Width = 118
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 13
      Text = '  /  /    '
    end
    object dbeDTEMISS: TMaskEdit
      Left = 308
      Top = 397
      Width = 119
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 14
      Text = '  /  /    '
    end
    object lbl_Transportadora: TEdit
      Left = 176
      Top = 33
      Width = 337
      Height = 21
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 330
    Width = 542
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = -1
      Width = 540
      Height = 41
      Align = alBottom
      Color = clNavy
      TabOrder = 0
      object BtCancelar: TBitBtn
        Left = 357
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
        Left = 445
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Gravar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
  end
  object cdsEntrada: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 8
    Data = {
      730100009619E0BD01000000180000000D00000000000300000073010A454E54
      5F4E554D45524F040001000000000008454E545F4C4F4A410400010000000000
      0A4C4F4A5F4E4D4C4F4A4101004900000001000557494454480200020028000A
      464F525F434F4449474F040001000000000012454E545F5452414E53504F5254
      41444F5241040001000000000008464F525F4E4F4D4501004900000001000557
      494454480200020028000C454E545F445450454449444F04000600000000000D
      454E545F4454454D495353414F040006000000000011454E545F445452454345
      42494D454E544F04000600000000000A454E545F4E524E4F5441040001000000
      00000D454E545F53455249454E4F544101004900000001000557494454480200
      0200020013454E545F56414C4F524D45524341444F5249410800040000000100
      07535542545950450200490006004D6F6E6579000C454E545F4E4D5452414E53
      5001004900000001000557494454480200020028000000}
    object cdsEntradaENT_NUMERO: TIntegerField
      FieldName = 'ENT_NUMERO'
    end
    object cdsEntradaENT_LOJA: TIntegerField
      FieldName = 'ENT_LOJA'
    end
    object cdsEntradaLOJ_NMLOJA: TStringField
      FieldName = 'LOJ_NMLOJA'
      Size = 40
    end
    object cdsEntradaFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
    end
    object cdsEntradaENT_TRANSPORTADORA: TIntegerField
      FieldName = 'ENT_TRANSPORTADORA'
    end
    object cdsEntradaFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      Size = 40
    end
    object cdsEntradaENT_DTPEDIDO: TDateField
      FieldName = 'ENT_DTPEDIDO'
    end
    object cdsEntradaENT_DTEMISSAO: TDateField
      FieldName = 'ENT_DTEMISSAO'
    end
    object cdsEntradaENT_DTRECEBIMENTO: TDateField
      FieldName = 'ENT_DTRECEBIMENTO'
    end
    object cdsEntradaENT_NRNOTA: TIntegerField
      FieldName = 'ENT_NRNOTA'
    end
    object cdsEntradaENT_SERIENOTA: TStringField
      FieldName = 'ENT_SERIENOTA'
      Size = 2
    end
    object cdsEntradaENT_VALORMERCADORIA: TCurrencyField
      FieldName = 'ENT_VALORMERCADORIA'
    end
    object cdsEntradaENT_NMTRANSP: TStringField
      FieldName = 'ENT_NMTRANSP'
      Size = 40
    end
  end
  object qryProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select PRO_CODIGO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA '
      'from PRODUTOS Where (PRO_CODIGO = :pCODIGO)')
    Left = 456
    Top = 8
  end
end
