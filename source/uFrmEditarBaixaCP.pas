unit uFrmEditarBaixaCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, DBCtrls, ToolEdit, RXDBCtrl, Mask,
  Buttons;

type
  TfrmEditarBaixaCP = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    dsCadastro: TDataSource;
    cmbFornecedores: TDBLookupComboBox;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    Label5: TLabel;
    dbeNotaFiscal: TDBEdit;
    Label6: TLabel;
    dbeSerie: TDBEdit;
    Label7: TLabel;
    dbeDTCOMP: TDBDateEdit;
    Label8: TLabel;
    cmbNatureza: TDBLookupComboBox;
    Label9: TLabel;
    mmoDescricao: TDBMemo;
    Label10: TLabel;
    Label11: TLabel;
    dbeVALOR: TDBEdit;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbeNRAGEN: TDBEdit;
    Label14: TLabel;
    dbeNRCONT: TDBEdit;
    Label15: TLabel;
    dbeNRCHEQ: TDBEdit;
    Label16: TLabel;
    dbeVLJURO: TDBEdit;
    Label17: TLabel;
    dbeVLDESC: TDBEdit;
    Label18: TLabel;
    Label20: TLabel;
    dbeVLPAGO: TDBEdit;
    btOK: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    dbeDTVENC: TDBDateEdit;
    dbeDTPAGA: TDBDateEdit;
    cmbBancos: TDBLookupComboBox;
    lblModalidade: TLabel;
    cmbModalidades: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label21: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure dbeDTPAGAExit(Sender: TObject);
    procedure dbeNRCONTExit(Sender: TObject);
    procedure dbeNRCHEQExit(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeVLPAGOExit(Sender: TObject);
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
  frmEditarBaixaCP: TfrmEditarBaixaCP;
  M_FLOPER, M_FLGRAV : String;

implementation

uses uDMFinanceiro, uDMDados, uFrmMain, uFuncoes;

{$R *.dfm}

procedure TfrmEditarBaixaCP.FormShow(Sender: TObject);
begin
     uFuncoes.RefreshCDS(dmFinanceiro.cdsListaBanco);
     uFuncoes.RefreshCDS(dmDados.cdsListaFornecedores);
     dmFinanceiro.Abrir_Natureza('D');
     //
     btOK.Visible       := False;
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
        dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsFloat :=
            dmFinanceiro.cdsContaPagarPAG_VALORPARCELA.AsFloat; 
        //
        If (dbeVLPAGO.Enabled) Then
          dbeVLPAGO.SetFocus;
     End;
     //
     IF (M_FLOPER = 'C') Then
     begin
          BtGravar.Visible   := False;
          BtCancelar.Visible := False;
          btOK.Left := BtGravar.Left;
          //
          btOK.Visible       := True;
          //
          CONTROLES_LEITURA;
          //
          If (btOK.CanFocus) Then
             btOK.SetFocus;
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
end;

procedure TfrmEditarBaixaCP.BtCancelarClick(Sender: TObject);
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
        dsCadastro.DataSet.Cancel;
     //
     dsCadastro.DataSet.Close;
     //
     Close;
end;

procedure TfrmEditarBaixaCP.dbeDTVENCExit(Sender: TObject);
begin
   If (dsCadastro.DataSet.State in [dsEdit]) Then
     If (dbeDTVENC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTVENC.Text);
              dbeDTVENC.Text := DatetoStr(dbeDTVENC.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTVENC.Clear;
                     dbeDTVENC.SetFocus;
                     Exit;
                End;
           end;
     End;
end;

procedure TfrmEditarBaixaCP.dbeDTPAGAExit(Sender: TObject);
begin
   If (dsCadastro.DataSet.State in [dsEdit]) Then
     If (dbeDTPAGA.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTPAGA.Text);
              dbeDTPAGA.Text := DatetoStr(dbeDTPAGA.Date);
              //
              If (dbeDTPAGA.Date > Date()) Then
                begin
                     Application.MessageBox(PChar('Data de pagamento deve ser menor '+#13+
                          'ou igual a data atual.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTPAGA.Date := Date();
                     dbeDTPAGA.SetFocus;
                     Exit;
                End;
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTPAGA.Clear;
                     dbeDTPAGA.SetFocus;
                     Exit;
                End;
           end;
     End;
end;

procedure TfrmEditarBaixaCP.dbeNRCONTExit(Sender: TObject);
begin
   If (dsCadastro.DataSet.State in [dsEdit]) and
    not uFuncoes.Empty(dbeNRCONT.Text) Then
      dbeNRCONT.Text := uFuncoes.StrZero(dbeNRCONT.Text, 10);
end;

procedure TfrmEditarBaixaCP.dbeNRCHEQExit(Sender: TObject);
begin
   If (dsCadastro.DataSet.State in [dsEdit]) and
    not uFuncoes.Empty(dbeNRCHEQ.Text) Then
      dbeNRCHEQ.Text := uFuncoes.StrZero(dbeNRCHEQ.Text, 10);
end;

procedure TfrmEditarBaixaCP.BtGravarClick(Sender: TObject);
Var
  iUsuario : Integer;
  M_DTMOVI : TDate;
  M_HOMOVI, aParcela, aCompra : String;
  M_VLPAGAR, M_VLPARC_JURO : Double;
begin
 iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
 M_DTMOVI := Date();
 M_HOMOVI := Copy(TimetoStr(Time()),1,5);
 //
 If (M_FLOPER = 'E') Then
  begin

     If Application.MessageBox('Salvar Alterações?',
       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
      begin
       If (dsCadastro.DataSet.State in [dsEdit]) Then
         begin
              try
                  dmFinanceiro.cdsContaPagarPAG_USALTE.AsInteger  := iUsuario;
                  dmFinanceiro.cdsContaPagarPAG_DTALTE.AsDateTime := M_DTMOVI;
                  dmFinanceiro.cdsContaPagarPAG_HOALTE.AsString   := M_HOMOVI;
                  //
                  dmFinanceiro.cdsContaPagar.ApplyUpdates(0);
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
     M_VLPAGAR     := 0;
     M_VLPARC_JURO := 0;
     //
     If uFuncoes.Empty(dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsString) Then
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
     M_VLPAGAR     := dsCadastro.DataSet.FieldByName('PAG_VALORPAGO').AsFloat;
     M_VLPARC_JURO := dsCadastro.DataSet.FieldByName('PAG_VALORPARCELA').AsFloat +
               dsCadastro.DataSet.FieldByName('PAG_VALORJUROS').AsFloat;
     //
     If (dsCadastro.DataSet.FieldByName('PAG_VALORJUROS').AsFloat > 0 ) Then
        If (M_VLPAGAR < M_VLPARC_JURO) Then
           begin
              Application.MessageBox(PChar('O campo valor pago está inferior ao total do débito.'),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeVLPAGO.SetFocus;
              Exit;
           End;
     //
     If Application.MessageBox('Confirma Baixa de Parcela.',
       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
      begin
       If (dsCadastro.DataSet.State in [dsEdit]) Then
         begin
              if not uFuncoes.Empty(dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsString) Then
               begin
                 if (dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsFloat <= 0) Then
                   begin
                       Application.MessageBox(PChar('Digite um valor válido para Valor Pago.'),
                           'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                       dbeVLPAGO.SetFocus;
                       Exit;
                   End;
                   //
                   if (dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsFloat <
                      dmFinanceiro.cdsContaPagarPAG_VALORPARCELA.AsFloat) Then
                     begin
                         Application.MessageBox(PChar('Valor Pago inferior ao valor da Parcela.'),
                             'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                         dbeVLPAGO.SetFocus;
                         Exit;
                     End;
               End;
              //
              M_DTMOVI := Date();
              M_HOMOVI := Copy(TimetoStr(Time()),1,5);
              aParcela := uFuncoes.StrZero(dmFinanceiro.cdsContaPagarPAG_NRPARCELA.AsString,2);
              aCompra  := uFuncoes.StrZero(dmFinanceiro.cdsContaPagarPAG_IDCONTA.AsString,7);
              //
              try
                  dmFinanceiro.cdsContaPagarPAG_SITUACAO.AsString := 'P';
                  dmFinanceiro.cdsContaPagarPAG_USALTE.AsInteger  := iUsuario;
                  dmFinanceiro.cdsContaPagarPAG_DTALTE.AsDateTime := M_DTMOVI;
                  dmFinanceiro.cdsContaPagarPAG_HOALTE.AsString   := M_HOMOVI;
                  dmFinanceiro.cdsContaPagar.ApplyUpdates(0);
                  //
                  {If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Baixou CP Compra :'+aCompra+ ' PC :'+aParcela+
                        ' Valor :'+FormatFloat('###,##0.#0', dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsFloat) +' *F*')) Then
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

procedure TfrmEditarBaixaCP.DESABILITAR_CONTROLES(W_TIPO: String);
begin
     If (W_TIPO = 'D') Then
       Begin
           dbeNotaFiscal.ReadOnly := True;
           dbeSerie.ReadOnly := True;
           dbeDTCOMP.ReadOnly := True;
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
           dbeNotaFiscal.ReadOnly := False;
           dbeSERIE.ReadOnly := False;
           dbeDTCOMP.ReadOnly := True;
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

procedure TfrmEditarBaixaCP.CONTROLES_LEITURA;
begin
     dbeNRCONT.ReadOnly := True;
     dbeSERIE.ReadOnly := True;
     dbeDTCOMP.ReadOnly := True;
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

procedure TfrmEditarBaixaCP.CONTROLES(TIPO: String);
begin
     If (TIPO = 'D') Then
     Begin
         dbeDTCOMP.Enabled    := True;
         dbeNotaFiscal.Enabled    := False;
         dbeSERIE.Enabled     := False;
         mmoDescricao.Enabled := False;
         cmbNatureza.Enabled    := False;
         //
         dbeVALOR.Enabled     := False;
         //cmbLojas.Enabled    := False;
         dbeNRAGEN.Enabled    := False;
         dbeNRCONT.Enabled    := False;
         dbeNRCHEQ.Enabled    := False;
         //
         M_FLGRAV := 'N';
     End;
     //
     If (TIPO = 'H') Then
     Begin
         dbeDTCOMP.Enabled    := True;
         dbeNotaFiscal.Enabled    := True;
         dbeSERIE.Enabled     := True;
         mmoDescricao.Enabled := True;
         cmbNatureza.Enabled    := True;
         //
         dbeVALOR.Enabled     := True;
         cmbBancos.Enabled    := True;
         dbeNRAGEN.Enabled    := True;
         dbeNRCONT.Enabled    := True;
         dbeNRCHEQ.Enabled    := True;
         //M_FLGRAV := 'S';
     End;
end;

procedure TfrmEditarBaixaCP.dbeVLPAGOExit(Sender: TObject);
begin
      If (dsCadastro.DataSet.State in [dsEdit]) Then
        begin
           If not uFuncoes.Empty(dsCadastro.DataSet.FieldByName('PAG_VALORPAGO').AsString) Then
             If (dsCadastro.DataSet.FieldByName('PAG_VALORPAGO').AsFloat <
                dsCadastro.DataSet.FieldByName('PAG_VALORPARCELA').AsFloat) Then
               begin
                   Application.MessageBox(PChar('Valor pago está inferior ao '+#13
                               +'valor da parcela!!!'),'ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dsCadastro.DataSet.FieldByName('PAG_VALORPAGO').AsFloat :=
                               dsCadastro.DataSet.FieldByName('PAG_VALORPARCELA').AsFloat;
                   dbeVLPAGO.SetFocus;
                   Exit;
              End;
        End;
end;

procedure TfrmEditarBaixaCP.dbeVLJUROExit(Sender: TObject);
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
      begin
          //If (dsCadastro.DataSet.FieldByName('PAG_VALORJUROS').AsFloat > 0 ) Then
             CalcularValorTotalParcela;
              {dsCadastro.DataSet.FieldByName('PAG_VALORPAGO').AsFloat :=
                   dsCadastro.DataSet.FieldByName('PAG_VALORPARCELA').AsFloat +
                   dsCadastro.DataSet.FieldByName('PAG_VALORJUROS').AsFloat;}
      End;
end;

procedure TfrmEditarBaixaCP.CalcularValorTotalParcela;
begin
      dmFinanceiro.cdsContaPagarPAG_VALORPAGO.AsFloat :=
          (dmFinanceiro.cdsContaPagarPAG_VALORPARCELA.AsFloat +
          dmFinanceiro.cdsContaPagarPAG_VALORJUROS.AsFloat) -
          dmFinanceiro.cdsContaPagarPAG_VALORDESCONTO.AsFloat;
end;

procedure TfrmEditarBaixaCP.dbeVLDESCExit(Sender: TObject);
begin
     If (dsCadastro.DataSet.State in [dsEdit]) Then
      begin
          If (dsCadastro.DataSet.FieldByName('PAG_VALORDESCONTO').AsFloat > 0 ) Then
            If (dsCadastro.DataSet.FieldByName('PAG_VALORDESCONTO').AsFloat >
                dsCadastro.DataSet.FieldByName('PAG_VALORPARCELA').AsFloat ) Then
             begin
                  Application.MessageBox(PChar('Valor de desconto deve ser inferior'+#13+'ao valor da parcela'),'ATENÇÃO',
                   MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeVLDESC.SetFocus;
                   Exit;
             End;
             //
             CalcularValorTotalParcela;
      End;
end;

End.

