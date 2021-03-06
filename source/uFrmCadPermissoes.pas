unit uFrmCadPermissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, FMTBcd, DBClient, Provider, DB,
  SqlExpr, ImgList, StdCtrls, Buttons, DBCtrls;

type
  TfrmCadPermissoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbGridPermissoes: TDBGrid;
    dstPermissoes: TSQLDataSet;
    dspPermissoes: TDataSetProvider;
    cdsUsuPermissoes: TClientDataSet;
    cdsPermissoes: TClientDataSet;
    dsPermissoes: TDataSource;
    cdsPermissoesCODIGO: TIntegerField;
    cdsPermissoesMENU_NOME: TStringField;
    cdsPermissoesMENU_PAI: TIntegerField;
    cdsPermissoesPERMISSAO: TBooleanField;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    DBText1: TDBText;
    ImageList1: TImageList;
    cdsPermissoesNOVO: TBooleanField;
    cdsPermissoesALTERAR: TBooleanField;
    cdsPermissoesEXCLUIR: TBooleanField;
    DBText2: TDBText;
    Panel4: TPanel;
    cbxAcessos: TCheckBox;
    cxbNovo: TCheckBox;
    cbxAlterar: TCheckBox;
    cbxExcluir: TCheckBox;
    cbxAdmin: TCheckBox;
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGridPermissoesEnter(Sender: TObject);
    procedure dbGridPermissoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbGridPermissoesCellClick(Column: TColumn);
    procedure dbGridPermissoesColEnter(Sender: TObject);
    procedure cbxAcessosClick(Sender: TObject);
    procedure cxbNovoClick(Sender: TObject);
    procedure cbxAlterarClick(Sender: TObject);
    procedure cbxExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Selecionar_Todos(aCampo : Integer; aValor : Boolean);
    procedure Incluir_Dados_Usuario(aUsuario : Integer);
  public
    { Public declarations }
  end;

var
  frmCadPermissoes: TfrmCadPermissoes;
  M_CDUSUA : Integer;
  Menus: array[1..8] of String ;

implementation

uses UdmDados, uFuncoes, uFrmCadUsuarios;

{$R *.dfm}

procedure TfrmCadPermissoes.BtCancelarClick(Sender: TObject);
begin
    close;
end;

procedure TfrmCadPermissoes.BtGravarClick(Sender: TObject);
Var
    aConsulta, aNovo, aAlterar, aExcluir : String;
