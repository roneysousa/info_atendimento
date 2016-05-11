unit uFrmCadFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, SqlExpr, DB, DBClient, Provider, ComCtrls,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask, ToolEdit,
  RXDBCtrl, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppBands, ppCache, ppVar, myChkBox;

type
  TfrmCadFuncionario = class(TfrmCadastro)
    cdsConsultarFUN_CODIGO: TIntegerField;
    cdsConsultarFUN_NOME: TStringField;
    cdsConsultarFUN_FONE: TStringField;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbeCPF: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    cmbCidade: TDBLookupComboBox;
    Label10: TLabel;
    cmbUF: TDBComboBox;
    Label7: TLabel;
    cmbBairro: TDBLookupComboBox;
    Label8: TLabel;
    dbeIdentidade: TDBEdit;
    Label9: TLabel;
    dbeOrgao: TDBEdit;
    cmbUFEmissor: TDBComboBox;
    Label11: TLabel;
    rbSexo: TDBRadioGroup;
    Label12: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label15: TLabel;
    dbeDataNasc: TDBDateEdit;
    Label13: TLabel;
    dbeDTCADA: TDBDateEdit;
    dbeDTADMI: TDBDateEdit;
    Label14: TLabel;
    Label16: TLabel;
    cmbCargo: TDBLookupComboBox;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    Label19: TLabel;
    DBEdit7: TDBEdit;
    Label20: TLabel;
    DBEdit8: TDBEdit;
    Label21: TLabel;
    cmbSituacao: TDBLookupComboBox;
    BtImprimir: TBitBtn;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    txtCabecalho: TppMemo;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    myCbxMasc: TmyCheckBox;
    ppLabel14: TppLabel;
    myCbxFem: TmyCheckBox;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText20: TppDBText;
    ppLabel24: TppLabel;
    txtCPF: TppLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    ppLabel25: TppLabel;
    txtCEP: TppLabel;
    txtFONE: TppLabel;
    txtCELULAR: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeIdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCidadeExit(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure dbeDataNascExit(Sender: TObject);
    procedure dbeDTADMIExit(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Registro;
    procedure Buscar(iCodigo : Integer);
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

uses udmDados, uFrmMain, uFuncoes;

{$R *.dfm}

{ TfrmCadFuncionario }

procedure TfrmCadFuncionario.Buscar(iCodigo: Integer);
begin
     uFuncoes.FilterCDS(DMDados.cdsFuncionario, fsInteger, InttoStr(iCodigo));
end;

procedure TfrmCadFuncionario.Registro;
begin
     dmDados.AbrirTabelaConfig();
     //
     If (dmDados.cdsConfigCFG_FUNCIONARIO.AsInteger > 0) Then
         uFuncoes.FilterCDS(DMDados.cdsFuncionario, fsInteger, InttoStr(uFuncoes.mvcodigo('FUN_CODIGO','FUNCIONARIOS')))
     Else
         uFuncoes.FilterCDS(DMDados.cdsFuncionario, fsInteger, '-1');
     //
     If not uFuncoes.Empty(dmDados.cdsFuncionarioFUN_CIDADE.AsString)
      and not uFuncoes.Empty(dmDados.cdsFuncionarioFUN_BAIRRO.AsString) Then
          uFuncoes.FilterCDS(dmDados.cdsListaBairros, fsInteger, dmDados.cdsFuncionarioFUN_CIDADE.AsString);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadFuncionario.FormShow(Sender: TObject);
begin
  inherited;
     uFuncoes.RefreshCDS(dmDados.cdsListaCidades);
     uFuncoes.RefreshCDS(dmDados.cdsListaEstCivil);
     uFuncoes.RefreshCDS(dmDados.cdsListaSituacao);
     uFuncoes.RefreshCDS(dmDados.cdsListaCargos);
     //
     REGISTRO;
     //
     If (dmDados.cdsFuncionario.IsEmpty) Then
          BtAdicionarClick(Sender);
end;

procedure TfrmCadFuncionario.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    If (dsCadastro.DataSet.State in [dsBrowse]) Then
     begin
          DMDados.AbrirTabelaConfig;
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('FUN_CODIGO').AsInteger  :=
                    DMDados.cdsConfigCFG_FUNCIONARIO.AsInteger + 1;
                 FieldByName('FUN_DTCADA').AsDateTime := M_DTMOVI;
                 FieldByName('FUN_HOCADA').AsString     := M_HOMOVI;
                 FieldByName('FUN_USUARIO_CAD').AsInteger := StrtoInt(uFrmMain.M_CDUSUA);
            End;
            //
            dbeNome.SetFocus;
     End;

end;

procedure TfrmCadFuncionario.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dsCadastro.DataSet.FieldByName('FUN_DTALTE').AsDateTime := M_DTMOVI;
           dsCadastro.DataSet.FieldByName('FUN_HOALTE').AsString   := M_HOMOVI;
           dsCadastro.DataSet.FieldByName('FUN_USUARIO_ALT').AsInteger  := StrtoInt(uFrmMain.M_CDUSUA);
           dbeNome.setfocus;
      End;
end;

procedure TfrmCadFuncionario.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir este funcionário?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //
            dmDados.cdsFuncionario.Delete;
            dmDados.cdsFuncionario.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadFuncionario.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeNome.Text) Then
       Begin
           Application.MessageBox('Digite o nome do funcionário.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNome.SetFocus;
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
                 dmDados.cdsConfigCFG_FUNCIONARIO.AsInteger :=
                   dmDados.cdsConfigCFG_FUNCIONARIO.AsInteger + 1;
                 dmDados.cdsConfig.ApplyUpdates(0);
                 dmDados.cdsFuncionarioFUN_CODIGO.AsInteger :=
                   dmDados.cdsConfigCFG_FUNCIONARIO.AsInteger;
                 //
            End;
          //
          dsCadastro.DataSet.Post;
          DMDados.cdsFuncionario.ApplyUpdates(0);
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

procedure TfrmCadFuncionario.dbeIdentidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
      key:=#0;
end;

procedure TfrmCadFuncionario.cmbCidadeExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
       and not uFuncoes.Empty(dmDados.cdsFuncionarioFUN_CIDADE.AsString) Then
          uFuncoes.FilterCDS(dmDados.cdsListaBairros, fsInteger, dmDados.cdsFuncionarioFUN_CIDADE.AsString);
end;

procedure TfrmCadFuncionario.dbeCPFExit(Sender: TObject);
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
              If (dmDados.ProcurarValor(dbeCPF.Text, 'FUN_CPF', 'FUNCIONARIOS')) Then
                begin
                    //dbeCPF.Clear;
                    dbeCPF.SetFocus;
                    MessageDlg('CPF já cadastro.', mtInformation, [mbOk], 0);
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

procedure TfrmCadFuncionario.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select FUN_CODIGO, FUN_NOME, FUN_FONE from FUNCIONARIOS ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (FUN_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(FUN_NOME) like :pNOME)';
            end;
            CommandText := CommandText + 'order by FUN_NOME ';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsString := Copy(edtConsultar.Text,1,7);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,39) + '%';
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

procedure TfrmCadFuncionario.btnConsultarClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
     begin
       buscar(cdsConsultarFUN_CODIGO.AsInteger );
       PageControl1.ActivePageIndex := 0;
     End;                                
end;

procedure TfrmCadFuncionario.FormCreate(Sender: TObject);
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
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Funcionarios...'));
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

procedure TfrmCadFuncionario.BtImprimirClick(Sender: TObject);
Var
   iCodigo : Integer;
begin
  inherited;
      uFuncoes.RefreshCDS(dmDados.cdsConfig);
      //
      iCodigo := dmDados.cdsFuncionarioFUN_CODIGO.AsInteger;
      buscar(iCodigo);
      //
      If not (dmDados.cdsFuncionario.IsEmpty) Then
        begin
             with ppReport1 do
              begin
                   If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                       ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                   //
                   txtCabecalho.Lines.Clear;
                   txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_FANTASIA.AsString);
                   txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_ENDERECO.AsString + ', '
                                         +dmDados.cdsConfigCFG_NUMERO.AsString+ ', '
                                         +dmDados.cdsConfigCFG_BAIRRO.AsString+', CEP: '
                                         +uFuncoes.FormataCep(dmDados.cdsConfigCFG_CEP.AsString));
                   txtCabecalho.Lines.Add(dmDados.cdsConfigCFG_CIDADE.AsString + ' - '+
                                          dmDados.cdsConfigCFG_UF.AsString+'. FONE: '+
                                          uFuncoes.FormataFONE(dmDados.cdsConfigCFG_NRFONE.AsString)+
                                          ' CNPJ:'+uFuncoes.FormataCNPJ(dmDados.cdsConfigCFG_CNPJ.AsString)+
                                          '  Inc. Est.: '+dmDados.cdsConfigCFG_INSEST.AsString);
                   //
                   txtCPF.Caption := uFuncoes.FormataCPF(dmDados.cdsFuncionarioFUN_CPF.AsString);
                   txtCEP.Caption := uFuncoes.FormataCep(dmDados.cdsFuncionarioFUN_CEP.AsString);
                   If (dmDados.cdsFuncionarioFUN_SEXO.AsString = 'M') Then
                   begin
                       myCbxFem.Checked  := False;
                       myCbxMasc.Checked := True;
                   End
                   Else
                   begin
                       myCbxFem.Checked  := True;
                       myCbxMasc.Checked := False;
                   End;
                   //
                   if not uFuncoes.Empty(dmDados.cdsFuncionarioFUN_FONE.AsString) Then
                      txtFONE.Caption := uFuncoes.FormataFONE(dmDados.cdsFuncionarioFUN_FONE.AsString)
                   Else
                      txtFONE.Caption := '';
                   if not uFuncoes.Empty(dmDados.cdsFuncionarioFUN_CELULAR.AsString) Then
                      txtCELULAR.Caption := uFuncoes.FormataFONE(dmDados.cdsFuncionariofun_CELULAR.AsString)
                   Else
                      txtCELULAR.Caption := '';
                   //
                   PrintReport;
              End;
        End;
end;

procedure TfrmCadFuncionario.dbeDataNascExit(Sender: TObject);
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

procedure TfrmCadFuncionario.dbeDTADMIExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
      and (dbeDTADMI.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(dbeDTADMI.Text);
              dbeDTADMI.Date := StrToDate(dbeDTADMI.Text);
           except
           on EConvertError do
             begin
                ShowMessage('Data Inválida!');
                dbeDTADMI.Clear;
                dbeDTADMI.SetFocus;
             End;
           end;
       End;
end;

end.
