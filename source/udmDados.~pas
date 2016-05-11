unit udmDados;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, IniFiles, FMTBcd, DBClient,
  Provider, Forms, Windows, Messages, Dialogs, MidasLib, ppBands, ppCache,
  ppClass, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppVar,
  ppCtrls, ppStrtch, ppMemo, ppPrnabl;

type
  TdmDados = class(TDataModule)
    sqlConexao: TSQLConnection;
    dstConfig: TSQLDataSet;
    dstUsuario: TSQLDataSet;
    dstCliente: TSQLDataSet;
    dstFuncionario: TSQLDataSet;
    dstPadrao: TSQLDataSet;
    dspCliente: TDataSetProvider;
    dspConfig: TDataSetProvider;
    dspFuncionario: TDataSetProvider;
    dspUsuario: TDataSetProvider;
    dspPadrao: TDataSetProvider;
    cdsConfig: TClientDataSet;
    dstConfigCFG_CODIGO: TIntegerField;
    dstConfigCFG_RAZAO_EMPRESA: TStringField;
    dstConfigCFG_FANTASIA: TStringField;
    dstConfigCFG_ENDERECO: TStringField;
    dstConfigCFG_NUMERO: TIntegerField;
    dstConfigCFG_BAIRRO: TStringField;
    dstConfigCFG_CIDADE: TStringField;
    dstConfigCFG_UF: TStringField;
    dstConfigCFG_CEP: TStringField;
    dstConfigCFG_CNPJ: TStringField;
    dstConfigCFG_INSEST: TStringField;
    dstConfigCFG_NRFONE: TStringField;
    dstConfigCFG_NUMFAX: TStringField;
    dstConfigCFG_CELULAR: TStringField;
    dstConfigCFG_EMAIL: TStringField;
    dstConfigCFG_SITE: TStringField;
    dstConfigCFG_CLIENTE: TIntegerField;
    dstConfigCFG_FORNECEDOR: TIntegerField;
    dstConfigCFG_FUNCIONARIO: TIntegerField;
    dstConfigCFG_PRODUTO: TIntegerField;
    dstConfigCFG_ATENDIMENTOS: TIntegerField;
    dstConfigCFG_USUARIOS: TIntegerField;
    dstConfigCFG_CDCIDADE: TIntegerField;
    dstConfigCFG_CDBAIRRO: TIntegerField;
    dstConfigCFG_SEQCPAGAR: TIntegerField;
    dstConfigCFG_NRCOMPRA: TIntegerField;
    dstConfigCFG_SEQCRECEBER: TIntegerField;
    dstConfigCFG_NRCREDITO: TIntegerField;
    cdsConfigCFG_CODIGO: TIntegerField;
    cdsConfigCFG_RAZAO_EMPRESA: TStringField;
    cdsConfigCFG_FANTASIA: TStringField;
    cdsConfigCFG_ENDERECO: TStringField;
    cdsConfigCFG_NUMERO: TIntegerField;
    cdsConfigCFG_BAIRRO: TStringField;
    cdsConfigCFG_CIDADE: TStringField;
    cdsConfigCFG_UF: TStringField;
    cdsConfigCFG_CEP: TStringField;
    cdsConfigCFG_CNPJ: TStringField;
    cdsConfigCFG_INSEST: TStringField;
    cdsConfigCFG_NRFONE: TStringField;
    cdsConfigCFG_NUMFAX: TStringField;
    cdsConfigCFG_CELULAR: TStringField;
    cdsConfigCFG_EMAIL: TStringField;
    cdsConfigCFG_SITE: TStringField;
    cdsConfigCFG_CLIENTE: TIntegerField;
    cdsConfigCFG_FORNECEDOR: TIntegerField;
    cdsConfigCFG_FUNCIONARIO: TIntegerField;
    cdsConfigCFG_PRODUTO: TIntegerField;
    cdsConfigCFG_ATENDIMENTOS: TIntegerField;
    cdsConfigCFG_USUARIOS: TIntegerField;
    cdsConfigCFG_CDCIDADE: TIntegerField;
    cdsConfigCFG_CDBAIRRO: TIntegerField;
    cdsConfigCFG_SEQCPAGAR: TIntegerField;
    cdsConfigCFG_NRCOMPRA: TIntegerField;
    cdsConfigCFG_SEQCRECEBER: TIntegerField;
    cdsConfigCFG_NRCREDITO: TIntegerField;
    dstClienteCLI_CODIGO: TIntegerField;
    dstClienteCLI_NOME: TStringField;
    dstClienteCLI_CPF: TStringField;
    dstClienteCLI_LOGRADOURO: TStringField;
    dstClienteCLI_NUMERO: TIntegerField;
    dstClienteCLI_COMPLEMENTO: TStringField;
    dstClienteCLI_CEP: TStringField;
    dstClienteCLI_CDBAIRRO: TIntegerField;
    dstClienteCLI_CDCIDADE: TIntegerField;
    dstClienteCLI_UFCLIENTE: TStringField;
    dstClienteCLI_FONE1: TStringField;
    dstClienteCLI_FONE2: TStringField;
    dstClienteCLI_CELULAR: TStringField;
    dstClienteCLI_IDENTIDADE: TStringField;
    dstClienteCLI_ORGAOEMISSOR: TStringField;
    dstClienteCLI_UFEMISSOR: TStringField;
    dstClienteCLI_ESTADO_CIVIL: TIntegerField;
    dstClienteCLI_SEXO: TStringField;
    dstClienteCLI_SITUACAO: TIntegerField;
    dstClienteCLI_EMAIL: TStringField;
    dstClienteCLI_DTANIVERSARIO: TDateField;
    dstClienteCLI_NOME_PAI: TStringField;
    dstClienteCLI_NOME_MAE: TStringField;
    dstClienteCLI_DTCADASTRO: TDateField;
    dstClienteCLI_USUARIO_INC: TIntegerField;
    dstClienteCLI_HORA_INC: TStringField;
    dstClienteCLI_USUARIO_ALT: TIntegerField;
    dstClienteCLI_DATA_ALT: TDateField;
    dstClienteCLI_HORA_ALT: TStringField;
    dstClienteCLI_FOTOCLIENTE: TGraphicField;
    cdsCliente: TClientDataSet;
    cdsClienteCLI_CODIGO: TIntegerField;
    cdsClienteCLI_NOME: TStringField;
    cdsClienteCLI_CPF: TStringField;
    cdsClienteCLI_LOGRADOURO: TStringField;
    cdsClienteCLI_NUMERO: TIntegerField;
    cdsClienteCLI_COMPLEMENTO: TStringField;
    cdsClienteCLI_CEP: TStringField;
    cdsClienteCLI_CDBAIRRO: TIntegerField;
    cdsClienteCLI_CDCIDADE: TIntegerField;
    cdsClienteCLI_UFCLIENTE: TStringField;
    cdsClienteCLI_FONE1: TStringField;
    cdsClienteCLI_FONE2: TStringField;
    cdsClienteCLI_CELULAR: TStringField;
    cdsClienteCLI_IDENTIDADE: TStringField;
    cdsClienteCLI_ORGAOEMISSOR: TStringField;
    cdsClienteCLI_UFEMISSOR: TStringField;
    cdsClienteCLI_ESTADO_CIVIL: TIntegerField;
    cdsClienteCLI_SEXO: TStringField;
    cdsClienteCLI_SITUACAO: TIntegerField;
    cdsClienteCLI_EMAIL: TStringField;
    cdsClienteCLI_DTANIVERSARIO: TDateField;
    cdsClienteCLI_NOME_PAI: TStringField;
    cdsClienteCLI_NOME_MAE: TStringField;
    cdsClienteCLI_DTCADASTRO: TDateField;
    cdsClienteCLI_USUARIO_INC: TIntegerField;
    cdsClienteCLI_HORA_INC: TStringField;
    cdsClienteCLI_USUARIO_ALT: TIntegerField;
    cdsClienteCLI_DATA_ALT: TDateField;
    cdsClienteCLI_HORA_ALT: TStringField;
    cdsClienteCLI_FOTOCLIENTE: TGraphicField;
    cdsFuncionario: TClientDataSet;
    dstUsuarioSEN_CODIGO: TIntegerField;
    dstUsuarioSEN_NOME: TStringField;
    dstUsuarioSEN_SNATUA: TStringField;
    dstUsuarioSEN_CARGO: TStringField;
    dstUsuarioSEN_TERMINAL: TStringField;
    dstUsuarioSEN_GRUPO: TIntegerField;
    dstUsuarioSEN_DTATUAL: TDateField;
    dstUsuarioSEN_FLEXCLUSAO: TStringField;
    dstUsuarioSEN_ADMIN: TStringField;
    cdsUsuario: TClientDataSet;
    cdsUsuarioSEN_CODIGO: TIntegerField;
    cdsUsuarioSEN_NOME: TStringField;
    cdsUsuarioSEN_SNATUA: TStringField;
    cdsUsuarioSEN_CARGO: TStringField;
    cdsUsuarioSEN_TERMINAL: TStringField;
    cdsUsuarioSEN_GRUPO: TIntegerField;
    cdsUsuarioSEN_DTATUAL: TDateField;
    cdsUsuarioSEN_FLEXCLUSAO: TStringField;
    cdsUsuarioSEN_ADMIN: TStringField;
    dstCidade: TSQLDataSet;
    dstBairro: TSQLDataSet;
    dstCidadeCID_CODIGO: TIntegerField;
    dstCidadeCID_DESCRICAO: TStringField;
    dstCidadeCID_UFCIDADE: TStringField;
    dstBairroBAI_CODIGO: TIntegerField;
    dstBairroBAI_DESCRICAO: TStringField;
    dstBairroBAI_CDCIDADE: TIntegerField;
    dspCidade: TDataSetProvider;
    dspBairro: TDataSetProvider;
    cdsListaCidades: TClientDataSet;
    cdsListaBairros: TClientDataSet;
    cdsListaEstCivil: TClientDataSet;
    cdsListaCargos: TClientDataSet;
    cdsListaEstCivilETC_CODIGO: TIntegerField;
    cdsListaEstCivilETC_DESCRICAO: TStringField;
    cdsListaCidadesCID_CODIGO: TIntegerField;
    cdsListaCidadesCID_DESCRICAO: TStringField;
    cdsListaCidadesCID_UFCIDADE: TStringField;
    cdsListaBairrosBAI_CODIGO: TIntegerField;
    cdsListaBairrosBAI_DESCRICAO: TStringField;
    cdsListaBairrosBAI_CDCIDADE: TIntegerField;
    cdsListaCargosTFU_CODIGO: TIntegerField;
    cdsListaCargosTFU_DESCRICAO: TStringField;
    cdsListaCargosTFU_SIGLA: TStringField;
    dstClienteCLI_OBSERVACAO: TMemoField;
    cdsClienteCLI_OBSERVACAO: TMemoField;
    cdsClienteCLI_NMCIDADE: TStringField;
    cdsClienteCLI_NMBAIRRO: TStringField;
    cdsClienteCLI_NMEST_CIVIL: TStringField;
    dstFuncionarioFUN_CODIGO: TIntegerField;
    dstFuncionarioFUN_NOME: TStringField;
    dstFuncionarioFUN_ENDERECO: TStringField;
    dstFuncionarioFUN_BAIRRO: TStringField;
    dstFuncionarioFUN_CIDADE: TStringField;
    dstFuncionarioFUN_UFFUNC: TStringField;
    dstFuncionarioFUN_NATUREZA: TStringField;
    dstFuncionarioFUN_CEP: TStringField;
    dstFuncionarioFUN_FONE: TStringField;
    dstFuncionarioFUN_TPFUNC: TIntegerField;
    dstFuncionarioFUN_PECOMI: TBCDField;
    dstFuncionarioFUN_DTNASCIMENTO: TDateField;
    dstFuncionarioFUN_DTADMICAO: TDateField;
    dstFuncionarioFUN_DTDEMICAO: TDateField;
    dstFuncionarioFUN_VLDEBITO: TFMTBCDField;
    dstFuncionarioFUN_CPF: TStringField;
    dstFuncionarioFUN_IDENTIDADE: TStringField;
    dstFuncionarioFUN_ORIDEN: TStringField;
    dstFuncionarioFUN_UFIDEN: TStringField;
    dstFuncionarioFUN_NRCART: TStringField;
    dstFuncionarioFUN_SECART: TStringField;
    dstFuncionarioFUN_UFCART: TStringField;
    dstFuncionarioFUN_CAREMI: TStringField;
    dstFuncionarioFUN_TITULO: TStringField;
    dstFuncionarioFUN_CDSECA: TStringField;
    dstFuncionarioFUN_CDZONA: TStringField;
    dstFuncionarioFUN_ESTCIVIL: TStringField;
    dstFuncionarioFUN_VLSALA: TFMTBCDField;
    dstFuncionarioFUN_LIONIB: TStringField;
    dstFuncionarioFUN_HOENT1: TStringField;
    dstFuncionarioFUN_HOSAI1: TStringField;
    dstFuncionarioFUN_HOENT2: TStringField;
    dstFuncionarioFUN_HOSAI2: TStringField;
    dstFuncionarioFUN_NOMPAI: TStringField;
    dstFuncionarioFUN_NOMMAE: TStringField;
    dstFuncionarioFUN_COMPO1: TStringField;
    dstFuncionarioFUN_COMPO2: TStringField;
    dstFuncionarioFUN_COMPO3: TStringField;
    dstFuncionarioFUN_ASSID1: TStringField;
    dstFuncionarioFUN_ASSID2: TStringField;
    dstFuncionarioFUN_ASSID3: TStringField;
    dstFuncionarioFUN_HONES1: TStringField;
    dstFuncionarioFUN_HONES2: TStringField;
    dstFuncionarioFUN_HONES3: TStringField;
    dstFuncionarioFUN_CARAT1: TStringField;
    dstFuncionarioFUN_CARAT2: TStringField;
    dstFuncionarioFUN_CARAT3: TStringField;
    dstFuncionarioFUN_FUNCAO: TStringField;
    dstFuncionarioFUN_RGEMIS: TDateField;
    dstFuncionarioFUN_CDCARGO: TIntegerField;
    dstFuncionarioFUN_ESTADOCIVIL: TIntegerField;
    dstFuncionarioFUN_DTCADA: TDateField;
    dstFuncionarioFUN_HOCADA: TStringField;
    dstFuncionarioFUN_USUARIO_CAD: TIntegerField;
    dstFuncionarioFUN_DTALTE: TDateField;
    dstFuncionarioFUN_HOALTE: TStringField;
    dstFuncionarioFUN_USUARIO_ALT: TIntegerField;
    cdsFuncionarioFUN_CODIGO: TIntegerField;
    cdsFuncionarioFUN_NOME: TStringField;
    cdsFuncionarioFUN_ENDERECO: TStringField;
    cdsFuncionarioFUN_BAIRRO: TStringField;
    cdsFuncionarioFUN_CIDADE: TStringField;
    cdsFuncionarioFUN_UFFUNC: TStringField;
    cdsFuncionarioFUN_NATUREZA: TStringField;
    cdsFuncionarioFUN_CEP: TStringField;
    cdsFuncionarioFUN_FONE: TStringField;
    cdsFuncionarioFUN_TPFUNC: TIntegerField;
    cdsFuncionarioFUN_PECOMI: TBCDField;
    cdsFuncionarioFUN_DTNASCIMENTO: TDateField;
    cdsFuncionarioFUN_DTADMICAO: TDateField;
    cdsFuncionarioFUN_DTDEMICAO: TDateField;
    cdsFuncionarioFUN_VLDEBITO: TFMTBCDField;
    cdsFuncionarioFUN_CPF: TStringField;
    cdsFuncionarioFUN_IDENTIDADE: TStringField;
    cdsFuncionarioFUN_ORIDEN: TStringField;
    cdsFuncionarioFUN_UFIDEN: TStringField;
    cdsFuncionarioFUN_NRCART: TStringField;
    cdsFuncionarioFUN_SECART: TStringField;
    cdsFuncionarioFUN_UFCART: TStringField;
    cdsFuncionarioFUN_CAREMI: TStringField;
    cdsFuncionarioFUN_TITULO: TStringField;
    cdsFuncionarioFUN_CDSECA: TStringField;
    cdsFuncionarioFUN_CDZONA: TStringField;
    cdsFuncionarioFUN_ESTCIVIL: TStringField;
    cdsFuncionarioFUN_VLSALA: TFMTBCDField;
    cdsFuncionarioFUN_LIONIB: TStringField;
    cdsFuncionarioFUN_HOENT1: TStringField;
    cdsFuncionarioFUN_HOSAI1: TStringField;
    cdsFuncionarioFUN_HOENT2: TStringField;
    cdsFuncionarioFUN_HOSAI2: TStringField;
    cdsFuncionarioFUN_NOMPAI: TStringField;
    cdsFuncionarioFUN_NOMMAE: TStringField;
    cdsFuncionarioFUN_COMPO1: TStringField;
    cdsFuncionarioFUN_COMPO2: TStringField;
    cdsFuncionarioFUN_COMPO3: TStringField;
    cdsFuncionarioFUN_ASSID1: TStringField;
    cdsFuncionarioFUN_ASSID2: TStringField;
    cdsFuncionarioFUN_ASSID3: TStringField;
    cdsFuncionarioFUN_HONES1: TStringField;
    cdsFuncionarioFUN_HONES2: TStringField;
    cdsFuncionarioFUN_HONES3: TStringField;
    cdsFuncionarioFUN_CARAT1: TStringField;
    cdsFuncionarioFUN_CARAT2: TStringField;
    cdsFuncionarioFUN_CARAT3: TStringField;
    cdsFuncionarioFUN_FUNCAO: TStringField;
    cdsFuncionarioFUN_RGEMIS: TDateField;
    cdsFuncionarioFUN_CDCARGO: TIntegerField;
    cdsFuncionarioFUN_ESTADOCIVIL: TIntegerField;
    cdsFuncionarioFUN_DTCADA: TDateField;
    cdsFuncionarioFUN_HOCADA: TStringField;
    cdsFuncionarioFUN_USUARIO_CAD: TIntegerField;
    cdsFuncionarioFUN_DTALTE: TDateField;
    cdsFuncionarioFUN_HOALTE: TStringField;
    cdsFuncionarioFUN_USUARIO_ALT: TIntegerField;
    cdsFuncionarioFUN_NMEST_CIVIL: TStringField;
    cdsListaSituacao: TClientDataSet;
    cdsListaSituacaoSTC_CODIGO: TIntegerField;
    cdsListaSituacaoSTC_DESCRICAO: TStringField;
    cdsClienteCLI_NMSITUACAO: TStringField;
    cdsCidade: TClientDataSet;
    cdsBairro: TClientDataSet;
    cdsCidadeCID_CODIGO: TIntegerField;
    cdsCidadeCID_DESCRICAO: TStringField;
    cdsCidadeCID_UFCIDADE: TStringField;
    cdsBairroBAI_CODIGO: TIntegerField;
    cdsBairroBAI_DESCRICAO: TStringField;
    cdsBairroBAI_CDCIDADE: TIntegerField;
    cdsBairroBAI_NMCIDADE: TStringField;
    dstFornecedor: TSQLDataSet;
    dstFornecedorFOR_CODIGO: TIntegerField;
    dstFornecedorFOR_RAZAO: TStringField;
    dstFornecedorFOR_FANTASIA: TStringField;
    dstFornecedorFOR_CNPJ: TStringField;
    dstFornecedorFOR_INSCESTADUAL: TStringField;
    dstFornecedorFOR_ENDERECO: TStringField;
    dstFornecedorFOR_NUMERO: TIntegerField;
    dstFornecedorFOR_CEP: TStringField;
    dstFornecedorFOR_BAIRRO: TStringField;
    dstFornecedorFOR_CIDADE: TStringField;
    dstFornecedorFOR_UF: TStringField;
    dstFornecedorFOR_FONE1: TStringField;
    dstFornecedorFOR_FONE2: TStringField;
    dstFornecedorFOR_FAX: TStringField;
    dstFornecedorFOR_OPERACAO: TIntegerField;
    dstFornecedorFOR_CONTA: TIntegerField;
    dstFornecedorFOR_CONTATO1: TStringField;
    dstFornecedorFOR_CARGO1: TStringField;
    dstFornecedorFOR_FONECON1: TStringField;
    dstFornecedorFOR_CONTATO2: TStringField;
    dstFornecedorFOR_CARGO2: TStringField;
    dstFornecedorFOR_FONECON2: TStringField;
    dstFornecedorFOR_SITE: TStringField;
    dstFornecedorFOR_EMAIL: TStringField;
    dstFornecedorFOR_CDBANC: TStringField;
    dstFornecedorFOR_AGENCIA: TStringField;
    dstFornecedorFOR_DTCADA: TDateField;
    dstFornecedorFOR_HOCADA: TStringField;
    dstFornecedorFOR_USUARIO_CAD: TIntegerField;
    dstFornecedorFOR_DTALTE: TDateField;
    dstFornecedorFOR_HOALTE: TStringField;
    dstFornecedorFOR_USUARIO_ALT: TIntegerField;
    dstProduto: TSQLDataSet;
    dstProdutoPRO_CODIGO: TStringField;
    dstProdutoPRO_BARRAS: TStringField;
    dstProdutoPRO_REFERENCIA: TStringField;
    dstProdutoPRO_FLPROD: TStringField;
    dstProdutoPRO_DESCRICAO: TStringField;
    dstProdutoPRO_APLICACAO: TStringField;
    dstProdutoPRO_FORNECEDOR: TIntegerField;
    dstProdutoPRO_SECAOO: TIntegerField;
    dstProdutoPRO_SUB_SECAO: TIntegerField;
    dstProdutoPRO_VLCOMPRA: TFMTBCDField;
    dstProdutoPRO_VLCUSTO: TFMTBCDField;
    dstProdutoPRO_VLVENDA: TFMTBCDField;
    dstProdutoPRO_VLFRACAO: TFMTBCDField;
    dstProdutoPRO_TRIBUTACAO: TIntegerField;
    dstProdutoPRO_REDUCAOICMS: TFMTBCDField;
    dstProdutoPRO_TAXAS: TFMTBCDField;
    dstProdutoPRO_IPI: TFMTBCDField;
    dstProdutoPRO_FRETE: TFMTBCDField;
    dstProdutoPRO_LIMDESCONTO: TBCDField;
    dstProdutoPRO_COMISSIONADO: TStringField;
    dstProdutoPRO_DTCADASTRO: TDateField;
    dstProdutoPRO_DTALTERACAO: TDateField;
    dstProdutoPRO_UNIDADE: TStringField;
    dstProdutoPRO_LUCROBRUTO: TFMTBCDField;
    dstProdutoPRO_LUCROLIQUIDO: TFMTBCDField;
    dstProdutoPRO_CONTROLELOTE: TStringField;
    dstProdutoPRO_CODIGOBAIXA: TStringField;
    dstProdutoPRO_HOREAJUTE: TStringField;
    dstProdutoPRO_OBSERVACAO: TMemoField;
    dstProdutoPRO_USUARIO_REAJUSTE: TIntegerField;
    dstProdutoPRO_VALOR_ANTERIOR: TFMTBCDField;
    dstProdutoPRO_USUARIO_CAD: TIntegerField;
    dstProdutoPRO_HOCADA: TStringField;
    dstProdutoPRO_USUARIO_ALT: TIntegerField;
    dstProdutoPRO_HOALTE: TStringField;
    dstProdutoPRO_ANTECIPACAO_ICMS: TBCDField;
    dspFornecedor: TDataSetProvider;
    dspProduto: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    cdsProduto: TClientDataSet;
    cdsProdutoPRO_CODIGO: TStringField;
    cdsProdutoPRO_BARRAS: TStringField;
    cdsProdutoPRO_REFERENCIA: TStringField;
    cdsProdutoPRO_FLPROD: TStringField;
    cdsProdutoPRO_DESCRICAO: TStringField;
    cdsProdutoPRO_APLICACAO: TStringField;
    cdsProdutoPRO_FORNECEDOR: TIntegerField;
    cdsProdutoPRO_SECAOO: TIntegerField;
    cdsProdutoPRO_SUB_SECAO: TIntegerField;
    cdsProdutoPRO_VLCOMPRA: TFMTBCDField;
    cdsProdutoPRO_VLCUSTO: TFMTBCDField;
    cdsProdutoPRO_VLVENDA: TFMTBCDField;
    cdsProdutoPRO_VLFRACAO: TFMTBCDField;
    cdsProdutoPRO_TRIBUTACAO: TIntegerField;
    cdsProdutoPRO_REDUCAOICMS: TFMTBCDField;
    cdsProdutoPRO_TAXAS: TFMTBCDField;
    cdsProdutoPRO_IPI: TFMTBCDField;
    cdsProdutoPRO_FRETE: TFMTBCDField;
    cdsProdutoPRO_LIMDESCONTO: TBCDField;
    cdsProdutoPRO_COMISSIONADO: TStringField;
    cdsProdutoPRO_DTCADASTRO: TDateField;
    cdsProdutoPRO_DTALTERACAO: TDateField;
    cdsProdutoPRO_UNIDADE: TStringField;
    cdsProdutoPRO_LUCROBRUTO: TFMTBCDField;
    cdsProdutoPRO_LUCROLIQUIDO: TFMTBCDField;
    cdsProdutoPRO_CONTROLELOTE: TStringField;
    cdsProdutoPRO_CODIGOBAIXA: TStringField;
    cdsProdutoPRO_HOREAJUTE: TStringField;
    cdsProdutoPRO_OBSERVACAO: TMemoField;
    cdsProdutoPRO_USUARIO_REAJUSTE: TIntegerField;
    cdsProdutoPRO_VALOR_ANTERIOR: TFMTBCDField;
    cdsProdutoPRO_USUARIO_CAD: TIntegerField;
    cdsProdutoPRO_HOCADA: TStringField;
    cdsProdutoPRO_USUARIO_ALT: TIntegerField;
    cdsProdutoPRO_HOALTE: TStringField;
    cdsProdutoPRO_ANTECIPACAO_ICMS: TBCDField;
    dstFuncionarioFUN_NUMERO: TIntegerField;
    cdsFuncionarioFUN_NUMERO: TIntegerField;
    cdsFuncionarioFUN_NMCIDADE: TStringField;
    cdsFuncionarioFUN_NMBAIRRO: TStringField;
    cdsFuncionarioFUN_NMESTCIVIL: TStringField;
    dstFuncionarioFUN_SEXO: TStringField;
    cdsFuncionarioFUN_SEXO: TStringField;
    cdsFuncionarioFUN_NMCARGO: TStringField;
    dstFuncionarioFUN_CELULAR: TStringField;
    cdsFornecedorFOR_CODIGO: TIntegerField;
    cdsFornecedorFOR_RAZAO: TStringField;
    cdsFornecedorFOR_FANTASIA: TStringField;
    cdsFornecedorFOR_CNPJ: TStringField;
    cdsFornecedorFOR_INSCESTADUAL: TStringField;
    cdsFornecedorFOR_ENDERECO: TStringField;
    cdsFornecedorFOR_NUMERO: TIntegerField;
    cdsFornecedorFOR_CEP: TStringField;
    cdsFornecedorFOR_BAIRRO: TStringField;
    cdsFornecedorFOR_CIDADE: TStringField;
    cdsFornecedorFOR_UF: TStringField;
    cdsFornecedorFOR_FONE1: TStringField;
    cdsFornecedorFOR_FONE2: TStringField;
    cdsFornecedorFOR_FAX: TStringField;
    cdsFornecedorFOR_OPERACAO: TIntegerField;
    cdsFornecedorFOR_CONTA: TIntegerField;
    cdsFornecedorFOR_CONTATO1: TStringField;
    cdsFornecedorFOR_CARGO1: TStringField;
    cdsFornecedorFOR_FONECON1: TStringField;
    cdsFornecedorFOR_CONTATO2: TStringField;
    cdsFornecedorFOR_CARGO2: TStringField;
    cdsFornecedorFOR_FONECON2: TStringField;
    cdsFornecedorFOR_SITE: TStringField;
    cdsFornecedorFOR_EMAIL: TStringField;
    cdsFornecedorFOR_CDBANC: TStringField;
    cdsFornecedorFOR_AGENCIA: TStringField;
    cdsFornecedorFOR_DTCADA: TDateField;
    cdsFornecedorFOR_HOCADA: TStringField;
    cdsFornecedorFOR_USUARIO_CAD: TIntegerField;
    cdsFornecedorFOR_DTALTE: TDateField;
    cdsFornecedorFOR_HOALTE: TStringField;
    cdsFornecedorFOR_USUARIO_ALT: TIntegerField;
    cdsFuncionarioFUN_CELULAR: TStringField;
    dstAtendimento: TSQLDataSet;
    dspAtendimento: TDataSetProvider;
    cdsAtendimento: TClientDataSet;
    dstAtendimentoAGE_ID: TIntegerField;
    dstAtendimentoAGE_DTMOVI: TDateField;
    dstAtendimentoAGE_HOMOVI: TStringField;
    dstAtendimentoAGE_CLIENTE: TIntegerField;
    dstAtendimentoAGE_DTATENDIMENTO: TDateField;
    dstAtendimentoAGE_HOATENDIMENTO: TStringField;
    dstAtendimentoAGE_SITUACAO: TStringField;
    dstAtendimentoAGE_FUNCIONARIO: TIntegerField;
    dstAtendimentoAGE_DESCRICAO: TMemoField;
    dstAtendimentoAGE_DIAGNOSTICO: TMemoField;
    dstAtendimentoAGE_OBSERVACAO: TMemoField;
    dstAtendimentoAGE_USCADA: TIntegerField;
    dstAtendimentoAGE_DTALTE: TDateField;
    dstAtendimentoAGE_HOALTE: TStringField;
    dstAtendimentoAGE_USALTE: TIntegerField;
    cdsAtendimentoAGE_ID: TIntegerField;
    cdsAtendimentoAGE_DTMOVI: TDateField;
    cdsAtendimentoAGE_HOMOVI: TStringField;
    cdsAtendimentoAGE_CLIENTE: TIntegerField;
    cdsAtendimentoAGE_DTATENDIMENTO: TDateField;
    cdsAtendimentoAGE_HOATENDIMENTO: TStringField;
    cdsAtendimentoAGE_SITUACAO: TStringField;
    cdsAtendimentoAGE_FUNCIONARIO: TIntegerField;
    cdsAtendimentoAGE_DESCRICAO: TMemoField;
    cdsAtendimentoAGE_DIAGNOSTICO: TMemoField;
    cdsAtendimentoAGE_OBSERVACAO: TMemoField;
    cdsAtendimentoAGE_USCADA: TIntegerField;
    cdsAtendimentoAGE_DTALTE: TDateField;
    cdsAtendimentoAGE_HOALTE: TStringField;
    cdsAtendimentoAGE_USALTE: TIntegerField;
    cdsListaFuncionarios: TClientDataSet;
    cdsListaFuncionariosFUN_CODIGO: TIntegerField;
    cdsListaFuncionariosFUN_NOME: TStringField;
    cdsAtendimentoATE_NMFUNCIONARIO: TStringField;
    cdsListaFornecedores: TClientDataSet;
    cdsListaUnidades: TClientDataSet;
    cdsListaFornecedoresFOR_CODIGO: TIntegerField;
    cdsListaFornecedoresFOR_FANTASIA: TStringField;
    cdsProdutoPRO_NMUNID: TStringField;
    cdsProdutoPRO_NMFORN: TStringField;
    dstEstoque: TSQLDataSet;
    dstEstoqueEST_CDLOJA: TIntegerField;
    dstEstoqueEST_CDPROD: TStringField;
    dstEstoqueEST_UNPROD: TStringField;
    dstEstoqueEST_DTENTRADA: TDateField;
    dstEstoqueEST_QUANTENTRADA: TFMTBCDField;
    dstEstoqueEST_DTSAIDA: TDateField;
    dstEstoqueEST_QUANTSAIDA: TFMTBCDField;
    dstEstoqueEST_CUSTOANTERIOR: TFMTBCDField;
    dstEstoqueEST_CUSTOMEDIO: TFMTBCDField;
    dstEstoqueEST_MAIORCUSTO: TFMTBCDField;
    dstEstoqueEST_QUANTIDADE: TFMTBCDField;
    dstEstoqueEST_MINIMO: TFMTBCDField;
    dstEstoqueULTREAJUST: TDateField;
    dspEstoque: TDataSetProvider;
    cdsEstoque: TClientDataSet;
    cdsEstoqueEST_CDLOJA: TIntegerField;
    cdsEstoqueEST_CDPROD: TStringField;
    cdsEstoqueEST_UNPROD: TStringField;
    cdsEstoqueEST_DTENTRADA: TDateField;
    cdsEstoqueEST_QUANTENTRADA: TFMTBCDField;
    cdsEstoqueEST_DTSAIDA: TDateField;
    cdsEstoqueEST_QUANTSAIDA: TFMTBCDField;
    cdsEstoqueEST_CUSTOANTERIOR: TFMTBCDField;
    cdsEstoqueEST_CUSTOMEDIO: TFMTBCDField;
    cdsEstoqueEST_MAIORCUSTO: TFMTBCDField;
    cdsEstoqueEST_QUANTIDADE: TFMTBCDField;
    cdsEstoqueEST_MINIMO: TFMTBCDField;
    cdsEstoqueULTREAJUST: TDateField;
    dstConfigCFG_SEQUENCIA: TIntegerField;
    cdsConfigCFG_SEQUENCIA: TIntegerField;
    dstHistorico: TSQLDataSet;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dstHistoricoHIS_SEQUENCIA: TIntegerField;
    dstHistoricoHIS_LOJA: TIntegerField;
    dstHistoricoHIS_PRODUTO: TStringField;
    dstHistoricoHIS_NRITEM: TIntegerField;
    dstHistoricoHIS_UNIDADE: TStringField;
    dstHistoricoHIS_DATA: TDateField;
    dstHistoricoHIS_HORA: TStringField;
    dstHistoricoHIS_TIPO: TStringField;
    dstHistoricoHIS_DOCUMENTO: TIntegerField;
    dstHistoricoHIS_ANTERIOR: TFMTBCDField;
    dstHistoricoHIS_MOVIMENTO: TFMTBCDField;
    dstHistoricoHIS_ATUAL: TFMTBCDField;
    dstHistoricoHIS_USUARIO: TIntegerField;
    dstHistoricoHIS_MOTIVO: TIntegerField;
    dstHistoricoHIS_VLCUSTO: TFMTBCDField;
    dstHistoricoHIS_VLCOMPRA: TFMTBCDField;
    dstHistoricoHIS_VLVENDA: TFMTBCDField;
    dstHistoricoHIS_CODIGOBAIXA: TStringField;
    dstHistoricoHIS_VENDEDOR: TIntegerField;
    cdsHistoricoHIS_SEQUENCIA: TIntegerField;
    cdsHistoricoHIS_LOJA: TIntegerField;
    cdsHistoricoHIS_PRODUTO: TStringField;
    cdsHistoricoHIS_NRITEM: TIntegerField;
    cdsHistoricoHIS_UNIDADE: TStringField;
    cdsHistoricoHIS_DATA: TDateField;
    cdsHistoricoHIS_HORA: TStringField;
    cdsHistoricoHIS_TIPO: TStringField;
    cdsHistoricoHIS_DOCUMENTO: TIntegerField;
    cdsHistoricoHIS_ANTERIOR: TFMTBCDField;
    cdsHistoricoHIS_MOVIMENTO: TFMTBCDField;
    cdsHistoricoHIS_ATUAL: TFMTBCDField;
    cdsHistoricoHIS_USUARIO: TIntegerField;
    cdsHistoricoHIS_MOTIVO: TIntegerField;
    cdsHistoricoHIS_VLCUSTO: TFMTBCDField;
    cdsHistoricoHIS_VLCOMPRA: TFMTBCDField;
    cdsHistoricoHIS_VLVENDA: TFMTBCDField;
    cdsHistoricoHIS_CODIGOBAIXA: TStringField;
    cdsHistoricoHIS_VENDEDOR: TIntegerField;
    dstAtendimentoAGE_DTCANCELAMENTO: TDateField;
    dstAtendimentoAGE_HOCANCELAMENTO: TStringField;
    dstAtendimentoAGE_DTREMARCAMENTO: TDateField;
    dstAtendimentoAGE_HOREMARCAMENTO: TStringField;
    cdsAtendimentoAGE_DTCANCELAMENTO: TDateField;
    cdsAtendimentoAGE_HOCANCELAMENTO: TStringField;
    cdsAtendimentoAGE_DTREMARCAMENTO: TDateField;
    cdsAtendimentoAGE_HOREMARCAMENTO: TStringField;
    dstListaAtendimento: TSQLDataSet;
    dspListaAtendimento: TDataSetProvider;
    cdsAtendimentoLista: TClientDataSet;
    cdsAtendimentoListaAGE_ID: TIntegerField;
    cdsAtendimentoListaAGE_DTMOVI: TDateField;
    cdsAtendimentoListaAGE_CLIENTE: TIntegerField;
    cdsAtendimentoListaCLI_NOME: TStringField;
    cdsAtendimentoListaAGE_DTATENDIMENTO: TDateField;
    cdsAtendimentoListaAGE_HOATENDIMENTO: TStringField;
    cdsAtendimentoListaAGE_SITUACAO: TStringField;
    cdsAtendimentoListaAGE_FUNCIONARIO: TIntegerField;
    cdsAtendimentoListaFUN_NOME: TStringField;
    cdsListaAtendimento: TClientDataSet;
    cdsListaAtendimentoCODIGO: TIntegerField;
    cdsListaAtendimentoDATA_MOVI: TDateField;
    cdsListaAtendimentoCLIENTE: TIntegerField;
    cdsListaAtendimentoNOME_CLIENTE: TStringField;
    cdsListaAtendimentoDATA_ATEND: TDateField;
    cdsListaAtendimentoHORA_ATEND: TStringField;
    cdsListaAtendimentoSITUACAO: TStringField;
    cdsListaAtendimentoFUN_CODIGO: TIntegerField;
    cdsListaAtendimentoFUN_NOME: TStringField;
    cdsListaAtendimentoHORARIO: TStringField;
    dstCarta: TSQLDataSet;
    dspCarta: TDataSetProvider;
    cdsCarta: TClientDataSet;
    dstCartaCAR_CODIGO: TIntegerField;
    dstCartaCAR_DESCRICAO: TStringField;
    dstCartaCAR_TEXTO: TMemoField;
    dstConfigCFG_NATUREZA: TIntegerField;
    dstConfigCFG_CARTA: TIntegerField;
    cdsConfigCFG_NATUREZA: TIntegerField;
    cdsConfigCFG_CARTA: TIntegerField;
    cdsCartaCAR_CODIGO: TIntegerField;
    cdsCartaCAR_DESCRICAO: TStringField;
    cdsCartaCAR_TEXTO: TMemoField;
    dstCargo: TSQLDataSet;
    dstCargoTFU_CODIGO: TIntegerField;
    dstCargoTFU_DESCRICAO: TStringField;
    dstCargoTFU_SIGLA: TStringField;
    dspCargo: TDataSetProvider;
    cdsCargo: TClientDataSet;
    cdsCargoTFU_CODIGO: TIntegerField;
    cdsCargoTFU_DESCRICAO: TStringField;
    cdsCargoTFU_SIGLA: TStringField;
    dstUnidade: TSQLDataSet;
    dstNatureza: TSQLDataSet;
    dstModalidade: TSQLDataSet;
    dstUnidadeUND_CODIGO: TStringField;
    dstUnidadeUND_DESCRICAO: TStringField;
    dstNaturezaNAT_CODIGO: TIntegerField;
    dstNaturezaNAT_NOME: TStringField;
    dstNaturezaNAT_TIPO: TStringField;
    dstNaturezaNAT_FLDESC: TStringField;
    dspUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    cdsUnidadeUND_CODIGO: TStringField;
    cdsUnidadeUND_DESCRICAO: TStringField;
    dspNatureza: TDataSetProvider;
    cdsNatureza: TClientDataSet;
    cdsNaturezaNAT_CODIGO: TIntegerField;
    cdsNaturezaNAT_NOME: TStringField;
    cdsNaturezaNAT_TIPO: TStringField;
    cdsNaturezaNAT_FLDESC: TStringField;
    dspModalidade: TDataSetProvider;
    cdsModalidade: TClientDataSet;
    dstModalidadeMOD_CODIGO: TIntegerField;
    dstModalidadeMOD_NOME: TStringField;
    dstModalidadeMOD_PECOMISSAO: TBCDField;
    dstModalidadeMOD_ABREVIACAO: TStringField;
    dstModalidadeMOD_NRPARCELA: TIntegerField;
    dstModalidadeMOD_FLFIXA: TStringField;
    dstModalidadeMOD_CAIXA_GERAL: TIntegerField;
    dstModalidadeMOD_AVISTA: TStringField;
    dstModalidadeMOD_FLXTEF: TStringField;
    dstModalidadeMOD_PASTA_ENVIA_TEF: TStringField;
    dstModalidadeMOD_PASTA_RECEBE_TEF: TStringField;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TBCDField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    cdsModalidadeMOD_NRPARCELA: TIntegerField;
    cdsModalidadeMOD_FLFIXA: TStringField;
    cdsModalidadeMOD_CAIXA_GERAL: TIntegerField;
    cdsModalidadeMOD_AVISTA: TStringField;
    cdsModalidadeMOD_FLXTEF: TStringField;
    cdsModalidadeMOD_PASTA_ENVIA_TEF: TStringField;
    cdsModalidadeMOD_PASTA_RECEBE_TEF: TStringField;
    dstConfigCFG_CARGO: TIntegerField;
    dstConfigCFG_MODALIDADE: TIntegerField;
    cdsConfigCFG_CARGO: TIntegerField;
    cdsConfigCFG_MODALIDADE: TIntegerField;
    dstConfigCFG_SEQTAREFAUSUARIOS: TIntegerField;
    cdsConfigCFG_SEQTAREFAUSUARIOS: TIntegerField;
    cdsAcessoMenu: TClientDataSet;
    qryConsulta: TSQLQuery;
    cdsAcessos: TClientDataSet;
    cdsPermissoes: TClientDataSet;
    cdsGetNomeMenu: TClientDataSet;
    cdsConsulta2: TClientDataSet;
    dstCartaCAR_TITULO: TStringField;
    cdsCartaCAR_TITULO: TStringField;
    dstConfigCFG_SEQENTRADA: TIntegerField;
    dstConfigCFG_SEQVENDA: TIntegerField;
    cdsConfigCFG_SEQENTRADA: TIntegerField;
    cdsConfigCFG_SEQVENDA: TIntegerField;
    dstConfigCFG_SCREENWIDTH: TIntegerField;
    dstConfigCFG_SCREENHEIGHT: TIntegerField;
    cdsConfigCFG_SCREENWIDTH: TIntegerField;
    cdsConfigCFG_SCREENHEIGHT: TIntegerField;
    cdsParcelas: TClientDataSet;
    cdsParcelasPAR_NRPARCELA: TIntegerField;
    cdsParcelasPAR_VENCIMENTO: TDateField;
    cdsParcelasPAR_VALOR: TCurrencyField;
    cdsParcelasPAR_BANCO: TStringField;
    cdsParcelasPAR_AGENCIA: TStringField;
    cdsParcelasPAR_CONTA: TStringField;
    cdsParcelasPAR_CHEQUE: TStringField;
    cdsParcelasVenda: TClientDataSet;
    cdsParcelasVendaPAR_NRPARCELA: TIntegerField;
    cdsParcelasVendaPAR_VENCIMENTO: TDateField;
    cdsParcelasVendaPAR_VALOR: TCurrencyField;
    cdsParcelasVendaPAR_BANCO: TStringField;
    cdsParcelasVendaPAR_AGENCIA: TStringField;
    cdsParcelasVendaPAR_CONTA: TStringField;
    cdsParcelasVendaPAR_CHEQUE: TStringField;
    cdsParcelasVendaPAR_QTPARCELAS: TIntegerField;
    cdsParcelasVendaPAR_MODALIDADE: TIntegerField;
    dstConfigCFG_VENDA: TIntegerField;
    cdsConfigCFG_VENDA: TIntegerField;
    dstConfigCFG_SEQMOVCAIXA: TIntegerField;
    cdsConfigCFG_SEQMOVCAIXA: TIntegerField;
    dstVenda: TSQLDataSet;
    dspVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
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
    dstFuncionarioFUN_SITUACAO: TIntegerField;
    cdsFuncionarioFUN_SITUACAO: TIntegerField;
    cdsFuncionarioFUN_NMSITUACAO: TStringField;
    dstConfigCFG_LOGO: TGraphicField;
    cdsConfigCFG_LOGO: TGraphicField;
    dstConfigCFG_HORA: TTimeField;
    cdsConfigCFG_HORA: TTimeField;
    ppRepAtendimento: TppReport;
    ppDBPAtendimento: TppDBPipeline;
    dsAtendimento: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    txtCabecalho: TppMemo;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel8: TppLabel;
    txtCliente: TppLabel;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sqlConexaoBeforeConnect(Sender: TObject);
    procedure dspBairroGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspCidadeGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspFuncionarioGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspClienteGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspConfigGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspUsuarioGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspEstoqueGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspHistoricoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsListaAtendimentoHORARIOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dspCargoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspUnidadeGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspNaturezaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspModalidadeGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspVendaGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Start;
    procedure Comit(aTransc : TTransactionDesc);
    procedure Rollback;
    //
    Function ProcurarValor(aValor, aCampo, aTabela : String) : Boolean;
    Procedure AbrirTabelaConfig();
    //
    Function GetNomeCliente(iCliente : Integer) : String;
    Function GetNomeProduto(aCodigo : String) : String;
    Function AddHistoricoProduto( iLOJA, iNRITEM, iDOCUMENTO, iUSUARIO,
         iMOTIVO : Integer ; aPRODUTO, aUNIDADE, aHORA, aTIPO : String; aDATA : TDateTime;
         fANTERIOR, fMOVIMENTO, fATUAL, fVLCOMPRA, fVLVENDA : Double)  : Boolean;
    Function AddHistoricoProduto2( iLOJA, iNRITEM, iDOCUMENTO, iUSUARIO,
         iMOTIVO : Integer ; aPRODUTO, aUNIDADE, aHORA, aTIPO : String; aDATA : TDateTime;
         fANTERIOR, fMOVIMENTO, fATUAL, fVLCOMPRA, fVLVENDA : Double)  : Boolean;

    Function AlterarStatusAtendimento(iID : Integer; aSituacao : String) : Boolean;
    Function GetCodigoFornecedor(aRazao : String) : Integer;
    //
    Function CarregarLista(aDataMovimento : TDateTime) : Boolean;
    Function IncluirTarefaUsuario(iCodigo : Integer; aAcao : String) : Boolean;
    Function Verificar_Acesso_Menu(aUsuario, aCodMenu : Integer) : String;
    Procedure SetAdminUsuario(aCodigo : Integer; aValor : String);
    Function ValidarAcesso(aCodUsuario : Integer) : boolean;
    procedure Acessos_Sistema(aCds : TClientDataSet; aTipo, aCodUsu : Integer);
    Function GetNomeMenu(aCodMenu : Integer) : String;
    Function Verificar_Menu_Pai(aCodigo : Integer) : Boolean;
    Procedure Verificar_Direito_Acesso(aUsuario, aCodMenu : Integer);
    Procedure Incluir_Acesso_Usuario(aCodUsu, aCodMenu : Integer; aNome_Acesso,
       aConsulta, aNovo, aAlterar, aExcluir : String);
    Function GetNomeFornecedor(aNome : String) : Integer;
    Function GetCodigoNatureza(aNomeNatureza : String) : Integer;
    Function GetNomeForn(iCodigo : Integer) : String;
    Function GetNomeNatureza(iCodigo : Integer) : String;
    Function GetCodMenu(aNomeMenu : String) : Integer;
    Function GravaVenda(iLoja, iCliente, iVendedor : Integer;
         fValorVenda, fValorEntrada, fVlAcrecimo,
         fVlDesconto, fVlTroco : Double; aCDSItens : TClientDataSet) : Boolean;
    Function Incluir_Iten_Venda(iPedido, iItem, iVendedor : Integer;
           aProduto, aUnidade : String;
           fValorUnitario, fQuant, fValrCusto, fValorCompra : Double) : Boolean;
    Function ExcluirVenda(iVenda : Integer): Boolean;
    Function ExcluirVendaItens(iVenda : Integer): Boolean;
    Function GetCodSituacao(aDescricao : String) : Integer;
    Function VerificarHoraAgenda(iFuncionario : Integer; aData : TDatetime; aHora : String ): Boolean;
    Function VerificarHoraAgendaFuncionario(iFuncionario : Integer; aData : TDatetime; aHora : String): Boolean;
    Function VerificarEstoqueProduto(aProduto : String; iLoja : Integer): Boolean;
  end;

