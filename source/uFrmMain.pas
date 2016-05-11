unit uFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, FMTBcd, DB, SqlExpr, Buttons, ImgList,
  jpeg;

type
  TfrmMain = class(TForm)
    mmPrincipal: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuMovimento: TMenuItem;
    mnuFinanceiro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuUtilitarios: TMenuItem;
    mnuAjuda: TMenuItem;
    pnlBarra: TPanel;
    imgLogon: TImage;
    Info: TStatusBar;
    dataSetAux: TSQLDataSet;
    dataSetAux2: TSQLDataSet;
    Timer1: TTimer;
    mnuSobreItem: TMenuItem;
    mnuClientesItem: TMenuItem;
    mnuFuncionariosItem: TMenuItem;
    mnuUsuariosItem: TMenuItem;
    abela1: TMenuItem;
    mnuCidadesItens: TMenuItem;
    mnuBairrosItens: TMenuItem;
    mnuContasaPagarItem: TMenuItem;
    mnuContasaReceberItem: TMenuItem;
    mnuFornecedoresItem: TMenuItem;
    N1: TMenuItem;
    mnuSairItem: TMenuItem;
    mnuIncluirCPItem: TMenuItem;
    mnuManutencaoPagaSubItem: TMenuItem;
    mnuInclusaoCRSubItem: TMenuItem;
    mnuManutencaoRecSubItem: TMenuItem;
    mnuAgendaItem: TMenuItem;
    mnuProdutosItem: TMenuItem;
    mnuListaAcompanhamentodeAgendaItem: TMenuItem;
    N2: TMenuItem;
    mnuEstoqueItem: TMenuItem;
    mnuInvertrioItem: TMenuItem;
    Consulta1: TMenuItem;
    mnuCadastrosRelItem: TMenuItem;
    mnuRelClientesSubItem: TMenuItem;
    Cartas1: TMenuItem;
    Movimentos1: TMenuItem;
    Financeiros1: TMenuItem;
    Aniverasiantes1: TMenuItem;
    mnuClientescomTratamentoInterrompidoItem: TMenuItem;
    mnuInaticosItem: TMenuItem;
    mnuRelaodeContasPagarItem: TMenuItem;
    mnuRelaodeContasReceberItem: TMenuItem;
    mnuRelaodeAtendimentoSubItem: TMenuItem;
    mnuMediadeAtendimentoSubItem: TMenuItem;
    mnuRelaodeFornecedoresSubItem: TMenuItem;
    mnuRelaodeFuncionriosSubItem: TMenuItem;
    mnuRelacaodeProdutoSubItem: TMenuItem;
    mnuCartasSubItem: TMenuItem;
    mnuCargosItem: TMenuItem;
    mnuUnidadesSubItem: TMenuItem;
    mnuNaturezasItem: TMenuItem;
    mnuModalidadesSubItem: TMenuItem;
    ImageList1: TImageList;
    spClientes: TSpeedButton;
    spFuncionarios: TSpeedButton;
    spFornecedores: TSpeedButton;
    spProdutos: TSpeedButton;
    spLista: TSpeedButton;
    spAgenda: TSpeedButton;
    spSair: TSpeedButton;
    EntradadeProdutos1: TMenuItem;
    mnuVendasItem: TMenuItem;
    spVenda: TSpeedButton;
    mnuConsultaItem: TMenuItem;
    mnuBancosSubItem: TMenuItem;
    N3: TMenuItem;
    Configuraes1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnuUsuariosItemClick(Sender: TObject);
    procedure mnuClientesItemClick(Sender: TObject);
    procedure mnuCidadesItensClick(Sender: TObject);
    procedure mnuBairrosItensClick(Sender: TObject);
    procedure mnuFuncionariosItemClick(Sender: TObject);
    procedure mnuFornecedoresItemClick(Sender: TObject);
    procedure mnuAgendaItemClick(Sender: TObject);
    procedure mnuProdutosItemClick(Sender: TObject);
    procedure mnuInvertrioItemClick(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure mnuListaAcompanhamentodeAgendaItemClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuIncluirCPItemClick(Sender: TObject);
    procedure mnuInclusaoCRSubItemClick(Sender: TObject);
    procedure mnuManutencaoPagaSubItemClick(Sender: TObject);
    procedure mnuManutencaoRecSubItemClick(Sender: TObject);
    procedure mnuSairItemClick(Sender: TObject);
    procedure Aniverasiantes1Click(Sender: TObject);
    procedure mnuRelClientesSubItemClick(Sender: TObject);
    procedure mnuRelacaodeProdutoSubItemClick(Sender: TObject);
    procedure mnuRelaodeFuncionriosSubItemClick(Sender: TObject);
    procedure mnuRelaodeFornecedoresSubItemClick(Sender: TObject);
    procedure mnuRelaodeAtendimentoSubItemClick(Sender: TObject);
    procedure mnuRelaodeContasPagarItemClick(Sender: TObject);
    procedure mnuRelaodeContasReceberItemClick(Sender: TObject);
    procedure mnuCartasSubItemClick(Sender: TObject);
    procedure mnuCargosItemClick(Sender: TObject);
    procedure mnuUnidadesSubItemClick(Sender: TObject);
    procedure mnuNaturezasItemClick(Sender: TObject);
    procedure mnuModalidadesSubItemClick(Sender: TObject);
    procedure spSairClick(Sender: TObject);
    procedure EntradadeProdutos1Click(Sender: TObject);
    procedure mnuVendasItemClick(Sender: TObject);
    procedure spClientesClick(Sender: TObject);
    procedure spAgendaClick(Sender: TObject);
    procedure spListaClick(Sender: TObject);
    procedure spFuncionariosClick(Sender: TObject);
    procedure spVendaClick(Sender: TObject);
    procedure mnuInaticosItemClick(Sender: TObject);
    procedure mnuConsultaItemClick(Sender: TObject);
    procedure mnuBancosSubItemClick(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure mnuSobreItemClick(Sender: TObject);
    procedure mnuClientescomTratamentoInterrompidoItemClick(
      Sender: TObject);
    procedure mnuMediadeAtendimentoSubItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure IMAGEM_LOGO;
    procedure DisplayHint(Sender: TObject);
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
  public
    { Public declarations }
    Procedure AbreForm(aClasseForm: TComponentClass; aForm : TForm);
    procedure VerificaOpcoesMenu(const menu : TMenuItem);
    procedure VerificaAcessoSubMenu(const menu : TMenuItem);
    Function VerificarAcesso(const codMenu : Integer) : Boolean;
    Procedure Limpar_Acessos;
    function AdicionaHora(TimeAdd: Integer) : String;
  end;

const
     ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
     ScreenHeight: LongInt = 600;
     M_USERMASTER = '001';
     M_SNMASTER   = 'ADMG2';

var
  frmMain: TfrmMain;
  M_CDUSUA, M_NMUSUA, M_SNATUA, M_NMAQUI : String;
  admin : Boolean;
  aNovo, aAlterar, aApagar : string;
  codUsuario, codMenu : Integer;

implementation

uses uFrmCadUsuarios, uFrmCadClientes, uFrmCadCidades, uFrmBairros,
  uFrmCadFuncionario, uFrmFornecedores, uFrmAtendimento, uFrmCadProdutos,
  uFrmInvertario, uFrmConsEstoque, uFrmListaAtendimentos,
  uFrmCadContaPagar, uFrmCadContaReceber, uFrmManuContaPagar,
  uFrmManuContaReceber, frmNewListaAtendimentos, uFrmRelAnivesariante,
  ufrmRelClientes, uFrmRelProdutos, uFrmRelFuncionarios,
  uFrmRelFornecedores, uFrmRelAtendimentos, uFrmRelCPagar, uFrmRelCReceber,
  uFrmCadCartas, uFrmCadCargos, uFrmCadUnidades, uFrmCadNaturezas,
  uFrmCadModalidade, uFuncoes, udmDados, uFrmCadEntradaMercadoria,
  uFrmVendas, uFrmRelCartaInativo, uFrmConsultaCliente, uFrmBancos,
  FrmConfig, uFrmSobre, uFrmRelClientesInterropido, uFrmRelVendas;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
      Application.CreateForm(aClasseForm, aForm);
      try
          aForm.ShowModal;
      Finally
          aForm.Free;
      End;
end;

procedure TfrmMain.DisplayHint(Sender: TObject);
begin
     info.Panels[1].Text := Application.Hint;
end;

procedure TfrmMain.IMAGEM_LOGO;
begin
    If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
        imgLogon.Picture.LoadFromFile(ExtractFilePath( Application.ExeName )+'logo.bmp');
end;

procedure TfrmMain.SetJustify(Menu: TMenu; MenuItem: TMenuItem;
  Justify: Byte);
var
    ItemInfo: TMenuItemInfo;
    Buffer: array[0..80] of Char;
begin
     ItemInfo.cbSize := SizeOf(TMenuItemInfo);
     ItemInfo.fMask := MIIM_TYPE;
     ItemInfo.dwTypeData := Buffer;
     ItemInfo.cch := SizeOf(Buffer);
     //
     GetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
     if Justify = 1 then
        ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
     SetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);

end;

procedure TfrmMain.FormShow(Sender: TObject);
Var
    i : integer;
begin
    //
    Info.Panels[0].Text := uFuncoes.StrZero(M_CDUSUA,3) + ' - '+ M_NMUSUA;
    //
    if (admin) OR (StrtoInt(M_CDUSUA) = 1) Then
        Exit
    Else
        for i := 0 to Pred(mmPrincipal.Items.Count) do
           VerificaAcessoSubMenu(mmPrincipal.Items[i]);
    //
    spClientes.Enabled      := mnuClientesItem.Enabled;
    spFuncionarios.Enabled  := mnuFuncionariosItem.Enabled;
    spFornecedores.Enabled  := mnuFornecedoresItem.Enabled;
    spProdutos.Enabled      := mnuProdutosItem.Enabled;
    spAgenda.Enabled        := mnuAgendaItem.Enabled;
    spLista.Enabled         := mnuListaAcompanhamentodeAgendaItem.Enabled;
    spVenda.Enabled         := mnuVendasItem.Enabled;
    //
    IMAGEM_LOGO;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
    Info.Panels[2].Text := 'Data : '+DatetoStr(Date()) + ' - Hora : '+TimetoStr(Time());
end;

procedure TfrmMain.FormCreate(Sender: TObject);
Var
	i : integer;
  M_DTEXPI : Tdate;
begin
      DecimalSeparator  := ',';        // determina o separador decimal de n�meros.
      ThousandSeparator := '.';       // define o separador de milhar de um n�mero.
      //
      scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;
      //
    	with dataSetAux do
  		begin
  			close;
  			CommandText :=
  				'Update MENUS Set MEN_EXISTE = '+QuotedStr('F');
  			ExecSQL(True);
  		End;
      //
  		for i := 0 to Pred(mmPrincipal.Items.Count) do
  			VerificaOpcoesMenu(mmPrincipal.Items[i]);

  		with dataSetAux do
  		begin
  			close;
  			CommandText :=
  				'Delete from MENUS where MEN_EXISTE = '+QuotedStr('F');
  			ExecSQL(True);
  		End;
      //
      if FileExists(ExtractFilePath( Application.ExeName) +'logo2.jpeg') Then
           imgLogon.Picture.LoadFromFile(ExtractFilePath( Application.ExeName +'logo2.jpeg'));

      //
      Application.OnHint := DisplayHint;
      SetJustify(mmPrincipal,mnuAjuda,1);
      //
      imgLogon.Left := (frmMain.Width Div 2) - (imgLogon.Width Div 2);
      imgLogon.Top  := (frmMain.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
      //
      Timer1.Enabled := True;
      //
      Application.OnHint := DisplayHint;
      SetJustify(mmPrincipal,mnuAjuda,1);
      ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
     imgLogon.Left := (frmMain.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top  := (frmMain.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
end;

procedure TfrmMain.mnuUsuariosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadUsuarios, frmCadUsuarios);
end;

procedure TfrmMain.mnuClientesItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadClientes, frmCadClientes);
end;

procedure TfrmMain.mnuCidadesItensClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadCidades, frmCadCidades);
end;

procedure TfrmMain.mnuBairrosItensClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadBairros, frmCadBairros);
end;

