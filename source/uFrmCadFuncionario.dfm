inherited frmCadFuncionario: TfrmCadFuncionario
  Left = 241
  Top = 157
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 480
  ClientWidth = 643
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 643
    Height = 461
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        Width = 5
        DataField = 'FUN_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 424
        Top = 56
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = dbeCPF
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 96
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit3
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 482
        Top = 96
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
        FocusControl = DBEdit4
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 16
        Top = 136
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = cmbCidade
        Transparent = True
      end
      object Label10: TLabel [7]
        Left = 209
        Top = 136
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object Label7: TLabel [8]
        Left = 264
        Top = 136
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = cmbBairro
        Transparent = True
      end
      object Label8: TLabel [9]
        Left = 16
        Top = 176
        Width = 50
        Height = 13
        Caption = 'Identidade'
        FocusControl = dbeIdentidade
        Transparent = True
      end
      object Label9: TLabel [10]
        Left = 141
        Top = 176
        Width = 71
        Height = 13
        Caption = #211'rg'#227'o Emiss'#227'o'
        FocusControl = dbeOrgao
        Transparent = True
      end
      object Label11: TLabel [11]
        Left = 238
        Top = 176
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object Label12: TLabel [12]
        Left = 427
        Top = 175
        Width = 55
        Height = 13
        Caption = 'Estado Civil'
        FocusControl = DBLookupComboBox3
        Transparent = True
      end
      object Label15: TLabel [13]
        Left = 16
        Top = 216
        Width = 97
        Height = 13
        Caption = 'Data de Nascimento'
        FocusControl = dbeDataNasc
        Transparent = True
      end
      object Label13: TLabel [14]
        Left = 141
        Top = 216
        Width = 68
        Height = 13
        Caption = 'Data Cadastro'
        FocusControl = dbeDTCADA
        Transparent = True
      end
      object Label14: TLabel [15]
        Left = 264
        Top = 216
        Width = 86
        Height = 13
        Caption = 'Data de Admiss'#227'o'
        FocusControl = dbeDTADMI
        Transparent = True
      end
      object Label16: TLabel [16]
        Left = 16
        Top = 336
        Width = 28
        Height = 13
        Caption = 'Cargo'
        FocusControl = cmbCargo
        Transparent = True
      end
      object Label17: TLabel [17]
        Left = 16
        Top = 256
        Width = 46
        Height = 13
        Caption = 'Nome Pai'
        FocusControl = DBEdit5
        Transparent = True
      end
      object Label18: TLabel [18]
        Left = 16
        Top = 296
        Width = 52
        Height = 13
        Caption = 'Nome M'#227'e'
        FocusControl = DBEdit6
        Transparent = True
      end
      object Label19: TLabel [19]
        Left = 196
        Top = 336
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit7
      end
      object Label20: TLabel [20]
        Left = 321
        Top = 336
        Width = 32
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit8
      end
      object Label21: TLabel [21]
        Left = 448
        Top = 336
        Width = 42
        Height = 13
        Caption = 'Situa'#231#227'o'
        FocusControl = cmbSituacao
        Transparent = True
      end
      object Label22: TLabel [22]
        Left = 462
        Top = 136
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit1
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 392
        Width = 635
        inherited BtGravar: TBitBtn
          Left = 274
        end
        inherited BtCancelar: TBitBtn
          Left = 355
        end
        inherited BtSair: TBitBtn
          Left = 550
        end
        object BtImprimir: TBitBtn
          Left = 454
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
          TabOrder = 6
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
      end
      object dbeNome: TDBEdit
        Left = 16
        Top = 72
        Width = 399
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_NOME'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeCPF: TDBEdit
        Left = 424
        Top = 72
        Width = 147
        Height = 21
        DataField = 'FUN_CPF'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 2
        OnExit = dbeCPFExit
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 112
        Width = 457
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_ENDERECO'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 482
        Top = 112
        Width = 89
        Height = 21
        DataField = 'FUN_NUMERO'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object cmbCidade: TDBLookupComboBox
        Left = 16
        Top = 152
        Width = 185
        Height = 21
        DataField = 'FUN_NMCIDADE'
        DataSource = dsCadastro
        TabOrder = 5
        OnExit = cmbCidadeExit
      end
      object cmbUF: TDBComboBox
        Left = 207
        Top = 152
        Width = 49
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        DataField = 'FUN_UFFUNC'
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
        TabOrder = 6
      end
      object cmbBairro: TDBLookupComboBox
        Left = 264
        Top = 152
        Width = 193
        Height = 21
        DataField = 'FUN_NMBAIRRO'
        DataSource = dsCadastro
        TabOrder = 7
      end
      object dbeIdentidade: TDBEdit
        Left = 16
        Top = 192
        Width = 117
        Height = 21
        DataField = 'FUN_IDENTIDADE'
        DataSource = dsCadastro
        TabOrder = 9
        OnKeyPress = dbeIdentidadeKeyPress
      end
      object dbeOrgao: TDBEdit
        Left = 141
        Top = 192
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_ORIDEN'
        DataSource = dsCadastro
        TabOrder = 10
      end
      object cmbUFEmissor: TDBComboBox
        Left = 207
        Top = 192
        Width = 49
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        DataField = 'FUN_UFIDEN'
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
        TabOrder = 11
      end
      object rbSexo: TDBRadioGroup
        Left = 264
        Top = 179
        Width = 153
        Height = 39
        Caption = '[ Sexo ] '
        Columns = 2
        DataField = 'FUN_SEXO'
        DataSource = dsCadastro
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 12
        Values.Strings = (
          'M'
          'F')
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 427
        Top = 192
        Width = 144
        Height = 21
        DataField = 'FUN_NMESTCIVIL'
        DataSource = dsCadastro
        TabOrder = 13
      end
      object dbeDataNasc: TDBDateEdit
        Left = 16
        Top = 232
        Width = 117
        Height = 21
        DataField = 'FUN_DTNASCIMENTO'
        DataSource = dsCadastro
        NumGlyphs = 2
        TabOrder = 14
        OnExit = dbeDataNascExit
      end
      object dbeDTCADA: TDBDateEdit
        Left = 141
        Top = 232
        Width = 117
        Height = 21
        DataField = 'FUN_DTCADA'
        DataSource = dsCadastro
        ReadOnly = True
        NumGlyphs = 2
        TabOrder = 15
      end
      object dbeDTADMI: TDBDateEdit
        Left = 264
        Top = 232
        Width = 117
        Height = 21
        DataField = 'FUN_DTADMICAO'
        DataSource = dsCadastro
        NumGlyphs = 2
        TabOrder = 16
        OnExit = dbeDTADMIExit
      end
      object cmbCargo: TDBLookupComboBox
        Left = 16
        Top = 352
        Width = 176
        Height = 21
        DataField = 'FUN_NMCARGO'
        DataSource = dsCadastro
        TabOrder = 19
      end
      object DBEdit5: TDBEdit
        Left = 16
        Top = 272
        Width = 554
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_NOMPAI'
        DataSource = dsCadastro
        TabOrder = 17
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 312
        Width = 554
        Height = 21
        CharCase = ecUpperCase
        DataField = 'FUN_NOMMAE'
        DataSource = dsCadastro
        TabOrder = 18
      end
      object DBEdit7: TDBEdit
        Left = 196
        Top = 352
        Width = 121
        Height = 21
        DataField = 'FUN_FONE'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 20
      end
      object DBEdit8: TDBEdit
        Left = 321
        Top = 352
        Width = 121
        Height = 21
        DataField = 'FUN_CELULAR'
        DataSource = dsCadastro
        MaxLength = 14
        TabOrder = 21
      end
      object cmbSituacao: TDBLookupComboBox
        Left = 448
        Top = 352
        Width = 122
        Height = 21
        DataField = 'FUN_NMSITUACAO'
        DataSource = dsCadastro
        TabOrder = 22
      end
      object DBEdit1: TDBEdit
        Left = 462
        Top = 152
        Width = 108
        Height = 21
        DataField = 'FUN_CEP'
        DataSource = dsCadastro
        MaxLength = 9
        TabOrder = 8
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        Width = 635
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Left = 601
        Height = 360
      end
      inherited grdConsultar: TDBGrid
        Width = 601
        Height = 360
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'FUN_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FUN_NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 309
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FUN_FONE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Telefone'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 461
    Width = 643
  end
  inherited dsConsultar: TDataSource
    Left = 204
    Top = 74
  end
  inherited dspConsultar: TDataSetProvider
    Left = 388
    Top = 18
  end
  inherited cdsConsultar: TClientDataSet
    Left = 460
    Top = 18
    object cdsConsultarFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
      DisplayFormat = '00000'
      EditFormat = '00000'
    end
    object cdsConsultarFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsConsultarFUN_FONE: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_FONE'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsFuncionario
    Left = 236
    Top = 40
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select FUN_CODIGO, FUN_NOME, FUN_FONE from FUNCIONARIOS'
    Left = 300
    Top = 16
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
    Left = 476
    Top = 256
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41010
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
      object txtCabecalho: TppMemo
        UserName = 'txtCabecalho'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 16404
        mmLeft = 53446
        mmTop = 5821
        mmWidth = 137054
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Ficha de Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6646
        mmLeft = 76729
        mmTop = 27517
        mmWidth = 56557
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 38894
        mmWidth = 195527
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 133615
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FUN_CODIGO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 7673
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'FUN_NOME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 17198
        mmWidth = 102129
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 2910
        mmWidth = 13335
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 12171
        mmWidth = 10964
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 111919
        mmTop = 12171
        mmWidth = 8213
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 21960
        mmWidth = 17187
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FUN_ENDERECO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 26988
        mmWidth = 91017
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FUN_NUMERO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 26988
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Cidade/UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 31750
        mmWidth = 18584
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'FUN_NMCIDADE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 36513
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'FUN_UFFUNC'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 41275
        mmTop = 36513
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'FUN_NMBAIRRO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 50006
        mmTop = 36777
        mmWidth = 51329
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 50006
        mmTop = 31750
        mmWidth = 11515
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Identidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 42863
        mmWidth = 17611
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = #211'rg'#227'o Emiss'#227'o/UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 50006
        mmTop = 42863
        mmWidth = 31454
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'FUN_IDENTIDADE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 47890
        mmWidth = 42598
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FUN_ORIDEN'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 50271
        mmTop = 47890
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FUN_UFIDEN'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 68263
        mmTop = 47625
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 54504
        mmWidth = 20151
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 11377
        mmLeft = 95779
        mmTop = 41804
        mmWidth = 60325
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 97367
        mmTop = 42598
        mmWidth = 8382
        BandType = 4
      end
      object myCbxMasc: TmyCheckBox
        UserName = 'CbxMasc'
        Checked = False
        Style = csXInBox
        Transparent = True
        mmHeight = 6350
        mmLeft = 97102
        mmTop = 46831
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label13'
        Caption = 'Masculino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 103981
        mmTop = 47890
        mmWidth = 15875
        BandType = 4
      end
      object myCbxFem: TmyCheckBox
        UserName = 'CbxMasc1'
        Checked = False
        Style = csXInBox
        Transparent = True
        mmHeight = 6350
        mmLeft = 129382
        mmTop = 46831
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Feminino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 134673
        mmTop = 47890
        mmWidth = 14478
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Data Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 50271
        mmTop = 54504
        mmWidth = 28533
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Data Admiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 95779
        mmTop = 54504
        mmWidth = 25273
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Nome do Pai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 65088
        mmWidth = 21294
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Nome do M'#227'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 75142
        mmWidth = 22945
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 84667
        mmWidth = 10160
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 94456
        mmWidth = 14520
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Celular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 104246
        mmWidth = 11896
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label14'
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5556
        mmTop = 114036
        mmWidth = 14647
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FUN_NMESTCIVIL'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 59796
        mmWidth = 43392
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'FUN_DTNASCIMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 50536
        mmTop = 59796
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'FUN_DTADMICAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 95515
        mmTop = 59796
        mmWidth = 34660
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'FUN_NOMPAI'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 69850
        mmWidth = 102129
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'FUN_NOMMAE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 79904
        mmWidth = 102129
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'FUN_NMCARGO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 89429
        mmWidth = 102129
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'FUN_NMSITUACAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 118798
        mmWidth = 46567
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label21'
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 111919
        mmTop = 31750
        mmWidth = 7197
        BandType = 4
      end
      object txtCPF: TppLabel
        UserName = 'Label23'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 17198
        mmWidth = 44715
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label24'
        Caption = 'N'#250'mero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 111919
        mmTop = 21960
        mmWidth = 14478
        BandType = 4
      end
      object txtCEP: TppLabel
        UserName = 'Label25'
        Caption = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 36777
        mmWidth = 26458
        BandType = 4
      end
      object txtFONE: TppLabel
        UserName = 'txtFONE'
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 99484
        mmWidth = 974
        BandType = 4
      end
      object txtCELULAR: TppLabel
        UserName = 'txtFONE1'
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 109273
        mmWidth = 974
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 138113
        mmTop = 3969
        mmWidth = 16976
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 138113
        mmTop = 8731
        mmWidth = 11853
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 156369
        mmTop = 8731
        mmWidth = 1947
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 156369
        mmTop = 3969
        mmWidth = 32015
        BandType = 8
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsCadastro
    UserName = 'DBPipeline1'
    Left = 508
    Top = 256
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_CODIGO'
      FieldName = 'FUN_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'FUN_NOME'
      FieldName = 'FUN_NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'FUN_ENDERECO'
      FieldName = 'FUN_ENDERECO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'FUN_BAIRRO'
      FieldName = 'FUN_BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'FUN_CIDADE'
      FieldName = 'FUN_CIDADE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'FUN_UFFUNC'
      FieldName = 'FUN_UFFUNC'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'FUN_NATUREZA'
      FieldName = 'FUN_NATUREZA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'FUN_CEP'
      FieldName = 'FUN_CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'FUN_FONE'
      FieldName = 'FUN_FONE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_TPFUNC'
      FieldName = 'FUN_TPFUNC'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_PECOMI'
      FieldName = 'FUN_PECOMI'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'FUN_DTNASCIMENTO'
      FieldName = 'FUN_DTNASCIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'FUN_DTADMICAO'
      FieldName = 'FUN_DTADMICAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'FUN_DTDEMICAO'
      FieldName = 'FUN_DTDEMICAO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_VLDEBITO'
      FieldName = 'FUN_VLDEBITO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'FUN_CPF'
      FieldName = 'FUN_CPF'
      FieldLength = 11
      DisplayWidth = 11
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'FUN_IDENTIDADE'
      FieldName = 'FUN_IDENTIDADE'
      FieldLength = 11
      DisplayWidth = 11
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'FUN_ORIDEN'
      FieldName = 'FUN_ORIDEN'
      FieldLength = 4
      DisplayWidth = 4
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'FUN_UFIDEN'
      FieldName = 'FUN_UFIDEN'
      FieldLength = 2
      DisplayWidth = 2
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'FUN_NRCART'
      FieldName = 'FUN_NRCART'
      FieldLength = 7
      DisplayWidth = 7
      Position = 19
    end
    object ppDBPipeline1ppField21: TppField
      FieldAlias = 'FUN_SECART'
      FieldName = 'FUN_SECART'
      FieldLength = 7
      DisplayWidth = 7
      Position = 20
    end
    object ppDBPipeline1ppField22: TppField
      FieldAlias = 'FUN_UFCART'
      FieldName = 'FUN_UFCART'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object ppDBPipeline1ppField23: TppField
      FieldAlias = 'FUN_CAREMI'
      FieldName = 'FUN_CAREMI'
      FieldLength = 8
      DisplayWidth = 8
      Position = 22
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = 'FUN_TITULO'
      FieldName = 'FUN_TITULO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 23
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = 'FUN_CDSECA'
      FieldName = 'FUN_CDSECA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 24
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = 'FUN_CDZONA'
      FieldName = 'FUN_CDZONA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 25
    end
    object ppDBPipeline1ppField27: TppField
      FieldAlias = 'FUN_ESTCIVIL'
      FieldName = 'FUN_ESTCIVIL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object ppDBPipeline1ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_VLSALA'
      FieldName = 'FUN_VLSALA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 27
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = 'FUN_LIONIB'
      FieldName = 'FUN_LIONIB'
      FieldLength = 20
      DisplayWidth = 20
      Position = 28
    end
    object ppDBPipeline1ppField30: TppField
      FieldAlias = 'FUN_HOENT1'
      FieldName = 'FUN_HOENT1'
      FieldLength = 4
      DisplayWidth = 4
      Position = 29
    end
    object ppDBPipeline1ppField31: TppField
      FieldAlias = 'FUN_HOSAI1'
      FieldName = 'FUN_HOSAI1'
      FieldLength = 4
      DisplayWidth = 4
      Position = 30
    end
    object ppDBPipeline1ppField32: TppField
      FieldAlias = 'FUN_HOENT2'
      FieldName = 'FUN_HOENT2'
      FieldLength = 4
      DisplayWidth = 4
      Position = 31
    end
    object ppDBPipeline1ppField33: TppField
      FieldAlias = 'FUN_HOSAI2'
      FieldName = 'FUN_HOSAI2'
      FieldLength = 4
      DisplayWidth = 4
      Position = 32
    end
    object ppDBPipeline1ppField34: TppField
      FieldAlias = 'FUN_NOMPAI'
      FieldName = 'FUN_NOMPAI'
      FieldLength = 40
      DisplayWidth = 40
      Position = 33
    end
    object ppDBPipeline1ppField35: TppField
      FieldAlias = 'FUN_NOMMAE'
      FieldName = 'FUN_NOMMAE'
      FieldLength = 40
      DisplayWidth = 40
      Position = 34
    end
    object ppDBPipeline1ppField36: TppField
      FieldAlias = 'FUN_COMPO1'
      FieldName = 'FUN_COMPO1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 35
    end
    object ppDBPipeline1ppField37: TppField
      FieldAlias = 'FUN_COMPO2'
      FieldName = 'FUN_COMPO2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 36
    end
    object ppDBPipeline1ppField38: TppField
      FieldAlias = 'FUN_COMPO3'
      FieldName = 'FUN_COMPO3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 37
    end
    object ppDBPipeline1ppField39: TppField
      FieldAlias = 'FUN_ASSID1'
      FieldName = 'FUN_ASSID1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 38
    end
    object ppDBPipeline1ppField40: TppField
      FieldAlias = 'FUN_ASSID2'
      FieldName = 'FUN_ASSID2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 39
    end
    object ppDBPipeline1ppField41: TppField
      FieldAlias = 'FUN_ASSID3'
      FieldName = 'FUN_ASSID3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 40
    end
    object ppDBPipeline1ppField42: TppField
      FieldAlias = 'FUN_HONES1'
      FieldName = 'FUN_HONES1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 41
    end
    object ppDBPipeline1ppField43: TppField
      FieldAlias = 'FUN_HONES2'
      FieldName = 'FUN_HONES2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 42
    end
    object ppDBPipeline1ppField44: TppField
      FieldAlias = 'FUN_HONES3'
      FieldName = 'FUN_HONES3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 43
    end
    object ppDBPipeline1ppField45: TppField
      FieldAlias = 'FUN_CARAT1'
      FieldName = 'FUN_CARAT1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 44
    end
    object ppDBPipeline1ppField46: TppField
      FieldAlias = 'FUN_CARAT2'
      FieldName = 'FUN_CARAT2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 45
    end
    object ppDBPipeline1ppField47: TppField
      FieldAlias = 'FUN_CARAT3'
      FieldName = 'FUN_CARAT3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 46
    end
    object ppDBPipeline1ppField48: TppField
      FieldAlias = 'FUN_FUNCAO'
      FieldName = 'FUN_FUNCAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 47
    end
    object ppDBPipeline1ppField49: TppField
      FieldAlias = 'FUN_RGEMIS'
      FieldName = 'FUN_RGEMIS'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 48
    end
    object ppDBPipeline1ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_CDCARGO'
      FieldName = 'FUN_CDCARGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 49
    end
    object ppDBPipeline1ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_ESTADOCIVIL'
      FieldName = 'FUN_ESTADOCIVIL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 50
    end
    object ppDBPipeline1ppField52: TppField
      FieldAlias = 'FUN_DTCADA'
      FieldName = 'FUN_DTCADA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 51
    end
    object ppDBPipeline1ppField53: TppField
      FieldAlias = 'FUN_HOCADA'
      FieldName = 'FUN_HOCADA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 52
    end
    object ppDBPipeline1ppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_USUARIO_CAD'
      FieldName = 'FUN_USUARIO_CAD'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 53
    end
    object ppDBPipeline1ppField55: TppField
      FieldAlias = 'FUN_DTALTE'
      FieldName = 'FUN_DTALTE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 54
    end
    object ppDBPipeline1ppField56: TppField
      FieldAlias = 'FUN_HOALTE'
      FieldName = 'FUN_HOALTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 55
    end
    object ppDBPipeline1ppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_USUARIO_ALT'
      FieldName = 'FUN_USUARIO_ALT'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 56
    end
    object ppDBPipeline1ppField58: TppField
      FieldAlias = 'FUN_NMEST_CIVIL'
      FieldName = 'FUN_NMEST_CIVIL'
      FieldLength = 15
      DisplayWidth = 15
      Position = 57
    end
    object ppDBPipeline1ppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_NUMERO'
      FieldName = 'FUN_NUMERO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 58
    end
    object ppDBPipeline1ppField60: TppField
      FieldAlias = 'FUN_NMCIDADE'
      FieldName = 'FUN_NMCIDADE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 59
    end
    object ppDBPipeline1ppField61: TppField
      FieldAlias = 'FUN_NMBAIRRO'
      FieldName = 'FUN_NMBAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 60
    end
    object ppDBPipeline1ppField62: TppField
      FieldAlias = 'FUN_NMESTCIVIL'
      FieldName = 'FUN_NMESTCIVIL'
      FieldLength = 15
      DisplayWidth = 15
      Position = 61
    end
    object ppDBPipeline1ppField63: TppField
      FieldAlias = 'FUN_SEXO'
      FieldName = 'FUN_SEXO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 62
    end
    object ppDBPipeline1ppField64: TppField
      FieldAlias = 'FUN_NMCARGO'
      FieldName = 'FUN_NMCARGO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 63
    end
    object ppDBPipeline1ppField65: TppField
      FieldAlias = 'FUN_CELULAR'
      FieldName = 'FUN_CELULAR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 64
    end
    object ppDBPipeline1ppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_SITUACAO'
      FieldName = 'FUN_SITUACAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 65
    end
    object ppDBPipeline1ppField67: TppField
      FieldAlias = 'FUN_NMSITUACAO'
      FieldName = 'FUN_NMSITUACAO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 66
    end
  end
end
