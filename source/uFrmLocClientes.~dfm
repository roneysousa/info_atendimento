inherited frmConsClientes: TfrmConsClientes
  Caption = 'Localizar Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdConsultar: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CLI_CODIGO'
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_NOME'
        Title.Caption = 'Nome Cliente'
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
    CommandText = 'select CL.CLI_CODIGO, CL.CLI_NOME from CLIENTES CL'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
  end
end