procedure TfrmMain.mnuFuncionariosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadFuncionario, frmCadFuncionario);
end;

procedure TfrmMain.mnuFornecedoresItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadFornecedores, frmCadFornecedores);
end;

procedure TfrmMain.mnuAgendaItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadAtendimento, frmCadAtendimento);
end;

procedure TfrmMain.mnuProdutosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadProdutos, frmCadProdutos);
end;

procedure TfrmMain.mnuInvertrioItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmInvertario, frmInvertario);
end;

procedure TfrmMain.Consulta1Click(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmConsEstoque, frmConsEstoque);
end;

procedure TfrmMain.mnuListaAcompanhamentodeAgendaItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
      //AbreForm(TfrmListaAtendimentos, frmListaAtendimentos);
      AbreForm(TfrmNewAgenda, frmNewAgenda);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     If Application.MessageBox('Sair do Sistema?',
        'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
           Canclose := False;
end;

procedure TfrmMain.mnuIncluirCPItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     { Application.CreateForm(TfrmCadContaPagar, frmCadContaPagar);
      try
          frmCadContaPagar.ShowModal;
      Finally
          frmCadContaPagar.Free;
      End;}
      AbreForm(TfrmCadContaPagar, frmCadContaPagar);
end;

procedure TfrmMain.mnuInclusaoCRSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadCReceber, frmCadCReceber);
end;

