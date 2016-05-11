unit uFrmCadCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadCidades = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    cmbUF: TDBComboBox;
    cdsConsultarCID_CODIGO: TIntegerField;
    cdsConsultarCID_DESCRICAO: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  frmCadCidades: TfrmCadCidades;

implementation

uses udmDados, uFrmMain, uFuncoes;

{$R *.dfm}

{ TfrmCadCidades }

procedure TfrmCadCidades.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsCidade , fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadCidades.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_CDCIDADE.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsCidade, fsInteger, InttoStr(uFuncoes.mvcodigo('CID_CODIGO','CIDADES')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsCidade, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadCidades.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('CID_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_CDCIDADE.AsInteger + 1;
            End;
            //
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadCidades.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadCidades.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir este cidade?' , 'Exclusão de registro',
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

procedure TfrmCadCidades.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome do cidade.','ATENÇÃO',
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
                 dmDados.cdsConfigCFG_CDCIDADE.AsInteger :=
                   dmDados.cdsConfigCFG_CDCIDADE.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsCidadeCID_CODIGO.AsInteger :=
                     dmDados.cdsConfigCFG_CDCIDADE.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsCidade.ApplyUpdates(0);
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

procedure TfrmCadCidades.FormShow(Sender: TObject);
begin
  inherited;
     //
     REGISTRO;
     //
     If (dmDados.cdsCidade.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadCidades.edtConsultarChange(Sender: TObject);
Var
   aTexto : String;
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select CID_CODIGO, CID_DESCRICAO from CIDADES';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (CID_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(CID_DESCRICAO) like :pNOME)';
            end;
            CommandText := CommandText + ' order by CID_DESCRICAO';
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

procedure TfrmCadCidades.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarCID_CODIGO.AsInteger);
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadCidades.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Cidades...'));
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
