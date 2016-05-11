unit uFrmCadCargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadCargos = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    cdsConsultarTFU_CODIGO: TIntegerField;
    cdsConsultarTFU_DESCRICAO: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  frmCadCargos: TfrmCadCargos;

implementation

uses udmDados, uFuncoes, uFrmMain;

{$R *.dfm}

{ TfrmCadCargos }

procedure TfrmCadCargos.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsCargo, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadCargos.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_CARGO.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsCargo, fsInteger, InttoStr(uFuncoes.mvcodigo('TFU_CODIGO','TIPO_FUNCIONARIO')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsCargo, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadCargos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('TFU_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_CARGO.AsInteger + 1;
            End;
            //
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadCargos.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadCargos.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir este cargo?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsCargo.Delete;
            dmDados.cdsCargo.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadCargos.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descrição do cargo.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
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
                 dmDados.cdsConfigCFG_CARGO.AsInteger :=
                   dmDados.cdsConfigCFG_CARGO.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsCargoTFU_CODIGO.AsInteger :=
                   dmDados.cdsConfigCFG_CARGO.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsCargo.ApplyUpdates(0);
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

procedure TfrmCadCargos.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select TFU_CODIGO, TFU_DESCRICAO from TIPO_FUNCIONARIO ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (TFU_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(TFU_DESCRICAO) like :pNOME)';
            end;
            CommandText := CommandText + 'order by TFU_DESCRICAO ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
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

procedure TfrmCadCargos.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarTFU_CODIGO.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadCargos.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmDados.cdsCargo.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadCargos.dbeDescricaoExit(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert])
        and not uFuncoes.Empty(dbeDescricao.Text) Then
          If (dmDados.ProcurarValor(dbeDescricao.Text, 'TFU_DESCRICAO', 'TIPO_FUNCIONARIO')) Then
            begin
                 dbeDescricao.SetFocus;
                 MessageDlg('Descrição já cadastrada.', mtInformation, [mbOk], 0);
                 Exit;
            End;
end;

procedure TfrmCadCargos.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Cargos...'));
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
