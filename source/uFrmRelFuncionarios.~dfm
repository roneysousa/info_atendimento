inherited frmRelFuncionarios: TfrmRelFuncionarios
  Caption = 'Rela'#231#227'o de Funcion'#225'rios'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 32
      Top = 106
      Width = 42
      Height = 13
      Caption = 'Situa'#231#227'o'
    end
    object RadioGroup1: TRadioGroup
      Left = 32
      Top = 24
      Width = 321
      Height = 78
      Caption = '[ Ordem por ]'
      ItemIndex = 1
      Items.Strings = (
        '&C'#243'digo'
        '&Nome')
      TabOrder = 0
    end
    object cmbSituacao: TComboBox
      Left = 32
      Top = 122
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    inherited BtImprimir: TBitBtn
      OnClick = BtImprimirClick
    end
  end
  object dsConsultar: TDataSource
    DataSet = cdsConsultar
    Left = 44
    Top = 138
  end
  object datasetConsultar: TSQLDataSet
    CommandText = 
      'select FU.FUN_CODIGO, FU.FUN_NOME, FU.FUN_FONE, TF.TFU_DESCRICAO' +
      ', FUN_SITUACAO from FUNCIONARIOS FU'#13#10'Inner join TIPO_FUNCIONARIO' +
      ' TF ON (TF.TFU_CODIGO = FU.FUN_CDCARGO)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlConexao
    Left = 84
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
    OnCalcFields = cdsConsultarCalcFields
    Left = 148
    Top = 138
    object cdsConsultarFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      Required = True
    end
    object cdsConsultarFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
    object cdsConsultarFUN_FONE: TStringField
      FieldName = 'FUN_FONE'
      FixedChar = True
      Size = 10
    end
    object cdsConsultarFUN_SITUACAO: TIntegerField
      FieldName = 'FUN_SITUACAO'
    end
    object cdsConsultarTFU_DESCRICAO: TStringField
      FieldName = 'TFU_DESCRICAO'
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
    Left = 200
    Top = 136
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
        Caption = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 24606
        mmTop = 40217
        mmWidth = 10626
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
        Caption = 'FUN'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 112184
        mmTop = 40217
        mmWidth = 14944
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
        mmLeft = 161661
        mmTop = 40217
        mmWidth = 18796
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Lista de Funcion'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 76729
        mmTop = 25400
        mmWidth = 58208
        BandType = 0
      end
      object txtSituacao: TppLabel
        UserName = 'txtSituacao'
        Caption = 'SITUA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 76465
        mmTop = 33073
        mmWidth = 18256
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
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FUN_CODIGO'
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
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 794
        mmWidth = 14817
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
        mmLeft = 24606
        mmTop = 794
        mmWidth = 84931
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TFU_DESCRICAO'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 794
        mmWidth = 44715
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
        mmLeft = 161661
        mmTop = 794
        mmWidth = 33073
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
    Left = 240
    Top = 136
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
      FieldAlias = 'FUN_FONE'
      FieldName = 'FUN_FONE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'FUN_SITUACAO'
      FieldName = 'FUN_SITUACAO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'TFU_DESCRICAO'
      FieldName = 'TFU_DESCRICAO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'FONE'
      FieldName = 'FONE'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
  end
end
