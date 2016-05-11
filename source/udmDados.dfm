object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 217
  Top = 133
  Height = 602
  Width = 764
  object sqlConexao: TSQLConnection
    ConnectionName = 'InfoAten'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=D:\Sistemas\InfoAtendimento\Atendimento\Dados\INFOATEN.' +
        'FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=win1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'c:\infog2\fbclient.dll'
    BeforeConnect = sqlConexaoBeforeConnect
    Left = 40
    Top = 16
  end
  object dstConfig: TSQLDataSet
    CommandText = 'select * from CONFIG Where (CFG_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 120
    Top = 16
    object dstConfigCFG_CODIGO: TIntegerField
      FieldName = 'CFG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstConfigCFG_RAZAO_EMPRESA: TStringField
      FieldName = 'CFG_RAZAO_EMPRESA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConfigCFG_FANTASIA: TStringField
      FieldName = 'CFG_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstConfigCFG_ENDERECO: TStringField
      FieldName = 'CFG_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConfigCFG_NUMERO: TIntegerField
      FieldName = 'CFG_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_BAIRRO: TStringField
      FieldName = 'CFG_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_CIDADE: TStringField
      FieldName = 'CFG_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_UF: TStringField
      FieldName = 'CFG_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstConfigCFG_CEP: TStringField
      FieldName = 'CFG_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstConfigCFG_CNPJ: TStringField
      FieldName = 'CFG_CNPJ'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
    object dstConfigCFG_INSEST: TStringField
      FieldName = 'CFG_INSEST'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstConfigCFG_NRFONE: TStringField
      FieldName = 'CFG_NRFONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstConfigCFG_NUMFAX: TStringField
      FieldName = 'CFG_NUMFAX'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstConfigCFG_CELULAR: TStringField
      FieldName = 'CFG_CELULAR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstConfigCFG_EMAIL: TStringField
      FieldName = 'CFG_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstConfigCFG_SITE: TStringField
      FieldName = 'CFG_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstConfigCFG_CLIENTE: TIntegerField
      FieldName = 'CFG_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_FORNECEDOR: TIntegerField
      FieldName = 'CFG_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_FUNCIONARIO: TIntegerField
      FieldName = 'CFG_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_PRODUTO: TIntegerField
      FieldName = 'CFG_PRODUTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_ATENDIMENTOS: TIntegerField
      FieldName = 'CFG_ATENDIMENTOS'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_USUARIOS: TIntegerField
      FieldName = 'CFG_USUARIOS'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_CDCIDADE: TIntegerField
      FieldName = 'CFG_CDCIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_CDBAIRRO: TIntegerField
      FieldName = 'CFG_CDBAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQCPAGAR: TIntegerField
      FieldName = 'CFG_SEQCPAGAR'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_NRCOMPRA: TIntegerField
      FieldName = 'CFG_NRCOMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQCRECEBER: TIntegerField
      FieldName = 'CFG_SEQCRECEBER'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_NRCREDITO: TIntegerField
      FieldName = 'CFG_NRCREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQUENCIA: TIntegerField
      FieldName = 'CFG_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_NATUREZA: TIntegerField
      FieldName = 'CFG_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_CARTA: TIntegerField
      FieldName = 'CFG_CARTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_CARGO: TIntegerField
      FieldName = 'CFG_CARGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_MODALIDADE: TIntegerField
      FieldName = 'CFG_MODALIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQTAREFAUSUARIOS: TIntegerField
      FieldName = 'CFG_SEQTAREFAUSUARIOS'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQENTRADA: TIntegerField
      FieldName = 'CFG_SEQENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQVENDA: TIntegerField
      FieldName = 'CFG_SEQVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SCREENWIDTH: TIntegerField
      FieldName = 'CFG_SCREENWIDTH'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SCREENHEIGHT: TIntegerField
      FieldName = 'CFG_SCREENHEIGHT'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_VENDA: TIntegerField
      FieldName = 'CFG_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_SEQMOVCAIXA: TIntegerField
      FieldName = 'CFG_SEQMOVCAIXA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_LOGO: TGraphicField
      FieldName = 'CFG_LOGO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstConfigCFG_HORA: TTimeField
      FieldName = 'CFG_HORA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstUsuario: TSQLDataSet
    CommandText = 'select * from USUARIOS Where (SEN_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 352
    Top = 16
    object dstUsuarioSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstUsuarioSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object dstUsuarioSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstUsuarioSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstUsuarioSEN_TERMINAL: TStringField
      FieldName = 'SEN_TERMINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuarioSEN_GRUPO: TIntegerField
      FieldName = 'SEN_GRUPO'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuarioSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuarioSEN_FLEXCLUSAO: TStringField
      FieldName = 'SEN_FLEXCLUSAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstUsuarioSEN_ADMIN: TStringField
      FieldName = 'SEN_ADMIN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dstCliente: TSQLDataSet
    CommandText = 'select * from CLIENTES Where (CLI_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 24
    Top = 80
    object dstClienteCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstClienteCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dstClienteCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstClienteCLI_LOGRADOURO: TStringField
      FieldName = 'CLI_LOGRADOURO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClienteCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstClienteCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstClienteCLI_CDBAIRRO: TIntegerField
      FieldName = 'CLI_CDBAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_CDCIDADE: TIntegerField
      FieldName = 'CLI_CDCIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstClienteCLI_FONE1: TStringField
      FieldName = 'CLI_FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClienteCLI_FONE2: TStringField
      FieldName = 'CLI_FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClienteCLI_CELULAR: TStringField
      FieldName = 'CLI_CELULAR'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstClienteCLI_IDENTIDADE: TStringField
      FieldName = 'CLI_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstClienteCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstClienteCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstClienteCLI_ESTADO_CIVIL: TIntegerField
      FieldName = 'CLI_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_SEXO: TStringField
      FieldName = 'CLI_SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstClienteCLI_SITUACAO: TIntegerField
      FieldName = 'CLI_SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstClienteCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_NOME_PAI: TStringField
      FieldName = 'CLI_NOME_PAI'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClienteCLI_NOME_MAE: TStringField
      FieldName = 'CLI_NOME_MAE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClienteCLI_DTCADASTRO: TDateField
      FieldName = 'CLI_DTCADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_USUARIO_INC: TIntegerField
      FieldName = 'CLI_USUARIO_INC'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_HORA_INC: TStringField
      FieldName = 'CLI_HORA_INC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstClienteCLI_USUARIO_ALT: TIntegerField
      FieldName = 'CLI_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_DATA_ALT: TDateField
      FieldName = 'CLI_DATA_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstClienteCLI_HORA_ALT: TStringField
      FieldName = 'CLI_HORA_ALT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstClienteCLI_FOTOCLIENTE: TGraphicField
      FieldName = 'CLI_FOTOCLIENTE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstClienteCLI_OBSERVACAO: TMemoField
      FieldName = 'CLI_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
  end
  object dstFuncionario: TSQLDataSet
    CommandText = 'select * from FUNCIONARIOS Where (FUN_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 24
    Top = 136
    object dstFuncionarioFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstFuncionarioFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarioFUN_ENDERECO: TStringField
      FieldName = 'FUN_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarioFUN_BAIRRO: TStringField
      FieldName = 'FUN_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_CIDADE: TStringField
      FieldName = 'FUN_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_UFFUNC: TStringField
      FieldName = 'FUN_UFFUNC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionarioFUN_NATUREZA: TStringField
      FieldName = 'FUN_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_CEP: TStringField
      FieldName = 'FUN_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstFuncionarioFUN_FONE: TStringField
      FieldName = 'FUN_FONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object dstFuncionarioFUN_TPFUNC: TIntegerField
      FieldName = 'FUN_TPFUNC'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_PECOMI: TBCDField
      FieldName = 'FUN_PECOMI'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dstFuncionarioFUN_DTNASCIMENTO: TDateField
      FieldName = 'FUN_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_DTADMICAO: TDateField
      FieldName = 'FUN_DTADMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_DTDEMICAO: TDateField
      FieldName = 'FUN_DTDEMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_VLDEBITO: TFMTBCDField
      FieldName = 'FUN_VLDEBITO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstFuncionarioFUN_CPF: TStringField
      FieldName = 'FUN_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstFuncionarioFUN_IDENTIDADE: TStringField
      FieldName = 'FUN_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstFuncionarioFUN_ORIDEN: TStringField
      FieldName = 'FUN_ORIDEN'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dstFuncionarioFUN_UFIDEN: TStringField
      FieldName = 'FUN_UFIDEN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionarioFUN_NRCART: TStringField
      FieldName = 'FUN_NRCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstFuncionarioFUN_SECART: TStringField
      FieldName = 'FUN_SECART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstFuncionarioFUN_UFCART: TStringField
      FieldName = 'FUN_UFCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFuncionarioFUN_CAREMI: TStringField
      FieldName = 'FUN_CAREMI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstFuncionarioFUN_TITULO: TStringField
      FieldName = 'FUN_TITULO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object dstFuncionarioFUN_CDSECA: TStringField
      FieldName = 'FUN_CDSECA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarioFUN_CDZONA: TStringField
      FieldName = 'FUN_CDZONA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstFuncionarioFUN_ESTCIVIL: TStringField
      FieldName = 'FUN_ESTCIVIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstFuncionarioFUN_VLSALA: TFMTBCDField
      FieldName = 'FUN_VLSALA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstFuncionarioFUN_LIONIB: TStringField
      FieldName = 'FUN_LIONIB'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_HOENT1: TStringField
      FieldName = 'FUN_HOENT1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarioFUN_HOSAI1: TStringField
      FieldName = 'FUN_HOSAI1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarioFUN_HOENT2: TStringField
      FieldName = 'FUN_HOENT2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarioFUN_HOSAI2: TStringField
      FieldName = 'FUN_HOSAI2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFuncionarioFUN_NOMPAI: TStringField
      FieldName = 'FUN_NOMPAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarioFUN_NOMMAE: TStringField
      FieldName = 'FUN_NOMMAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFuncionarioFUN_COMPO1: TStringField
      FieldName = 'FUN_COMPO1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_COMPO2: TStringField
      FieldName = 'FUN_COMPO2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_COMPO3: TStringField
      FieldName = 'FUN_COMPO3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_ASSID1: TStringField
      FieldName = 'FUN_ASSID1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_ASSID2: TStringField
      FieldName = 'FUN_ASSID2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_ASSID3: TStringField
      FieldName = 'FUN_ASSID3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_HONES1: TStringField
      FieldName = 'FUN_HONES1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_HONES2: TStringField
      FieldName = 'FUN_HONES2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_HONES3: TStringField
      FieldName = 'FUN_HONES3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_CARAT1: TStringField
      FieldName = 'FUN_CARAT1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_CARAT2: TStringField
      FieldName = 'FUN_CARAT2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_CARAT3: TStringField
      FieldName = 'FUN_CARAT3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object dstFuncionarioFUN_FUNCAO: TStringField
      FieldName = 'FUN_FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFuncionarioFUN_RGEMIS: TDateField
      FieldName = 'FUN_RGEMIS'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_CDCARGO: TIntegerField
      FieldName = 'FUN_CDCARGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_ESTADOCIVIL: TIntegerField
      FieldName = 'FUN_ESTADOCIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_DTCADA: TDateField
      FieldName = 'FUN_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_HOCADA: TStringField
      FieldName = 'FUN_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFuncionarioFUN_USUARIO_CAD: TIntegerField
      FieldName = 'FUN_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_DTALTE: TDateField
      FieldName = 'FUN_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_HOALTE: TStringField
      FieldName = 'FUN_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFuncionarioFUN_USUARIO_ALT: TIntegerField
      FieldName = 'FUN_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_NUMERO: TIntegerField
      FieldName = 'FUN_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFuncionarioFUN_SEXO: TStringField
      FieldName = 'FUN_SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstFuncionarioFUN_CELULAR: TStringField
      FieldName = 'FUN_CELULAR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object dstFuncionarioFUN_SITUACAO: TIntegerField
      FieldName = 'FUN_SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select F.FOR_CODIGO, F.FOR_FANTASIA from FORNECEDORES F order by' +
      ' F.FOR_FANTASIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 352
    Top = 80
  end
  object dspCliente: TDataSetProvider
    DataSet = dstCliente
    Options = [poAllowCommandText]
    OnGetTableName = dspClienteGetTableName
    Left = 96
    Top = 80
  end
  object dspConfig: TDataSetProvider
    DataSet = dstConfig
    Options = [poAllowCommandText]
    OnGetTableName = dspConfigGetTableName
    Left = 176
    Top = 16
  end
  object dspFuncionario: TDataSetProvider
    DataSet = dstFuncionario
    Options = [poAllowCommandText]
    OnGetTableName = dspFuncionarioGetTableName
    Left = 104
    Top = 136
  end
  object dspUsuario: TDataSetProvider
    DataSet = dstUsuario
    Options = [poAllowCommandText]
    OnGetTableName = dspUsuarioGetTableName
    Left = 408
    Top = 16
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 416
    Top = 80
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspConfig'
    Left = 232
    Top = 16
    object cdsConfigCFG_CODIGO: TIntegerField
      FieldName = 'CFG_CODIGO'
      Required = True
    end
    object cdsConfigCFG_RAZAO_EMPRESA: TStringField
      FieldName = 'CFG_RAZAO_EMPRESA'
      Size = 50
    end
    object cdsConfigCFG_FANTASIA: TStringField
      FieldName = 'CFG_FANTASIA'
      Size = 40
    end
    object cdsConfigCFG_ENDERECO: TStringField
      FieldName = 'CFG_ENDERECO'
      Size = 50
    end
    object cdsConfigCFG_NUMERO: TIntegerField
      FieldName = 'CFG_NUMERO'
    end
    object cdsConfigCFG_BAIRRO: TStringField
      FieldName = 'CFG_BAIRRO'
    end
    object cdsConfigCFG_CIDADE: TStringField
      FieldName = 'CFG_CIDADE'
    end
    object cdsConfigCFG_UF: TStringField
      FieldName = 'CFG_UF'
      FixedChar = True
      Size = 2
    end
    object cdsConfigCFG_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CEP'
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsConfigCFG_CNPJ: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CNPJ'
      EditMask = '##.###.###/####-##;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsConfigCFG_INSEST: TStringField
      FieldName = 'CFG_INSEST'
      FixedChar = True
      Size = 11
    end
    object cdsConfigCFG_NRFONE: TStringField
      FieldName = 'CFG_NRFONE'
      EditMask = '(##) ####-####;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsConfigCFG_NUMFAX: TStringField
      FieldName = 'CFG_NUMFAX'
      EditMask = '(##) ####-####;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsConfigCFG_CELULAR: TStringField
      FieldName = 'CFG_CELULAR'
      EditMask = '(##) ####-####;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsConfigCFG_EMAIL: TStringField
      FieldName = 'CFG_EMAIL'
      Size = 60
    end
    object cdsConfigCFG_SITE: TStringField
      FieldName = 'CFG_SITE'
      Size = 60
    end
    object cdsConfigCFG_CLIENTE: TIntegerField
      FieldName = 'CFG_CLIENTE'
    end
    object cdsConfigCFG_FORNECEDOR: TIntegerField
      FieldName = 'CFG_FORNECEDOR'
    end
    object cdsConfigCFG_FUNCIONARIO: TIntegerField
      FieldName = 'CFG_FUNCIONARIO'
    end
    object cdsConfigCFG_PRODUTO: TIntegerField
      FieldName = 'CFG_PRODUTO'
    end
    object cdsConfigCFG_ATENDIMENTOS: TIntegerField
      FieldName = 'CFG_ATENDIMENTOS'
    end
    object cdsConfigCFG_USUARIOS: TIntegerField
      FieldName = 'CFG_USUARIOS'
    end
    object cdsConfigCFG_CDCIDADE: TIntegerField
      FieldName = 'CFG_CDCIDADE'
    end
    object cdsConfigCFG_CDBAIRRO: TIntegerField
      FieldName = 'CFG_CDBAIRRO'
    end
    object cdsConfigCFG_SEQCPAGAR: TIntegerField
      FieldName = 'CFG_SEQCPAGAR'
    end
    object cdsConfigCFG_NRCOMPRA: TIntegerField
      FieldName = 'CFG_NRCOMPRA'
    end
    object cdsConfigCFG_SEQCRECEBER: TIntegerField
      FieldName = 'CFG_SEQCRECEBER'
    end
    object cdsConfigCFG_NRCREDITO: TIntegerField
      FieldName = 'CFG_NRCREDITO'
    end
    object cdsConfigCFG_SEQUENCIA: TIntegerField
      FieldName = 'CFG_SEQUENCIA'
    end
    object cdsConfigCFG_NATUREZA: TIntegerField
      FieldName = 'CFG_NATUREZA'
    end
    object cdsConfigCFG_CARTA: TIntegerField
      FieldName = 'CFG_CARTA'
    end
    object cdsConfigCFG_CARGO: TIntegerField
      FieldName = 'CFG_CARGO'
    end
    object cdsConfigCFG_MODALIDADE: TIntegerField
      FieldName = 'CFG_MODALIDADE'
    end
    object cdsConfigCFG_SEQTAREFAUSUARIOS: TIntegerField
      FieldName = 'CFG_SEQTAREFAUSUARIOS'
    end
    object cdsConfigCFG_SEQENTRADA: TIntegerField
      FieldName = 'CFG_SEQENTRADA'
    end
    object cdsConfigCFG_SEQVENDA: TIntegerField
      FieldName = 'CFG_SEQVENDA'
    end
    object cdsConfigCFG_SCREENWIDTH: TIntegerField
      FieldName = 'CFG_SCREENWIDTH'
    end
    object cdsConfigCFG_SCREENHEIGHT: TIntegerField
      FieldName = 'CFG_SCREENHEIGHT'
    end
    object cdsConfigCFG_VENDA: TIntegerField
      FieldName = 'CFG_VENDA'
    end
    object cdsConfigCFG_SEQMOVCAIXA: TIntegerField
      FieldName = 'CFG_SEQMOVCAIXA'
    end
    object cdsConfigCFG_LOGO: TGraphicField
      FieldName = 'CFG_LOGO'
      BlobType = ftGraphic
    end
    object cdsConfigCFG_HORA: TTimeField
      FieldName = 'CFG_HORA'
    end
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCliente'
    Left = 160
    Top = 80
    object cdsClienteCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsClienteCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsClienteCLI_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsClienteCLI_LOGRADOURO: TStringField
      FieldName = 'CLI_LOGRADOURO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsClienteCLI_NUMERO: TIntegerField
      FieldName = 'CLI_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsClienteCLI_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsClienteCLI_CDBAIRRO: TIntegerField
      FieldName = 'CLI_CDBAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_CDCIDADE: TIntegerField
      FieldName = 'CLI_CDCIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_UFCLIENTE: TStringField
      FieldName = 'CLI_UFCLIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLI_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE1'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsClienteCLI_FONE2: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_FONE2'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsClienteCLI_CELULAR: TStringField
      Alignment = taRightJustify
      FieldName = 'CLI_CELULAR'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsClienteCLI_IDENTIDADE: TStringField
      FieldName = 'CLI_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsClienteCLI_ORGAOEMISSOR: TStringField
      FieldName = 'CLI_ORGAOEMISSOR'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cdsClienteCLI_UFEMISSOR: TStringField
      FieldName = 'CLI_UFEMISSOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsClienteCLI_ESTADO_CIVIL: TIntegerField
      FieldName = 'CLI_ESTADO_CIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_SEXO: TStringField
      FieldName = 'CLI_SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsClienteCLI_SITUACAO: TIntegerField
      FieldName = 'CLI_SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsClienteCLI_DTANIVERSARIO: TDateField
      FieldName = 'CLI_DTANIVERSARIO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsClienteCLI_NOME_PAI: TStringField
      FieldName = 'CLI_NOME_PAI'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsClienteCLI_NOME_MAE: TStringField
      FieldName = 'CLI_NOME_MAE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsClienteCLI_DTCADASTRO: TDateField
      FieldName = 'CLI_DTCADASTRO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsClienteCLI_USUARIO_INC: TIntegerField
      FieldName = 'CLI_USUARIO_INC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_HORA_INC: TStringField
      FieldName = 'CLI_HORA_INC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsClienteCLI_USUARIO_ALT: TIntegerField
      FieldName = 'CLI_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClienteCLI_DATA_ALT: TDateField
      FieldName = 'CLI_DATA_ALT'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsClienteCLI_HORA_ALT: TStringField
      FieldName = 'CLI_HORA_ALT'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsClienteCLI_FOTOCLIENTE: TGraphicField
      FieldName = 'CLI_FOTOCLIENTE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object cdsClienteCLI_OBSERVACAO: TMemoField
      FieldName = 'CLI_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsClienteCLI_NMCIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMCIDADE'
      LookupDataSet = cdsListaCidades
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_DESCRICAO'
      KeyFields = 'CLI_CDCIDADE'
      Lookup = True
    end
    object cdsClienteCLI_NMBAIRRO: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMBAIRRO'
      LookupDataSet = cdsListaBairros
      LookupKeyFields = 'BAI_CODIGO'
      LookupResultField = 'BAI_DESCRICAO'
      KeyFields = 'CLI_CDBAIRRO'
      Lookup = True
    end
    object cdsClienteCLI_NMEST_CIVIL: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMEST_CIVIL'
      LookupDataSet = cdsListaEstCivil
      LookupKeyFields = 'ETC_CODIGO'
      LookupResultField = 'ETC_DESCRICAO'
      KeyFields = 'CLI_ESTADO_CIVIL'
      Size = 15
      Lookup = True
    end
    object cdsClienteCLI_NMSITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'CLI_NMSITUACAO'
      LookupDataSet = cdsListaSituacao
      LookupKeyFields = 'STC_CODIGO'
      LookupResultField = 'STC_DESCRICAO'
      KeyFields = 'CLI_SITUACAO'
      Size = 15
      Lookup = True
    end
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFuncionario'
    Left = 184
    Top = 136
    object cdsFuncionarioFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object cdsFuncionarioFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsFuncionarioFUN_ENDERECO: TStringField
      FieldName = 'FUN_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsFuncionarioFUN_BAIRRO: TStringField
      FieldName = 'FUN_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_CIDADE: TStringField
      FieldName = 'FUN_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_UFFUNC: TStringField
      FieldName = 'FUN_UFFUNC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsFuncionarioFUN_NATUREZA: TStringField
      FieldName = 'FUN_NATUREZA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_CEP'
      ProviderFlags = [pfInUpdate]
      EditMask = '#####-###;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsFuncionarioFUN_FONE: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_FONE'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsFuncionarioFUN_TPFUNC: TIntegerField
      FieldName = 'FUN_TPFUNC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_PECOMI: TBCDField
      FieldName = 'FUN_PECOMI'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object cdsFuncionarioFUN_DTNASCIMENTO: TDateField
      FieldName = 'FUN_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_DTADMICAO: TDateField
      FieldName = 'FUN_DTADMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_DTDEMICAO: TDateField
      FieldName = 'FUN_DTDEMICAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_VLDEBITO: TFMTBCDField
      FieldName = 'FUN_VLDEBITO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsFuncionarioFUN_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_CPF'
      ProviderFlags = [pfInUpdate]
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsFuncionarioFUN_IDENTIDADE: TStringField
      FieldName = 'FUN_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object cdsFuncionarioFUN_ORIDEN: TStringField
      FieldName = 'FUN_ORIDEN'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsFuncionarioFUN_UFIDEN: TStringField
      FieldName = 'FUN_UFIDEN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsFuncionarioFUN_NRCART: TStringField
      FieldName = 'FUN_NRCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object cdsFuncionarioFUN_SECART: TStringField
      FieldName = 'FUN_SECART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object cdsFuncionarioFUN_UFCART: TStringField
      FieldName = 'FUN_UFCART'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsFuncionarioFUN_CAREMI: TStringField
      FieldName = 'FUN_CAREMI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object cdsFuncionarioFUN_TITULO: TStringField
      FieldName = 'FUN_TITULO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 12
    end
    object cdsFuncionarioFUN_CDSECA: TStringField
      FieldName = 'FUN_CDSECA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsFuncionarioFUN_CDZONA: TStringField
      FieldName = 'FUN_CDZONA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object cdsFuncionarioFUN_ESTCIVIL: TStringField
      FieldName = 'FUN_ESTCIVIL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsFuncionarioFUN_VLSALA: TFMTBCDField
      FieldName = 'FUN_VLSALA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsFuncionarioFUN_LIONIB: TStringField
      FieldName = 'FUN_LIONIB'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_HOENT1: TStringField
      FieldName = 'FUN_HOENT1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsFuncionarioFUN_HOSAI1: TStringField
      FieldName = 'FUN_HOSAI1'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsFuncionarioFUN_HOENT2: TStringField
      FieldName = 'FUN_HOENT2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsFuncionarioFUN_HOSAI2: TStringField
      FieldName = 'FUN_HOSAI2'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsFuncionarioFUN_NOMPAI: TStringField
      FieldName = 'FUN_NOMPAI'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsFuncionarioFUN_NOMMAE: TStringField
      FieldName = 'FUN_NOMMAE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsFuncionarioFUN_COMPO1: TStringField
      FieldName = 'FUN_COMPO1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_COMPO2: TStringField
      FieldName = 'FUN_COMPO2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_COMPO3: TStringField
      FieldName = 'FUN_COMPO3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_ASSID1: TStringField
      FieldName = 'FUN_ASSID1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_ASSID2: TStringField
      FieldName = 'FUN_ASSID2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_ASSID3: TStringField
      FieldName = 'FUN_ASSID3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_HONES1: TStringField
      FieldName = 'FUN_HONES1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_HONES2: TStringField
      FieldName = 'FUN_HONES2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_HONES3: TStringField
      FieldName = 'FUN_HONES3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_CARAT1: TStringField
      FieldName = 'FUN_CARAT1'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_CARAT2: TStringField
      FieldName = 'FUN_CARAT2'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_CARAT3: TStringField
      FieldName = 'FUN_CARAT3'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object cdsFuncionarioFUN_FUNCAO: TStringField
      FieldName = 'FUN_FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsFuncionarioFUN_RGEMIS: TDateField
      FieldName = 'FUN_RGEMIS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_CDCARGO: TIntegerField
      FieldName = 'FUN_CDCARGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_ESTADOCIVIL: TIntegerField
      FieldName = 'FUN_ESTADOCIVIL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_DTCADA: TDateField
      FieldName = 'FUN_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_HOCADA: TStringField
      FieldName = 'FUN_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsFuncionarioFUN_USUARIO_CAD: TIntegerField
      FieldName = 'FUN_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_DTALTE: TDateField
      FieldName = 'FUN_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_HOALTE: TStringField
      FieldName = 'FUN_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsFuncionarioFUN_USUARIO_ALT: TIntegerField
      FieldName = 'FUN_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_NMEST_CIVIL: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_NMEST_CIVIL'
      LookupDataSet = cdsListaEstCivil
      LookupKeyFields = 'ETC_CODIGO'
      LookupResultField = 'ETC_DESCRICAO'
      KeyFields = 'FUN_ESTADOCIVIL'
      Size = 15
      Lookup = True
    end
    object cdsFuncionarioFUN_NUMERO: TIntegerField
      FieldName = 'FUN_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_NMCIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_NMCIDADE'
      LookupDataSet = cdsListaCidades
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_DESCRICAO'
      KeyFields = 'FUN_CIDADE'
      Lookup = True
    end
    object cdsFuncionarioFUN_NMBAIRRO: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_NMBAIRRO'
      LookupDataSet = cdsListaBairros
      LookupKeyFields = 'BAI_CODIGO'
      LookupResultField = 'BAI_DESCRICAO'
      KeyFields = 'FUN_BAIRRO'
      Lookup = True
    end
    object cdsFuncionarioFUN_NMESTCIVIL: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_NMESTCIVIL'
      LookupDataSet = cdsListaEstCivil
      LookupKeyFields = 'ETC_CODIGO'
      LookupResultField = 'ETC_DESCRICAO'
      KeyFields = 'FUN_ESTCIVIL'
      Size = 15
      Lookup = True
    end
    object cdsFuncionarioFUN_SEXO: TStringField
      FieldName = 'FUN_SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsFuncionarioFUN_NMCARGO: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_NMCARGO'
      LookupDataSet = cdsListaCargos
      LookupKeyFields = 'TFU_CODIGO'
      LookupResultField = 'TFU_DESCRICAO'
      KeyFields = 'FUN_CDCARGO'
      Lookup = True
    end
    object cdsFuncionarioFUN_CELULAR: TStringField
      Alignment = taRightJustify
      FieldName = 'FUN_CELULAR'
      EditMask = '(99) 9999-9999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsFuncionarioFUN_SITUACAO: TIntegerField
      FieldName = 'FUN_SITUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsFuncionarioFUN_NMSITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'FUN_NMSITUACAO'
      LookupDataSet = cdsListaSituacao
      LookupKeyFields = 'STC_CODIGO'
      LookupResultField = 'STC_DESCRICAO'
      KeyFields = 'FUN_SITUACAO'
      Size = 15
      Lookup = True
    end
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuario'
    Left = 480
    Top = 16
    object cdsUsuarioSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsUsuarioSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Required = True
      Size = 40
    end
    object cdsUsuarioSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Size = 6
    end
    object cdsUsuarioSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      Size = 30
    end
    object cdsUsuarioSEN_TERMINAL: TStringField
      FieldName = 'SEN_TERMINAL'
    end
    object cdsUsuarioSEN_GRUPO: TIntegerField
      FieldName = 'SEN_GRUPO'
    end
    object cdsUsuarioSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
    end
    object cdsUsuarioSEN_FLEXCLUSAO: TStringField
      FieldName = 'SEN_FLEXCLUSAO'
      FixedChar = True
      Size = 1
    end
    object cdsUsuarioSEN_ADMIN: TStringField
      FieldName = 'SEN_ADMIN'
      FixedChar = True
      Size = 1
    end
  end
  object dstCidade: TSQLDataSet
    CommandText = 'select * from CIDADES Where (CID_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 32
    Top = 192
    object dstCidadeCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCidadeCID_DESCRICAO: TStringField
      FieldName = 'CID_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstCidadeCID_UFCIDADE: TStringField
      FieldName = 'CID_UFCIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
  end
  object dstBairro: TSQLDataSet
    CommandText = 'select * from BAIRROS Where (BAI_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 32
    Top = 248
    object dstBairroBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstBairroBAI_DESCRICAO: TStringField
      FieldName = 'BAI_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstBairroBAI_CDCIDADE: TIntegerField
      FieldName = 'BAI_CDCIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspCidade: TDataSetProvider
    DataSet = dstCidade
    Options = [poAllowCommandText]
    OnGetTableName = dspCidadeGetTableName
    Left = 104
    Top = 192
  end
  object dspBairro: TDataSetProvider
    DataSet = dstBairro
    Options = [poAllowCommandText]
    OnGetTableName = dspBairroGetTableName
    Left = 96
    Top = 248
  end
  object cdsListaCidades: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from CIDADES Order by CID_DESCRICAO;'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 120
    object cdsListaCidadesCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      Required = True
    end
    object cdsListaCidadesCID_DESCRICAO: TStringField
      FieldName = 'CID_DESCRICAO'
      Required = True
    end
    object cdsListaCidadesCID_UFCIDADE: TStringField
      FieldName = 'CID_UFCIDADE'
      FixedChar = True
      Size = 2
    end
  end
  object cdsListaBairros: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from BAIRROS Where (BAI_CDCIDADE = :pCDCIDADE) Order by' +
      ' BAI_DESCRICAO;'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDCIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 172
    object cdsListaBairrosBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
    end
    object cdsListaBairrosBAI_DESCRICAO: TStringField
      FieldName = 'BAI_DESCRICAO'
      Required = True
    end
    object cdsListaBairrosBAI_CDCIDADE: TIntegerField
      FieldName = 'BAI_CDCIDADE'
      Required = True
    end
  end
  object cdsListaEstCivil: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from ESTADO_CIVIL Order by ETC_CODIGO;'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 224
    object cdsListaEstCivilETC_CODIGO: TIntegerField
      FieldName = 'ETC_CODIGO'
      Required = True
    end
    object cdsListaEstCivilETC_DESCRICAO: TStringField
      FieldName = 'ETC_DESCRICAO'
      Size = 15
    end
  end
  object cdsListaCargos: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from TIPO_FUNCIONARIO Order by TFU_DESCRICAO;'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 272
    object cdsListaCargosTFU_CODIGO: TIntegerField
      FieldName = 'TFU_CODIGO'
      Required = True
    end
    object cdsListaCargosTFU_DESCRICAO: TStringField
      FieldName = 'TFU_DESCRICAO'
    end
    object cdsListaCargosTFU_SIGLA: TStringField
      FieldName = 'TFU_SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object cdsListaSituacao: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from SITUACAO_CLIENTE SC Order by SC.STC_DESCRICAO'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 320
    object cdsListaSituacaoSTC_CODIGO: TIntegerField
      FieldName = 'STC_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaSituacaoSTC_DESCRICAO: TStringField
      FieldName = 'STC_DESCRICAO'
      Required = True
      Size = 15
    end
  end
  object cdsCidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCidade'
    Left = 176
    Top = 192
    object cdsCidadeCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsCidadeCID_DESCRICAO: TStringField
      FieldName = 'CID_DESCRICAO'
      Required = True
    end
    object cdsCidadeCID_UFCIDADE: TStringField
      FieldName = 'CID_UFCIDADE'
      FixedChar = True
      Size = 2
    end
  end
  object cdsBairro: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBairro'
    Left = 176
    Top = 248
    object cdsBairroBAI_CODIGO: TIntegerField
      FieldName = 'BAI_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsBairroBAI_DESCRICAO: TStringField
      FieldName = 'BAI_DESCRICAO'
      Required = True
    end
    object cdsBairroBAI_CDCIDADE: TIntegerField
      FieldName = 'BAI_CDCIDADE'
      Required = True
    end
    object cdsBairroBAI_NMCIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'BAI_NMCIDADE'
      LookupDataSet = cdsListaCidades
      LookupKeyFields = 'CID_CODIGO'
      LookupResultField = 'CID_DESCRICAO'
      KeyFields = 'BAI_CDCIDADE'
      Lookup = True
    end
  end
  object dstFornecedor: TSQLDataSet
    CommandText = 'select * from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 32
    Top = 304
    object dstFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstFornecedorFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dstFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dstFornecedorFOR_CNPJ: TStringField
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstFornecedorFOR_INSCESTADUAL: TStringField
      FieldName = 'FOR_INSCESTADUAL'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstFornecedorFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstFornecedorFOR_NUMERO: TIntegerField
      FieldName = 'FOR_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_CEP: TStringField
      FieldName = 'FOR_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstFornecedorFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFornecedorFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFornecedorFOR_UF: TStringField
      FieldName = 'FOR_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFornecedorFOR_FONE1: TStringField
      FieldName = 'FOR_FONE1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_FONE2: TStringField
      FieldName = 'FOR_FONE2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_FAX: TStringField
      FieldName = 'FOR_FAX'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_OPERACAO: TIntegerField
      FieldName = 'FOR_OPERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_CONTA: TIntegerField
      FieldName = 'FOR_CONTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_CONTATO1: TStringField
      FieldName = 'FOR_CONTATO1'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFornecedorFOR_CARGO1: TStringField
      FieldName = 'FOR_CARGO1'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_FONECON1: TStringField
      FieldName = 'FOR_FONECON1'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_CONTATO2: TStringField
      FieldName = 'FOR_CONTATO2'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFornecedorFOR_CARGO2: TStringField
      FieldName = 'FOR_CARGO2'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_FONECON2: TStringField
      FieldName = 'FOR_FONECON2'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstFornecedorFOR_SITE: TStringField
      FieldName = 'FOR_SITE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstFornecedorFOR_EMAIL: TStringField
      FieldName = 'FOR_EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstFornecedorFOR_CDBANC: TStringField
      FieldName = 'FOR_CDBANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstFornecedorFOR_AGENCIA: TStringField
      FieldName = 'FOR_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstFornecedorFOR_DTCADA: TDateField
      FieldName = 'FOR_DTCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_HOCADA: TStringField
      FieldName = 'FOR_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFornecedorFOR_USUARIO_CAD: TIntegerField
      FieldName = 'FOR_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_DTALTE: TDateField
      FieldName = 'FOR_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstFornecedorFOR_HOALTE: TStringField
      FieldName = 'FOR_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFornecedorFOR_USUARIO_ALT: TIntegerField
      FieldName = 'FOR_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstProduto: TSQLDataSet
    CommandText = 'select * from PRODUTOS Where (PRO_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 32
    Top = 360
    object dstProdutoPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstProdutoPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstProdutoPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstProdutoPRO_FLPROD: TStringField
      FieldName = 'PRO_FLPROD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dstProdutoPRO_APLICACAO: TStringField
      FieldName = 'PRO_APLICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstProdutoPRO_FORNECEDOR: TIntegerField
      FieldName = 'PRO_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_SECAOO: TIntegerField
      FieldName = 'PRO_SECAOO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_SUB_SECAO: TIntegerField
      FieldName = 'PRO_SUB_SECAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_VLFRACAO: TFMTBCDField
      FieldName = 'PRO_VLFRACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_TRIBUTACAO: TIntegerField
      FieldName = 'PRO_TRIBUTACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_REDUCAOICMS: TFMTBCDField
      FieldName = 'PRO_REDUCAOICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_TAXAS: TFMTBCDField
      FieldName = 'PRO_TAXAS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_IPI: TFMTBCDField
      FieldName = 'PRO_IPI'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_FRETE: TFMTBCDField
      FieldName = 'PRO_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_LIMDESCONTO: TBCDField
      FieldName = 'PRO_LIMDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dstProdutoPRO_COMISSIONADO: TStringField
      FieldName = 'PRO_COMISSIONADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutoPRO_DTCADASTRO: TDateField
      FieldName = 'PRO_DTCADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_DTALTERACAO: TDateField
      FieldName = 'PRO_DTALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstProdutoPRO_LUCROBRUTO: TFMTBCDField
      FieldName = 'PRO_LUCROBRUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_LUCROLIQUIDO: TFMTBCDField
      FieldName = 'PRO_LUCROLIQUIDO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_CONTROLELOTE: TStringField
      FieldName = 'PRO_CONTROLELOTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutoPRO_CODIGOBAIXA: TStringField
      FieldName = 'PRO_CODIGOBAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstProdutoPRO_HOREAJUTE: TStringField
      FieldName = 'PRO_HOREAJUTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstProdutoPRO_OBSERVACAO: TMemoField
      FieldName = 'PRO_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstProdutoPRO_USUARIO_REAJUSTE: TIntegerField
      FieldName = 'PRO_USUARIO_REAJUSTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_VALOR_ANTERIOR: TFMTBCDField
      FieldName = 'PRO_VALOR_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutoPRO_USUARIO_CAD: TIntegerField
      FieldName = 'PRO_USUARIO_CAD'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_HOCADA: TStringField
      FieldName = 'PRO_HOCADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstProdutoPRO_USUARIO_ALT: TIntegerField
      FieldName = 'PRO_USUARIO_ALT'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutoPRO_HOALTE: TStringField
      FieldName = 'PRO_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstProdutoPRO_ANTECIPACAO_ICMS: TBCDField
      FieldName = 'PRO_ANTECIPACAO_ICMS'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
  end
  object dspFornecedor: TDataSetProvider
    DataSet = dstFornecedor
    Options = [poAllowCommandText]
    Left = 104
    Top = 296
  end
  object dspProduto: TDataSetProvider
    DataSet = dstProduto
    Options = [poAllowCommandText]
    Left = 96
    Top = 360
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFornecedor'
    Left = 176
    Top = 304
    object cdsFornecedorFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsFornecedorFOR_RAZAO: TStringField
      FieldName = 'FOR_RAZAO'
      Required = True
      Size = 50
    end
    object cdsFornecedorFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
    object cdsFornecedorFOR_CNPJ: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_CNPJ'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsFornecedorFOR_INSCESTADUAL: TStringField
      FieldName = 'FOR_INSCESTADUAL'
      Size = 14
    end
    object cdsFornecedorFOR_ENDERECO: TStringField
      FieldName = 'FOR_ENDERECO'
      Size = 50
    end
    object cdsFornecedorFOR_NUMERO: TIntegerField
      FieldName = 'FOR_NUMERO'
    end
    object cdsFornecedorFOR_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_CEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object cdsFornecedorFOR_BAIRRO: TStringField
      FieldName = 'FOR_BAIRRO'
      Size = 40
    end
    object cdsFornecedorFOR_CIDADE: TStringField
      FieldName = 'FOR_CIDADE'
      Size = 40
    end
    object cdsFornecedorFOR_UF: TStringField
      FieldName = 'FOR_UF'
      FixedChar = True
      Size = 2
    end
    object cdsFornecedorFOR_FONE1: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONE1'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_FONE2: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONE2'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_FAX: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FAX'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_OPERACAO: TIntegerField
      FieldName = 'FOR_OPERACAO'
    end
    object cdsFornecedorFOR_CONTA: TIntegerField
      FieldName = 'FOR_CONTA'
    end
    object cdsFornecedorFOR_CONTATO1: TStringField
      FieldName = 'FOR_CONTATO1'
      Size = 30
    end
    object cdsFornecedorFOR_CARGO1: TStringField
      FieldName = 'FOR_CARGO1'
    end
    object cdsFornecedorFOR_FONECON1: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONECON1'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_CONTATO2: TStringField
      FieldName = 'FOR_CONTATO2'
      Size = 30
    end
    object cdsFornecedorFOR_CARGO2: TStringField
      FieldName = 'FOR_CARGO2'
    end
    object cdsFornecedorFOR_FONECON2: TStringField
      Alignment = taRightJustify
      FieldName = 'FOR_FONECON2'
      EditMask = '(99) 9999-9999;0;_'
      Size = 10
    end
    object cdsFornecedorFOR_SITE: TStringField
      FieldName = 'FOR_SITE'
      Size = 60
    end
    object cdsFornecedorFOR_EMAIL: TStringField
      FieldName = 'FOR_EMAIL'
      Size = 60
    end
    object cdsFornecedorFOR_CDBANC: TStringField
      FieldName = 'FOR_CDBANC'
      FixedChar = True
      Size = 3
    end
    object cdsFornecedorFOR_AGENCIA: TStringField
      FieldName = 'FOR_AGENCIA'
      FixedChar = True
      Size = 4
    end
    object cdsFornecedorFOR_DTCADA: TDateField
      FieldName = 'FOR_DTCADA'
    end
    object cdsFornecedorFOR_HOCADA: TStringField
      FieldName = 'FOR_HOCADA'
      FixedChar = True
      Size = 5
    end
    object cdsFornecedorFOR_USUARIO_CAD: TIntegerField
      FieldName = 'FOR_USUARIO_CAD'
    end
    object cdsFornecedorFOR_DTALTE: TDateField
      FieldName = 'FOR_DTALTE'
    end
    object cdsFornecedorFOR_HOALTE: TStringField
      FieldName = 'FOR_HOALTE'
      FixedChar = True
      Size = 5
    end
    object cdsFornecedorFOR_USUARIO_ALT: TIntegerField
      FieldName = 'FOR_USUARIO_ALT'
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProduto'
    Left = 168
    Top = 360
    object cdsProdutoPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutoPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      FixedChar = True
      Size = 13
    end
    object cdsProdutoPRO_REFERENCIA: TStringField
      FieldName = 'PRO_REFERENCIA'
      Size = 14
    end
    object cdsProdutoPRO_FLPROD: TStringField
      FieldName = 'PRO_FLPROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Required = True
      Size = 60
    end
    object cdsProdutoPRO_APLICACAO: TStringField
      FieldName = 'PRO_APLICACAO'
      Size = 60
    end
    object cdsProdutoPRO_FORNECEDOR: TIntegerField
      FieldName = 'PRO_FORNECEDOR'
    end
    object cdsProdutoPRO_SECAOO: TIntegerField
      FieldName = 'PRO_SECAOO'
    end
    object cdsProdutoPRO_SUB_SECAO: TIntegerField
      FieldName = 'PRO_SUB_SECAO'
    end
    object cdsProdutoPRO_VLCOMPRA: TFMTBCDField
      FieldName = 'PRO_VLCOMPRA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_VLCUSTO: TFMTBCDField
      FieldName = 'PRO_VLCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_VLVENDA: TFMTBCDField
      FieldName = 'PRO_VLVENDA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_VLFRACAO: TFMTBCDField
      FieldName = 'PRO_VLFRACAO'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_TRIBUTACAO: TIntegerField
      FieldName = 'PRO_TRIBUTACAO'
    end
    object cdsProdutoPRO_REDUCAOICMS: TFMTBCDField
      FieldName = 'PRO_REDUCAOICMS'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_TAXAS: TFMTBCDField
      FieldName = 'PRO_TAXAS'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_IPI: TFMTBCDField
      FieldName = 'PRO_IPI'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_FRETE: TFMTBCDField
      FieldName = 'PRO_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_LIMDESCONTO: TBCDField
      FieldName = 'PRO_LIMDESCONTO'
      Precision = 9
      Size = 2
    end
    object cdsProdutoPRO_COMISSIONADO: TStringField
      FieldName = 'PRO_COMISSIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRO_DTCADASTRO: TDateField
      FieldName = 'PRO_DTCADASTRO'
    end
    object cdsProdutoPRO_DTALTERACAO: TDateField
      FieldName = 'PRO_DTALTERACAO'
    end
    object cdsProdutoPRO_UNIDADE: TStringField
      FieldName = 'PRO_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoPRO_LUCROBRUTO: TFMTBCDField
      FieldName = 'PRO_LUCROBRUTO'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_LUCROLIQUIDO: TFMTBCDField
      FieldName = 'PRO_LUCROLIQUIDO'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_CONTROLELOTE: TStringField
      FieldName = 'PRO_CONTROLELOTE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRO_CODIGOBAIXA: TStringField
      FieldName = 'PRO_CODIGOBAIXA'
      FixedChar = True
      Size = 13
    end
    object cdsProdutoPRO_HOREAJUTE: TStringField
      FieldName = 'PRO_HOREAJUTE'
      FixedChar = True
      Size = 5
    end
    object cdsProdutoPRO_OBSERVACAO: TMemoField
      FieldName = 'PRO_OBSERVACAO'
      BlobType = ftMemo
    end
    object cdsProdutoPRO_USUARIO_REAJUSTE: TIntegerField
      FieldName = 'PRO_USUARIO_REAJUSTE'
    end
    object cdsProdutoPRO_VALOR_ANTERIOR: TFMTBCDField
      FieldName = 'PRO_VALOR_ANTERIOR'
      Precision = 18
      Size = 2
    end
    object cdsProdutoPRO_USUARIO_CAD: TIntegerField
      FieldName = 'PRO_USUARIO_CAD'
    end
    object cdsProdutoPRO_HOCADA: TStringField
      FieldName = 'PRO_HOCADA'
      FixedChar = True
      Size = 5
    end
    object cdsProdutoPRO_USUARIO_ALT: TIntegerField
      FieldName = 'PRO_USUARIO_ALT'
    end
    object cdsProdutoPRO_HOALTE: TStringField
      FieldName = 'PRO_HOALTE'
      FixedChar = True
      Size = 5
    end
    object cdsProdutoPRO_ANTECIPACAO_ICMS: TBCDField
      FieldName = 'PRO_ANTECIPACAO_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsProdutoPRO_NMUNID: TStringField
      FieldKind = fkLookup
      FieldName = 'PRO_NMUNID'
      LookupDataSet = cdsListaUnidades
      LookupKeyFields = 'UND_CODIGO'
      LookupResultField = 'UND_CODIGO'
      KeyFields = 'PRO_UNIDADE'
      Lookup = True
    end
    object cdsProdutoPRO_NMFORN: TStringField
      FieldKind = fkLookup
      FieldName = 'PRO_NMFORN'
      LookupDataSet = cdsListaFornecedores
      LookupKeyFields = 'FOR_CODIGO'
      LookupResultField = 'FOR_FANTASIA'
      KeyFields = 'PRO_FORNECEDOR'
      Size = 50
      Lookup = True
    end
  end
  object dstAtendimento: TSQLDataSet
    CommandText = 'select * from AGENDA Where (AGE_ID  = :pID) '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 240
    Top = 224
    object dstAtendimentoAGE_ID: TIntegerField
      FieldName = 'AGE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstAtendimentoAGE_DTMOVI: TDateField
      FieldName = 'AGE_DTMOVI'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstAtendimentoAGE_HOMOVI: TStringField
      FieldName = 'AGE_HOMOVI'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstAtendimentoAGE_CLIENTE: TIntegerField
      FieldName = 'AGE_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_DTATENDIMENTO: TDateField
      FieldName = 'AGE_DTATENDIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_HOATENDIMENTO: TStringField
      FieldName = 'AGE_HOATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstAtendimentoAGE_SITUACAO: TStringField
      FieldName = 'AGE_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstAtendimentoAGE_FUNCIONARIO: TIntegerField
      FieldName = 'AGE_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_DESCRICAO: TMemoField
      FieldName = 'AGE_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstAtendimentoAGE_DIAGNOSTICO: TMemoField
      FieldName = 'AGE_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstAtendimentoAGE_OBSERVACAO: TMemoField
      FieldName = 'AGE_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstAtendimentoAGE_USCADA: TIntegerField
      FieldName = 'AGE_USCADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_DTALTE: TDateField
      FieldName = 'AGE_DTALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_HOALTE: TStringField
      FieldName = 'AGE_HOALTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstAtendimentoAGE_USALTE: TIntegerField
      FieldName = 'AGE_USALTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_DTCANCELAMENTO: TDateField
      FieldName = 'AGE_DTCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_HOCANCELAMENTO: TStringField
      FieldName = 'AGE_HOCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstAtendimentoAGE_DTREMARCAMENTO: TDateField
      FieldName = 'AGE_DTREMARCAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoAGE_HOREMARCAMENTO: TStringField
      FieldName = 'AGE_HOREMARCAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
  end
  object dspAtendimento: TDataSetProvider
    DataSet = dstAtendimento
    Options = [poAllowCommandText]
    Left = 296
    Top = 192
  end
  object cdsAtendimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspAtendimento'
    Left = 360
    Top = 216
    object cdsAtendimentoAGE_ID: TIntegerField
      FieldName = 'AGE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsAtendimentoAGE_DTMOVI: TDateField
      Alignment = taRightJustify
      FieldName = 'AGE_DTMOVI'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsAtendimentoAGE_HOMOVI: TStringField
      Alignment = taRightJustify
      FieldName = 'AGE_HOMOVI'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoAGE_CLIENTE: TIntegerField
      FieldName = 'AGE_CLIENTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0000000'
    end
    object cdsAtendimentoAGE_DTATENDIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'AGE_DTATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsAtendimentoAGE_HOATENDIMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'AGE_HOATENDIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoAGE_SITUACAO: TStringField
      FieldName = 'AGE_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsAtendimentoAGE_FUNCIONARIO: TIntegerField
      FieldName = 'AGE_FUNCIONARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendimentoAGE_DESCRICAO: TMemoField
      FieldName = 'AGE_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsAtendimentoAGE_DIAGNOSTICO: TMemoField
      FieldName = 'AGE_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsAtendimentoAGE_OBSERVACAO: TMemoField
      FieldName = 'AGE_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsAtendimentoAGE_USCADA: TIntegerField
      FieldName = 'AGE_USCADA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendimentoAGE_DTALTE: TDateField
      Alignment = taRightJustify
      FieldName = 'AGE_DTALTE'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsAtendimentoAGE_HOALTE: TStringField
      Alignment = taRightJustify
      FieldName = 'AGE_HOALTE'
      ProviderFlags = [pfInUpdate]
      EditMask = '99:99;1;_'
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoAGE_USALTE: TIntegerField
      FieldName = 'AGE_USALTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendimentoATE_NMFUNCIONARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'ATE_NMFUNCIONARIO'
      LookupDataSet = cdsListaFuncionarios
      LookupKeyFields = 'FUN_CODIGO'
      LookupResultField = 'FUN_NOME'
      KeyFields = 'AGE_FUNCIONARIO'
      Size = 40
      Lookup = True
    end
    object cdsAtendimentoAGE_DTCANCELAMENTO: TDateField
      FieldName = 'AGE_DTCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendimentoAGE_HOCANCELAMENTO: TStringField
      FieldName = 'AGE_HOCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoAGE_DTREMARCAMENTO: TDateField
      FieldName = 'AGE_DTREMARCAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendimentoAGE_HOREMARCAMENTO: TStringField
      FieldName = 'AGE_HOREMARCAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
  end
  object cdsListaFuncionarios: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select F.fun_codigo, F.FUN_NOME from FUNCIONARIOS F Where (F.FUN' +
      '_SITUACAO = 1) order by F.FUN_NOME'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 488
    Top = 376
    object cdsListaFuncionariosFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaFuncionariosFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
  object cdsListaFornecedores: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select F.FOR_CODIGO, F.FOR_FANTASIA from FORNECEDORES F order by' +
      ' F.FOR_FANTASIA'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 384
    Top = 272
    object cdsListaFornecedoresFOR_CODIGO: TIntegerField
      FieldName = 'FOR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaFornecedoresFOR_FANTASIA: TStringField
      FieldName = 'FOR_FANTASIA'
      Required = True
      Size = 50
    end
  end
  object cdsListaUnidades: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select U.UND_CODIGO, U.UND_DESCRICAO from UNIDADES U order by U.' +
      'UND_DESCRICAO'
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 384
    Top = 320
  end
  object dstEstoque: TSQLDataSet
    CommandText = 
      'select * from ESTOQUE Where (EST_CDLOJA = :pCDLOJA) and (EST_CDP' +
      'ROD = :pCDPROD)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 32
    Top = 416
    object dstEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object dstEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstEstoqueEST_UNPROD: TStringField
      FieldName = 'EST_UNPROD'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstEstoqueEST_DTENTRADA: TDateField
      FieldName = 'EST_DTENTRADA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEstoqueEST_QUANTENTRADA: TFMTBCDField
      FieldName = 'EST_QUANTENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEstoqueEST_DTSAIDA: TDateField
      FieldName = 'EST_DTSAIDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEstoqueEST_QUANTSAIDA: TFMTBCDField
      FieldName = 'EST_QUANTSAIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEstoqueEST_CUSTOANTERIOR: TFMTBCDField
      FieldName = 'EST_CUSTOANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEstoqueEST_CUSTOMEDIO: TFMTBCDField
      FieldName = 'EST_CUSTOMEDIO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEstoqueEST_MAIORCUSTO: TFMTBCDField
      FieldName = 'EST_MAIORCUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstEstoqueEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstEstoqueULTREAJUST: TDateField
      FieldName = 'ULTREAJUST'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = dstEstoque
    Options = [poAllowCommandText]
    OnGetTableName = dspEstoqueGetTableName
    Left = 96
    Top = 408
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstoque'
    Left = 160
    Top = 416
    object cdsEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
      DisplayFormat = '000'
    end
    object cdsEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsEstoqueEST_UNPROD: TStringField
      FieldName = 'EST_UNPROD'
      FixedChar = True
      Size = 2
    end
    object cdsEstoqueEST_DTENTRADA: TDateField
      FieldName = 'EST_DTENTRADA'
    end
    object cdsEstoqueEST_QUANTENTRADA: TFMTBCDField
      FieldName = 'EST_QUANTENTRADA'
      DisplayFormat = '##0.#00'
      EditFormat = '##0.#00'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_DTSAIDA: TDateField
      FieldName = 'EST_DTSAIDA'
    end
    object cdsEstoqueEST_QUANTSAIDA: TFMTBCDField
      FieldName = 'EST_QUANTSAIDA'
      DisplayFormat = '##0.#00'
      EditFormat = '##0.#00'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_CUSTOANTERIOR: TFMTBCDField
      FieldName = 'EST_CUSTOANTERIOR'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_CUSTOMEDIO: TFMTBCDField
      FieldName = 'EST_CUSTOMEDIO'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_MAIORCUSTO: TFMTBCDField
      FieldName = 'EST_MAIORCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      DisplayFormat = '##0.#00'
      EditFormat = '##0.#00'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueEST_MINIMO: TFMTBCDField
      FieldName = 'EST_MINIMO'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueULTREAJUST: TDateField
      FieldName = 'ULTREAJUST'
    end
  end
  object dstHistorico: TSQLDataSet
    CommandText = 
      'select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQ) and (HIS_L' +
      'OJA = :pLOJA) and (HIS_PRODUTO = :pPRODUTO) and (HIS_NRITEM = :p' +
      'NRITEM)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pNRITEM'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 232
    Top = 288
    object dstHistoricoHIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstHistoricoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstHistoricoHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstHistoricoHIS_NRITEM: TIntegerField
      FieldName = 'HIS_NRITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstHistoricoHIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstHistoricoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstHistoricoHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstHistoricoHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHistoricoHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHistoricoHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHistoricoHIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_VLCUSTO: TFMTBCDField
      FieldName = 'HIS_VLCUSTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstHistoricoHIS_VLCOMPRA: TFMTBCDField
      FieldName = 'HIS_VLCOMPRA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstHistoricoHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstHistoricoHIS_CODIGOBAIXA: TStringField
      FieldName = 'HIS_CODIGOBAIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 13
    end
    object dstHistoricoHIS_VENDEDOR: TIntegerField
      FieldName = 'HIS_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspHistorico: TDataSetProvider
    DataSet = dstHistorico
    Options = [poAllowCommandText]
    OnGetTableName = dspHistoricoGetTableName
    Left = 312
    Top = 288
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pPRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pNRITEM'
        ParamType = ptInput
      end>
    ProviderName = 'dspHistorico'
    Left = 280
    Top = 336
    object cdsHistoricoHIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
      Required = True
    end
    object cdsHistoricoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
      Required = True
    end
    object cdsHistoricoHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsHistoricoHIS_NRITEM: TIntegerField
      FieldName = 'HIS_NRITEM'
      Required = True
    end
    object cdsHistoricoHIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsHistoricoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object cdsHistoricoHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      FixedChar = True
      Size = 5
    end
    object cdsHistoricoHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      FixedChar = True
      Size = 2
    end
    object cdsHistoricoHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
    end
    object cdsHistoricoHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      Precision = 18
      Size = 3
    end
    object cdsHistoricoHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      Precision = 18
      Size = 3
    end
    object cdsHistoricoHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      Precision = 18
      Size = 3
    end
    object cdsHistoricoHIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
    end
    object cdsHistoricoHIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
    end
    object cdsHistoricoHIS_VLCUSTO: TFMTBCDField
      FieldName = 'HIS_VLCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsHistoricoHIS_VLCOMPRA: TFMTBCDField
      FieldName = 'HIS_VLCOMPRA'
      Precision = 18
      Size = 2
    end
    object cdsHistoricoHIS_VLVENDA: TFMTBCDField
      FieldName = 'HIS_VLVENDA'
      Precision = 18
      Size = 2
    end
    object cdsHistoricoHIS_CODIGOBAIXA: TStringField
      FieldName = 'HIS_CODIGOBAIXA'
      FixedChar = True
      Size = 13
    end
    object cdsHistoricoHIS_VENDEDOR: TIntegerField
      FieldName = 'HIS_VENDEDOR'
    end
  end
  object dstListaAtendimento: TSQLDataSet
    CommandText = 
      'select A.AGE_ID, A.AGE_DTMOVI, A.AGE_CLIENTE, CL.CLI_NOME,'#13#10'A.AG' +
      'E_DTATENDIMENTO, A.AGE_HOATENDIMENTO, A.AGE_SITUACAO,'#13#10'A.AGE_FUN' +
      'CIONARIO, F.FUN_NOME from AGENDA A'#13#10'INNER JOIN CLIENTES CL ON CL' +
      '.CLI_CODIGO = A.AGE_CLIENTE'#13#10'INNER JOIN FUNCIONARIOS F ON F.FUN_' +
      'CODIGO = A.AGE_FUNCIONARIO'#13#10'where (A.AGE_DTATENDIMENTO = :pDATA)' +
      #13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 344
    Top = 440
  end
  object dspListaAtendimento: TDataSetProvider
    DataSet = dstListaAtendimento
    Options = [poAllowCommandText]
    Left = 416
    Top = 408
  end
  object cdsAtendimentoLista: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaAtendimento'
    Left = 480
    Top = 432
    object cdsAtendimentoListaAGE_ID: TIntegerField
      FieldName = 'AGE_ID'
      Required = True
    end
    object cdsAtendimentoListaAGE_DTMOVI: TDateField
      FieldName = 'AGE_DTMOVI'
      Required = True
    end
    object cdsAtendimentoListaAGE_CLIENTE: TIntegerField
      FieldName = 'AGE_CLIENTE'
    end
    object cdsAtendimentoListaCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Required = True
      Size = 50
    end
    object cdsAtendimentoListaAGE_DTATENDIMENTO: TDateField
      FieldName = 'AGE_DTATENDIMENTO'
    end
    object cdsAtendimentoListaAGE_HOATENDIMENTO: TStringField
      FieldName = 'AGE_HOATENDIMENTO'
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoListaAGE_SITUACAO: TStringField
      FieldName = 'AGE_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsAtendimentoListaAGE_FUNCIONARIO: TIntegerField
      FieldName = 'AGE_FUNCIONARIO'
    end
    object cdsAtendimentoListaFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
  object cdsListaAtendimento: TClientDataSet
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'HORARIO'
        GroupingLevel = 1
        IndexName = 'HORARIO'
        Visible = False
      end>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'HORARIO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'DATA_MOVI'
        DataType = ftDate
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'NOME_CLIENTE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATA_ATEND'
        DataType = ftDate
      end
      item
        Name = 'HORA_ATEND'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FUN_CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'FUN_NOME'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'HORARIO'
        Fields = 'HORARIO'
        GroupingLevel = 1
      end>
    IndexName = 'HORARIO'
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 136
    Data = {
      070100009619E0BD01000000180000000A000000000003000000070107484F52
      4152494F010049000000010005574944544802000200050006434F4449474F04
      0001000000000009444154415F4D4F5649040006000000000007434C49454E54
      4504000100000000000C4E4F4D455F434C49454E544501004900000001000557
      494454480200020032000A444154415F4154454E4404000600000000000A484F
      52415F4154454E44010049000000010005574944544802000200050008534954
      554143414F01004900000001000557494454480200020001000A46554E5F434F
      4449474F04000100000000000846554E5F4E4F4D450100490000000100055749
      4454480200020028000000}
    object cdsListaAtendimentoHORARIO: TStringField
      Alignment = taCenter
      FieldName = 'HORARIO'
      OnGetText = cdsListaAtendimentoHORARIOGetText
      EditMask = '99:99;1;_'
      Size = 5
    end
    object cdsListaAtendimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsListaAtendimentoDATA_MOVI: TDateField
      FieldName = 'DATA_MOVI'
    end
    object cdsListaAtendimentoCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object cdsListaAtendimentoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsListaAtendimentoDATA_ATEND: TDateField
      FieldName = 'DATA_ATEND'
    end
    object cdsListaAtendimentoHORA_ATEND: TStringField
      Alignment = taCenter
      FieldName = 'HORA_ATEND'
      EditMask = '99:99;1;_'
      Size = 5
    end
    object cdsListaAtendimentoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object cdsListaAtendimentoFUN_CODIGO: TIntegerField
      FieldName = 'FUN_CODIGO'
    end
    object cdsListaAtendimentoFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 40
    end
  end
  object dstCarta: TSQLDataSet
    CommandText = 'select * from CARTAS Where (CAR_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 560
    Top = 24
    object dstCartaCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCartaCAR_DESCRICAO: TStringField
      FieldName = 'CAR_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 45
    end
    object dstCartaCAR_TITULO: TStringField
      FieldName = 'CAR_TITULO'
      ProviderFlags = [pfInUpdate]
      Size = 35
    end
    object dstCartaCAR_TEXTO: TMemoField
      FieldName = 'CAR_TEXTO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
  end
  object dspCarta: TDataSetProvider
    DataSet = dstCarta
    Options = [poAllowCommandText]
    Left = 560
    Top = 72
  end
  object cdsCarta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCarta'
    Left = 560
    Top = 128
    object cdsCartaCAR_CODIGO: TIntegerField
      FieldName = 'CAR_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsCartaCAR_DESCRICAO: TStringField
      FieldName = 'CAR_DESCRICAO'
      Required = True
      Size = 45
    end
    object cdsCartaCAR_TITULO: TStringField
      FieldName = 'CAR_TITULO'
      Size = 35
    end
    object cdsCartaCAR_TEXTO: TMemoField
      FieldName = 'CAR_TEXTO'
      BlobType = ftMemo
    end
  end
  object dstCargo: TSQLDataSet
    CommandText = 'select * from TIPO_FUNCIONARIO Where (TFU_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 32
    Top = 472
    object dstCargoTFU_CODIGO: TIntegerField
      FieldName = 'TFU_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCargoTFU_DESCRICAO: TStringField
      FieldName = 'TFU_DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCargoTFU_SIGLA: TStringField
      FieldName = 'TFU_SIGLA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspCargo: TDataSetProvider
    DataSet = dstCargo
    Options = [poAllowCommandText]
    OnGetTableName = dspCargoGetTableName
    Left = 96
    Top = 464
  end
  object cdsCargo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCargo'
    Left = 152
    Top = 472
    object cdsCargoTFU_CODIGO: TIntegerField
      FieldName = 'TFU_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsCargoTFU_DESCRICAO: TStringField
      FieldName = 'TFU_DESCRICAO'
    end
    object cdsCargoTFU_SIGLA: TStringField
      FieldName = 'TFU_SIGLA'
      FixedChar = True
      Size = 1
    end
  end
  object dstUnidade: TSQLDataSet
    CommandText = 'select * from UNIDADES Where (UND_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 224
    Top = 400
    object dstUnidadeUND_CODIGO: TStringField
      FieldName = 'UND_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 2
    end
    object dstUnidadeUND_DESCRICAO: TStringField
      FieldName = 'UND_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
    end
  end
  object dstNatureza: TSQLDataSet
    CommandText = 'select * from NATUREZA Where (NAT_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 552
    Top = 192
    object dstNaturezaNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstNaturezaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstNaturezaNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstNaturezaNAT_FLDESC: TStringField
      FieldName = 'NAT_FLDESC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dstModalidade: TSQLDataSet
    CommandText = 'select * from MODALIDADE Where (MOD_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConexao
    Left = 576
    Top = 312
    object dstModalidadeMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object dstModalidadeMOD_PECOMISSAO: TBCDField
      FieldName = 'MOD_PECOMISSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 2
    end
    object dstModalidadeMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstModalidadeMOD_NRPARCELA: TIntegerField
      FieldName = 'MOD_NRPARCELA'
      ProviderFlags = [pfInUpdate]
    end
    object dstModalidadeMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstModalidadeMOD_CAIXA_GERAL: TIntegerField
      FieldName = 'MOD_CAIXA_GERAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstModalidadeMOD_AVISTA: TStringField
      FieldName = 'MOD_AVISTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstModalidadeMOD_FLXTEF: TStringField
      FieldName = 'MOD_FLXTEF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstModalidadeMOD_PASTA_ENVIA_TEF: TStringField
      FieldName = 'MOD_PASTA_ENVIA_TEF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstModalidadeMOD_PASTA_RECEBE_TEF: TStringField
      FieldName = 'MOD_PASTA_RECEBE_TEF'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object dspUnidade: TDataSetProvider
    DataSet = dstUnidade
    Options = [poAllowCommandText]
    OnGetTableName = dspUnidadeGetTableName
    Left = 288
    Top = 392
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspUnidade'
    Left = 256
    Top = 448
    object cdsUnidadeUND_CODIGO: TStringField
      FieldName = 'UND_CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsUnidadeUND_DESCRICAO: TStringField
      FieldName = 'UND_DESCRICAO'
      Required = True
      FixedChar = True
    end
  end
  object dspNatureza: TDataSetProvider
    DataSet = dstNatureza
    Options = [poAllowCommandText]
    OnGetTableName = dspNaturezaGetTableName
    Left = 616
    Top = 192
  end
  object cdsNatureza: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspNatureza'
    Left = 584
    Top = 248
    object cdsNaturezaNAT_CODIGO: TIntegerField
      FieldName = 'NAT_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsNaturezaNAT_NOME: TStringField
      FieldName = 'NAT_NOME'
      Size = 30
    end
    object cdsNaturezaNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsNaturezaNAT_FLDESC: TStringField
      FieldName = 'NAT_FLDESC'
      FixedChar = True
      Size = 1
    end
  end
  object dspModalidade: TDataSetProvider
    DataSet = dstModalidade
    Options = [poAllowCommandText]
    OnGetTableName = dspModalidadeGetTableName
    Left = 584
    Top = 376
  end
  object cdsModalidade: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspModalidade'
    Left = 640
    Top = 344
    object cdsModalidadeMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsModalidadeMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Required = True
      Size = 30
    end
    object cdsModalidadeMOD_PECOMISSAO: TBCDField
      FieldName = 'MOD_PECOMISSAO'
      Precision = 9
      Size = 2
    end
    object cdsModalidadeMOD_ABREVIACAO: TStringField
      FieldName = 'MOD_ABREVIACAO'
      FixedChar = True
      Size = 3
    end
    object cdsModalidadeMOD_NRPARCELA: TIntegerField
      FieldName = 'MOD_NRPARCELA'
    end
    object cdsModalidadeMOD_FLFIXA: TStringField
      FieldName = 'MOD_FLFIXA'
      FixedChar = True
      Size = 1
    end
    object cdsModalidadeMOD_CAIXA_GERAL: TIntegerField
      FieldName = 'MOD_CAIXA_GERAL'
    end
    object cdsModalidadeMOD_AVISTA: TStringField
      FieldName = 'MOD_AVISTA'
      FixedChar = True
      Size = 1
    end
    object cdsModalidadeMOD_FLXTEF: TStringField
      FieldName = 'MOD_FLXTEF'
      FixedChar = True
      Size = 1
    end
    object cdsModalidadeMOD_PASTA_ENVIA_TEF: TStringField
      FieldName = 'MOD_PASTA_ENVIA_TEF'
      Size = 60
    end
    object cdsModalidadeMOD_PASTA_RECEBE_TEF: TStringField
      FieldName = 'MOD_PASTA_RECEBE_TEF'
      Size = 60
    end
  end
  object cdsAcessoMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 616
    Top = 421
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 216
    Top = 80
  end
  object cdsAcessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPadrao'
    Left = 360
    Top = 376
  end
  object cdsPermissoes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 632
    Top = 24
  end
  object cdsGetNomeMenu: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 632
    Top = 80
  end
  object cdsConsulta2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pSITUACAO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspPadrao'
    Left = 632
    Top = 136
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 40
    Data = {
      E80000009619E0BD010000001800000007000000000003000000E8000D504152
      5F4E5250415243454C4104000100000000000E5041525F56454E43494D454E54
      4F0400060000000000095041525F56414C4F5208000400000001000753554254
      5950450200490006004D6F6E657900095041525F42414E434F01004900000001
      000557494454480200020003000B5041525F4147454E43494101004900000001
      00055749445448020002000500095041525F434F4E5441010049000000010005
      5749445448020002000C000A5041525F43484551554501004900000001000557
      49445448020002000A000000}
    object cdsParcelasPAR_NRPARCELA: TIntegerField
      FieldName = 'PAR_NRPARCELA'
      DisplayFormat = '00'
    end
    object cdsParcelasPAR_VENCIMENTO: TDateField
      FieldName = 'PAR_VENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasPAR_VALOR: TCurrencyField
      FieldName = 'PAR_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
    end
    object cdsParcelasPAR_BANCO: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_BANCO'
      EditMask = '999;0;_'
      Size = 3
    end
    object cdsParcelasPAR_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_AGENCIA'
      EditMask = '99999-A;0;_'
      Size = 6
    end
    object cdsParcelasPAR_CONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CONTA'
      EditMask = '9999999999;0;_'
      Size = 12
    end
    object cdsParcelasPAR_CHEQUE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CHEQUE'
      EditMask = '9999999999;0;_'
      Size = 10
    end
  end
  object cdsParcelasVenda: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 104
    Data = {
      160100009619E0BD01000000180000000900000000000300000016010D504152
      5F4E5250415243454C4104000100000000000E5041525F56454E43494D454E54
      4F0400060000000000095041525F56414C4F5208000400000001000753554254
      5950450200490006004D6F6E657900095041525F42414E434F01004900000001
      000557494454480200020003000B5041525F4147454E43494101004900000001
      00055749445448020002000500095041525F434F4E5441010049000000010005
      5749445448020002000C000A5041525F43484551554501004900000001000557
      49445448020002000A000E5041525F515450415243454C415304000100000000
      000E5041525F4D4F44414C494441444504000100000000000000}
    object cdsParcelasVendaPAR_NRPARCELA: TIntegerField
      FieldName = 'PAR_NRPARCELA'
      DisplayFormat = '00'
    end
    object cdsParcelasVendaPAR_VENCIMENTO: TDateField
      FieldName = 'PAR_VENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object cdsParcelasVendaPAR_VALOR: TCurrencyField
      FieldName = 'PAR_VALOR'
      DisplayFormat = '###,###,##0.#0'
      EditFormat = '###,###,##0.#0'
    end
    object cdsParcelasVendaPAR_BANCO: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_BANCO'
      EditMask = '999;0;_'
      Size = 3
    end
    object cdsParcelasVendaPAR_AGENCIA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_AGENCIA'
      EditMask = '9999-A;0;_'
      Size = 5
    end
    object cdsParcelasVendaPAR_CONTA: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CONTA'
      EditMask = '9999999999;0;_'
      Size = 12
    end
    object cdsParcelasVendaPAR_CHEQUE: TStringField
      Alignment = taRightJustify
      FieldName = 'PAR_CHEQUE'
      EditMask = '9999999999;0;_'
      Size = 10
    end
    object cdsParcelasVendaPAR_QTPARCELAS: TIntegerField
      FieldName = 'PAR_QTPARCELAS'
    end
    object cdsParcelasVendaPAR_MODALIDADE: TIntegerField
      FieldName = 'PAR_MODALIDADE'
    end
  end
  object dstVenda: TSQLDataSet
    CommandText = 
      'select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO) and (MOV_LOJA' +
      ' = :pLOJA)'
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
    SQLConnection = sqlConexao
    Left = 320
    Top = 496
  end
  object dspVenda: TDataSetProvider
    DataSet = dstVenda
    Options = [poAllowCommandText]
    OnGetTableName = dspVendaGetTableName
    Left = 392
    Top = 488
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
    Left = 456
    Top = 496
    object cdsVendaMOV_PEDIDO: TIntegerField
      FieldName = 'MOV_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaMOV_CUPOM: TIntegerField
      FieldName = 'MOV_CUPOM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_SEQUENCIA: TIntegerField
      FieldName = 'MOV_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_CLIENTE: TIntegerField
      FieldName = 'MOV_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_DATAVENDA: TDateField
      FieldName = 'MOV_DATAVENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaMOV_HORAVENDA: TStringField
      FieldName = 'MOV_HORAVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsVendaMOV_DATACANC: TDateField
      FieldName = 'MOV_DATACANC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_HORACANC: TStringField
      FieldName = 'MOV_HORACANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsVendaMOV_MOTCANC: TStringField
      FieldName = 'MOV_MOTCANC'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsVendaMOV_VENDEDOR: TIntegerField
      FieldName = 'MOV_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_ENTRADA: TFMTBCDField
      FieldName = 'MOV_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_DESCONTO: TFMTBCDField
      FieldName = 'MOV_DESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_ACRESCIMO: TFMTBCDField
      FieldName = 'MOV_ACRESCIMO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_DEVOLUSAO: TFMTBCDField
      FieldName = 'MOV_DEVOLUSAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_TROCO: TFMTBCDField
      FieldName = 'MOV_TROCO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsVendaDOM_ENDERECO: TStringField
      FieldName = 'DOM_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsVendaDOM_NUMERO: TStringField
      FieldName = 'DOM_NUMERO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsVendaDOM_COMPLEMENTO: TStringField
      FieldName = 'DOM_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsVendaDOM_BAIRRO: TStringField
      FieldName = 'DOM_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsVendaDOM_CIDADE: TStringField
      FieldName = 'DOM_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaDOM_REFERE: TStringField
      FieldName = 'DOM_REFERE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsVendaDOM_NRFONE: TStringField
      FieldName = 'DOM_NRFONE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsVendaMOV_NOMECLIENTE: TStringField
      FieldName = 'MOV_NOMECLIENTE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsVendaMOV_TABELA: TIntegerField
      FieldName = 'MOV_TABELA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_TIPO_FRETE: TStringField
      FieldName = 'MOV_TIPO_FRETE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsVendaMOV_PERC_FRETE: TFMTBCDField
      FieldName = 'MOV_PERC_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsVendaMOV_IDTRANSPORTADORA: TIntegerField
      FieldName = 'MOV_IDTRANSPORTADORA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_TABELA_PLANO: TIntegerField
      FieldName = 'MOV_TABELA_PLANO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_OBSERVACAO: TMemoField
      FieldName = 'MOV_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsVendaMOV_MODALIDADE_PEDIDO: TIntegerField
      FieldName = 'MOV_MODALIDADE_PEDIDO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaMOV_OBS1: TMemoField
      FieldName = 'MOV_OBS1'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object cdsVendaMOV_OBS2: TMemoField
      FieldName = 'MOV_OBS2'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
  end
  object ppRepAtendimento: TppReport
    AutoStop = False
    DataPipeline = ppDBPAtendimento
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
    Left = 592
    Top = 472
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPAtendimento'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47361
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
      object ppLine2: TppLine
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 794
        mmTop = 38894
        mmWidth = 195527
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 220134
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'AGE_DTATENDIMENTO'
        DataPipeline = ppDBPAtendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPAtendimento'
        mmHeight = 4022
        mmLeft = 6615
        mmTop = 18256
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'AGE_HOATENDIMENTO'
        DataPipeline = ppDBPAtendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPAtendimento'
        mmHeight = 4022
        mmLeft = 30692
        mmTop = 18256
        mmWidth = 11113
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'AGE_DIAGNOSTICO'
        DataPipeline = ppDBPAtendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taFullJustified
        Transparent = True
        DataPipelineName = 'ppDBPAtendimento'
        mmHeight = 69321
        mmLeft = 6615
        mmTop = 28575
        mmWidth = 171450
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'AGE_DESCRICAO'
        DataPipeline = ppDBPAtendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taFullJustified
        Transparent = True
        DataPipelineName = 'ppDBPAtendimento'
        mmHeight = 69321
        mmLeft = 6615
        mmTop = 110861
        mmWidth = 171450
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Diagnostico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 23813
        mmWidth = 20151
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Tratamento realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 105834
        mmWidth = 35433
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 13229
        mmWidth = 7620
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 2646
        mmWidth = 11726
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 49477
        mmTop = 13229
        mmWidth = 20151
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ATE_NMFUNCIONARIO'
        DataPipeline = ppDBPAtendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPAtendimento'
        mmHeight = 3969
        mmLeft = 49477
        mmTop = 18256
        mmWidth = 128059
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 30692
        mmTop = 13229
        mmWidth = 8001
        BandType = 4
      end
      object txtCliente: TppLabel
        UserName = 'txtCliente'
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 7673
        mmWidth = 171186
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
  end
  object ppDBPAtendimento: TppDBPipeline
    DataSource = dsAtendimento
    UserName = 'DBPAtendimento'
    Left = 664
    Top = 488
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_ID'
      FieldName = 'AGE_ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'AGE_DTMOVI'
      FieldName = 'AGE_DTMOVI'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'AGE_HOMOVI'
      FieldName = 'AGE_HOMOVI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_CLIENTE'
      FieldName = 'AGE_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'AGE_DTATENDIMENTO'
      FieldName = 'AGE_DTATENDIMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'AGE_HOATENDIMENTO'
      FieldName = 'AGE_HOATENDIMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'AGE_SITUACAO'
      FieldName = 'AGE_SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_FUNCIONARIO'
      FieldName = 'AGE_FUNCIONARIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'AGE_DESCRICAO'
      FieldName = 'AGE_DESCRICAO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'AGE_DIAGNOSTICO'
      FieldName = 'AGE_DIAGNOSTICO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'AGE_OBSERVACAO'
      FieldName = 'AGE_OBSERVACAO'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_USCADA'
      FieldName = 'AGE_USCADA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'AGE_DTALTE'
      FieldName = 'AGE_DTALTE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'AGE_HOALTE'
      FieldName = 'AGE_HOALTE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGE_USALTE'
      FieldName = 'AGE_USALTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'ATE_NMFUNCIONARIO'
      FieldName = 'ATE_NMFUNCIONARIO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'AGE_DTCANCELAMENTO'
      FieldName = 'AGE_DTCANCELAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'AGE_HOCANCELAMENTO'
      FieldName = 'AGE_HOCANCELAMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'AGE_DTREMARCAMENTO'
      FieldName = 'AGE_DTREMARCAMENTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'AGE_HOREMARCAMENTO'
      FieldName = 'AGE_HOREMARCAMENTO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 19
    end
  end
  object dsAtendimento: TDataSource
    DataSet = cdsAtendimento
    Left = 520
    Top = 488
  end
end
