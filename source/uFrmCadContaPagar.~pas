unit uFrmCadContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, ExtCtrls, DB, DBClient, Menus, CurrEdit;

type
  TfrmCadContaPagar = class(TForm)
    pnlDados: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    dbgridParcelas: TDBGrid;
    Panel3: TPanel;
    BtAdicionar: TBitBtn;
    btClonar: TBitBtn;
    BtGravar: TBitBtn;
    BtCancelar: TBitBtn;
    BtSair: TBitBtn;
    Label4: TLabel;
    dsCadastro: TDataSource;
    dsParcelas: TDataSource;
    PopupMenu1: TPopupMenu;
    ppmFornecedores: TMenuItem;
    ppmNaturezas1: TMenuItem;
    dbeDTCOMP: TDateEdit;
    dbeQtParcelas: TCurrencyEdit;
    lblNrCompra: TLabel;
    dbeNota: TEdit;
    dbeSerie: TEdit;
    Label2: TLabel;
    Label8: TLabel;
    cmbFornecedor: TDBLookupComboBox;
    cmbNatureza: TDBLookupComboBox;
    mmoDescricao: TDBMemo;
    procedure dbeQtParcelasExit(Sender: TObject);
    procedure dbeQtParcelasEnter(Sender: TObject);
    procedure dbeQtParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridParcelasColEnter(Sender: TObject);
    procedure dbgridParcelasColExit(Sender: TObject);
    procedure dbgridParcelasEnter(Sender: TObject);
    procedure dbgridParcelasExit(Sender: TObject);
    procedure dbgridParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgridParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure BtAdicionarClick(Sender: TObject);
    procedure btClonarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtSairClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure ppmFornecedoresClick(Sender: TObject);
    procedure ppmNaturezas1Click(Sender: TObject);
    procedure dbeSerieExit(Sender: TObject);
    procedure dbeNotaExit(Sender: TObject);
    procedure dbeNotaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(aCodigo : String);
    procedure Tratabotoes;
    procedure VALOR_CONTA;
    Procedure ALTUALIZAR_PARCELAS(aCDS : TClientDataSet; iQuantPC : Integer);
    Procedure AtualizaValor;
    Procedure NovoRegistro;
    Procedure CarregarFornecedore(aCds : TClientDataSet; oCombo : TComboBox);
    Procedure CarregarNaturezas(aCds : TClientDataSet; oCombo : TComboBox);
  public
    { Public declarations }
  end;

var
  frmCadContaPagar: TfrmCadContaPagar;
  M_VLCONT, W_VLCONT : Double;

implementation

uses udmFinanceiro, uFuncoes, udmDados, uFrmMain, uFrmFornecedores;

{$R *.dfm}

