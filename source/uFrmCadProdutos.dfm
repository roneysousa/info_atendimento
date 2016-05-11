inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 388
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'PRO_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 96
        Width = 52
        Height = 13
        Caption = 'Refer'#234'ncia'
        FocusControl = dbeReferencia
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 160
        Top = 96
        Width = 54
        Height = 13
        Caption = 'Fornecedor'
        FocusControl = cmbFornecedor
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 16
        Top = 137
        Width = 40
        Height = 13
        Caption = 'Unidade'
        FocusControl = cmbUND
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 86
        Top = 137
        Width = 78
        Height = 13
        Caption = 'Valor de Compra'
        FocusControl = dbeVLCOMP
        Transparent = True
      end
      object Label7: TLabel [7]
        Left = 240
        Top = 137
        Width = 73
        Height = 13
        Caption = 'Valor de Venda'
        FocusControl = dbeVLVEND
        Transparent = True
      end
      object Label8: TLabel [8]
        Left = 16
        Top = 180
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
        FocusControl = DBMemo1
        Transparent = True
      end
      object Label9: TLabel [9]
        Left = 395
        Top = 137
        Width = 68
        Height = 13
        Caption = 'Data Cadastro'
        FocusControl = dbeVLVEND
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 319
        TabOrder = 1
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 72
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PRO_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object dbeReferencia: TDBEdit
        Left = 16
        Top = 112
        Width = 137
        Height = 21
        DataField = 'PRO_REFERENCIA'
        DataSource = dsCadastro
        TabOrder = 3
        OnExit = dbeReferenciaExit
      end
      object cmbFornecedor: TDBLookupComboBox
        Left = 160
        Top = 112
        Width = 355
        Height = 21
        DataField = 'PRO_NMFORN'
        DataSource = dsCadastro
        TabOrder = 4
      end
      object cmbUND: TDBLookupComboBox
        Left = 16
        Top = 153
        Width = 65
        Height = 21
        DataField = 'PRO_NMUNID'
        DataSource = dsCadastro
        TabOrder = 5
      end
      object dbeVLCOMP: TDBEdit
        Left = 86
        Top = 153
        Width = 150
        Height = 21
        DataField = 'PRO_VLCOMPRA'
        DataSource = dsCadastro
        TabOrder = 6
      end
      object dbeVLVEND: TDBEdit
        Left = 240
        Top = 153
        Width = 150
        Height = 21
        DataField = 'PRO_VLVENDA'
        DataSource = dsCadastro
        TabOrder = 7
      end
      object DBDateEdit1: TDBDateEdit
        Left = 395
        Top = 153
        Width = 121
        Height = 21
        TabStop = False
        DataField = 'PRO_DTCADASTRO'
        DataSource = dsCadastro
        ReadOnly = True
        NumGlyphs = 2
        TabOrder = 8
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 196
        Width = 500
        Height = 94
        DataField = 'PRO_OBSERVACAO'
        DataSource = dsCadastro
        ScrollBars = ssVertical
        TabOrder = 9
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 331
        Top = 16
        Width = 185
        Height = 41
        Caption = '[ Tipo de Produto ]'
        Columns = 2
        DataField = 'PRO_FLPROD'
        DataSource = dsCadastro
        Items.Strings = (
          'Produto'
          'Servi'#231'o')
        TabOrder = 0
        Values.Strings = (
          'P'
          'S')
      end
      object Panel1: TPanel
        Left = 565
        Top = 0
        Width = 34
        Height = 319
        Align = alRight
        TabOrder = 10
        object sbUlti: TSpeedButton
          Left = 5
          Top = 83
          Width = 25
          Height = 35
          Hint = 'Pr'#243'ximo registro'
          Enabled = False
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            0800000000004002000000000000000000000001000000000000FFFFFF00FFE6
            E600FEE5E500FCE3E300FBE1E100F9DFE000F7DDDE00F7DDDD00F5DBDB00F4DB
            DB00F2D9D900E6D9D900F0D6D700EED4D400EBD2D200E9D0D000E9CFD000E7CD
            CD00E5CBCB00E3C9C900E0C7C700DEC4C400DCC2C200CCC0C000D9C0BF00D7BE
            BD00D4BBBB00D3B9B900D0B7B700CFB5B500CEB4B400CCB3B300C9B0B000C7AE
            AE00C5ACAC00C3AAAA00C1A8A800C1A7A700BFA5A500BDA3A300BCA3A300BAA0
            A100BAA1A000B89E9E00B59C9C00B39A9A00AF969600AD949400A88F8F00A68D
            8D00A18888009F8686009B8382009A818100998080006633330000000000C0C0
            C000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000393939393939
            3939393939393939393939393939393939393939393939393939393939393939
            3939393939393939393939393939393939393939393939393939393939393939
            3939393939393939393939393939393939393939393939393939393939393939
            3939393939393939393939393939393939393939393939393939393939003939
            3939393939393939393939393939393939393939000037393939393939393939
            39393939393939393939390000370D3839393939393939393939393939393939
            39390000370D260D383939393939393939393939393939393900003706260D2E
            1138393939393939393939393939393900003706260D2C112E15383939393939
            3939393939393900003705210D2B112E15311938393939393939393939390000
            3706210D261038143019331D383939393939393939000037012106260D383938
            18331D331D38393939393939000037012106260D3839393938193321331D3839
            393939393937011D05250C3839393939393821331D170B383939393939393801
            25063839393939393939381D170B383939393939393939380638393939393939
            393939380B383939393939393939393938393939393939393939393938393939
            3939393939393939393939393939393939393939393939393939393939393939
            3939393939393939393939393939393939393939393939393939393939393939
            3939393939393939393939393939393939393939393939393939393939393939
            3939393939393939393939393939393939393939393939393939}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbProximoClick
        end
        object sbProx: TSpeedButton
          Left = 5
          Top = 122
          Width = 25
          Height = 35
          Hint = #218'ltimo registro'
          Enabled = False
          Flat = True
          Glyph.Data = {
            96010000424D9601000000000000760000002800000018000000180000000100
            0400000000002001000000000000000000001000000000000000FFFFFF006130
            30006E3D3D00916161009E6E6E00C2919100CF9E9E00C0C0C000000000000000
            0000000000000000000000000000000000000000000000000000777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777077777777777777777777770027777777
            7777777777777002327777777777777777770023432777777777777777700234
            3432777777777777770023434343277777777777700234343434327777777777
            0025656565656547777777700256565656565654777777772121212121212121
            2777777777777777777777777777777000000000000000007777777034343434
            3434343617777770456565656565656527777770365656565656565617777770
            4565656565656565277777771212121212121212177777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbUltimoClick
        end
        object sbAnte: TSpeedButton
          Left = 5
          Top = 44
          Width = 25
          Height = 35
          Hint = 'Registro anterior'
          Enabled = False
          Flat = True
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            0800000000004002000000000000000000000001000000000000FFFFFF00FEE5
            E400FDE3E300FBE1E100F9DFE000F7DEDD00F4DBDB00F2D9D900E6D9D900F0D7
            D700EED4D400EBD2D200E9CFCF00E7CECD00E5CBCB00E3C9C900E0C6C700DEC4
            C500DBC2C200D9C0C000CDC0C000CCC0C000D7BDBD00D5BBBB00D3B9B900D1B7
            B700CFB6B500CFB5B500CDB4B400CCB3B300C7AEAE00C6ACAC00C1A8A800BFA6
            A600BAA0A100B89E9E00B39A9A00B1989800AD949400AA919100A68D8D00A38A
            8A009F8686009D8484009C8283009A818100998080006633330000000000C0C0
            C000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000313131313131
            3131313131313131313131313131313131313131313131313131313131313131
            3131313131313131313131313131313131313131313131313131313131313131
            3131313131313131313131313131313131313131313131313131313131313131
            3131313131313131313131313131313131313131313131003131313131313131
            313131003131313131313131313100002F31313131313131313100002F313131
            313131313100002F01303131313131313100002F1A3031313131313100002F01
            1E0530313131313100002F1A2A1A303131313131312F011E05210A3031313100
            002F1E2A1A1408303131313131313004210A230D303100002F1E2A1A14083031
            313131313131313005210D241130002F1A2A1A16083031313131313131313131
            300A240D26162F1A2A1A140830313131313131313131313131300D2611281A2A
            1A1408303131313131313131313131313131301128162A1A1408303131313131
            313131313131313131313130162A1A1408303131313131313131313131313131
            3131313130191408303131313131313131313131313131313131313131300830
            3131313131313131313131313131313131313131313130313131313131313131
            3131313131313131313131313131313131313131313131313131313131313131
            3131313131313131313131313131313131313131313131313131313131313131
            3131313131313131313131313131313131313131313131313131313131313131
            3131313131313131313131313131313131313131313131313131}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbAnteriorClick
        end
        object spPrim: TSpeedButton
          Left = 5
          Top = 6
          Width = 25
          Height = 35
          Hint = 'Primeiro registro'
          Enabled = False
          Flat = True
          Glyph.Data = {
            96010000424D9601000000000000760000002800000018000000180000000100
            0400000000002001000000000000000000001000000000000000FFFFFF006130
            30006E3D3D00916161009E6E6E00C2919100CF9E9E00C0C0C000000000000000
            0000000000000000000000000000000000000000000000000000777777777777
            7777777777777777777777777777777777777777777777777777777777777770
            0000000000000000777777703434343434343436177777704565656565656565
            2777777036565656565656561777777045656565656565652777777712121212
            1212121217777777777777777777777777777777777777777777777777777770
            0000000000000000777777771212121212121212177777777143434343434341
            7777777777143434343656177777777777714343436561777777777777771434
            3656177777777777777771436561777777777777777777165617777777777777
            7777777161777777777777777777777717777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbPrimeiroClick
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Height = 287
      end
      inherited grdConsultar: TDBGrid
        Height = 287
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PRO_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 303
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_VLVENDA'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Venda'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 388
  end
  inherited dsConsultar: TDataSource
    Left = 252
    Top = 266
  end
  inherited dspConsultar: TDataSetProvider
    Left = 332
    Top = 266
  end
  inherited cdsConsultar: TClientDataSet
    Left = 364
    Top = 266
    object cdsConsultarPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsConsultarPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      Size = 14
    end
    object cdsConsultarPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsConsultarPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsProduto
    Left = 212
    Top = 264
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select PRO_CODIGO, PRO_REFERENCIA, PRO_DESCRICAO, PRO_VLVENDA fr' +
      'om PRODUTOS'
    Left = 292
    Top = 264
  end
  object dstNavegacao: TSQLDataSet
    CommandText = 
      'Select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS order by PRO_DESC' +
      'RICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDados.sqlConexao
    Left = 388
    Top = 200
  end
  object dspNavegacao: TDataSetProvider
    DataSet = dstNavegacao
    Options = [poAllowCommandText]
    Left = 428
    Top = 200
  end
  object cdsNavegavacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNavegacao'
    Left = 468
    Top = 200
    object cdsNavegavacaoPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsNavegavacaoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dsNavegacao: TDataSource
    DataSet = cdsNavegavacao
    OnDataChange = dsNavegacaoDataChange
    Left = 500
    Top = 200
  end
end
