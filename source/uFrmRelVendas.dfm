inherited frmRelVendas: TfrmRelVendas
  Caption = 'Vendas'
  ClientHeight = 449
  ClientWidth = 622
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 622
    Height = 408
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 620
      Height = 56
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object dbeData: TDateEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object btnConsulta: TBitBtn
        Left = 152
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Consultar'
        TabOrder = 1
        OnClick = btnConsultaClick
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
    object Panel4: TPanel
      Left = 1
      Top = 57
      Width = 620
      Height = 350
      Align = alClient
      TabOrder = 1
      object grdConsultar: TDBGrid
        Left = 1
        Top = 1
        Width = 618
        Height = 348
        Align = alClient
        Ctl3D = False
        DataSource = dsConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'MOV_PEDIDO'
            Title.Caption = 'N'#186' VENDA'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_NOME'
            Title.Caption = 'CLIENTE'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 348
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'VALOR'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end>
      end
    end
  end
  inherited Panel2: TPanel
    Top = 408
    Width = 622
    inherited BtImprimir: TBitBtn
      Left = 450
      OnClick = BtImprimirClick
    end
    inherited BtSair: TBitBtn
      Left = 538
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'select M.MOV_PEDIDO, M.MOV_LOJA, M.MOV_DATAVENDA, M.MOV_CLIENTE,' +
      ' CL.CLI_NOME,'#13#10'M.MOV_VALOR, M.MOV_SITUACAO'#13#10'from VENDAS M'#13#10'inner' +
      ' join CLIENTES CL ON CL.CLI_CODIGO = M.MOV_CLIENTE'#13#10'Where (M.MOV' +
      '_DATAVENDA = :pDATA) AND (M.MOV_SITUACAO = '#39'F'#39')'#13#10'ORDER BY M.MOV_' +
      'PEDIDO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 81
    Top = 113
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poPropogateChanges]
    Left = 121
    Top = 113
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsulta'
    Left = 161
    Top = 113
    object cdsConsultaMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
      DisplayFormat = '0000000'
      EditFormat = '0000000'
    end
    object cdsConsultaMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      Required = True
    end
    object cdsConsultaMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
      Required = True
    end
    object cdsConsultaMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsConsultaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object cdsConsultaMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsConsultaMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 209
    Top = 113
  end
end
