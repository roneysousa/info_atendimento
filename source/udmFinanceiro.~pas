unit udmFinanceiro;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppVar, ppCtrls,
  ppStrtch, ppMemo, ppPrnabl, ppBands, ppCache, Forms;

type
  TdmFinanceiro = class(TDataModule)
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsListaFornecedores: TClientDataSet;
    cdsListaNaturezas: TClientDataSet;
    cdsListaFornecedoresFOR_CODIGO: TIntegerField;
    cdsListaFornecedoresFOR_RAZAO: TStringField;
    cdsListaFornecedoresFOR_FANTASIA: TStringField;
    cdsListaNaturezasNAT_CODIGO: TIntegerField;
    cdsListaNaturezasNAT_NOME: TStringField;
    cdsListaNaturezasNAT_TIPO: TStringField;
    cdsParcelasCP: TClientDataSet;
    cdsParcelasCPPAR_ID: TIntegerField;
    cdsParcelasCPPAR_NRPARC: TIntegerField;
    cdsParcelasCPPAR_DTVENC: TDateField;
    cdsParcelasCPPAR_VALOR: TFloatField;
    cdsParcelasCPPAR_DTPAGA: TDateField;
    cdsParcelasCPPAR_SITUACAO: TStringField;
    cdsParcelasCPPAR_BANCO: TIntegerField;
    cdsParcelasCPPAR_AGENCIA: TStringField;
    cdsParcelasCPPAR_NRCONTA: TStringField;
    cdsParcelasCPPAR_NRCHEQUE: TStringField;
    cdsListaPCPagar: TClientDataSet;
    dstContaReceber: TSQLDataSet;
    dspCReceber: TDataSetProvider;
    cdsCReceber: TClientDataSet;
    dstContaReceberREC_SEQUENCIA: TIntegerField;
    dstContaReceberREC_CDLOJA: TIntegerField;
    dstContaReceberREC_IDCONTASRECEBER: TIntegerField;
    dstContaReceberREC_NRPARCELA: TIntegerField;
    dstContaReceberREC_CLIENTE: TIntegerField;
    dstContaReceberREC_DTVENCIMENTO: TDateField;
    dstContaReceberREC_DTPAGAMENTO: TDateField;
    dstContaReceberREC_VALOR: TFMTBCDField;
    dstContaReceberREC_SITUACAO: TStringField;
    dstContaReceberREC_DTMOVI: TDateField;
    dstContaReceberREC_HOMOVI: TStringField;
    dstContaReceberREC_USCADA: TIntegerField;
    dstContaReceberREC_USALTE: TIntegerField;
    dstContaReceberREC_DTALTE: TDateField;
    dstContaReceberREC_HOALTE: TStringField;
    dstContaReceberREC_NATUREZA: TIntegerField;
    dstContaReceberREC_OBSERVACAO: TMemoField;
    dstContaReceberREC_QTPARCELAS: TIntegerField;
    dstContaReceberREC_VALORACRESIMO: TFMTBCDField;
    dstContaReceberREC_VALORJUROS: TFMTBCDField;
    dstContaReceberREC_VALORDESCONTO: TFMTBCDField;
    dstContaReceberREC_VLPAGO: TFMTBCDField;
    dstContaReceberREC_VLRESTANTE: TFMTBCDField;
    dstContaReceberREC_BANCO: TIntegerField;
    dstContaReceberREC_AGENCIA: TStringField;
    dstContaReceberREC_NRCONTA: TStringField;
    dstContaReceberREC_NRCHEQUE: TStringField;
    dstContaReceberREC_MODALIDADE: TIntegerField;
    dstContaReceberREC_DTCREDITO: TDateField;
    cdsCReceberREC_SEQUENCIA: TIntegerField;
    cdsCReceberREC_CDLOJA: TIntegerField;
    cdsCReceberREC_IDCONTASRECEBER: TIntegerField;
    cdsCReceberREC_NRPARCELA: TIntegerField;
    cdsCReceberREC_CLIENTE: TIntegerField;
    cdsCReceberREC_DTVENCIMENTO: TDateField;
    cdsCReceberREC_DTPAGAMENTO: TDateField;
    cdsCReceberREC_VALOR: TFMTBCDField;
    cdsCReceberREC_SITUACAO: TStringField;
    cdsCReceberREC_DTMOVI: TDateField;
    cdsCReceberREC_HOMOVI: TStringField;
    cdsCReceberREC_USCADA: TIntegerField;
    cdsCReceberREC_USALTE: TIntegerField;
    cdsCReceberREC_DTALTE: TDateField;
    cdsCReceberREC_HOALTE: TStringField;
    cdsCReceberREC_NATUREZA: TIntegerField;
    cdsCReceberREC_OBSERVACAO: TMemoField;
    cdsCReceberREC_QTPARCELAS: TIntegerField;
    cdsCReceberREC_VALORACRESIMO: TFMTBCDField;
    cdsCReceberREC_VALORJUROS: TFMTBCDField;
    cdsCReceberREC_VALORDESCONTO: TFMTBCDField;
    cdsCReceberREC_VLPAGO: TFMTBCDField;
    cdsCReceberREC_VLRESTANTE: TFMTBCDField;
    cdsCReceberREC_BANCO: TIntegerField;
    cdsCReceberREC_AGENCIA: TStringField;
    cdsCReceberREC_NRCONTA: TStringField;
    cdsCReceberREC_NRCHEQUE: TStringField;
    cdsCReceberREC_MODALIDADE: TIntegerField;
    cdsCReceberREC_DTCREDITO: TDateField;
    cdsListaPCReceber: TClientDataSet;
    cdsCReceberREC_NMNATUREZA: TStringField;
    cdsListaModalidades: TClientDataSet;
    cdsListaModalidadesMOD_CODIGO: TIntegerField;
    cdsListaModalidadesMOD_NOME: TStringField;
    cdsListaBanco: TClientDataSet;
    cdsCReceberREC_NMBANCO: TStringField;
    cdsCReceberREC_NMMODALIDADE: TStringField;
    cdsCReceberREC_PARCELAS: TStringField;
    cdsCReceberREC_ATRASO: TFloatField;
    dstContaPagar: TSQLDataSet;
    dstContaPagarPAG_SEQUENCIA: TIntegerField;
    dstContaPagarPAG_IDCONTA: TIntegerField;
    dstContaPagarPAG_NRPARCELA: TIntegerField;
    dstContaPagarPAG_CDLOJA: TIntegerField;
    dstContaPagarPAG_QTPARCELAS: TIntegerField;
    dstContaPagarPAG_DTVENCIMENTO: TDateField;
    dstContaPagarPAG_DTCOMPRA: TDateField;
    dstContaPagarPAG_NUMERONOTAFISCAL: TStringField;
    dstContaPagarPAG_SERIENOTAFISCAL: TStringField;
    dstContaPagarPAG_VALORPARCELA: TFMTBCDField;
    dstContaPagarPAG_DTPAGAMENTO: TDateField;
    dstContaPagarPAG_IDFORNECEDOR: TIntegerField;
    dstContaPagarPAG_HOMOVI: TStringField;
    dstContaPagarPAG_USALTE: TIntegerField;
    dstContaPagarPAG_DTALTE: TDateField;
    dstContaPagarPAG_HOALTE: TStringField;
    dstContaPagarPAG_USCADA: TIntegerField;
    dstContaPagarPAG_SITUACAO: TStringField;
    dstContaPagarPAG_NATUREZADESPESA: TIntegerField;
    dstContaPagarPAG_DESCONTOANTECIPADO: TFMTBCDField;
    dstContaPagarPAG_DESCRICAO: TMemoField;
    dstContaPagarPAG_VALORPAGO: TFMTBCDField;
    dstContaPagarPAG_VALORDESCONTO: TFMTBCDField;
    dstContaPagarPAG_VALORJUROS: TFMTBCDField;
    dstContaPagarPAG_MODALIDADE: TIntegerField;
    dstContaPagarPAG_BANCO: TIntegerField;
    dstContaPagarPAG_NRCONTA: TStringField;
    dstContaPagarPAG_NRCHEQUE: TStringField;
    dstContaPagarPAG_AGENCIA: TStringField;
    dspContaPagar: TDataSetProvider;
    cdsContaPagar: TClientDataSet;
    cdsContaPagarPAG_SEQUENCIA: TIntegerField;
    cdsContaPagarPAG_IDCONTA: TIntegerField;
    cdsContaPagarPAG_NRPARCELA: TIntegerField;
    cdsContaPagarPAG_CDLOJA: TIntegerField;
    cdsContaPagarPAG_QTPARCELAS: TIntegerField;
    cdsContaPagarPAG_DTVENCIMENTO: TDateField;
    cdsContaPagarPAG_DTCOMPRA: TDateField;
    cdsContaPagarPAG_NUMERONOTAFISCAL: TStringField;
    cdsContaPagarPAG_SERIENOTAFISCAL: TStringField;
    cdsContaPagarPAG_VALORPARCELA: TFMTBCDField;
    cdsContaPagarPAG_DTPAGAMENTO: TDateField;
    cdsContaPagarPAG_IDFORNECEDOR: TIntegerField;
    cdsContaPagarPAG_HOMOVI: TStringField;
    cdsContaPagarPAG_USALTE: TIntegerField;
    cdsContaPagarPAG_DTALTE: TDateField;
    cdsContaPagarPAG_HOALTE: TStringField;
    cdsContaPagarPAG_USCADA: TIntegerField;
    cdsContaPagarPAG_SITUACAO: TStringField;
    cdsContaPagarPAG_NATUREZADESPESA: TIntegerField;
    cdsContaPagarPAG_DESCONTOANTECIPADO: TFMTBCDField;
    cdsContaPagarPAG_DESCRICAO: TMemoField;
    cdsContaPagarPAG_VALORPAGO: TFMTBCDField;
    cdsContaPagarPAG_VALORDESCONTO: TFMTBCDField;
    cdsContaPagarPAG_VALORJUROS: TFMTBCDField;
    cdsContaPagarPAG_MODALIDADE: TIntegerField;
    cdsContaPagarPAG_BANCO: TIntegerField;
    cdsContaPagarPAG_NRCONTA: TStringField;
    cdsContaPagarPAG_NRCHEQUE: TStringField;
    cdsContaPagarPAG_AGENCIA: TStringField;
    cdsContaPagarPAG_NMFORN: TStringField;
    cdsContaPagarPAG_NMNATU: TStringField;
    cdsContaPagarPAG_NMMODALIDADE: TStringField;
    cdsContaPagarPAG_NMBANCO: TStringField;
    cdsContaPagarPAG_ATRASO: TFloatField;
    dstEntradaProdutos: TSQLDataSet;
    dstItemsEntrada: TSQLDataSet;
    dspEntradas: TDataSetProvider;
    dspItemsEntrada: TDataSetProvider;
    cdsEntradasProdutos: TClientDataSet;
    cdsItensEntrada: TClientDataSet;
    dstEntradaProdutosENT_NUMERO: TIntegerField;
    dstEntradaProdutosENT_LOJA: TIntegerField;
    dstEntradaProdutosENT_FORNECEDOR: TIntegerField;
    dstEntradaProdutosENT_TRANSPORTADORA: TIntegerField;
    dstEntradaProdutosENT_DATAPEDIDO: TDateField;
    dstEntradaProdutosENT_DATAENTRADA: TDateField;
    dstEntradaProdutosENT_NATUREZAOPERACAO: TStringField;
    dstEntradaProdutosENT_DATAEMISSAONOTA: TDateField;
    dstEntradaProdutosENT_NUMERONOTA: TStringField;
    dstEntradaProdutosENT_SERIENOTA: TStringField;
    dstEntradaProdutosENT_VALORMERCADORIAS: TFMTBCDField;
    dstEntradaProdutosENT_TIPOFRETE: TStringField;
    dstEntradaProdutosENT_VALORFRETE: TFMTBCDField;
    dstEntradaProdutosENT_BASECALCULOICMS: TFMTBCDField;
    dstEntradaProdutosENT_VALORICMS: TFMTBCDField;
    dstEntradaProdutosENT_BASECALCULOSUBSTITUICAO: TFMTBCDField;
    dstEntradaProdutosENT_VALORSUBSTITUICAO: TFMTBCDField;
    dstEntradaProdutosENT_VALORIPI: TFMTBCDField;
    dstEntradaProdutosENT_VALORSEGURO: TFMTBCDField;
    dstEntradaProdutosENT_OUTRASPESPESAS: TFMTBCDField;
    dstEntradaProdutosENT_VALORDESCONTO: TFMTBCDField;
    dstEntradaProdutosENT_VALORNOTA: TFMTBCDField;
    dstEntradaProdutosENT_SITUACAO: TStringField;
    dstEntradaProdutosENT_USUARIO: TIntegerField;
    cdsEntradasProdutosENT_NUMERO: TIntegerField;
    cdsEntradasProdutosENT_LOJA: TIntegerField;
    cdsEntradasProdutosENT_FORNECEDOR: TIntegerField;
    cdsEntradasProdutosENT_TRANSPORTADORA: TIntegerField;
    cdsEntradasProdutosENT_DATAPEDIDO: TDateField;
    cdsEntradasProdutosENT_DATAENTRADA: TDateField;
    cdsEntradasProdutosENT_NATUREZAOPERACAO: TStringField;
    cdsEntradasProdutosENT_DATAEMISSAONOTA: TDateField;
    cdsEntradasProdutosENT_NUMERONOTA: TStringField;
    cdsEntradasProdutosENT_SERIENOTA: TStringField;
    cdsEntradasProdutosENT_VALORMERCADORIAS: TFMTBCDField;
    cdsEntradasProdutosENT_TIPOFRETE: TStringField;
    cdsEntradasProdutosENT_VALORFRETE: TFMTBCDField;
    cdsEntradasProdutosENT_BASECALCULOICMS: TFMTBCDField;
    cdsEntradasProdutosENT_VALORICMS: TFMTBCDField;
    cdsEntradasProdutosENT_BASECALCULOSUBSTITUICAO: TFMTBCDField;
    cdsEntradasProdutosENT_VALORSUBSTITUICAO: TFMTBCDField;
    cdsEntradasProdutosENT_VALORIPI: TFMTBCDField;
    cdsEntradasProdutosENT_VALORSEGURO: TFMTBCDField;
    cdsEntradasProdutosENT_OUTRASPESPESAS: TFMTBCDField;
    cdsEntradasProdutosENT_VALORDESCONTO: TFMTBCDField;
    cdsEntradasProdutosENT_VALORNOTA: TFMTBCDField;
    cdsEntradasProdutosENT_SITUACAO: TStringField;
    cdsEntradasProdutosENT_USUARIO: TIntegerField;
    cdsProdutosEntrada: TClientDataSet;
    StringField1: TStringField;
    cdsProdutosPRO_NOME: TStringField;
    cdsProdutosUNI_DESCRICAO: TStringField;
    cdsProdutosPRO_NRLOTE: TStringField;
    cdsProdutosENP_QUANTIDADE: TFloatField;
    cdsProdutosENP_VALOR: TCurrencyField;
    cdsProdutosENP_IPI: TCurrencyField;
    cdsProdutosENP_ICMS: TCurrencyField;
    cdsProdutosENP_SUBTOTAL: TCurrencyField;
    cdsProdutosPRO_DTVENCIMENTO: TDateField;
    dstItemsEntradaENP_NUMERO: TIntegerField;
    dstItemsEntradaENP_PRODUTO: TStringField;
    dstItemsEntradaENP_NRITEM: TIntegerField;
    dstItemsEntradaENP_UNDPRO: TStringField;
    dstItemsEntradaENP_QUANTIDADE: TFMTBCDField;
    dstItemsEntradaENP_VALOR: TFMTBCDField;
    dstItemsEntradaENP_IPI: TFMTBCDField;
    dstItemsEntradaENP_ICMS: TFMTBCDField;
    dstItemsEntradaENP_SUBTOTAL: TFMTBCDField;
    cdsItensEntradaENP_NUMERO: TIntegerField;
    cdsItensEntradaENP_PRODUTO: TStringField;
    cdsItensEntradaENP_NRITEM: TIntegerField;
    cdsItensEntradaENP_UNDPRO: TStringField;
    cdsItensEntradaENP_QUANTIDADE: TFMTBCDField;
    cdsItensEntradaENP_VALOR: TFMTBCDField;
    cdsItensEntradaENP_IPI: TFMTBCDField;
    cdsItensEntradaENP_ICMS: TFMTBCDField;
    cdsItensEntradaENP_SUBTOTAL: TFMTBCDField;
    dstVenda: TSQLDataSet;
    dstItensVenda: TSQLDataSet;
    dspVenda: TDataSetProvider;
    dspItensVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
    cdsItensVenda: TClientDataSet;
    dstVendaMOV_PEDIDO: TIntegerField;
    dstVendaMOV_LOJA: TIntegerField;
    dstVendaMOV_CUPOM: TIntegerField;
    dstVendaMOV_SEQUENCIA: TIntegerField;
    dstVendaMOV_CLIENTE: TIntegerField;
    dstVendaMOV_DATAVENDA: TDateField;
    dstVendaMOV_HORAVENDA: TStringField;
    dstVendaMOV_DATACANC: TDateField;
    dstVendaMOV_HORACANC: TStringField;
    dstVendaMOV_MOTCANC: TStringField;
    dstVendaMOV_VENDEDOR: TIntegerField;
    dstVendaMOV_VALOR: TFMTBCDField;
    dstVendaMOV_ENTRADA: TFMTBCDField;
    dstVendaMOV_DESCONTO: TFMTBCDField;
    dstVendaMOV_ACRESCIMO: TFMTBCDField;
    dstVendaMOV_DEVOLUSAO: TFMTBCDField;
    dstVendaMOV_TROCO: TFMTBCDField;
    dstVendaMOV_SITUACAO: TStringField;
    dstVendaDOM_ENDERECO: TStringField;
    dstVendaDOM_NUMERO: TStringField;
    dstVendaDOM_COMPLEMENTO: TStringField;
    dstVendaDOM_BAIRRO: TStringField;
    dstVendaDOM_CIDADE: TStringField;
    dstVendaDOM_REFERE: TStringField;
    dstVendaDOM_NRFONE: TStringField;
    dstVendaMOV_NOMECLIENTE: TStringField;
    dstVendaMOV_TABELA: TIntegerField;
    dstVendaMOV_TIPO_FRETE: TStringField;
    dstVendaMOV_PERC_FRETE: TFMTBCDField;
    dstVendaMOV_IDTRANSPORTADORA: TIntegerField;
    dstVendaMOV_TABELA_PLANO: TIntegerField;
    dstVendaMOV_OBSERVACAO: TMemoField;
    dstVendaMOV_MODALIDADE_PEDIDO: TIntegerField;
    dstVendaMOV_OBS1: TMemoField;
    dstVendaMOV_OBS2: TMemoField;
    dstItensVendaMOP_PEDIDO: TIntegerField;
    dstItensVendaMOP_NRITEM: TIntegerField;
    dstItensVendaMOP_PRODUTO: TStringField;
    dstItensVendaMOP_QUANTIDADE: TFMTBCDField;
    dstItensVendaMOP_UNIDADE: TStringField;
    dstItensVendaMOP_VALOR: TFMTBCDField;
    dstItensVendaMOP_DESCONTO: TFMTBCDField;
    dstItensVendaMOP_SERIE: TStringField;
    dstItensVendaMOP_CUSTO: TFMTBCDField;
    dstItensVendaMOP_COMPRA: TFMTBCDField;
    dstItensVendaMOP_CODCOR: TIntegerField;
    dstItensVendaMOP_VALIPI: TFMTBCDField;
    dstItensVendaMOP_CDVENDEDOR: TIntegerField;
    cdsVendaMOV_PEDIDO: TIntegerField;
    cdsVendaMOV_LOJA: TIntegerField;
    cdsVendaMOV_CUPOM: TIntegerField;
    cdsVendaMOV_SEQUENCIA: TIntegerField;
    cdsVendaMOV_CLIENTE: TIntegerField;
    cdsVendaMOV_DATAVENDA: TDateField;
    cdsVendaMOV_HORAVENDA: TStringField;
    cdsVendaMOV_DATACANC: TDateField;
    cdsVendaMOV_HORACANC: TStringField;
    cdsVendaMOV_MOTCANC: TStringField;
    cdsVendaMOV_VENDEDOR: TIntegerField;
    cdsVendaMOV_VALOR: TFMTBCDField;
    cdsVendaMOV_ENTRADA: TFMTBCDField;
    cdsVendaMOV_DESCONTO: TFMTBCDField;
    cdsVendaMOV_ACRESCIMO: TFMTBCDField;
    cdsVendaMOV_DEVOLUSAO: TFMTBCDField;
    cdsVendaMOV_TROCO: TFMTBCDField;
    cdsVendaMOV_SITUACAO: TStringField;
    cdsVendaDOM_ENDERECO: TStringField;
    cdsVendaDOM_NUMERO: TStringField;
    cdsVendaDOM_COMPLEMENTO: TStringField;
    cdsVendaDOM_BAIRRO: TStringField;
    cdsVendaDOM_CIDADE: TStringField;
    cdsVendaDOM_REFERE: TStringField;
    cdsVendaDOM_NRFONE: TStringField;
    cdsVendaMOV_NOMECLIENTE: TStringField;
    cdsVendaMOV_TABELA: TIntegerField;
    cdsVendaMOV_TIPO_FRETE: TStringField;
    cdsVendaMOV_PERC_FRETE: TFMTBCDField;
    cdsVendaMOV_IDTRANSPORTADORA: TIntegerField;
    cdsVendaMOV_TABELA_PLANO: TIntegerField;
    cdsVendaMOV_OBSERVACAO: TMemoField;
    cdsVendaMOV_MODALIDADE_PEDIDO: TIntegerField;
    cdsVendaMOV_OBS1: TMemoField;
    cdsVendaMOV_OBS2: TMemoField;
    cdsItensVendaMOP_PEDIDO: TIntegerField;
    cdsItensVendaMOP_NRITEM: TIntegerField;
    cdsItensVendaMOP_PRODUTO: TStringField;
    cdsItensVendaMOP_QUANTIDADE: TFMTBCDField;
    cdsItensVendaMOP_UNIDADE: TStringField;
    cdsItensVendaMOP_VALOR: TFMTBCDField;
    cdsItensVendaMOP_DESCONTO: TFMTBCDField;
    cdsItensVendaMOP_SERIE: TStringField;
    cdsItensVendaMOP_CUSTO: TFMTBCDField;
    cdsItensVendaMOP_COMPRA: TFMTBCDField;
    cdsItensVendaMOP_CODCOR: TIntegerField;
    cdsItensVendaMOP_VALIPI: TFMTBCDField;
    cdsItensVendaMOP_CDVENDEDOR: TIntegerField;
    cdsDadosItens: TClientDataSet;
    cdsItensVendaCDS_NRVEND: TIntegerField;
    cdsItensVendaCDS_NRITEM: TIntegerField;
    cdsItensVendaCDS_CDPROD: TStringField;
    cdsItensVendaCDS_NMPROD: TStringField;
    cdsItensVendaCDS_VLUNIT: TFloatField;
    cdsItensVendaCDS_QTPROD: TFloatField;
    cdsItensVendaCDS_UNIDADE: TStringField;
    cdsItensVendaCDS_CDTRIB: TIntegerField;
    cdsItensVendaCDS_VLDESC: TFloatField;
    cdsItensVendaCDS_VLACRE: TFloatField;
    cdsItensVendaCDS_SUBTOT: TFloatField;
    cdsItensVendaCDS_SUBTOT2: TFloatField;
    cdsItensVendaCDS_CDBAIXA: TStringField;
    cdsItensVendaCDS_CDVENDEDOR: TIntegerField;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TFloatField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    cdsModalidadeMOD_VALOR: TCurrencyField;
    cdsModalidadeMOD_FLFIXA: TStringField;
    cdsModalidadeMOD_NRPARCELA: TFloatField;
    cdsListaTodasModa: TClientDataSet;
    cdsListaTodasModaMOD_CODIGO: TIntegerField;
    cdsListaTodasModaMOD_NOME: TStringField;
    cdsListaTodasModaMOD_PECOMISSAO: TBCDField;
    cdsListaTodasModaMOD_ABREVIACAO: TStringField;
    cdsListaTodasModaMOD_NRPARCELA: TIntegerField;
    cdsListaTodasModaMOD_FLFIXA: TStringField;
    cdsListaTodasModaMOD_CAIXA_GERAL: TIntegerField;
    cdsListaTodasModaMOD_AVISTA: TStringField;
    cdsListaTodasModaMOD_FLXTEF: TStringField;
    cdsListaTodasModaMOD_PASTA_ENVIA_TEF: TStringField;
    cdsListaTodasModaMOD_PASTA_RECEBE_TEF: TStringField;
    cdsListaModas: TClientDataSet;
    cdsListaModasMOD_CODIGO: TIntegerField;
    cdsListaModasMOD_NOME: TStringField;
    cdsListaModasMOD_PECOMISSAO: TBCDField;
    cdsListaModasMOD_ABREVIACAO: TStringField;
    cdsListaModasMOD_NRPARCELA: TIntegerField;
    cdsListaModasMOD_FLFIXA: TStringField;
    cdsListaModasMOD_CAIXA_GERAL: TIntegerField;
    cdsListaModasMOD_AVISTA: TStringField;
    cdsListaModasMOD_FLXTEF: TStringField;
    cdsListaModasMOD_PASTA_ENVIA_TEF: TStringField;
    cdsListaModasMOD_PASTA_RECEBE_TEF: TStringField;
    dstMovimentoCaixa: TSQLDataSet;
    dspMovimentoCaixa: TDataSetProvider;
    cdsMovimentoCaixa: TClientDataSet;
    dstMovimentoCaixaMCA_CODIGO: TIntegerField;
    dstMovimentoCaixaMCA_SEQUENCIA: TIntegerField;
    dstMovimentoCaixaMCA_LOJA: TIntegerField;
    dstMovimentoCaixaMCA_VENDA: TIntegerField;
    dstMovimentoCaixaMCA_TIPOMOV: TStringField;
    dstMovimentoCaixaMCA_DTMOVIMENTO: TDateField;
    dstMovimentoCaixaMCA_HRMOVIMENTO: TStringField;
    dstMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField;
    dstMovimentoCaixaMCA_TOVENDA: TFMTBCDField;
    dstMovimentoCaixaMCA_VLTROCO: TFMTBCDField;
    dstMovimentoCaixaMCA_OBSEVACAO: TStringField;
    dstMovimentoCaixaMCA_SITUACAO: TStringField;
    dstMovimentoCaixaMCA_CAIXA: TIntegerField;
    dstMovimentoCaixaMCA_NATUREZA: TIntegerField;
    dstMovimentoCaixaMCA_FUNCIONARIO: TIntegerField;
    cdsMovimentoCaixaMCA_CODIGO: TIntegerField;
    cdsMovimentoCaixaMCA_SEQUENCIA: TIntegerField;
    cdsMovimentoCaixaMCA_LOJA: TIntegerField;
    cdsMovimentoCaixaMCA_VENDA: TIntegerField;
    cdsMovimentoCaixaMCA_TIPOMOV: TStringField;
    cdsMovimentoCaixaMCA_DTMOVIMENTO: TDateField;
    cdsMovimentoCaixaMCA_HRMOVIMENTO: TStringField;
    cdsMovimentoCaixaMCA_VLMODALIDADE: TFMTBCDField;
    cdsMovimentoCaixaMCA_TOVENDA: TFMTBCDField;
    cdsMovimentoCaixaMCA_VLTROCO: TFMTBCDField;
    cdsMovimentoCaixaMCA_OBSEVACAO: TStringField;
    cdsMovimentoCaixaMCA_SITUACAO: TStringField;
    cdsMovimentoCaixaMCA_CAIXA: TIntegerField;
    cdsMovimentoCaixaMCA_NATUREZA: TIntegerField;
    cdsMovimentoCaixaMCA_FUNCIONARIO: TIntegerField;
    dstMovimentoCaixaMCA_MODALIDADE: TIntegerField;
    cdsMovimentoCaixaMCA_MODALIDADE: TIntegerField;
    cdsAddCReceber: TClientDataSet;
    cdsAddCReceberREC_SEQUENCIA: TIntegerField;
    cdsAddCReceberREC_CDLOJA: TIntegerField;
    cdsAddCReceberREC_IDCONTASRECEBER: TIntegerField;
    cdsAddCReceberREC_NRPARCELA: TIntegerField;
    cdsAddCReceberREC_CLIENTE: TIntegerField;
    cdsAddCReceberREC_DTVENCIMENTO: TDateField;
    cdsAddCReceberREC_DTPAGAMENTO: TDateField;
    cdsAddCReceberREC_VALOR: TFMTBCDField;
    cdsAddCReceberREC_SITUACAO: TStringField;
    cdsAddCReceberREC_DTMOVI: TDateField;
    cdsAddCReceberREC_HOMOVI: TStringField;
    cdsAddCReceberREC_USCADA: TIntegerField;
    cdsAddCReceberREC_USALTE: TIntegerField;
    cdsAddCReceberREC_DTALTE: TDateField;
    cdsAddCReceberREC_HOALTE: TStringField;
    cdsAddCReceberREC_NATUREZA: TIntegerField;
    cdsAddCReceberREC_OBSERVACAO: TMemoField;
    cdsAddCReceberREC_QTPARCELAS: TIntegerField;
    cdsAddCReceberREC_VALORACRESIMO: TFMTBCDField;
    cdsAddCReceberREC_VALORJUROS: TFMTBCDField;
    cdsAddCReceberREC_VALORDESCONTO: TFMTBCDField;
    cdsAddCReceberREC_VLPAGO: TFMTBCDField;
    cdsAddCReceberREC_VLRESTANTE: TFMTBCDField;
    cdsAddCReceberREC_BANCO: TIntegerField;
    cdsAddCReceberREC_AGENCIA: TStringField;
    cdsAddCReceberREC_NRCONTA: TStringField;
    cdsAddCReceberREC_NRCHEQUE: TStringField;
    cdsAddCReceberREC_MODALIDADE: TIntegerField;
    cdsAddCReceberREC_DTCREDITO: TDateField;
    cdsAddCReceberREC_NRVENDA: TIntegerField;
    cdsListaBancoBAN_CODIGO: TIntegerField;
    cdsListaBancoBAN_NOME: TStringField;
    dstBanco: TSQLDataSet;
    dstBancoBAN_CODIGO: TIntegerField;
    dstBancoBAN_NOME: TStringField;
    cdsBanco: TClientDataSet;
    dspBanco: TDataSetProvider;
    cdsBancoBAN_CODIGO: TIntegerField;
    cdsBancoBAN_NOME: TStringField;
    ppRepVenda: TppReport;
    ppDBPVenda: TppDBPipeline;
    dsItensVenda: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    txtCabecalho: TppMemo;
    txtVenda: TppLabel;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    txtData: TppLabel;
    txtHora: TppLabel;
    txtCliente: TppLabel;
    lblCPF: TppLabel;
    txtCPF: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    mnoFormaPG: TppMemo;
    mnoFormaPG1: TppMemo;
    txtDesconto: TppLabel;
    txtTOTAL: TppLabel;
    cdsItensVendaMOP_NMPROD: TStringField;
    ppDBText7: TppDBText;
    cdsItensVendaMOP_SUBTOTAL: TFloatField;
    ppDBCalc4: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    cdsFormaPGVenda: TClientDataSet;
    cdsFormaPGVendaMCA_CODIGO: TIntegerField;
    cdsFormaPGVendaMCA_SEQUENCIA: TIntegerField;
    cdsFormaPGVendaMCA_LOJA: TIntegerField;
    cdsFormaPGVendaMCA_VENDA: TIntegerField;
    cdsFormaPGVendaMCA_MODALIDADE: TIntegerField;
    cdsFormaPGVendaMCA_VLMODALIDADE: TFMTBCDField;
    cdsFormaPGVendaMCA_OBSEVACAO: TStringField;
    procedure dspContaPagarGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsContaPagarCalcFields(DataSet: TDataSet);
    procedure cdsCReceberCalcFields(DataSet: TDataSet);
    procedure DataSetProvider1GetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cdsDadosItensCalcFields(DataSet: TDataSet);
    procedure dspBancoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsItensVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure CRIAR_PARCELAS_PAGAR(iCodigo, iQuantidade : Integer);
    Function Carregar_Parcelas_CP(iCodigo : Integer) : Boolean;
    Function IncluirParcelaCP(iSEQUENCIA, iIDCONTA, iNRPARCELA, iCDLOJA, iQTPARCELAS, iFORNECEDOR,
              iPLANOCONTA, iNATUREZA, iUSCADA, iBANCO : integer;
              aDTVENCIMENTO, aDTCOMPRA : TDateTime;
              aNOTAFISCAL, aSERIE, aHOMOVI, aSITUACAO, aNRCONTA, aNRCHEQUE, aAGENCIA : String;
              fVALORPARCELA : Double; aDESCRICAO: TStrings) : Boolean;
    Function IncluirParcelaCR(iSEQUENCIA, iIDCONTASRECEBER, iNRPARCELA, iCDLOJA, iQTPARCELAS,
              iCliente, iCDBANC, iNATUREZA, iIDTIPO, iUSCADA : Integer;
              aDTVENCIMENTO, aDTMOVI : TDateTime;
              fVALOR : Double;
              aHOMOVI, aNRCONTA, aNRCHEQUE, aAGENCIA : String; aOBSERVACAO : TStrings) : Boolean;
    Procedure Abrir_Natureza(aTipo : String);
    Function Carregar_Parcelas_CR(iCodigo : Integer) : Boolean;
    Function ExcluirParcelaCP(iSequencia : Integer) : Boolean;
    Function ExcluirParcelaCReceber(iSequencia : Integer) : Boolean;
    Function GetValidarEstoqueProduto(iLoja : Integer; aProduto : String; fQuant : Double) : Boolean;
    Function CarregarModalidades(): Boolean;
    Function IncluirRegitroMovCaixa(iSEQUENCIA, iLOJA, iVENDA, iMODALIDADE,
            iCAIXA, iNATUREZA, iFUNCIONARIO : Integer;
            aTIPOMOV, aHRMOVIMENTO, aOBSEVACAO, aSITUACAO : String;
            aDTMOVIMENTO : TDatetime; fVLMODALIDADE, fTOVENDA, fVLTROCO : double): boolean;
    Function ImprimirVenda(iVenda : Integer) : Boolean;        
  end;

