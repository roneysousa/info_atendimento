inherited frmLocProdutos: TfrmLocProdutos
  Caption = 'Localizar Produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'PRO_CODIGO'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
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
    CommandText = 'select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsConsultarPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Required = True
      Size = 60
    end
  end
end
