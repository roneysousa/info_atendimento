inherited frmRelAtendimentos: TfrmRelAtendimentos
  Caption = 'Rela'#231#227'o de Atendimentos'
  ClientHeight = 229
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 188
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Per'#237'odo'
      Transparent = True
    end
    object Label2: TLabel
      Left = 161
      Top = 36
      Width = 6
      Height = 13
      Caption = #224
      Transparent = True
    end
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 64
      Width = 321
      Height = 89
      Caption = '[ Ordem por ]'
      ItemIndex = 1
      Items.Strings = (
        '&Agendadas'
        'A&tendidas'
        '&Canceladas')
      TabOrder = 0
    end
    object edtCDINICIO: TDateEdit
      Left = 32
      Top = 32
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnExit = edtCDINICIOExit
    end
    object edtDTFINAL: TDateEdit
      Left = 178
      Top = 32
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDTFINALExit
    end
  end
  inherited Panel2: TPanel
    Top = 188
    inherited BtImprimir: TBitBtn
      OnClick = BtImprimirClick
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    Left = 36
    Top = 186
  end
  object datasetConsultar: TSQLDataSet
    CommandText = 
      'Select A.AGE_ID, A.AGE_CDLOJA, A.AGE_CLIENTE, A.AGE_DTATENDIMENT' +
      'O,'#13#10'A.age_hoatendimento, A.AGE_FUNCIONARIO, CL.CLI_NOME, F.FUN_N' +
      'OME, A.AGE_SITUACAO'#13#10'from AGENDA A'#13#10'INNER JOIN CLIENTES CL ON CL' +
      '.CLI_CODIGO = A.AGE_CLIENTE'#13#10'INNER JOIN FUNCIONARIOS F ON F.FUN_' +
      'CODIGO = A.AGE_FUNCIONARIO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlConexao
    Left = 84
    Top = 184
  end
  object dspConsultar: TDataSetProvider
    DataSet = datasetConsultar
    Options = [poAllowCommandText]
    Left = 132
    Top = 186
  end
  object cdsConsultar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultar'
    Left = 180
    Top = 186
    object cdsConsultarAGE_ID: TIntegerField
      FieldName = 'AGE_ID'
      Required = True
    end
    object cdsConsultarAGE_CDLOJA: TIntegerField
      FieldName = 'AGE_CDLOJA'
    end
    object cdsConsultarAGE_CLIENTE: TIntegerField
      FieldName = 'AGE_CLIENTE'
    end
    object cdsConsultarAGE_DTATENDIMENTO: TDateField
      FieldName = 'AGE_DTATENDIMENTO'
    end
    object cdsConsultarAGE_HOATENDIMENTO: TStringField
      FieldName = 'AGE_HOATENDIMENTO'
      FixedChar = True
      Size = 5
    end
    object cdsConsultarAGE_FUNCIONARIO: TIntegerField
      FieldName = 'AGE_FUNCIONARIO'
    end
    object cdsConsultarCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object cdsConsultarFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsConsultarAGE_SITUACAO: TStringField
      FieldName = 'AGE_SITUACAO'
      FixedChar = True
      Size = 1
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
    Left = 232
    Top = 184
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 49477
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
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 4233
        mmTop = 43392
        mmWidth = 9567
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 42069
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'HORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 23548
        mmTop = 43392
        mmWidth = 10245
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 36248
        mmTop = 43392
        mmWidth = 15071
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 47890
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'ATENDENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 116417
        mmTop = 43127
        mmWidth = 21421
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Lista de Atendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 68263
        mmTop = 23813
        mmWidth = 60061
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 182034
        mmTop = 43392
        mmWidth = 4498
        BandType = 0
      end
      object txtPeriodo: TppLabel
        UserName = 'txtPeriodo'
        Caption = 'PER'#205'ODO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68263
        mmTop = 31221
        mmWidth = 17198
        BandType = 0
      end
      object txtSituacao: TppLabel
        UserName = 'Label101'
        Caption = 'Situa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68263
        mmTop = 35983
        mmWidth = 13758
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
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'AGE_DTATENDIMENTO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'AGE_HOATENDIMENTO'
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
        mmLeft = 23548
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CLI_NOME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 36513
        mmTop = 529
        mmWidth = 76200
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
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
        mmLeft = 116417
        mmTop = 529
        mmWidth = 63500
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'AGE_SITUACAO'
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
        mmLeft = 182034
        mmTop = 529
        mmWidth = 4233
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
    Left = 280
    Top = 184
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_ID'
      FieldName = 'AGE_ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_CDLOJA'
      FieldName = 'AGE_CDLOJA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_CLIENTE'
      FieldName = 'AGE_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'AGE_DTATENDIMENTO'
      FieldName = 'AGE_DTATENDIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'AGE_HOATENDIMENTO'
      FieldName = 'AGE_HOATENDIMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_FUNCIONARIO'
      FieldName = 'AGE_FUNCIONARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'CLI_NOME'
      FieldName = 'CLI_NOME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'FUN_NOME'
      FieldName = 'FUN_NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'AGE_SITUACAO'
      FieldName = 'AGE_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
  end
end
