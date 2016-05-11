inherited frmCadBancos: TfrmCadBancos
  Caption = 'Cadastro de Bancos'
  ClientHeight = 297
  ClientWidth = 602
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 602
    Height = 278
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        Left = 448
        Visible = False
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 60
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      inherited pnlBotoes: TPanel
        Top = 209
        Width = 594
      end
      object dbeCodigo: TDBEdit
        Left = 16
        Top = 32
        Width = 73
        Height = 21
        DataField = 'BAN_CODIGO'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeCodigoExit
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 76
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAN_NOME'
        DataSource = dsCadastro
        TabOrder = 2
        OnExit = dbeDescricaoExit
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        Width = 594
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Left = 560
        Height = 177
      end
      inherited grdConsultar: TDBGrid
        Width = 560
        Height = 177
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'BAN_CODIGO'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAN_NOME'
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
    Top = 278
    Width = 602
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarBAN_CODIGO: TIntegerField
      FieldName = 'BAN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      Size = 40
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmFinanceiro.cdsBanco
    OnDataChange = dsCadastroDataChange
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from BANCOS order by BAN_NOME'
  end
end
