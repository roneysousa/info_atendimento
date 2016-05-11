inherited frmCadUsuarios: TfrmCadUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 360
  ClientWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 622
    Height = 341
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'SEN_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 62
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 104
        Width = 28
        Height = 13
        Caption = 'Cargo'
        FocusControl = dbeCargo
        Transparent = True
      end
      object lbl_senha: TLabel [4]
        Left = 16
        Top = 149
        Width = 34
        Height = 13
        Caption = 'Senha:'
        Transparent = True
      end
      object lbl_confirma: TLabel [5]
        Left = 16
        Top = 189
        Width = 44
        Height = 13
        Caption = 'Confirma:'
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 270
        Width = 614
        Height = 43
        inherited BtGravar: TBitBtn
          Left = 267
        end
        inherited BtCancelar: TBitBtn
          Left = 348
        end
        inherited BtSair: TBitBtn
          Left = 528
        end
        object btnAcesso: TBitBtn
          Left = 439
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Ace&ssos'
          TabOrder = 6
          OnClick = btnAcessoClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC90D8FC90D8FC90D8FC90D
            8FC90D8FC90D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0D8FC967CFF06EC6E6518CA03C92B12DAFE328ABE126A9E00D8FC9FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC98AE2FB6F7F8199828064514D35
            8CA92DB0E32AACE20D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0D8FC99CEAFF777876C6BDBA846D664C606439BAE933B5E60D8FC9FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A5EFFFB4D3DE8C8480BAB2AF60
            534B45B8DD41C1ED0D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0D8FC9A5EEFFCFF2FF98AFB4B6A9A69D958E46727748A4BD0D8FC9FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A5EEFFCEF2FFC6F0FF738788D3
            C9C78A7E787E76730D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            0D8FC9A5EEFFCEF2FFC5F0FF99DEF0707F7DD3CACA968881846E674D372B634F
            43584339FF00FFFF00FFFF00FFFF00FF0D8FC9A5EEFFCEF2FFC5F0FFA0EBFF64
            BCCF989895C0BAB69A8C87C4B1B0C5B1B0C7B6B577645AFF00FFFF00FFFF00FF
            0D8FC9A5EEFFCEF2FFC5F0FFA0EBFF6FE2FE579AA5C0B7B5C5BAB7E3D8D8E5D8
            D8EFE6E7B4A9A4FF00FFFF00FFFF00FF0D8FC9A7EFFFD5F6FFCFF6FFA9F0FF75
            E6FF57868AC9BFBCEEE7E9E6DEDEEBE5E5F4EFEFF2EFEF5A483DFF00FFFF00FF
            0D8FC9A4EFFFBFEBFAA6E2F480DAF359C9E5827D75FFFFFFF2F0F0F4F4F4F4F4
            F6A69D95BDB5B058453AFF00FFFF00FF0D8FC95FC6E968C4E664C2E658C1E64A
            BDE5579AACC2BCB7FFFFFFDDDAD97E6E66645247A397916D5C51FF00FFFF00FF
            0D8FC988D7F099E7F793EAFC88EAFE79E6FC6BE0F887786FD4D0CEBAB1AC8C80
            77BBB5AF7E6E6558453AFF00FFFF00FFFF00FF0D8FC90D8FC90D8FC90D8FC90D
            8FC90D8FC90D8FC96D5C516D5C519084797A6C6058453AFF00FF}
        end
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 78
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SEN_NOME'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object dbeCargo: TDBEdit
        Left = 16
        Top = 120
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'SEN_CARGO'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object dbeSNATUA: TEdit
        Left = 16
        Top = 165
        Width = 82
        Height = 21
        MaxLength = 6
        PasswordChar = '*'
        TabOrder = 3
        OnExit = dbeSNATUAExit
      end
      object edt_Confirma: TEdit
        Left = 16
        Top = 205
        Width = 82
        Height = 21
        MaxLength = 6
        PasswordChar = '*'
        TabOrder = 4
        OnExit = edt_ConfirmaExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        Width = 614
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Left = 580
        Height = 240
      end
      inherited grdConsultar: TDBGrid
        Width = 580
        Height = 240
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'SEN_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEN_NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 429
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 341
    Width = 622
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Required = True
      Size = 40
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsUsuario
    OnDataChange = dsCadastroDataChange
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select SEN_CODIGO, SEN_NOME from USUARIOS'
  end
end
