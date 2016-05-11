program InfoAtendimento;

uses
  Forms,
  Controls,
  SysUtils,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  udmDados in 'udmDados.pas' {dmDados: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uFrmCadastro in 'uFrmCadastro.pas' {frmCadastro},
  uFrmCadUsuarios in 'uFrmCadUsuarios.pas' {frmCadUsuarios},
  uFrmCadClientes in 'uFrmCadClientes.pas' {frmCadClientes},
  uFrmCadCidades in 'uFrmCadCidades.pas' {frmCadCidades},
  uFrmBairros in 'uFrmBairros.pas' {frmCadBairros},
  uFrmCadFuncionario in 'uFrmCadFuncionario.pas' {frmCadFuncionario},
  uFrmFornecedores in 'uFrmFornecedores.pas' {frmCadFornecedores},
  uFrmAtendimento in 'uFrmAtendimento.pas' {frmCadAtendimento},
  uFrmLocalizar in 'uFrmLocalizar.pas' {frmConsultas},
  uFrmLocClientes in 'uFrmLocClientes.pas' {frmConsClientes},
  uFrmCadProdutos in 'uFrmCadProdutos.pas' {frmCadProdutos},
  uFrmInvertario in 'uFrmInvertario.pas' {frmInvertario},
  uFrmLocalizaProduto in 'uFrmLocalizaProduto.pas' {frmLocProdutos},
  uFrmConsEstoque in 'uFrmConsEstoque.pas' {frmConsEstoque},
  uFrmListaAtendimentos in 'uFrmListaAtendimentos.pas' {frmListaAtendimentos},
  uFrmCadContaPagar in 'uFrmCadContaPagar.pas' {frmCadContaPagar},
  udmFinanceiro in 'udmFinanceiro.pas' {dmFinanceiro: TDataModule},
  uFrmCadContaReceber in 'uFrmCadContaReceber.pas' {frmCadCReceber},
  uFrmManuContaPagar in 'uFrmManuContaPagar.pas' {frmManuContasPagar},
  uFrmEditarBaixaCP in 'uFrmEditarBaixaCP.pas' {frmEditarBaixaCP},
  uFrmManuContaReceber in 'uFrmManuContaReceber.pas' {frmManuCReceber},
  uFrmCReceberEditaBaixa in 'uFrmCReceberEditaBaixa.pas' {frmCReceberEditaBaixa},
  frmNewListaAtendimentos in 'frmNewListaAtendimentos.pas' {frmNewAgenda},
  uFrmRelAnivesariante in 'uFrmRelAnivesariante.pas' {frmRelAniveriantes},
  uFrmRelPadrao in 'uFrmRelPadrao.pas' {frmRelPadrao},
  ufrmRelClientes in 'ufrmRelClientes.pas' {frmRelClientes},
  uFrmRelProdutos in 'uFrmRelProdutos.pas' {frmRelProdutos},
  uFrmRelFuncionarios in 'uFrmRelFuncionarios.pas' {frmRelFuncionarios},
  uFrmRelFornecedores in 'uFrmRelFornecedores.pas' {frmRelFornedores},
  uFrmRelAtendimentos in 'uFrmRelAtendimentos.pas' {frmRelAtendimentos},
  uFrmRelCPagar in 'uFrmRelCPagar.pas' {frmRelCPagar},
  uFrmRelCReceber in 'uFrmRelCReceber.pas' {frmRelCReceber},
  uFrmCadCartas in 'uFrmCadCartas.pas' {frmCadCartas},
  uFrmCadCargos in 'uFrmCadCargos.pas' {frmCadCargos},
  uFrmCadUnidades in 'uFrmCadUnidades.pas' {frmCadUnidades},
  uFrmCadNaturezas in 'uFrmCadNaturezas.pas' {frmCadNatureza},
  uFrmCadModalidade in 'uFrmCadModalidade.pas' {frmCadModalidades},
  uFrmLogon in 'uFrmLogon.pas' {frmLogon},
  uFrmCadPermissoes in 'uFrmCadPermissoes.pas' {frmCadPermissoes},
  uFrmCadEntradaMercadoria in 'uFrmCadEntradaMercadoria.pas' {frmCadEntrada},
  uFrmFecharEntrada in 'uFrmFecharEntrada.pas' {frmFecharEntrada},
  uFrmVendas in 'uFrmVendas.pas' {frmMovVendas},
  uFormaPagamento in 'uFormaPagamento.pas' {frmFormaPagamento},
  uFrmParcelas in 'uFrmParcelas.pas' {frmParcelas},
  uFrmRelCartaInativo in 'uFrmRelCartaInativo.pas' {frmCartaInativo},
  uFrmConsultaCliente in 'uFrmConsultaCliente.pas' {frmConsultaCliente},
  uFrmBancos in 'uFrmBancos.pas' {frmCadBancos},
  FrmConfig in 'FrmConfig.pas' {frmConfiguracoes},
  uFrmSobre in 'uFrmSobre.pas' {frmSobre},
  uFrmRelClientesInterropido in 'uFrmRelClientesInterropido.pas' {frmRelClientesInterrompido},
  uFrmRelVendas in 'uFrmRelVendas.pas' {frmRelVendas},
  uFrmLocFornecedor in 'uFrmLocFornecedor.pas' {frmConsFornecedor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TdmFinanceiro, dmFinanceiro);
  Application.CreateForm(TfrmLogon, frmLogon);
  if frmLogon.ShowModal = mrOk then //Caso o retorno da tela seja Ok
   begin
        FreeAndNil(frmLogon); //Libera o form de Login da memória
        Application.CreateForm(TfrmMain, frmMain);
        Application.Run;
   End
   else //Caso o retorno da tela de Login seja mrCancel então
    begin
        FreeAndNil(frmLogon); //Libera o form de Login da memória
        FreeAndNil(dmFinanceiro);
        FreeAndNil(dmDados);
        Application.Terminate; //Encerra a aplicação
    End;
  Application.Run;
end.
