inherited frmCadModalidades: TfrmCadModalidades
  Caption = 'Tabela de Modalidades'
  ClientHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 300
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'MOD_CODIGO'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      object Label3: TLabel [3]
        Left = 416
        Top = 56
        Width = 54
        Height = 13
        Caption = 'Abrevia'#231#227'o'
        FocusControl = DBEdit1
      end
      inherited pnlBotoes: TPanel
        Top = 231
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 72
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MOD_NOME'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeDescricaoExit
      end
      object rbTipoModalidade: TDBRadioGroup
        Left = 16
        Top = 100
        Width = 305
        Height = 38
        Caption = '[ Tipo de Modalidade ]'
        Columns = 2
        DataField = 'MOD_AVISTA'
        DataSource = dsCadastro
        Items.Strings = (
          '&Avista'
          'A &prazo')
        TabOrder = 3
        Values.Strings = (
          'A'
          'P')
      end
      object DBEdit1: TDBEdit
        Left = 416
        Top = 72
        Width = 43
        Height = 21
        DataField = 'MOD_ABREVIACAO'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 144
        Width = 337
        Height = 41
        Caption = '[ Fixa ]'
        Columns = 5
        DataField = 'MOD_FLFIXA'
        DataSource = dsCadastro
        Items.Strings = (
          'Dinheiro'
          'Cheque'
          'Cart'#227'o'
          'Ticker'
          'Duplicata')
        TabOrder = 4
        Values.Strings = (
          'D'
          'H'
          'C'
          'T'
          'P')
      end
    end
    inherited TabSheet2: TTabSheet
      inherited pnlProcurar: TPanel
        inherited btnConsultar: TBitBtn
          OnClick = btnConsultarClick
        end
      end
      inherited Panel3: TPanel
        Height = 199
      end
      inherited grdConsultar: TDBGrid
        Height = 199
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'MOD_CODIGO'
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
            FieldName = 'MOD_NOME'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 452
            Visible = True
          end>
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 300
  end
  inherited dsConsultar: TDataSource
    Left = 228
    Top = 34
  end
  inherited dspConsultar: TDataSetProvider
    Left = 388
    Top = 34
  end
  inherited cdsConsultar: TClientDataSet
    Left = 460
    Top = 34
    object cdsConsultarMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultarMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Required = True
      Size = 30
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsModalidade
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select MOD_CODIGO, MOD_NOME from MODALIDADE'
    Left = 300
    Top = 32
  end
end