procedure TfrmMain.mnuManutencaoPagaSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmManuContasPagar, frmManuContasPagar);
end;

procedure TfrmMain.mnuManutencaoRecSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmManuCReceber, frmManuCReceber);
end;

procedure TfrmMain.mnuSairItemClick(Sender: TObject);
begin
     If Application.MessageBox('Sair do Sistema?',
        'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
            application.Terminate;
end;

procedure TfrmMain.Aniverasiantes1Click(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelAniveriantes, frmRelAniveriantes);
end;

procedure TfrmMain.mnuRelClientesSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelClientes, frmRelClientes);
end;

procedure TfrmMain.mnuRelacaodeProdutoSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelProdutos, frmRelProdutos);
end;

procedure TfrmMain.mnuRelaodeFuncionriosSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelFuncionarios, frmRelFuncionarios);
end;

procedure TfrmMain.mnuRelaodeFornecedoresSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelFornedores, frmRelFornedores);
end;

procedure TfrmMain.mnuRelaodeAtendimentoSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelAtendimentos, frmRelAtendimentos);
end;

procedure TfrmMain.mnuRelaodeContasPagarItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelCPagar, frmRelCPagar);
end;

procedure TfrmMain.mnuRelaodeContasReceberItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelCReceber, frmRelCReceber);
end;

