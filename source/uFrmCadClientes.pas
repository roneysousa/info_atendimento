unit uFrmCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask, ToolEdit,
  RXDBCtrl, Menus;

type
  TfrmCadClientes = class(TfrmCadastro)
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarCLI_CPF: TStringField;
    cdsConsultarCLI_IDENTIDADE: TStringField;
    cdsConsultarCLI_FONE1: TStringField;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbeCPF: TDBEdit;
    Label4: TLabel;
    dbeLogradouro: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    dbeCEP: TDBEdit;
    Label8: TLabel;
    cmbCidade: TDBLookupComboBox;
    Label10: TLabel;
    cmbUF: TDBComboBox;
    Label9: TLabel;
    cmbBairros: TDBLookupComboBox;
    Label11: TLabel;
    dbeIdentidade: TDBEdit;
    Label12: TLabel;
    dbeOrgao: TDBEdit;
    Label13: TLabel;
    DBComboBox1: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Label14: TLabel;
    cmbEstadoCivil: TDBLookupComboBox;
    Label15: TLabel;
    dbeDataNasc: TDBDateEdit;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    Label17: TLabel;
    DBEdit4: TDBEdit;
    Label18: TLabel;
    DBEdit5: TDBEdit;
    Label19: TLabel;
    DBEdit6: TDBEdit;
    Label20: TLabel;
    DBEdit7: TDBEdit;
    Label21: TLabel;
    cmbSituacao: TDBLookupComboBox;
    Label22: TLabel;
    DBMemo1: TDBMemo;
    PopupMenu1: TPopupMenu;
    ppmCidades: TMenuItem;
    ppmBairros1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure dbeIdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCidadeExit(Sender: TObject);
    procedure dbeDataNascExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure ppmCidadesClick(Sender: TObject);
    procedure ppmBairros1Click(Sender: TObject);
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
  frmCadClientes: TfrmCadClientes;

implementation

uses udmDados, uFuncoes, uFrmMain, uFrmCadCidades, uFrmBairros;

{$R *.dfm}

{ TfrmCadClientes }