begin
     M_CDUSUA := dmDados.cdsUsuarioSEN_CODIGO.AsInteger;
     //
     DmDados.Start;
     try
          With cdsPermissoes do
            begin
                 DisableControls;
                 First;
                 //
                 While not (Eof) do
                  begin
                       If (cdsPermissoesPERMISSAO.AsBoolean) Then
                           aConsulta := 'S'
                       Else
                           aConsulta := 'N';
                       //
                       if (cdsPermissoesNOVO.AsBoolean) Then
                           aNovo := 'S'
                       Else
                           aNovo := 'N';
                       //
                       If (cdsPermissoesALTERAR.AsBoolean) Then
                           aAlterar := 'S'
                       Else
                          aAlterar  := 'N';
                       //
                       If (cdsPermissoesEXCLUIR.AsBoolean) Then
                           aExcluir := 'S'
                       Else
                           aExcluir := 'N';
                       //
                       DmDados.Incluir_Acesso_Usuario(M_CDUSUA, cdsPermissoesCODIGO.AsInteger,
                              cdsPermissoesMENU_NOME.AsString,
                              aConsulta, anovo, aAlterar, aExcluir);
                       //
                       Next;
                  End;
                 //
                 first;
                 EnableControls;
            End;
            //
            If (cbxAdmin.Checked) Then
                DmDados.SetAdminUsuario(M_CDUSUA, 'T')
            Else
                DmDados.SetAdminUsuario(M_CDUSUA, 'F');
            //
          DmDados.Comit(uDmDados.Transc);
          //
          Application.MessageBox(PChar('Permiss�es atualizada com sucesso.'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          //
          Close;
     Except
        on Exc:Exception do
        begin
            Application.MessageBox(PChar('Error ao tentar atualizar permiss�es de usu�rio.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            DmDados.Rollback;
        End;
     End;
end;

procedure TfrmCadPermissoes.FormShow(Sender: TObject);
begin
     // StrtoInt(DBText2.Caption
     If not (DmDados.ValidarAcesso(dmDados.cdsUsuarioSEN_CODIGO.AsInteger)) Then
     begin
         DmDados.Acessos_Sistema(cdsPermissoes, 1, 0);
         Incluir_Dados_Usuario(dmDados.cdsUsuarioSEN_CODIGO.AsInteger);
     End;
     //
     {If not (Dm.ValidarAcesso(StrtoInt(DBText2.Caption)) ) Then
         Dm.Acessos_Sistema(cdsPermissoes, 1, 0)
     Else}
     DmDados.Acessos_Sistema(cdsPermissoes, 2, dmDados.cdsUsuarioSEN_CODIGO.AsInteger);
     //
     if (cdsPermissoes.IsEmpty) Then
        BtGravar.Enabled := False
     Else
        BtGravar.Enabled := True;
     //
     If (dmDados.cdsUsuarioSEN_ADMIN.AsString = 'T') Then
        cbxAdmin.Checked := True
     Else
        cbxAdmin.Checked := False;
end;

procedure TfrmCadPermissoes.dbGridPermissoesEnter(Sender: TObject);
begin
     dbGridPermissoes.SelectedIndex := 1;
end;

procedure TfrmCadPermissoes.dbGridPermissoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
   If (Column.Field = cdsPermissoesMENU_NOME)
     and (cdsPermissoesMENU_PAI.AsInteger > 0) then
     begin
        dbGridPermissoes.Canvas.Font.Color := clBlue; // coloque aqui a cor desejada
        dbGridPermissoes.Canvas.Font.Style := [fsBold];
     End;
    //
    dbGridPermissoes.DefaultDrawDataCell(Rect, dbGridPermissoes.columns[datacol].field, State);
 {pinta checkbox}
  if Column.Field = cdsPermissoesPERMISSAO then
  begin
    dbGridPermissoes.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsPermissoesPERMISSAO.AsBoolean then
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;
  //
  if Column.Field = cdsPermissoesNOVO  then
  begin
    dbGridPermissoes.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsPermissoesNOVO.AsBoolean then
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;
  //
  if Column.Field = cdsPermissoesALTERAR then
  begin
    dbGridPermissoes.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsPermissoesALTERAR.AsBoolean then
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;
  //
  if Column.Field = cdsPermissoesEXCLUIR then
  begin
    dbGridPermissoes.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsPermissoesEXCLUIR.AsBoolean then
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridPermissoes.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;
end;

procedure TfrmCadPermissoes.dbGridPermissoesCellClick(Column: TColumn);
begin
  if Column.Field = cdsPermissoesPERMISSAO then
  begin
    cdsPermissoes.Edit;
    cdsPermissoesPERMISSAO.asBoolean := not cdsPermissoesPERMISSAO.AsBoolean;
  end;
  //
  if Column.Field = cdsPermissoesNOVO then
  begin
    cdsPermissoes.Edit;
    cdsPermissoesNOVO.asBoolean := not cdsPermissoesNOVO.AsBoolean;
  end;
  //
  if Column.Field = cdsPermissoesALTERAR then
  begin
    cdsPermissoes.Edit;
    cdsPermissoesALTERAR.asBoolean := not cdsPermissoesALTERAR.AsBoolean;
  end;
  //
  if Column.Field = cdsPermissoesEXCLUIR then
  begin
    cdsPermissoes.Edit;
    cdsPermissoesEXCLUIR.asBoolean := not cdsPermissoesEXCLUIR.AsBoolean;
  end;
end;

procedure TfrmCadPermissoes.dbGridPermissoesColEnter(Sender: TObject);
begin
  if dbGridPermissoes.SelectedField = cdsPermissoesPERMISSAO then
    dbGridPermissoes.Options := dbGridPermissoes.Options - [dgEditing]
  else
    dbGridPermissoes.Options := dbGridPermissoes.Options + [dgEditing];
  //
  if dbGridPermissoes.SelectedField = cdsPermissoesEXCLUIR then
    dbGridPermissoes.Options := dbGridPermissoes.Options - [dgEditing]
  else
    dbGridPermissoes.Options := dbGridPermissoes.Options + [dgEditing];
  //
  if dbGridPermissoes.SelectedField = cdsPermissoesNOVO then
    dbGridPermissoes.Options := dbGridPermissoes.Options - [dgEditing]
  else
    dbGridPermissoes.Options := dbGridPermissoes.Options + [dgEditing];
   //
  if dbGridPermissoes.SelectedField = cdsPermissoesALTERAR then
    dbGridPermissoes.Options := dbGridPermissoes.Options - [dgEditing]
  else
    dbGridPermissoes.Options := dbGridPermissoes.Options + [dgEditing];
end;

procedure TfrmCadPermissoes.Selecionar_Todos(aCampo : Integer; aValor : Boolean);
begin
     With cdsPermissoes do
      begin
           DisableControls;
           First;
           //
           While not (Eof) do
            begin
                 Edit;
                 If (aCampo = 1) Then
                     FieldByName('PERMISSAO').AsBoolean := aValor;
                 If (aCampo = 2) Then
                    FieldByName('NOVO').AsBoolean := aValor;
                 If (aCampo = 3) Then
                    FieldByName('ALTERAR').AsBoolean := aValor;
                 If (aCampo = 4) Then
                    FieldByName('EXCLUIR').AsBoolean := aValor;
                 //
                 Next;
            End;
            //
            First;
            EnableControls;
      End;
end;

procedure TfrmCadPermissoes.cbxAcessosClick(Sender: TObject);
begin
    If (cbxAcessos.Checked) Then
        Selecionar_Todos(1, True)
    Else
        Selecionar_Todos(1, False);
end;

procedure TfrmCadPermissoes.cxbNovoClick(Sender: TObject);
begin
    If (cxbNovo.Checked) Then
        Selecionar_Todos(2, True)
    Else
        Selecionar_Todos(2, False);
end;

procedure TfrmCadPermissoes.cbxAlterarClick(Sender: TObject);
begin
    If (cbxAlterar.Checked) Then
        Selecionar_Todos(3, True)
    Else
        Selecionar_Todos(3, False);
end;

procedure TfrmCadPermissoes.cbxExcluirClick(Sender: TObject);
begin
    If (cbxExcluir.Checked) Then
        Selecionar_Todos(4, True)
    Else
        Selecionar_Todos(4, False);
end;

procedure TfrmCadPermissoes.Incluir_Dados_Usuario(aUsuario: Integer);
begin
     DmDados.Start;
     //
     Try
        //
          With cdsPermissoes do
            begin
                 DisableControls;
                 First;
                 //
                 While not (Eof) do
                  begin
                       //
                       DmDados.Incluir_Acesso_Usuario(aUsuario, cdsPermissoesCODIGO.AsInteger,
                              cdsPermissoesMENU_NOME.AsString,
                              'N', 'N', 'N', 'N');
                       //
                       Next;
                  End;
                 //
                 first;
                 EnableControls;
            End;
            //
            DmDados.Comit(udmdados.Transc);
     Except
           DmDados.Rollback;
     End;
end;

end.
