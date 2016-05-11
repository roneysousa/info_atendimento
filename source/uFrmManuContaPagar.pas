unit uFrmManuContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, DB, DBClient,
  Grids, DBGrids, Provider, FMTBcd, SqlExpr;

type
  TfrmManuContasPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    edtDTINICIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label3: TLabel;
    cmbFornecedores: TComboBox;
    rgPeriodos: TRadioGroup;
    rgSituacao: TRadioGroup;
    btFiltar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    btBaixa: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    lbl_TOTABERTAS: TLabel;
    lbl_PAGAS: TLabel;
    grdConsultar: TDBGrid;
    dspConsulta: TDataSetProvider;
    dsConsulta: TDataSource;
    dstConsulta: TSQLDataSet;
    cdsConsulta: TClientDataSet;
    cdsConsultaPAG_SEQUENCIA: TIntegerField;
    cdsConsultaPAG_IDCONTA: TIntegerField;
    cdsConsultaPAG_NRPARCELA: TIntegerField;
    cdsConsultaPAG_CDLOJA: TIntegerField;
    cdsConsultaPAG_DTCOMPRA: TDateField;
    cdsConsultaPAG_DTVENCIMENTO: TDateField;
    cdsConsultaPAG_DTPAGAMENTO: TDateField;
    cdsConsultaPAG_VALORPARCELA: TFMTBCDField;
    cdsConsultaPAG_IDFORNECEDOR: TIntegerField;
    cdsConsultaPAG_SITUACAO: TStringField;
    cdsConsultaPAG_VALORPAGO: TFMTBCDField;
    cdsConsultaPAG_BANCO: TIntegerField;
    cdsConsultaPAG_NRCONTA: TStringField;
    cdsConsultaPAG_AGENCIA: TStringField;
    cdsConsultaPAG_NRCHEQUE: TStringField;
    cdsConsultaPAG_NMSITUACAO: TStringField;
    cdsConsultaPAG_NMFORN: TStringField;
    cdsConsultaPAG_ATRASO: TFloatField;
    cdsConsultaPAG_NMBANC: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure btFiltarClick(Sender: TObject);
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure cdsConsultaCalcFields(DataSet: TDataSet);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure btBaixaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    Procedure CarregarFornecedores(aCDS : TClientDataSet);
    Function Consulta() : Boolean;
    procedure TOTAIS(aCDS : TClientDataSet);
  public
    { Public declarations }
  end;

var
  frmManuContasPagar: TfrmManuContasPagar;

implementation

uses uFuncoes, uDMDados, uDMFinanceiro, uFrmEditarBaixaCP, uFrmMain;

{$R *.dfm}

{ TfrmManuContasPagar }

procedure TfrmManuContasPagar.CarregarFornecedores(aCDS: TClientDataSet);
begin
     cmbFornecedores.Clear;
     cmbFornecedores.Items.Add('');
     uFuncoes.RefreshCDS(aCDS);
     With aCDS do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 cmbFornecedores.Items.Add(FieldByName('FOR_FANTASIA').AsString);
                 //
                 Next;
            End;
            //
            EnableControls;
      End;
end;

procedure TfrmManuContasPagar.FormShow(Sender: TObject);
begin
     CarregarFornecedores(dmDados.cdsListaFornecedores);
     //
     edtDTINICIAL.Date := Date();
     edtDTFINAL.Date   := edtDTINICIAL.Date;
     //
     uFuncoes.RefreshCDS(dmDados.cdsListaFornecedores);
     uFuncoes.RefreshCDS(dmFinanceiro.cdsListaBanco);
     //
end;

procedure TfrmManuContasPagar.BtSairClick(Sender: TObject);
begin
      Close;
end;

function TfrmManuContasPagar.Consulta: Boolean;
Var
    M_FLSITU, Texto, M_CAMPO : String;
