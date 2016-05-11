unit uFrmLogon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, RxLookup, FMTBcd, DB,
  SqlExpr, DBClient, jpeg;

type
  TfrmLogon = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    edt_SENHA: TEdit;
    edtCDUSUA: TEdit;
    Image1: TImage;
    Image2: TImage;
    ClientDataSet1: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_SENHAExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_SENHAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDUSUAExit(Sender: TObject);
    procedure edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
     M_FECHA: Boolean;
     procedure ACESSO(W_CDUSUA, W_SNATUA : String);
     procedure CONSULTA;
     function LOGADO(M_CDUSUA : INTEGER) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

Const
      M_USERMASTER = '000';
      M_SNMASTER   = 'ADMG2';

var
  frmLogon: TfrmLogon;
  M_QTTENT, codigoUsuario : Integer;
  M_FLUSUA, administrador : boolean;
  nomeUsuario : String;


implementation

uses uFuncoes, uFrmMain, udmDados;

{$R *.DFM}

Function GetStateK (Key: integer): boolean;
begin
  Result := Odd (GetKeyState (Key));
end;

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      If Not M_FECHA Then
          Action := caNone
      Else
          Action := caFree;
     //
     Action := caFree;
end;

procedure TfrmLogon.btCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLogon.FormActivate(Sender: TObject);
begin
     M_QTTENT:=0;
     //
     edtCDUSUA.SetFocus;
end;

procedure TfrmLogon.edt_SENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edt_Senha.text) Then
        edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Senha.text));
end;

procedure TfrmLogon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      If GetStateK (VK_LMENU) And (Key = VK_F4) Then
          M_FECHA := False;
end;

