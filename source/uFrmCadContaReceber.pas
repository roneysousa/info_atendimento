unit uFrmCadContaReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls,
  DB, Mask, ToolEdit, RXDBCtrl, DBClient, Menus;

type
  TfrmCadCReceber = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtAdicionar: TBitBtn;
    btClonar: TBitBtn;
    BtGravar: TBitBtn;
    BtCancelar: TBitBtn;
    BtSair: TBitBtn;
    dbgridParcelas: TDBGrid;
    Label1: TLabel;
    DBText1: TDBText;
    dsCadastro: TDataSource;
    Label4: TLabel;
    dbeDTEMISSAO: TDBDateEdit;
    Label5: TLabel;
    cmbNatureza: TDBLookupComboBox;
    Label6: TLabel;
    mmoDescricao: TDBMemo;
    Label7: TLabel;
    dbeQtParcelas: TDBEdit;
    dsParcelas: TDataSource;
    PopupMenu1: TPopupMenu;
    mnuEscritoriosItem: TMenuItem;
    mnuBancosItem: TMenuItem;
    mnuNaturezaItem: TMenuItem;
    Label2: TLabel;
    dbeCDCLIE: TDBEdit;
    edtNMCLIE: TEdit;
    spLocCliente: TSpeedButton;
    procedure BtSairClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeDTEMISSAOExit(Sender: TObject);
    procedure dbgridParcelasColEnter(Sender: TObject);
    procedure dbgridParcelasColExit(Sender: TObject);
    procedure dbgridParcelasEnter(Sender: TObject);
    procedure dbgridParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeQtParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure dbeQtParcelasExit(Sender: TObject);
    procedure dbeQtParcelasEnter(Sender: TObject);
    procedure dbgridParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure btClonarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuEscritoriosItemClick(Sender: TObject);
    procedure mnuBancosItemClick(Sender: TObject);
    procedure mnuNaturezaItemClick(Sender: TObject);
    procedure dbeCDCLIEExit(Sender: TObject);
    procedure dbeCDCLIEChange(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Tratabotoes;
    procedure Registro;
    Procedure DataHora;
    Procedure ALTUALIZAR_PARCELAS(aCDS : TClientDataSet; iQuantPC : Integer);
    procedure Buscar(aCodigo : String);
  public
    { Public declarations }
    M_DTMOVI : TDate;
    M_HOMOVI : String;
  end;

var
  frmCadCReceber: TfrmCadCReceber;
  M_VLCONT : Double;

implementation

uses uDMFinanceiro, uDMDados, uFrmMain, uFuncoes, uFrmLocClientes;
//uFrmCadNaturezas;

{$R *.dfm}

procedure TfrmCadCReceber.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCadCReceber.Tratabotoes;
begin
     BtAdicionar.Enabled := not BtAdicionar.Enabled;
     BtGravar.Enabled    := not BtGravar.Enabled;
     BtCancelar.Enabled  := not BtCancelar.Enabled;
     btClonar.Enabled    := not btClonar.Enabled;
     BtSair.Enabled      := not BtSair.Enabled;
end;

procedure TfrmCadCReceber.BtAdicionarClick(Sender: TObject);
Var
    iUsuario : Integer;
begin
    Tratabotoes;
    //
          iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
          DataHora;
          //
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('REC_SEQUENCIA').AsInteger :=
                    DMDados.cdsConfigCFG_SEQCRECEBER.AsInteger + 1;
                 FieldByName('REC_IDCONTASRECEBER').AsInteger  :=
                    DMDados.cdsConfigCFG_NRCREDITO.AsInteger + 1;
                 FieldByName('REC_DTMOVI').AsDateTime := M_DTMOVI;
                 FieldByName('REC_HOMOVI').AsString   := M_HOMOVI;
                 FieldByName('REC_USCADA').AsInteger  := iUsuario;
                 FieldByName('REC_QTPARCELAS').AsInteger := 1;
                 FieldByName('REC_NRPARCELA').AsInteger  := 1;
            End;
            //
            dmFinanceiro.Carregar_Parcelas_CR(dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsInteger);
            //
            dbeCDCLIE.SetFocus;
end;

procedure TfrmCadCReceber.BtGravarClick(Sender: TObject);
Var
    iUsuario : Integer;
    M_SEQREC, M_IDCTRE, W_QTPARC, M_CDLOJA, W_NRPARC, V_NRPARC : Integer;
    M_HOMOVI, M_DESCRICAO : String;
    M_VLMOVI  : Double;
    M_CDNATU, M_NRBANC, M_IDBANC, M_CDCLIE : Integer;
    M_DTMOVI, M_DTVENC  : TDate;
    M_CODIGO  : Integer;
    M_NRAGEN, M_NRCOTA, M_NRCHEQ : String;
begin
     If (dbeDTEMISSAO.Text = '  /  /    ') Then
     Begin
          Application.MessageBox('Digite a data da emissão','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeDTEMISSAO.SetFocus;
          Exit;
     End;
      //
     If uFuncoes.Empty(dbeCDCLIE.Text) Then
       Begin
           Application.MessageBox('Digite o código do cliente.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCDCLIE.SetFocus;
           Exit;
       End;
     //
    { If (mmoDescricao.Lines.Text = ' ')
        or (mmoDescricao.Lines.Count = 0) Then
     Begin
          Application.MessageBox('Digite a descrição da conta!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          mmoDescricao.SetFocus;
          Exit;
     End;}
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
                    Locate('PAR_NRPARC',V_NRPARC,[]);
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
                          Locate('PAR_NRPARC',V_NRPARC,[]);
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
          //
          If (dsCadastro.DataSet.State in [dsInsert]) Then
            begin
                 DMDados.AbrirTabelaConfig;
                 //
                 dmDados.Start;
                 try
                     dmDados.cdsConfig.Edit;
                     dmDados.cdsConfigCFG_NRCREDITO.AsInteger :=
                         dmDados.cdsConfigCFG_NRCREDITO.AsInteger + 1;
                     dmDados.cdsConfig.ApplyUpdates(0);
                     //
                     M_IDCTRE := dmDados.cdsConfigCFG_NRCREDITO.AsInteger;
                     //
                     dmDados.Comit(Transc);
                  Except
                     dmDados.Rollback;
                     raise Exception.Create('Erro ao tentar gerar número de crédito.');
                  End;
                 {dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsInteger :=
                     dmDados.cdsConfigCFG_IDCONTAPAGAR.AsInteger;}
                 //
                 try
                    M_HOMOVI := Copy(TimetoStr(Time),1,5);
                    M_DTMOVI := Date;
                    //
                    M_CDLOJA := 1;
                    M_CDCLIE := dmFinanceiro.cdsCReceberREC_CLIENTE.AsInteger;
                    M_CDNATU := dmFinanceiro.cdsCReceberREC_NATUREZA.AsInteger;
                    W_QTPARC := dmFinanceiro.cdsCReceberREC_QTPARCELAS.AsInteger;
                    M_DESCRICAO := mmoDescricao.Lines.Text;
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
                              dmDados.Start;
                              try
                                  dmDados.cdsConfig.Edit;
                                  dmDados.cdsConfigCFG_SEQCRECEBER.AsInteger :=
                                     dmDados.cdsConfigCFG_SEQCRECEBER.AsInteger + 1;
                                  dmDados.cdsConfig.ApplyUpdates(0);
                                  //
                                  M_SEQREC := dmDados.cdsConfigCFG_SEQCRECEBER.AsInteger;
                                  //
                                  dmDados.Comit(Transc);
                              Except
                                   dmDados.Rollback;
                                   raise Exception.Create('Erro ao tentar gerar número de sequencia.');
                              End;
                              //
                              W_NRPARC := dmFinanceiro.cdsParcelasCPPAR_NRPARC.AsInteger;
                              If (W_NRPARC = 1) Then
                                 M_CODIGO := M_SEQREC;
                              //
                              M_VLMOVI := dmFinanceiro.cdsParcelasCPPAR_VALOR.AsFloat;
                              M_DTVENC := dmFinanceiro.cdsParcelasCPPAR_DTVENC.AsDateTime;
                              M_NRBANC := dmFinanceiro.cdsParcelasCPPAR_BANCO.AsInteger;
                              M_NRAGEN := dmFinanceiro.cdsParcelasCPPAR_AGENCIA.AsString;
                              M_NRCOTA := dmFinanceiro.cdsParcelasCPPAR_NRCONTA.AsString;
                              M_NRCHEQ := dmFinanceiro.cdsParcelasCPPAR_NRCHEQUE.AsString;
                              //
                              {iSEQUENCIA, iIDCONTASRECEBER,
                              iNRPARCELA, iCDLOJA, iQTPARCELAS, iIDPLANOCONTA, iIDBANCO, iNATUREZA,
                              iIDTIPO, iUSCADA: Integer; aDTVENCIMENTO, aDTMOVI: TDate; fVALOR: Double;
                              aOBSERVACAO, aHOMOVI: String)
                              }
                              If Not (dmFinanceiro.IncluirParcelaCR(
                                     M_SEQREC, M_IDCTRE, W_NRPARC, M_CDLOJA, W_QTPARC, M_CDCLIE, M_NRBANC, M_CDNATU,
                                     1, iUsuario,  M_DTVENC, M_DTMOVI, M_VLMOVI,
                                     M_HOMOVI, M_NRCOTA, M_NRCHEQ, M_NRAGEN, mmoDescricao.Lines)) Then
                                 ShowMessage('Erro ao tenta incluir parcela :' + dmFinanceiro.cdsParcelasCPPAR_NRPARC.AsString);
                              //      Proximo Registro
                              dmFinanceiro.cdsParcelasCP.Next;
                            End; // fim-do-enquanto
                            //
                            dmFinanceiro.cdsParcelasCP.EnableControls;
                         End;
                         //
                         {If not (dmDados.IncluirTarefaUsuario( iUsuario,
                             'Incluiu Conta à Receber : '+dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsString+' *F*')) Then
                                ShowMessage('Erro ao adicionar tarefa do usuário.');}
                    //
                    Application.MessageBox(PChar(MSG_OK),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                    //
                    dmFinanceiro.cdsCReceber.Close;
                    //Buscar(InttoStr(M_CODIGO));  // M_CODIGO
                    //
                    Tratabotoes;
                    //
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
          End;
end;

procedure TfrmCadCReceber.BtCancelarClick(Sender: TObject);
begin
      Tratabotoes;
      //
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
           dsCadastro.DataSet.Cancel;
           //
      If not (dmFinanceiro.cdsCReceber.IsEmpty) Then
       begin
            dmFinanceiro.Carregar_Parcelas_CR(dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsInteger);
            edtNMCLIE.Text := dmDados.GetNomeCliente(dmFinanceiro.cdsCReceberREC_CLIENTE.AsInteger);
       End;
      if (dsCadastro.DataSet.IsEmpty) Then
           Close;
end;

procedure TfrmCadCReceber.Registro;
begin
     DMDados.AbrirTabelaConfig;
     //
     If (dmDados.cdsConfigCFG_SEQCRECEBER.AsInteger > 0) Then
      begin
          uFuncoes.FilterCDS(dmFinanceiro.cdsCReceber, fsInteger, InttoStr(uFuncoes.mvcodigomax('REC_SEQUENCIA','contasreceber')));
          //
          If not (dmFinanceiro.cdsCReceber.IsEmpty) Then
              dmFinanceiro.Carregar_Parcelas_CR(dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsInteger);
          //
          edtNMCLIE.Text := dmDados.GetNomeCliente(dmFinanceiro.cdsCReceberREC_CLIENTE.AsInteger);    
      End
     Else
         uFuncoes.FilterCDS(dmFinanceiro.cdsCReceber, fsInteger, '-1');
     //
end;

procedure TfrmCadCReceber.FormShow(Sender: TObject);
begin
     REGISTRO;
     //
     //uFuncoes.RefreshCDS(dmFinanceiro.cdsListaNaturezas);
     //
     With dmFinanceiro.cdsListaNaturezas do
      begin
           Close;
           Params[0].AsString := 'C';
           Open;
      End;
     //
     If (dmFinanceiro.cdsCReceber.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadCReceber.dbeDTEMISSAOExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
          and (dbeDTEMISSAO.Text <> '  /  /    ') Then
        begin
             try
                 dbeDTEMISSAO.Date := StrToDate(dbeDTEMISSAO.Text);
             except
              on EConvertError do
                begin
                    ShowMessage ('Data Inválida!');
                    dbeDTEMISSAO.SetFocus;
                    dbeDTEMISSAO.Clear;
                    Exit;
                End;
             end;
        End;
end;

procedure TfrmCadCReceber.DataHora;
begin
     M_DTMOVI := Date();
     M_HOMOVI := Copy(TimetoStr(Time()),1,5);
end;

procedure TfrmCadCReceber.dbgridParcelasColEnter(Sender: TObject);
begin
 if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
 begin
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
                'BAN_CODIGO','bancos')) Then
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
         //VALOR_CONTA;
   //
   If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_VALOR'))
     and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByname('PAR_VALOR').AsString) then
         //VALOR_CONTA;
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

procedure TfrmCadCReceber.dbgridParcelasColExit(Sender: TObject);
Var
   N_VLCONT : Real;
begin
 if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
 begin
    If (dbgridParcelas.SelectedField = dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC'))
      and not uFuncoes.Empty(dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC').AsString) Then
    Begin
      If (dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC').AsDateTime < Strtodate(dbeDTEMISSAO.Text)) Then
      Begin
           Application.MessageBox(PChar('Data de vencimento deve ser '+#13'maior ou igual a da compra!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmFinanceiro.cdsParcelasCP.FieldByName('PAR_DTVENC').AsDateTime := Strtodate(dbeDTEMISSAO.Text);
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

procedure TfrmCadCReceber.dbgridParcelasEnter(Sender: TObject);
begin
 if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
 begin
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

procedure TfrmCadCReceber.dbgridParcelasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
  begin
     if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     If (dmFinanceiro.cdsParcelasCP.Active = True) Then
     Begin
         IF (KEY = 38) or (key = 40) then // avalio se é seta para cima ou para baixo;
         Begin
             //VALOR_CONTA;
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

procedure TfrmCadCReceber.dbeQtParcelasKeyPress(Sender: TObject;
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

procedure TfrmCadCReceber.dbeQtParcelasExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
        and not uFuncoes.Empty(dbeQtParcelas.Text) Then
        begin
             If (dmFinanceiro.cdsCReceberREC_QTPARCELAS.AsInteger <= 0) Then
              begin
                   Application.MessageBox(PChar('Quantidade de Parcelas deve ser maoir que zero.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dmFinanceiro.cdsCReceberREC_QTPARCELAS.AsInteger := 1;
                   dbeQtParcelas.SetFocus;
                   Exit;
              End
              Else
              begin
                   If (dmFinanceiro.cdsCReceberREC_QTPARCELAS.AsInteger >= 1) Then
                     begin
                          dmFinanceiro.CRIAR_PARCELAS_PAGAR(dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsInteger,
                                    dmFinanceiro.cdsCReceberREC_QTPARCELAS.AsInteger);
                          //
                          dbgridParcelas.SetFocus;
                     End;
                   //
                   If (dmFinanceiro.cdsCReceberREC_QTPARCELAS.AsInteger < 1) Then
                          dmFinanceiro.cdsParcelasCP.Close;
              End;
        End;
end;

procedure TfrmCadCReceber.dbeQtParcelasEnter(Sender: TObject);
begin
    If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
     Begin
       If (dmFinanceiro.cdsParcelasCP.Active = True) Then
            dmFinanceiro.cdsParcelasCP.EmptyDataSet;
       //
       dmFinanceiro.cdsParcelasCP.Close;
     End;
end;

procedure TfrmCadCReceber.dbgridParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
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

procedure TfrmCadCReceber.btClonarClick(Sender: TObject);
begin
     If (dmFinanceiro.cdsParcelasCP.Active) Then
     begin
         ALTUALIZAR_PARCELAS(dmFinanceiro.cdsParcelasCP, dmFinanceiro.cdsContaPagarPAG_QTPARCELAS.AsInteger);
         //VALOR_CONTA;
     End;
end;

procedure TfrmCadCReceber.ALTUALIZAR_PARCELAS(aCDS: TClientDataSet;
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
    // lbl_VLTOTAL.Caption := FormatFloat('###,###,##0.#0',M_VLCONT);
end;

procedure TfrmCadCReceber.Buscar(aCodigo: String);
begin
    uFuncoes.FilterCDS(dmFinanceiro.cdsCReceber, fsInteger, aCodigo);
    //                 dmFinanceiro.cdsCReceber
    If not (dmFinanceiro.cdsCReceber.IsEmpty) Then
     begin
         edtNMCLIE.Text := dmDados.GetNomeCliente(dmFinanceiro.cdsCReceberREC_CLIENTE.AsInteger);
         dmFinanceiro.Carregar_Parcelas_CR(dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsInteger);
     End;
end;

procedure TfrmCadCReceber.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Inclusão'));
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

procedure TfrmCadCReceber.mnuEscritoriosItemClick(Sender: TObject);
begin
    {   frmMain.AbreForm(TfrmCadEscritorios, frmCadEscritorios);
       uFuncoes.RefreshCDS(dmFinanceiro.cdsListaEscritorios);}
end;

procedure TfrmCadCReceber.mnuBancosItemClick(Sender: TObject);
begin
   {  frmMain.AbreForm(TfrmCadBancos, frmCadBancos);
     uFuncoes.RefreshCDS(dmDados.cdsListaBancos);}
end;

procedure TfrmCadCReceber.mnuNaturezaItemClick(Sender: TObject);
begin
   {   frmMain.AbreForm(TfrmCadNatureza, frmCadNatureza);
      //
      With dmFinanceiro.cdsListaNaturezas do
      begin
           Close;
           Params[0].AsString := 'C';
           Open;
      End;
      //dmFinanceiro.Abrir_Natureza('C');    }
end;

procedure TfrmCadCReceber.dbeCDCLIEExit(Sender: TObject);
begin
   If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dbeCDCLIE.Text) Then
      If not (dmDados.ProcurarValor(dbeCDCLIE.Text, 'CLI_CODIGO', 'CLIENTES')) Then
        begin
             Application.MessageBox(Pchar('Código do cliente não cadastrado.'), 'Atenção',
                   MB_OK+MB_ICONWARNING);
             edtNMCLIE.Clear;
             dbeCDCLIE.Clear;
             dbeCDCLIE.SetFocus;
             Exit;
        End
        Else
            edtNMCLIE.Text := dmDados.GetNomeCliente(StrtoInt(dbeCDCLIE.Text));
end;

procedure TfrmCadCReceber.dbeCDCLIEChange(Sender: TObject);
begin
   If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
     and uFuncoes.Empty(dbeCDCLIE.Text) Then
      edtNMCLIE.Clear;
end;

procedure TfrmCadCReceber.spLocClienteClick(Sender: TObject);
begin
      dbeCDCLIE.SetFocus;
      Application.CreateForm(TfrmConsClientes, frmConsClientes);
      try
          frmConsClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                dmFinanceiro.cdsCReceberREC_CLIENTE.AsInteger :=
                    frmConsClientes.cdsConsultarCLI_CODIGO.AsInteger;
                cmbNatureza.SetFocus;
           End;
          //
          frmConsClientes.Free;
      End;
end;

procedure TfrmCadCReceber.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
     spLocCliente.Enabled := dsCadastro.DataSet.State in [dsInsert];
end;

procedure TfrmCadCReceber.dbeCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
           spLocClienteClick(Self);
      End;
end;

End.
