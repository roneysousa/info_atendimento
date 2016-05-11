object dmFinanceiro: TdmFinanceiro
  OldCreateOrder = False
  Left = 210
  Top = 134
  Height = 502
  Width = 659
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select MC.MCA_CODIGO, MC.mca_sequencia, MC.MCA_LOJA, MC.mca_vend' +
      'a, MC.mca_modalidade, MC.mca_vlmodalidade, MC.mca_obsevacao from' +
      ' MOVIMENTO_CAIXA MC Where (MC.MCA_VENDA = :pVENDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 328
    Top = 16
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 384
    Top = 16
  end
  object cdsListaFornecedores: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select F.FOR_CODIGO, F.FOR_RAZAO, F.FOR_FANTASIA from FORNECEDOR' +
      'ES F ORDER BY F.FOR_RAZAO'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 336
    Top = 80
    object cdsListaFornecedoresFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaFornecedoresFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      Required = True
      Size = 50
    end
    object cdsListaFornecedoresFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
  end
  object cdsListaNaturezas: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'Select N.NAT_CODIGO, N.NAT_NOME, N.NAT_TIPO from NATUREZA N  WHE' +
      'RE (N.NAT_TIPO = :pTIPO) ORDER BY N.NAT_NOME'
    Params = <
      item
        DataType = ftString
        Name = 'pTIPO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 336
    Top = 136
    object cdsListaNaturezasNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaNaturezasNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
    object cdsListaNaturezasNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsParcelasCP: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 16
    Data = {
      080100009619E0BD01000000180000000A000000000003000000080106504152
      5F494404000100000000000A5041525F4E525041524304000100000000000A50
      41525F445456454E430400060000000000095041525F56414C4F520800040000
      0000000A5041525F44545041474104000600000000000C5041525F5349545541
      43414F0100490000000100055749445448020002000100095041525F42414E43
      4F04000100000000000B5041525F4147454E4349410100490000000100055749
      4454480200020005000B5041525F4E52434F4E54410100490000000100055749
      445448020002000A000C5041525F4E5243484551554501004900000001000557
      49445448020002000A000000}
    object cdsParcelasCPPAR_ID: TIntegerField
      FieldName = 'PAR_ID'
    end
    object cdsParcelasCPPAR_NRPARC: TIntegerField
      FieldName = 'PAR_NRPARC'
      DisplayFormat = '00'
    end
    object cdsParcelasCPPAR_DTVENC: TDateField
      Alignment = taRightJustify
      FieldName = 'PAR_DTVENC'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasCPPAR_VALOR: TFloatField
      FieldName = 'PAR_VALOR'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsParcelasCPPAR_DTPAGA: TDateField
      Alignment = taRightJustify
      FieldName = 'PAR_DTPAGA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasCPPAR_SITUACAO: TStringField
      FieldName = 'PAR_SITUACAO'
      Size = 1
    end
    object cdsParcelasCPPAR_BANCO: TIntegerField
      FieldName = 'PAR_BANCO'
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object cdsParcelasCPPAR_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_AGENCIA'
      EditMask = '#####-A;0;_'
      Size = 6
    end
    object cdsParcelasCPPAR_NRCONTA: TStringField
      FieldName = 'PAR_NRCONTA'
      Size = 10
    end
    object cdsParcelasCPPAR_NRCHEQUE: TStringField
      FieldName = 'PAR_NRCHEQUE'
      Size = 10
    end
  end
  object cdsListaPCPagar: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from contaspagar where ("PAG_IDCONTA" = :pID) order by ' +
      '"PAG_SEQUENCIA"'
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 336
    Top = 192
  end
  object dstContaReceber: TSQLDataSet
    CommandText = 'select * from CONTASRECEBER Where (REC_SEQUENCIA = :pSEQUENCIA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 32
    Top = 88
    object dstContaReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContaReceberREC_CDLOJA: TIntegerField
      FieldName = 'REC_CDLOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstContaReceberREC_IDCONTASRECEBER: TIntegerField
      FieldName = 'REC_IDCONTASRECEBER'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstContaReceberREC_NRPARCELA: TIntegerField
      FieldName = 'REC_NRPARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstContaReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstContaReceberREC_DTVENCIMENTO: TDateField
      FieldName = 'REC_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_DTPAGAMENTO: TDateField
      FieldName = 'REC_DTPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_VALOR: TFMTBCDField
      FieldName = 'REC_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContaReceberREC_DTMOVI: TDateField
      FieldName = 'REC_DTMOVI'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_HOMOVI: TStringField
      FieldName = 'REC_HOMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstContaReceberREC_USCADA: TIntegerField
      FieldName = 'REC_USCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_USALTE: TIntegerField
      FieldName = 'REC_USALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_DTALTE: TDateField
      FieldName = 'REC_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_HOALTE: TStringField
      FieldName = 'REC_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstContaReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_OBSERVACAO: TMemoField
      FieldName = 'REC_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstContaReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaReceberREC_VLPAGO: TFMTBCDField
      FieldName = 'REC_VLPAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaReceberREC_VLRESTANTE: TFMTBCDField
      FieldName = 'REC_VLRESTANTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaReceberREC_BANCO: TIntegerField
      FieldName = 'REC_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstContaReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object dstContaReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstContaReceberREC_MODALIDADE: TIntegerField
      FieldName = 'REC_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaReceberREC_DTCREDITO: TDateField
      FieldName = 'REC_DTCREDITO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspCReceber: TDataSetProvider
    DataSet = dstContaReceber
    Options = [poAllowCommandText]
    Left = 104
    Top = 72
  end
  object cdsCReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspCReceber'
    OnCalcFields = cdsCReceberCalcFields
    Left = 168
    Top = 88
    object cdsCReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsCReceberREC_CDLOJA: TIntegerField
      FieldName = 'REC_CDLOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCReceberREC_IDCONTASRECEBER: TIntegerField
      FieldName = 'REC_IDCONTASRECEBER'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsCReceberREC_NRPARCELA: TIntegerField
      FieldName = 'REC_NRPARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '00'
    end
    object cdsCReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsCReceberREC_DTVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'REC_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsCReceberREC_DTPAGAMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'REC_DTPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsCReceberREC_VALOR: TFMTBCDField
      FieldName = 'REC_VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsCReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsCReceberREC_DTMOVI: TDateField
      Alignment = taRightJustify
      FieldName = 'REC_DTMOVI'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsCReceberREC_HOMOVI: TStringField
      FieldName = 'REC_HOMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsCReceberREC_USCADA: TIntegerField
      FieldName = 'REC_USCADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_USALTE: TIntegerField
      FieldName = 'REC_USALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_DTALTE: TDateField
      FieldName = 'REC_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_HOALTE: TStringField
      FieldName = 'REC_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsCReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_OBSERVACAO: TMemoField
      FieldName = 'REC_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsCReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsCReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsCReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsCReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsCReceberREC_VLPAGO: TFMTBCDField
      FieldName = 'REC_VLPAGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsCReceberREC_VLRESTANTE: TFMTBCDField
      FieldName = 'REC_VLRESTANTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsCReceberREC_BANCO: TIntegerField
      FieldName = 'REC_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-A;0;_'
      Size = 6
    end
    object cdsCReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsCReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsCReceberREC_MODALIDADE: TIntegerField
      FieldName = 'REC_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_DTCREDITO: TDateField
      FieldName = 'REC_DTCREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCReceberREC_NMNATUREZA: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NMNATUREZA'
      LookupDataSet = cdsListaNaturezas
      LookupKeyFields = 'NAT_CODIGO'
      LookupResultField = 'NAT_NOME'
      KeyFields = 'REC_NATUREZA'
      Size = 30
      Lookup = True
    end
    object cdsCReceberREC_NMBANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NMBANCO'
      LookupDataSet = cdsListaBanco
      LookupKeyFields = 'BAN_CODIGO'
      LookupResultField = 'BAN_NOME'
      KeyFields = 'REC_BANCO'
      Size = 40
      Lookup = True
    end
    object cdsCReceberREC_NMMODALIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NMMODALIDADE'
      LookupDataSet = cdsListaModalidades
      LookupKeyFields = 'MOD_CODIGO'
      LookupResultField = 'MOD_NOME'
      KeyFields = 'REC_MODALIDADE'
      Size = 30
      Lookup = True
    end
    object cdsCReceberREC_PARCELAS: TStringField
      FieldKind = fkCalculated
      FieldName = 'REC_PARCELAS'
      Size = 8
      Calculated = True
    end
    object cdsCReceberREC_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'REC_ATRASO'
      Calculated = True
    end
  end
  object cdsListaPCReceber: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from contasreceber where ("REC_IDCONTASRECEBER" = :pID)' +
      ' order by "REC_SEQUENCIA"'
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 336
    Top = 248
  end
  object cdsListaModalidades: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select MOD_CODIGO, MOD_NOME from MODALIDADE order by MOD_NOME'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 336
    Top = 296
    object cdsListaModalidadesMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
    end
    object cdsListaModalidadesMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Required = True
      Size = 30
    end
  end
  object cdsListaBanco: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select BAN_CODIGO, BAN_NOME from BANCOS order by BAN_NOME'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 432
    Top = 80
    object cdsListaBancoBAN_CODIGO: TIntegerField
      FieldName = 'BAN_CODIGO'
      Required = True
    end
    object cdsListaBancoBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      Size = 40
    end
  end
  object dstContaPagar: TSQLDataSet
    CommandText = 'select * from CONTASPAGAR Where (PAG_SEQUENCIA = :pSEQUENCIA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 32
    Top = 16
    object dstContaPagarPAG_SEQUENCIA: TIntegerField
      FieldName = 'PAG_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContaPagarPAG_IDCONTA: TIntegerField
      FieldName = 'PAG_IDCONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstContaPagarPAG_NRPARCELA: TIntegerField
      FieldName = 'PAG_NRPARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstContaPagarPAG_CDLOJA: TIntegerField
      FieldName = 'PAG_CDLOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_QTPARCELAS: TIntegerField
      FieldName = 'PAG_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_DTVENCIMENTO: TDateField
      FieldName = 'PAG_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_DTCOMPRA: TDateField
      FieldName = 'PAG_DTCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_NUMERONOTAFISCAL: TStringField
      FieldName = 'PAG_NUMERONOTAFISCAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstContaPagarPAG_SERIENOTAFISCAL: TStringField
      FieldName = 'PAG_SERIENOTAFISCAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstContaPagarPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaPagarPAG_DTPAGAMENTO: TDateField
      FieldName = 'PAG_DTPAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_IDFORNECEDOR: TIntegerField
      FieldName = 'PAG_IDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_HOMOVI: TStringField
      FieldName = 'PAG_HOMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstContaPagarPAG_USALTE: TIntegerField
      FieldName = 'PAG_USALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_DTALTE: TDateField
      FieldName = 'PAG_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_HOALTE: TStringField
      FieldName = 'PAG_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstContaPagarPAG_USCADA: TIntegerField
      FieldName = 'PAG_USCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_SITUACAO: TStringField
      FieldName = 'PAG_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstContaPagarPAG_NATUREZADESPESA: TIntegerField
      FieldName = 'PAG_NATUREZADESPESA'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_DESCONTOANTECIPADO: TFMTBCDField
      FieldName = 'PAG_DESCONTOANTECIPADO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaPagarPAG_DESCRICAO: TMemoField
      FieldName = 'PAG_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstContaPagarPAG_VALORPAGO: TFMTBCDField
      FieldName = 'PAG_VALORPAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaPagarPAG_VALORDESCONTO: TFMTBCDField
      FieldName = 'PAG_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaPagarPAG_VALORJUROS: TFMTBCDField
      FieldName = 'PAG_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstContaPagarPAG_MODALIDADE: TIntegerField
      FieldName = 'PAG_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_BANCO: TIntegerField
      FieldName = 'PAG_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContaPagarPAG_NRCONTA: TStringField
      FieldName = 'PAG_NRCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object dstContaPagarPAG_NRCHEQUE: TStringField
      FieldName = 'PAG_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstContaPagarPAG_AGENCIA: TStringField
      FieldName = 'PAG_AGENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
  end
  object dspContaPagar: TDataSetProvider
    DataSet = dstContaPagar
    Options = [poAllowCommandText]
    OnGetTableName = DataSetProvider1GetTableName
    Left = 104
    Top = 8
  end
  object cdsContaPagar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspContaPagar'
    OnCalcFields = cdsContaPagarCalcFields
    Left = 176
    Top = 16
    object cdsContaPagarPAG_SEQUENCIA: TIntegerField
      FieldName = 'PAG_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsContaPagarPAG_IDCONTA: TIntegerField
      FieldName = 'PAG_IDCONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsContaPagarPAG_NRPARCELA: TIntegerField
      FieldName = 'PAG_NRPARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '00'
    end
    object cdsContaPagarPAG_CDLOJA: TIntegerField
      FieldName = 'PAG_CDLOJA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_QTPARCELAS: TIntegerField
      FieldName = 'PAG_QTPARCELAS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00'
    end
    object cdsContaPagarPAG_DTVENCIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'PAG_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContaPagarPAG_DTCOMPRA: TDateField
      Alignment = taRightJustify
      FieldName = 'PAG_DTCOMPRA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContaPagarPAG_NUMERONOTAFISCAL: TStringField
      FieldName = 'PAG_NUMERONOTAFISCAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsContaPagarPAG_SERIENOTAFISCAL: TStringField
      FieldName = 'PAG_SERIENOTAFISCAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsContaPagarPAG_VALORPARCELA: TFMTBCDField
      FieldName = 'PAG_VALORPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContaPagarPAG_DTPAGAMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'PAG_DTPAGAMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsContaPagarPAG_IDFORNECEDOR: TIntegerField
      FieldName = 'PAG_IDFORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_HOMOVI: TStringField
      FieldName = 'PAG_HOMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsContaPagarPAG_USALTE: TIntegerField
      FieldName = 'PAG_USALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_DTALTE: TDateField
      FieldName = 'PAG_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_HOALTE: TStringField
      FieldName = 'PAG_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsContaPagarPAG_USCADA: TIntegerField
      FieldName = 'PAG_USCADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_SITUACAO: TStringField
      FieldName = 'PAG_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsContaPagarPAG_NATUREZADESPESA: TIntegerField
      FieldName = 'PAG_NATUREZADESPESA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_DESCONTOANTECIPADO: TFMTBCDField
      FieldName = 'PAG_DESCONTOANTECIPADO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsContaPagarPAG_DESCRICAO: TMemoField
      FieldName = 'PAG_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsContaPagarPAG_VALORPAGO: TFMTBCDField
      FieldName = 'PAG_VALORPAGO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContaPagarPAG_VALORDESCONTO: TFMTBCDField
      FieldName = 'PAG_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContaPagarPAG_VALORJUROS: TFMTBCDField
      FieldName = 'PAG_VALORJUROS'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsContaPagarPAG_MODALIDADE: TIntegerField
      FieldName = 'PAG_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_BANCO: TIntegerField
      FieldName = 'PAG_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContaPagarPAG_NRCONTA: TStringField
      FieldName = 'PAG_NRCONTA'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsContaPagarPAG_NRCHEQUE: TStringField
      FieldName = 'PAG_NRCHEQUE'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsContaPagarPAG_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAG_AGENCIA'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-A;0;_'
      Size = 6
    end
    object cdsContaPagarPAG_NMFORN: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NMFORN'
      LookupDataSet = cdsListaFornecedores
      LookupKeyFields = 'FOR_CODIGO'
      LookupResultField = 'FOR_FANTASIA'
      KeyFields = 'PAG_IDFORNECEDOR'
      Size = 50
      Lookup = True
    end
    object cdsContaPagarPAG_NMNATU: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NMNATU'
      LookupDataSet = cdsListaNaturezas
      LookupKeyFields = 'NAT_CODIGO'
      LookupResultField = 'NAT_NOME'
      KeyFields = 'PAG_NATUREZADESPESA'
      Size = 30
      Lookup = True
    end
    object cdsContaPagarPAG_NMMODALIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NMMODALIDADE'
      LookupDataSet = cdsListaModalidades
      LookupKeyFields = 'MOD_CODIGO'
      LookupResultField = 'MOD_NOME'
      KeyFields = 'PAG_MODALIDADE'
      Size = 30
      Lookup = True
    end
    object cdsContaPagarPAG_NMBANCO: TStringField
      FieldKind = fkLookup
      FieldName = 'PAG_NMBANCO'
      LookupDataSet = cdsListaBanco
      LookupKeyFields = 'BAN_CODIGO'
      LookupResultField = 'BAN_NOME'
      KeyFields = 'PAG_BANCO'
      Size = 40
      Lookup = True
    end
    object cdsContaPagarPAG_ATRASO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PAG_ATRASO'
      Calculated = True
    end
  end
  object dstEntradaProdutos: TSQLDataSet
    CommandText = 
      'select * from ENTRADAS Where (ENT_NUMERO = :pNUMERO) and (ENT_LO' +
      'JA = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 40
    Top = 152
    object dstEntradaProdutosENT_NUMERO: TIntegerField
      FieldName = 'ENT_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEntradaProdutosENT_LOJA: TIntegerField
      FieldName = 'ENT_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEntradaProdutosENT_FORNECEDOR: TIntegerField
      FieldName = 'ENT_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstEntradaProdutosENT_TRANSPORTADORA: TIntegerField
      FieldName = 'ENT_TRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosENT_DATAPEDIDO: TDateField
      FieldName = 'ENT_DATAPEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosENT_DATAENTRADA: TDateField
      FieldName = 'ENT_DATAENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosENT_NATUREZAOPERACAO: TStringField
      FieldName = 'ENT_NATUREZAOPERACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaProdutosENT_DATAEMISSAONOTA: TDateField
      FieldName = 'ENT_DATAEMISSAONOTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosENT_NUMERONOTA: TStringField
      FieldName = 'ENT_NUMERONOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstEntradaProdutosENT_SERIENOTA: TStringField
      FieldName = 'ENT_SERIENOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstEntradaProdutosENT_VALORMERCADORIAS: TFMTBCDField
      FieldName = 'ENT_VALORMERCADORIAS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_TIPOFRETE: TStringField
      FieldName = 'ENT_TIPOFRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaProdutosENT_VALORFRETE: TFMTBCDField
      FieldName = 'ENT_VALORFRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_BASECALCULOICMS: TFMTBCDField
      FieldName = 'ENT_BASECALCULOICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_VALORICMS: TFMTBCDField
      FieldName = 'ENT_VALORICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_BASECALCULOSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_BASECALCULOSUBSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_VALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_VALORSUBSTITUICAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_VALORIPI: TFMTBCDField
      FieldName = 'ENT_VALORIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_VALORSEGURO: TFMTBCDField
      FieldName = 'ENT_VALORSEGURO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_OUTRASPESPESAS: TFMTBCDField
      FieldName = 'ENT_OUTRASPESPESAS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_VALORDESCONTO: TFMTBCDField
      FieldName = 'ENT_VALORDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_VALORNOTA: TFMTBCDField
      FieldName = 'ENT_VALORNOTA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEntradaProdutosENT_SITUACAO: TStringField
      FieldName = 'ENT_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaProdutosENT_USUARIO: TIntegerField
      FieldName = 'ENT_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstItemsEntrada: TSQLDataSet
    CommandText = 
      'select * from ENTRADAPRODUTO Where (ENP_NUMERO = :pNUMERO)'#13#10'and ' +
      '(ENP_PRODUTO = :pPRODUTO) AND (ENP_NRITEM = :pITEM)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 32
    Top = 224
    object dstItemsEntradaENP_NUMERO: TIntegerField
      FieldName = 'ENP_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItemsEntradaENP_PRODUTO: TStringField
      FieldName = 'ENP_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstItemsEntradaENP_NRITEM: TIntegerField
      FieldName = 'ENP_NRITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItemsEntradaENP_UNDPRO: TStringField
      FieldName = 'ENP_UNDPRO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstItemsEntradaENP_QUANTIDADE: TFMTBCDField
      FieldName = 'ENP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstItemsEntradaENP_VALOR: TFMTBCDField
      FieldName = 'ENP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItemsEntradaENP_IPI: TFMTBCDField
      FieldName = 'ENP_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItemsEntradaENP_ICMS: TFMTBCDField
      FieldName = 'ENP_ICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItemsEntradaENP_SUBTOTAL: TFMTBCDField
      FieldName = 'ENP_SUBTOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dspEntradas: TDataSetProvider
    DataSet = dstEntradaProdutos
    Options = [poAllowCommandText]
    Left = 112
    Top = 136
  end
  object dspItemsEntrada: TDataSetProvider
    DataSet = dstItemsEntrada
    Options = [poAllowCommandText]
    Left = 104
    Top = 200
  end
  object cdsEntradasProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntradas'
    Left = 176
    Top = 152
    object cdsEntradasProdutosENT_NUMERO: TIntegerField
      FieldName = 'ENT_NUMERO'
      Required = True
    end
    object cdsEntradasProdutosENT_LOJA: TIntegerField
      FieldName = 'ENT_LOJA'
      Required = True
    end
    object cdsEntradasProdutosENT_FORNECEDOR: TIntegerField
      FieldName = 'ENT_FORNECEDOR'
      Required = True
    end
    object cdsEntradasProdutosENT_TRANSPORTADORA: TIntegerField
      FieldName = 'ENT_TRANSPORTADORA'
    end
    object cdsEntradasProdutosENT_DATAPEDIDO: TDateField
      FieldName = 'ENT_DATAPEDIDO'
    end
    object cdsEntradasProdutosENT_DATAENTRADA: TDateField
      FieldName = 'ENT_DATAENTRADA'
    end
    object cdsEntradasProdutosENT_NATUREZAOPERACAO: TStringField
      FieldName = 'ENT_NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object cdsEntradasProdutosENT_DATAEMISSAONOTA: TDateField
      FieldName = 'ENT_DATAEMISSAONOTA'
    end
    object cdsEntradasProdutosENT_NUMERONOTA: TStringField
      FieldName = 'ENT_NUMERONOTA'
      FixedChar = True
      Size = 12
    end
    object cdsEntradasProdutosENT_SERIENOTA: TStringField
      FieldName = 'ENT_SERIENOTA'
      FixedChar = True
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORMERCADORIAS: TFMTBCDField
      FieldName = 'ENT_VALORMERCADORIAS'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_TIPOFRETE: TStringField
      FieldName = 'ENT_TIPOFRETE'
      FixedChar = True
      Size = 1
    end
    object cdsEntradasProdutosENT_VALORFRETE: TFMTBCDField
      FieldName = 'ENT_VALORFRETE'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_BASECALCULOICMS: TFMTBCDField
      FieldName = 'ENT_BASECALCULOICMS'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORICMS: TFMTBCDField
      FieldName = 'ENT_VALORICMS'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_BASECALCULOSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_BASECALCULOSUBSTITUICAO'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORSUBSTITUICAO: TFMTBCDField
      FieldName = 'ENT_VALORSUBSTITUICAO'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORIPI: TFMTBCDField
      FieldName = 'ENT_VALORIPI'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORSEGURO: TFMTBCDField
      FieldName = 'ENT_VALORSEGURO'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_OUTRASPESPESAS: TFMTBCDField
      FieldName = 'ENT_OUTRASPESPESAS'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORDESCONTO: TFMTBCDField
      FieldName = 'ENT_VALORDESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_VALORNOTA: TFMTBCDField
      FieldName = 'ENT_VALORNOTA'
      Precision = 18
      Size = 2
    end
    object cdsEntradasProdutosENT_SITUACAO: TStringField
      FieldName = 'ENT_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsEntradasProdutosENT_USUARIO: TIntegerField
      FieldName = 'ENT_USUARIO'
    end
  end
  object cdsItensEntrada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pITEM'
        ParamType = ptInput
      end>
    ProviderName = 'dspItemsEntrada'
    Left = 176
    Top = 216
    object cdsItensEntradaENP_NUMERO: TIntegerField
      FieldName = 'ENP_NUMERO'
      Required = True
    end
    object cdsItensEntradaENP_PRODUTO: TStringField
      FieldName = 'ENP_PRODUTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsItensEntradaENP_NRITEM: TIntegerField
      FieldName = 'ENP_NRITEM'
      Required = True
    end
    object cdsItensEntradaENP_UNDPRO: TStringField
      FieldName = 'ENP_UNDPRO'
      FixedChar = True
      Size = 2
    end
    object cdsItensEntradaENP_QUANTIDADE: TFMTBCDField
      FieldName = 'ENP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsItensEntradaENP_VALOR: TFMTBCDField
      FieldName = 'ENP_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsItensEntradaENP_IPI: TFMTBCDField
      FieldName = 'ENP_IPI'
      Precision = 18
      Size = 2
    end
    object cdsItensEntradaENP_ICMS: TFMTBCDField
      FieldName = 'ENP_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsItensEntradaENP_SUBTOTAL: TFMTBCDField
      FieldName = 'ENP_SUBTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object cdsProdutosEntrada: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 272
    Data = {
      5F0100009619E0BD01000000180000000A0000000000030000005F010A50524F
      5F434F4449474F0100490000000100055749445448020002000D000850524F5F
      4E4F4D4501004900000001000557494454480200020028000D554E495F444553
      43524943414F01004900000001000557494454480200020002000A50524F5F4E
      524C4F544501004900000001000557494454480200020014000E454E505F5155
      414E544944414445080004000000000009454E505F56414C4F52080004000000
      010007535542545950450200490006004D6F6E65790007454E505F4950490800
      04000000010007535542545950450200490006004D6F6E65790008454E505F49
      434D53080004000000010007535542545950450200490006004D6F6E6579000C
      454E505F535542544F54414C0800040000000100075355425459504502004900
      06004D6F6E6579001050524F5F445456454E43494D454E544F04000600000000
      000000}
    object StringField1: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 13
    end
    object cdsProdutosPRO_NOME: TStringField
      FieldName = 'PRO_NOME'
      Size = 40
    end
    object cdsProdutosUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 2
    end
    object cdsProdutosPRO_NRLOTE: TStringField
      FieldName = 'PRO_NRLOTE'
    end
    object cdsProdutosENP_QUANTIDADE: TFloatField
      FieldName = 'ENP_QUANTIDADE'
      DisplayFormat = '#,##0.##0'
      EditFormat = '#,##0.##0'
    end
    object cdsProdutosENP_VALOR: TCurrencyField
      FieldName = 'ENP_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosENP_IPI: TCurrencyField
      FieldName = 'ENP_IPI'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosENP_ICMS: TCurrencyField
      FieldName = 'ENP_ICMS'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosENP_SUBTOTAL: TCurrencyField
      FieldName = 'ENP_SUBTOTAL'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsProdutosPRO_DTVENCIMENTO: TDateField
      FieldName = 'PRO_DTVENCIMENTO'
    end
  end
  object dstVenda: TSQLDataSet
    CommandText = 
      'select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO) '#13#10'and (MOV_LO' +
      'JA = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 24
    Top = 328
    object dstVendaMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstVendaMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstVendaMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_SEQUENCIA: TIntegerField
      FieldName = 'MOV_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstVendaMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstVendaMOV_DATACANC: TDateField
      FieldName = 'MOV_DATACANC'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_HORACANC: TStringField
      FieldName = 'MOV_HORACANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstVendaMOV_MOTCANC: TStringField
      FieldName = 'MOV_MOTCANC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstVendaMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_ENTRADA: TFMTBCDField
      FieldName = 'MOV_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_DEVOLUSAO: TFMTBCDField
      FieldName = 'MOV_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_TROCO: TFMTBCDField
      FieldName = 'MOV_TROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstVendaDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstVendaDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstVendaDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstVendaDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstVendaDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstVendaDOM_NRFONE: TStringField
      FieldName = 'DOM_NRFONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstVendaMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstVendaMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstVendaMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstVendaMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_OBSERVACAO: TMemoField
      FieldName = 'MOV_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstVendaMOV_MODALIDADE_PEDIDO: TIntegerField
      FieldName = 'MOV_MODALIDADE_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendaMOV_OBS1: TMemoField
      FieldName = 'MOV_OBS1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstVendaMOV_OBS2: TMemoField
      FieldName = 'MOV_OBS2'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
  end
  object dstItensVenda: TSQLDataSet
    CommandText = 'select * from VENDAS_ITENS Where (MOP_PEDIDO = :pPEDIDO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 24
    Top = 384
    object dstItensVendaMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensVendaMOP_NRITEM: TIntegerField
      FieldName = 'MOP_NRITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensVendaMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstItensVendaMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstItensVendaMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstItensVendaMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstItensVendaMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstItensVendaMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstItensVendaMOP_CDVENDEDOR: TIntegerField
      FieldName = 'MOP_CDVENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspVenda: TDataSetProvider
    DataSet = dstVenda
    Options = [poAllowCommandText]
    Left = 96
    Top = 328
  end
  object dspItensVenda: TDataSetProvider
    DataSet = dstItensVenda
    Options = [poAllowCommandText]
    Left = 96
    Top = 384
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspVenda'
    Left = 176
    Top = 328
    object cdsVendaMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      Required = True
    end
    object cdsVendaMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      Required = True
    end
    object cdsVendaMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
    end
    object cdsVendaMOV_SEQUENCIA: TIntegerField
      FieldName = 'MOV_SEQUENCIA'
    end
    object cdsVendaMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
    end
    object cdsVendaMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
      Required = True
    end
    object cdsVendaMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsVendaMOV_DATACANC: TDateField
      FieldName = 'MOV_DATACANC'
    end
    object cdsVendaMOV_HORACANC: TStringField
      FieldName = 'MOV_HORACANC'
      FixedChar = True
      Size = 5
    end
    object cdsVendaMOV_MOTCANC: TStringField
      FieldName = 'MOV_MOTCANC'
      Size = 50
    end
    object cdsVendaMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
    end
    object cdsVendaMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_ENTRADA: TFMTBCDField
      FieldName = 'MOV_ENTRADA'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_DEVOLUSAO: TFMTBCDField
      FieldName = 'MOV_DEVOLUSAO'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_TROCO: TFMTBCDField
      FieldName = 'MOV_TROCO'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsVendaDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      Size = 40
    end
    object cdsVendaDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      Size = 10
    end
    object cdsVendaDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      Size = 30
    end
    object cdsVendaDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      Size = 30
    end
    object cdsVendaDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
    end
    object cdsVendaDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      Size = 50
    end
    object cdsVendaDOM_NRFONE: TStringField
      FieldName = 'DOM_NRFONE'
      FixedChar = True
      Size = 10
    end
    object cdsVendaMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      Size = 40
    end
    object cdsVendaMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
    end
    object cdsVendaMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      FixedChar = True
      Size = 1
    end
    object cdsVendaMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
    end
    object cdsVendaMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
    end
    object cdsVendaMOV_OBSERVACAO: TMemoField
      FieldName = 'MOV_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsVendaMOV_MODALIDADE_PEDIDO: TIntegerField
      FieldName = 'MOV_MODALIDADE_PEDIDO'
    end
    object cdsVendaMOV_OBS1: TMemoField
      FieldName = 'MOV_OBS1'
      BlobType = ftMemo
    end
    object cdsVendaMOV_OBS2: TMemoField
      FieldName = 'MOV_OBS2'
      BlobType = ftMemo
    end
  end
  object cdsItensVenda: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensVenda'
    OnCalcFields = cdsItensVendaCalcFields
    Left = 176
    Top = 384
    object cdsItensVendaMOP_PEDIDO: TIntegerField
      FieldName = 'MOP_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItensVendaMOP_NRITEM: TIntegerField
      FieldName = 'MOP_NRITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItensVendaMOP_PRODUTO: TStringField
      FieldName = 'MOP_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsItensVendaMOP_QUANTIDADE: TFMTBCDField
      FieldName = 'MOP_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object cdsItensVendaMOP_UNIDADE: TStringField
      FieldName = 'MOP_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsItensVendaMOP_VALOR: TFMTBCDField
      FieldName = 'MOP_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsItensVendaMOP_DESCONTO: TFMTBCDField
      FieldName = 'MOP_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsItensVendaMOP_SERIE: TStringField
      FieldName = 'MOP_SERIE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsItensVendaMOP_CUSTO: TFMTBCDField
      FieldName = 'MOP_CUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsItensVendaMOP_COMPRA: TFMTBCDField
      FieldName = 'MOP_COMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsItensVendaMOP_CODCOR: TIntegerField
      FieldName = 'MOP_CODCOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensVendaMOP_VALIPI: TFMTBCDField
      FieldName = 'MOP_VALIPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsItensVendaMOP_CDVENDEDOR: TIntegerField
      FieldName = 'MOP_CDVENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsItensVendaMOP_NMPROD: TStringField
      FieldKind = fkCalculated
      FieldName = 'MOP_NMPROD'
      Size = 40
      Calculated = True
    end
    object cdsItensVendaMOP_SUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MOP_SUBTOTAL'
      Calculated = True
    end
  end
  object cdsDadosItens: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsDadosItensCalcFields
    Left = 256
    Top = 352
    Data = {
      340100009619E0BD01000000180000000C00000000000300000034010A434453
      5F4E5256454E4404000100000000000A4344535F4E524954454D040001000000
      00000A4344535F434450524F440100490000000100055749445448020002000D
      000A4344535F4E4D50524F440100490000000100055749445448020002003C00
      0A4344535F564C554E495408000400000000000A4344535F515450524F440800
      0400000000000B4344535F554E49444144450100490000000100055749445448
      0200020002000A4344535F43445452494204000100000000000A4344535F564C
      4445534308000400000000000A4344535F564C4143524508000400000000000B
      4344535F434442414958410100490000000100055749445448020002000D000E
      4344535F434456454E4445444F5204000100000000000000}
    object cdsItensVendaCDS_NRVEND: TIntegerField
      FieldName = 'CDS_NRVEND'
      DisplayFormat = '0000000'
    end
    object cdsItensVendaCDS_NRITEM: TIntegerField
      FieldName = 'CDS_NRITEM'
      DisplayFormat = '000'
    end
    object cdsItensVendaCDS_CDPROD: TStringField
      FieldName = 'CDS_CDPROD'
      Size = 13
    end
    object cdsItensVendaCDS_NMPROD: TStringField
      FieldName = 'CDS_NMPROD'
      Size = 60
    end
    object cdsItensVendaCDS_VLUNIT: TFloatField
      FieldName = 'CDS_VLUNIT'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsItensVendaCDS_QTPROD: TFloatField
      FieldName = 'CDS_QTPROD'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
    end
    object cdsItensVendaCDS_UNIDADE: TStringField
      FieldName = 'CDS_UNIDADE'
      Size = 2
    end
    object cdsItensVendaCDS_CDTRIB: TIntegerField
      FieldName = 'CDS_CDTRIB'
    end
    object cdsItensVendaCDS_VLDESC: TFloatField
      FieldName = 'CDS_VLDESC'
    end
    object cdsItensVendaCDS_VLACRE: TFloatField
      FieldName = 'CDS_VLACRE'
    end
    object cdsItensVendaCDS_SUBTOT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CDS_SUBTOT'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsItensVendaCDS_SUBTOT2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CDS_SUBTOT2'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
    object cdsItensVendaCDS_CDBAIXA: TStringField
      FieldName = 'CDS_CDBAIXA'
      Size = 13
    end
    object cdsItensVendaCDS_CDVENDEDOR: TIntegerField
      FieldName = 'CDS_CDVENDEDOR'
    end
  end
  object cdsModalidade: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 359
    Top = 356
    Data = {
      DF0000009619E0BD010000001800000007000000000003000000DF000A4D4F44
      5F434F4449474F0400010000000000084D4F445F4E4F4D450100490000000100
      055749445448020002001E000E4D4F445F5045434F4D495353414F0800040000
      0000000E4D4F445F4142524556494143414F0100490000000100055749445448
      020002001400094D4F445F56414C4F5208000400000001000753554254595045
      0200490006004D6F6E6579000A4D4F445F464C46495841010049000000010005
      57494454480200020001000D4D4F445F4E5250415243454C4108000400000000
      000000}
    object cdsModalidadeMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
    end
    object cdsModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
    object cdsModalidadeMOD_PECOMISSAO: TFloatField
      FieldName = 'MOD_PECOMISSAO'
    end
    object cdsModalidadeMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
    end
    object cdsModalidadeMOD_VALOR: TCurrencyField
      FieldName = 'MOD_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
      currency = False
    end
    object cdsModalidadeMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      Size = 1
    end
    object cdsModalidadeMOD_NRPARCELA: TFloatField
      FieldName = 'MOD_NRPARCELA'
    end
  end
  object cdsListaTodasModa: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from MODALIDADE'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 440
    Top = 312
    object cdsListaTodasModaMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
    end
    object cdsListaTodasModaMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Required = True
      Size = 30
    end
    object cdsListaTodasModaMOD_PECOMISSAO: TBCDField
      FieldName = 'MOD_PECOMISSAO'
      Precision = 9
      Size = 2
    end
    object cdsListaTodasModaMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
      FixedChar = True
      Size = 3
    end
    object cdsListaTodasModaMOD_NRPARCELA: TIntegerField
      FieldName = 'MOD_NRPARCELA'
    end
    object cdsListaTodasModaMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      FixedChar = True
      Size = 1
    end
    object cdsListaTodasModaMOD_CAIXA_GERAL: TIntegerField
      FieldName = 'MOD_CAIXA_GERAL'
    end
    object cdsListaTodasModaMOD_AVISTA: TStringField
      FieldName = 'MOD_AVISTA'
      FixedChar = True
      Size = 1
    end
    object cdsListaTodasModaMOD_FLXTEF: TStringField
      FieldName = 'MOD_FLXTEF'
      FixedChar = True
      Size = 1
    end
    object cdsListaTodasModaMOD_PASTA_ENVIA_TEF: TStringField
      FieldName = 'MOD_PASTA_ENVIA_TEF'
      Size = 60
    end
    object cdsListaTodasModaMOD_PASTA_RECEBE_TEF: TStringField
      FieldName = 'MOD_PASTA_RECEBE_TEF'
      Size = 60
    end
  end
  object cdsListaModas: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from MODALIDADE order by MOD_NOME'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 448
    Top = 248
    object cdsListaModasMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
    end
    object cdsListaModasMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Required = True
      Size = 30
    end
    object cdsListaModasMOD_PECOMISSAO: TBCDField
      FieldName = 'MOD_PECOMISSAO'
      Precision = 9
      Size = 2
    end
    object cdsListaModasMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
      FixedChar = True
      Size = 3
    end
    object cdsListaModasMOD_NRPARCELA: TIntegerField
      FieldName = 'MOD_NRPARCELA'
    end
    object cdsListaModasMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      FixedChar = True
      Size = 1
    end
    object cdsListaModasMOD_CAIXA_GERAL: TIntegerField
      FieldName = 'MOD_CAIXA_GERAL'
    end
    object cdsListaModasMOD_AVISTA: TStringField
      FieldName = 'MOD_AVISTA'
      FixedChar = True
      Size = 1
    end
    object cdsListaModasMOD_FLXTEF: TStringField
      FieldName = 'MOD_FLXTEF'
      FixedChar = True
      Size = 1
    end
    object cdsListaModasMOD_PASTA_ENVIA_TEF: TStringField
      FieldName = 'MOD_PASTA_ENVIA_TEF'
      Size = 60
    end
    object cdsListaModasMOD_PASTA_RECEBE_TEF: TStringField
      FieldName = 'MOD_PASTA_RECEBE_TEF'
      Size = 60
    end
  end
  object dstMovimentoCaixa: TSQLDataSet
    CommandText = 'select * from MOVIMENTO_CAIXA Where (MCA_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 440
    Top = 136
    object dstMovimentoCaixaMCA_CODIGO: TIntegerField
      FieldName = 'MCA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMovimentoCaixaMCA_SEQUENCIA: TIntegerField
      FieldName = 'MCA_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoCaixaMCA_LOJA: TIntegerField
      FieldName = 'MCA_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoCaixaMCA_VENDA: TIntegerField
      FieldName = 'MCA_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoCaixaMCA_DTMOVIMENTO: TDateField
      FieldName = 'MCA_DTMOVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_HRMOVIMENTO: TStringField
      FieldName = 'MCA_HRMOVIMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstMovimentoCaixaMCA_MODALIDADE: TIntegerField
      FieldName = 'MCA_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField
      FieldName = 'MCA_VLMODALIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstMovimentoCaixaMCA_TOVENDA: TFMTBCDField
      FieldName = 'MCA_TOVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstMovimentoCaixaMCA_VLTROCO: TFMTBCDField
      FieldName = 'MCA_VLTROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstMovimentoCaixaMCA_OBSEVACAO: TStringField
      FieldName = 'MCA_OBSEVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstMovimentoCaixaMCA_SITUACAO: TStringField
      FieldName = 'MCA_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoCaixaMCA_CAIXA: TIntegerField
      FieldName = 'MCA_CAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_NATUREZA: TIntegerField
      FieldName = 'MCA_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoCaixaMCA_FUNCIONARIO: TIntegerField
      FieldName = 'MCA_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMovimentoCaixa: TDataSetProvider
    DataSet = dstMovimentoCaixa
    Options = [poAllowCommandText]
    Left = 544
    Top = 136
  end
  object cdsMovimentoCaixa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspMovimentoCaixa'
    Left = 496
    Top = 192
    object cdsMovimentoCaixaMCA_CODIGO: TIntegerField
      FieldName = 'MCA_CODIGO'
      Required = True
    end
    object cdsMovimentoCaixaMCA_SEQUENCIA: TIntegerField
      FieldName = 'MCA_SEQUENCIA'
      Required = True
    end
    object cdsMovimentoCaixaMCA_LOJA: TIntegerField
      FieldName = 'MCA_LOJA'
      Required = True
    end
    object cdsMovimentoCaixaMCA_VENDA: TIntegerField
      FieldName = 'MCA_VENDA'
    end
    object cdsMovimentoCaixaMCA_TIPOMOV: TStringField
      FieldName = 'MCA_TIPOMOV'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoCaixaMCA_DTMOVIMENTO: TDateField
      FieldName = 'MCA_DTMOVIMENTO'
    end
    object cdsMovimentoCaixaMCA_HRMOVIMENTO: TStringField
      FieldName = 'MCA_HRMOVIMENTO'
      FixedChar = True
      Size = 5
    end
    object cdsMovimentoCaixaMCA_MODALIDADE: TIntegerField
      FieldName = 'MCA_MODALIDADE'
    end
    object cdsMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField
      FieldName = 'MCA_VLMODALIDADE'
      Precision = 18
      Size = 2
    end
    object cdsMovimentoCaixaMCA_TOVENDA: TFMTBCDField
      FieldName = 'MCA_TOVENDA'
      Precision = 18
      Size = 2
    end
    object cdsMovimentoCaixaMCA_VLTROCO: TFMTBCDField
      FieldName = 'MCA_VLTROCO'
      Precision = 18
      Size = 2
    end
    object cdsMovimentoCaixaMCA_OBSEVACAO: TStringField
      FieldName = 'MCA_OBSEVACAO'
      Size = 40
    end
    object cdsMovimentoCaixaMCA_SITUACAO: TStringField
      FieldName = 'MCA_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsMovimentoCaixaMCA_CAIXA: TIntegerField
      FieldName = 'MCA_CAIXA'
    end
    object cdsMovimentoCaixaMCA_NATUREZA: TIntegerField
      FieldName = 'MCA_NATUREZA'
    end
    object cdsMovimentoCaixaMCA_FUNCIONARIO: TIntegerField
      FieldName = 'MCA_FUNCIONARIO'
    end
  end
  object cdsAddCReceber: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from contasreceber where (REC_CDLOJA = :pLOJA) and (REC' +
      '_IDCONTASRECEBER = :pCREDITO)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 456
    Top = 368
    object cdsAddCReceberREC_SEQUENCIA: TIntegerField
      FieldName = 'REC_SEQUENCIA'
      Required = True
    end
    object cdsAddCReceberREC_CDLOJA: TIntegerField
      FieldName = 'REC_CDLOJA'
      Required = True
    end
    object cdsAddCReceberREC_IDCONTASRECEBER: TIntegerField
      FieldName = 'REC_IDCONTASRECEBER'
      Required = True
    end
    object cdsAddCReceberREC_NRPARCELA: TIntegerField
      FieldName = 'REC_NRPARCELA'
      Required = True
    end
    object cdsAddCReceberREC_NRVENDA: TIntegerField
      FieldName = 'REC_NRVENDA'
    end
    object cdsAddCReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      Required = True
    end
    object cdsAddCReceberREC_DTVENCIMENTO: TDateField
      FieldName = 'REC_DTVENCIMENTO'
    end
    object cdsAddCReceberREC_DTPAGAMENTO: TDateField
      FieldName = 'REC_DTPAGAMENTO'
    end
    object cdsAddCReceberREC_VALOR: TFMTBCDField
      FieldName = 'REC_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_SITUACAO: TStringField
      FieldName = 'REC_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsAddCReceberREC_DTMOVI: TDateField
      FieldName = 'REC_DTMOVI'
    end
    object cdsAddCReceberREC_HOMOVI: TStringField
      FieldName = 'REC_HOMOVI'
      FixedChar = True
      Size = 5
    end
    object cdsAddCReceberREC_USCADA: TIntegerField
      FieldName = 'REC_USCADA'
    end
    object cdsAddCReceberREC_USALTE: TIntegerField
      FieldName = 'REC_USALTE'
    end
    object cdsAddCReceberREC_DTALTE: TDateField
      FieldName = 'REC_DTALTE'
    end
    object cdsAddCReceberREC_HOALTE: TStringField
      FieldName = 'REC_HOALTE'
      FixedChar = True
      Size = 5
    end
    object cdsAddCReceberREC_NATUREZA: TIntegerField
      FieldName = 'REC_NATUREZA'
    end
    object cdsAddCReceberREC_OBSERVACAO: TMemoField
      FieldName = 'REC_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsAddCReceberREC_QTPARCELAS: TIntegerField
      FieldName = 'REC_QTPARCELAS'
    end
    object cdsAddCReceberREC_VALORACRESIMO: TFMTBCDField
      FieldName = 'REC_VALORACRESIMO'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_VALORJUROS: TFMTBCDField
      FieldName = 'REC_VALORJUROS'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_VALORDESCONTO: TFMTBCDField
      FieldName = 'REC_VALORDESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_VLPAGO: TFMTBCDField
      FieldName = 'REC_VLPAGO'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_VLRESTANTE: TFMTBCDField
      FieldName = 'REC_VLRESTANTE'
      Precision = 18
      Size = 2
    end
    object cdsAddCReceberREC_BANCO: TIntegerField
      FieldName = 'REC_BANCO'
    end
    object cdsAddCReceberREC_AGENCIA: TStringField
      FieldName = 'REC_AGENCIA'
      Size = 6
    end
    object cdsAddCReceberREC_NRCONTA: TStringField
      FieldName = 'REC_NRCONTA'
      Size = 12
    end
    object cdsAddCReceberREC_NRCHEQUE: TStringField
      FieldName = 'REC_NRCHEQUE'
      Size = 10
    end
    object cdsAddCReceberREC_MODALIDADE: TIntegerField
      FieldName = 'REC_MODALIDADE'
    end
    object cdsAddCReceberREC_DTCREDITO: TDateField
      FieldName = 'REC_DTCREDITO'
    end
  end
  object dstBanco: TSQLDataSet
    CommandText = 
      'select BAN_CODIGO, BAN_NOME from BANCOS '#13#10'Where (BAN_CODIGO = :p' +
      'CODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = dmDados.sqlConexao
    Left = 256
    Top = 408
    object dstBancoBAN_CODIGO: TIntegerField
      FieldName = 'BAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstBancoBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object cdsBanco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBanco'
    Left = 384
    Top = 408
    object cdsBancoBAN_CODIGO: TIntegerField
      FieldName = 'BAN_CODIGO'
      Required = True
      DisplayFormat = '000'
      EditFormat = '###'
    end
    object cdsBancoBAN_NOME: TStringField
      FieldName = 'BAN_NOME'
      Size = 40
    end
  end
  object dspBanco: TDataSetProvider
    DataSet = dstBanco
    Options = [poAllowCommandText]
    OnGetTableName = dspBancoGetTableName
    Left = 320
    Top = 408
  end
  object ppRepVenda: TppReport
    AutoStop = False
    DataPipeline = ppDBPVenda
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 552
    Top = 264
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPVenda'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 72496
      mmPrintPosition = 0
      object ppImgLogo: TppImage
        UserName = 'ImgLogo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 30692
        mmLeft = 5821
        mmTop = 3969
        mmWidth = 44186
        BandType = 0
      end
      object txtCabecalho: TppMemo
        UserName = 'txtCabecalho'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 16404
        mmLeft = 53446
        mmTop = 5821
        mmWidth = 137054
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object txtVenda: TppLabel
        UserName = 'txtVenda'
        Caption = 'VENDA : 0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6646
        mmLeft = 143669
        mmTop = 26458
        mmWidth = 46482
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 794
        mmTop = 38894
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 42863
        mmWidth = 8805
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 30427
        mmTop = 42598
        mmWidth = 9186
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 53711
        mmWidth = 12912
        BandType = 0
      end
      object txtData: TppLabel
        UserName = 'txtData'
        Caption = 'txtData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 48419
        mmWidth = 23283
        BandType = 0
      end
      object txtHora: TppLabel
        UserName = 'txtData1'
        Caption = 'txtData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 48419
        mmWidth = 23283
        BandType = 0
      end
      object txtCliente: TppLabel
        UserName = 'txtCliente'
        Caption = 'txtCliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 59002
        mmWidth = 100806
        BandType = 0
      end
      object lblCPF: TppLabel
        UserName = 'lblCPF'
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 108479
        mmTop = 53711
        mmWidth = 7027
        BandType = 0
      end
      object txtCPF: TppLabel
        UserName = 'txtCPF'
        Caption = 'txtCPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 108479
        mmTop = 59002
        mmWidth = 35983
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 64029
        mmWidth = 195527
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 2117
        mmTop = 70115
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 65352
        mmWidth = 8509
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'C'#211'DIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 14288
        mmTop = 65352
        mmWidth = 14309
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'DESCRI'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 42069
        mmTop = 65352
        mmWidth = 20955
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 128059
        mmTop = 65352
        mmWidth = 13420
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'UND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 65352
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'VL. UNIT'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 143934
        mmTop = 65352
        mmWidth = 23368
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'SUB-TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 170127
        mmTop = 65352
        mmWidth = 20320
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MOP_NRITEM'
        DataPipeline = ppDBPVenda
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MOP_PRODUTO'
        DataPipeline = ppDBPVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 4022
        mmLeft = 14817
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MOP_UNIDADE'
        DataPipeline = ppDBPVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 3969
        mmLeft = 118004
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MOP_QUANTIDADE'
        DataPipeline = ppDBPVenda
        DisplayFormat = '##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 3969
        mmLeft = 128059
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MOP_VALOR'
        DataPipeline = ppDBPVenda
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 4022
        mmLeft = 143934
        mmTop = 0
        mmWidth = 23368
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'MOP_SUBTOTAL'
        DataPipeline = ppDBPVenda
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 4022
        mmLeft = 170127
        mmTop = 0
        mmWidth = 20320
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MOP_NMPROD'
        DataPipeline = ppDBPVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 4022
        mmLeft = 42069
        mmTop = 0
        mmWidth = 74348
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Data/Hora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138377
        mmTop = 3440
        mmWidth = 16933
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138377
        mmTop = 8202
        mmWidth = 11906
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 3440
        mmWidth = 32015
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 8202
        mmWidth = 1852
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 71438
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 794
        mmWidth = 195527
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Registro(s):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 19770
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 4022
        mmLeft = 26194
        mmTop = 2646
        mmWidth = 13494
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'VALOR VENDA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 10848
        mmWidth = 26458
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'DESCONTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 17198
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'TOTAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 24077
        mmWidth = 12912
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'FORMA PAGAMENTO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 5027
        mmTop = 30692
        mmWidth = 37761
        BandType = 7
      end
      object mnoFormaPG: TppMemo
        UserName = 'mnoFormaPG'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 23548
        mmLeft = 5027
        mmTop = 36777
        mmWidth = 53446
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object mnoFormaPG1: TppMemo
        UserName = 'mnoFormaPG1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 23548
        mmLeft = 59531
        mmTop = 36777
        mmWidth = 22490
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object txtDesconto: TppLabel
        UserName = 'txtValorVenda1'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 34396
        mmTop = 17198
        mmWidth = 20373
        BandType = 7
      end
      object txtTOTAL: TppLabel
        UserName = 'txtTOTAL'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 34396
        mmTop = 24077
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'MOP_SUBTOTAL'
        DataPipeline = ppDBPVenda
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 3969
        mmLeft = 170127
        mmTop = 2646
        mmWidth = 20320
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'MOP_SUBTOTAL'
        DataPipeline = ppDBPVenda
        DisplayFormat = '###,##0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPVenda'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 10583
        mmWidth = 20373
        BandType = 7
      end
    end
  end
  object ppDBPVenda: TppDBPipeline
    DataSource = dsItensVenda
    UserName = 'DBPVenda'
    Left = 552
    Top = 312
    object ppDBPVendappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_PEDIDO'
      FieldName = 'MOP_PEDIDO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPVendappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_NRITEM'
      FieldName = 'MOP_NRITEM'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPVendappField3: TppField
      FieldAlias = 'MOP_PRODUTO'
      FieldName = 'MOP_PRODUTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object ppDBPVendappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_QUANTIDADE'
      FieldName = 'MOP_QUANTIDADE'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object ppDBPVendappField5: TppField
      FieldAlias = 'MOP_UNIDADE'
      FieldName = 'MOP_UNIDADE'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppDBPVendappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_VALOR'
      FieldName = 'MOP_VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object ppDBPVendappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_DESCONTO'
      FieldName = 'MOP_DESCONTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object ppDBPVendappField8: TppField
      FieldAlias = 'MOP_SERIE'
      FieldName = 'MOP_SERIE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBPVendappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_CUSTO'
      FieldName = 'MOP_CUSTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object ppDBPVendappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_COMPRA'
      FieldName = 'MOP_COMPRA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 9
    end
    object ppDBPVendappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_CODCOR'
      FieldName = 'MOP_CODCOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPVendappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_VALIPI'
      FieldName = 'MOP_VALIPI'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 11
    end
    object ppDBPVendappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOP_CDVENDEDOR'
      FieldName = 'MOP_CDVENDEDOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
  end
  object dsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 552
    Top = 368
  end
  object cdsFormaPGVenda: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select MC.MCA_CODIGO, MC.mca_sequencia, MC.MCA_LOJA, MC.mca_vend' +
      'a, MC.mca_modalidade, MC.mca_vlmodalidade, MC.mca_obsevacao from' +
      ' MOVIMENTO_CAIXA MC Where (MC.MCA_VENDA = :pVENDA)'
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 544
    Top = 56
    object cdsFormaPGVendaMCA_CODIGO: TIntegerField
      FieldName = 'MCA_CODIGO'
      Required = True
    end
    object cdsFormaPGVendaMCA_SEQUENCIA: TIntegerField
      FieldName = 'MCA_SEQUENCIA'
      Required = True
    end
    object cdsFormaPGVendaMCA_LOJA: TIntegerField
      FieldName = 'MCA_LOJA'
      Required = True
    end
    object cdsFormaPGVendaMCA_VENDA: TIntegerField
      FieldName = 'MCA_VENDA'
    end
    object cdsFormaPGVendaMCA_MODALIDADE: TIntegerField
      FieldName = 'MCA_MODALIDADE'
    end
    object cdsFormaPGVendaMCA_VLMODALIDADE: TFMTBCDField
      FieldName = 'MCA_VLMODALIDADE'
      Precision = 18
      Size = 2
    end
    object cdsFormaPGVendaMCA_OBSEVACAO: TStringField
      FieldName = 'MCA_OBSEVACAO'
      Size = 40
    end
  end
end
