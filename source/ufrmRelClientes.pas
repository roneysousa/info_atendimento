unit ufrmRelClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCache, jpeg, ppPrnabl, ppCtrls, ppVar, ppStrtch,
  ppMemo;

type
  TfrmRelClientes = class(TfrmRelPadrao)
    RadioGroup1: TRadioGroup;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarCLI_CPF: TStringField;
    cdsConsultarCLI_FONE1: TStringField;
    cdsConsultarCLI_CELULAR: TStringField;
    cdsConsultarCLI_SEXO: TStringField;
    cdsConsultarCLI_SITUACAO: TIntegerField;
    cdsConsultarFONE: TStringField;
    cdsConsultarCELULAR: TStringField;
    cdsConsultarSITUACAO: TStringField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
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
  frmRelClientes: TfrmRelClientes;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelClientes.cdsConsultarCalcFields(DataSet: TDataSet);
begin
  inherited;
      If (cdsConsultarCLI_SITUACAO.AsInteger = 1) Then
          cdsConsultarSITUACAO.AsString := 'ATIVO'
      Else
          cdsConsultarSITUACAO.AsString := 'INATIVO';
      //
      If not uFuncoes.Empty(cdsConsultarCLI_FONE1.AsString) Then
         cdsConsultarFONE.AsString := uFuncoes.FormataFONE(cdsConsultarCLI_FONE1.AsString);
      //
      If not uFuncoes.Empty(cdsConsultarCLI_CELULAR.AsString)  Then
        cdsConsultarCELULAR.AsString := uFuncoes.FormataFONE(cdsConsultarCLI_CELULAR.AsString);
end;

procedure TfrmRelClientes.BtImprimirClick(Sender: TObject);
Var
   aTexto : String;
   iSituacao : Integer;
begin
  inherited;
       uFuncoes.RefreshCDS(dmDados.cdsConfig);
       aTexto := 'select CLI_CODIGO, CLI_NOME, CLI_CPF, CLI_FONE1, CLI_CELULAR, CLI_SEXO, CLI_SITUACAO from CLIENTES ';
       if (cmbSituacao.ItemIndex > 0) Then
        begin
            iSituacao := dmDados.GetCodSituacao(cmbSituacao.Text);
            aTexto := aTexto + ' Where (CLI_SITUACAO = '+QuotedStr(InttoStr(iSituacao))+')';
        End;
       If (RadioGroup1.ItemIndex = 0) Then
           aTexto := aTexto  + ' order by CLI_CODIGO'
       Else
           aTexto := aTexto  + ' order by CLI_NOME';
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
                       txtSituacao.Caption := 'SITUAÇÃO : '+ cmbSituacao.Text
                   Else
                       txtSituacao.Caption := 'SITUAÇÃO : TODAS';
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

procedure TfrmRelClientes.CarregaSituacao;
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

procedure TfrmRelClientes.FormShow(Sender: TObject);
begin
  inherited;
      CarregaSituacao;
end;

end.
