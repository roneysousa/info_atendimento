unit uFrmCadNaturezas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadNatureza = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    cdsConsultarNAT_CODIGO: TIntegerField;
    cdsConsultarNAT_NOME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
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
  frmCadNatureza: TfrmCadNatureza;

implementation

uses udmDados, uFuncoes, uFrmMain;

{$R *.dfm}

{ TfrmCadNatureza }

procedure TfrmCadNatureza.Buscar(iCodigo: Integer);
begin
    uFuncoes.FilterCDS(DMDados.cdsNatureza, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadNatureza.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_NATUREZA.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsNatureza, fsInteger, InttoStr(uFuncoes.mvcodigo('NAT_CODIGO','NATUREZA')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsNatureza, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadNatureza.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmDados.cdsNatureza.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadNatureza.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('NAT_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_NATUREZA.AsInteger + 1;
            End;
            //
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadNatureza.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadNatureza.BtExcluirClick(Sender: TObject);
Var
     iUsuario : Integer;
     aCodigo  : String;
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       aCodigo := dmDados.cdsNaturezaNAT_CODIGO.AsString +' - '+dmDados.cdsNaturezaNAT_NOME.AsString;
       iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
       //
       If Application.MessageBox('Deseja excluir esta natureza?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsNatureza.Delete;
            dmDados.cdsNatureza.ApplyUpdates(0);
            //
            If not (dmDados.IncluirTarefaUsuario(iUsuario,
               'Excluiu Natureza : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadNatureza.BtGravarClick(Sender: TObject);
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
     If (DBRadioGroup1.ItemIndex < 0) Then
       Begin
           Application.MessageBox('Selecione o tipo de natureza.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           DBRadioGroup1.SetFocus;
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
                 dmDados.cdsConfigCFG_NATUREZA.AsInteger :=
                   dmDados.cdsConfigCFG_NATUREZA.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsNaturezaNAT_CODIGO.AsInteger :=
                   dmDados.cdsConfigCFG_NATUREZA.AsInteger;
                 //
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Incluiu Natureza : '+uFuncoes.StrZero(dmDados.cdsNaturezaNAT_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
            End
            Else
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Alterou Natureza : '+uFuncoes.StrZero(dmDados.cdsNaturezaNAT_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsNatureza.ApplyUpdates(0);
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

procedure TfrmCadNatureza.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select NAT_CODIGO, NAT_NOME from NATUREZA ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (NAT_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(NAT_NOME) like :pNOME)';
            end;
            CommandText := CommandText + 'order by NAT_NOME ';
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

procedure TfrmCadNatureza.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarNAT_CODIGO.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadNatureza.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsInsert]) and
      not uFuncoes.Empty(dbeDescricao.Text) Then
       If (dmDados.ProcurarValor(dbeDescricao.Text, 'NAT_NOME', 'NATUREZA')) Then
       begin
            dbeDescricao.SetFocus;
            MessageDlg('Descrição já cadastrada.', mtInformation, [mbOk], 0);
            Exit;
       End;
end;

procedure TfrmCadNatureza.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Naturezas...'));
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
