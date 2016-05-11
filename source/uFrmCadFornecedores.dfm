inherited frmCadastro1: TfrmCadastro1
  Caption = 'Cadastro de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited DBText1: TDBText
        DataField = 'FOR_CODIGO'
      end
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsFornecedor
  end
end