procedure TfrmCadContaPagar.dbeQtParcelasExit(Sender: TObject);
begin
    If (dsCadastro.DataSet.State in [dsInsert]) Then
     begin
      If (BtGravar.Enabled) and not uFuncoes.Empty(dbeQtParcelas.Text) Then
        begin
             If (dbeQtParcelas.Value <= 0) Then
              begin
                   Application.MessageBox(PChar('Quantidade de Parcelas deve ser maoir que zero.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger := 1;
                   dbeQtParcelas.SetFocus;
                   Exit;
              End
              Else
              begin
                   If (dbeQtParcelas.Value >= 1) Then
                     begin
                          dmFinanceiro.CRIAR_PARCELAS_PAGAR(dmDados.cdsConfigCFG_NRCOMPRA.AsInteger,
                                    StrtoInt(dbeQtParcelas.text));
                          //
                          If (BtGravar.Enabled) Then
                           BEGIN
                              dbgridParcelas.Enabled := True;
                              dbgridParcelas.ReadOnly := false;
                           End;
                          dbgridParcelas.SetFocus;
                     End;
                   //
                   If (dbeQtParcelas.Value < 1) Then
                          dmFinanceiro.cdsParcelasCP.Close;
              End;
        End;
      End;  
      {If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
        and not uFuncoes.Empty(dbeQtParcelas.Text) Then
        begin
             If (dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger <= 0) Then
              begin
                   Application.MessageBox(PChar('Quantidade de Parcelas deve ser maoir que zero.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger := 1;
                   dbeQtParcelas.SetFocus;
                   Exit;
              End
              Else
              begin
                   If (dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger >= 1) Then
                     begin
                          dmFinanceiro.CRIAR_PARCELAS_PAGAR(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsInteger,
                                    dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger);
                          //
                          dbgridParcelas.SetFocus;
                     End;
                   //
                   If (dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger < 1) Then
                          dmFinanceiro.cdsParcelasCP.Close;
              End;
        End;}
end;

procedure TfrmCadContaPagar.dbeQtParcelasEnter(Sender: TObject);
begin
    If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
     Begin
       If (dmFinanceiro.cdsParcelasCP.Active = True) Then
            dmFinanceiro.cdsParcelasCP.EmptyDataSet;
       //
       dmFinanceiro.cdsParcelasCP.Close;
     End;
end;

procedure TfrmCadContaPagar.dbeQtParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
    begin
       If (key = #13) and (dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger >= 1) Then
       Begin
            Key := #0;
            dbgridParcelas.SelectedIndex := 1;
       End;
    End;
end;

procedure TfrmCadContaPagar.dbgridParcelasColEnter(Sender: TObject);
begin
  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
  Begin
    If (dmFinanceiro.cdsParcelasCPPAR_NRPARC.AsInteger > 0) Then
      dbgridParcelas.Options := dbgridParcelas.Options + [dgEditing]
    else
    begin
        dbgridParcelas.Options := dbgridParcelas.Options - [dgEditing];
        BtGravar.SetFocus;
    End;
    //
     If (uFuncoes.Empty(dmFinanceiro.cdsParcelasCPPAR_NRPARC.AsString)) Then
     begin
           dmFinanceiro.cdsParcelasCP.Delete;
           dmFinanceiro.cdsParcelasCP.First;
     End;
    //
    If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRPARC')) Then
        dbgridParcelas.SelectedIndex := 1;
    //
   If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_AGENCIA'))
     and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_BANCO').AsString) then
   begin
        dmFinanceiro.cdsParcelasCP.Edit;
        dmFinanceiro.cdsParcelasCP.FieldByName('PAR_BANCO').AsString :=
            uFuncoes.StrZero(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_BANCO').AsString,3);
        //
        If Not (dmDados.ProcurarValor(uFuncoes.StrZero(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_BANCO').AsString,3),
                'BAN_CODIGO','BANCOS')) Then
        begin
             Application.MessageBox('Código de banco não cadastrado!!!','ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dmFinanceiro.cdsParcelasCP.FieldByName('PAR_BANCO').Clear;
             dbgridParcelas.SelectedIndex := 3;
             Exit;
        End;
   End;
   //
   If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_BANCO'))
     and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_VALOR').AsString) then
         VALOR_CONTA;
   //
   If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_VALOR'))
     and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_VALOR').AsString) then
         VALOR_CONTA;
   //
   If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE'))
      and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCONTA').AsString) Then
   Begin
        dmFinanceiro.cdsParcelasCP.Edit;
        dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCONTA').AsString :=
            uFuncoes.StrZero(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCONTA').AsString,10);
   End;
   //
   If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC'))
      and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString) Then
   Begin
        dmFinanceiro.cdsParcelasCP.Edit;
        dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString :=
            uFuncoes.StrZero(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString,10);
   End;
 End;  
end;

procedure TfrmCadContaPagar.VALOR_CONTA;
begin

end;

procedure TfrmCadContaPagar.dbgridParcelasColExit(Sender: TObject);
Var
   N_VLCONT : Real;
begin
  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
  Begin
    If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC'))
      and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC').AsString) Then
    Begin
      If (dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC').AsDateTime < Strtodate(dbeDTCOMP.Text)) Then
      Begin
           Application.MessageBox(PChar('Data de vencimento deve ser '+#13'maior ou igual a da compra!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC').AsDateTime := Strtodate(dbeDTCOMP.Text);
           dbgridParcelas.SelectedIndex := 1;
           Exit;
      End;
   End;
   //
   If (dbgridParcelas.SelectedField <> dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE'))
      and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString) Then
   Begin
        dmFinanceiro.cdsParcelasCP.Edit;
        dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString :=
            uFuncoes.StrZero(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRCHEQUE').AsString,10);
   End;
 End;
end;

procedure TfrmCadContaPagar.dbgridParcelasEnter(Sender: TObject);
begin
  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
  Begin
     If (dbgridParcelas.SelectedIndex = 1) Then
         StatusBar1.Panels[0].Text := 'Pressione F2 para editar data';

     If uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_DTVENC').AsString) Then
     begin
         dbgridParcelas.SelectedIndex := 1;
         Exit;
     End;
     //
     If uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_VALOR').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 2;
         Exit;
     End;
     //
     If uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_AGENCIA').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 4;
         Exit;
     End;
     //
     If uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_NRCONTA').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 5;
         Exit;
     End;
     //
     If uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_NRCHEQUE').AsString) Then
     Begin
         dbgridParcelas.SelectedIndex := 6;
         Exit;
     End;
 End;    
end;

procedure TfrmCadContaPagar.dbgridParcelasExit(Sender: TObject);
begin
       StatusBar1.Panels[0].Text := ' ';
end;

procedure TfrmCadContaPagar.dbgridParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
  Begin
     if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     If (dmFinanceiro.cdsParcelasCP.Active = True) Then
     Begin
         IF (KEY = 38) or (key = 40) then // avalio se é seta para cima ou para baixo;
         Begin
             VALOR_CONTA;
             //
             If (dmFinanceiro.cdsParcelasCP.Eof) Then
                dmFinanceiro.cdsParcelasCP.First;
         End;
     End;
     //
     case key of
        13 : Key := 9;
     end;
  End;   
end;

procedure TfrmCadContaPagar.dbgridParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
  Begin
      if (Key = #13) and
         (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByname('PAR_NRCHEQUE'))
         and (dmFinanceiro.cdsParcelasCP.FieldByName('PAR_NRPARC').AsInteger = 1)
         and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_DTVENC').AsString)
         and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_VALOR').AsString) then
      Begin
            Key := #0;
      End;
  End;   
end;

procedure TfrmCadContaPagar.BtAdicionarClick(Sender: TObject);
Var
    iUsuario : Integer;
    M_DTMOVI : TDatetime;
    M_HOMOVI : String;
begin
    Tratabotoes;
    {If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin}
          iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
          M_DTMOVI := Date();
          M_HOMOVI := Copy(TimetoStr(Time()),1,5);
          //
          With dmFinanceiro.cdsContaPagar do  // dsCadastro.DataSet
            begin
                 //
                 Append;
                 FieldByName('PAG_SEQUENCIA').AsInteger  := dmDados.cdsConfigCFG_SEQCPAGAR.AsInteger + 1;
                 FieldByName('PAG_IDCONTA').AsInteger  :=
                    DMDados.cdsConfigCFG_NRCOMPRA.AsInteger + 1;
                 FieldByName('PAG_DTCOMPRA').AsDateTime := M_DTMOVI;
                 FieldByName('PAG_HOMOVI').AsString   := M_HOMOVI;
                 FieldByName('PAG_USCADA').AsInteger  := iUsuario;
                 FieldByName('PAG_QTPARCELAS').AsInteger := 1;
                 FieldByName('PAG_NRPARCELA').AsInteger  := 1;
            End;
            //
            NovoRegistro;
            //
            btClonar.Enabled := True;
            dbeNota.SetFocus;
     //End;
end;

procedure TfrmCadContaPagar.btClonarClick(Sender: TObject);
begin
     If (dmFinanceiro.cdsParcelasCP.Active) Then
         If not (dmFinanceiro.cdsParcelasCP.IsEmpty) Then
         begin
             ALTUALIZAR_PARCELAS(dmFinanceiro.cdsParcelasCP, dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger);
             VALOR_CONTA;
         End;
end;

procedure TfrmCadContaPagar.ALTUALIZAR_PARCELAS(aCDS: TClientDataSet;
  iQuantPC: Integer);
Var
   W_DTVENC : tdate;
   W_VLPARC : REAL;
   W_NRBANC, W_NRAGEN, W_NRCONT : String;
   W_NRCHEQ, W_PCATUA, N_RGATUA : Integer;
begin
     M_VLCONT := 0;
     N_RGATUA := aCDS.FieldByName('PAR_NRPARC').AsInteger;
     //
     If uFuncoes.Empty(aCDS.FieldByname('PAR_DTVENC').AsString)
         or  uFuncoes.Empty(aCDS.FieldByname('PAR_VALOR').AsString)
         or (aCDS.FieldByname('PAR_VALOR').AsCurrency = 0) Then
     begin
          aCDS.Locate('PAR_NRPARC', N_RGATUA,[]);
          dbgridParcelas.SetFocus;
          Exit;
     End;
     //
     aCDS.DisableControls;
     //
     //dm2.cdsParcelas.First;
     //
     W_DTVENC := aCDS.FieldByname('PAR_DTVENC').AsDateTime;
     W_VLPARC := aCDS.FieldByname('PAR_VALOR').AsCurrency;
     W_NRBANC := aCDS.FieldByname('PAR_BANCO').AsString;
     W_NRAGEN := aCDS.FieldByname('PAR_AGENCIA').AsString;
     W_NRCONT := aCDS.FieldByname('PAR_NRCONTA').AsString;
     If not uFuncoes.Empty(aCDS.FieldByname('PAR_NRCHEQUE').AsString) Then
         W_NRCHEQ := aCDS.FieldByname('PAR_NRCHEQUE').AsInteger;
     W_PCATUA := 0;
     //
     M_VLCONT := W_VLPARC * iQuantPC;
     //
     While not (aCDS.Eof) do
     begin
         aCDS.Edit;
         //
         aCDS.FieldByname('PAR_DTVENC').AsDateTime := IncMonth(W_DTVENC,W_PCATUA);
         aCDS.FieldByname('PAR_VALOR').AsCurrency      := W_VLPARC;
         //
         If not uFuncoes.Empty(W_NRBANC) Then
             aCDS.FieldByname('PAR_BANCO').AsString    := uFuncoes.StrZero(W_NRBANC,3);
         If not uFuncoes.Empty(W_NRAGEN) Then
             aCDS.FieldByname('PAR_AGENCIA').AsString  := uFuncoes.StrZero(W_NRAGEN,5);
         If not uFuncoes.Empty(W_NRCONT) Then
             aCDS.FieldByname('PAR_NRCONTA').AsString    := uFuncoes.StrZero(W_NRCONT,10);
         If (W_NRCHEQ > 0) Then
             aCDS.FieldByname('PAR_NRCHEQUE').AsString   := uFuncoes.StrZero(InttoStr(W_NRCHEQ+W_PCATUA),10);
         //
         W_PCATUA := W_PCATUA + 1;
         //
         aCDS.Next;
     End;
     //
     aCDS.Locate('PAR_NRPARC', N_RGATUA,[]);
     //dm2.cdsParcelas.First;
     aCDS.EnableControls;
     dbgridParcelas.SelectedIndex := 1;
     //
     //lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLCONT);
end;

procedure TfrmCadContaPagar.BtCancelarClick(Sender: TObject);
begin
  Tratabotoes;
  //
  btClonar.Enabled := False;
  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
        dsCadastro.DataSet.Cancel;
        //
        Registro;
        //
        if not (dmFinanceiro.cdsContaPagar.IsEmpty) Then
            dmFinanceiro.Carregar_Parcelas_CP(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsInteger);
   End;
  //
  if (dsCadastro.DataSet.IsEmpty) Then
       Close;
end;

procedure TfrmCadContaPagar.BtGravarClick(Sender: TObject);
Var
    iUsuario : Integer;
    M_IDCTPG, W_QTPARC, M_CDLOJA, W_NRPARC, V_NRPARC : Integer;
    M_HOMOVI, M_DESCRICAO, M_NRNOTA, M_NRSERI : String;
    M_VLMOVI, M_VLPAGO  : Double;
    M_CDFORN, M_CDNATU, M_NRBANC : Integer;
    M_DTMOVI, M_DTVENC, M_DTCOMP  : TDate;
    M_CODIGO, M_SEQPAG : Integer;
    M_NRAGEN, M_NRCOTA, M_NRCHEQ : String;
   // Observacao : TStrings;
begin
     If uFuncoes.Empty(cmbFornecedor.Text) Then
     Begin
          Application.MessageBox('Selecione o fornecedor.','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbFornecedor.SetFocus;
          Exit;
     End;
     //
     If (dbeDTCOMP.Text = '  /  /    ') Then
     Begin
          Application.MessageBox('Digite a data da compra!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeDTCOMP.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbNatureza.Text) Then
     Begin
          Application.MessageBox('Selecione a natureza!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbNatureza.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(dbeQtParcelas.Text) Then
       Begin
           Application.MessageBox('Digite a quantidade de parcelas.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeQtParcelas.SetFocus;
           Exit;
       End;
      //
      With dmFinanceiro.cdsParcelasCP do
      begin
           DisableControls;
           First;
           M_VLCONT := 0;
           While not (Eof) do
           begin
               Edit;
               //
               If (uFuncoes.Empty(FieldByname('PAR_VALOR').AsString)
                 or (FieldByname('PAR_VALOR').AsCurrency = 0))
                 or (uFuncoes.Empty(FieldByname('PAR_DTVENC').AsString)) Then
               begin
                    V_NRPARC := FieldByname('PAR_NRPARC').AsInteger;
                    EnableControls;
                    Locate('PAR_NRPARCELA',V_NRPARC,[]);
                    SetFocus;
                    Exit;
                    break;
               End;
               //
               If not (uFuncoes.Empty(FieldByname('PAR_BANCO').AsString)) Then
               Begin
                    If (uFuncoes.Empty(FieldByname('PAR_AGENCIA').AsString))
                      or (uFuncoes.Empty(FieldByname('PAR_NRCONTA').AsString))
                      or (uFuncoes.Empty(FieldByname('PAR_NRCHEQUE').AsString)) then
                    begin
                          V_NRPARC := FieldByname('PAR_NRPARC').AsInteger;
                          EnableControls;
                          Locate('PAR_NRPARCELA',V_NRPARC,[]);
                          dbgridParcelas.SetFocus;
                          Exit;
                          break;
                    End;
               End;
               //
               M_VLCONT := M_VLCONT + FieldByname('PAR_VALOR').AsCurrency;
               //
               Next;
           End;    // fim-do-enquanto
           //
          EnableControls;
      End;   //  fim-with
          //
          iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
          {Observacao := TStrings.Create();
          Observacao := mmoDescricao.Lines;}
          //
          {If (dsCadastro.DataSet.State in [dsInsert]) Then
            begin}
                 //uFuncoes.RefreshCDS(DMDados.cdsConfig);
                 DMDados.AbrirTabelaConfig;
                 //
                 try
                     dmDados.Start;
                     dmDados.cdsConfig.Edit;
                     dmDados.cdsConfigCFG_NRCOMPRA.AsInteger :=
                         dmDados.cdsConfigCFG_NRCOMPRA.AsInteger + 1;
                     dmDados.cdsConfig.ApplyUpdates(0);
                     //
                     dmDados.Comit(Transc);
                 Except
                     dmDados.Rollback;
                     raise Exception.Create('Erro ao tentar gerar número de compra.');
                 End;
                 //
                 M_IDCTPG := dmDados.cdsConfigCFG_NRCOMPRA.AsInteger;
                 //
                 try
                    M_HOMOVI := Copy(TimetoStr(Time),1,5);
                    M_DTMOVI := Date;
                    M_VLPAGO := 0;
                    //
                    M_CDLOJA := 1;
                    //dmFinanceiro.cdsContaPagarPAG_CDLOJA.AsInteger;
                    M_CDFORN := dmFinanceiro.cdsContaPagarPAG_IDFORNECEDOR.AsInteger;
                    //dmDados.GetNomeFornecedor(cmbFornecedor.Text);
                    M_CDNATU := dmFinanceiro.cdsContaPagarPAG_NATUREZADESPESA.AsInteger;
                    // dmDados.GetCodigoNatureza(cmbNatureza.Text);
                    W_QTPARC := StrtoInt(dbeQtParcelas.Text);
                    //dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger;
                    M_NRNOTA := dbeNota.Text;
                    //dmFinanceiro.cdsContaPagarPAG_NUMERONOTAFISCAL.AsString;
                    M_NRSERI := dbeSerie.Text;
                    //dmFinanceiro.cdsContaPagarPAG_SERIENOTAFISCAL.AsString;
                    M_DTCOMP := dbeDTCOMP.Date;
                    //dmFinanceiro.cdsContaPagarPAG_DTCOMPRA.AsDateTime;
                    //M_DESCRICAO := mmoDescricao.Lines.Text;
                    // Gerando contas a pagar do valor da nota
                    With dmFinanceiro.cdsContaPagar do
                    Begin
                         dmFinanceiro.cdsParcelasCP.DisableControls;
                         dmFinanceiro.cdsParcelasCP.First;
                         //
                         While not (dmFinanceiro.cdsParcelasCP.Eof) DO
                            Begin
                              DMDados.AbrirTabelaConfig;
                              //
                              try
                                  dmDados.Start;
                                  //
                                  dmDados.cdsConfig.Edit;
                                  dmDados.cdsConfigCFG_SEQCPAGAR.AsInteger :=
                                     dmDados.cdsConfigCFG_SEQCPAGAR.AsInteger + 1;
                                  dmDados.cdsConfig.ApplyUpdates(0);
                                  //
                                  M_SEQPAG := dmDados.cdsConfigCFG_SEQCPAGAR.AsInteger;
                                  //
                                  W_NRPARC := dmFinanceiro.cdsParcelasCPPAR_NRPARC.AsInteger;
                                  dmDados.Comit(Transc);
                              Except
                                  dmDados.Rollback;
                                  raise Exception.Create('Erro oa tentar gerá sequência de parcela.');
                              End;
                              //
                              If (W_NRPARC = 1) Then
                                 M_CODIGO := M_SEQPAG;
                              //
                              If (dmFinanceiro.cdsParcelasCPPAR_BANCO.AsInteger > 0) then
                              begin
                                  M_NRBANC := dmFinanceiro.cdsParcelasCPPAR_BANCO.AsInteger;
                                  M_NRAGEN := dmFinanceiro.cdsParcelasCPPAR_AGENCIA.AsString;
                                  M_NRCOTA := dmFinanceiro.cdsParcelasCPPAR_NRCONTA.AsString;
                                  M_NRCHEQ := dmFinanceiro.cdsParcelasCPPAR_NRCHEQUE.AsString;
                              End
                              Else
                              begin
                                  M_NRBANC := 0;
                                  M_NRAGEN := '';
                                  M_NRCOTA := '';
                                  M_NRCHEQ := '';
                              End;
                              //
                              M_VLMOVI := dmFinanceiro.cdsParcelasCPPAR_VALOR.AsFloat;
                              M_DTVENC := dmFinanceiro.cdsParcelasCPPAR_DTVENC.AsDateTime;
                              M_CDLOJA := 1;
                              //
                              {function TdmFinanceiro.IncluirParcelaCP(iSEQUENCIA, iIDCONTA, iNRPARCELA,
                                iCDLOJA, iQTPARCELAS, iFORNECEDOR, iPLANOCONTA, iNATUREZA, iUSCADA,
                                iBANCO: integer; aDTVENCIMENTO, aDTCOMPRA: TDate;
                                aNOTAFISCAL, aSERIE, aHOMOVI, aSITUACAO, aDESCRICAO, aNRCONTA, aNRCHEQUE,
                                aAGENCIA: String; fVALORPARCELA: Double): Boolean;
                              }
                              If Not (dmFinanceiro.IncluirParcelaCP(
                                     M_SEQPAG, M_IDCTPG, W_NRPARC, M_CDLOJA, W_QTPARC, M_CDFORN, 1,
                                     M_CDNATU, iUsuario, M_NRBANC, M_DTVENC, M_DTCOMP,
                                     M_NRNOTA, M_NRSERI, M_HOMOVI, 'A', M_NRCOTA, M_NRCHEQ,
                                     M_NRAGEN, M_VLMOVI, mmoDescricao.Lines)) Then
                                 ShowMessage('Erro ao tenta incluir parcela :' + dmFinanceiro.cdsParcelasCPPAR_NRPARC.AsString);
                                 //Observacao
                              //
                              {If (cbxAvista.Checked) Then
                                begin
                                     FieldByName('PAG_VALORPAGO').AsCurrency     := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
                                     FieldByName('PAG_DTPAGAMENTO').AsDateTime := StrtoDate(edtDTCOMP.Text);
                                     FieldByName('PAG_SITUACAO').AsString        := 'P';
                                     M_VLPAGO := dm2.cdsParcelas.FieldByname('PAR_VALOR').AsCurrency;
                                     //  Incluir Movimento de Caixa
                                     Dm.Incluir_Movimento_Caixa(M_CDLOJA, 0, StrtoInt(uFrmAdmin.M_CDUSUA), StrtoInt(edtCDNATU.Text), 'P',
                                           M_HOMOVI, '1', '', 'PAGAMENTO DE CONTA', StrtoDate(edtDTCOMP.Text), M_VLPAGO, M_VLPAGO, 0);
                                     //
                                End
                                Else}
                               //      FieldByName('PAG_SITUACAO').AsString        := 'A';
                              //      Proximo Registro
                              dmFinanceiro.cdsParcelasCP.Next;
                            End; // fim-do-enquanto
                            //
                            dmFinanceiro.cdsParcelasCP.EnableControls;
                         End;
                         //
                         {If not (dmDados.IncluirTarefaUsuario( iUsuario,
                             'Incluiu Conta à Pagar : '+dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsString+' *F*')) Then
                                ShowMessage('Erro ao adicionar tarefa do usuário.');}
                    //End;
                    //
                    //Observacao.Free;
                    //
                     If not (dmDados.IncluirTarefaUsuario( iUsuario,
                             'Incluiu Conta à Pagar : '+uFuncoes.StrZero(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsString,7)+' *F*')) Then
                                ShowMessage('Erro ao adicionar tarefa do usuário.');
                    //
                    Application.MessageBox(PChar(MSG_OK),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    {MessageBox (Application.Handle, pChar('Registro gravado com sucesso!!!'),
                                 'ATENÇÃO',MB_ICONINFORMATION+ MB_OK);}
                    //
                    btClonar.Enabled := False;
                    //pnlDados.Enabled := False;
                    Registro;
                 Except
                    on Exc:Exception do
                    begin
                         Application.MessageBox(PChar(MSG_ERRO+#13+Exc.Message),
                            'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                         BtCancelarClick(Sender);
                    End;
                 End;
                 //
          //End;
          //
          Tratabotoes;
end;

procedure TfrmCadContaPagar.Buscar(aCodigo: String);
begin
    uFuncoes.FilterCDS(dmFinanceiro.cdsContaPagar, fsInteger, aCodigo);
    //
    If not (dmFinanceiro.cdsContaPagar.IsEmpty) Then
     begin
         dmFinanceiro.Carregar_Parcelas_CP(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsInteger);
         //TotalCompra(dmFinanceiro.cdsParcelasCP);
         AtualizaValor;
     End;
end;

procedure TfrmCadContaPagar.AtualizaValor;
begin
//     lbl_VLTOTAL.Caption := FormatFloat('###,##0.#0', TotalCompra(dmFinanceiro.cdsParcelasCP));
end;

procedure TfrmCadContaPagar.FormShow(Sender: TObject);
begin
     pnlDados.Enabled := False;
     If (BtAdicionar.Visible) Then
        BtAdicionar.SetFocus;
     REGISTRO;
     //
     dmFinanceiro.Abrir_Natureza('D');
     uFuncoes.RefreshCDS(dmDados.cdsListaFornecedores);
     {CarregarFornecedore(dmDados.cdsListaFornecedores, cmbFornecedor);
     CarregarNaturezas(dmFinanceiro.cdsListaNaturezas, cmbNatureza);}
     //
     If (dmFinanceiro.cdsContaPagar.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadContaPagar.Registro;
Var
   iSeq : Integer;
begin
     DMDados.AbrirTabelaConfig;
     //
     If (dmDados.cdsConfigCFG_NRCOMPRA.AsInteger > 0) Then
         iSeq := uFuncoes.mvcodigomax('PAG_SEQUENCIA','CONTASPAGAR')
     Else
         iSeq := -1;
         //uFuncoes.FilterCDS(dmFinanceiro.cdsContaPagar, fsInteger, InttoStr(uFuncoes.mvcodigomax('PAG_SEQUENCIA','CONTASPAGAR')));
         With dmFinanceiro.cdsContaPagar do
          begin
               Close;
               CommandText := 'Select * from CONTASPAGAR Where (PAG_SEQUENCIA = :pSEQUENCIA)';
               Params[0].AsInteger := iSeq;
               open;
          End;
         //
         dbgridParcelas.ReadOnly := True;
         lblNrCompra.Caption := uFuncoes.StrZero(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsString,7) ;
         dbeDTCOMP.Date      := dmFinanceiro.cdsContaPagarPAG_DTCOMPRA.AsDateTime;
         {cmbFornecedor.Items.Add(dmDados.GetNomeForn(dmFinanceiro.cdsContaPagarPAG_IDFORNECEDOR.AsInteger));
         cmbNatureza.Items.Add(dmDados.GetNomeNatureza(dmFinanceiro.cdsContaPagarPAG_NATUREZADESPESA.AsInteger));}
         //mmoDescricao.Clear;
         // mmoDescricao.Lines.Add(dmFinanceiro.cdsContaPagarPAG_DESCRICAO.AsString);
         dbeNota.Text        := dmFinanceiro.cdsContaPagarPAG_NUMERONOTAFISCAL.AsString;
         dbeSerie.Text       := dmFinanceiro.cdsContaPagarPAG_SERIENOTAFISCAL.AsString;
         dbeQtParcelas.Value := dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger;
         //
         dmFinanceiro.Carregar_Parcelas_CP(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsInteger);
         AtualizaValor;
end;

procedure TfrmCadContaPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{    If not (dmFinanceiro.cdsContaPagar.IsEmpty) Then
       dmFinanceiro.cdsContaPagar.Close;}
end;

procedure TfrmCadContaPagar.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadContaPagar.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
{     If (dmFinanceiro.cdsContaPagar.Active) Then
     begin
        btClonar.Enabled := dmFinanceiro.cdsContaPagar.State IN [dsInsert, dsEdit];
        dbgridParcelas.ReadOnly := Not (dmFinanceiro.cdsContaPagar.State IN [dsInsert, dsEdit]);
     End;}
end;

procedure TfrmCadContaPagar.Tratabotoes;
begin
     BtAdicionar.Enabled := not BtAdicionar.Enabled;
     BtGravar.Enabled    := not BtGravar.Enabled;
     BtCancelar.Enabled  := not BtCancelar.Enabled;
     //btClonar.Enabled    := not btClonar.Enabled;
     BtSair.Enabled      := not BtSair.Enabled;
     pnlDados.Enabled    := not pnlDados.Enabled;
end;

procedure TfrmCadContaPagar.ppmFornecedoresClick(Sender: TObject);
begin
     FrmMain.AbreForm(TfrmCadFornecedores, frmCadFornecedores);
     //
     uFuncoes.RefreshCDS(dmDados.cdsListaFornecedores);
end;

procedure TfrmCadContaPagar.ppmNaturezas1Click(Sender: TObject);
begin
     //FrmMain.AbreForm(TfrmCadFornecedores, frmCadFornecedores);
     //
     dmFinanceiro.Abrir_Natureza('D');
end;


procedure TfrmCadContaPagar.NovoRegistro;
Var
    M_NRCOMP : String;
begin
     DMDados.AbrirTabelaConfig;
     //
     M_NRCOMP := uFuncoes.StrZero(InttoStr(DMDados.cdsConfigCFG_NRCOMPRA.AsInteger + 1),7);
     lblNrCompra.Caption := M_NRCOMP;
     dbeDTCOMP.Date      := Date();
     dbeQtParcelas.Value := 1;
     dbeNota.Clear;
     dbeSerie.Clear;
     mmoDescricao.Clear;
     //
     dmFinanceiro.Carregar_Parcelas_CP(-1);
end;

procedure TfrmCadContaPagar.CarregarFornecedore(aCds: TClientDataSet;
  oCombo: TComboBox);
begin
     uFuncoes.RefreshCDS(aCds);
     //
     oCombo.Clear;
     //
     With aCds do
      begin
           First;
           While not (Eof) do
            begin
                oCombo.Items.Add(FieldByName('FOR_FANTASIA').AsString);
                //
                Next;
            End;
      End;
end;

procedure TfrmCadContaPagar.CarregarNaturezas(aCds: TClientDataSet;
  oCombo: TComboBox);
begin
     uFuncoes.RefreshCDS(aCds);
     //
     oCombo.Clear;
     //
     With aCds do
      begin
           First;
           While not (Eof) do
            begin
                oCombo.Items.Add(FieldByName('NAT_NOME').AsString);
                //
                Next;
            End;
      End;
end;

procedure TfrmCadContaPagar.dbeSerieExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeSerie.Text) Then
        dbeSerie.Text := uFuncoes.StrZero(dbeSerie.Text,2);
end;

procedure TfrmCadContaPagar.dbeNotaExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeNota.Text) Then
        dbeNota.Text := uFuncoes.StrZero(dbeNota.Text,10);
end;

procedure TfrmCadContaPagar.dbeNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8,#13] ) then
      key:=#0;
end;

procedure TfrmCadContaPagar.FormCreate(Sender: TObject);
begin
   If not (UFrmMain.admin) Then
   begin
     //
     novo    := UFrmMain.aNovo;
     alterar := UFrmMain.aAlterar;
     apagar  := UFrmMain.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dmDados.Verificar_Direito_Acesso(
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Incluir'));
           //
           novo    := UFrmMain.aNovo;
           alterar := UFrmMain.aAlterar;
           apagar  := UFrmMain.aApagar;
           //
     End;
     //
     FrmMain.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     {BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');}
  End;
end;

end.
