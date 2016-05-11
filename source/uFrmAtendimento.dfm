inherited frmCadAtendimento: TfrmCadAtendimento
  Left = 202
  Top = 114
  Caption = 'Atendimentos'
  ClientHeight = 564
  ClientWidth = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 631
    Height = 545
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'AGE_ID'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 64
        Width = 32
        Height = 13
        Caption = 'Cliente'
        FocusControl = dbeCliente
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 104
        Width = 73
        Height = 13
        Caption = 'Dt.Atendimento'
      end
      object Label4: TLabel [4]
        Left = 144
        Top = 104
        Width = 73
        Height = 13
        Caption = 'Hr.Atendimento'
        FocusControl = dbeHora
      end
      object Label5: TLabel [5]
        Left = 16
        Top = 146
        Width = 55
        Height = 13
        Caption = 'Funcion'#225'rio'
        FocusControl = cmbFuncionarios
      end
      object spCliente: TSpeedButton [6]
        Left = 139
        Top = 78
        Width = 23
        Height = 22
        Hint = 'Localizar o cliente'
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
        OnClick = spClienteClick
      end
      inherited pnlBotoes: TPanel
        Top = 476
        Width = 623
        TabOrder = 5
        inherited BtGravar: TBitBtn
          Left = 264
        end
        inherited BtCancelar: TBitBtn
          Left = 345
        end
        inherited BtSair: TBitBtn
          Left = 534
        end
        object BtImprimir: TBitBtn
          Left = 438
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
      object dbeCliente: TDBEdit
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        DataField = 'AGE_CLIENTE'
        DataSource = dsCadastro
        TabOrder = 0
        OnChange = dbeClienteChange
        OnExit = dbeClienteExit
        OnKeyPress = dbeClienteKeyPress
      end
      object dbeHora: TDBEdit
        Left = 144
        Top = 122
        Width = 69
        Height = 21
        DataField = 'AGE_HOATENDIMENTO'
        DataSource = dsCadastro
        MaxLength = 5
        TabOrder = 2
      end
      object dbeDtAtendimento: TDBDateEdit
        Left = 16
        Top = 122
        Width = 121
        Height = 21
        DataField = 'AGE_DTATENDIMENTO'
        DataSource = dsCadastro
        NumGlyphs = 2
        TabOrder = 1
        OnExit = dbeDtAtendimentoExit
      end
      object cmbFuncionarios: TDBLookupComboBox
        Left = 16
        Top = 162
        Width = 534
        Height = 21
        DataField = 'ATE_NMFUNCIONARIO'
        DataSource = dsCadastro
        TabOrder = 3
        OnExit = cmbFuncionariosExit
      end
      object edtNomeCliente: TEdit
        Left = 170
        Top = 80
        Width = 380
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
        TabOrder = 6
      end
      object Panel1: TPanel
        Left = 0
        Top = 197
        Width = 623
        Height = 279
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvSpace
        TabOrder = 4
        object Label6: TLabel
          Left = 16
          Top = 129
          Width = 99
          Height = 13
          Caption = 'Tratamento realizado'
          FocusControl = DBMemo1
          Transparent = True
        end
        object Label7: TLabel
          Left = 16
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Diagnostico'
          FocusControl = DBMemo2
          Transparent = True
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 147
          Width = 534
          Height = 100
          DataField = 'AGE_DESCRICAO'
          DataSource = dsCadastro
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object DBMemo2: TDBMemo
          Left = 16
          Top = 24
          Width = 534
          Height = 100
          DataField = 'AGE_DIAGNOSTICO'
          DataSource = dsCadastro
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        Width = 623
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Left = 589
        Height = 444
      end
      inherited grdConsultar: TDBGrid
        Width = 589
        Height = 444
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'AGE_DTATENDIMENTO'
            Title.Caption = 'Data Aten.'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AGE_HOATENDIMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_NOME'
            Title.Caption = 'Cliente'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 260
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'AGE_SITUACAO'
            Title.Alignment = taCenter
            Title.Caption = 'ST'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FUN_NOME'
            Title.Caption = 'Funcion'#225'rio'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 545
    Width = 631
  end
  inherited dsConsultar: TDataSource
    Left = 292
    Top = 50
  end
  inherited dspConsultar: TDataSetProvider
    Left = 452
    Top = 50
  end
  inherited cdsConsultar: TClientDataSet
    Left = 524
    Top = 50
    object cdsConsultarAGE_ID: TIntegerField
      FieldName = 'AGE_ID'
      Required = True
    end
    object cdsConsultarAGE_DTMOVI: TDateField
      FieldName = 'AGE_DTMOVI'
      Required = True
    end
    object cdsConsultarAGE_HOMOVI: TStringField
      Alignment = taCenter
      FieldName = 'AGE_HOMOVI'
      EditMask = '99:99;0;_'
      FixedChar = True
      Size = 5
    end
    object cdsConsultarAGE_CLIENTE: TIntegerField
      FieldName = 'AGE_CLIENTE'
    end
    object cdsConsultarCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object cdsConsultarAGE_DTATENDIMENTO: TDateField
      FieldName = 'AGE_DTATENDIMENTO'
    end
    object cdsConsultarAGE_HOATENDIMENTO: TStringField
      Alignment = taCenter
      FieldName = 'AGE_HOATENDIMENTO'
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsConsultarAGE_SITUACAO: TStringField
      FieldName = 'AGE_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsultarAGE_FUNCIONARIO: TIntegerField
      FieldName = 'AGE_FUNCIONARIO'
    end
    object cdsConsultarFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsAtendimento
    OnDataChange = dsCadastroDataChange
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'select A.AGE_ID, A.AGE_DTMOVI, A.AGE_HOMOVI, A.AGE_CLIENTE, CL.C' +
      'LI_NOME,'#13#10'A.AGE_DTATENDIMENTO, A.AGE_HOATENDIMENTO, A.AGE_SITUAC' +
      'AO,'#13#10'A.AGE_FUNCIONARIO, F.FUN_NOME from AGENDA A'#13#10'INNER JOIN CLI' +
      'ENTES CL ON CL.CLI_CODIGO = A.AGE_CLIENTE'#13#10'INNER JOIN FUNCIONARI' +
      'OS F ON F.FUN_CODIGO = A.AGE_FUNCIONARIO'
    Left = 364
    Top = 48
  end
end
