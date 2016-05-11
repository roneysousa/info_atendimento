inherited frmRelFornedores: TfrmRelFornedores
  Left = 320
  Top = 194
  Caption = 'Rela'#231#227'o de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 24
      Width = 321
      Height = 105
      Caption = '[ Ordem por ]'
      ItemIndex = 1
      Items.Strings = (
        '&C'#243'digo'
        '&Raz'#227'o Social')
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    inherited BtImprimir: TBitBtn
      OnClick = BtImprimirClick
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    Left = 36
    Top = 130
  end
  object datasetConsultar: TSQLDataSet
    CommandText = 
      'select F.FOR_CODIGO, F.FOR_RAZAO, F.FOR_FANTASIA, F.FOR_FONE1 fr' +
      'om FORNECEDORES F'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlConexao
    Left = 76
    Top = 128
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 108
    Top = 130
  end
  object cdsConsultar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultar'
    OnCalcFields = cdsConsultarCalcFields
    Left = 148
    Top = 130
    object cdsConsultarFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConsultarFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      Required = True
      Size = 50
    end
    object cdsConsultarFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsConsultarFOR_FONE1: TStringField
      FieldName = 'FOR_FONE1'
      Size = 10
    end
    object cdsConsultarFONE: TStringField
      FieldKind = fkCalculated
      FieldName = 'FONE'
      Size = 13
      Calculated = True
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
    Left = 208
    Top = 128
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46302
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 40217
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'RAZ'#195'O SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 24606
        mmTop = 40217
        mmWidth = 26416
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
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 44714
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FANTASIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 100277
        mmTop = 40217
        mmWidth = 17441
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'TELEFONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 154517
        mmTop = 40217
        mmWidth = 18796
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Lista de Fornecedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 75671
        mmTop = 27781
        mmWidth = 60061
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FOR_CODIGO'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 4233
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'FOR_RAZAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 24606
        mmTop = 0
        mmWidth = 71438
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmLeft = 100277
        mmTop = 0
        mmWidth = 48948
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FONE'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 154517
        mmTop = 0
        mmWidth = 35190
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
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
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 2381
        mmWidth = 19844
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
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
      end
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
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsConsultar
    UserName = 'DBPipeline1'
    Left = 240
    Top = 128
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'FOR_CODIGO'
      FieldName = 'FOR_CODIGO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'FOR_RAZAO'
      FieldName = 'FOR_RAZAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'FOR_FANTASIA'
      FieldName = 'FOR_FANTASIA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'FOR_FONE1'
      FieldName = 'FOR_FONE1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
end
