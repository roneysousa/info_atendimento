inherited frmRelProdutos: TfrmRelProdutos
  Caption = 'Rela'#231#227'o de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 24
      Width = 329
      Height = 105
      Caption = '[ Ordem por ]'
      ItemIndex = 1
      Items.Strings = (
        '&C'#243'digo'
        '&Descri'#231#227'o')
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
      'select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_FLPROD, P.PRO_DESCRICAO' +
      ','#13#10'P.PRO_FORNECEDOR, P.PRO_VLCOMPRA, P.PRO_VLVENDA, P.PRO_TRIBUT' +
      'ACAO,'#13#10'(Select F.FOR_FANTASIA from FORNECEDORES F Where (F.FOR_C' +
      'ODIGO = P.PRO_FORNECEDOR)) as NMFORNECEDOR'#13#10'from PRODUTOS P'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlConexao
    Left = 68
    Top = 136
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 116
    Top = 138
  end
  object cdsConsultar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultar'
    Left = 164
    Top = 138
    object cdsConsultarPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsConsultarPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsConsultarPRO_FLPROD: TStringField
      FieldName = 'PRO_FLPROD'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsConsultarPRO_FORNECEDOR: TIntegerField
      FieldName = 'PRO_FORNECEDOR'
    end
    object cdsConsultarPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      Precision = 18
      Size = 2
    end
    object cdsConsultarPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      Precision = 18
      Size = 2
    end
    object cdsConsultarPRO_TRIBUTACAO: TIntegerField
      FieldName = 'PRO_TRIBUTACAO'
    end
    object cdsConsultarNMFORNECEDOR: TStringField
      FieldName = 'NMFORNECEDOR'
      ReadOnly = True
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
    Left = 208
    Top = 136
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47096
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 4233
        mmTop = 40217
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 30427
        mmTop = 40217
        mmWidth = 20902
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 44715
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 114300
        mmTop = 40217
        mmWidth = 25019
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'VALOR VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 162454
        mmTop = 40217
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Lista de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 76729
        mmTop = 27517
        mmWidth = 47625
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
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PRO_CODIGO'
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
        mmLeft = 3969
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PRO_DESCRICAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 0
        mmWidth = 80963
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NMFORNECEDOR'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 0
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PRO_VLVENDA'
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
        mmLeft = 164571
        mmTop = 0
        mmWidth = 22754
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
        mmHeight = 4191
        mmLeft = 4233
        mmTop = 2910
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
        mmLeft = 25135
        mmTop = 2910
        mmWidth = 17198
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1588
        mmWidth = 195527
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsConsultar
    UserName = 'DBPipeline1'
    Left = 248
    Top = 136
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'PRO_CODIGO'
      FieldName = 'PRO_CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'PRO_BARRAS'
      FieldName = 'PRO_BARRAS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'PRO_FLPROD'
      FieldName = 'PRO_FLPROD'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'PRO_DESCRICAO'
      FieldName = 'PRO_DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_FORNECEDOR'
      FieldName = 'PRO_FORNECEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLCOMPRA'
      FieldName = 'PRO_VLCOMPRA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_VLVENDA'
      FieldName = 'PRO_VLVENDA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRO_TRIBUTACAO'
      FieldName = 'PRO_TRIBUTACAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'NMFORNECEDOR'
      FieldName = 'NMFORNECEDOR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
  end
end
