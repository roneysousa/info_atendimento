inherited frmCadCargos: TfrmCadCargos
  Caption = 'Tabelas de Cargos'
  ClientHeight = 315
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 296
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'TFU_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 227
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 80
        Width = 505
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TFU_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeDescricaoExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Height = 195
      end
      inherited grdConsultar: TDBGrid
        Height = 195
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'TFU_CODIGO'
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
            FieldName = 'TFU_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 461
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 296
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarTFU_CODIGO: TIntegerField
      FieldName = 'TFU_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarTFU_DESCRICAO: TStringField
      FieldName = 'TFU_DESCRICAO'
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsCargo
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select TFU_CODIGO, TFU_DESCRICAO from TIPO_FUNCIONARIO'
  end
end