var
  dmDados: TdmDados;
  Transc : TTransactionDesc;
  sl : TStrings;
  W_NRVEND : INTEGER;

implementation

uses uFuncoes, uFrmMain, uFormaPagamento, udmFinanceiro;

{$R *.dfm}

procedure TdmDados.Comit(aTransc: TTransactionDesc);
begin
      sqlConexao.Commit(aTransc);
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
      try
           sqlConexao.Connected := True;
           //
           SL := TStringList.Create;
           cdsListaAtendimento.AggregatesActive := True;

      Except
          on e: exception do
          begin
              Application.MessageBox(PChar('Erro na abertura do Sistema!!! Erro:'+#13
                      + E.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
              sqlConexao.Connected := false;
              Application.Terminate;
          End;
      End;

end;

procedure TdmDados.DataModuleDestroy(Sender: TObject);
begin
     SL.Free;
     //
     sqlConexao.Connected := False;
end;

function TdmDados.ProcurarValor(aValor, aCampo, aTabela: String): Boolean;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     result := False;
     texto  := 'select "'+aCampo+'" from '+aTabela+' where ("'+aCampo+'" = :pValor)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pValor').AsString := aValor;
           Open;
           //
           If not (IsEmpty) Then
                Result := True;
      Finally
         Free;
      End;
end;

procedure TdmDados.Rollback;
begin
     sqlConexao.Rollback(Transc);
     raise Exception.Create(MSG_ERROR);
end;

procedure TdmDados.sqlConexaoBeforeConnect(Sender: TObject);
Var
	ConfigIni : TIniFile;
	Path : String;
Begin
	ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
	sqlConexao.Params.Values['Database'] := ConfigIni.ReadString('CONFIG','DATABASE','');
	ConfigIni.Free;
end;

procedure TdmDados.Start;
begin
     Transc.IsolationLevel := xilREADCOMMITTED;
     Transc.TransactionID  := StrToInt(uFuncoes.IDTransation);
     sqlConexao.StartTransaction(Transc);
end;

procedure TdmDados.dspBairroGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'BAIRROS';
end;

procedure TdmDados.dspCidadeGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
    TableName := 'CIDADES';
end;

procedure TdmDados.dspFuncionarioGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
 TableName := 'FUNCIONARIOS';
end;

procedure TdmDados.dspClienteGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
 TableName := 'CLIENTES';
end;

procedure TdmDados.dspConfigGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
 TableName := 'CONFIG';
end;

procedure TdmDados.dspUsuarioGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
 TableName := 'USUARIOS';
end;

procedure TdmDados.AbrirTabelaConfig;
begin
    uFuncoes.FilterCDS(dmDados.cdsConfig, fsInteger, '1' );
end;

function TdmDados.GetNomeCliente(iCliente: Integer): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     texto  := 'select CLI_CODIGO, CLI_NOME from CLIENTES where (CLI_CODIGO = :pCODIGO)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pCODIGO').AsInteger := iCliente;
           Open;
           //
           If not (IsEmpty) Then
                Result := FieldByName('CLI_NOME').AsString;
      Finally
         Free;
      End;