var
  dmFinanceiro: TdmFinanceiro;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TdmFinanceiro.Abrir_Natureza(aTipo: String);
begin
     With dmFinanceiro.cdsListaNaturezas do
      begin
           Close;
           Params[0].AsString := aTipo;
           Open;
      End;
end;

function TdmFinanceiro.Carregar_Parcelas_CP(iCodigo: Integer): Boolean;
begin
      cdsParcelasCP.Close;
      cdsParcelasCP.Open;
      cdsParcelasCP.EmptyDataSet;
      //
      With cdsListaPCPagar do
        begin
             DisableControls;
             Close;
             Params.ParamByName('pID').AsInteger := iCodigo;
             Open;
             //
             If not (IsEmpty) Then
              begin
                   First;
                   While not (Eof) do
                   begin
                        // Novo registro
                        cdsParcelasCP.Append;
                        cdsParcelasCP.FieldByName('PAR_ID').AsInteger     := FieldByName('PAG_IDCONTA').AsInteger;
                        cdsParcelasCP.FieldByName('PAR_NRPARC').AsInteger := FieldByName('PAG_NRPARCELA').AsInteger;
                        cdsParcelasCP.FieldByName('PAR_DTVENC').AsDateTime:= FieldByName('PAG_DTVENCIMENTO').AsDateTime;
                        cdsParcelasCP.FieldByName('PAR_VALOR').AsFloat    := FieldByName('PAG_VALORPARCELA').AsFloat;
                        cdsParcelasCP.FieldByName('PAR_DTPAGA').AsDateTime:= FieldByName('PAG_DTPAGAMENTO').AsDateTime;
                        cdsParcelasCP.FieldByName('PAR_SITUACAO').AsString := FieldByName('PAG_SITUACAO').AsString;
                        cdsParcelasCP.FieldByName('PAR_BANCO').AsString   := FieldByName('PAG_BANCO').AsString;
                        cdsParcelasCP.FieldByName('PAR_AGENCIA').AsString := FieldByName('PAG_AGENCIA').AsString;
                        cdsParcelasCP.FieldByName('PAR_NRCONTA').AsString := FieldByName('PAG_NRCONTA').AsString;
                        cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString:= FieldByName('PAG_NRCHEQUE').AsString;
                        // Grava
                        cdsParcelasCP.Post;
                        //
                        Next;
                   End;
              End;
              //
              EnableControls;
        End;