procedure TfrmMain.mnuCartasSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadCartas, frmCadCartas);
end;

procedure TfrmMain.mnuCargosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadCargos, frmCadCargos);
end;

procedure TfrmMain.mnuUnidadesSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadUnidades, frmCadUnidades);
end;

procedure TfrmMain.mnuNaturezasItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
    AbreForm(TfrmCadNatureza, frmCadNatureza);
end;

procedure TfrmMain.mnuModalidadesSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadModalidades, frmCadModalidades);
end;

procedure TfrmMain.Limpar_Acessos;
begin
     aNovo    := '';
     aAlterar := '';
     aApagar  := '';
end;

procedure TfrmMain.VerificaAcessoSubMenu(const menu: TMenuItem);
Var
   i : Integer;
begin
     if not VerificarAcesso(retornarCodMenu(
       RetirarCarecterAtalho(menu.Caption))) then
          menu.Enabled := False;
     //
     for i := 0 to Pred(menu.Count) do
      VerificaAcessoSubMenu(menu.Items[i]);
end;

procedure TfrmMain.VerificaOpcoesMenu(const menu: TMenuItem);
var
	i, seq, codMenu, codMenuPai : Integer;
begin
	with dataSetAux do
	begin
		close;
		CommandText := 
			'Select MEN_CODIGO from MENUS Where MEN_NOME = '+
                        QuotedStr(Trim(RetirarCarecterAtalho(menu.Caption)));
		Open;	
		if IsEmpty Then
		begin
			seq := retornaProximoCodigoMenu;
			if Assigned(menu.Parent) and
                           (menu.Parent.Caption <> '') Then
			begin
				codMenuPai := retornarCodMenu(Trim(
				RetirarCarecterAtalho(menu.Parent.Caption)));
				Close;
				CommandText := 'INSERT INTO MENUS (MEN_CODIGO, MEN_NOME, '+
					'MEN_CODIGOPAI, MEN_EXISTE) VALUES ('+
					InttoStr(seq) +', '+
					QuotedStr(Trim(RetirarCarecterAtalho(menu.Caption))) + ', '+
					intToStr(codMenuPai) + ', '+QuotedStr('T')+')';
			End
			else
			begin
				Close;
				CommandText := 'INSERT INTO MENUS (MEN_CODIGO, MEN_NOME, '+
					'MEN_EXISTE) VALUES ('+		
					InttoStr(seq) +', '+
					QuotedStr(Trim(RetirarCarecterAtalho(menu.Caption))) +
					', '+QuotedStr('T')+')';
			end;
			ExecSQL(True);
		End
		Else
		begin
			codMenu := Fields[0].AsInteger;
			close;
			CommandText :=
				'UpDate MENUS SET MEN_EXISTE = '+QuotedStr('T')+
				'WHERE MEN_CODIGO = '+ IntToStr(codMenu);
			ExecSQL(True);
		End;		

	End; // fim-with	dataSetAux
	for i := 0 to Pred(menu.Count) do
		verificaOpcoesMenu(menu.Items[i]);
