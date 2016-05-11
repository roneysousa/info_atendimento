inherited frmCadNatureza: TfrmCadNatureza
  Caption = 'Tabela de Naturezas'
  ClientHeight = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 335
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'NAT_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 63
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
        Transparent = True
      end
      inherited pnlBotoes: TPanel
        Top = 266
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 79
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NAT_NOME'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeDescricaoExit
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 106
        Width = 185
        Height = 69
        Caption = '[ Tipo de Natureza ]'
        DataField = 'NAT_TIPO'
        DataSource = dsCadastro
        Items.Strings = (
          'Cr'#233'dito'
          'Despesa')
        TabOrder = 2
        Values.Strings = (
          'C'
          'D')
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Height = 234
      end
      inherited grdConsultar: TDBGrid
        Height = 234
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NAT_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAT_NOME'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 415
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 335
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsNatureza
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select NAT_CODIGO, NAT_NOME from NATUREZA'
  end
end