end;

function TdmFinanceiro.Carregar_Parcelas_CR(iCodigo: Integer): Boolean;
begin
      cdsParcelasCP.Close;
      cdsParcelasCP.Open;
      cdsParcelasCP.EmptyDataSet;
      //
      With cdsListaPCReceber do
        begin
             DisableControls;
             Close;
             Params.ParamByName('pID').AsInteger := iCodigo;
             Open;
             //
             If not (IsEmpty) Then
              begin
                   First;
                   While not (Eof) do
                   begin
                        // Novo registro
                        cdsParcelasCP.Append;
                        cdsParcelasCP.FieldByName('PAR_ID').AsInteger     := FieldByName('REC_IDCONTASRECEBER').AsInteger;
                        cdsParcelasCP.FieldByName('PAR_NRPARC').AsInteger := FieldByName('REC_NRPARCELA').AsInteger;
                        cdsParcelasCP.FieldByName('PAR_DTVENC').AsDateTime:= FieldByName('REC_DTVENCIMENTO').AsDateTime;
                        cdsParcelasCP.FieldByName('PAR_VALOR').AsFloat    := FieldByName('REC_VALOR').AsFloat;
                        cdsParcelasCP.FieldByName('PAR_DTPAGA').AsDateTime:= FieldByName('REC_DTPAGAMENTO').AsDateTime;
                        cdsParcelasCP.FieldByName('PAR_SITUACAO').AsString := FieldByName('REC_SITUACAO').AsString;
                        cdsParcelasCP.FieldByName('PAR_BANCO').AsString   := FieldByName('REC_BANCO').AsString;
                        cdsParcelasCP.FieldByName('PAR_AGENCIA').AsString := FieldByName('REC_AGENCIA').AsString;
                        cdsParcelasCP.FieldByName('PAR_NRCONTA').AsString := FieldByName('REC_NRCONTA').AsString;
                        cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString:= FieldByName('REC_NRCHEQUE').AsString;
                        // Grava
                        cdsParcelasCP.Post;
                        //
                        Next;
                   End;
              End;
              //
              EnableControls;
        End;
