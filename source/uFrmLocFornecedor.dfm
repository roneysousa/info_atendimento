inherited frmConsFornecedor: TfrmConsFornecedor
  Caption = 'Localizar Fornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'FOR_CODIGO'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_RAZAO'
        Title.Caption = 'Raz'#227'o Social'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 300
        Visible = True
      end>
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select FOR_CODIGO, FOR_RAZAO, FOR_FANTASIA from FORNECEDORES'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      Required = True
      Size = 50
    end
    object cdsConsultarFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
  end
end
