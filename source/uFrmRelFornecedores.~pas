unit uFrmRelFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppVar, ppStrtch, ppMemo;

type
  TfrmRelFornedores = class(TfrmRelPadrao)
    RadioGroup1: TRadioGroup;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    cdsConsultarFOR_CODIGO: TIntegerField;
    cdsConsultarFOR_RAZAO: TStringField;
    cdsConsultarFOR_FANTASIA: TStringField;
    cdsConsultarFOR_FONE1: TStringField;
    cdsConsultarFONE: TStringField;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    txtCabecalho: TppMemo;
    procedure cdsConsultarCalcFields(DataSet: TDataSet);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFornedores: TfrmRelFornedores;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelFornedores.cdsConsultarCalcFields(DataSet: TDataSet);
begin
  inherited;
      //
      If not uFuncoes.Empty(cdsConsultarFOR_FONE1.AsString) Then
         cdsConsultarFONE.AsString := uFuncoes.FormataFONE(cdsConsultarFOR_FONE1.AsString);

end;

procedure TfrmRelFornedores.BtImprimirClick(Sender: TObject);
Var
   aTexto : String;
begin
  inherited;
       uFuncoes.RefreshCDS(dmDados.cdsConfig);
       aTexto := 'Select F.FOR_CODIGO, F.FOR_RAZAO, F.FOR_FANTASIA, F.FOR_FONE1 from FORNECEDORES F  ';
       //
       If (RadioGroup1.ItemIndex = 0) Then
           aTexto := aTexto  + ' order by F.FOR_CODIGO'
       Else
           aTexto := aTexto  + ' order by F.FOR_RAZAO';
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

end.