end;

procedure TdmFinanceiro.CRIAR_PARCELAS_PAGAR(iCodigo,
  iQuantidade: Integer);
Var
    M_QTPARC : integer;
begin
     If NOT (cdsParcelasCP.Active) Then
         cdsParcelasCP.Open;
     //
     cdsParcelasCP.EmptyDataSet;
     //
     cdsParcelasCP.DisableControls;
     For M_QTPARC := 1 to iQuantidade do
     Begin
          // Incluir
          With cdsParcelasCP do
           begin
                Append;
                FieldByName('PAR_ID').AsInteger     := iCodigo;
                FieldByName('PAR_NRPARC').AsInteger := M_QTPARC;
                Post;
           End;
     End;
     //
     cdsParcelasCP.First;
     cdsParcelasCP.EnableControls;
end;

procedure TdmFinanceiro.dspContaPagarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'CONTASPAGAR';
end;

function TdmFinanceiro.ExcluirParcelaCP(iSequencia: Integer): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     result := False;
     texto  := 'Delete from contaspagar Where ("PAG_SEQUENCIA" = :pSEQUENCIA)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := dmDados.sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
           ExecSQL();
           //
           Result := True;
      Finally
         Free;
      End;
end;

function TdmFinanceiro.IncluirParcelaCP(iSEQUENCIA, iIDCONTA, iNRPARCELA,
  iCDLOJA, iQTPARCELAS, iFORNECEDOR, iPLANOCONTA, iNATUREZA, iUSCADA,
  iBANCO: integer; aDTVENCIMENTO, aDTCOMPRA: TDateTime; aNOTAFISCAL, aSERIE,
  aHOMOVI, aSITUACAO, aNRCONTA, aNRCHEQUE, aAGENCIA: String;
  fVALORPARCELA: Double; aDESCRICAO: TStrings): Boolean;
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
     Result := False;
     aTexto := 'Insert into CONTASPAGAR ("PAG_SEQUENCIA", "PAG_IDCONTA", "PAG_NRPARCELA", "PAG_CDLOJA", ';
     aTexto := aTexto + '"PAG_QTPARCELAS", "PAG_DTVENCIMENTO", "PAG_DTCOMPRA", "PAG_NUMERONOTAFISCAL", "PAG_SERIENOTAFISCAL", ';
     aTexto := aTexto + '"PAG_VALORPARCELA", "PAG_IDFORNECEDOR", "PAG_HOMOVI", ';
     aTexto := aTexto + '"PAG_USCADA", "PAG_NATUREZADESPESA", "PAG_DESCRICAO"';
     If (iBANCO > 0) Then
         aTexto := aTexto + ' , "PAG_BANCO", "PAG_NRCONTA", "PAG_NRCHEQUE",  "PAG_AGENCIA") '
     Else
         aTexto := aTexto + ') ';
     //
     aTexto := aTexto + ' Values (:pSEQUENCIA, :pIDCONTA, :pNRPARCELA, :pCDLOJA, ';
     aTexto := aTexto + ' :pQTPARCELAS, :pDTVENCIMENTO, :pDTCOMPRA, :pNUMERONOTAFISCAL, :pSERIENOTAFISCAL, ';
     aTexto := aTexto + ' :pVALORPARCELA, :pIDFORNECEDOR, :pHOMOVI, ';
     aTexto := aTexto + ' :pUSCADA, :pNATUREZADESPESA, :pDESCRICAO';
     //
     If (iBANCO > 0) Then
         aTexto := aTexto + ', :pBANCO, :pNRCONTA, :pNRCHEQUE,  :pAGENCIA) '
     Else
         aTexto := aTexto + ')';
     //
     qryAux := TSQLQuery.Create(nil);
     with qryAux do
      try
         try
           dmDados.Start;
           //
           SQLConnection := dmDados.sqlConexao;
           Close;
           SQL.Add(aTexto);
           Params.ParamByName('pSEQUENCIA').AsInteger := iSEQUENCIA;
           Params.ParamByName('pIDCONTA').AsInteger   := iIDCONTA;
           Params.ParamByName('pNRPARCELA').AsInteger := iNRPARCELA;
           Params.ParamByName('pCDLOJA').AsInteger    := iCDLOJA;
           Params.ParamByName('pQTPARCELAS').AsInteger := iQTPARCELAS;
           Params.ParamByName('pDTVENCIMENTO').AsDateTime := aDTVENCIMENTO;
           Params.ParamByName('pDTCOMPRA').AsDateTime := aDTCOMPRA;
           Params.ParamByName('pNUMERONOTAFISCAL').AsString := aNOTAFISCAL;
           Params.ParamByName('pSERIENOTAFISCAL').AsString  := aSERIE;
           Params.ParamByName('pVALORPARCELA').AsFloat   := fVALORPARCELA;
           Params.ParamByName('pIDFORNECEDOR').AsInteger := iFORNECEDOR;
           Params.ParamByName('pHOMOVI').AsString        := aHOMOVI;
           Params.ParamByName('pUSCADA').AsInteger       := iUSCADA;
           Params.ParamByName('pNATUREZADESPESA').AsInteger := iNATUREZA;
           Params.ParamByName('pDESCRICAO').Assign(aDESCRICAO);
           If (iBANCO > 0) Then
            begin
               Params.ParamByName('pBANCO').AsInteger   := iBANCO;
               Params.ParamByName('pNRCONTA').AsString  := aNRCONTA;
               Params.ParamByName('pNRCHEQUE').AsString := aNRCHEQUE;
               Params.ParamByName('pAGENCIA').AsString  := aAGENCIA;
            End;
           //
           ExecSQL();
           //
           Result := True;
           //
           dmDados.Comit(Transc);
         Except
           dmDados.Rollback;
         End;
      Finally
           Free;
      End;
