object frmMovVendas: TfrmMovVendas
  Left = 183
  Top = 121
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vendas'
  ClientHeight = 564
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 545
    Align = alClient
    TabOrder = 0
    object BmsXPPageControl1: TBmsXPPageControl
      Left = 1
      Top = 1
      Width = 811
      Height = 502
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados'
        object pnlSuperior: TPanel
          Left = 0
          Top = 0
          Width = 803
          Height = 109
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 128
            Top = 8
            Width = 23
            Height = 13
            Caption = 'Data'
            Transparent = True
          end
          object Label2: TLabel
            Left = 256
            Top = 8
            Width = 23
            Height = 13
            Caption = 'Hora'
            Transparent = True
          end
          object Label3: TLabel
            Left = 8
            Top = 8
            Width = 31
            Height = 13
            Caption = 'Venda'
            Transparent = True
          end
          object lblVenda: TLabel
            Left = 8
            Top = 24
            Width = 77
            Height = 22
            Caption = '0000000'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object spLocCliente: TSpeedButton
            Left = 97
            Top = 64
            Width = 23
            Height = 22
            Hint = 'Localizar cliente'
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
            OnClick = spLocClienteClick
          end
          object Label4: TLabel
            Left = 8
            Top = 48
            Width = 32
            Height = 13
            Caption = '&Cliente'
            FocusControl = dbeCDCLIE
            Transparent = True
          end
          object dbeDTVEND: TDateEdit
            Left = 128
            Top = 24
            Width = 121
            Height = 21
            TabStop = False
            NumGlyphs = 2
            ReadOnly = True
            TabOrder = 1
          end
          object edtHora: TMaskEdit
            Left = 256
            Top = 24
            Width = 57
            Height = 21
            TabStop = False
            EditMask = '##:##;1;_'
            MaxLength = 5
            ReadOnly = True
            TabOrder = 2
            Text = '  :  '
          end
          object dbeCDCLIE: TEdit
            Left = 8
            Top = 64
            Width = 89
            Height = 21
            TabOrder = 0
            OnChange = dbeCDCLIEChange
            OnExit = dbeCDCLIEExit
            OnKeyPress = dbeCDCLIEKeyPress
          end
          object edtNMCLIE: TEdit
            Left = 128
            Top = 64
            Width = 361
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
        object grdConsultar: TDBGrid
          Left = 0
          Top = 109
          Width = 803
          Height = 246
          Align = alClient
          Ctl3D = False
          DataSource = dsDados
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
              FieldName = 'CDS_CDPROD'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CDS_NMPROD'
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 282
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CDS_UNIDADE'
              Title.Caption = 'UND'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 32
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CDS_QTPROD'
              Title.Caption = 'Quantidade'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CDS_VLUNIT'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor Unit'#225'rio'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CDS_SUBTOT2'
              Title.Alignment = taRightJustify
              Title.Caption = 'Sub-Total'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 106
              Visible = True
            end>
        end
        object pnlBotoes: TPanel
          Left = 0
          Top = 355
          Width = 803
          Height = 78
          Align = alBottom
          TabOrder = 2
          object Label13: TLabel
            Left = 11
            Top = 3
            Width = 91
            Height = 13
            Caption = 'C'#243'digo do &Produto:'
            Transparent = True
          end
          object spLocProduto: TSpeedButton
            Left = 125
            Top = 16
            Width = 23
            Height = 22
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
            OnClick = spLocProdutoClick
          end
          object Label14: TLabel
            Left = 194
            Top = 3
            Width = 58
            Height = 13
            Caption = 'Quantidade:'
            FocusControl = dbeQTPROD
            Transparent = True
          end
          object Label15: TLabel
            Left = 285
            Top = 3
            Width = 66
            Height = 13
            Caption = 'Valor Unit'#225'rio:'
            Transparent = True
          end
          object Label9: TLabel
            Left = 376
            Top = 3
            Width = 49
            Height = 13
            Caption = 'Sub-Total:'
            Transparent = True
          end
          object pnlTotal: TPanel
            Left = 545
            Top = 1
            Width = 257
            Height = 76
            Align = alRight
            Alignment = taRightJustify
            BorderStyle = bsSingle
            Caption = '0,00'
            Color = clRed
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -40
            Font.Name = 'Arial Black'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbeCDPROD: TDBEdit
            Left = 11
            Top = 16
            Width = 112
            Height = 21
            DataField = 'CDS_CDPROD'
            DataSource = dsDados
            TabOrder = 1
            OnChange = dbeCDPRODChange
            OnExit = dbeCDPRODExit
            OnKeyPress = dbeCDPRODKeyPress
          end
          object dbeQTPROD: TDBEdit
            Left = 194
            Top = 18
            Width = 86
            Height = 21
            DataField = 'CDS_QTPROD'
            DataSource = dsDados
            MaxLength = 6
            TabOrder = 2
            OnExit = dbeQTPRODExit
            OnKeyPress = dbeQTPRODKeyPress
          end
          object dbeValorUnitario: TDBEdit
            Left = 285
            Top = 18
            Width = 86
            Height = 21
            TabStop = False
            DataField = 'CDS_VLUNIT'
            DataSource = dsDados
            ReadOnly = True
            TabOrder = 3
            OnExit = dbeValorUnitarioExit
            OnKeyPress = dbeValorUnitarioKeyPress
          end
          object DBEdit2: TDBEdit
            Left = 376
            Top = 18
            Width = 102
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CDS_SUBTOT2'
            DataSource = dsDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbeDescricao: TDBEdit
            Left = 11
            Top = 48
            Width = 467
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CDS_NMPROD'
            DataSource = dsDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
        object pnlInferior: TPanel
          Left = 0
          Top = 433
          Width = 803
          Height = 41
          Align = alBottom
          TabOrder = 3
          object btAdicionar: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Adicionar Item'
            Caption = '&Adicionar'
            TabOrder = 0
            OnClick = btAdicionarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000031319C003131
              A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
              E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
              FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
              FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
              1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
              0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
              0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
              0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
              1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
              0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
              111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
              0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
          end
          object btEditar: TBitBtn
            Left = 88
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Editar Item'
            Caption = '&Editar'
            TabOrder = 1
            OnClick = btEditarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000031319C003131
              A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
              E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
              FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
              FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
              1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
              0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
              0E0E0E0E0E0E0B08031B1B0A0E1818181818181818181809041B1B0E0E181B1B
              1B1B1B1B1B1B180A051B1B0E0E0E181B1B1B1B1B1B180B0A061B1B0E0E0E0E18
              1B1B1B1B180B0A0A061B1B0E10100E0E181B1B180E0B0A0A061B1B0E1313100E
              0E18180E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
              11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
              0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
          end
          object BtExcluir: TBitBtn
            Left = 168
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Excluir registro'
            Caption = 'E&xcluir'
            TabOrder = 2
            OnClick = BtExcluirClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E0000000100000001000031319C003131
              A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
              E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
              FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
              FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
              1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
              0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
              0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
              0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
              1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
              0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
              11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
              0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
          end
          object btGravar: TBitBtn
            Left = 293
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Gravar Item'
            Caption = 'Gravar'
            Enabled = False
            TabOrder = 3
            OnClick = btGravarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
              F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
              FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
              1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
              0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
              1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
              1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
              1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
              13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
              16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
              1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
          end
          object btCancelar: TBitBtn
            Left = 373
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Cancelar Item'
            Caption = 'Cancelar'
            Enabled = False
            TabOrder = 4
            OnClick = btCancelarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
              F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
              FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
              1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
              0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F1F1D
              111111111D1F0A08031F1F0A0E11131F1D11111D1F0E0B09041F1F0C11131111
              1F1D1D1F110E0B0A051F1F0E13111111111F1D110F0C0A0A061F1F0F13131111
              1D1F1F1D0E0B0A0A061F1F131515131D1F100F1F1D0A0A0A061F1F1318181D1F
              13130F0E1F1D0A0A061F1F151A191F151514110F0E1F0A0A061F1F181C1A1817
              16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
              1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Fechamento'
        ImageIndex = 1
        TabVisible = False
        OnShow = TabSheet2Show
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 803
          Height = 81
          Align = alTop
          Color = clWhite
          TabOrder = 0
          object Label5: TLabel
            Left = 7
            Top = 15
            Width = 34
            Height = 13
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label8: TLabel
            Left = 119
            Top = 15
            Width = 83
            Height = 13
            Caption = 'Acr'#233'scimo(R$)'
            FocusControl = edtDESPER
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label6: TLabel
            Left = 211
            Top = 15
            Width = 87
            Height = 13
            Caption = '&Desconto (R$):'
            FocusControl = edtDESVAL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label7: TLabel
            Left = 302
            Top = 15
            Width = 80
            Height = 13
            Caption = 'D&esconto (%):'
            FocusControl = edtDESPER
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label10: TLabel
            Left = 416
            Top = 15
            Width = 78
            Height = 13
            Caption = 'Total a Pagar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object pnlTOMERC: TPanel
            Left = 8
            Top = 34
            Width = 100
            Height = 21
            Hint = 'Total a Pagar'
            Alignment = taRightJustify
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Caption = '0,00'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object edtAcrescimo: TCurrencyEdit
            Left = 115
            Top = 34
            Width = 85
            Height = 21
            AutoSize = False
            DisplayFormat = '0.00;-,0.00'
            TabOrder = 1
            OnExit = edtAcrescimoExit
            OnKeyPress = edtAcrescimoKeyPress
          end
          object edtDESVAL: TCurrencyEdit
            Left = 209
            Top = 34
            Width = 85
            Height = 21
            AutoSize = False
            DisplayFormat = '0.00;-,0.00'
            MaxLength = 14
            TabOrder = 2
            OnChange = edtDESVALChange
            OnEnter = edtDESVALEnter
            OnExit = edtDESVALExit
            OnKeyPress = edtDESVALKeyPress
          end
          object edtDESPER: TCurrencyEdit
            Left = 300
            Top = 34
            Width = 85
            Height = 21
            AutoSize = False
            DisplayFormat = '0.00;-,0.00'
            TabOrder = 3
            OnEnter = edtDESPEREnter
            OnExit = edtDESPERExit
            OnKeyPress = edtDESPERKeyPress
          end
          object txtTOVEND: TPanel
            Left = 395
            Top = 34
            Width = 100
            Height = 21
            Hint = 'Total a Pagar'
            Alignment = taRightJustify
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Caption = '0,00'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
        end
        object pnlGridPagamento: TPanel
          Left = 0
          Top = 81
          Width = 803
          Height = 297
          Align = alClient
          Color = clWhite
          TabOrder = 1
          object GridModa: TDBGrid
            Left = 1
            Top = 1
            Width = 786
            Height = 336
            TabStop = False
            Align = alClient
            DataSource = dsPagamento
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColEnter = GridModaColEnter
            OnEnter = GridModaEnter
            OnKeyDown = GridModaKeyDown
            OnKeyPress = GridModaKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'MOD_NOME'
                ReadOnly = True
                Title.Caption = 'Modalidade'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 314
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOD_VALOR'
                Title.Alignment = taRightJustify
                Title.Caption = 'Valor'
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = [fsBold]
                Width = 112
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 433
          Width = 803
          Height = 41
          Align = alBottom
          Color = clNavy
          TabOrder = 2
          object btConfirmar: TBitBtn
            Left = 606
            Top = 8
            Width = 75
            Height = 25
            Hint = 'F2 - Confirma dados'
            Caption = '&Confirma'
            TabOrder = 0
            OnClick = btConfirmarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
              F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
              FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
              1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
              0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F0F0F
              1D111111110E0A08031F1F0A0E11131D1F1D1111110E0B09041F1F0C11131D1F
              1D1F1D11110E0B0A051F1F0E131D1F1D11111F1D0F0C0A0A061F1F0F13131D11
              1111111F1D0B0A0A061F1F131515131311100F0F1F1D0A0A061F1F1318181514
              13130F0E0C1F1D0A061F1F151A1916151514110F0E0C1F0A061F1F181C1A1817
              16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
              1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
          end
          object BitBtn1: TBitBtn
            Left = 690
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Cancela opera'#231#227'o'
            Caption = 'Cancela&r'
            TabOrder = 1
            OnClick = btCancelarClick
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
              840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
              C6001873CE001873D600187BDE00187BE7001884E7001884EF001884F700188C
              F700FF00FF00188CFF001894FF002194FF00299CFF00319CFF0039A5FF004AAD
              FF0052ADFF0063B5FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121F1F1F1F1F
              1F1F1F1F1F1F1F1F1F121F1A030404040505040403030201191F1F05080A0A0A
              0A0A0A0A0A090805001F1F060A0C0C0D0E111111110C0906021F1F090C0F1F1D
              111111111D1F0A08031F1F0A0E11131F1D11111D1F0E0B09041F1F0C11131111
              1F1D1D1F110E0B0A051F1F0E13111111111F1D110F0C0A0A061F1F0F13131111
              1D1F1F1D0E0B0A0A061F1F131515131D1F100F1F1D0A0A0A061F1F1318181D1F
              13130F0E1F1D0A0A061F1F151A191F151514110F0E1F0A0A061F1F181C1A1817
              16161513100F0C0A061F1F191D1C1A191817161514110F0A041F1F1E19171513
              1311110F0E0C0A081B1F121F1F1F1F1F1F1F1F1F1F1F1F1F1F12}
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 378
          Width = 803
          Height = 55
          Align = alBottom
          TabOrder = 3
          object Label11: TLabel
            Left = 519
            Top = 6
            Width = 48
            Height = 13
            Caption = 'TROCO:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object pnlTroco: TPanel
            Left = 517
            Top = 20
            Width = 248
            Height = 29
            Alignment = taRightJustify
            BevelInner = bvLowered
            BevelOuter = bvLowered
            Caption = '0,00'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 503
      Width = 811
      Height = 41
      Align = alBottom
      Color = clNavy
      TabOrder = 1
      object btnVendaNova: TBitBtn
        Left = 403
        Top = 8
        Width = 105
        Height = 25
        Caption = '&Nova Venda'
        TabOrder = 0
        OnClick = btnVendaNovaClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF00004300004300003C000037000036000036FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000930000930002841518892B
          2D8C2A2A830F0F6200004000003A00003AFF00FFFF00FFFF00FFFF00FFFF00FF
          0004B30104A73D45C3B3B7EAFFFFFFFFFFFFFFFFFFFFFFFFA0A2CC2D2D740000
          3A00004EFF00FFFF00FFFF00FF0005CC0107BA7F89E2FFFFFFFFFFFF9B9CDB5E
          5EB75F5FB6ADADDDFFFFFFFFFFFF5E5E9B00003A000043FF00FFFF00FF0005CC
          6472E5FFFFFFD7DAF52427B300008300007200006800006A31319CE6E6F7FFFF
          FF36367D000043FF00FF0007E80B1BD8F8F8FFF2F3FC1621C400009F04079C89
          8FD8797BCD010275000061262695FFFFFFC3C3DB01015000004B0007E84358F0
          FFFFFF6476ED0002C40001B60407AEE8EDFDCACFF000018000006E0000668484
          C9FFFFFF27278800004B0009F37F94FAFFFFFF1932F00512E07587EA979CE8F3
          F5FDEBEDF89194DB6A6DC70202782D2E9EFFFFFF5558BE00004A0218FDA6B4FD
          FFFFFF112CFD0B20F5F7FAFFFFFFFFFFFFFFFFFFFFFFFFFFDFE0F504058B2024
          A0FFFFFF6267C30000781735FFA4B6FFFFFFFF2C4AFF000FFF142FF82B3EEDE6
          EBFDD2D7F7232DCA121EB9000093464DBEFFFFFF4A4EBD00007F0318FF91A6FF
          FFFFFFA9B9FF000EFF0008FF0515F8EBF0FFCFD5F70108C70001B30206AEC3C7
          EFFCFCFD1017AA00007FFF00FF5F7AFFFFFFFFFFFFFF5C75FF000BFF000EFF1E
          3BFF1A35F30007DB0006CC7684E8FFFFFF8F97E2000198FF00FFFF00FF425FFF
          C4CFFFFFFFFFFFFFFF8B9FFF162FFF0414FF0515FD2037F39FADF7FFFFFFE2E5
          FA101ABA000198FF00FFFF00FFFF00FF5975FFD7DFFFFFFFFFFFFFFFFCFCFFD1
          DBFFD4DFFFFFFFFFFFFFFFC6CDF71825CD0001B0FF00FFFF00FFFF00FFFF00FF
          FF00FF5C76FF97A9FDDAE0FFFFFFFFFFFFFFFFFFFFD4DBFD596FF00514D70001
          B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5C75FF5C79FF62
          7DFF4A66FD203CF50619E5FF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btnCancelaVenda: TBitBtn
        Left = 519
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Cancelar Venda'
        Enabled = False
        TabOrder = 1
        OnClick = btnCancelaVendaClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF033B8A033D90013D95023B91033A89033A89FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0357D30147B20051D0035CE007
          63E3035CE0004ED30042B7023A8F023A8FFF00FFFF00FFFF00FFFF00FFFF00FF
          0650BA0357D32781F278B4F7CAE2FCE9F4FFDCEDFF9CC7FA3F8FF20155DD0140
          A404367DFF00FFFF00FFFF00FF075DD70762E155A0F7F3F8FEFFFFFFE9F3FCC6
          DEFAD9E9FCFFFFFFFFFFFF99C5F8055DE70040A302398BFF00FFFF00FF075DD7
          529EF7FEFEFFE2EFFC0F65EB0558E70959E50250E20454E16FA6F0DEEBFC9CC9
          F80355DE02398BFF00FF0455C9207DF0E1EFFEFFFFFF6FA7F076AFF7176CED06
          5AE9075AE60F5EE66AA1F06FA7F0FFFFFF3E8FF20043B7033E96085FDA56A1FA
          FFFFFF9ECBFB1573F779B4FACFE3FC1C72EF2274EECBE1FB6DA5F20556E3DEEB
          FC9FCBFA0050D4033E960F6BE68BC1FCFFFFFF2987FC1F7DFA1674F779B5FADE
          EDFEDDEDFC6EAAF4065AE90455E5A0C5F6DEEFFF0560E202409C1B76EDA4CFFC
          FFFFFF2988FF1C7EFE1C7BFB2D87FBEDF6FEEDF6FE2279F20B63ED085DEA88BA
          F4EBF6FF0C68E60141A1207AEBA5CFFEFFFFFF3F97FF1F81FF3B93FEE1EFFF6B
          ADFC69ABFBE0EEFE2C80F30C65EEC6DEFBCEE5FE0763E203419E146FE79ACAFC
          FFFFFFB2D8FF318EFFE7F3FF67AFFF1D7EFE1A7AFB60A7FCE5F2FE3F8FF6E2EF
          FE81BAF80258D8033E96FF00FF237BEBEDF6FFFAFCFF5DA9FF469AFF1F81FF1F
          81FF1E80FF1C7DFC4D9CFBF0F8FFF2F8FE3089F4024FC0FF00FFFF00FF237BEB
          BFDEFFF3F8FFFAFCFFB0D5FF3E96FF2B89FF308CFF6AB0FEFAFCFFFFFFFF5DA6
          F70860DE024FC0FF00FFFF00FFFF00FF4997F3C7E3FFF7FBFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0EFFE5CA5F80E6BE70552C2FF00FFFF00FFFF00FFFF00FF
          FF00FF2D82EB91C5FBCCE6FFD9EDFFDCEDFEC4E0FE86BFFC348BF40A65E10A65
          E1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF247BEB4696F34A
          98F42F87F0116CE6075FDCFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
      object btnFecharVenda: TBitBtn
        Left = 672
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Fechar Venda'
        Enabled = False
        TabOrder = 2
        OnClick = btnFecharVendaClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888844488
          88888828884FFF484888822288F888F44888282828888F4448888828288888FF
          F888822288888888888828288888888828882828288888822288822288888828
          28288828888888882828888888888882228888FFF8888828288888444F888828
          28288844F888F882228888484888488828888888844488888888}
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 545
    Width = 813
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = dmFinanceiro.cdsDadosItens
    OnDataChange = dsDadosDataChange
    Left = 493
    Top = 193
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 605
    Top = 177
  end
  object dsPagamento: TDataSource
    DataSet = dmFinanceiro.cdsModalidade
    Left = 685
    Top = 130
  end
end
