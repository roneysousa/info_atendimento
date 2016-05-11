unit uFrmRelCPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, DB,
  DBClient, FMTBcd, Provider, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar,
  ppStrtch, ppMemo;

type
  TfrmRelCPagar = class(TfrmRelPadrao)
    Label1: TLabel;
    edtDTINICIAL: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label3: TLabel;
    cmbFornecedores: TComboBox;
    rgSituacao: TRadioGroup;
    rgPeriodos: TRadioGroup;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarPAG_SEQUENCIA: TIntegerField;
    cdsConsultarPAG_IDCONTA: TIntegerField;
    cdsConsultarPAG_NRPARCELA: TIntegerField;
    cdsConsultarPAG_CDLOJA: TIntegerField;
    cdsConsultarPAG_DTCOMPRA: TDateField;
    cdsConsultarPAG_DTVENCIMENTO: TDateField;
    cdsConsultarPAG_DTPAGAMENTO: TDateField;
    cdsConsultarPAG_VALORPARCELA: TFMTBCDField;
    cdsConsultarPAG_IDFORNECEDOR: TIntegerField;
    cdsConsultarPAG_SITUACAO: TStringField;
    cdsConsultarPAG_VALORPAGO: TFMTBCDField;
    cdsConsultarPAG_BANCO: TIntegerField;
    cdsConsultarPAG_NRCONTA: TStringField;
    cdsConsultarPAG_AGENCIA: TStringField;
    cdsConsultarPAG_NRCHEQUE: TStringField;
    cdsConsultarPAG_VALORDESCONTO: TFMTBCDField;
    cdsConsultarPAG_VALORJUROS: TFMTBCDField;
    ppReport1: TppReport;
    cdsConsultarPAG_ATRASO: TFloatField;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    txtPeriodo: TppLabel;
    txtSituacao: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    cdsConsultarFOR_FANTASIA: TStringField;
    txtCabecalho: TppMemo;
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsConsultarCalcFields(DataSet: TDataSet);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    Procedure CarregarFornecedores(aCDS : TClientDataSet);
    Function Consulta() : Boolean;
  public
    { Public declarations }
  end;

var
  frmRelCPagar: TfrmRelCPagar;

implementation

uses uFuncoes, udmDados, uFrmMain;

{$R *.dfm}

procedure TfrmRelCPagar.edtDTINICIALExit(Sender: TObject);
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

procedure TfrmRelCPagar.edtDTFINALExit(Sender: TObject);
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

procedure TfrmRelCPagar.CarregarFornecedores(aCDS: TClientDataSet);
begin
     cmbFornecedores.Clear;
     cmbFornecedores.Items.Add('');
     uFuncoes.RefreshCDS(aCDS);
     With aCDS do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 cmbFornecedores.Items.Add(FieldByName('FOR_FANTASIA').AsString);
                 //
                 Next;
            End;
            //
            EnableControls;
      End;
end;

function TfrmRelCPagar.Consulta: Boolean;
Var
    M_FLSITU, Texto, M_CAMPO, M_NMESCR, M_NMSITU : String;
    M_DTINIC, M_DTFINA : TDate;
    iUsuario : Integer;