end;

function TdmDados.GetNomeProduto(aCodigo: String): String;
Var
    qryBanco : TSQLQuery;
    texto : String;
begin
     texto  := 'select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS where (PRO_CODIGO = :pCODIGO)';
     //
     qryBanco := TSQLQuery.Create(nil);
     with qryBanco do
      try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(texto);
           Params.ParamByName('pCODIGO').AsString := aCodigo;
           Open;
           //
           If not (IsEmpty) Then
                Result := FieldByName('PRO_DESCRICAO').AsString;
      Finally
         Free;
      End;
end;

procedure TdmDados.dspEstoqueGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'ESTOQUE';
end;

function TdmDados.AddHistoricoProduto(iLOJA, iNRITEM,
  iDOCUMENTO, iUSUARIO, iMOTIVO: Integer; aPRODUTO, aUNIDADE, aHORA,
  aTIPO: String; aDATA: TDateTime; fANTERIOR, fMOVIMENTO, fATUAL,
  fVLCOMPRA, fVLVENDA: Double): Boolean;
Var
   iSeq : Integer;
begin
     Result := False;
     //
     dmDados.AbrirTabelaConfig();
     //
     try
         Start;
         //
         dmDados.cdsConfig.Edit;
         dmDados.cdsConfigCFG_SEQUENCIA.AsInteger :=
             dmDados.cdsConfigCFG_SEQUENCIA.AsInteger + 1;
         dmDados.cdsConfig.ApplyUpdates(0);
         //
         iSeq := dmDados.cdsConfigCFG_SEQUENCIA.AsInteger;
         //
         With cdsHistorico do
         begin
              Close;
              Params.ParamByName('pSEQ').AsInteger    := iSeq;
              Params.ParamByName('pLOJA').AsInteger   := iLoja;
              Params.ParamByName('pPRODUTO').AsString := aPRODUTO;
              Params.ParamByName('pNRITEM').AsInteger := iNRITEM;
              Open;
              //
              Append;
              FieldByName('HIS_SEQUENCIA').AsInteger := iSeq;
              FieldByName('HIS_LOJA').AsInteger      := iLOJA;
              FieldByName('HIS_PRODUTO').AsString    := aPRODUTO;
              FieldByName('HIS_NRITEM').AsInteger    := iNRITEM;
              FieldByName('HIS_UNIDADE').AsString    := aUNIDADE;
              FieldByName('HIS_DATA').AsDateTime     := aDATA;
              FieldByName('HIS_HORA').AsString       := aHORA;
              FieldByName('HIS_TIPO').AsString       := aTIPO;
              If (iDOCUMENTO > 0) Then
                 FieldByName('HIS_DOCUMENTO').AsInteger := iDOCUMENTO;
              FieldByName('HIS_ANTERIOR').AsFloat    := fANTERIOR;
              FieldByName('HIS_MOVIMENTO').AsFloat   := fMOVIMENTO;
              FieldByName('HIS_ATUAL').AsFloat       := fATUAL;
              If (iMOTIVO > 0) Then
                FieldByName('HIS_MOTIVO').AsInteger  := iMOTIVO;
              FieldByName('HIS_VLCOMPRA').AsFloat    := fVLCOMPRA;
              FieldByName('HIS_VLVENDA').AsFloat     := fVLVENDA;
              FieldByName('HIS_CODIGOBAIXA').AsString := aPRODUTO;
              FieldByName('HIS_USUARIO').AsInteger   := iUSUARIO;
              //
              ApplyUpdates(0);
          End;
          //
          Comit(Transc);
          Result := True;
     Except
          Rollback;
     End;
