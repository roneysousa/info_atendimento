unit uFrmBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadBairros = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    cmbCidades: TDBLookupComboBox;
    cdsConsultarBAI_CODIGO: TIntegerField;
    cdsConsultarBAI_DESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
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
  frmCadBairros: TfrmCadBairros;

implementation

uses udmDados, uFrmMain, uFuncoes;

{$R *.dfm}

{ TfrmCadBairros }

procedure TfrmCadBairros.Buscar(iCodigo: Integer);
begin
    uFuncoes.FilterCDS(DMDados.cdsCidade , fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadBairros.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_CDBAIRRO.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsBairro, fsInteger, InttoStr(uFuncoes.mvcodigo('BAI_CODIGO','BAIRROS')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsBairro, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadBairros.FormShow(Sender: TObject);
begin
  inherited;
     uFuncoes.RefreshCDS(dmDados.cdsListaCidades);
     //
     REGISTRO;
     //
     If (dmDados.cdsBairro.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadBairros.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('BAI_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_CDBAIRRO.AsInteger + 1;
            End;
            //
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadBairros.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadBairros.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir este bairros?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsCidade.Delete;
            dmDados.cdsCidade.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;

end;

procedure TfrmCadBairros.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome do bairro.','ATENÇÃO',
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
                 dmDados.AbrirTabelaConfig();
                 //
                 dmDados.cdsConfig.Edit;
                 dmDados.cdsConfigCFG_CDBAIRRO.AsInteger :=
                   dmDados.cdsConfigCFG_CDBAIRRO.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsBairroBAI_CODIGO.AsInteger :=
                     dmDados.cdsConfigCFG_CDBAIRRO.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsBairro.ApplyUpdates(0);
          //
          dmDados.Comit(udmDados.Transc);
          //
          Application.MessageBox(PChar(MSG_OK),
              'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          //
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

procedure TfrmCadBairros.edtConsultarChange(Sender: TObject);
Var
   aTexto : String;
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select BAI_CODIGO, BAI_DESCRICAO from BAIRROS ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (BAI_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(BAI_DESCRICAO) like :pNOME)';
            end;
            CommandText := CommandText + ' order by BAI_DESCRICAO';
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

procedure TfrmCadBairros.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarBAI_CODIGO.AsInteger);
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadBairros.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Bairros...'));
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
