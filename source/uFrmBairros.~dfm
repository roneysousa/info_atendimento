inherited frmCadBairros: TfrmCadBairros
  Caption = 'Cadastro de Bairros'
  ClientHeight = 348
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 329
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'BAI_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 72
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 112
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = cmbCidades
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 260
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 88
        Width = 530
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAI_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object cmbCidades: TDBLookupComboBox
        Left = 16
        Top = 128
        Width = 530
        Height = 21
        DataField = 'BAI_NMCIDADE'
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
        Height = 228
      end
      inherited grdConsultar: TDBGrid
        Height = 228
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'BAI_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAI_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 474
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 329
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarBAI_DESCRICAO: TStringField
      FieldName = 'BAI_DESCRICAO'
      Required = True
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsBairro
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select BAI_CODIGO, BAI_DESCRICAO from BAIRROS'
  end
end