end;

function TdmFinanceiro.IncluirParcelaCR(iSEQUENCIA, iIDCONTASRECEBER, iNRPARCELA, iCDLOJA, iQTPARCELAS,
              iCliente, iCDBANC, iNATUREZA, iIDTIPO, iUSCADA : Integer;
              aDTVENCIMENTO, aDTMOVI : TDateTime;
              fVALOR : Double;
              aHOMOVI, aNRCONTA, aNRCHEQUE, aAGENCIA : String; aOBSERVACAO : TStrings) : Boolean;
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
      Result := False;
      //
     aTexto := 'Insert into contasreceber ("REC_SEQUENCIA", "REC_IDCONTASRECEBER", "REC_NRPARCELA", "REC_DTVENCIMENTO", ';
     aTexto := aTexto + '"REC_VALOR", "REC_CLIENTE", "REC_SITUACAO", ';
     aTexto := aTexto + '"REC_DTMOVI", "REC_HOMOVI", "REC_USCADA", "REC_CDLOJA", "REC_NATUREZA", "REC_OBSERVACAO", "REC_QTPARCELAS" ';
     If (iCDBANC > 0) Then
          aTexto := aTexto + ' , "REC_BANCO", "REC_AGENCIA", "REC_NRCONTA", "REC_NRCHEQUE" )'
      Else
          aTexto := aTexto + ') ';
     //
     aTexto := aTexto + ' Values (:pSEQUENCIA, :pIDCONTASRECEBER, :pNRPARCELA, :pDTVENCIMENTO, ';
     aTexto := aTexto + ' :pVALOR, :pCLIENTE,  :pSITUACAO, ';
     aTexto := aTexto + ' :pDTMOVI, :pHOMOVI, :pUSCADA, :pCDLOJA, :pNATUREZA, :pOBSERVACAO, :pQTPARCELAS ';
     If (iCDBANC > 0) Then
          aTexto := aTexto + ' , :pCDBANCO, :pAGENCIA, :pNRCONTA, :pNRCHEQUE )'
      Else
          aTexto := aTexto + ') ';
      //
      dmDados.Start;
      try

          qryAux := TsqlQuery.Create(nil);
          with qryAux do
            try
               SQLConnection := dmDados.sqlConexao;
               Close;
               SQL.Add(aTexto);
               Params.ParamByName('pSEQUENCIA').AsInteger         := iSEQUENCIA;
               Params.ParamByName('pIDCONTASRECEBER').AsInteger   := iIDCONTASRECEBER;
               Params.ParamByName('pNRPARCELA').AsInteger         := iNRPARCELA;
               Params.ParamByName('pDTVENCIMENTO').AsDateTime     := aDTVENCIMENTO;
               Params.ParamByName('pVALOR').AsFloat               := fVALOR;
               Params.ParamByName('pCLIENTE').AsInteger           := iCliente;
               Params.ParamByName('pSITUACAO').AsString           := 'A';
               Params.ParamByName('pDTMOVI').AsDateTime           := aDTMOVI;
               Params.ParamByName('pHOMOVI').AsString             := aHOMOVI;
               Params.ParamByName('pUSCADA').AsInteger            := iUSCADA;
               Params.ParamByName('pCDLOJA').AsInteger            := iCDLOJA;
               Params.ParamByName('pNATUREZA').AsInteger          := iNATUREZA;
               Params.ParamByName('pOBSERVACAO').Assign(aOBSERVACAO);
               Params.ParamByName('pQTPARCELAS').AsInteger        := iQTPARCELAS;
               //
               If (iCDBANC > 0) Then
                begin
                     Params.ParamByName('pCDBANCO').AsInteger  := iCDBANC;
                     Params.ParamByName('pAGENCIA').AsString := aAGENCIA;
                     Params.ParamByName('pNRCONTA').AsString := aNRCONTA;
                     Params.ParamByName('pNRCHEQUE').AsString := aNRCHEQUE;
                End;
                //
               ExecSQL();
               //
               dmDados.Comit(Transc);
               //
               Result := True;
      Finally
           Free;
      End;
      Except
          dmDados.Rollback;
      End;
