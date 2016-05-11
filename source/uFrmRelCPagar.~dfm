inherited frmRelCPagar: TfrmRelCPagar
  Caption = 'Rela'#231#227'o de Contas '#224' Pagar'
  ClientHeight = 276
  ClientWidth = 433
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 433
    Height = 235
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 38
      Height = 13
      Caption = '&Per'#237'odo'
      FocusControl = edtDTINICIAL
      Transparent = True
    end
    object Label3: TLabel
      Left = 16
      Top = 54
      Width = 57
      Height = 13
      Caption = '&Fornecedor:'
      FocusControl = cmbFornecedores
    end
    object edtDTINICIAL: TDateEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnExit = edtDTINICIALExit
    end
    object edtDTFINAL: TDateEdit
      Left = 144
      Top = 27
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtDTFINALExit
    end
    object cmbFornecedores: TComboBox
      Left = 16
      Top = 69
      Width = 380
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
    object rgSituacao: TRadioGroup
      Left = 16
      Top = 102
      Width = 380
      Height = 41
      Caption = '[ Situa'#231#227'o ]'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&Abertas'
        '&Pagas'
        '&Todas')
      TabOrder = 3
    end
    object rgPeriodos: TRadioGroup
      Left = 16
      Top = 159
      Width = 380
      Height = 40
      Caption = '[ Per'#237'odos ]'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '&Compra'
        '&Vencimento'
        'Pa&gamento')
      TabOrder = 4
    end
  end
  inherited Panel2: TPanel
    Top = 235
    Width = 433
    inherited BtImprimir: TBitBtn
      Left = 253
      OnClick = BtImprimirClick
    end
    inherited BtSair: TBitBtn
      Left = 341
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    Left = 20
    Top = 194
  end
  object datasetConsultar: TSQLDataSet
    CommandText = 
      'Select CP.PAG_SEQUENCIA, CP.PAG_IDCONTA, CP.PAG_NRPARCELA, CP.PA' +
      'G_CDLOJA,'#13#10'CP.PAG_DTCOMPRA, CP.PAG_DTVENCIMENTO, CP.PAG_DTPAGAME' +
      'NTO,  CP.PAG_VALORPARCELA,'#13#10'CP.PAG_IDFORNECEDOR, CP.PAG_SITUACAO' +
      ', CP.PAG_VALORPAGO, CP.PAG_BANCO, CP.PAG_NRCONTA,'#13#10'CP.PAG_AGENCI' +
      'A, CP.PAG_NRCHEQUE, CP.PAG_VALORDESCONTO, CP.PAG_VALORJUROS,'#13#10'F.' +
      'FOR_FANTASIA'#13#10'from CONTASPAGAR CP'#13#10'INNER JOIN FORNECEDORES F ON ' +
      'F.FOR_CODIGO = CP.PAG_IDFORNECEDOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlConexao
    Left = 92
    Top = 192
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 180
    Top = 194
  end
  object cdsConsultar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultar'
    OnCalcFields = cdsConsultarCalcFields
    Left = 236
    Top = 194
    object cdsConsultarPAG_SEQUENCIA: TIntegerField
      FieldName = 'PAG_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConsultarPAG_IDCONTA: TIntegerField
      FieldName = 'PAG_IDCONTA'
      Required = True
    end
    object cdsConsultarPAG_NRPARCELA: TIntegerField
      FieldName = 'PAG_NRPARCELA'
      Required = True
    end
    object cdsConsultarPAG_CDLOJA: TIntegerField
      FieldName = 'PAG_CDLOJA'
    end
    object cdsConsultarPAG_DTCOMPRA: TDateField
      FieldName = 'PAG_DTCOMPRA'
    end
    object cdsConsultarPAG_DTVENCIMENTO: TDateField
      FieldName = 'PAG_DTVENCIMENTO'
    end
    object cdsConsultarPAG_DTPAGAMENTO: TDateField
      FieldName = 'PAG_DTPAGAMENTO'
    end
    object cdsConsultarPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsConsultarPAG_IDFORNECEDOR: TIntegerField
      FieldName = 'PAG_IDFORNECEDOR'
    end
    object cdsConsultarPAG_SITUACAO: TStringField
      FieldName = 'PAG_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarPAG_VALORPAGO: TFMTBCDField
      FieldName = 'PAG_VALORPAGO'
      Precision = 18
      Size = 2
    end
    object cdsConsultarPAG_BANCO: TIntegerField
      FieldName = 'PAG_BANCO'
    end
    object cdsConsultarPAG_NRCONTA: TStringField
      FieldName = 'PAG_NRCONTA'
      Size = 12
    end
    object cdsConsultarPAG_AGENCIA: TStringField
      FieldName = 'PAG_AGENCIA'
      Size = 5
    end
    object cdsConsultarPAG_NRCHEQUE: TStringField
      FieldName = 'PAG_NRCHEQUE'
      Size = 10
    end
    object cdsConsultarPAG_VALORDESCONTO: TFMTBCDField
      FieldName = 'PAG_VALORDESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsConsultarPAG_VALORJUROS: TFMTBCDField
      FieldName = 'PAG_VALORJUROS'
      Precision = 18
      Size = 2
    end
    object cdsConsultarPAG_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PAG_ATRASO'
      Calculated = True
    end
    object cdsConsultarFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
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
    Left = 296
    Top = 192
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51858
      mmPrintPosition = 0
      object ppImgLogo: TppImage
        UserName = 'ImgLogo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 30692
        mmLeft = 7408
        mmTop = 3969
        mmWidth = 44186
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Rela'#231#227'o de Contas '#224' Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 73819
        mmTop = 25929
        mmWidth = 72231
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'COMPRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 45773
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DT.VENCIM.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 70379
        mmTop = 45773
        mmWidth = 20373
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2381
        mmTop = 44450
        mmWidth = 195527
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2381
        mmTop = 50270
        mmWidth = 195527
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 33602
        mmWidth = 16140
        BandType = 0
      end
      object txtSituacao: TppLabel
        UserName = 'txtPeriodo1'
        Caption = 'PER'#205'ODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 38629
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'DT.PGTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 94192
        mmTop = 45773
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'FORNECEDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20638
        mmTop = 45773
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'VALOR PC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 45773
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'JUROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 133086
        mmTop = 45773
        mmWidth = 12107
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'ATRASO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 166952
        mmTop = 45773
        mmWidth = 14647
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'VALOR PG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 45773
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label102'
        Caption = 'ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 182827
        mmTop = 45773
        mmWidth = 4530
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
        mmTop = 5292
        mmWidth = 137054
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PAG_IDCONTA'
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
        mmLeft = 3440
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'FOR_FANTASIA'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 20638
        mmTop = 529
        mmWidth = 48948
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PAG_DTVENCIMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 72496
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PAG_DTPAGAMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 94192
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PAG_VALORPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 113242
        mmTop = 529
        mmWidth = 18034
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PAG_VALORJUROS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 529
        mmWidth = 12107
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PAG_VALORPAGO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 147373
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PAG_ATRASO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 168011
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PAG_SITUACAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 529
        mmWidth = 4530
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
        mmLeft = 1058
        mmTop = 1058
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
        mmHeight = 3969
        mmLeft = 138377
        mmTop = 3440
        mmWidth = 16933
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
        mmHeight = 3969
        mmLeft = 138377
        mmTop = 8202
        mmWidth = 11906
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
        mmLeft = 156634
        mmTop = 3440
        mmWidth = 32015
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
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 8202
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1058
        mmWidth = 195527
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 3980
        mmTop = 2646
        mmWidth = 19770
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 24871
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PAG_VALORPARCELA'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4191
        mmLeft = 113242
        mmTop = 2646
        mmWidth = 18034
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'PAG_VALORJUROS'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 133086
        mmTop = 2646
        mmWidth = 12107
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'PAG_VALORPAGO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 2646
        mmWidth = 18256
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsConsultar
    UserName = 'DBPipeline1'
    Left = 344
    Top = 192
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_SEQUENCIA'
      FieldName = 'PAG_SEQUENCIA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_IDCONTA'
      FieldName = 'PAG_IDCONTA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_NRPARCELA'
      FieldName = 'PAG_NRPARCELA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_CDLOJA'
      FieldName = 'PAG_CDLOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'PAG_DTCOMPRA'
      FieldName = 'PAG_DTCOMPRA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'PAG_DTVENCIMENTO'
      FieldName = 'PAG_DTVENCIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'PAG_DTPAGAMENTO'
      FieldName = 'PAG_DTPAGAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORPARCELA'
      FieldName = 'PAG_VALORPARCELA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_IDFORNECEDOR'
      FieldName = 'PAG_IDFORNECEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'PAG_SITUACAO'
      FieldName = 'PAG_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORPAGO'
      FieldName = 'PAG_VALORPAGO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_BANCO'
      FieldName = 'PAG_BANCO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'PAG_NRCONTA'
      FieldName = 'PAG_NRCONTA'
      FieldLength = 12
      DisplayWidth = 12
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'PAG_AGENCIA'
      FieldName = 'PAG_AGENCIA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'PAG_NRCHEQUE'
      FieldName = 'PAG_NRCHEQUE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORDESCONTO'
      FieldName = 'PAG_VALORDESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_VALORJUROS'
      FieldName = 'PAG_VALORJUROS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAG_ATRASO'
      FieldName = 'PAG_ATRASO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 18
    end
  end
end