procedure TfrmCadClientes.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsCliente, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadClientes.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_CLIENTE.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsCliente, fsInteger, InttoStr(uFuncoes.mvcodigo('CLI_CODIGO','CLIENTES')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsCliente, fsInteger, '-1');
     //
     If not uFuncoes.Empty(dmDados.cdsClienteCLI_CDCIDADE.AsString)
      and not uFuncoes.Empty(dmDados.cdsClienteCLI_CDBAIRRO.AsString) Then
          uFuncoes.FilterCDS(dmDados.cdsListaBairros, fsInteger, dmDados.cdsClienteCLI_CDCIDADE.AsString);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  inherited;
     uFuncoes.RefreshCDS(dmDados.cdsListaCidades);
     uFuncoes.RefreshCDS(dmDados.cdsListaEstCivil);
     uFuncoes.RefreshCDS(dmDados.cdsListaSituacao);
     //
     REGISTRO;
     //
     If (dmDados.cdsCliente.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadClientes.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('CLI_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_CLIENTE.AsInteger + 1;
                 FieldByName('CLI_SITUACAO').AsInteger := 1;
                 FieldByName('CLI_DTCADASTRO').AsDateTime := M_DTMOVI;
                 FieldByName('CLI_HORA_INC').AsString     := M_HOMOVI;
                 FieldByName('CLI_USUARIO_INC').AsInteger := StrtoInt(uFrmMain.M_CDUSUA);
            End;
            //
            dbeNome.SetFocus;
     End;
end;

procedure TfrmCadClientes.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dsCadastro.DataSet.FieldByName('CLI_DATA_ALT').AsDateTime := M_DTMOVI;
           dsCadastro.DataSet.FieldByName('CLI_HORA_ALT').AsString   := M_HOMOVI;
           dsCadastro.DataSet.FieldByName('CLI_USUARIO_ALT').AsInteger  := StrtoInt(uFrmMain.M_CDUSUA);
           dbeNome.setfocus;
      End;
end;

procedure TfrmCadClientes.BtExcluirClick(Sender: TObject);
Var
     iUsuario : Integer;
     aCodigo  : String;
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       aCodigo := dmDados.cdsClienteCLI_CODIGO.AsString + ' - '+ dmDados.cdsClienteCLI_NOME.AsString;
       iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
       //
       If Application.MessageBox('Deseja excluir este cliente?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsCliente.Delete;
            dmDados.cdsCliente.ApplyUpdates(0);
            //
            //
            If not (dmDados.IncluirTarefaUsuario(iUsuario,
               'Excluiu Cliente : '+aCodigo+' *F*')) Then
                 ShowMessage('Erro ao adicionar tarefa do usuário.');
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadClientes.BtGravarClick(Sender: TObject);
Var
   iUsuario : Integer;
begin
     If uFuncoes.Empty(dbeNome.Text) Then
       Begin
           Application.MessageBox('Digite o nome do cliente.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNome.SetFocus;
           Exit;
       End;
      //
     {If (dbeDataNasc.Text = '  /  /    ') Then
       Begin
           Application.MessageBox('Digite a data de nascimento do cliente.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDataNasc.SetFocus;
           Exit;
       End;}
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
                 dmDados.cdsConfigCFG_CLIENTE.AsInteger :=
                   dmDados.cdsConfigCFG_CLIENTE.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsClienteCLI_CODIGO.AsInteger :=
                   dmDados.cdsConfigCFG_CLIENTE.AsInteger;
                 //
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Incluiu Cliente : '+uFuncoes.StrZero(dmDados.cdsClienteCLI_CODIGO.AsString,7)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
            End
            Else
                 If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Alterou Cliente : '+uFuncoes.StrZero(dmDados.cdsClienteCLI_CODIGO.AsString,7)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usuário.');
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsCliente.ApplyUpdates(0);
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

procedure TfrmCadClientes.dbeCPFExit(Sender: TObject);
begin
  inherited;
    // inserção
    If (dsCadastro.DataSet.State in [dsInsert])
     and not uFuncoes.Empty(dbeCPF.Text) Then
      begin
            if (dbeCPF.Text = '00000000000') Then
             begin
                  dbeCPF.SetFocus;
                  //
                  MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
                  Exit;
             End;
            //
            Try
              If not (uFuncoes.CPF(uFuncoes.RemoveChar(dbeCPF.Text))) Then
              Begin
                  //dbeCPF.Clear;
                  dbeCPF.SetFocus;
                  MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
                  Exit;
              End;
              //
              If (dmDados.ProcurarValor(dbeCPF.Text, 'CLI_CPF', 'CLIENTES')) Then
                begin
                    //dbeCPF.Clear;
                    dbeCPF.SetFocus;
                    MessageDlg('CPF já cadastrado.', mtInformation, [mbOk], 0);
                    Exit;
                    //raise Exception.Create('CPF já cadastro.');
                End;
              //
            Except
              dbeCPF.SetFocus;
              Exit;
              //dbeCPF.Clear;
            End;
            //
      End;
      //
    // Edição
    If (dsCadastro.DataSet.State in [dsEdit])
     and not uFuncoes.Empty(dbeCPF.Text) Then
      begin
            if (dbeCPF.Text = '00000000000') Then
             begin
                  dbeCPF.SetFocus;
                  //dbeCPF.Clear;
                  MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
                  Exit;
             End;
             //
            Try
              If not (uFuncoes.CPF(uFuncoes.RemoveChar(dbeCPF.Text))) Then
              Begin
                  //dbeCPF.Clear;
                  dbeCPF.SetFocus;
                  MessageDlg('CPF inválido!!!', mtInformation, [mbOk], 0);
                  Exit;

              End;
            Except
              dbeCPF.SetFocus;
              Exit;
            End;
      End;
end;

procedure TfrmCadClientes.dbeIdentidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadClientes.cmbCidadeExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
       and not uFuncoes.Empty(dmDados.cdsClienteCLI_CDCIDADE.AsString) Then
          uFuncoes.FilterCDS(dmDados.cdsListaBairros, fsInteger, dmDados.cdsClienteCLI_CDCIDADE.AsString);
end;

procedure TfrmCadClientes.dbeDataNascExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
      and (dbeDataNasc.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(dbeDataNasc.Text);
              dbeDataNasc.Date := StrToDate(dbeDataNasc.Text);
           except
           on EConvertError do
             begin
                ShowMessage('Data Inválida!');
                dbeDataNasc.Clear;
                dbeDataNasc.SetFocus;
             End;
           end;
       End;
end;

procedure TfrmCadClientes.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select CL.CLI_CODIGO, CL.CLI_NOME, CL.CLI_CPF, CLI_IDENTIDADE, CL.CLI_FONE1 from CLIENTES CL ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (CL.CLI_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(CL.CLI_NOME) like :pNOME)';
                2: CommandText := CommandText + ' Where (CL.CLI_CPF = :pCPF)';
            end;
            CommandText := CommandText + 'order by CL.CLI_NOME ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,59) + '%';
                2: datasetConsultar.Params.ParamByName('pCPF').AsString    := edtConsultar.Text;
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

procedure TfrmCadClientes.rgConsultarClick(Sender: TObject);
begin
//  inherited;
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := '&Código do cliente:';
      edtConsultar.MaxLength := 7;
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := '&Nome do cliente:';
      edtConsultar.Clear;
    end;
    2:
    begin
      lblConsultar.Caption := 'C&PF do cliente:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadClientes.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarCLI_CODIGO.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadClientes.ppmCidadesClick(Sender: TObject);
begin
  inherited;
       frmMain.AbreForm(TfrmCadCidades, frmCadCidades);
       uFuncoes.RefreshCDS(dmDados.cdsListaCidades);
end;

procedure TfrmCadClientes.ppmBairros1Click(Sender: TObject);
begin
  inherited;
      frmMain.AbreForm(TfrmCadBairros, frmCadBairros);
      uFuncoes.RefreshCDS(dmDados.cdsListaBairros);
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Clientes...'));
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
