unit uFrmRelCReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls,
  FMTBcd, DBClient, Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache,
  ppVar, ppStrtch, ppMemo;

type
  TfrmRelCReceber = class(TfrmRelPadrao)
    Label1: TLabel;
    edtDTINICIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label3: TLabel;
    dbeCDCLIE: TEdit;
    Label2: TLabel;
    edtNRCRED: TEdit;
    rgSituacao: TRadioGroup;
    rgPeriodos: TRadioGroup;
    edtNMCLIE: TEdit;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    ppReport1: TppReport;
    cdsConsultarREC_SEQUENCIA: TIntegerField;
    cdsConsultarREC_IDCONTASRECEBER: TIntegerField;
    cdsConsultarREC_NRPARCELA: TIntegerField;
    cdsConsultarREC_CDLOJA: TIntegerField;
    cdsConsultarREC_CLIENTE: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarREC_DTMOVI: TDateField;
    cdsConsultarREC_DTVENCIMENTO: TDateField;
    cdsConsultarREC_DTPAGAMENTO: TDateField;
    cdsConsultarREC_VALOR: TFMTBCDField;
    cdsConsultarREC_SITUACAO: TStringField;
    cdsConsultarREC_VLPAGO: TFMTBCDField;
    cdsConsultarREC_BANCO: TIntegerField;
    cdsConsultarREC_NRCONTA: TStringField;
    cdsConsultarREC_AGENCIA: TStringField;
    cdsConsultarREC_NRCHEQUE: TStringField;
    cdsConsultarREC_VALORDESCONTO: TFMTBCDField;
    cdsConsultarREC_VALORJUROS: TFMTBCDField;
    cdsConsultarREC_ATRASO: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLine3: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    txtPeriodo: TppLabel;
    txtSituacao: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBPipeline1: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    spLocCliente: TSpeedButton;
    txtCabecalho: TppMemo;
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCREDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbeCDCLIEExit(Sender: TObject);
    procedure dbeCDCLIEChange(Sender: TObject);
    procedure edtNRCREDExit(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure cdsConsultarCalcFields(DataSet: TDataSet);
    procedure spLocClienteClick(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    Function Consulta() : Boolean;
  public
    { Public declarations }
  end;

var
  frmRelCReceber: TfrmRelCReceber;

implementation

uses udmDados, uFuncoes, uFrmMain, uFrmLocClientes, udmFinanceiro;

{$R *.dfm}

procedure TfrmRelCReceber.edtDTINICIALExit(Sender: TObject);
begin
  inherited;
  If (edtDTINICIAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINICIAL.Text);
              edtDTINICIAL.Text := DatetoStr(edtDTINICIAL.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINICIAL.Clear;
                     edtDTINICIAL.SetFocus;
                End;
           end;
     End;

end;

procedure TfrmRelCReceber.edtDTFINALExit(Sender: TObject);
begin
  inherited;
     If (edtDTFINAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINAL.Text);
              edtDTFINAL.Text := DatetoStr(edtDTFINAL.Date);
              //
              If (edtDTFINAL.Date < edtDTINICIAL.Date) Then
              Begin
                   Application.MessageBox(PChar('Perido final deve ser maior ou igual ao inicial!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINAL.Date := Date;
                   edtDTFINAL.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inválida!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINAL.Clear;
                     edtDTFINAL.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmRelCReceber.dbeCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
      //
     If (key = #13) and uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
           spLocClienteClick(Self);
      End;
end;

procedure TfrmRelCReceber.edtNRCREDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmRelCReceber.FormShow(Sender: TObject);
begin
  inherited;
     edtDTINICIAL.Date := Date();
     edtDTFINAL.Date   := edtDTINICIAL.Date;
end;

procedure TfrmRelCReceber.dbeCDCLIEExit(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(dbeCDCLIE.Text) Then
      If not (dmDados.ProcurarValor(dbeCDCLIE.Text, 'CLI_CODIGO', 'CLIENTES')) Then
        begin
             Application.MessageBox(Pchar('Código do cliente não cadastrado.'), 'Atenção',
                   MB_OK+MB_ICONWARNING);
             edtNMCLIE.Clear;
             dbeCDCLIE.Clear;
             dbeCDCLIE.SetFocus;
             Exit;
        End
        Else
         begin
             dbeCDCLIE.Text := uFuncoes.StrZero(dbeCDCLIE.Text,7);
             edtNMCLIE.Text := dmDados.GetNomeCliente(StrtoInt(dbeCDCLIE.Text));
         End;
end;

procedure TfrmRelCReceber.dbeCDCLIEChange(Sender: TObject);
begin
  inherited;
   If uFuncoes.Empty(dbeCDCLIE.Text) Then
        edtNMCLIE.Clear;
end;

procedure TfrmRelCReceber.edtNRCREDExit(Sender: TObject);
begin
  inherited;
    If not uFuncoes.Empty(edtNRCRED.Text) Then
      edtNRCRED.Text := uFuncoes.StrZero(edtNRCRED.Text, 7);
end;

procedure TfrmRelCReceber.BtImprimirClick(Sender: TObject);
begin
  inherited;
      BtImprimir.Enabled := False;
      Try
          If not (Consulta()) Then
              Application.MessageBox(PChar('Não há movimento no período indicado.'),
               'Atenção', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
      Finally
            BtImprimir.Enabled := True;
      End;
      Application.ProcessMessages;
end;

function TfrmRelCReceber.Consulta: Boolean;
Var
    M_FLSITU, Texto, M_CAMPO, M_NMESCR, M_NMSITU : String;
    M_DTINIC, M_DTFINA  : TDate;
    iUsuario : Integer;
begin
      uFuncoes.RefreshCDS(dmDados.cdsConfig);
      result := False;
      M_NMESCR := 'TODOS';
      M_DTINIC := StrtoDate('01/01/2000');
      M_DTFINA := Date();
     //
     Case rgSituacao.ItemIndex of
        0 : M_FLSITU := 'A';
        1 : M_FLSITU := 'R';
        2 : M_FLSITU := 'T';
     End;
     //
     Case rgSituacao.ItemIndex of
        0 : M_NMSITU := 'ABERTAS';
        1 : M_NMSITU := 'RECEBIDAS';
        2 : M_NMSITU := 'TODAS';
     End;
     //
     If (rgPeriodos.ItemIndex = 0) Then
        M_CAMPO := 'REC_DTMOVI';
     If (rgPeriodos.ItemIndex = 1) Then
        M_CAMPO := 'REC_DTVENCIMENTO';
     If (rgPeriodos.ItemIndex = 2) Then
        M_CAMPO := 'REC_DTPAGAMENTO';
     //
     Texto := 'Select CR.REC_SEQUENCIA, CR.REC_IDCONTASRECEBER, CR.REC_NRPARCELA, CR.REC_CDLOJA, ';
     Texto := Texto + 'CR.REC_CLIENTE, CL.CLI_NOME, CR.REC_DTMOVI, CR.REC_DTVENCIMENTO, CR.REC_DTPAGAMENTO, CR.REC_VALOR, ';
     Texto := Texto + 'CR.REC_SITUACAO, CR.REC_VLPAGO, CR.REC_BANCO, CR.REC_NRCONTA, CR.REC_AGENCIA, ';
     Texto := Texto + 'CR.REC_NRCHEQUE, CR.REC_VALORDESCONTO, CR.REC_VALORJUROS ';
     Texto := Texto + 'from CONTASRECEBER CR ';
     Texto := Texto + 'INNER JOIN CLIENTES CL ON CL.CLI_CODIGO = CR.REC_CLIENTE ';
     Texto := Texto + ' Where ('+M_CAMPO + '>= :pDTINICIAL) and ('+M_CAMPO + '<= :pDTFINAL) ';
     //
     If (M_FLSITU <> 'T') Then
         Texto := Texto + ' and (CR.REC_SITUACAO = :pSITUACAO) ';
     //
     Texto := Texto + ' and (CR.REC_CDLOJA = '+QuotedStr('1')+') ';
     //
     If not ufuncoes.Empty(dbeCDCLIE.Text) Then
         Texto := Texto + ' and (CR.REC_CLIENTE = '+QuotedStr(dbeCDCLIE.Text)+') ';
     //
     If not ufuncoes.Empty(edtNRCRED.Text) Then
         Texto := Texto + ' and (CR.REC_IDCONTASRECEBER = :pCREDITO) ';
     //
     Texto := Texto + ' order by CR.REC_IDCONTASRECEBER, CR.REC_NRPARCELA ';
     //
     if (edtDTINICIAL.Text <> '  /  /    ') Then
         M_DTINIC := edtDTINICIAL.Date;
     If (edtDTFINAL.Text <> '  /  /    ') Then
         M_DTFINA := edtDTFINAL.Date;
     //
     With cdsConsultar do
     Begin
          Close;
          //
          CommandText := Texto;
          // Data inicial
          Params.ParamByName('pDTINICIAL').AsDate      := M_DTINIC;
          Params.ParamByName('pDTFINAL').AsDate        := edtDTFINAL.Date;
          //
          If (M_FLSITU <> 'T') Then
              Params.ParamByName('pSITUACAO').AsString     := M_FLSITU;
          // credito
          If not ufuncoes.Empty(edtNRCRED.Text) Then
             Params.ParamByName('pCREDITO').AsInteger      := StrtoInt(edtNRCRED.Text);
          //
          Open;
          //
          If not (IsEmpty) then
           begin
                iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
                //
                with ppReport1 do
                  begin
                       If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                           ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                       //
                       txtPeriodo.Caption  := 'PERÍODO  : ' + edtDTINICIAL.Text +' à '+edtDTFINAL.Text;
                       txtSituacao.Caption := 'SITUAÇÃO : ' + M_NMSITU;
                       //ppLUsuario.Caption := 'Usuário : '+uFuncoes.StrZero(uFrmMain.M_CDUSUA,3)+' - '+ dmDados.GetNomeUsuario(iUsuario);
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
                       PrintReport;
                  End;
                //
                Result := True;
           End;
     End;
end;

procedure TfrmRelCReceber.cdsConsultarCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
  inherited;
     If (cdsConsultar.FieldByName('REC_SITUACAO').AsString = 'A') Then
           M_QTDIAS := Date() - cdsConsultar.FieldByName('REC_DTVENCIMENTO').AsDateTime
       Else
           M_QTDIAS := cdsConsultar.FieldByName('REC_DTPAGAMENTO').AsDateTime -
                       cdsConsultar.FieldByName('REC_DTVENCIMENTO').AsDateTime;
       //
       if (M_QTDIAS > 0) Then
           cdsConsultar.FieldByName('REC_ATRASO').AsFloat := M_QTDIAS
       Else
           cdsConsultar.FieldByName('REC_ATRASO').AsFloat := 0;
end;

procedure TfrmRelCReceber.spLocClienteClick(Sender: TObject);
begin
  inherited;
      dbeCDCLIE.SetFocus;
      Application.CreateForm(TfrmConsClientes, frmConsClientes);
      try
          frmConsClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                dbeCDCLIE.Text :=
                    uFuncoes.StrZero(frmConsClientes.cdsConsultarCLI_CODIGO.AsString,7);
                edtNRCRED.SetFocus;
           End;
          //
          frmConsClientes.Free;
      End;
end;

end.
