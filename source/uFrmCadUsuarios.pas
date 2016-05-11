unit uFrmCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadUsuarios = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbeCargo: TDBEdit;
    lbl_senha: TLabel;
    dbeSNATUA: TEdit;
    lbl_confirma: TLabel;
    edt_Confirma: TEdit;
    cdsConsultarSEN_CODIGO: TIntegerField;
    cdsConsultarSEN_NOME: TStringField;
    btnAcesso: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeSNATUAExit(Sender: TObject);
    procedure edt_ConfirmaExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAcessoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(aCodigo : String);
    procedure Exibir_edites;
    procedure Ocultar_edites;
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses udmDados, uFuncoes, uFrmMain, uFrmCadPermissoes;

{$R *.dfm}

procedure TfrmCadUsuarios.Buscar(aCodigo: String);
begin
      uFuncoes.FilterCDS(DMDados.cdsUsuario, fsInteger, aCodigo);
end;

procedure TfrmCadUsuarios.Exibir_edites;
begin
     lbl_senha.Visible    := True;
     lbl_confirma.Visible := True;
     edt_Confirma.Visible := True;
     dbeSNATUA.Visible    := True;
     //
     edt_Confirma.Clear;
     dbeSNATUA.Clear;
end;

procedure TfrmCadUsuarios.Ocultar_edites;
begin
     lbl_senha.Visible    := False;
     lbl_confirma.Visible := False;
     //
     edt_Confirma.Visible := False;
     dbeSNATUA.Visible    := False;
end;

procedure TfrmCadUsuarios.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_USUARIOS.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsUsuario, fsInteger, InttoStr(uFuncoes.mvcodigo('SEN_CODIGO','USUARIOS')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsUsuario, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  inherited;
     If (uFrmMain.admin) Then
        btnAcesso.Visible := True
     Else
        btnAcesso.Visible := False;
     //
     REGISTRO;
     Ocultar_edites;
     //
     If (dmDados.cdsUsuario.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadUsuarios.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          dmDados.AbrirTabelaConfig();
          //
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('SEN_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_USUARIOS.AsInteger + 1;
            End;
            //
            Exibir_edites;
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadUsuarios.BtEditarClick(Sender: TObject);
begin
  if (uFrmMain.admin) or (StrtoInt(uFrmMain.M_CDUSUA) = dsCadastro.DataSet.FieldByName('SEN_CODIGO').AsInteger ) Then
   begin
       inherited;
        if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
          Begin
             dsCadastro.DataSet.Edit;
             //
             Exibir_edites;
             dbeDescricao.setfocus;
          End;
   End
   Else
       Application.MessageBox(PChar( uFrmMain.M_NMUSUA +
               ', você não tem permissão para alterar dados.') , 'Erro',
                    MB_OK+MB_ICONSTOP);
end;

procedure TfrmCadUsuarios.BtExcluirClick(Sender: TObject);
Var
     iUsuario : Integer;
     aCodigo  : String;
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       aCodigo := dmDados.cdsUsuarioSEN_CODIGO.AsString +' - '+dmDados.cdsUsuarioSEN_NOME.AsString;
       iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
       //
       If Application.MessageBox('Deseja excluir este usuário?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsUsuario.Delete;
            dmDados.cdsUsuario.ApplyUpdates(0);
            //
            If not (dmDados.IncluirTarefaUsuario(iUsuario,
               'Excluiu Usuario : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadUsuarios.BtGravarClick(Sender: TObject);
Var
   iUsuario : Integer;
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome do usuário.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
      //
    If (dsCadastro.DataSet.State in [dsInsert] ) Then
     begin
         If uFuncoes.Empty(dbeSNATUA.Text)  Then
           Begin
             Application.MessageBox('Digite sua senha.','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeSNATUA.SetFocus;
             Exit;
         End;
         //
       If uFuncoes.Empty(edt_Confirma.Text) Then
         Begin
             Application.MessageBox('Digite novamento sua senha.','ATENÇÃO',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             edt_Confirma.SetFocus;
             Exit;
         End;
       End;
      //
      iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
      //
      try
          //
          dmDados.Start;
          //
          If (dsCadastro.DataSet.State in [dsInsert]) Then
            begin
                 dmDados.AbrirTabelaConfig();
                 //
                 dmDados.cdsConfig.Edit;
                 dmDados.cdsConfigCFG_USUARIOS.AsInteger :=
                   dmDados.cdsConfigCFG_USUARIOS.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsUsuarioSEN_CODIGO.AsInteger :=
                     dmDados.cdsConfigCFG_USUARIOS.AsInteger;
                 //
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Incluiu Usuário : '+uFuncoes.StrZero(dmDados.cdsUsuarioSEN_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
            End
            Else
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Alterou Usuário : '+uFuncoes.StrZero(dmDados.cdsUsuarioSEN_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsUsuario.ApplyUpdates(0);
          //
          dmDados.Comit(udmDados.Transc);
          //
          Application.MessageBox(PChar(MSG_OK),
              'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          //
          Ocultar_edites;
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
  inherited;
end;

procedure TfrmCadUsuarios.dbeSNATUAExit(Sender: TObject);
begin
  inherited;
   IF (dsCadastro.DataSet.State in [dsInsert, dsEdit]) tHEN
     If not uFuncoes.Empty(dbeSNATUA.Text) Then
        dbeSNATUA.Text := dbeSNATUA.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(dbeSNATUA.Text));
end;

procedure TfrmCadUsuarios.edt_ConfirmaExit(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(edt_Confirma.Text) Then
     Begin
       edt_Confirma.Text := edt_Confirma.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Confirma.Text));
       //
       If ( edt_Confirma.Text = dbeSNATUA.Text) Then
            dmDados.cdsUsuarioSEN_SNATUA.AsString := uFuncoes.Codifica(edt_Confirma.Text)
       Else
       begin
            Application.MessageBox( 'A senha incorreta!','ATENÇÃO',
                          MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edt_Confirma.Clear;
            edt_Confirma.SetFocus;
            Exit;
       End;
     End;
end;

procedure TfrmCadUsuarios.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select SEN_CODIGO, SEN_NOME from USUARIOS ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (SEN_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(SEN_NOME) like :pNOME)';
            end;
            CommandText := CommandText + ' order by SEN_NOME';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := edtConsultar.Text;
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadUsuarios.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarSEN_CODIGO.AsString);
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadUsuarios.btnAcessoClick(Sender: TObject);
begin
  inherited;
  if (dmDados.cdsUsuario.Active)
    and (dmDados.cdsUsuario.RecordCount > 0) then
  Begin
       //
       IF (StrtoInt(UFrmMain.M_CDUSUA) <= 1) tHEN
        Begin
            FrmMain.AbreForm(TfrmCadPermissoes, frmCadPermissoes);
            Exit;
        End;
       //
       If  NOT (UFrmMain.admin) Then
       begin
           //
           Application.MessageBox(Pchar(uFrmMain.M_NMUSUA+  ', você não tem permissão de administrador. '),'ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;
           //
       End
       else
           FrmMain.AbreForm(TfrmCadPermissoes, frmCadPermissoes);
  End;
end;

procedure TfrmCadUsuarios.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Usuários...'));
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

procedure TfrmCadUsuarios.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     btnAcesso.Enabled := dsCadastro.DataSet.State IN [dsBrowse];
end;

end.
