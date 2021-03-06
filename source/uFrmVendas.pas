unit uFrmVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, BmsXPPageControl, Mask, StdCtrls, ToolEdit,
  Buttons, Grids, DBGrids, DB, DBCtrls, DBClient, CurrEdit;

type
  TfrmMovVendas = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    BmsXPPageControl1: TBmsXPPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlSuperior: TPanel;
    dbeDTVEND: TDateEdit;
    Label1: TLabel;
    edtHora: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblVenda: TLabel;
    dbeCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    edtNMCLIE: TEdit;
    Label4: TLabel;
    grdConsultar: TDBGrid;
    dsDados: TDataSource;
    ClientDataSet1: TClientDataSet;
    Panel2: TPanel;
    Label5: TLabel;
    pnlTOMERC: TPanel;
    Label8: TLabel;
    edtAcrescimo: TCurrencyEdit;
    Label6: TLabel;
    edtDESVAL: TCurrencyEdit;
    Label7: TLabel;
    edtDESPER: TCurrencyEdit;
    Label10: TLabel;
    txtTOVEND: TPanel;
    pnlBotoes: TPanel;
    Label13: TLabel;
    spLocProduto: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    pnlTotal: TPanel;
    dbeCDPROD: TDBEdit;
    dbeQTPROD: TDBEdit;
    dbeValorUnitario: TDBEdit;
    DBEdit2: TDBEdit;
    dbeDescricao: TDBEdit;
    pnlInferior: TPanel;
    btAdicionar: TBitBtn;
    btEditar: TBitBtn;
    BtExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    pnlGridPagamento: TPanel;
    Panel4: TPanel;
    btConfirmar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    Label11: TLabel;
    pnlTroco: TPanel;
    GridModa: TDBGrid;
    dsPagamento: TDataSource;
    Panel6: TPanel;
    btnVendaNova: TBitBtn;
    btnCancelaVenda: TBitBtn;
    btnFecharVenda: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCDCLIEExit(Sender: TObject);
    procedure dbeCDCLIEChange(Sender: TObject);
    procedure dbeCDPRODChange(Sender: TObject);
    procedure dbeCDPRODExit(Sender: TObject);
    procedure dbeQTPRODExit(Sender: TObject);
    procedure dbeQTPRODKeyPress(Sender: TObject; var Key: Char);
    procedure dbeValorUnitarioExit(Sender: TObject);
    procedure dbeValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure dbeCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure spLocProdutoClick(Sender: TObject);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure GridModaColEnter(Sender: TObject);
    procedure GridModaEnter(Sender: TObject);
    procedure GridModaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridModaKeyPress(Sender: TObject; var Key: Char);
    procedure btConfirmarClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure edtAcrescimoExit(Sender: TObject);
    procedure edtAcrescimoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESVALChange(Sender: TObject);
    procedure edtDESVALEnter(Sender: TObject);
    procedure edtDESVALExit(Sender: TObject);
    procedure edtDESVALKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESPERKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESPERExit(Sender: TObject);
    procedure edtDESPEREnter(Sender: TObject);
    procedure btnFecharVendaClick(Sender: TObject);
    procedure btnVendaNovaClick(Sender: TObject);
    procedure btnCancelaVendaClick(Sender: TObject);
  private
    { Private declarations }
     procedure Botoes;
     procedure Buscar(aProduto : String);
     procedure NovoItem(iVenda : Integer);
     Procedure TOTAL_VENDA(aCDS : TClientDataSet);
     Procedure Nova_Venda();
     Procedure CALCULAR;
     procedure Acrescimo;
     procedure Tratabotoes;
  public
    { Public declarations }
  end;


var
  frmMovVendas: TfrmMovVendas;
  ScreenWidth: LongInt;
  ScreenHeight: LongInt;
  M_FLVEND : boolean;
  M_VLVENDA, M_VLVENDA_ACRE_DESC, M_VLTROC, M_VLLIMP : Double;
  M_VLREAL, M_VLPERC  : Double;
  M_FLIMPR, W_TOTAPC : Integer;

implementation

uses udmDados, uFrmMain, uFuncoes, udmFinanceiro, uFrmLocClientes,
  uFrmLocalizaProduto, uFormaPagamento;