end;

procedure TdmDados.dspHistoricoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'HISTORICO';
end;

function TdmDados.AlterarStatusAtendimento(iID : Integer; aSituacao: String): Boolean;
Var
   aData : TDatetime;
   aHora : String;
begin
     Result := False;
     uFuncoes.FilterCDS(cdsAtendimento, fsInteger, InttoStr(iID));
     aData := Date();
     aHora := Copy(TimetoStr(Time()),1,5);
     //
     If not (cdsAtendimento.IsEmpty) Then
      begin
         Start;
         try
           With cdsAtendimento do
            begin
                 Edit;
                 //
                 FieldByname('AGE_SITUACAO').AsString := aSituacao;
                 //
                 If (aSituacao = 'C') Then
                  Begin
                       FieldByname('AGE_DTCANCELAMENTO').AsDateTime := aData;
                       FieldByname('AGE_HOCANCELAMENTO').AsString   := aHora;
                  End;
                 //
                 If (aSituacao = 'R') Then
                  Begin
                       FieldByname('AGE_DTREMARCAMENTO').AsDateTime := aData;
                       FieldByname('AGE_HOREMARCAMENTO').AsString   := aHora;
                  End;
                 //
                 ApplyUpdates(0);
            End;
            //
            Comit(Transc);
            //
            Result := True;
         Except
             Rollback;
         End;
      End;