procedure TfrmLogon.edt_SENHAKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     Begin
         key:=#0;
         Application.Terminate;
     End;
     //
     If (Key =#13) and not uFuncoes.Empty(edtCDUSUA.Text)
        and not uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Key := #0;
          ACESSO(edtCDUSUA.Text, edt_SENHA.Text);
     End;
end;

procedure TfrmLogon.ACESSO(W_CDUSUA, W_SNATUA: String);
Var
   M_ACHOU :boolean;
   qryUsuarios : TSQLQuery;
   aSenha : String;
begin
     // SE nome do usuario estiver vazio
     If uFuncoes.Empty(edtCDUSUA.Text) Then
     begin
          Application.MessageBox('Digite o c�digo de usu�rio.',
          'ATEN��O', MB_OK+MB_ICONINFORMATION);
          edtCDUSUA.SetFocus;
          Exit;
     end;
     //
     // Se a senha do usuario estiver vazio
     If uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Application.MessageBox('Digite sua senha de usu�rio.',
               'ATEN��O', MB_OK+MB_ICONINFORMATION);
          edt_SENHA.SetFocus;
          Exit;
     end;
     //
  Try
     M_QTTENT := M_QTTENT+1;
     W_CDUSUA := edtCDUSUA.Text;
     W_SNATUA := edt_SENHA.Text;
     If (StrtoInt(W_CDUSUA) > 1) Then
     Begin
         W_SNATUA := W_SNATUA+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(W_SNATUA));
         W_SNATUA := uFuncoes.Codifica(W_SNATUA);
     End;
     //
     uFuncoes.RefreshCDS(dmDados.cdsConfig);
     // Se Super-Usu�rio
     If (edtCDUSUA.Text = uFrmMain.M_USERMASTER) and (M_QTTENT<=3) Then
     begin
          If (edt_SENHA.Text = uFrmMain.M_SNMASTER) Then
          Begin
              codigoUsuario := 1;
              nomeUsuario   := 'USERMASTER';
              administrador := true;
              uFrmMain.M_CDUSUA := uFuncoes.StrZero(InttoStr(codigoUsuario),3);
              uFrmMain.M_NMUSUA := nomeUsuario;
              uFrmMain.admin    := administrador;
              //uFrmMain.M_FLLOGI := True;
              //uFrmMain.M_FLMAST := 1;
              M_FLUSUA := True;
              ModalResult := mrOk;
              //
              If Not (LOGADO(codigoUsuario)) Then
                 ShowMessage('Erro ao adicionar tarefa do usu�rio.');
              //
              //Close;
              Exit;
          End
          Else
          Begin
              Application.MessageBox('Senha inv�lida!!!',
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              edt_SENHA.Clear;
              edt_SENHA.SetFocus;
              Exit;
          End;
     End;
     //
     qryUsuarios := TSQLQuery.Create(nil);
     With qryUsuarios do
     try
          SQLConnection := dmDados.sqlConexao;
          Close;
          SQL.Add('Select "SEN_CODIGO", "SEN_NOME", "SEN_DTATUAL", "SEN_SNATUA" from USUARIOS');
          SQL.Add('Where ("SEN_CODIGO" = :pCODIGO)');
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
          //
          aSenha :=  FieldByName('SEN_SNATUA').AsString;
          // Procura usu�rio
          If (M_QTTENT<=3) Then
          begin
               If (aSenha <> W_SNATUA) Then
                begin
                     Application.MessageBox('Senha inv�lida!!!',
                           'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edt_SENHA.Clear;
                     edt_SENHA.SetFocus;
                     Exit;
                end
                else
                begin
                     codigoUsuario := FieldByName('SEN_CODIGO').AsInteger;
                     nomeUsuario   := FieldByName('SEN_NOME').AsString;
                     uFrmMain.M_CDUSUA := InttoStr(codigoUsuario);
                     uFrmMain.M_NMUSUA := nomeUsuario;
                     uFrmMain.M_SNATUA := FieldByName('SEN_SNATUA').AsString;
                     //uFrmMain.M_FLLOGI := True;
                     //uFrmMain.M_FLMAST := 0;
                     //
                     dmDados.cdsUsuario.Close;
                     dmDados.cdsUsuario.Params.ParamByName('pCODIGO').AsInteger := StrtoInt(uFrmMain.M_CDUSUA);
                     dmDados.cdsUsuario.Open;
                     dmDados.cdsUsuario.Edit;
                     //
                     dmDados.cdsUsuarioSEN_DTATUAL.AsDateTime := Date();
                     if (dmDados.cdsUsuarioSEN_ADMIN.AsString = 'T') Then
                      Begin
                          administrador  := true;
                          uFrmMain.admin := True;
                      End
                      Else
                      begin
                          administrador  := False;
                          uFrmMain.admin := False;
                      End;
                      // Getcomputer;
                      dmDados.cdsUsuario.Post;
                      dmDados.cdsUsuario.ApplyUpdates(0);
                      //
                      M_FLUSUA := True;
                      //
                      ModalResult := mrOk;
                      //
                      If Not (LOGADO(codigoUsuario)) Then
                          ShowMessage('Erro ao adicionar tarefa do usu�rio.');
                End;
                //
            End
          Else
            begin
                Application.MessageBox('O Sistema ser� Fechado!',
                   'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Application.Terminate;
            End;
     Finally
          Free;
     End;
   Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao acessar o sistema!!!'
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //
             Close;
        End;
   End;
end;

procedure TfrmLogon.CONSULTA;
Var
    qryAux : TSQLQuery;
    aTexto : String;
begin
     aTexto := 'Select "SEN_CODIGO", "SEN_NOME", "SEN_DTATUAL", "SEN_SNATUA" from USUARIOS Where ("SEN_CODIGO" = :pCODIGO)';
     qryAux := TSQLQuery.Create(nil);
     With qryAux do
     try
          SQLConnection := dmDados.sqlConexao;
          Close;
          SQL.Add(aTexto);
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
          //
           If (IsEmpty) Then
             Begin
                  Application.MessageBox('Registro de usu�rio n�o cadastrado!!!','ATEN��O',
                              MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                  edtCDUSUA.Clear;
                  edtCDUSUA.SetFocus;
                  Exit;
             End
             Else
                 edt_SENHA.SetFocus;
     Finally
          Free;
     End;
end;

procedure TfrmLogon.edtCDUSUAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDUSUA.Text) Then
     begin
          {If (LOGADO(StrtoInt(edtCDUSUA.Text)) = True) Then
            begin
                 Application.MessageBox('Usu�rio j� est� acessando o sistema!!!' ,
                   'ATEN��O', MB_OK+MB_ICONINFORMATION);
                 edtCDUSUA.Clear;
                 edtCDUSUA.SetFocus;
                 Exit;
            End;}
          //
          edtCDUSUA.Text := uFuncoes.StrZero(edtCDUSUA.Text,3);
          CONSULTA;
     End;
end;

procedure TfrmLogon.edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) Then
    Begin
         key:=#0;
         Application.Terminate;
    End;
    //
    If (key = #13) and uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         edtCDUSUA.Text := '000';
         edt_SENHA.SetFocus; 
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         CONSULTA;
    End;
end;

procedure TfrmLogon.FormShow(Sender: TObject);
begin
     M_FLUSUA := False;
     M_QTTENT := 0;
     //
     edtCDUSUA.SetFocus;
end;

{function TfrmLogon.LOGADO(M_CDUSUA: INTEGER): Boolean;
begin
     With qryLogado do
     Begin
          Close;
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
     End;
     //
     If not (qryLogado.IsEmpty) Then
     Begin
          If (qryLogado.FieldByName('SEN_DTATUAL').AsDateTime = Date()) Then
              result := True
          Else
              result := False;
     End;
     //
     qryLogado.Close;
end;}

procedure TfrmLogon.Image2Click(Sender: TObject);
begin
     Application.Terminate;
end;

function TfrmLogon.LOGADO(M_CDUSUA: INTEGER): Boolean;
Var
   aTexto, aHora, aComputador, aAcao : String;
   qryInclusao : TSQLQuery;
   aData : TDate;
   iSeq : Integer;
begin
   Result := False;
   aData := Date();
   aHora := Copy(TimetoStr(Time),1,5);
   aComputador := uFuncoes.SysComputerName();
   aAcao  := 'Entrou : '+DatetoStr(aData)+' - '+aHora + ' *F*';
   aTexto := 'Insert into tarefas_usuarios ("TAR_SEQUENCIA", "TAR_USUARIO", "TAR_DTMOVI", "TAR_HOMOVI", "TAR_COMPUTADOR", "TAR_ACAO") ';
   aTexto := aTexto +' values (:pSEQ, :pUSUARIO, :pDTMOVI, :pHOMOVI, :pCOMPUTADOR, :pACAO)';
   //
   dmDados.AbrirTabelaConfig();
   dmDados.cdsConfig.Edit;
   dmDados.cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger :=
      dmDados.cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger + 1;
   dmDados.cdsConfig.ApplyUpdates(0);
   iSeq := dmDados.cdsConfigCFG_SEQTAREFAUSUARIOS.AsInteger;
   //
   qryInclusao := TSQLQuery.Create(nil);
   with qryInclusao do
    try
         SQLConnection := dmDados.sqlConexao;
         Close;
         SQL.Add(aTexto);
         Params.ParamByName('pSEQ').AsInteger     := iSeq;
         Params.ParamByName('pUSUARIO').AsInteger := M_CDUSUA;
         Params.ParamByName('pDTMOVI').AsDate     := aData;
         Params.ParamByName('pHOMOVI').AsString   := aHora;
         Params.ParamByName('pCOMPUTADOR').AsString := aComputador;
         Params.ParamByName('pACAO').AsString     := aAcao;
         ExecSQL();
         //
         Result := True;
    Finally
         Free;
    End;
end;

End.