{$R *.dfm}

procedure TfrmMovVendas.FormCreate(Sender: TObject);
begin
      DMDados.AbrirTabelaConfig;
      //
      ScreenWidth  := dmdados.cdsConfigCFG_SCREENWIDTH.AsInteger;
      ScreenHeight := dmdados.cdsConfigCFG_SCREENHEIGHT.AsInteger;
      //
      scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;
end;

procedure TfrmMovVendas.FormShow(Sender: TObject);
begin
     KeyPreview := False;
     //
     BmsXPPageControl1.ActivePageIndex := 0;
     //
     pnlInferior.Enabled := false;
     pnlSuperior.Enabled := false;
end;

procedure TfrmMovVendas.spLocClienteClick(Sender: TObject);
begin
      dbeCDCLIE.SetFocus;
      Application.CreateForm(TfrmConsClientes, frmConsClientes);
      try
          frmConsClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                dbeCDCLIE.Text :=
                    uFuncoes.StrZero(frmConsClientes.cdsConsultarCLI_CODIGO.AsString,7);
                If (pnlInferior.Enabled) Then
                   btAdicionar.SetFocus;
           End;
          //
          frmConsClientes.Free;
      End;
end;

procedure TfrmMovVendas.dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
      //
     If (key = #13) and uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
           spLocClienteClick(Self);
      End;
     //
     If (key = #13) and not uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
           If (pnlInferior.Enabled) Then
              btAdicionar.SetFocus;
      End;
end;

procedure TfrmMovVendas.dbeCDCLIEExit(Sender: TObject);
begin
   If not uFuncoes.Empty(dbeCDCLIE.Text) Then
      If not (dmDados.ProcurarValor(dbeCDCLIE.Text, 'CLI_CODIGO', 'CLIENTES')) Then
        begin
             Application.MessageBox(Pchar('C�digo do cliente n�o cadastrado.'), 'Aten��o',
                   MB_OK+MB_ICONWARNING);
             edtNMCLIE.Clear;
             dbeCDCLIE.Clear;
             dbeCDCLIE.SetFocus;
             Exit;
        End
        Else
         begin
             dbeCDCLIE.Text := uFuncoes.StrZero(dbeCDCLIE.Text,7);
             edtNMCLIE.Text := dmDados.GetNomeCliente(StrtoInt(dbeCDCLIE.Text));
         End;
    //
   {If uFuncoes.Empty(dbeCDCLIE.Text) Then
     begin
          dbeCDPROD.SetFocus;
          Exit;
     End;}
   //
end;

procedure TfrmMovVendas.dbeCDCLIEChange(Sender: TObject);
begin
   If uFuncoes.Empty(dbeCDCLIE.Text) Then
        edtNMCLIE.Clear;
end;

procedure TfrmMovVendas.dbeCDPRODChange(Sender: TObject);
begin
     if dsDados.DataSet.State in [dsInsert, dsEdit] Then
        if uFuncoes.Empty(dbeCDPROD.Text) Then
         begin
               dmFinanceiro.cdsItensVendaCDS_NMPROD.Clear;
               dmFinanceiro.cdsItensVendaCDS_QTPROD.Clear;
               dmFinanceiro.cdsItensVendaCDS_VLUNIT.Clear;
         End;
end;

procedure TfrmMovVendas.dbeCDPRODExit(Sender: TObject);
Var
    M_CDPROD : String;
    M_CDLOJA : Integer;
begin
      If not uFuncoes.Empty(dbeCDPROD.Text) Then
        begin
             M_CDPROD := uFuncoes.StrZero(dbeCDPROD.Text, 13);
             //
             If not (dmDados.ProcurarValor(M_CDPROD, 'PRO_CODIGO', 'PRODUTOS')) Then
               Begin
                    dbeCDPROD.SetFocus;
                    dbeDescricao.Clear;
                    Application.MessageBox('C�digo n�o cadastrado.','ATEN��O',
                       MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    //grdConsultar.Enabled := False;
                    Exit;
               End
               Else
               begin
                    M_CDLOJA := 1;
                    dbeCDPROD.Text := M_CDPROD;
                    Buscar(M_CDPROD);
                    //dmFinanceiro.cdsDadosItensCDS_CDPROD.AsString := M_CDPROD;
                    //dbeDescricao.Text := dmDados.GetNomeProduto(M_CDPROD);
                    //
                    //pnlGrid.Enabled := True;
                    //Busca(M_CDLOJA, M_CDPROD);
                    //
                    dbeQTPROD.SetFocus;
               End;
        End
end;

procedure TfrmMovVendas.dbeQTPRODExit(Sender: TObject);
begin
   If (dsDados.DataSet.State in [dsInsert, dsEdit]) and
      not uFuncoes.Empty(dbeCDPROD.text) Then
      Begin
         if not (DMDados.cdsProduto.Active) Then
            uFuncoes.FilterCDS(DMDados.cdsProduto, fsString , dbeCDPROD.Text);
         //
         If (DMDados.cdsProdutoPRO_FLPROD.AsString = 'P') Then
           If Not (dmFinanceiro.GetValidarEstoqueProduto(1, dbeCDPROD.text, StrtoFloat(dbeQTPROD.text))) Then
             begin
                 Application.MessageBox('Quantidade digitada superior a do estoque!!',
                   'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                 dbeQTPROD.SetFocus;
                 Exit;
             End;
      End;
end;

procedure TfrmMovVendas.dbeQTPRODKeyPress(Sender: TObject; var Key: Char);
begin
     If (dsDados.DataSet.State in [dsInsert, dsEdit]) Then
      begin
          If not (key in ['0'..'9', #8, #13, ',']) Then
            Key := #0;
          //
          If (key = #13) and not uFuncoes.Empty(dbeCDPROD.text) Then
           begin
                Key := #0;
                If (btGravar.Enabled) Then
                  btGravar.SetFocus;
           End;
      End;
end;

procedure TfrmMovVendas.dbeValorUnitarioExit(Sender: TObject);
begin
     if dsDados.DataSet.State in [dsInsert, dsEdit] Then
        btGravar.SetFocus;
end;

procedure TfrmMovVendas.dbeValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(dbeValorUnitario.text) Then
       begin
            Key := #0;
            if (btGravar.Enabled) Then
               btGravar.SetFocus;
       End;
end;

procedure TfrmMovVendas.btAdicionarClick(Sender: TObject);
begin
 if (M_FLVEND) Then
    begin
      If not (dmFinanceiro.cdsDadosItens.Active) Then
         dmFinanceiro.cdsDadosItens.Open;
      //
      if (dmFinanceiro.cdsDadosItens.Active) Then
        begin
           Botoes;
           NovoItem(-1);
           //DMDados.cdsVendasMOV_NRVENDA.AsInteger
        End;
    End
    Else
   begin
        if (btnVendaNova.Enabled) Then
           btnVendaNova.SetFocus;
   End;
end;

procedure TfrmMovVendas.btEditarClick(Sender: TObject);
begin
   if (M_FLVEND) Then
   begin
      If not (dmFinanceiro.cdsDadosItens.Active) Then
         dmFinanceiro.cdsDadosItens.Open;
      if (dmFinanceiro.cdsDadosItens.Active) and (dmFinanceiro.cdsDadosItens.RecordCount > 0) Then
        begin
            Botoes;
            dsDados.DataSet.Edit;
            dbeCDPROD.Text := dsDados.DataSet.FieldByName('CDS_CDPROD').AsString;
            dbeQTPROD.SetFocus;
        End;
   End
   Else
   begin
       dbeCDCLIE.Setfocus;
       M_FLVEND := true;
   End;

end;

procedure TfrmMovVendas.Botoes;
begin
     btAdicionar.Enabled := not btAdicionar.Enabled;
     btEditar.Enabled    := not btEditar.Enabled;
     BtExcluir.Enabled   := not BtExcluir.Enabled;
     //
     btGravar.Enabled    := not btGravar.Enabled;
     btCancelar.Enabled  := not btCancelar.Enabled;
end;

procedure TfrmMovVendas.NovoItem(iVenda: Integer);
begin
     With dmFinanceiro.cdsDadosItens do
      begin
           Append;
           FieldByName('CDS_NRVEND').AsInteger     := iVenda;
           FieldByName('CDS_CDVENDEDOR').AsInteger := StrtoInt(uFrmMain.M_CDUSUA);
           //
           dbeCDPROD.SetFocus;
      End;
end;

procedure TfrmMovVendas.BtExcluirClick(Sender: TObject);
begin
   if (M_FLVEND) Then
   begin
     if (dsDados.DataSet.Active) AND not (dsDados.DataSet.IsEmpty) Then
      begin
           //
           If Application.MessageBox('Deseja excluir este item?' , 'Exclus�o de registro',
                      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
             begin
                  dsDados.DataSet.Delete;
                  //
                  TOTAL_VENDA(dmFinanceiro.cdsDadosItens);
             End;
       end
   End;
end;

procedure TfrmMovVendas.TOTAL_VENDA(aCDS: TClientDataSet);
Var
    M_VLTOTAL : Double;
begin
      With aCDS do
        begin
             DisableControls;
             First;
             M_VLTOTAL := 0;
             While not (EoF) do
              begin
                  M_VLTOTAL := M_VLTOTAL + aCDS.FieldByName('CDS_SUBTOT2').AsFloat;
                  //
                  Next;
              End;
             EnableControls;
             //
             M_VLVENDA := M_VLTOTAL;
             //
             pnlTotal.Caption := FormatFloat('###,##0.#0', M_VLVENDA);
        End;
end;

procedure TfrmMovVendas.btCancelarClick(Sender: TObject);
begin
  If (M_FLVEND) Then
  begin
      Botoes;
      if (dsDados.DataSet.Active) Then
           dsDados.DataSet.Cancel;
  End;
end;

procedure TfrmMovVendas.btGravarClick(Sender: TObject);
begin
  If (M_FLVEND) Then
    if (dsDados.DataSet.State in [dsInsert, dsEdit]) Then
      begin
           //
           If uFuncoes.Empty(dbeCDPROD.text) Then
           begin
                Application.MessageBox('Digite c�digo de produto.',
                  'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                dbeCDPROD.SetFocus;
                Exit;
           End;
           //
           If uFuncoes.Empty(dbeQTPROD.text) Then
           begin
                Application.MessageBox('Digite a quantidade do produto.',
                  'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                dbeQTPROD.SetFocus;
                Exit;
           End;
           //
           Try
                dmFinanceiro.cdsDadosItens.Post;
                //
                TOTAL_VENDA(dmFinanceiro.cdsDadosItens);
                //
                Botoes;
                //
                btAdicionar.SetFocus;
           Except
                 Application.MessageBox('Erro ao tentar gravar item.',
                   'ATEN��O', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
                 btCancelarClick(Sender);
           End;
  End;
end;

procedure TfrmMovVendas.dbeCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
     If (dsDados.DataSet.State in [dsInsert, dsEdit]) Then
      begin
          If not (key in ['0'..'9', #8, #13]) Then
            Key := #0;
          //
          If (key = #13) and uFuncoes.Empty(dbeCDPROD.text) Then
           begin
                Key := #0;
                spLocProdutoClick(Self);
           End;
          //
          If (key = #13) and not uFuncoes.Empty(dbeCDPROD.text) Then
           begin
                Key := #0;
                dbeQTPROD.SetFocus;
           End;
      End;
end;

procedure TfrmMovVendas.spLocProdutoClick(Sender: TObject);
begin
    dbeCDPROD.SetFocus;
    frmLocProdutos := TfrmLocProdutos.create(application);
    try
        frmLocProdutos.showmodal;
    finally
        If not (frmLocProdutos.cdsConsultar.IsEmpty) Then
        begin
            dbeCDPROD.Text := frmLocProdutos.cdsConsultarPRO_CODIGO.AsString;
            Perform(WM_NEXTDLGCTL, 0, 0);
            //edtCDPROD.SetFocus;
        End;
        //
        frmLocProdutos.Release;
        frmLocProdutos := nil;
    end;
end;

procedure TfrmMovVendas.Buscar(aProduto: String);
begin
     uFuncoes.FilterCDS(DMDados.cdsProduto, fsString, aProduto);
     //
     If not (DMDados.cdsProduto.IsEmpty) Then
     begin
         dbeDescricao.Text := DMDados.cdsProdutoPRO_DESCRICAO.AsString;
         dsDados.DataSet.FieldByName('CDS_VLUNIT').AsFloat   := DMDados.cdsProdutoPRO_VLVENDA.AsFloat;
         dsDados.DataSet.FieldByName('CDS_UNIDADE').AsString := DMDados.cdsProdutoPRO_UNIDADE.AsString;
         dsDados.DataSet.FieldByName('CDS_QTPROD').AsInteger := 1;
         //dbeValorUnitario.Text := Formatfloat('###,##0.#0',DMDados.cdsProdutoPRO_VLVENDA.AsFloat);
     End;
end;

procedure TfrmMovVendas.Nova_Venda;
Var
   M_NRVEND : String;
begin
     DMDados.AbrirTabelaConfig;
     //
     //M_NRVEND := StrtoInt(dmDados.cdsConfigCFG_SEQVENDA.AsString + );
     //
     dbeCDCLIE.clear;
     edtNMCLIE.Clear;
     dbeDTVEND.Date := Date();
     edtHora.Text   := Copy(TimetoStr(Time()),1,5);
     //
     M_FLVEND := true;
     M_VLVENDA := 0;
     M_VLVENDA_ACRE_DESC := 0;
     //
     lblVenda.Caption := '';
     pnlTotal.Caption := '0,00';
     //
     dmFinanceiro.cdsDadosItens.Close;
     dmFinanceiro.cdsDadosItens.Open;
     //
     dmFinanceiro.cdsDadosItens.EmptyDataSet;
     //
     If not (btAdicionar.Enabled) Then
        Botoes;
end;

procedure TfrmMovVendas.dsDadosDataChange(Sender: TObject; Field: TField);
begin
    If (dsDados.DataSet.Active) Then
        pnlBotoes.Enabled := dsDados.DataSet.State in [dsInsert, dsEdit];
end;

procedure TfrmMovVendas.GridModaColEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1;
     //
     If (dmFinanceiro.cdsModalidade.Active) Then
       If (uFuncoes.Empty(dmFinanceiro.cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
         //   dmFinanceiro.cdsModalidade.Delete;
end;

procedure TfrmMovVendas.GridModaEnter(Sender: TObject);
begin
     GridModa.SelectedIndex := 1; { Vai para a 1� coluna }
end;

procedure TfrmMovVendas.GridModaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     //
     If (key = vk_F2) then
     begin
          //Validar_Entradas;
          btConfirmarClick(Sender);
          //btConfirmar.SetFocus;
     End;
     //
     If (key = vk_Escape) Then
       btCancelar.SetFocus;
     //
     If (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     case key of
        13 : Key := 9;
     end;
     //
end;

procedure TfrmMovVendas.GridModaKeyPress(Sender: TObject; var Key: Char);
Var
    W_TOVEND, M_VLDIGI : Real;
    bmLocalImportante : TBookmark;
    M_NMMODA : String;
begin
      W_TOVEND := M_VLVENDA;
      //
      If (Key = #13) Then
      //
      begin
           Key := #0;
           //
           M_VLDIGI := 0;
           //
           M_NMMODA := dmFinanceiro.cdsModalidade.FieldByName('MOD_NOME').AsString;
           //
           dmFinanceiro.cdsModalidade.DisableControls;
           dmFinanceiro.cdsModalidade.First;
           //
           While not (dmFinanceiro.cdsModalidade.Eof) do
           begin
                If (uFuncoes.Empty(dmFinanceiro.cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
                begin
                     dmFinanceiro.cdsModalidade.Delete;
                     break;
                     GridModa.SetFocus;
                     Exit;
                End;
                //
                M_VLDIGI := M_VLDIGI+dmFinanceiro.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                //
                // Proximo
                dmFinanceiro.cdsModalidade.Next;
           End;
           //
           dmFinanceiro.cdsModalidade.EnableControls;
           M_VLTROC :=  M_VLDIGI-W_TOVEND;
           //
           pnlTroco.Caption  := FormatFloat('###,##0.#0', uFrmVendas.M_VLTROC);
           dmFinanceiro.cdsModalidade.Locate('MOD_NOME',M_NMMODA,[]);
           //
           If (M_VLDIGI = 0) then
              pnlTroco.Caption  := '0,00';
      End;
      //
      If (key = #13) and ( dmFinanceiro.cdsModalidade.Eof) Then
      Begin
           Key := #0;
           btConfirmar.SetFocus;
      End;
end;

procedure TfrmMovVendas.btConfirmarClick(Sender: TObject);
begin
     //
end;

procedure TfrmMovVendas.TabSheet2Show(Sender: TObject);
begin
   TOTAL_VENDA(dmFinanceiro.cdsDadosItens);
   //
   If (M_VLVENDA > 0) Then
    begin
     dmFinanceiro.CarregarModalidades();
     //
     M_VLLIMP := 0;
     M_VLVENDA_ACRE_DESC := 0;
     //
     {If (dm2.cdsParcelasVenda.Active = False) Then
        dm2.cdsParcelasVenda.Open;
     dm2.cdsParcelasVenda.EmptyDataSet;}
     //
     pnlTOMERC.Caption  := FormatFloat('###,##0.00', M_VLVENDA);
     //
     txtTOVEND.Caption  := FormatFloat('###,##0.00', M_VLVENDA);
     {Else
     begin
         M_TOVEND := uFrmVendas.M_TOVEND;
         txtTOVEND.Caption  := FormatFloat('###,##0.00', uFrmVendas.M_TOVEND);
         pnlTOMERC.Caption  := FormatFloat('###,##0.00', uFrmVendas.M_TOVEND);
     End;}
     //
     //pnlFormaPag.Visible := True;
     btConfirmar.Enabled := True;
     // GridModa
     If (uFrmMain.admin) Then
         edtDESVAL.SetFocus
     Else
         GridModa.SetFocus;
    End
    Else
        TabSheet1.Show;
end;

procedure TfrmMovVendas.edtAcrescimoExit(Sender: TObject);
begin
      If (edtAcrescimo.Value > M_VLVENDA) Then
      begin
           Application.MessageBox(PChar('Valor de acr�scimo maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtAcrescimo.Value := 0;
           If (edtAcrescimo.CanFocus) Then
               edtAcrescimo.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmMovVendas.CALCULAR;
Var
    M_VLVEND : Real;
begin
   M_VLVEND := 0;
   //
   If (uFrmMain.admin) Then
   Begin
         M_VLLIMP := M_VLVENDA;
         M_VLVEND := M_VLVENDA;
         //
         If (edtDESVAL.Value > 0) Then
         Begin
              {M_VLPERC := (edtDESVAL.Value*100)/M_TOVEND;
              M_TOVEND := (M_TOVEND - edtDESVAL.Value);}
              M_VLPERC := (edtDESVAL.Value*100)/M_VLLIMP;
              M_VLLIMP := (M_VLLIMP - edtDESVAL.Value);
              //
              //txtTOVEND.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
              edtDESPER.Value   := M_VLPERC;
              M_VLREAL := edtDESVAL.Value;
         End
         Else
         Begin
              //M_TOVEND := (M_TOVEND - uFuncoes.Gerapercentual(M_TOVEND, edtDESPER.Value));
              M_VLLIMP := (M_VLLIMP - uFuncoes.Gerapercentual(M_VLLIMP, edtDESPER.Value));
              //edtDESVAL.Value   := M_VLVEND - M_TOVEND;
              edtDESVAL.Value   := M_VLVEND - M_VLLIMP;
              //
              M_VLREAL := edtDESVAL.Value;
              M_VLPERC := edtDESPER.Value;
         End;
         //
         //M_VLVENDA := M_VLLIMP;
         M_VLVENDA_ACRE_DESC := M_VLLIMP;
         //
         Acrescimo;
         txtTOVEND.Caption := FormatFloat('###,###,##0.00', M_VLVENDA_ACRE_DESC);
   End;
end;

procedure TfrmMovVendas.Acrescimo;
begin
     If (edtAcrescimo.Value > 0) Then
        M_VLVENDA_ACRE_DESC := M_VLLIMP + edtAcrescimo.Value;
        //M_VLVENDA := M_VLLIMP + edtAcrescimo.Value;
end;

procedure TfrmMovVendas.edtAcrescimoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmMovVendas.edtDESVALChange(Sender: TObject);
begin
{     If (uFrmMain.admin) Then
        edtDESVAL.ReadOnly := True
     Else
        edtDESVAL.ReadOnly := False;}
end;

procedure TfrmMovVendas.edtDESVALEnter(Sender: TObject);
begin
    //M_VLVENDA := M_VLVENDA + edtAcrescimo.Value;
    M_VLVENDA_ACRE_DESC := M_VLVENDA_ACRE_DESC + edtAcrescimo.Value;
    //
    edtDESPER.Value := 0;
    edtDESVAL.Value := 0;
    //
    txtTOVEND.Caption  := FormatFloat('###,##0.00', M_VLVENDA)
    //
end;

procedure TfrmMovVendas.edtDESVALExit(Sender: TObject);
begin
      If (edtDESVAL.Value > M_VLVENDA) Then
      begin
           Application.MessageBox(PChar('Valor de desconto maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDESVAL.Value := 0;
           If (edtDESVAL.CanFocus) Then
               edtDESVAL.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmMovVendas.edtDESVALKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmMovVendas.edtDESPERKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmMovVendas.edtDESPERExit(Sender: TObject);
begin
      If (edtDESPER.Value >= 100) Then
      begin
           Application.MessageBox(PChar('Percentual de desconto maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDESPER.Value := 0;
           If (edtDESPER.CanFocus) Then
               edtDESPER.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmMovVendas.edtDESPEREnter(Sender: TObject);
begin
     M_VLVENDA_ACRE_DESC := M_VLVENDA_ACRE_DESC + edtAcrescimo.Value;
     //
     edtDESVAL.Value := 0;
     edtDESPER.Value := 0;
     //
     txtTOVEND.Caption  := FormatFloat('###,##0.00', M_VLVENDA_ACRE_DESC)
end;

procedure TfrmMovVendas.btnFecharVendaClick(Sender: TObject);
begin
  If not (dmFinanceiro.cdsDadosItens.IsEmpty) Then
   begin
     Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento); // Carrega form na mem�ria
     try
          //W_VLVEND := M_TOVEND;
          uFormaPagamento.M_CDVEND := 1;
          uFormaPagamento.M_NMVEND := 'VENDEDOR';
          uFormaPagamento.M_CDCAIX := StrtoInt(uFrmMain.M_CDUSUA);
          frmFormaPagamento.edtCDCLIE.Text := dbeCDCLIE.Text;
          frmFormaPagamento.edtNMCLIE.Text := edtNMCLIE.Text;
          frmFormaPagamento.ShowModal;
     Finally
           frmFormaPagamento.Free;                              //Libera Mem�ria
           If (M_FLVEND = False) Then
             Begin
                  //dbeCDCLIE.Setfocus;
                  Tratabotoes;
                  Nova_Venda;
             End;
     End;
     //
   End;
end;

procedure TfrmMovVendas.Tratabotoes;
begin
    btnVendaNova.Enabled    := not btnVendaNova.Enabled;
    btnCancelaVenda.Enabled := not btnCancelaVenda.Enabled;
    btnFecharVenda.Enabled  := not btnFecharVenda.Enabled;
    //
    pnlInferior.Enabled     := NOT pnlInferior.Enabled;
    pnlSuperior.Enabled     := not pnlSuperior.Enabled;
end;

procedure TfrmMovVendas.btnVendaNovaClick(Sender: TObject);
begin
     Tratabotoes;
     //
     dbeCDCLIE.Setfocus;
     Nova_Venda;
     lblVenda.Caption := uFuncoes.StrZero(InttoStr(dmDados.cdsConfigCFG_VENDA.AsInteger + 1),7);
end;

procedure TfrmMovVendas.btnCancelaVendaClick(Sender: TObject);
begin
      if (pnlInferior.Enabled) Then
         Botoes;
      Tratabotoes;
      //
      M_FLVEND := False;
      Nova_Venda;
end;

end.