end;

function TdmDados.GetCodigoFornecedor(aRazao: String): Integer;
Var
    qryConsulta : TSQLQuery;
    aTexto : String;
begin
     aTexto := 'Select FOR_CODIGO, FOR_RAZAO, FOR_FANTASIA from fornecedores Where (FOR_FANTASIA = :pNOME)';
     qryConsulta := TSQLQuery.Create(nil);
     //
     with qryConsulta do
      Try
           SQLConnection := sqlConexao;
           Close;
           SQL.Add(aTexto);
           Params.ParamByName('pNOME').AsString := aRazao;
           Open;
           //
           if not (IsEmpty) Then
              Result := FieldByName('FOR_CODIGO').AsInteger;
           //
      Finally
         Free;
      End;
end;


function TdmDados.CarregarLista(aDataMovimento: TDateTime): Boolean;
Var
   M_HORA : String;
begin
     Result := False;
     With cdsAtendimentoLista do
      begin
           Close;
           Params[0].AsDateTime := aDataMovimento;
           Open;
           //
           cdsListaAtendimento.Close;
           cdsListaAtendimento.Open;
           cdsListaAtendimento.EmptyDataSet;
           //
           If not (IsEmpty) Then
            begin
                 //
                 First;
                 cdsListaAtendimento.DisableControls;
                 While not (Eof) do
                 begin
                      cdsListaAtendimento.Append;
                      M_HORA := Copy(FieldByName('AGE_HOATENDIMENTO').AsString, 1,2);
                      M_HORA := M_HORA + ':00';
                      cdsListaAtendimentoHORARIO.AsString := M_HORA;
                      cdsListaAtendimentoCODIGO.AsInteger := FieldByName('AGE_ID').AsInteger;
                      cdsListaAtendimentoDATA_MOVI.AsDateTime := FieldByName('AGE_DTMOVI').AsDateTime;
                      cdsListaAtendimentoCLIENTE.AsInteger := FieldByName('AGE_CLIENTE').AsInteger;
                      cdsListaAtendimentoNOME_CLIENTE.AsString := FieldByName('CLI_NOME').AsString;
                      cdsListaAtendimentoDATA_ATEND.AsDateTime := FieldByName('AGE_DTATENDIMENTO').AsDateTime;
                      cdsListaAtendimentoHORA_ATEND.AsString   := FieldByName('AGE_HOATENDIMENTO').AsString;
                      cdsListaAtendimentoSITUACAO.AsString     := FieldByName('AGE_SITUACAO').AsString;
                      cdsListaAtendimentoFUN_CODIGO.AsInteger  := FieldByName('AGE_FUNCIONARIO').AsInteger;
                      cdsListaAtendimentoFUN_NOME.AsString     := FieldByName('FUN_NOME').AsString;
                      //
                      cdsListaAtendimento.Post;
                      //
                      Next;
                 End;
                 //
                 cdsListaAtendimento.EnableControls;
                 //
                 Result := True;
            End;
      End;
end;

procedure TdmDados.cdsListaAtendimentoHORARIOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
      If gbFirst in cdsListaAtendimento.GetGroupState(1) Then
       begin
          Text := cdsListaAtendimentoHORARIO.AsString;
          If sl.IndexOf(text) < 0 Then
             sl.Add(Text);
       End
      Else
          Text := '';
end;

procedure TdmDados.dspCargoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'TIPO_FUNCIONARIO';
end;

procedure TdmDados.dspUnidadeGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'UNIDADES';
end;