end;

procedure TdmFinanceiro.cdsContaPagarCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
            If (cdsContaPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
             begin
                  M_QTDIAS := Date() - cdsContaPagar.FieldByName('PAG_DTVENCIMENTO').AsDateTime;
                  //cdsConsulta.FieldByName('PAG_NMSITUACAO').AsString := 'ABERTA';
             End
             Else
             Begin
                  //cdsConsulta.FieldByName('PAG_NMSITUACAO').AsString := 'PAGA';
                  M_QTDIAS := cdsContaPagar.FieldByName('PAG_DTPAGAMENTO').AsDateTime -
                       cdsContaPagar.FieldByName('PAG_DTVENCIMENTO').AsDateTime;
             End;
             //
             if (M_QTDIAS > 0) Then
                 cdsContaPagar.FieldByName('PAG_ATRASO').AsFloat := M_QTDIAS
             Else
                 cdsContaPagar.FieldByName('PAG_ATRASO').AsFloat := 0;
end;

function TdmFinanceiro.ExcluirParcelaCReceber(
  iSequencia: Integer): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     result := False;
     texto  := 'Delete from contasreceber Where ("REC_SEQUENCIA" = :pSEQUENCIA)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := dmDados.sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pSEQUENCIA').AsInteger := iSequencia;
           ExecSQL();
           //
           Result := True;
      Finally
         Free;
      End;