begin
     uFuncoes.RefreshCDS(dmDados.cdsConfig);
     Result := False;
     M_DTINIC := StrtoDate('01/01/2000');
     M_DTFINA := Date();
     M_NMESCR := 'TODOS';
     //
     Case rgSituacao.ItemIndex of
        0 : M_FLSITU := 'A';
        1 : M_FLSITU := 'P';
        2 : M_FLSITU := 'T';
     End;
     //
     Case rgSituacao.ItemIndex of
        0 : M_NMSITU := 'ABERTAS';
        1 : M_NMSITU := 'PAGAS';
        2 : M_NMSITU := 'TODAS';
     End;
     //
     If (rgPeriodos.ItemIndex = 0) Then
        M_CAMPO := 'PAG_DTCOMPRA';
     If (rgPeriodos.ItemIndex = 1) Then
        M_CAMPO := 'PAG_DTVENCIMENTO';
     If (rgPeriodos.ItemIndex = 2) Then
        M_CAMPO := 'PAG_DTPAGAMENTO';
     //
     If (edtDTINICIAL.Text <> '  /  /    ') Then
         M_DTINIC := edtDTINICIAL.date;
     If (edtDTFINAL.Text <> '  /  /    ') Then
         M_DTFINA := edtDTFINAL.Date;
     //
     Texto := 'Select CP.PAG_SEQUENCIA, CP.PAG_IDCONTA, CP.PAG_NRPARCELA, CP.PAG_CDLOJA, ';
     Texto := Texto + '  CP.PAG_DTCOMPRA, CP.PAG_DTVENCIMENTO, CP.PAG_DTPAGAMENTO,  CP.PAG_VALORPARCELA, ';
     Texto := Texto + '  CP.PAG_IDFORNECEDOR, CP.PAG_SITUACAO, CP.PAG_VALORPAGO, CP.PAG_BANCO, CP.PAG_NRCONTA, ';
     Texto := Texto + '  CP.PAG_AGENCIA, CP.PAG_NRCHEQUE, CP.PAG_VALORDESCONTO, CP.PAG_VALORJUROS, ';
     Texto := Texto + '  F.FOR_FANTASIA ';
     Texto := Texto + '  from CONTASPAGAR CP ';
     Texto := Texto + '  INNER JOIN FORNECEDORES F ON F.FOR_CODIGO = CP.PAG_IDFORNECEDOR ';
     Texto := Texto + ' Where ('+M_CAMPO + '>= :pDTINICIAL) and ('+M_CAMPO + '<= :pDTFINAL) '; 
     // Situação
     If (M_FLSITU <> 'T') Then
            Texto := Texto + ' And (PAG_SITUACAO = :pSITUACAO) ';
     //
     If not ufuncoes.Empty(cmbFornecedores.Text) Then
              Texto := Texto + ' AND (PAG_IDFORNECEDOR = :pFORNECEDOR) ';
     //
     Texto := Texto + ' order by PAG_IDCONTA, PAG_NRPARCELA ';
     //
     With cdsConsultar do
     Begin
          Close;
          //
          CommandText := Texto;
          //
          If (M_FLSITU <> 'T') Then
             Params.ParamByName('pSITUACAO').AsString  := M_FLSITU;
          // Data inicial
          Params.ParamByName('pDTINICIAL').AsDate      := edtDTINICIAL.Date;
          // Data Final
          If (edtDTFINAL.Text <> '  /  /    ') Then
              Params.ParamByName('pDTFINAL').AsDate    := edtDTFINAL.Date;
          // Fornecedor
          If not uFuncoes.Empty(cmbFornecedores.Text) Then
              Params.ParamByName('pFORNECEDOR').AsInteger  := dmDados.GetCodigoFornecedor(cmbFornecedores.Text);
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
                       PrintReport;
                  End;
                //
                Result := True;
           End;
     End;
end;

procedure TfrmRelCPagar.FormShow(Sender: TObject);
begin
  inherited;
     CarregarFornecedores(dmDados.cdsListaFornecedores);
     //
     edtDTINICIAL.Date := Date();
     edtDTFINAL.Date   := edtDTINICIAL.Date;
end;

procedure TfrmRelCPagar.cdsConsultarCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
  inherited;
            If (cdsConsultar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
                  M_QTDIAS := Date() - cdsConsultar.FieldByName('PAG_DTVENCIMENTO').AsDateTime
             Else
                  M_QTDIAS := cdsConsultar.FieldByName('PAG_DTPAGAMENTO').AsDateTime -
                       cdsConsultar.FieldByName('PAG_DTVENCIMENTO').AsDateTime;
             //
             if (M_QTDIAS > 0) Then
                 cdsConsultar.FieldByName('PAG_ATRASO').AsFloat := M_QTDIAS
             Else
                 cdsConsultar.FieldByName('PAG_ATRASO').AsFloat := 0;
end;

procedure TfrmRelCPagar.BtImprimirClick(Sender: TObject);
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

end.