procedure TdmDados.dspNaturezaGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'NATUREZA';
end;

procedure TdmDados.dspModalidadeGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'MODALIDADE';
end;

function TdmDados.IncluirTarefaUsuario(iCodigo: Integer;
  aAcao: String): Boolean;
Var
   aTexto, aHora, aComputador : String;
   qryInclusao : TSQLQuery;
   aData : TDatetime;
   iSeq : Integer;
begin
   Result := False;
   aData := Date();
   aHora := Copy(TimetoStr(Time),1,5);
   aComputador := uFuncoes.SysComputerName();
   aTexto := 'Insert into tarefas_usuarios ("TAR_SEQUENCIA", "TAR_USUARIO", "TAR_DTMOVI", "TAR_HOMOVI", "TAR_COMPUTADOR", "TAR_ACAO") ';
   aTexto := aTexto +' values (:pSEQ, :pUSUARIO, :pDTMOVI, :pHOMOVI, :pCOMPUTADOR, :pACAO)';
   //
   uFuncoes.RefreshCDS(dmDados.cdsConfig);
   dmDados.cdsConfig.Edit;
   dmDados.cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger :=
      dmDados.cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger + 1;
   dmDados.cdsConfig.ApplyUpdates(0);
   iSeq := dmDados.cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger;
   //
   qryInclusao := TSQLQuery.Create(nil);
   with qryInclusao do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pSEQ').AsInteger     := iSeq;
         Params.ParamByName('pUSUARIO').AsInteger := iCodigo;
         Params.ParamByName('pDTMOVI').AsDate     := aData;
         Params.ParamByName('pHOMOVI').AsString   := aHora;
         Params.ParamByName('pCOMPUTADOR').AsString := aComputador;
         Params.ParamByName('pACAO').AsString     := aAcao;
         ExecSQL();
         //
         Result := True;
    Finally
         Free;
    End;
end;

function TdmDados.Verificar_Acesso_Menu(aUsuario,
  aCodMenu: Integer): String;
begin
     result := 'N';
     //With dmConsultas.qryConsulta do
     with dmDados.cdsAcessoMenu do
      begin
           Active := False;
           CommandText := 'SELECT PU_CONSULTAR FROM PERMISSOES_USUARIOS ';
           CommandText := CommandText + 'WHERE (USU_CODIGO = :CODUSUARIO) AND (MEN_CODIGO = :CODMENU)';
           Params.ParamByName('CODUSUARIO').AsInteger := aUsuario;
           Params.ParamByName('CODMENU').AsInteger    := aCodMenu;
           Active := True;
           //
           If not (IsEmpty) Then
             If (FieldByName('PU_CONSULTAR').AsString = 'S') Then
                Result := FieldByName('PU_CONSULTAR').AsString;
           //
           Active := False;
      End;
end;

procedure TdmDados.SetAdminUsuario(aCodigo: Integer; aValor: String);
Var
   aTexto : String;
   qryInclusao : TSQLQuery;
begin
   aTexto := 'Update USUARIOS SET SEN_ADMIN = :pValor Where (SEN_CODIGO = :pCODIGO) ';
   qryInclusao := TSQLQuery.Create(nil);
   with qryInclusao do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pCODIGO').AsInteger := aCodigo;
         Params.ParamByName('pValor').AsString := aValor;
         ExecSQL();
         //
    Finally
         Free;
    End;
end;

function TdmDados.ValidarAcesso(aCodUsuario: Integer): boolean;
begin
     Result := False;
     with qryConsulta do
     //with dmRelatorios.cdsValidarAcesso do
      begin
           {Active := False;
           CommandText := 'Select PU.usu_codigo, count(*) as QUANT from PERMISSOES_USUARIOS PU ';
           CommandText := CommandText + ' Where (PU.usu_codigo = :pUSUARIO) group by PU.usu_codigo ';}
           SQL.Clear;
           Close;
           sql.Add('Select PU.usu_codigo, count(*) as QUANT from PERMISSOES_USUARIOS PU ');
           sql.Add(' Where (PU.usu_codigo = :pUSUARIO) group by PU.usu_codigo ');
           Params.ParamByName('pUSUARIO').AsInteger := aCodUsuario;
           Open;
           ///Active := True;
           //
           If not(IsEmpty) Then
              if (FieldByName('QUANT').AsFloat > 0) Then
                 Result := True;
           //
           Active := False;
      End;
end;

procedure TdmDados.Acessos_Sistema(aCds: TClientDataSet; aTipo,
  aCodUsu: Integer);
begin
     aCds.Close;
     aCds.Open;
     aCds.EmptyDataSet;
     //
     If (aTipo = 1) Then
     begin
      With cdsAcessos do
      begin
           Active := False;
           CommandText := 'Select * from MENUS Where (MEN_NOME <> '+QuotedStr('-')+') order by MEN_CODIGO ';
           Active := True;
           //
           If not (IsEmpty) Then
            begin
                 First;
                 //
                 While not (cdsAcessos.Eof) do
                 begin
                       With aCds do
                       begin
                            append;
                            FieldByName('CODIGO').AsInteger    := cdsAcessos.FieldByName('MEN_CODIGO').AsInteger;
                            FieldByName('MENU_NOME').AsString  := cdsAcessos.FieldByName('MEN_NOME').AsString;
                            FieldByName('MENU_PAI').AsInteger  := cdsAcessos.FieldByName('MEN_CODIGOPAI').AsInteger;
                            FieldByName('PERMISSAO').AsBoolean := False;
                            FieldByName('NOVO').AsBoolean      := False;
                            FieldByName('ALTERAR').AsBoolean   := False;
                            FieldByName('EXCLUIR').AsBoolean   := False;
                            Post;
                       End;
                       //
                       cdsAcessos.Next;
                  End;
                  //
                  aCds.First;
            End;
      End;
      //
     End;
     // Tipo dois
     If (aTipo = 2) Then
     begin
          With dmdados.cdsPermissoes do
             begin
                 Active := False;
                 CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO)';
                 Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                 Active := True;
                 //
                 If not (IsEmpty) Then
                  begin
                   First;
                   //
                   While not (dmdados.cdsPermissoes.Eof) do
                   begin
                       With aCds do
                       begin
                            append;
                            FieldByName('CODIGO').AsInteger    := dmdados.cdsPermissoes.FieldByName('MEN_CODIGO').AsInteger;
                            FieldByName('MENU_NOME').AsString  := GetNomeMenu(dmdados.cdsPermissoes.FieldByName('MEN_CODIGO').AsInteger);
                            If Verificar_Menu_Pai(dmdados.cdsPermissoes.FieldByName('MEN_CODIGO').AsInteger) Then
                                FieldByName('MENU_PAI').AsInteger  := 1;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PU_CONSULTAR').AsString = 'S') Then
                                FieldByName('PERMISSAO').AsBoolean := True
                            Else
                                FieldByName('PERMISSAO').AsBoolean := False;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PG_NOVO').AsString = 'S') Then
                                FieldByName('NOVO').AsBoolean      := True
                            Else
                                FieldByName('NOVO').AsBoolean      := False;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PU_ALTERAR').AsString = 'S') Then
                                FieldByName('ALTERAR').AsBoolean   := True
                            Else
                                FieldByName('ALTERAR').AsBoolean   := False;
                            //
                            If (dmdados.cdsPermissoes.FieldByName('PU_APAGAR').AsString = 'S') Then
                                FieldByName('EXCLUIR').AsBoolean   := True
                            Else
                                FieldByName('EXCLUIR').AsBoolean   := False;
                            //
                            Post;
                       End;
                       //
                       dmdados.cdsPermissoes.Next;
                     End;  // fim-enquanto
                  //
                  aCds.First;
                  End;
             End;
     End;
end;

function TdmDados.GetNomeMenu(aCodMenu: Integer): String;
begin
     with cdsGetNomeMenu do
      begin
           Active := False;
           CommandText := 'Select MEN_NOME from MENUS Where (MEN_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := aCodMenu;
           Active := True;
           //
            if not (IsEmpty) Then
              Result := FieldByName('MEN_NOME').AsString
            Else
              Result := 'MENU NÃO ENCONTRADO';
           //
           Active := False;
      End;
end;

function TdmDados.Verificar_Menu_Pai(aCodigo: Integer): Boolean;
begin
     result := False;
     //
     With cdsConsulta2 do
      begin
           Active := False;
           CommandText := 'Select MEN_CODIGO, MEN_CODIGOPAI from MENUS ';
           CommandText := CommandText + 'Where (MEN_CODIGO = :pCODIGO)';
           Params.ParamByName('pCODIGO').AsInteger := aCodigo;
           Active := True;
           //
           If not (IsEmpty) Then
              If (fieldByName('MEN_CODIGOPAI').IsNull) Then
                 Result := True;
           //
           Active := False;
      End;
end;


procedure TdmDados.Incluir_Acesso_Usuario(aCodUsu, aCodMenu: Integer;
  aNome_Acesso, aConsulta, aNovo, aAlterar, aExcluir: String);
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConexao;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
      Params.ParamByName('pMENU').AsInteger   := aCodMenu;
      open;
      //
           If (IsEmpty) Then   // incluir registro
           begin
                With dmdados.cdsPermissoes do
                  begin
                       Active := False;
                       CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
                       Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                       Params.ParamByName('pMENU').AsInteger   := aCodMenu;
                       Active := True;
                       //
                       Append;
                       FieldByName('USU_CODIGO').AsInteger := aCodUsu;
                       FieldByName('MEN_CODIGO').AsInteger := aCodMenu;
                       ApplyUpdates(0);
                  End;
           End      // altera registro
           Else
           begin
                With dmdados.cdsPermissoes do
                  begin
                       Active := False;
                       CommandText := 'Select * from PERMISSOES_USUARIOS Where (USU_CODIGO = :pCODIGO) and (MEN_CODIGO = :pMENU)';
                       Params.ParamByName('pCODIGO').AsInteger := aCodUsu;
                       Params.ParamByName('pMENU').AsInteger   := aCodMenu;
                       Active := True;
                       //
                       edit;
                       FieldByName('PG_NOVO').AsString      := aNovo;
                       FieldByName('PU_ALTERAR').AsString   := aAlterar;
                       FieldByName('PU_APAGAR').asString    := aExcluir;
                       FieldByName('PU_CONSULTAR').AsString := aConsulta;
                       //
                       ApplyUpdates(0);
                  End;
           End;

      //
    finally
      free;
    end;
end;

function TdmDados.GetNomeFornecedor(aNome: String): Integer;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'Select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES Where (FOR_FANTASIA = :pNOME) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pNOME').AsString := aNome;
         Open;
         //
         If not (IsEmpty) then
            Result := FieldByName('FOR_CODIGO').AsInteger;
    Finally
         Free;
    End;
end;

function TdmDados.GetCodigoNatureza(aNomeNatureza: String): Integer;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'Select NAT_CODIGO, NAT_NOME from NATUREZA Where (NAT_NOME = :pNOME) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pNOME').AsString := aNomeNatureza;
         Open;
         //
         If not (IsEmpty) then
            Result := FieldByName('NAT_CODIGO').AsInteger;
    Finally
         Free;
    End;
end;

function TdmDados.GetNomeForn(iCodigo: Integer): String;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'Select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES Where (FOR_CODIGO = :pCODIGO) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pCODIGO').AsInteger := iCodigo;
         Open;
         //
         If not (IsEmpty) then
            Result := FieldByName('FOR_FANTASIA').AsString;
    Finally
         Free;
    End;
end;

function TdmDados.GetNomeNatureza(iCodigo: Integer): String;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'Select NAT_CODIGO, NAT_NOME from NATUREZA Where (NAT_CODIGO = :pCODIGO) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pCODIGO').AsInteger := iCodigo;
         Open;
         //
         If not (IsEmpty) then
            Result := FieldByName('NAT_NOME').AsString;
    Finally
         Free;
    End;
end;