end;

procedure TdmFinanceiro.cdsCReceberCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     If not uFuncoes.Empty(cdsCReceberREC_QTPARCELAS.AsString)
       and not uFuncoes.Empty(cdsCReceberREC_NRPARCELA.AsString) Then
        cdsCReceberREC_PARCELAS.AsString :=
              uFuncoes.StrZero(cdsCReceberREC_NRPARCELA.AsString,2)+'/'+
              uFuncoes.StrZero(cdsCReceberREC_QTPARCELAS.AsString,2);
      //
     M_QTDIAS := Date() - cdsCReceberREC_DTVENCIMENTO.Value;
     //
     If not uFuncoes.Empty(cdsCReceberREC_DTPAGAMENTO.AsString) Then
          M_QTDIAS := cdsCReceberREC_DTPAGAMENTO.Value - cdsCReceberREC_DTVENCIMENTO.Value;
     //
     If (M_QTDIAS < 0) Then
         M_QTDIAS := 0;
     //
     cdsCReceberREC_ATRASO.AsFloat := M_QTDIAS;
end;

procedure TdmFinanceiro.DataSetProvider1GetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASPAGAR';
end;

procedure TdmFinanceiro.cdsDadosItensCalcFields(DataSet: TDataSet);
begin
      If (cdsItensVenda.State in [dsInternalCalc]) Then
         cdsItensVendaCDS_SUBTOT.AsFloat :=
             cdsItensVendaCDS_VLUNIT.AsFloat * cdsItensVendaCDS_QTPROD.AsFloat;
      if (cdsItensVendaCDS_VLUNIT.AsFloat > 0) and (cdsItensVendaCDS_QTPROD.AsFloat > 0) Then
         cdsItensVendaCDS_SUBTOT2.AsFloat :=
             uFuncoes.Arredondar(cdsItensVendaCDS_VLUNIT.AsFloat * cdsItensVendaCDS_QTPROD.AsFloat,2);
end;

function TdmFinanceiro.GetValidarEstoqueProduto(iLoja: Integer;
  aProduto: String; fQuant : Double): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   result := false;
   aTexto := 'Select EST_CDLOJA, EST_CDPROD, EST_QUANTIDADE from ESTOQUE Where (EST_CDLOJA = :pCDLOJA) and (EST_CDPROD = :pPRODUTO)';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := dmDados.sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pCDLOJA').AsInteger := iLoja;
         Params.ParamByName('pPRODUTO').AsString := uFuncoes.StrZero(aProduto,13);
         Open;
         //
         if not (IsEmpty) Then
          begin
              If (fQuant > FieldByName('EST_QUANTIDADE').AsFloat) Then
                 Result := True;
          End;
    Finally
         Free;
    End;
end;

function TdmFinanceiro.CarregarModalidades(): Boolean;
begin
     Result := False;
     If not (cdsModalidade.Active) Then
        cdsModalidade.Open;
     //
     cdsModalidade.EmptyDataSet;
     //
     With cdsListaTodasModa do
      begin
           Close;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 First;
                 While not (Eof) do
                  begin
                       cdsModalidade.Append;
                       cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
                          FieldByName('MOD_CODIGO').AsInteger;
                       cdsModalidade.FieldByName('MOD_NOME').AsString      :=
                          FieldByName('MOD_NOME').AsString;
                       cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
                          FieldByName('MOD_PECOMISSAO').AsFloat;
                       cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
                          FieldByName('MOD_ABREVIACAO').AsString;
                       cdsModalidade.FieldByName('MOD_VALOR').AsCurrency := 0;
                       cdsModalidade.FieldByName('MOD_FLFIXA').AsString  :=
                          FieldByName('MOD_FLFIXA').AsString;
                       cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger :=
                          FieldByName('MOD_NRPARCELA').AsInteger;
                       cdsModalidade.Post;
                       //
                       Next;
                  End;
                  //
                  cdsModalidade.First;
            End;
      End;
      //
      Result := true;
end;