begin
     Result := False;
     //
     Case rgSituacao.ItemIndex of
        0 : M_FLSITU := 'A';
        1 : M_FLSITU := 'P';
        2 : M_FLSITU := 'T';
     End;
     //
     If (rgPeriodos.ItemIndex = 0) Then
        M_CAMPO := 'PAG_DTCOMPRA';
     If (rgPeriodos.ItemIndex = 1) Then
        M_CAMPO := 'PAG_DTVENCIMENTO';
     If (rgPeriodos.ItemIndex = 2) Then
        M_CAMPO := 'PAG_DTPAGAMENTO';
     //
     Texto := 'Select PAG_SEQUENCIA, PAG_IDCONTA, PAG_NRPARCELA, PAG_CDLOJA, ';
     Texto := Texto + ' PAG_DTCOMPRA, PAG_DTVENCIMENTO, PAG_DTPAGAMENTO, PAG_VALORPARCELA, PAG_IDFORNECEDOR, ';
     Texto := Texto + ' PAG_SITUACAO, PAG_VALORPAGO, PAG_BANCO, PAG_NRCONTA, PAG_AGENCIA, ';
     Texto := Texto + ' PAG_NRCHEQUE from contaspagar ';
     //
     With cdsConsulta do
     Begin
          DisableControls;
          Close;
          If (M_FLSITU = 'T') Then
             // Texto := Texto + ' Where ((PAG_SITUACAO = '+QuotedStr('A')+') or (PAG_SITUACAO = '+QuotedStr('P')+')) '
              Texto := Texto + ' Where ((PAG_SITUACAO = :pSITUACAO) or (PAG_SITUACAO = :pSITUACAO2)) '
          Else
              //Texto := Texto + ' Where (PAG_SITUACAO = '+QuotedStr(M_FLSITU)+') ';
              Texto := Texto + ' Where (PAG_SITUACAO = :pSITUACAO) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text = '  /  /    ')
           and (M_FLSITU = 'P') Then
               Texto := Texto + ' AND ('+ M_CAMPO +'>= '+QuotedStr(edtDTINICIAL.Text) +') ';
               //Texto := Texto + ' AND ('+ M_CAMPO +'>= :pDTINICIAL) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text = '  /  /    ')
           and ((M_FLSITU = 'A') OR (M_FLSITU = 'T')) Then
               //Texto := Texto + ' AND ('+ M_CAMPO +' >= '+QuotedStr(edtDTINICIAL.Text) +') ';
               Texto := Texto + ' AND ('+ M_CAMPO +' >= :pDTINICIAL) ';
          //
          If (edtDTINICIAL.Text = '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and (M_FLSITU = 'P') Then
               //Texto := Texto + ' AND ('+ M_CAMPO +' >= '+QuotedStr(edtDTFINAL.Text)+') ';
               Texto := Texto + ' AND ('+ M_CAMPO +' >= :pDTFINAL) ';
          //
          If (edtDTINICIAL.Text = '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and ((M_FLSITU = 'A') OR (M_FLSITU = 'T')) Then
               //Texto := Texto + ' AND ('+ M_CAMPO +' >= '+ QuotedStr(edtDTFINAL.Text)+') ';
               Texto := Texto + ' AND ('+ M_CAMPO +' >= :pDTFINAL) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and ((M_FLSITU = 'A') or (M_FLSITU = 'T')) Then
               //Texto := Texto + ' AND ('+ M_CAMPO +' >= '+QuotedStr(edtDTINICIAL.Text)+') AND ('+ M_CAMPO +' <= '+QuotedStr(edtDTFINAL.Text) +') ';
               Texto := Texto + ' AND ('+ M_CAMPO +' >= :pDTINICIAL) AND ('+ M_CAMPO +' <= :pDTFINAL) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and (M_FLSITU = 'P') Then
               //Texto := Texto + ' AND ('+ M_CAMPO +' >= '+QuotedStr(edtDTINICIAL.Text)+') AND ('+ M_CAMPO +' <= '+QuotedStr(edtDTFINAL.Text)+') ';
               Texto := Texto + ' AND ('+ M_CAMPO +' >= :pDTINICIAL) AND ('+ M_CAMPO +' <= :pDTFINAL) ';
          //
          If not ufuncoes.Empty(cmbFornecedores.Text) Then
              Texto := Texto + ' AND (PAG_IDFORNECEDOR = :pFORNECEDOR) ';
          //
          Texto := Texto + ' order by PAG_IDCONTA, PAG_NRPARCELA ';
          //
          CommandText := Texto;
          //
          If (M_FLSITU = 'T') Then
          Begin
              Params.ParamByName('pSITUACAO').AsString     := 'A';
              Params.ParamByName('pSITUACAO2').AsString    := 'P';
          End
          Else
              Params.ParamByName('pSITUACAO').AsString     := M_FLSITU;
          // Data inicial
          If (edtDTINICIAL.Text <> '  /  /    ') Then
               Params.ParamByName('pDTINICIAL').AsDate      := edtDTINICIAL.Date;
          // Data Final
          If (edtDTFINAL.Text <> '  /  /    ') Then
              Params.ParamByName('pDTFINAL').AsDate        := edtDTFINAL.Date;
          // Fornecedor
          If not uFuncoes.Empty(cmbFornecedores.Text) Then
              Params.ParamByName('pFORNECEDOR').AsInteger  := dmDados.GetCodigoFornecedor(cmbFornecedores.Text);
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

procedure TfrmManuContasPagar.btFiltarClick(Sender: TObject);
begin
     If not (Consulta()) Then
      begin
           Application.MessageBox(PChar('Registro de conta a pagar não encontradas.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTINICIAL.SetFocus;
           Exit;
      End;
end;

procedure TfrmManuContasPagar.edtDTINICIALExit(Sender: TObject);
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

procedure TfrmManuContasPagar.edtDTFINALExit(Sender: TObject);
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

procedure TfrmManuContasPagar.cdsConsultaCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     {If (cdsConsulta.State in [dsInternalCalc]) Then
       begin}
            If (cdsConsulta.FieldByName('PAG_SITUACAO').AsString = 'A') Then
             begin
                  M_QTDIAS := Date() - cdsConsulta.FieldByName('PAG_DTVENCIMENTO').AsDateTime;
                  cdsConsulta.FieldByName('PAG_NMSITUACAO').AsString := 'ABERTA';
             End
             Else
             Begin
                  cdsConsulta.FieldByName('PAG_NMSITUACAO').AsString := 'PAGA';
                  M_QTDIAS := cdsConsulta.FieldByName('PAG_DTPAGAMENTO').AsDateTime -
                       cdsConsulta.FieldByName('PAG_DTVENCIMENTO').AsDateTime;
             End;
             //
             if (M_QTDIAS > 0) Then
                 cdsConsulta.FieldByName('PAG_ATRASO').AsFloat := M_QTDIAS
             Else
                 cdsConsulta.FieldByName('PAG_ATRASO').AsFloat := 0;
     //  End;
end;

procedure TfrmManuContasPagar.TOTAIS(aCDS: TClientDataSet);
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
                    If (FieldByName('PAG_SITUACAO').AsString = 'A') Then
                       M_ABERTAS := M_ABERTAS + FieldByName('PAG_VALORPARCELA').AsFloat;
                    If (FieldByName('PAG_SITUACAO').AsString = 'P') Then
                       M_PAGAS   :=  M_PAGAS + FieldByName('PAG_VALORPAGO').AsFloat;
                    // PAG_VALORPARCELA
                    Next;
               End;
               //
               First;
               EnableControls;
          End;
          //
          lbl_TOTABERTAS.Caption := FormatFloat('###,###,##0.#0',M_ABERTAS);
          lbl_PAGAS.Caption      := FormatFloat('###,###,##0.#0',M_PAGAS);
     End
     Else
     Begin
          lbl_TOTABERTAS.Caption := '0,00';
          lbl_PAGAS.Caption      := '0,00';
     End;
end;

procedure TfrmManuContasPagar.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  If (cdsConsulta.Active = True) Then
  Begin
     If (cdsConsulta.FieldByName('PAG_SITUACAO').AsString = 'A') Then
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

procedure TfrmManuContasPagar.BtEditarClick(Sender: TObject);
begin
 If not (cdsConsulta.IsEmpty) Then
   Begin
       uFuncoes.FilterCDS(dmFinanceiro.cdsContaPagar, fsInteger, cdsConsultaPAG_SEQUENCIA.AsString);
       //
       With dmFinanceiro.cdsContaPagar do
        begin
             Edit;
             If (dmFinanceiro.cdsContaPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
             begin
                  Application.CreateForm(TfrmEditarBaixaCP, frmEditarBaixaCP);
                  try
                      uFrmEditarBaixaCP.M_FLOPER := 'E';
                      frmEditarBaixaCP.Caption := 'Editar Conta a Pagar';
                      frmEditarBaixaCP.showmodal;
                  Finally
                      frmEditarBaixaCP.free;
                      //
                      btFiltarClick(Sender);
                  End;
             End;
        End;  // fim-do-with
  End;      
end;

procedure TfrmManuContasPagar.BtExcluirClick(Sender: TObject);
Var
   iSequencia, iUsuario : Integer;
   aCompra, aParcela : String;
begin
   If Not (cdsConsulta.IsEmpty) and (cdsConsulta.Active) Then
     Begin
         If (cdsConsulta.FieldByName('PAG_SITUACAO').AsString = 'P') Then
         Begin
              Application.MessageBox(PChar('Registro de conta já pago!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Exit;
         End;
         //
         iSequencia := cdsConsultaPAG_SEQUENCIA.AsInteger;
         iUsuario   := StrtoInt(uFrmMain.M_CDUSUA);
         aCompra    := uFuncoes.StrZero(cdsConsultaPAG_IDCONTA.AsString, 7);
         aParcela   := uFuncoes.StrZero(cdsConsultaPAG_NRPARCELA.AsString,2);
         //
         If Application.MessageBox('Deseja excluir esta parcela?', 'Exclusão de registro',
                      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
              If not (dmFinanceiro.ExcluirParcelaCP(iSequencia)) Then
                 Application.MessageBox(PChar(MSG_ERRO),
                       'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL)
              Else
               begin
                  {If not (dmDados.IncluirTarefaUsuario( iUsuario,
                      'Excluir PC : '+aParcela + ' Compra : '+aCompra+' *F*')) Then
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

procedure TfrmManuContasPagar.btBaixaClick(Sender: TObject);
begin
 If not (cdsConsulta.IsEmpty) Then
   Begin
       uFuncoes.FilterCDS(dmFinanceiro.cdsContaPagar, fsInteger, cdsConsultaPAG_SEQUENCIA.AsString);
       //
       With dmFinanceiro.cdsContaPagar do
        begin
             Edit;
             If (dmFinanceiro.cdsContaPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
             begin
                  Application.CreateForm(TfrmEditarBaixaCP, frmEditarBaixaCP);
                  try
                      uFrmEditarBaixaCP.M_FLOPER := 'B';
                      frmEditarBaixaCP.Caption := 'Baixa Conta a Pagar';
                      frmEditarBaixaCP.showmodal;
                  Finally
                      frmEditarBaixaCP.free;
                      //
                      btFiltarClick(Sender);
                  End;
             End;
        End;  // fim-do-with
  End;
end;

procedure TfrmManuContasPagar.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Manutenção'));
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


End.