procedure TdmDados.Verificar_Direito_Acesso(aUsuario, aCodMenu: Integer);
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'SELECT PG_NOVO, PU_ALTERAR, PU_APAGAR, PU_CONSULTAR FROM PERMISSOES_USUARIOS ';
   aTexto := aTexto + ' WHERE (USU_CODIGO = :CODUSUARIO) AND (MEN_CODIGO = :CODMENU) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('CODUSUARIO').AsInteger := aUsuario;
         Params.ParamByName('CODMENU').AsInteger    := aCodMenu;
         Open;
         //
         If not (IsEmpty) Then
          begin
                 uFrmMain.aNovo    := FieldByName('PG_NOVO').AsString;
                 uFrmMain.aAlterar := FieldByName('PU_ALTERAR').AsString;
                 uFrmMain.aApagar  := FieldByName('PU_APAGAR').AsString;
          End;
    Finally
         Free;
    End;
end;

function TdmDados.GetCodMenu(aNomeMenu: String): Integer;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'Select MEN_CODIGO from MENUS Where (MEN_NOME = :pNOME) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         SQLConnection := sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pNOME').AsString := aNomeMenu;
         Open;
         //
         if not (IsEmpty) Then
            Result := FieldByName('MEN_CODIGO').AsInteger;
    Finally
         Free;
    End;
end;

function TdmDados.AddHistoricoProduto2(iLOJA, iNRITEM, iDOCUMENTO,
  iUSUARIO, iMOTIVO: Integer; aPRODUTO, aUNIDADE, aHORA, aTIPO: String;
  aDATA: TDateTime; fANTERIOR, fMOVIMENTO, fATUAL, fVLCOMPRA,
  fVLVENDA: Double): Boolean;
Var
   iSeq : Integer;
begin
     Result := False;
     //
     dmDados.AbrirTabelaConfig();
     //
     try
         //
         dmDados.cdsConfig.Edit;
         dmDados.cdsConfigCFG_SEQUENCIA.AsInteger :=
             dmDados.cdsConfigCFG_SEQUENCIA.AsInteger + 1;
         dmDados.cdsConfig.ApplyUpdates(0);
         //
         iSeq := dmDados.cdsConfigCFG_SEQUENCIA.AsInteger;
         //
         With cdsHistorico do
         begin
              Close;
              Params.ParamByName('pSEQ').AsInteger    := iSeq;
              Params.ParamByName('pLOJA').AsInteger   := iLoja;
              Params.ParamByName('pPRODUTO').AsString := aPRODUTO;
              Params.ParamByName('pNRITEM').AsInteger := iNRITEM;
              Open;
              //
              Append;
              FieldByName('HIS_SEQUENCIA').AsInteger := iSeq;
              FieldByName('HIS_LOJA').AsInteger      := iLOJA;
              FieldByName('HIS_PRODUTO').AsString    := aPRODUTO;
              FieldByName('HIS_NRITEM').AsInteger    := iNRITEM;
              FieldByName('HIS_UNIDADE').AsString    := aUNIDADE;
              FieldByName('HIS_DATA').AsDateTime     := aDATA;
              FieldByName('HIS_HORA').AsString       := aHORA;
              FieldByName('HIS_TIPO').AsString       := aTIPO;
              If (iDOCUMENTO > 0) Then
                 FieldByName('HIS_DOCUMENTO').AsInteger := iDOCUMENTO;
              FieldByName('HIS_ANTERIOR').AsFloat    := fANTERIOR;
              FieldByName('HIS_MOVIMENTO').AsFloat   := fMOVIMENTO;
              FieldByName('HIS_ATUAL').AsFloat       := fATUAL;
              If (iMOTIVO > 0) Then
                FieldByName('HIS_MOTIVO').AsInteger  := iMOTIVO;
              FieldByName('HIS_VLCOMPRA').AsFloat    := fVLCOMPRA;
              FieldByName('HIS_VLVENDA').AsFloat     := fVLVENDA;
              FieldByName('HIS_CODIGOBAIXA').AsString := aPRODUTO;
              FieldByName('HIS_USUARIO').AsInteger   := iUSUARIO;
              //
              ApplyUpdates(0);
          End;
          //
          Result := True;
     Except

     End;
end;

function TdmDados.GravaVenda(iLoja, iCliente, iVendedor: Integer;
  fValorVenda, fValorEntrada, fVlAcrecimo, fVlDesconto, fVlTroco: Double;
  aCDSItens: TClientDataSet): Boolean;
Var
   M_FLGRAV : Boolean;
   M_NRVEND, M_NRSEQU : Integer;
   M_DTMOVI : TDatetime;
   M_HOMOVI, aProduto, aUnidade, M_NMMODA : String;
   M_NRITEM, M_CDMODA : Integer;
   M_VLCOMP, M_VLCUST, M_QTANTE, M_QTMOVI, M_QTATUA : Double;
   M_VLVEND, M_VLMODA, M_VLTROCO : Double;
   M_NRCRED, M_QTPARC, M_SEQREC, M_TOPARC : Integer;
begin
     Result := False;
     //
     M_FLGRAV := False;
     AbrirTabelaConfig;
     //
     M_DTMOVI := Date();
     M_HOMOVI := Copy(TimetoStr(time),1,5);
     //
     Start;
     Try
         dmDados.cdsConfig.Edit;
         dmDados.cdsConfigCFG_VENDA.AsInteger :=
            dmDados.cdsConfigCFG_VENDA.AsInteger + 1;
         dmDados.cdsConfigCFG_SEQUENCIA.AsInteger :=
            dmDados.cdsConfigCFG_SEQUENCIA.AsInteger + 1;
         dmDados.cdsConfig.ApplyUpdates(0);
         //
         Comit(Transc);
         //
         M_FLGRAV := true;
         M_NRVEND := dmDados.cdsConfigCFG_VENDA.AsInteger;
         M_NRSEQU := dmDados.cdsConfigCFG_SEQUENCIA.AsInteger;
     Except
         Rollback;
     End;
     //
     If (M_FLGRAV) Then
     begin
       uFuncoes.FilterCDS(cdsVenda, fsInteger, InttoStr(M_NRVEND));
       If (cdsVenda.IsEmpty) Then
       begin
           With cdsVenda do
            begin
               Start;
               try
                   Append;
                   FieldByName('MOV_PEDIDO').AsInteger := M_NRVEND;
                   FieldByName('MOV_LOJA').AsInteger   := iLoja;
                   FieldByName('MOV_SEQUENCIA').AsInteger := M_NRSEQU;
                   FieldByName('MOV_CLIENTE').AsInteger := iCliente;
                   FieldByName('MOV_DATAVENDA').AsDateTime := M_DTMOVI;
                   FieldByName('MOV_HORAVENDA').AsString := M_HOMOVI;
                   FieldByName('MOV_VENDEDOR').AsInteger := iVendedor;
                   FieldByName('MOV_VALOR').AsFloat     := fValorVenda;
                   FieldByName('MOV_ENTRADA').AsFloat   := fValorEntrada;
                   FieldByName('MOV_DESCONTO').AsFloat  := fVlDesconto;
                   FieldByName('MOV_ACRESCIMO').AsFloat := fVlAcrecimo;
                   FieldByName('MOV_TROCO').AsFloat     := fVlTroco;
                   FieldByName('MOV_SITUACAO').AsString := 'F';
                   FieldByName('MOV_NOMECLIENTE').AsString := GetNomeCliente(iCliente);
                   //
                   ApplyUpdates(0);
                   //
                   Comit(Transc);
               Except
                   M_FLGRAV := false;
                   ExcluirVenda(M_NRVEND);
                   Rollback;
               End;
            End;   // with cdsVenda
            //
            If (M_FLGRAV) Then
              begin
                   With aCDSItens do
                    begin
                         DisableControls;
                         First;
                         //
                         M_NRITEM := 1;
                         While not (Eof) do
                          begin
                               aProduto := FieldByName('CDS_CDPROD').AsString;
                               aUnidade := FieldByName('CDS_UNIDADE').AsString;
                               //
                               uFuncoes.FilterCDS(cdsProduto, fsString, FieldByName('CDS_CDPROD').AsString);
                               if not (cdsProduto.IsEmpty) Then
                               begin
                                   M_VLCOMP := cdsProdutoPRO_VLCOMPRA.AsFloat;
                                   M_VLCUST := cdsProdutoPRO_VLCUSTO.AsFloat;
                               End;
                               // Incluir_Iten_Venda(iPedido, iItem, iVendedor: Integer;
                               // aProduto, aUnidade: String; fValorUnitario, fQuant, fValrCusto,
                               //  fValorCompra: Double
                               //
                               If (Incluir_Iten_Venda(M_NRVEND, M_NRITEM, iVendedor,
                                  FieldByName('CDS_CDPROD').AsString, FieldByName('CDS_UNIDADE').AsString,
                                  FieldByName('CDS_VLUNIT').AsFloat, FieldByName('CDS_QTPROD').AsFloat, M_VLCUST, M_VLCOMP))Then
                                 begin
                                   If (DMDados.cdsProdutoPRO_FLPROD.AsString = 'P') Then
                                   Begin
                                      With cdsEstoque do
                                        begin
                                             Close;
                                             Params.ParamByName('pCDLOJA').AsInteger := iLoja;
                                             Params.ParamByName('pCDPROD').AsString  := aCDSItens.FieldByName('CDS_CDPROD').AsString;
                                             open;
                                             //
                                             If not (IsEmpty) Then
                                              begin
                                                   //
                                                   Start;
                                                   try
                                                       Edit;
                                                       //
                                                       M_QTANTE := FieldByName('EST_QUANTIDADE').AsFloat;
                                                       M_QTMOVI := aCDSItens.FieldByName('CDS_QTPROD').AsFloat;
                                                       M_QTATUA := FieldByName('EST_QUANTIDADE').AsFloat - M_QTMOVI;
                                                       //
                                                       FieldByName('EST_QUANTSAIDA').AsFloat := M_QTMOVI;
                                                       FieldByName('EST_QUANTIDADE').AsFloat := M_QTATUA;
                                                       FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                                                       //
                                                       ApplyUpdates(0);
                                                       //
                                                       Comit(Transc);
                                                       //
                                                       M_FLGRAV := true;
                                                   Except
                                                       ExcluirVenda(M_NRVEND);
                                                       ExcluirVendaItens(M_NRVEND);
                                                       M_FLGRAV := False;
                                                       Rollback;
                                                   End;
                                                   //
                                                   If (M_FLGRAV) Then
                                                   begin
                                                       //M_NRITEM := 1;
                                                       uFuncoes.FilterCDS(dmDados.cdsProduto, fsString, aProduto);
                                                       M_VLVEND := aCDSItens.FieldByName('CDS_VLUNIT').AsFloat;
                                                       //  iLOJA, iNRITEM,
                                                       //  iDOCUMENTO, iUSUARIO, iMOTIVO: Integer; aPRODUTO, aUNIDADE, aHORA,
                                                       //  aTIPO: String; aDATA: TDateTime; fANTERIOR, fMOVIMENTO, fATUAL,
                                                       //  fVLCOMPRA, fVLVENDA: Double
                                                       dmDados.AddHistoricoProduto(1, M_NRITEM, M_NRVEND, iVendedor, 0, aProduto, aUnidade,
                                                          M_HOMOVI, 'V', M_DTMOVI, M_QTANTE, M_QTMOVI, M_QTATUA, M_VLCOMP, M_VLVEND);
                                                       //
                                                       If not (dmDados.IncluirTarefaUsuario( iVendedor,
                                                           'Vendeu produto : '+aProduto+' *F*')) Then
                                                           ShowMessage('Erro ao adicionar tarefa do usuário.');
                                                   End;
                                              End;
                                        End;
                                   End;   // fim-se tipo de Produto - Produto
                                 End;  // fim-se inclui item
                               //
                               M_NRITEM := M_NRITEM + 1;
                               Next;
                          End;
                         EnableControls;
                    End;
              End;   // itens
              //
              If (M_FLGRAV) Then
                begin
                     frmFormaPagamento.cdsModalidade.DisableControls;
                     frmFormaPagamento.cdsModalidade.First;
                     While not (frmFormaPagamento.cdsModalidade.Eof) do
                     begin
                       If (frmFormaPagamento.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                       begin
                           M_CDMODA := frmFormaPagamento.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                           M_NMMODA := frmFormaPagamento.cdsModalidade.FieldByName('MOD_NOME').AsString;
                           M_VLMODA := frmFormaPagamento.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                           // Grava dados no BD.
                           If (M_VLMODA > 0.0) Then
                           begin
                                If (frmFormaPagamento.cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
                                    M_VLTROCO := fVlTroco
                                Else
                                    M_VLTROCO := 0;
                                //  IncluirRegitroMovCaixa(iSEQUENCIA, iLOJA, iVENDA,
                                //  iMODALIDADE, iCAIXA, iNATUREZA, iFUNCIONARIO: Integer; aTIPOMOV,
                                //  aHRMOVIMENTO, aOBSEVACAO, aSITUACAO: String; aDTMOVIMENTO: TDatetime;
                                //  fVLMODALIDADE, fTOVENDA, fVLTROCO: double): boolean;
                                If (dmFinanceiro.IncluirRegitroMovCaixa(M_NRSEQU, iLoja, M_NRVEND, M_CDMODA, iVendedor, 1, iVendedor,
                                     'V', M_HOMOVI, M_NMMODA, 'N', M_DTMOVI, M_VLMODA,  fValorVenda, M_VLTROCO)) Then
                                begin
                                    If (frmFormaPagamento.cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
                                        and (frmFormaPagamento.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
                                    begin
                                         AbrirTabelaConfig;
                                         CdsConfig.Edit;
                                         cdsConfigCFG_NRCREDITO.AsInteger := CdsConfigCFG_NRCREDITO.AsInteger + 1;
                                         CdsConfig.Post;
                                         CdsConfig.ApplyUpdates(0);
                                         M_NRCRED := CdsConfigCFG_NRCREDITO.AsInteger;
                                         M_TOPARC := frmFormaPagamento.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                                         //
                                         With dmFinanceiro.cdsAddCReceber do
                                          Begin
                                               Active := False;
                                               Params.ParamByName('pLOJA').AsInteger    := iLoja;
                                               Params.ParamByName('pCREDITO').AsInteger := M_NRCRED;
                                               Active := True;
                                          End;
                                          //
                                         {If (dmFinanceiro.cdsAddCReceber.IsEmpty) then
                                           Begin}
                                               M_QTPARC := 1;
                                               //dmFinanceiro.cdsAddCReceber.First;
                                               cdsParcelasVenda.First;
                                               //
                                               //While not (M_QTPARC <= M_TOPARC) do
                                               While not (cdsParcelasVenda.Eof) do
                                                Begin
                                                     //
                                                     If (cdsParcelasVenda.FieldByName('PAR_MODALIDADE').AsInteger =
                                                         frmFormaPagamento.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger) Then
                                                     begin
                                                          //
                                                          AbrirTabelaConfig;
                                                          CdsConfig.Edit;
                                                          cdsConfigCFG_SEQCRECEBER.AsInteger := cdsConfigCFG_SEQCRECEBER.AsInteger + 1;
                                                          M_SEQREC := cdsConfigCFG_SEQCRECEBER.AsInteger;
                                                          CdsConfig.ApplyUpdates(0);
                                                          //
                                                          dmFinanceiro.cdsAddCReceber.Append;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_SEQUENCIA').AsInteger  := M_SEQREC;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_CDLOJA').AsInteger       := iLoja;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_IDCONTASRECEBER').AsInteger := M_NRCRED;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_NRPARCELA').AsInteger    := cdsParcelasVenda.FieldByName('PAR_NRPARCELA').AsInteger;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_QTPARCELAS').AsInteger := frmFormaPagamento.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_CLIENTE').AsInteger    := iCliente;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_NRVENDA').AsInteger    := M_NRVEND;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_OBSERVACAO').AsString   := 'VENDA A PRESTAÇÃO';
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_VALOR').AsCurrency := cdsParcelasVenda.FieldByName('PAR_VALOR').AsCurrency;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_VALORACRESIMO').AsFloat   := 0;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_VALORJUROS').AsFloat      := 0;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_VALORDESCONTO').AsFloat   := 0;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_DTMOVI').AsDateTime  := Date();
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_DTVENCIMENTO').AsDateTime := cdsParcelasVenda.FieldByName('PAR_VENCIMENTO').AsDateTime;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_BANCO').AsString          := cdsParcelasVenda.FieldByName('PAR_BANCO').AsString;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_AGENCIA').AsString        := cdsParcelasVenda.FieldByName('PAR_AGENCIA').AsString;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_NRCONTA').AsString        := cdsParcelasVenda.FieldByName('PAR_CONTA').AsString;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_NRCHEQUE').AsString       := cdsParcelasVenda.FieldByName('PAR_CHEQUE').AsString;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_SITUACAO').AsString       := 'A';
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_NATUREZA').AsInteger      := 4;
                                                          dmFinanceiro.cdsAddCReceber.FieldByName('REC_USCADA').AsInteger        := iVendedor;
                                                          //
                                                          dmFinanceiro.cdsAddCReceber.Post;
                                                          M_QTPARC := M_QTPARC + 1;
                                                    End;   //FIM-SE
                                                    //Proximo
                                                    cdsParcelasVenda.Next;
                                                End; // Fim-enquanto - dmFinanceiro.cdsAddCReceber
                                               //
                                               dmFinanceiro.cdsAddCReceber.ApplyUpdates(0);
                                               //
                                           //End;  // se-em-branco  dmFinanceiro.cdsAddCReceber.IsEmpty
                                    End;  // Se-Fim M_FLFIXA
                                End;    // Fim-se IncluirRegitroMovCaixa
                                //
                           End;  // Se modalidade maior que Zero
                          // Fim-do-retorno efetua Pagamento
                       End;  // fim-se frmFormaPagamento.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0
                       // Próximo registro
                       frmFormaPagamento.cdsModalidade.Next;
                     End;  // fim-do-enquanto frmFormaPagamento.cdsModalidade.eof
                  //
                  frmFormaPagamento.cdsModalidade.EnableControls;
                End;   // fim-se M_FLGRAV
           End;       // fim-se M_FLGRAV
       //
       W_NRVEND := M_NRVEND;
       Result := True;
     End;
