unit uFrmBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadBancos = class(TfrmCadastro)
    dbeCodigo: TDBEdit;
    Label3: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarBAN_CODIGO: TIntegerField;
    cdsConsultarBAN_NOME: TStringField;
    procedure edtConsultarChange(Sender: TObject);
    procedure dbeCodigoExit(Sender: TObject);
    procedure dbeDescricaoExit(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(iCodigo : Integer);
  public
    { Public declarations }
  end;

var
  frmCadBancos: TfrmCadBancos;

implementation

uses udmFinanceiro, udmDados, uFuncoes, uFrmMain;

{$R *.dfm}

procedure TfrmCadBancos.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select BAN_CODIGO, BAN_NOME from BANCOS ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (BAN_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(BAN_NOME) like :pNOME)';
            end;
            CommandText := CommandText + 'order by BAN_NOME ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,59) + '%';
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

procedure TfrmCadBancos.dbeCodigoExit(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsInsert]) and not uFuncoes.Empty(dbeCodigo.Text) Then
      If (dmDados.ProcurarValor(dbeCodigo.Text, 'BAN_CODIGO', 'BANCOS')) Then
       begin
            dbeCodigo.SetFocus;
            MessageDlg('Código de banco já cadastrado.', mtInformation, [mbOk], 0);
            Exit;
       End;
end;

procedure TfrmCadBancos.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsInsert]) and not uFuncoes.Empty(dbeDescricao.Text) Then
      If (dmDados.ProcurarValor(dbeDescricao.Text, 'BAN_NOME', 'BANCOS')) Then
       begin
            dbeDescricao.SetFocus;
            MessageDlg('Descrição de banco já cadastrado.', mtInformation, [mbOk], 0);
            Exit;
       End;
end;

procedure TfrmCadBancos.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarBAN_CODIGO.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadBancos.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(dmFinanceiro.cdsBanco, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadBancos.Registro;
begin
     //
     uFuncoes.FilterCDS(dmFinanceiro.cdsBanco, fsInteger, InttoStr(uFuncoes.mvcodigo('BAN_CODIGO','BANCOS')));
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadBancos.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmFinanceiro.cdsBanco.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadBancos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin 
          With dsCadastro.DataSet do
            begin
                 Append;
            End;
            //
            dbeCodigo.SetFocus;
     End;
end;

procedure TfrmCadBancos.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    dbeCodigo.Enabled  := dsCadastro.DataSet.State IN [dsInsert];
end;

procedure TfrmCadBancos.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadBancos.BtExcluirClick(Sender: TObject);
Var
     iUsuario : Integer;
     aCodigo  : String;
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       aCodigo := dmFinanceiro.cdsBancoBAN_CODIGO.AsString + ' - '+ dmFinanceiro.cdsBancoBAN_NOME.AsString;
       iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
       //
       If Application.MessageBox('Deseja excluir este banco?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmFinanceiro.cdsBanco.Delete;
            dmFinanceiro.cdsBanco.ApplyUpdates(0);
            //
            If not (dmDados.IncluirTarefaUsuario(iUsuario,
               'Excluiu banco : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadBancos.BtGravarClick(Sender: TObject);
Var
  iUsuario : Integer;
begin
     If uFuncoes.Empty(dbeCodigo.Text) Then
       Begin
           Application.MessageBox('Digite o código do banco.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCodigo.SetFocus;
           Exit;
       End;
      //
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descrição do banco.','ATENÇÃO',
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
                 //
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Incluiu banco : '+uFuncoes.StrZero(dmFinanceiro.cdsBancoBAN_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
            End
            Else
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Alterou banco : '+uFuncoes.StrZero(dmFinanceiro.cdsBancoBAN_CODIGO.AsString,3)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
          //
          dsCadastro.DataSet.Post;
          dmFinanceiro.cdsBanco.ApplyUpdates(0);
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

end.
