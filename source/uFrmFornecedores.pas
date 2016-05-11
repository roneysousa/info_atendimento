unit uFrmFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadFornecedores = class(TfrmCadastro)
    Label2: TLabel;
    dbeRazao: TDBEdit;
    Label3: TLabel;
    dbeFantasia: TDBEdit;
    Label4: TLabel;
    dbeCNPJ: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    cmbUF: TDBComboBox;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    Label20: TLabel;
    dbeEmail: TDBEdit;
    cdsConsultarFOR_CODIGO: TIntegerField;
    cdsConsultarFOR_RAZAO: TStringField;
    cdsConsultarFOR_FONE1: TStringField;
    cdsConsultarFOR_FANTASIA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure dbeRazaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(iCodigo : Integer);
  public
    { Public declarations }
  end;

var
  frmCadFornecedores: TfrmCadFornecedores;

implementation

uses udmDados, uFrmMain, uFuncoes;

{$R *.dfm}

{ TfrmCadFornecedores }

procedure TfrmCadFornecedores.Buscar(iCodigo: Integer);
begin
      uFuncoes.FilterCDS(DMDados.cdsFornecedor, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadFornecedores.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_FORNECEDOR.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsFornecedor, fsInteger, InttoStr(uFuncoes.mvcodigo('FOR_CODIGO','FORNECEDORES')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsFornecedor, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadFornecedores.FormShow(Sender: TObject);
begin
  inherited;
     //
     REGISTRO;
     //
     If (dmDados.cdsFornecedor.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadFornecedores.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('FOR_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_FORNECEDOR.AsInteger + 1;
                 FieldByName('FOR_DTCADA').AsDateTime := M_DTMOVI;
                 FieldByName('FOR_HOCADA').AsString     := M_HOMOVI;
                 FieldByName('FOR_USUARIO_CAD').AsInteger := StrtoInt(uFrmMain.M_CDUSUA);
            End;
            //
            dbeRazao.SetFocus;
     End;
end;

procedure TfrmCadFornecedores.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dsCadastro.DataSet.FieldByName('FOR_DTALTE').AsDateTime := M_DTMOVI;
           dsCadastro.DataSet.FieldByName('FOR_HOALTE').AsString   := M_HOMOVI;
           dsCadastro.DataSet.FieldByName('FOR_USUARIO_ALT').AsInteger  := StrtoInt(uFrmMain.M_CDUSUA);
           dbeRazao.setfocus;
      End;
end;

procedure TfrmCadFornecedores.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir este fornecedor?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsFornecedor.Delete;
            dmDados.cdsFornecedor.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadFornecedores.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeRazao.Text) Then
       Begin
           Application.MessageBox('Digite a razão social','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeRazao.SetFocus;
           Exit;
       End;
      //
     If uFuncoes.Empty(dbeFantasia.Text) Then
       Begin
           Application.MessageBox('Digite o nome fantasia.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeFantasia.SetFocus;
           Exit;
       End;
      //
      try
          //
          dmDados.Start;
          //
          If (dsCadastro.DataSet.State in [dsInsert]) Then
            begin
                 DMDados.AbrirTabelaConfig;
                 //
                 dmDados.cdsConfig.Edit;
                 dmDados.cdsConfigCFG_FORNECEDOR.AsInteger :=
                   dmDados.cdsConfigCFG_FORNECEDOR.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsFornecedorFOR_CODIGO.AsInteger :=
                   dmDados.cdsConfigCFG_FORNECEDOR.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsFornecedor.ApplyUpdates(0);
          //
          dmDados.Comit(udmDados.Transc);
          //
          Application.MessageBox(PChar(MSG_OK),
              'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar(MSG_ERRO+#13+Exc.Message),
                 'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
               BtCancelarClick(Sender);
               //
               dmDados.Rollback;
            End;
     End;
     //
  inherited;
end;

procedure TfrmCadFornecedores.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select FOR_CODIGO, FOR_RAZAO, FOR_FANTASIA, FOR_FONE1 from FORNECEDORES ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (FOR_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(FOR_RAZAO) like :pNOME)';
            end;
            CommandText := CommandText + 'order by FOR_RAZAO ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,49) + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
    End
    Else
         cdsConsultar.Close;
  inherited;
end;

procedure TfrmCadFornecedores.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarFOR_CODIGO.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadFornecedores.dbeRazaoExit(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert])
        and not uFuncoes.Empty(dbeRazao.Text) Then
          If (dmDados.ProcurarValor(dbeRazao.Text, 'FOR_RAZAO', 'FORNECEDORES')) Then
            begin
                 dbeRazao.SetFocus;
                 MessageDlg('Razão social já cadastrada.', mtInformation, [mbOk], 0);
                 Exit;
            End;
end;

procedure TfrmCadFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Fornecedores...'));
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
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
  End;
end;

end.
