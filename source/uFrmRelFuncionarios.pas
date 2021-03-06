unit uFrmRelFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCache, ppCtrls, ppPrnabl, ppVar, ppStrtch, ppMemo;

type
  TfrmRelFuncionarios = class(TfrmRelPadrao)
    RadioGroup1: TRadioGroup;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    cdsConsultarFUN_CODIGO: TIntegerField;
    cdsConsultarFUN_NOME: TStringField;
    cdsConsultarFUN_FONE: TStringField;
    cdsConsultarTFU_DESCRICAO: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    cdsConsultarFONE: TStringField;
    ppImgLogo: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    cdsConsultarFUN_SITUACAO: TIntegerField;
    Label1: TLabel;
    cmbSituacao: TComboBox;
    txtSituacao: TppLabel;
    txtCabecalho: TppMemo;
    procedure cdsConsultarCalcFields(DataSet: TDataSet);
    procedure BtImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure CarregaSituacao();
  public
    { Public declarations }
  end;

var
  frmRelFuncionarios: TfrmRelFuncionarios;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelFuncionarios.cdsConsultarCalcFields(DataSet: TDataSet);
begin
  inherited;
     If not uFuncoes.Empty(cdsConsultarFUN_FONE.AsString) Then
       cdsConsultarFONE.AsString := uFuncoes.FormataFONE(cdsConsultarFUN_FONE.AsString);

end;

procedure TfrmRelFuncionarios.BtImprimirClick(Sender: TObject);
Var
   aTexto : String;
   iSituacao : Integer;
begin
  inherited;
       uFuncoes.RefreshCDS(dmDados.cdsConfig);
       //
       aTexto := ' select FU.FUN_CODIGO, FU.FUN_NOME, FU.FUN_FONE, TF.TFU_DESCRICAO, FU.FUN_SITUACAO from FUNCIONARIOS FU ';
       aTexto := aTexto + ' Inner join TIPO_FUNCIONARIO TF ON (TF.TFU_CODIGO = FU.FUN_CDCARGO) ';
       //
       if (cmbSituacao.ItemIndex > 0) Then
        begin
            iSituacao := dmDados.GetCodSituacao(cmbSituacao.Text);
            aTexto := aTexto + ' Where (FU.FUN_SITUACAO = '+QuotedStr(InttoStr(iSituacao))+')';
        End;
       //
       If (RadioGroup1.ItemIndex = 0) Then
           aTexto := aTexto  + ' order by FU.FUN_CODIGO'
       Else
           aTexto := aTexto  + ' order by FU.FUN_NOME';
       //
       With cdsConsultar do
        begin
             Close;
             CommandText := aTexto;
             open;
        End;
        //
       If not (cdsConsultar.IsEmpty) Then
        begin
             with ppReport1 do
              begin
                   If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                       ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                   if (cmbSituacao.ItemIndex > 1) Then
                       txtSituacao.Caption := 'SITUA��O : '+ cmbSituacao.Text
                   Else
                       txtSituacao.Caption := 'SITUA��O : TODAS';
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
        End;
end;

procedure TfrmRelFuncionarios.CarregaSituacao;
begin
     uFuncoes.RefreshCDS(dmDados.cdsListaSituacao);
     //
     cmbSituacao.Clear;
     dmDados.cdsListaSituacao.First;
     cmbSituacao.Items.Add(' ');
     While not (dmDados.cdsListaSituacao.Eof) do
      begin
           cmbSituacao.Items.Add(dmDados.cdsListaSituacaoSTC_DESCRICAO.AsString);
           //
           dmDados.cdsListaSituacao.Next;
      End;
end;

procedure TfrmRelFuncionarios.FormShow(Sender: TObject);
begin
  inherited;
      CarregaSituacao;
end;

end.
