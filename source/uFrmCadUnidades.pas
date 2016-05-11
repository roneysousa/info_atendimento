unit uFrmCadUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadUnidades = class(TfrmCadastro)
    dbeCodigo: TDBEdit;
    Label3: TLabel;
    cdsConsultarUND_CODIGO: TStringField;
    cdsConsultarUND_DESCRICAO: TStringField;
    dbeDescricao: TDBEdit;
    procedure dbeCodigoExit(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(aCodigo : String);
  public
    { Public declarations }
  end;

var
  frmCadUnidades: TfrmCadUnidades;

implementation

uses udmDados, uFuncoes, uFrmMain;

{$R *.dfm}

procedure TfrmCadUnidades.Buscar(aCodigo: String);
begin
     uFuncoes.FilterCDS(DMDados.cdsUnidade, fsString, aCodigo);
end;

procedure TfrmCadUnidades.dbeCodigoExit(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert])
        and not uFuncoes.Empty(dbeCodigo.Text) Then
          If (dmDados.ProcurarValor(dbeCodigo.Text, 'UND_CODIGO', 'UNIDADES')) Then
            begin
                 dbeDescricao.SetFocus;
                 MessageDlg('Código já cadastrado.', mtInformation, [mbOk], 0);
                 Exit;
            End;
end;

procedure TfrmCadUnidades.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert])
        and not uFuncoes.Empty(dbeDescricao.Text) Then
          If (dmDados.ProcurarValor(dbeDescricao.Text, 'UND_DESCRICAO', 'UNIDADES')) Then
            begin
                 dbeDescricao.SetFocus;
                 MessageDlg('Descrição já cadastrada.', mtInformation, [mbOk], 0);
                 Exit;
            End;
end;

procedure TfrmCadUnidades.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     If (dsCadastro.DataSet.Active) Then
        dbeCodigo.Enabled := dsCadastro.DataSet.State in [dsInsert];
end;

procedure TfrmCadUnidades.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     uFuncoes.FilterCDS(DMDados.cdsUnidade, fsString, uFuncoes.mscodigo('UND_CODIGO','UNIDADES'));
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadUnidades.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmDados.cdsUnidade.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadUnidades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
            End;
            //
            dbeCodigo.SetFocus;
     End;
end;

procedure TfrmCadUnidades.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadUnidades.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir esta unidade?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsUnidade.Delete;
            dmDados.cdsUnidade.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadUnidades.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descrição da unidade.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
      //
      try
          //
          dmDados.Start;
          //
          dmDados.cdsUnidadeUND_DESCRICAO.AsString :=
            uFuncoes.Alltrim(dmDados.cdsUnidadeUND_DESCRICAO.AsString);
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsUnidade.ApplyUpdates(0);
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
  inherited;
end;

procedure TfrmCadUnidades.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select UND_CODIGO, UND_DESCRICAO from UNIDADES ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (UPPER(UND_CODIGO) Like :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(UND_DESCRICAO) like :pNOME)';
            end;
            CommandText := CommandText + 'order by UND_DESCRICAO ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,1) + '%';
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,19) + '%';
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

procedure TfrmCadUnidades.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarUND_CODIGO.AsString);
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadUnidades.rgConsultarClick(Sender: TObject);
begin
//  inherited;
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.MaxLength := 2;
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadUnidades.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
//  inherited;
  If (key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
    begin
         Key := #0;
         If (btnConsultar.Enabled = True) Then
            btnConsultar.SetFocus;
    End;  

end;

procedure TfrmCadUnidades.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Unidades...'));
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