end;

function TfrmMain.VerificarAcesso(const codMenu: Integer): Boolean;
var
   Acesso : string;
begin
      Acesso := DmDados.Verificar_Acesso_Menu(StrToInt(M_CDUSUA), codMenu);
      //
      if (Acesso = 'S') or
           (codMenu = -1) Then
              Result := true
      Else
              Result := False;
     {with dmDados.spAcessoMenu do
     begin
          Close;
          ParamByName('CODUSUARIO').AsInteger := StrToInt(M_CDUSUA);
          ParamByName('CODMENU').AsInteger    := codMenu;
          ExecProc;
          //
          s := ParamByName('CONSULTAR').AsString;
          if (ParamByName('CONSULTAR').AsString = 'S') or
            (codMenu = -1) Then
              Result := true
          Else
              Result := False;
     End;}
end;

procedure TfrmMain.spSairClick(Sender: TObject);
begin
     If Application.MessageBox('Sair do Sistema?',
        'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
            application.Terminate;
end;

procedure TfrmMain.EntradadeProdutos1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadEntrada, frmCadEntrada);
end;

procedure TfrmMain.mnuVendasItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmMovVendas, frmMovVendas);
end;

procedure TfrmMain.spClientesClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadClientes, frmCadClientes);
end;

procedure TfrmMain.spAgendaClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadAtendimento, frmCadAtendimento);
end;

procedure TfrmMain.spListaClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     //AbreForm(TfrmListaAtendimentos, frmListaAtendimentos);
     AbreForm(TfrmNewAgenda, frmNewAgenda);
end;

procedure TfrmMain.spFuncionariosClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadFuncionario, frmCadFuncionario);
end;

procedure TfrmMain.spVendaClick(Sender: TObject);
begin
     AbreForm(TfrmMovVendas, frmMovVendas);
end;

procedure TfrmMain.mnuInaticosItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCartaInativo, frmCartaInativo);
end;

procedure TfrmMain.mnuConsultaItemClick(Sender: TObject);
begin
    if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmConsultaCliente, frmConsultaCliente);
end;

procedure TfrmMain.mnuBancosSubItemClick(Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmCadBancos, frmCadBancos);
end;

procedure TfrmMain.Configuraes1Click(Sender: TObject);
begin
    if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmConfiguracoes, frmConfiguracoes);
end;

procedure TfrmMain.mnuSobreItemClick(Sender: TObject);
begin
     AbreForm(TfrmSobre, frmSobre);
end;

function TfrmMain.AdicionaHora(TimeAdd: Integer): String;
{Adiciona � hora atual um numero de horas determinado. Caso este numero seje negativo, ele subtrair� da hora atual}
Var
Horas,Min,SomaHoras,SomaMin : Integer;
S, S1 : String;
begin
    Horas := Strtoint(Copy(TimetoStr(Time),1,2))+ TimeAdd;
    Min := Strtoint(Copy(TimetoStr(Time),4,2))+ TimeAdd ;
    SomaHoras := SomaHoras+Horas;
    SomaMin := SomaMin + Min;
    If SomaMin > 59 Then
      begin
          if SomaMin mod 60 = 0 Then
            begin
              Somahoras := Somahoras+(Somamin div 60);
              Somamin := 0;
            end
            else
            begin
              SomaHoras := SomaHoras + (SomaMin div 60);
              SomaMin := SomaMin mod 60;
            end;
      end;
    If Somamin = 0 Then
    begin
        S := '00';
    end
    else
    begin
        S := InttoStr(Somamin);
    end;
    If Length(InttoStr(SomaHoras)) = 1 Then
     begin
        S1 := Concat('0',InttoStr(Somahoras));
    end
    else
    begin
        S1 := InttoStr(Somahoras);
    end;
    Result := Concat(S1,':',S,':00');
end;

procedure TfrmMain.mnuClientescomTratamentoInterrompidoItemClick(
  Sender: TObject);
begin
     if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelClientesInterrompido, frmRelClientesInterrompido);
end;

procedure TfrmMain.mnuMediadeAtendimentoSubItemClick(Sender: TObject);
begin
      if Sender is TMenuItem then
        codMenu := retornarCodMenu(RetirarCarecterAtalho(
         ( Sender as TMenuItem).Caption));
     //
     dmDados.Verificar_Direito_Acesso(Strtoint(M_CDUSUA), codMenu);
     //
     AbreForm(TfrmRelVendas, frmRelVendas); 
end;

end.
