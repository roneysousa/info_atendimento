unit uFrmRelProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCtrls, jpeg, ppPrnabl, ppCache, ppVar, ppStrtch,
  ppMemo;

type
  TfrmRelProdutos = class(TfrmRelPadrao)
    RadioGroup1: TRadioGroup;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarPRO_CODIGO: TStringField;
    cdsConsultarPRO_BARRAS: TStringField;
    cdsConsultarPRO_FLPROD: TStringField;
    cdsConsultarPRO_DESCRICAO: TStringField;
    cdsConsultarPRO_FORNECEDOR: TIntegerField;
    cdsConsultarPRO_VLCOMPRA: TFMTBCDField;
    cdsConsultarPRO_VLVENDA: TFMTBCDField;
    cdsConsultarPRO_TRIBUTACAO: TIntegerField;
    cdsConsultarNMFORNECEDOR: TStringField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    txtCabecalho: TppMemo;
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutos: TfrmRelProdutos;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelProdutos.BtImprimirClick(Sender: TObject);
Var
   aTexto : String;
begin
  inherited;
       uFuncoes.RefreshCDS(dmDados.cdsConfig);
       aTexto := 'select P.PRO_CODIGO, P.PRO_BARRAS, P.PRO_FLPROD, P.PRO_DESCRICAO, ';
       aTexto := aTexto + 'P.PRO_FORNECEDOR, P.PRO_VLCOMPRA, P.PRO_VLVENDA, P.PRO_TRIBUTACAO, ';
       aTexto := aTexto + '(Select F.FOR_FANTASIA from FORNECEDORES F Where (F.FOR_CODIGO = P.PRO_FORNECEDOR)) as NMFORNECEDOR ';
       aTexto := aTexto + ' from PRODUTOS P ';
       //
       If (RadioGroup1.ItemIndex = 0) Then
           aTexto := aTexto  + ' order by P.PRO_CODIGO'
       Else
           aTexto := aTexto  + ' order by P.PRO_DESCRICAO';
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