function TdmFinanceiro.IncluirRegitroMovCaixa(iSEQUENCIA, iLOJA, iVENDA,
  iMODALIDADE, iCAIXA, iNATUREZA, iFUNCIONARIO: Integer; aTIPOMOV,
  aHRMOVIMENTO, aOBSEVACAO, aSITUACAO: String; aDTMOVIMENTO: TDatetime;
  fVLMODALIDADE, fTOVENDA, fVLTROCO: double): boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   Result := False;
   //
   dmDados.AbrirTabelaConfig;
   dmDados.cdsConfig.Edit;
   dmDados.cdsConfigCFG_SEQMOVCAIXA.AsInteger :=
     dmDados.cdsConfigCFG_SEQMOVCAIXA.AsInteger + 1;
   dmDados.cdsConfig.ApplyUpdates(0);
   //
   aTexto := 'Insert into MOVIMENTO_CAIXA (MCA_CODIGO, MCA_SEQUENCIA, MCA_LOJA, MCA_VENDA, MCA_TIPOMOV, MCA_DTMOVIMENTO, MCA_HRMOVIMENTO, ';
   aTexto := aTexto + 'MCA_MODALIDADE, MCA_VLMODALIDADE, MCA_TOVENDA, MCA_VLTROCO, MCA_OBSEVACAO, MCA_SITUACAO, MCA_CAIXA, MCA_NATUREZA, MCA_FUNCIONARIO) ';
   aTexto := aTexto +'Values (:pCODIGO, :pSEQUENCIA, :pLOJA, :pVENDA, :pTIPOMOV, :pDTMOVIMENTO, :pHRMOVIMENTO, ';
   aTexto := aTexto +' :pMODALIDADE, :pVLMODALIDADE, :pTOVENDA, :pVLTROCO, :pOBSEVACAO, :pSITUACAO, :pCAIXA, :pNATUREZA, :pFUNCIONARIO)';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         dmDados.Start;
         try
             SQLConnection := dmDados.sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pCODIGO').AsInteger    := dmDados.cdsConfigCFG_SEQMOVCAIXA.AsInteger;
             Params.ParamByName('pSEQUENCIA').AsInteger := iSEQUENCIA;
             Params.ParamByName('pLOJA').AsInteger      := iLOJA;
             Params.ParamByName('pVENDA').AsInteger     := iVENDA;
             Params.ParamByName('pTIPOMOV').AsString    := aTIPOMOV;
             Params.ParamByName('pDTMOVIMENTO').AsDate  := aDTMOVIMENTO;
             Params.ParamByName('pHRMOVIMENTO').AsString := aHRMOVIMENTO;
             Params.ParamByName('pMODALIDADE').AsInteger := iMODALIDADE;
             Params.ParamByName('pVLMODALIDADE').AsFloat := fVLMODALIDADE;
             Params.ParamByName('pTOVENDA').AsFloat     := fTOVENDA;
             Params.ParamByName('pVLTROCO').AsFloat     := fVLTROCO;
             Params.ParamByName('pOBSEVACAO').AsString  := aOBSEVACAO;
             Params.ParamByName('pSITUACAO').AsString   := aSITUACAO;
             Params.ParamByName('pCAIXA').AsInteger     := iCAIXA;
             Params.ParamByName('pNATUREZA').AsInteger  := iNATUREZA;
             Params.ParamByName('pFUNCIONARIO').AsInteger := iFUNCIONARIO;
             ExecSQL();
             //
             dmDados.Comit(Transc);
             Result := True;
          Except
             dmDados.Rollback;
          End;
    Finally
         Free;
    End;
end;

procedure TdmFinanceiro.dspBancoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName:= 'BANCOS';
end;

procedure TdmFinanceiro.cdsItensVendaCalcFields(DataSet: TDataSet);
begin
     If not uFuncoes.Empty(cdsItensVendaMOP_PRODUTO.AsString) tHEN
       cdsItensVendaMOP_NMPROD.AsString :=
          dmDados.GetNomeProduto(cdsItensVendaMOP_PRODUTO.AsString);
     //
     If (cdsItensVendaMOP_QUANTIDADE.AsFloat > 0)
       AND (cdsItensVendaMOP_VALOR.AsFloat > 0)  tHEN
         cdsItensVendaMOP_SUBTOTAL.AsFloat :=
            cdsItensVendaMOP_VALOR.AsFloat * cdsItensVendaMOP_QUANTIDADE.AsFloat;
end;

function TdmFinanceiro.ImprimirVenda(iVenda: Integer): Boolean;
begin
      Result := False;
      uFuncoes.RefreshCDS(dmDados.cdsConfig);
      //
      With cdsVenda do
        begin
             Close;
             Params.ParamByName('pPEDIDO').AsInteger := iVenda;
             Params.ParamByName('pLOJA').AsInteger   := 1;
             Open;
             //
             If not (IsEmpty) then
             begin
                  With cdsItensVenda do
                    begin
                         Close;
                         Params.ParamByName('pPEDIDO').AsInteger := iVenda;
                         Open;
                         //
                         if not (IsEmpty) then
                          begin
                               with ppRepVenda do
                                begin
                                     uFuncoes.FilterCDS( dmDados.cdsCliente, fsInteger, cdsVendaMOV_CLIENTE.AsString);
                                     //
                                     If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                                        ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                                     //
                                     txtCabecalho.Lines.Clear;
                                     txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_FANTASIA.AsString);
                                     txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_ENDERECO.AsString + ', '
                                         +dmDados.cdsConfigCFG_NUMERO.AsString+ ', '
                                         +dmDados.cdsConfigCFG_BAIRRO.AsString+', CEP: '
                                         +uFuncoes.FormataCep(dmDados.cdsConfigCFG_CEP.AsString));
                                     txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_CIDADE.AsString + ' - '+
                                          dmDados.cdsConfigCFG_UF.AsString+'. FONE: '+
                                          uFuncoes.FormataFONE(dmDados.cdsConfigCFG_NRFONE.AsString)+
                                          ' CNPJ:'+uFuncoes.FormataCNPJ(dmDados.cdsConfigCFG_CNPJ.AsString)+
                                          '  Inc. Est.: '+dmDados.cdsConfigCFG_INSEST.AsString);
                                      //
                                      txtVenda.Caption := 'VENDA : '+ uFuncoes.StrZero(cdsVendaMOV_PEDIDO.AsString,7);
                                      txtData.Caption := cdsVendaMOV_DATAVENDA.AsString;
                                      txtHora.Caption := cdsVendaMOV_HORAVENDA.AsString;
                                      //
                                      txtCliente.Caption := dmDados.cdsClienteCLI_NOME.AsString;
                                      txtCPF.Caption     := uFuncoes.FormataCPF(dmDados.cdsClienteCLI_CPF.AsString);
                                      //
                                      //txtValorVenda.Caption := FormatFloat('###,##0.#0',cdsVendaMOV_VALOR.AsFloat);
                                      txtDesconto.Caption   := FormatFloat('##0.#0',cdsVendaMOV_DESCONTO.AsFloat);
                                      txtTOTAL.Caption      := FormatFloat('###,##0.#0',cdsVendaMOV_VALOR.AsFloat);
                                      //
                                      With cdsFormaPGVenda do
                                        begin
                                             Close;
                                             Params[0].AsInteger := iVenda;
                                             Open;
                                             //
                                             If Not (IsEmpty) then
                                              begin
                                                   mnoFormaPG.Lines.Clear;
                                                   mnoFormaPG1.Lines.Clear;
                                                   First;
                                                   While not (Eof) do
                                                    begin
                                                         If (FieldByName('MCA_MODALIDADE').AsInteger > 0) Then
                                                         begin
                                                              mnoFormaPG.Lines.Add(FieldByName('MCA_OBSEVACAO').AsString);
                                                              mnoFormaPG1.Lines.Add(FormatFloat('###,##0.#0',FieldByName('MCA_VLMODALIDADE').AsFloat));
                                                         End;
                                                         //
                                                         Next;
                                                    End;
                                                    close;
                                              End;
                                        End;
                                      //
                                      PrintReport;
                                End;
                          End;
                    End;
             End;
        End;
      //
end;

end.
