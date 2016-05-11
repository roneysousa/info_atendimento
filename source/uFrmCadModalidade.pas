unit uFrmCadModalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadModalidades = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarMOD_CODIGO: TIntegerField;
    cdsConsultarMOD_NOME: TStringField;
    rbTipoModalidade: TDBRadioGroup;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
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
  frmCadModalidades: TfrmCadModalidades;

implementation

uses udmDados, uFuncoes, uFrmMain;

{$R *.dfm}

{ TfrmCadModalidades }

procedure TfrmCadModalidades.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsModalidade, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadModalidades.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_MODALIDADE.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsModalidade, fsInteger, InttoStr(uFuncoes.mvcodigo('MOD_CODIGO','MODALIDADE')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsModalidade, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadModalidades.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmDados.cdsModalidade.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadModalidades.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select MOD_CODIGO, MOD_NOME from MODALIDADE ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (MOD_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(MOD_NOME) like :pNOME)';
            end;
            CommandText := CommandText + 'order by MOD_NOME ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,29) + '%';
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

procedure TfrmCadModalidades.btnConsultarClick(Sender: TObject);
begin
  inherited;
  If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarMOD_CODIGO.AsInteger);
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadModalidades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('MOD_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_MODALIDADE.AsInteger + 1;
            End;
            //
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadModalidades.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadModalidades.BtExcluirClick(Sender: TObject);
Var
     iUsuario : Integer;
     aCodigo  : String;
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       aCodigo := dmDados.cdsModalidadeMOD_CODIGO.AsString + ' - '+ dmDados.cdsModalidadeMOD_NOME.AsString;
       iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
       //
       If Application.MessageBox('Deseja excluir esta modalidade?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsModalidade.Delete;
            dmDados.cdsModalidade.ApplyUpdates(0);
            //
            If not (dmDados.IncluirTarefaUsuario(iUsuario,
               'Excluiu Modalidade : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadModalidades.BtGravarClick(Sender: TObject);
Var
   iUsuario : Integer;
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descrição da natureza.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
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
                 DMDados.AbrirTabelaConfig;
                 //
                 dmDados.cdsConfig.Edit;
                 dmDados.cdsConfigCFG_MODALIDADE.AsInteger :=
                   dmDados.cdsConfigCFG_MODALIDADE.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsModalidadeMOD_CODIGO.AsInteger :=
                   dmDados.cdsConfigCFG_MODALIDADE.AsInteger;
                 //
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Incluiu Modalidade : '+uFuncoes.StrZero(dmDados.cdsModalidadeMOD_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
            End
            Else
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Alterou Modalidade : '+uFuncoes.StrZero(dmDados.cdsModalidadeMOD_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');

          //
          dsCadastro.DataSet.Post;
          DMDados.cdsModalidade.ApplyUpdates(0);
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

procedure TfrmCadModalidades.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsInsert]) and
     not uFuncoes.Empty(dbeDescricao.Text) Then
      If (dmDados.ProcurarValor(dbeDescricao.Text, 'MOD_NOME', 'MODALIDADE')) Then
       begin
            dbeDescricao.SetFocus;
            MessageDlg('Descrição já cadastrada.', mtInformation, [mbOk], 0);
            Exit;
       End;
end;

procedure TfrmCadModalidades.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Modalidades...'));
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
