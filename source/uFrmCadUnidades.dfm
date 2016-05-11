inherited frmCadUnidades: TfrmCadUnidades
  Caption = 'Tabela de Unidades'
  ClientHeight = 299
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 280
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        Left = 152
        Top = 5
        DataField = 'UND_CODIGO'
        Visible = False
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 63
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      inherited pnlBotoes: TPanel
        Top = 211
        TabOrder = 1
      end
      object dbeCodigo: TDBEdit
        Left = 16
        Top = 32
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UND_CODIGO'
        DataSource = dsCadastro
        TabOrder = 0
        OnExit = dbeCodigoExit
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 80
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UND_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Height = 179
      end
      inherited grdConsultar: TDBGrid
        Height = 179
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UND_CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UND_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 454
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 280
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarUND_CODIGO: TStringField
      FieldName = 'UND_CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsConsultarUND_DESCRICAO: TStringField
      FieldName = 'UND_DESCRICAO'
      Required = True
      FixedChar = True
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsUnidade
    OnDataChange = dsCadastroDataChange
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select UND_CODIGO, UND_DESCRICAO from UNIDADES'
  end
end
