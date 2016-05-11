unit uFrmCadCartas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask;

type
  TfrmCadCartas = class(TfrmCadastro)
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    cdsConsultarCAR_CODIGO: TIntegerField;
    cdsConsultarCAR_DESCRICAO: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  frmCadCartas: TfrmCadCartas;

implementation

uses udmDados, uFuncoes, uFrmMain;

{$R *.dfm}

{ TfrmCadCartas }

procedure TfrmCadCartas.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsCarta, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadCartas.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_CARTA.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsCarta, fsInteger, InttoStr(uFuncoes.mvcodigo('CAR_CODIGO','CARTAS')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsCarta, fsInteger, '-1');
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadCartas.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('CAR_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_CARTA.AsInteger + 1;
            End;
            //
            dbeDescricao.SetFocus;
     End;
end;

procedure TfrmCadCartas.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeDescricao.setfocus;
      End;
end;

procedure TfrmCadCartas.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir esta carta?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsCarta.Delete;
            dmDados.cdsCarta.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;

end;

procedure TfrmCadCartas.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite a descrição da carta.','ATENÇÃO',
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
                 dmDados.cdsConfigCFG_CARTA.AsInteger :=
                   dmDados.cdsConfigCFG_CARTA.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsCartaCAR_CODIGO.AsInteger :=
                     dmDados.cdsConfigCFG_CARTA.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsCarta.ApplyUpdates(0);
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

procedure TfrmCadCartas.edtConsultarChange(Sender: TObject);
Var
   aTexto : String;
begin
  inherited;
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'Select CAR_CODIGO, CAR_DESCRICAO from CARTAS';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (CAR_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(CAR_DESCRICAO) like :pNOME)';
            end;
            CommandText := CommandText + ' order by CAR_DESCRICAO';
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

procedure TfrmCadCartas.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarCAR_CODIGO.AsInteger);
       PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadCartas.FormShow(Sender: TObject);
begin
  inherited;
     //
     REGISTRO;
     //
     If (dmDados.cdsCarta.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadCartas.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Cartas...'));
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
