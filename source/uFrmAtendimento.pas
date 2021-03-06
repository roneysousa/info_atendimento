unit uFrmAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, ToolEdit, RXDBCtrl,
  Mask;

type
  TfrmCadAtendimento = class(TfrmCadastro)
    Label2: TLabel;
    dbeCliente: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbeHora: TDBEdit;
    dbeDtAtendimento: TDBDateEdit;
    Label5: TLabel;
    cmbFuncionarios: TDBLookupComboBox;
    spCliente: TSpeedButton;
    edtNomeCliente: TEdit;
    Panel1: TPanel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBMemo2: TDBMemo;
    cdsConsultarAGE_ID: TIntegerField;
    cdsConsultarAGE_DTMOVI: TDateField;
    cdsConsultarAGE_HOMOVI: TStringField;
    cdsConsultarAGE_CLIENTE: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarAGE_DTATENDIMENTO: TDateField;
    cdsConsultarAGE_HOATENDIMENTO: TStringField;
    cdsConsultarAGE_SITUACAO: TStringField;
    cdsConsultarAGE_FUNCIONARIO: TIntegerField;
    cdsConsultarFUN_NOME: TStringField;
    BtImprimir: TBitBtn;
    procedure dbeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDtAtendimentoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure spClienteClick(Sender: TObject);
    procedure dbeClienteChange(Sender: TObject);
    procedure dbeClienteExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbFuncionariosExit(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(iCodigo : Integer);
  public
    { Public declarations }
  end;

var
  frmCadAtendimento: TfrmCadAtendimento;

implementation

uses udmDados, uFrmMain, uFuncoes, uFrmLocClientes;

{$R *.dfm}

procedure TfrmCadAtendimento.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsAtendimento, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadAtendimento.dbeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmCadAtendimento.dbeDtAtendimentoExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
      and (dbeDtAtendimento.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(dbeDtAtendimento.Text);
              dbeDtAtendimento.Date := StrToDate(dbeDtAtendimento.Text);
              //
              If (dsCadastro.DataSet.State in [dsInsert]) and (dbeDtAtendimento.Date < Date()) Then
                begin
                     Application.MessageBox(PChar('Data n�o pode ser inferior a data atual.'),
                         'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                     dbeDtAtendimento.SetFocus;
                     Exit;
                End;
           except
           on EConvertError do
             begin
                ShowMessage('Data Inv�lida!');
                dbeDtAtendimento.Clear;
                dbeDtAtendimento.SetFocus;
             End;
           end;
       End;
end;

procedure TfrmCadAtendimento.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_ATENDIMENTOS.AsInteger > 0) Then
      begin
         uFuncoes.FilterCDS(DMDados.cdsAtendimento, fsInteger, InttoStr(uFuncoes.mvcodigo('AGE_ID','AGENDA')));
         edtNomeCliente.Text := dmDados.GetNomeCliente(DMDados.cdsAtendimentoAGE_CLIENTE.AsInteger);
      End
     Else
         uFuncoes.FilterCDS(DMDados.cdsAtendimento, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadAtendimento.FormShow(Sender: TObject);
begin
  inherited;
     uFuncoes.RefreshCDS(dmDados.cdsListaFuncionarios);
     //
     REGISTRO;
     //
     If (dmDados.cdsAtendimento.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadAtendimento.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('AGE_ID').AsInteger  :=
                    DMDados.cdsConfigCFG_ATENDIMENTOS.AsInteger + 1;
                 FieldByName('AGE_DTMOVI').AsDateTime := M_DTMOVI;
                 FieldByName('AGE_HOMOVI').AsString   := M_HOMOVI;
                 FieldByName('AGE_USCADA').AsInteger  := StrtoInt(uFrmMain.M_CDUSUA);
            End;
            //
            dbeCliente.SetFocus;
     End;
end;

procedure TfrmCadAtendimento.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      spCliente.Enabled  := dsCadastro.DataSet.State in [dsInsert];
      dbeCliente.Enabled := dsCadastro.DataSet.State in [dsInsert];
      BtImprimir.Enabled := dsCadastro.DataSet.State in [dsBrowse];
end;

procedure TfrmCadAtendimento.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dsCadastro.DataSet.FieldByName('AGE_DTALTE').AsDateTime := M_DTMOVI;
           dsCadastro.DataSet.FieldByName('AGE_HOALTE').AsString   := M_HOMOVI;
           dsCadastro.DataSet.FieldByName('AGE_USALTE').AsInteger  := StrtoInt(uFrmMain.M_CDUSUA);
           dbeDtAtendimento.setfocus;
      End;
end;

procedure TfrmCadAtendimento.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclus�o de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsAtendimento.Delete;
            dmDados.cdsAtendimento.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('N�o ha registro a ser excluido','ATEN��O',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadAtendimento.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeCliente.Text) Then
       Begin
           Application.MessageBox('Digite o c�digo do cliente.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCliente.SetFocus;
           Exit;
       End;
      //
     If (dbeDtAtendimento.Text = '  /  /    ') Then
       Begin
           Application.MessageBox('Digite a data para atendimento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDtAtendimento.SetFocus;
           Exit;
       End;
      //
     If (dbeHora.Text = '  /  /    ') Then
       Begin
           Application.MessageBox('Digite a hora para atendimento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeHora.SetFocus;
           Exit;
       End;
      //
      If uFuncoes.Empty(cmbFuncionarios.Text) Then
       Begin
           Application.MessageBox('Selecione o funcion�rio.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbFuncionarios.SetFocus;
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
                 dmDados.cdsConfigCFG_ATENDIMENTOS.AsInteger :=
                   dmDados.cdsConfigCFG_ATENDIMENTOS.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsAtendimentoAGE_ID.AsInteger :=
                   dmDados.cdsConfigCFG_ATENDIMENTOS.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsAtendimento.ApplyUpdates(0);
          //
          dmDados.Comit(udmDados.Transc);
          //
          Application.MessageBox(PChar(MSG_OK),
              'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
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

procedure TfrmCadAtendimento.spClienteClick(Sender: TObject);
begin
  inherited;
      dbeCliente.SetFocus;
      Application.CreateForm(TfrmConsClientes, frmConsClientes);
      try
          frmConsClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                dmDados.cdsAtendimentoAGE_CLIENTE.AsInteger :=
                    frmConsClientes.cdsConsultarCLI_CODIGO.AsInteger;
                dbeDtAtendimento.SetFocus;    
           End;
          //
          frmConsClientes.Free;
      End;
end;

procedure TfrmCadAtendimento.dbeClienteChange(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert]) and uFuncoes.Empty(dbeCliente.Text) Then
          edtNomeCliente.Clear;
end;

procedure TfrmCadAtendimento.dbeClienteExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert]) and (dmDados.cdsAtendimentoAGE_CLIENTE.AsInteger > 0) Then
      begin
           If  not (dmDados.ProcurarValor(dmDados.cdsAtendimentoAGE_CLIENTE.AsString, 'CLI_CODIGO', 'CLIENTES')) Then
           Begin
                Application.MessageBox(PChar('C�digo do cliente n�o cadastrado.'),
                 'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                dbeCliente.SetFocus;
                dbeCliente.Clear;
                Exit;
           End;
           edtNomeCliente.Text := dmDados.GetNomeCliente(dmDados.cdsAtendimentoAGE_CLIENTE.AsInteger);
      End;
end;

procedure TfrmCadAtendimento.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select A.AGE_ID, A.AGE_DTMOVI, A.AGE_HOMOVI, A.AGE_CLIENTE, CL.CLI_NOME, ';
        aTexto := aTexto + 'A.AGE_DTATENDIMENTO, A.AGE_HOATENDIMENTO, A.AGE_SITUACAO, ';
        aTexto := aTexto + 'A.AGE_FUNCIONARIO, F.FUN_NOME from AGENDA A ';
        aTexto := aTexto + 'INNER JOIN CLIENTES CL ON CL.CLI_CODIGO = A.AGE_CLIENTE ';
        aTexto := aTexto + 'INNER JOIN FUNCIONARIOS F ON F.FUN_CODIGO = A.AGE_FUNCIONARIO ';
        //
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (A.AGE_ID = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(CL.CLI_NOME) like :pNOME)';
                //2: CommandText := CommandText + ' Where (CL.CLI_CPF = :pCPF)';
            end;
            CommandText := CommandText + 'order by CL.CLI_NOME ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,59) + '%';
                //2: datasetConsultar.Params.ParamByName('pCPF').AsString    := edtConsultar.Text;
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

procedure TfrmCadAtendimento.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarAGE_ID.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadAtendimento.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Agenda...'));
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

procedure TfrmCadAtendimento.cmbFuncionariosExit(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert]) Then
    begin
         if not uFuncoes.Empty(dbeDtAtendimento.text)
          and not uFuncoes.Empty(dbeHora.Text) and
           not uFuncoes.Empty (cmbFuncionarios.Text) Then
           begin
              If (dmDados.VerificarHoraAgenda(dmDados.cdsAtendimentoAGE_FUNCIONARIO.AsInteger,
                 dmDados.cdsAtendimentoAGE_DTATENDIMENTO.AsDateTime,
                 dmDados.cdsAtendimentoAGE_HOATENDIMENTO.AsString)) Then
              begin
                   Application.MessageBox('J� existe atendimento para este '+#13+
                                  'Funcion�rio na data e hor�rio indicado.','ATEN��O',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   cmbFuncionarios.SetFocus;
                   exit;
              End;
              //
            {  If (dmDados.VerificarHoraAgendaFuncionario(dmDados.cdsAtendimentoAGE_FUNCIONARIO.AsInteger,
                 dmDados.cdsAtendimentoAGE_DTATENDIMENTO.AsDateTime,
                 dmDados.cdsAtendimentoAGE_HOATENDIMENTO.AsString)) Then
              begin
                   Application.MessageBox('J� existe atendimento para este '+#13+
                                  'Funcion�rio no hor�rio indicado.','ATEN��O',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   cmbFuncionarios.SetFocus;
                   exit;
              End;}
           End;
    End;
end;

procedure TfrmCadAtendimento.BtImprimirClick(Sender: TObject);
begin
  inherited;
       uFuncoes.RefreshCDS(dmDados.cdsConfig);
       If not (dmDados.cdsAtendimento.IsEmpty) Then
        begin
             with dmDados.ppRepAtendimento do
              begin
                   If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                       dmDados.ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                   //
                   dmDados.txtCabecalho.Lines.Clear;
                   dmDados.txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_FANTASIA.AsString);
                   dmDados.txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_ENDERECO.AsString + ', '
                                         +dmDados.cdsConfigCFG_NUMERO.AsString+ ', '
                                         +dmDados.cdsConfigCFG_BAIRRO.AsString+', CEP: '
                                         +uFuncoes.FormataCep(dmDados.cdsConfigCFG_CEP.AsString));
                   dmDados.txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_CIDADE.AsString + ' - '+
                                          dmDados.cdsConfigCFG_UF.AsString+'. FONE: '+
                                          uFuncoes.FormataFONE(dmDados.cdsConfigCFG_NRFONE.AsString)+
                                          ' CNPJ:'+uFuncoes.FormataCNPJ(dmDados.cdsConfigCFG_CNPJ.AsString)+
                                          '  Inc. Est.: '+dmDados.cdsConfigCFG_INSEST.AsString);
                   //
                   dmDados.txtCliente.Caption := dmDados.GetNomeCliente(dmDados.cdsAtendimentoAGE_CLIENTE.AsInteger);
                   //
                   PrintReport;
              End;
        End;
end;

end.