end;

procedure TdmDados.dspVendaGetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
     TableName := 'VENDAS';
end;

function TdmDados.Incluir_Iten_Venda(iPedido, iItem, iVendedor: Integer;
  aProduto, aUnidade: String; fValorUnitario, fQuant, fValrCusto,
  fValorCompra: Double): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   Result := False;
   aTexto := 'Insert into VENDAS_ITENS(MOP_PEDIDO, MOP_NRITEM, MOP_PRODUTO, MOP_QUANTIDADE, MOP_UNIDADE, MOP_VALOR, ';
   aTexto := aTexto +' MOP_CUSTO, MOP_COMPRA, MOP_CDVENDEDOR)';
   aTexto := aTexto +'Values (:pPEDIDO, :pNRITEM, :pPRODUTO, :pQUANTIDADE, :pUNIDADE, :pVALOR, ';
   aTexto := aTexto +' :pCUSTO, :pCOMPRA, :pCDVENDEDOR)';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         Start;
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pPEDIDO').AsInteger := iPedido;
             Params.ParamByName('pNRITEM').AsInteger := iItem;
             Params.ParamByName('pPRODUTO').AsString := aProduto;
             Params.ParamByName('pQUANTIDADE').AsFloat := fQuant;
             Params.ParamByName('pUNIDADE').AsString := aUnidade;
             Params.ParamByName('pVALOR').AsFloat    := fValorUnitario;
             Params.ParamByName('pCUSTO').AsFloat    := fValrCusto;
             Params.ParamByName('pCOMPRA').AsFloat   := fValorCompra;
             Params.ParamByName('pCDVENDEDOR').AsInteger := iVendedor;
             ExecSQL();
             //
             Comit(Transc);
             Result := True;
          Except
             Rollback;
          End;
    Finally
         Free;
    End;
end;

function TdmDados.ExcluirVenda(iVenda: Integer): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   Result := False;
   aTexto := 'Delete from VENDAS from Where (MOV_PEDIDO = :pPEDIDO) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pPEDIDO').AsInteger := iVenda;
             ExecSQL();
             //
             Result := True;
          Except

          End;
    Finally
         Free;
    End;
end;

function TdmDados.ExcluirVendaItens(iVenda: Integer): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   Result := False;
   aTexto := 'Delete from VENDAS_ITENS from Where (MOP_PEDIDO = :pPEDIDO) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pPEDIDO').AsInteger := iVenda;
             ExecSQL();
             //
             Result := True;
          Except

          End;
    Finally
         Free;
    End;
end;

function TdmDados.GetCodSituacao(aDescricao: String): Integer;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   aTexto := 'Select * from SITUACAO_CLIENTE Where (STC_DESCRICAO = :pNOME) ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pNOME').AsString := aDescricao;
             Open;
             //
             If not (IsEmpty) Then
                Result := FieldByName('STC_CODIGO').AsInteger;
          Except

          End;
    Finally
         Free;
    End;
end;

function TdmDados.VerificarHoraAgenda(iFuncionario: Integer;
  aData: TDatetime; aHora: String): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   Result := False;
   aTexto := 'Select AGE_ID, AGE_CDLOJA, AGE_CLIENTE, AGE_DTATENDIMENTO, AGE_HOATENDIMENTO, AGE_SITUACAO, ';
   aTexto := aTexto + ' AGE_FUNCIONARIO from AGENDA Where (AGE_DTATENDIMENTO = :pDATA) and (AGE_HOATENDIMENTO = :pHORA) ';
   aTexto := aTexto + ' and (AGE_FUNCIONARIO = :pFUNC) and (AGE_SITUACAO = '+QuotedStr('A')+') ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pFUNC').AsInteger := iFuncionario;
             Params.ParamByName('pDATA').AsDate    := aData;
             Params.ParamByName('pHORA').AsString  := aHora;
             Open;
             //
             If not (IsEmpty) Then
                Result :=  true;
          Except

          End;
    Finally
         Free;
    End;
end;

function TdmDados.VerificarHoraAgendaFuncionario(iFuncionario: Integer;
  aData: TDatetime; aHora: String): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
   fIni, fFim : TDateTime;
begin
   uFuncoes.RefreshCDS(cdsConfig);
   Result := False;
   aTexto := 'Select AGE_ID, AGE_CDLOJA, AGE_CLIENTE, AGE_DTATENDIMENTO, AGE_HOATENDIMENTO, AGE_SITUACAO, ';
   aTexto := aTexto + ' AGE_FUNCIONARIO from AGENDA Where (AGE_DTATENDIMENTO = :pDATA) ';
   aTexto := aTexto + ' and (AGE_FUNCIONARIO = :pFUNC) and (AGE_SITUACAO = '+QuotedStr('A')+') ';
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pFUNC').AsInteger := iFuncionario;
             Params.ParamByName('pDATA').AsDate    := aData;
             Open;
             //
             If not (IsEmpty) Then
              begin
                  fIni := StrtoTime(FieldByName('AGE_HOATENDIMENTO').AsString);
                  fFim := StrtoTime(FieldByName('AGE_HOATENDIMENTO').AsString) + dmDados.cdsConfigCFG_HORA.AsDateTime ;
                  //
                  If (uFuncoes.DifHora(timetostr(Fini), timetostr(ffim)) < dmDados.cdsConfigCFG_HORA.AsString) Then
                         Result :=  true;
              End;
          Except

          End;
    Finally
         Free;
    End;
end;

function TdmDados.VerificarEstoqueProduto(aProduto: String;
  iLoja: Integer): Boolean;
Var
   aTexto : String;
   qryAux : TSQLQuery;
begin
   Result := False;
   aTexto := 'Select EST_CDLOJA, EST_CDPROD, EST_QUANTIDADE from ESTOQUE Where (EST_CDPROD = :pCDPROD) and (EST_CDLOJA = :pCDLOJA)';
   //
   qryAux := TSQLQuery.Create(nil);
   with qryAux do
    try
         try
             SQLConnection := sqlConexao;
             Close;
             SQL.Add(aTexto);
             Params.ParamByName('pCDPROD').AsString  := aProduto;
             Params.ParamByName('pCDLOJA').AsInteger := iLoja;
             Open;
             //
             If not (IsEmpty) Then
                Result :=  true;
          Except

          End;
    Finally
         Free;
    End;
end;

end.
