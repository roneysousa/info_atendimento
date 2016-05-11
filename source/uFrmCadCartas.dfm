inherited frmCadCartas: TfrmCadCartas
  Caption = 'Cadastro de Cartas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'CAR_CODIGO'
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
      object Label3: TLabel [3]
        Left = 16
        Top = 143
        Width = 27
        Height = 13
        Caption = 'Texto'
        FocusControl = DBMemo1
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 104
        Width = 28
        Height = 13
        Caption = 'T'#237'tulo'
        FocusControl = DBEdit1
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 80
        Width = 529
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CAR_DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 160
        Width = 529
        Height = 192
        DataField = 'CAR_TEXTO'
        DataSource = dsCadastro
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 120
        Width = 529
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CAR_TITULO'
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
      inherited grdConsultar: TDBGrid
        OnDblClick = btnConsultarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CAR_CODIGO'
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
            FieldName = 'CAR_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 440
            Visible = True
          end>
      end
    end
  end
  inherited cdsConsultar: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    object cdsConsultarCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarCAR_DESCRICAO: TStringField
      FieldName = 'CAR_DESCRICAO'
      Required = True
      Size = 30
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsCarta
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CAR_CODIGO, CAR_DESCRICAO from CARTAS'
  end
end
