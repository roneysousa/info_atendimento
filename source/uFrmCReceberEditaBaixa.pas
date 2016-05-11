unit uFrmCReceberEditaBaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ToolEdit, RXDBCtrl, Mask, ExtCtrls,
  DB;

type
  TfrmCReceberEditaBaixa = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    lblModalidade: TLabel;
    dbeDTEMISSAO: TDBDateEdit;
    cmbNatureza: TDBLookupComboBox;
    mmoDescricao: TDBMemo;
    dbeVALOR: TDBEdit;
    DBEdit5: TDBEdit;
    dbeNRAGEN: TDBEdit;
    dbeNRCONT: TDBEdit;
    dbeNRCHEQ: TDBEdit;
    dbeVLJURO: TDBEdit;
    dbeVLDESC: TDBEdit;
    dbeVLPAGO: TDBEdit;
    dbeDTVENC: TDBDateEdit;
    dbeDTPAGA: TDBDateEdit;
    cmbBancos: TDBLookupComboBox;
    cmbModalidades: TDBLookupComboBox;
    Panel3: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    dsCadastro: TDataSource;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    edtNMCLIE: TEdit;
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeDTPAGAExit(Sender: TObject);
    procedure dbeVLPAGOExit(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeVLJUROExit(Sender: TObject);
    procedure dbeVLDESCExit(Sender: TObject);
  private
    { Private declarations }
    procedure DESABILITAR_CONTROLES(W_TIPO : String);
    procedure CONTROLES_LEITURA;
    procedure CONTROLES(TIPO : String);
    Procedure CalcularValorTotalParcela();
  public
    { Public declarations }
  end;

var
  frmCReceberEditaBaixa: TfrmCReceberEditaBaixa;
  M_FLOPER, M_FLGRAV : String;

implementation

uses uDMFinanceiro, uFrmMain, uFuncoes, uDMDados;

{$R *.dfm}

procedure TfrmCReceberEditaBaixa.BtCancelarClick(Sender: TObject);
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
        dsCadastro.DataSet.Cancel;
     //
     dsCadastro.DataSet.Close;
     //
     Close;
End;

procedure TfrmCReceberEditaBaixa.CONTROLES(TIPO: String);
begin
     If (TIPO = 'D') Then
     Begin
         dbeDTEMISSAO.Enabled    := True;
         mmoDescricao.Enabled := False;
         cmbNatureza.Enabled    := False;
         //
         dbeVALOR.Enabled     := False;
         dbeNRAGEN.Enabled    := False;
         dbeNRCONT.Enabled    := False;
         dbeNRCHEQ.Enabled    := False;
         //
         M_FLGRAV := 'N';
     End;
     //
     If (TIPO = 'H') Then
     Begin
         dbeDTEMISSAO.Enabled    := True;
         mmoDescricao.Enabled := True;
         cmbNatureza.Enabled    := True;
         //
         dbeVALOR.Enabled     := True;
         cmbBancos.Enabled    := True;
         dbeNRAGEN.Enabled    := True;
         dbeNRCONT.Enabled    := True;
         dbeNRCHEQ.Enabled    := True;
         //
     End;
end;

procedure TfrmCReceberEditaBaixa.CONTROLES_LEITURA;
begin
     dbeDTEMISSAO.ReadOnly := True;
     mmoDescricao.ReadOnly := True;
     cmbNatureza.ReadOnly := True;
     dbeDTVENC.ReadOnly := True;
     dbeVALOR.ReadOnly  := True;
     cmbBancos.ReadOnly := True;
     dbeNRAGEN.ReadOnly := True;
     dbeNRCONT.ReadOnly := True;
     dbeNRCHEQ.ReadOnly := True;
     //
     dbeVLJURO.ReadOnly := True;
     dbeVLDESC.ReadOnly := True;
     dbeVLPAGO.ReadOnly := True;
     dbeDTPAGA.ReadOnly := True;
end;

procedure TfrmCReceberEditaBaixa.DESABILITAR_CONTROLES(W_TIPO: String);
begin
     If (W_TIPO = 'D') Then
       Begin
           dbeDTEMISSAO.ReadOnly := True;
           mmoDescricao.ReadOnly := True;
           cmbNatureza.ReadOnly := True;
           dbeDTVENC.ReadOnly := True;
           dbeVALOR.ReadOnly  := True;
           cmbBancos.ReadOnly := True;
           dbeNRAGEN.ReadOnly := True;
           dbeNRCONT.ReadOnly := True;
           dbeNRCHEQ.ReadOnly := True;
           //
           dbeVLJURO.Enabled := True;
           dbeVLDESC.Enabled := True;
           dbeVLPAGO.Enabled := True;
           dbeDTPAGA.Enabled := True;
       End
       Else
       Begin
           dbeDTEMISSAO.ReadOnly := True;
           mmoDescricao.ReadOnly := False;
           dbeDTVENC.ReadOnly := False;
           dbeVALOR.ReadOnly  := False;
           cmbBancos.ReadOnly := False;
           dbeNRAGEN.ReadOnly := False;
           dbeNRCONT.ReadOnly := False;
           dbeNRCHEQ.ReadOnly := False;
           //
           dbeVLJURO.Enabled := False;
           dbeVLDESC.Enabled := False;
           dbeVLPAGO.Enabled := False;
           dbeDTPAGA.Enabled := False;
       End;
end;

procedure TfrmCReceberEditaBaixa.FormShow(Sender: TObject);
begin
     uFuncoes.RefreshCDS(dmFinanceiro.cdsListaBanco);
     dmFinanceiro.Abrir_Natureza('C');
     //
     IF (M_FLOPER = 'E') Then
     Begin
        DESABILITAR_CONTROLES('H');
        //
        lblModalidade.Visible  := False;
        cmbModalidades.Visible := False;
     End;
     //
     IF (M_FLOPER = 'B') Then
     begin
        DESABILITAR_CONTROLES('D');
        //
        cmbBancos.Enabled  := True;
        dbeNRAGEN.Enabled  := True;
        dbeNRCONT.Enabled  := True;
        //
        dbeNRCHEQ.ReadOnly := False;
        dbeNRCHEQ.Enabled  := True;
        //dbeVLJURO.SetFocus;
        dbeDTPAGA.Date     := Date();
        //
        lblModalidade.Visible  := True;
        cmbModalidades.Visible := True;
        uFuncoes.RefreshCDS(dmFinanceiro.cdsListaModalidades);
        //
        If (dbeVLPAGO.Enabled) Then
          dbeVLPAGO.SetFocus;
     End;
     //
     IF (M_FLOPER = 'C') Then
     begin
          BtGravar.Visible   := False;
          BtCancelar.Visible := False;
          //
          CONTROLES_LEITURA;
     End;
     //
     If (M_FLGRAV = 'S') Then
        CONTROLES('H');
     If (M_FLGRAV = 'N') Then
        CONTROLES('D');
     //
     cmbBancos.ReadOnly    := False;
     dbeNRAGEN.ReadOnly    := False;
     dbeNRCONT.ReadOnly    := False;
     dbeNRCHEQ.ReadOnly    := False;
     //
     cmbBancos.Enabled    := True;
     dbeNRAGEN.Enabled    := True;
     dbeNRCONT.Enabled    := True;
     dbeNRCHEQ.Enabled    := True;
     //
     edtNMCLIE.Text := dmDados.GetNomeCliente(dmFinanceiro.cdsCReceberREC_CLIENTE.AsInteger);
end;

procedure TfrmCReceberEditaBaixa.dbeDTPAGAExit(Sender: TObject);
begin
    If (dsCadastro.DataSet.State in [dsEdit]) and (dbeDTPAGA.Text <> '  /  /    ') Then
        begin
             try
                 dbeDTPAGA.Date := StrToDate(dbeDTPAGA.Text);
                 //
                 If (dbeDTPAGA.Date > Date) Then
                  begin
                       Application.MessageBox(PChar('Data de recebimento deve ser '+#13+' menor ou igual a data atual.' ),
                          'Aviso', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                       dbeDTPAGA.SetFocus;
                       Exit;
                  End;
             except
              on EConvertError do
                begin
                    ShowMessage ('Data Inválida!');
                    dbeDTPAGA.SetFocus;
                    dbeDTPAGA.Clear;
                End;
             end;
        End;
end;

procedure TfrmCReceberEditaBaixa.dbeVLPAGOExit(Sender: TObject);
Var
   fValor : Double;
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
        begin
           fValor := (dsCadastro.DataSet.FieldByName('REC_VALOR').AsFloat +
                     dsCadastro.DataSet.FieldByName('REC_VALORJUROS').AsFloat)-
                     dsCadastro.DataSet.FieldByName('REC_VALORDESCONTO').AsFloat;
           //
           If not uFuncoes.Empty(dsCadastro.DataSet.FieldByName('REC_VLPAGO').AsString) Then
             If (dsCadastro.DataSet.FieldByName('REC_VLPAGO').AsFloat < fValor) Then
               begin
                   Application.MessageBox(PChar('Valor recebido está inferior ao '+#13
                               +'valor da parcela!!!'),'ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dsCadastro.DataSet.FieldByName('REC_VLPAGO').AsFloat :=
                               dsCadastro.DataSet.FieldByName('REC_VALOR').AsFloat;
                   dbeVLPAGO.SetFocus;
                   Exit;
              End;
        End;
end;

procedure TfrmCReceberEditaBaixa.BtGravarClick(Sender: TObject);
Var
  iUsuario : Integer;
  M_DTMOVI : TDate;
  M_HOMOVI, aParcela, aCredito : String;
begin
 If (M_FLOPER = 'E') Then
  begin
     If Application.MessageBox('Salvar Alterações?',
       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
      begin
       If (dsCadastro.DataSet.State in [dsEdit]) Then
         begin
              try
                  dmFinanceiro.cdsCReceberREC_USALTE.AsInteger  := iUsuario;
                  dmFinanceiro.cdsCReceberREC_DTALTE.AsDateTime := M_DTMOVI;
                  dmFinanceiro.cdsCReceberREC_HOMOVI.AsString   := M_HOMOVI;
                  //
                  dmFinanceiro.cdsCReceber.ApplyUpdates(0);
                  //
                  Application.MessageBox(PChar(MSG_OK),
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Except
                   on Exc:Exception do
                     begin
                           Application.MessageBox(PChar(MSG_ERRO+#13+Exc.Message),
                              'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                           BtCancelarClick(Sender);
                     End;
              End;
         End;
     End;
  End;
  //
 If (M_FLOPER = 'B') Then
  begin
     //
     If uFuncoes.Empty(dmFinanceiro.cdsCReceberREC_VLPAGO.AsString) Then
       begin
            dbeVLPAGO.SetFocus;
            Exit;
       End;
     //
     If uFuncoes.Empty(cmbModalidades.Text) Then
       begin
            Application.MessageBox(PChar('Selecione a modalidade.'),
                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbModalidades.SetFocus;
            Exit;
       End;
     //
     If Application.MessageBox('Confirma Recebimento de Parcela.',
       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
      begin
       If (dsCadastro.DataSet.State in [dsEdit]) Then
         begin
              if not uFuncoes.Empty(dmFinanceiro.cdsCReceberREC_VLPAGO.AsString) Then
               begin
                 if (dmFinanceiro.cdsCReceberREC_VLPAGO.AsFloat <= 0) Then
                   begin
                       Application.MessageBox(PChar('Digite um valor válido para Valor Pago.'),
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                       dbeVLPAGO.SetFocus;
                       Exit;
                   End;
                   //
                   if (dmFinanceiro.cdsCReceberREC_VLPAGO.AsFloat <
                      dmFinanceiro.cdsCReceberREC_VALOR.AsFloat) Then
                     begin
                         Application.MessageBox(PChar('Valor Pago inferior ao valor da Parcela.'),
                             'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                         dbeVLPAGO.SetFocus;
                         Exit;
                     End;
               End;
              //
              iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
              M_DTMOVI := Date();
              M_HOMOVI := Copy(TimetoStr(Time()),1,5);
              aParcela := uFuncoes.StrZero(dmFinanceiro.cdsCReceberREC_NRPARCELA.AsString,2);
              aCredito := uFuncoes.StrZero(dmFinanceiro.cdsCReceberREC_IDCONTASRECEBER.AsString,7);
              //
              try
                  dmFinanceiro.cdsCReceberREC_SITUACAO.AsString := 'R';
                  dmFinanceiro.cdsCReceberREC_DTCREDITO.AsDateTime :=
                      dmFinanceiro.cdsCReceberREC_DTPAGAMENTO.AsDateTime;
                  dmFinanceiro.cdsCReceberREC_USALTE.AsInteger  := iUsuario;
                  dmFinanceiro.cdsCReceberREC_DTALTE.AsDateTime := M_DTMOVI;
                  dmFinanceiro.cdsCReceberREC_HOMOVI.AsString   := M_HOMOVI;
                  //
                  dmFinanceiro.cdsCReceber.ApplyUpdates(0);
                  //
                  {If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Baixou CR Credito :'+aCredito+ ' PC :'+aParcela+
                        ' Valor :'+FormatFloat('###,##0.#0', dmFinanceiro.cdsCReceberREC_VLPAGO.AsFloat) +' *F*')) Then
                        ShowMessage('Erro ao adicionar tarefa do usuário.');}
                  //
                  Application.MessageBox(PChar('Parcela baixada com sucesso.'),
                   'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Except
                   on Exc:Exception do
                     begin
                           Application.MessageBox(PChar(MSG_ERRO+#13+Exc.Message),
                              'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                           BtCancelarClick(Sender);
                     End;
              End;
         End;
     End;

  End;
  //
  dsCadastro.DataSet.Close;
  //
  Close;

end;

procedure TfrmCReceberEditaBaixa.CalcularValorTotalParcela;
begin
      dsCadastro.DataSet.FieldByName('REC_VLPAGO').AsFloat :=
          (dsCadastro.DataSet.FieldByName('REC_VALOR').AsFloat +
          dsCadastro.DataSet.FieldByName('REC_VALORJUROS').AsFloat) -
          dsCadastro.DataSet.FieldByName('REC_VALORDESCONTO').AsFloat;
end;

procedure TfrmCReceberEditaBaixa.dbeVLJUROExit(Sender: TObject);
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
       CalcularValorTotalParcela;
end;

procedure TfrmCReceberEditaBaixa.dbeVLDESCExit(Sender: TObject);
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
       CalcularValorTotalParcela;
end;

end.

