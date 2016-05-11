unit uFrmRelAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit,
  FMTBcd, DBClient, Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl,
  ppVar, ppStrtch, ppMemo;

type
  TfrmRelAtendimentos = class(TfrmRelPadrao)
    RadioGroup1: TRadioGroup;
    edtCDINICIO: TDateEdit;
    edtDTFINAL: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppImgLogo: TppImage;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    cdsConsultarAGE_ID: TIntegerField;
    cdsConsultarAGE_CDLOJA: TIntegerField;
    cdsConsultarAGE_CLIENTE: TIntegerField;
    cdsConsultarAGE_DTATENDIMENTO: TDateField;
    cdsConsultarAGE_HOATENDIMENTO: TStringField;
    cdsConsultarAGE_FUNCIONARIO: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarFUN_NOME: TStringField;
    cdsConsultarAGE_SITUACAO: TStringField;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel9: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    txtPeriodo: TppLabel;
    txtSituacao: TppLabel;
    txtCabecalho: TppMemo;
    procedure FormShow(Sender: TObject);
    procedure edtCDINICIOExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAtendimentos: TfrmRelAtendimentos;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelAtendimentos.FormShow(Sender: TObject);
begin
  inherited;
     edtCDINICIO.Date := Date();
     edtDTFINAL.Date  := edtCDINICIO.Date;
end;

procedure TfrmRelAtendimentos.edtCDINICIOExit(Sender: TObject);
begin
  inherited;
     If (edtCDINICIO.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(edtCDINICIO.Text);
              edtCDINICIO.Date := StrToDate(edtCDINICIO.Text);
           except
           on EConvertError do
             begin
                ShowMessage('Data Inválida!');
                edtCDINICIO.Clear;
                edtCDINICIO.SetFocus;
             End;
           end;
       End;
end;

procedure TfrmRelAtendimentos.edtDTFINALExit(Sender: TObject);
begin
  inherited;
     If (edtDTFINAL.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(edtDTFINAL.Text);
              edtDTFINAL.Date := StrToDate(edtDTFINAL.Text);
              //
              If (edtDTFINAL.Date < edtCDINICIO.Date) Then
               begin
                    edtDTFINAL.Date := edtCDINICIO.Date;
                    edtDTFINAL.SetFocus;
                    Exit;
               End;
           except
           on EConvertError do
             begin
                ShowMessage('Data Inválida!');
                edtDTFINAL.Clear;
                edtDTFINAL.SetFocus;
             End;
           end;
       End;
end;

procedure TfrmRelAtendimentos.BtImprimirClick(Sender: TObject);
Var
   aTexto, aSituacao, aMensagem : String;
   aDtInicial, aDtFinal : TDate;
begin
  inherited;
       uFuncoes.RefreshCDS(dmDados.cdsConfig);
       aDtInicial := StrtoDate('01/01/2000');
       aDtFinal   := Date();
       //
       Case RadioGroup1.ItemIndex of
          0 : aSituacao := 'A';
          1 : aSituacao := 'F';
          2 : aSituacao := 'C';
       End;
       //
       Case RadioGroup1.ItemIndex of
          0 : aMensagem := 'AGENDADAS';
          1 : aMensagem := 'ATENDIDAS';
          2 : aMensagem := 'CANCELADAS';
       End;
       //
       If (edtCDINICIO.Text <> '  /  /    ') Then
          aDtInicial := edtCDINICIO.Date;
       If (edtDTFINAL.Text <> '  /  /    ') Then
          aDtFinal   := edtDTFINAL.Date;
       //
       aTexto := 'Select A.AGE_ID, A.AGE_CDLOJA, A.AGE_CLIENTE, A.AGE_DTATENDIMENTO, ';
       aTexto := aTexto + 'A.age_hoatendimento, A.AGE_FUNCIONARIO, CL.CLI_NOME, F.FUN_NOME, A.AGE_SITUACAO ';
       aTexto := aTexto + 'from AGENDA A ';
       aTexto := aTexto + 'INNER JOIN CLIENTES CL ON CL.CLI_CODIGO = A.AGE_CLIENTE ';
       aTexto := aTexto + 'INNER JOIN FUNCIONARIOS F ON F.FUN_CODIGO = A.AGE_FUNCIONARIO ';
       aTexto := aTexto + ' Where (A.AGE_DTATENDIMENTO >= :pDTINIC) and (A.AGE_DTATENDIMENTO <= :pDTFINA) ';
       aTexto := aTexto + ' and (A.AGE_SITUACAO = '+QuotedStr(aSituacao)+') ';
       aTexto := aTexto + ' Order by A.AGE_DTATENDIMENTO, A.age_hoatendimento ';
       //
       With cdsConsultar do
        begin
             Close;
             CommandText := aTexto;
             Params[0].AsDateTime := aDtInicial;
             Params[1].AsDateTime := aDtFinal;
             open;
        End;
        //
       If not (cdsConsultar.IsEmpty) Then
        begin
             with ppReport1 do
              begin
                   If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                       ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                   //
                   txtPeriodo.Caption  := 'PERÍODO  : '+ edtCDINICIO.Text + ' À '+edtDTFINAL.Text;
                   txtSituacao.Caption := 'SITUAÇÃO : '+aMensagem;
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
        End
        Else
        begin
             Application.MessageBox('Não há movimento no período indicado.',
               'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);         
        End;
end;

end.
