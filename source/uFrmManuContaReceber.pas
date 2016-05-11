unit uFrmManuContaReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, DB, DBClient,
  Grids, DBGrids, Provider, FMTBcd, SqlExpr;

type
  TfrmManuCReceber = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    btBaixa: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    edtDTINICIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label2: TLabel;
    edtNRCRED: TEdit;
    rgSituacao: TRadioGroup;
    rgPeriodos: TRadioGroup;
    Label3: TLabel;
    btFiltar: TBitBtn;
    grdConsultar: TDBGrid;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    lbl_TOTABERTAS: TLabel;
    lbl_Recebidas: TLabel;
    dbeCDCLIE: TEdit;
    edtNMCLIE: TEdit;
    dstConsulta: TSQLDataSet;
    cdsConsultaREC_SEQUENCIA: TIntegerField;
    cdsConsultaREC_IDCONTASRECEBER: TIntegerField;
    cdsConsultaREC_NRPARCELA: TIntegerField;
    cdsConsultaREC_CDLOJA: TIntegerField;
    cdsConsultaREC_CLIENTE: TIntegerField;
    cdsConsultaREC_DTMOVI: TDateField;
    cdsConsultaREC_DTVENCIMENTO: TDateField;
    cdsConsultaREC_DTPAGAMENTO: TDateField;
    cdsConsultaREC_VALOR: TFMTBCDField;
    cdsConsultaREC_SITUACAO: TStringField;
    cdsConsultaREC_VLPAGO: TFMTBCDField;
    cdsConsultaREC_BANCO: TIntegerField;
    cdsConsultaREC_NRCONTA: TStringField;
    cdsConsultaREC_AGENCIA: TStringField;
    cdsConsultaREC_NRCHEQUE: TStringField;
    cdsConsultaREC_ATRASO: TFloatField;
    cdsConsultaREC_NMSITUACAO: TStringField;
    spLocCliente: TSpeedButton;
    cdsConsultaREC_NMBANCO: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure edtNRCREDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtNRCREDExit(Sender: TObject);
    procedure cdsConsultaCalcFields(DataSet: TDataSet);
    procedure btFiltarClick(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure btBaixaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeCDCLIEExit(Sender: TObject);
    procedure dbeCDCLIEChange(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    Function Consulta() : Boolean;
    procedure TOTAIS(aCDS : TClientDataSet);
    procedure Limpar();
  public
    { Public declarations }
  end;

var
  frmManuCReceber: TfrmManuCReceber;

implementation

uses uFuncoes, uDMDados, uDMFinanceiro, uFrmMain, uFrmCReceberEditaBaixa,
  uFrmLocClientes;

{$R *.dfm}

procedure TfrmManuCReceber.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmManuCReceber.edtDTINICIALExit(Sender: TObject);
begin
  If (edtDTINICIAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINICIAL.Text);
              edtDTINICIAL.Text := DatetoStr(edtDTINICIAL.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINICIAL.Clear;
                     edtDTINICIAL.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmManuCReceber.edtDTFINALExit(Sender: TObject);
begin
     If (edtDTFINAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINAL.Text);
              edtDTFINAL.Text := DatetoStr(edtDTFINAL.Date);
              //
              If (edtDTFINAL.Date < edtDTINICIAL.Date) Then
              Begin
                   Application.MessageBox(PChar('Perido final deve ser maior ou igual ao inicial!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINAL.Date := Date;
                   edtDTFINAL.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINAL.Clear;
                     edtDTFINAL.SetFocus;
                End;
           end;
     End;

end;

procedure TfrmManuCReceber.edtNRCREDKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;


function TfrmManuCReceber.Consulta: Boolean;
Var
    M_FLSITU, Texto, M_CAMPO : String;
    M_DTINIC : TDate;
begin
      result := False;
     //
     Case rgSituacao.ItemIndex of
        0 : M_FLSITU := 'A';
        1 : M_FLSITU := 'R';
        2 : M_FLSITU := 'T';
     End;
     //
     If (rgPeriodos.ItemIndex = 0) Then
        M_CAMPO := 'REC_DTMOVI';
     If (rgPeriodos.ItemIndex = 1) Then
        M_CAMPO := 'REC_DTVENCIMENTO';
     If (rgPeriodos.ItemIndex = 2) Then
        M_CAMPO := 'REC_DTPAGAMENTO';
     //
     Texto := 'Select REC_SEQUENCIA, REC_IDCONTASRECEBER, REC_NRPARCELA, REC_CDLOJA, REC_CLIENTE, ';
     Texto := Texto + ' REC_DTMOVI, REC_DTVENCIMENTO, REC_DTPAGAMENTO, REC_VALOR, ';
     Texto := Texto + ' REC_SITUACAO, REC_VLPAGO, REC_BANCO, REC_NRCONTA, REC_AGENCIA, REC_NRCHEQUE ';
     Texto := Texto + ' from CONTASRECEBER ';
     //
     if (edtDTINICIAL.Text = '  /  /    ') Then
         M_DTINIC := StrtoDate('01/01/2000')
     Else
         M_DTINIC := edtDTINICIAL.Date;
     //
     With cdsConsulta do
     Begin
          DisableControls;
          Close;
          //
          Texto := Texto +' Where ('+ M_CAMPO +' >= :pDTINICIAL) ';
          //
          If (edtDTFINAL.Text <> '  /  /    ') Then
               Texto := Texto + ' AND ('+ M_CAMPO +'<= :pDTFINAL) ';
          //
          If (M_FLSITU <> 'T') Then
             Texto := Texto + ' and (REC_SITUACAO = :pSITUACAO) ';
          //
          If not uFuncoes.Empty(dbeCDCLIE.Text) Then
             Texto := Texto + ' and (REC_CLIENTE = '+QuotedStr(dbeCDCLIE.Text)+ ') ';
          //
          If not ufuncoes.Empty(edtNRCRED.Text) Then
             Texto := Texto + ' and (REC_IDCONTASRECEBER = :pCREDITO) ';
          //
          Texto := Texto + ' AND (REC_CDLOJA = '+QuotedStr('1')+') ';
          //
          Texto := Texto + ' order by REC_IDCONTASRECEBER, REC_NRPARCELA ';
          //
          CommandText := Texto;
          // Data inicial
          Params.ParamByName('pDTINICIAL').AsDate      := M_DTINIC;
          //
          If (M_FLSITU <> 'T') Then
              Params.ParamByName('pSITUACAO').AsString     := M_FLSITU;
          // Data Final
          If (edtDTFINAL.Text <> '  /  /    ') Then
              Params.ParamByName('pDTFINAL').AsDate        := edtDTFINAL.Date;
          // credito
          If not ufuncoes.Empty(edtNRCRED.Text) Then
             Params.ParamByName('pCREDITO').AsInteger      := StrtoInt(edtNRCRED.Text);
          //
          Open;
          //
          EnableControls;
          //
          If not (IsEmpty) then
           begin
                If (M_FLSITU = 'A') Then
                    grdConsultar.Columns[4].Visible := False
                Else
                    grdConsultar.Columns[4].Visible := True;
                //
                Result := True;
                //
                TOTAIS(cdsConsulta);
           End;
     End;      
end;

procedure TfrmManuCReceber.FormShow(Sender: TObject);
begin
     //
     edtDTINICIAL.Date := Date();
     edtDTFINAL.Date   := edtDTINICIAL.Date;
     //
     {uFuncoes.RefreshCDS(dmDados.cdsListaFornecedores);
     uFuncoes.RefreshCDS(dmDados.cdsListaBancos);}
     //
end;

procedure TfrmManuCReceber.edtNRCREDExit(Sender: TObject);
begin
    If not uFuncoes.Empty(edtNRCRED.Text) Then
      edtNRCRED.Text := uFuncoes.StrZero(edtNRCRED.Text, 7);
end;

procedure TfrmManuCReceber.cdsConsultaCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     If (cdsConsulta.FieldByName('REC_SITUACAO').AsString = 'A') Then
       begin
           M_QTDIAS := Date() - cdsConsulta.FieldByName('REC_DTVENCIMENTO').AsDateTime;
           cdsConsulta.FieldByName('REC_NMSITUACAO').AsString := 'ABERTA';
       End
       Else
       Begin
           cdsConsulta.FieldByName('REC_NMSITUACAO').AsString := 'RECEBIDA';
           M_QTDIAS := cdsConsulta.FieldByName('REC_DTPAGAMENTO').AsDateTime -
                       cdsConsulta.FieldByName('REC_DTVENCIMENTO').AsDateTime;
       End;
       //
       if (M_QTDIAS > 0) Then
           cdsConsulta.FieldByName('REC_ATRASO').AsFloat := M_QTDIAS
       Else
           cdsConsulta.FieldByName('REC_ATRASO').AsFloat := 0;
end;

procedure TfrmManuCReceber.btFiltarClick(Sender: TObject);
begin
     If not (Consulta()) Then
      begin
           Application.MessageBox(PChar('Registro de conta a receber não encontradas.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINICIAL.SetFocus;

           Exit;
      End;
end;

procedure TfrmManuCReceber.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
 If (cdsConsulta.Active = True) Then
  Begin
     If (cdsConsulta.FieldByName('REC_SITUACAO').AsString = 'A') Then
     Begin
          BtEditar.Enabled  := True;
          BtExcluir.Enabled := True;
          btBaixa.Enabled   := True;
     End
     Else
     Begin
          BtEditar.Enabled  := False;
          BtExcluir.Enabled := False;
          btBaixa.Enabled   := False;
     End;
  End;
end;

procedure TfrmManuCReceber.BtExcluirClick(Sender: TObject);
Var
   iSequencia, iUsuario : Integer;
   aCredito, aParcela : String;
begin
   If Not (cdsConsulta.IsEmpty) and (cdsConsulta.Active) Then
     Begin
         If (cdsConsulta.FieldByName('REC_SITUACAO').AsString = 'P') Then
         Begin
              Application.MessageBox(PChar('Registro de conta já recebido!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Exit;
         End;
         //
         iSequencia := cdsConsultaREC_SEQUENCIA.AsInteger;
         iUsuario   := StrtoInt(uFrmMain.M_CDUSUA);
         aCredito   := uFuncoes.StrZero(cdsConsultaREC_IDCONTASRECEBER.AsString, 7);
         aParcela   := uFuncoes.StrZero(cdsConsultaREC_NRPARCELA.AsString,2);
         //
         If Application.MessageBox('Deseja excluir esta parcela?', 'Exclusão de registro',
                      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
              If not (dmFinanceiro.ExcluirParcelaCReceber(iSequencia)) Then
                 Application.MessageBox(PChar(MSG_ERRO),
                       'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL)
              Else
               begin
                  {If not (dmDados.IncluirTarefaUsuario( iUsuario,
                      'Excluiu C.Rebecer Credito :'+aCredito+' PC :'+aParcela +
                          ' Valor :'+FormatFloat('###,##0.#0', dmFinanceiro.cdsCReceberREC_VALOR.AsFloat)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');}
                  //
                  Application.MessageBox(PChar('Registro Excluido com sucesso.'),
                        'Aviso', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               End;
              //
              btFiltarClick(Sender);
              //
         end
     End;
end;

procedure TfrmManuCReceber.BtEditarClick(Sender: TObject);
begin
 If not (cdsConsulta.IsEmpty) Then
   Begin
       uFuncoes.FilterCDS(dmFinanceiro.cdsCReceber, fsInteger, cdsConsultaREC_SEQUENCIA.AsString);
       //
       With dmFinanceiro.cdsCReceber do
        begin
             Edit;
             If (dmFinanceiro.cdsCReceber.FieldByName('REC_SITUACAO').AsString = 'A') Then
             begin
                  Application.CreateForm(TfrmCReceberEditaBaixa, frmCReceberEditaBaixa);
                  try
                      uFrmCReceberEditaBaixa.M_FLOPER := 'E';
                      frmCReceberEditaBaixa.Caption := 'Editar Conta à Receber';
                      frmCReceberEditaBaixa.showmodal;
                  Finally
                      frmCReceberEditaBaixa.free;
                      //
                      btFiltarClick(Sender);
                  End;
             End;
        End;  // fim-do-with
  End;
end;

procedure TfrmManuCReceber.btBaixaClick(Sender: TObject);
begin
 If not (cdsConsulta.IsEmpty) Then
   Begin
       uFuncoes.FilterCDS(dmFinanceiro.cdsCReceber, fsInteger, cdsConsultaREC_SEQUENCIA.AsString);
       //
       With dmFinanceiro.cdsCReceber do
        begin
             Edit;
             If (dmFinanceiro.cdsCReceber.FieldByName('REC_SITUACAO').AsString = 'A') Then
             begin
                  Application.CreateForm(TfrmCReceberEditaBaixa, frmCReceberEditaBaixa);
                  try
                      uFrmCReceberEditaBaixa.M_FLOPER := 'B';
                      frmCReceberEditaBaixa.Caption := 'Baixa Conta à Receber';
                      frmCReceberEditaBaixa.showmodal;
                  Finally
                      frmCReceberEditaBaixa.free;
                      //
                      btFiltarClick(Sender);
                  End;
             End;
        End;  // fim-do-with
  End;
end;

procedure TfrmManuCReceber.TOTAIS(aCDS: TClientDataSet);
Var
    M_ABERTAS, M_PAGAS : double;
begin
     If (aCDS.Active) Then
     Begin
          M_ABERTAS := 0;
          M_PAGAS   := 0;
          //
          With aCDS do
          begin
               DisableControls;
               First;
               //
               While not (Eof) do
               Begin
                    If (FieldByName('REC_SITUACAO').AsString = 'A') Then
                       M_ABERTAS := M_ABERTAS + FieldByName('REC_VALOR').AsFloat;
                    If (FieldByName('REC_SITUACAO').AsString = 'R') Then
                       M_PAGAS   :=  M_PAGAS + FieldByName('REC_VLPAGO').AsFloat;
                    // PAG_VALORPARCELA
                    Next;
               End;
               //
               First;
               EnableControls;
          End;
          //
          lbl_TOTABERTAS.Caption := FormatFloat('###,###,##0.#0',M_ABERTAS);
          lbl_Recebidas.Caption      := FormatFloat('###,###,##0.#0',M_PAGAS);
     End
     Else
     Begin
          lbl_TOTABERTAS.Caption := '0,00';
          lbl_Recebidas.Caption      := '0,00';
     End;

end;

procedure TfrmManuCReceber.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Manutenção Recebimentos...'));
           //
           novo    := UFrmMain.aNovo;
           alterar := UFrmMain.aAlterar;
           apagar  := UFrmMain.aApagar;
           //
     End;
     //
     FrmMain.Limpar_Acessos;
     //
     //BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
     btBaixa.Visible    := (alterar = 'S');
  End;
end;

procedure TfrmManuCReceber.dbeCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbeCDCLIE.Text) Then
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
         Begin
            dbeCDCLIE.Text := uFuncoes.StrZero(dbeCDCLIE.Text,7);
            edtNMCLIE.Text := dmDados.GetNomeCliente(StrtoInt(dbeCDCLIE.Text));
         End;
end;

procedure TfrmManuCReceber.dbeCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(dbeCDCLIE.Text) Then
        edtNMCLIE.Clear;
end;

procedure TfrmManuCReceber.Limpar;
begin
      lbl_TOTABERTAS.Caption := '0,00';
      lbl_Recebidas.Caption := '0,00';
end;

procedure TfrmManuCReceber.spLocClienteClick(Sender: TObject);
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
                edtNRCRED.SetFocus;
           End;
          //
          frmConsClientes.Free;
      End;
end;

procedure TfrmManuCReceber.dbeCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //   
     If (key = #13) and uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
           spLocClienteClick(Self);
      End;
end;

end.
