object frmRelAniveriantes: TfrmRelAniveriantes
  Left = 221
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o de Clientes Aniversariantes'
  ClientHeight = 453
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 412
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 635
      Height = 64
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 9
        Width = 23
        Height = 13
        Caption = '&M'#234's:'
        FocusControl = cmbMeses
        Transparent = True
      end
      object cmbMeses: TComboBox
        Left = 14
        Top = 27
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        ItemHeight = 16
        TabOrder = 0
        Items.Strings = (
          'JANEIRO'
          'FEVEREIRO'
          'MAR'#199'O'
          'ABRIL'
          'MAIO'
          'JUNHO'
          'JULHO'
          'AGOSTO'
          'SETEMBRO'
          'OUTUBRO'
          'NOVEMBRO'
          'DEZEMBRO')
      end
      object btnConsultar: TBitBtn
        Left = 173
        Top = 25
        Width = 75
        Height = 25
        Caption = '&Consultar'
        TabOrder = 1
        OnClick = btnConsultarClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00840000008400
          0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000084000000840000008400000084000000FF00FF008400000000FF
          FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
          FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000000FFFF00840000008400000084000000FF00FF00840000008400
          00008400000084000000840000008400000084000000FF00FF00840000008400
          00008400000084000000840000008400000084000000FF00FF00840000008400
          000000FFFF0084000000840000008400000084000000840000008400000000FF
          FF008400000084000000840000008400000084000000FF00FF00840000008400
          000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
          FF008400000084000000840000008400000084000000FF00FF00840000008400
          000000FFFF00840000008400000084000000FF00FF00840000008400000000FF
          FF008400000084000000840000008400000084000000FF00FF00FF00FF008400
          0000840000008400000084000000840000008400000084000000840000008400
          000084000000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
          FF008400000000FFFF00840000008400000084000000FF00FF008400000000FF
          FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008400000084000000840000008400000084000000FF00FF00840000008400
          0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
          00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008400000000FFFF0084000000FF00FF00FF00FF00FF00FF008400
          000000FFFF0084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF008400
          00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
    object grdConsultar: TDBGrid
      Left = 1
      Top = 65
      Width = 635
      Height = 346
      Align = alClient
      Ctl3D = False
      DataSource = dsConsultar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DIA'
          Title.Alignment = taCenter
          Title.Caption = 'Dia'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Cliente'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 316
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_NASC'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 83
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Telefone'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 637
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BtSair: TBitBtn
      Left = 534
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar janela'
      Caption = '&Fechar'
      TabOrder = 2
      OnClick = BtSairClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BtImprimir: TBitBtn
      Left = 437
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB0000000000000000000000DBDBDBDB00DBDBDBDB
        DBDBDBDBDB00DB00DBDB00000000000000000000000000DB00DB00DBDBDBDBDB
        DBFCFCFCDBDB000000DB00DBDBDBDBDBDB929292DBDB00DB00DB000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00DB0000000000
        0000000000DB00DB0000DBDB00FFFFFFFFFFFFFFFF00DB00DB00DBDBDB00FF00
        00000000FF00000000DBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00FF
        0000000000FF00DBDBDBDBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00
        0000000000000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB}
    end
    object btnVisualizar: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
        73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
        8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
        9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
        A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
        AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
        BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
        D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
        E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
        F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
        424242424242424242422B39180B42424242424242424242424243443C180B42
        4242424242424242424242444438180B42424242424242424242424244433918
        0A424242424242424242424242444335004201101A114242424242424242453D
        05072F343434291942424242424242221A2D34343437403E0442424242424206
        231C303437404146284242424242421B210F30373A414140310D42424242421F
        20032434373A3A37321342424242421D25030F2D37373737311042424242420D
        2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
        4227312D21252314424242424242424242420E141B1B42424242}
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Cadastro de Cartas'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsDados
    Left = 276
    Top = 122
  end
  object datasetConsultar: TSQLDataSet
    CommandText = 
      'Select CLI_CODIGO, CLI_NOME, CLI_CPF, CLI_LOGRADOURO, CLI_NUMERO' +
      ', CLI_FONE1,'#13#10'CLI_CDBAIRRO, CLI_CDCIDADE, CLI_DTANIVERSARIO, CLI' +
      '_SITUACAO  from CLIENTES '#13#10'Where not (CLI_DTANIVERSARIO is null)' +
      ' and (CLI_SITUACAO = :pSITUACAO)'#13#10'order by CLI_DTANIVERSARIO  de' +
      'sc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 412
    Top = 128
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 452
    Top = 130
  end
  object cdsConsultar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSITUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultar'
    Left = 484
    Top = 130
    object cdsConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsConsultarCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object cdsConsultarCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      Size = 11
    end
    object cdsConsultarCLI_LOGRADOURO: TStringField
      FieldName = 'CLI_LOGRADOURO'
      Size = 50
    end
    object cdsConsultarCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
    end
    object cdsConsultarCLI_CDBAIRRO: TIntegerField
      FieldName = 'CLI_CDBAIRRO'
    end
    object cdsConsultarCLI_CDCIDADE: TIntegerField
      FieldName = 'CLI_CDCIDADE'
    end
    object cdsConsultarCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
    end
    object cdsConsultarCLI_FONE1: TStringField
      FieldName = 'CLI_FONE1'
      Size = 10
    end
    object cdsConsultarCLI_SITUACAO: TIntegerField
      FieldName = 'CLI_SITUACAO'
    end
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 120
    Data = {
      E80000009619E0BD010000001800000009000000000003000000E80006434F44
      49474F0400010000000000044E4F4D4501004900000001000557494454480200
      02003200034350460100490000000100055749445448020002000B0009444154
      415F4E41534304000600000000000344494104000100000000000854454C4546
      4F4E450100490000000100055749445448020002000D0008454E44455245434F
      0100490000000100055749445448020002003200064349444144450100490000
      0001000557494454480200020014000642414952524F01004900000001000557
      494454480200020014000000}
    object cdsDadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsDadosCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsDadosDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
    end
    object cdsDadosDIA: TIntegerField
      FieldName = 'DIA'
    end
    object cdsDadosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 13
    end
    object cdsDadosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsDadosCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object cdsDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 312
    Top = 184
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 233892
      mmPrintPosition = 0
      object ppImgLogo: TppImage
        UserName = 'ImgLogo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 30692
        mmLeft = 5821
        mmTop = 3969
        mmWidth = 44186
        BandType = 0
      end
      object txtTitulo: TppLabel
        UserName = 'txtTitulo'
        Caption = 'T'#205'TULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6646
        mmLeft = 79375
        mmTop = 9525
        mmWidth = 20278
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 39158
        mmWidth = 195527
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CLI_NOME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 56092
        mmWidth = 133615
        BandType = 0
      end
      object txtTexto: TppMemo
        UserName = 'txtTexto'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 164836
        mmLeft = 20638
        mmTop = 66675
        mmWidth = 160602
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object txtDia: TppLabel
        UserName = 'txtDia'
        Caption = 'DIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 159544
        mmTop = 44450
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object txtRodape: TppLabel
        UserName = 'txtRodape'
        Caption = 'txtRodape'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 18785
        mmTop = 11113
        mmWidth = 160338
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsCliente
    UserName = 'DBPipeline1'
    Left = 360
    Top = 184
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CODIGO'
      FieldName = 'CLI_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'CLI_NOME'
      FieldName = 'CLI_NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'CLI_CPF'
      FieldName = 'CLI_CPF'
      FieldLength = 11
      DisplayWidth = 11
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'CLI_LOGRADOURO'
      FieldName = 'CLI_LOGRADOURO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_NUMERO'
      FieldName = 'CLI_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'CLI_COMPLEMENTO'
      FieldName = 'CLI_COMPLEMENTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'CLI_CEP'
      FieldName = 'CLI_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CDBAIRRO'
      FieldName = 'CLI_CDBAIRRO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_CDCIDADE'
      FieldName = 'CLI_CDCIDADE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'CLI_UFCLIENTE'
      FieldName = 'CLI_UFCLIENTE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'CLI_FONE1'
      FieldName = 'CLI_FONE1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'CLI_FONE2'
      FieldName = 'CLI_FONE2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'CLI_CELULAR'
      FieldName = 'CLI_CELULAR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'CLI_IDENTIDADE'
      FieldName = 'CLI_IDENTIDADE'
      FieldLength = 14
      DisplayWidth = 14
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'CLI_ORGAOEMISSOR'
      FieldName = 'CLI_ORGAOEMISSOR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'CLI_UFEMISSOR'
      FieldName = 'CLI_UFEMISSOR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_ESTADO_CIVIL'
      FieldName = 'CLI_ESTADO_CIVIL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'CLI_SEXO'
      FieldName = 'CLI_SEXO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_SITUACAO'
      FieldName = 'CLI_SITUACAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'CLI_EMAIL'
      FieldName = 'CLI_EMAIL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object ppDBPipeline1ppField21: TppField
      FieldAlias = 'CLI_DTANIVERSARIO'
      FieldName = 'CLI_DTANIVERSARIO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 20
    end
    object ppDBPipeline1ppField22: TppField
      FieldAlias = 'CLI_NOME_PAI'
      FieldName = 'CLI_NOME_PAI'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
    object ppDBPipeline1ppField23: TppField
      FieldAlias = 'CLI_NOME_MAE'
      FieldName = 'CLI_NOME_MAE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = 'CLI_DTCADASTRO'
      FieldName = 'CLI_DTCADASTRO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 23
    end
    object ppDBPipeline1ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_USUARIO_INC'
      FieldName = 'CLI_USUARIO_INC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = 'CLI_HORA_INC'
      FieldName = 'CLI_HORA_INC'
      FieldLength = 5
      DisplayWidth = 5
      Position = 25
    end
    object ppDBPipeline1ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLI_USUARIO_ALT'
      FieldName = 'CLI_USUARIO_ALT'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object ppDBPipeline1ppField28: TppField
      FieldAlias = 'CLI_DATA_ALT'
      FieldName = 'CLI_DATA_ALT'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 27
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = 'CLI_HORA_ALT'
      FieldName = 'CLI_HORA_ALT'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppDBPipeline1ppField30: TppField
      FieldAlias = 'CLI_FOTOCLIENTE'
      FieldName = 'CLI_FOTOCLIENTE'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField31: TppField
      FieldAlias = 'CLI_OBSERVACAO'
      FieldName = 'CLI_OBSERVACAO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField32: TppField
      FieldAlias = 'CLI_NMCIDADE'
      FieldName = 'CLI_NMCIDADE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object ppDBPipeline1ppField33: TppField
      FieldAlias = 'CLI_NMBAIRRO'
      FieldName = 'CLI_NMBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 32
    end
    object ppDBPipeline1ppField34: TppField
      FieldAlias = 'CLI_NMEST_CIVIL'
      FieldName = 'CLI_NMEST_CIVIL'
      FieldLength = 15
      DisplayWidth = 15
      Position = 33
    end
    object ppDBPipeline1ppField35: TppField
      FieldAlias = 'CLI_NMSITUACAO'
      FieldName = 'CLI_NMSITUACAO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 34
    end
  end
  object dsCliente: TDataSource
    DataSet = dmDados.cdsCliente
    Left = 408
    Top = 184
  end
end
