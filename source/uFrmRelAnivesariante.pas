unit uFrmRelAnivesariante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppStrtch, ppRichTx, ppMemo;

type
  TfrmRelAniveriantes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtSair: TBitBtn;
    BtImprimir: TBitBtn;
    Label1: TLabel;
    cmbMeses: TComboBox;
    btnConsultar: TBitBtn;
    grdConsultar: TDBGrid;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsDados: TClientDataSet;
    cdsDadosCODIGO: TIntegerField;
    cdsDadosNOME: TStringField;
    cdsDadosCPF: TStringField;
    cdsDadosDATA_NASC: TDateField;
    cdsDadosDIA: TIntegerField;
    cdsDadosTELEFONE: TStringField;
    cdsDadosENDERECO: TStringField;
    cdsDadosCIDADE: TStringField;
    cdsDadosBAIRRO: TStringField;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarCLI_CPF: TStringField;
    cdsConsultarCLI_LOGRADOURO: TStringField;
    cdsConsultarCLI_NUMERO: TIntegerField;
    cdsConsultarCLI_CDBAIRRO: TIntegerField;
    cdsConsultarCLI_CDCIDADE: TIntegerField;
    cdsConsultarCLI_DTANIVERSARIO: TDateField;
    cdsConsultarCLI_FONE1: TStringField;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    dsCliente: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    txtTitulo: TppLabel;
    ppLine2: TppLine;
    txtRodape: TppLabel;
    ppLine1: TppLine;
    btnVisualizar: TBitBtn;
    ppDBText3: TppDBText;
    txtTexto: TppMemo;
    cdsConsultarCLI_SITUACAO: TIntegerField;
    txtDia: TppLabel;
    BitBtn1: TBitBtn;
    procedure BtSairClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Function GetMes(Nome : String) : String;
    Function AddCliente(iCodigo, iDia : Integer; aNome, aCPF, aFone,
           aEndereco, aCidade, aBairro : String; aData : TDatetime) : Boolean;
    Function Consulta(aMes : String) : Boolean;
    Function ImprimirCliente(aCliente, aDispositivo : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmRelAniveriantes: TfrmRelAniveriantes;

implementation

uses uFuncoes, udmDados, uFrmMain, uFrmCadCartas;

{$R *.dfm}

procedure TfrmRelAniveriantes.BtSairClick(Sender: TObject);
begin
     Close;
end;

function TfrmRelAniveriantes.GetMes(Nome: String): String;
begin
     If (Nome = 'JANEIRO') Then
         Result := '01';
     If (Nome = 'FEVEREIRO') Then
         Result := '02';
     If (Nome = 'MARÇO') Then
         Result := '03';
     If (Nome = 'ABRIL') Then
         Result := '04';
     If (Nome = 'MAIO') Then
         Result := '05';
     If (Nome = 'JUNHO') Then
         Result := '06';
     If (Nome = 'JULHO') Then
         Result := '07';
     If (Nome = 'AGOSTO') Then
         Result := '08';
     If (Nome = 'SETEMBRO') Then
         Result := '09';
     If (Nome = 'OUTUBRO') Then
         Result := '10';
     If (Nome = 'NOVEMBRO') Then
         Result := '11';
     If (Nome = 'DEZEMBRO') Then
         Result := '12';
end;

procedure TfrmRelAniveriantes.btnConsultarClick(Sender: TObject);
Var
    M_NUMMES : String;
begin
     If uFuncoes.Empty(cmbMeses.text) Then
     Begin
           Application.MessageBox('Selecione o mês!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbMeses.SetFocus;
           Exit;
     End;
     //
     M_NUMMES := GetMes(cmbMeses.Text);
     //
     if not (cdsDados.Active) Then
         cdsDados.Open;
     //
     cdsDados.EmptyDataSet;
     //
     If not (Consulta(M_NUMMES)) Then
      begin
            Application.MessageBox('Não há anivesariantes no mês indicado!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             cmbMeses.SetFocus;
             Exit;
      End;
end;

function TfrmRelAniveriantes.AddCliente(iCodigo, iDia: Integer; aNome,
  aCPF, aFone, aEndereco, aCidade, aBairro: String;
  aData: TDatetime): Boolean;
begin
     If not (cdsDados.Active) then
       cdsDados.Open;
     //  
     With cdsDados do
      begin
           Append;
           FieldByName('CODIGO').AsInteger := iCodigo;
           FieldByName('NOME').AsString    := aNome;
           FieldByName('CPF').AsString     := aCPF;
           FieldByName('DATA_NASC').AsDateTime := aData;
           FieldByName('DIA').AsInteger    := iDia;
           FieldByName('TELEFONE').AsString := aFone;
           FieldByName('ENDERECO').AsString := aEndereco;
           FieldByName('CIDADE').AsString   := aCidade;
           FieldByName('BAIRRO').AsString   := aBairro;
           //
           Post;
      End;
end;

function TfrmRelAniveriantes.Consulta(aMes : String): Boolean;
Var
   M_NUMDIA : integer;
   M_NRFONE : String;
begin
     Result := False;
     //
     //uFuncoes.RefreshCDS(cdsConsultar);
     With cdsConsultar do
      begin
           Close;
           Params.ParamByName('pSITUACAO').AsInteger := 1;
           Open;
      End;
     //
     If not (cdsConsultar.IsEmpty) Then
      begin
           With cdsConsultar do
           begin
                First;
                While not (Eof) do
                  begin
                     If (Copy(FieldByName('CLI_DTANIVERSARIO').AsString,4,2) = aMes) Then
                      begin
                         M_NUMDIA := StrtoInt(Copy(FieldByName('CLI_DTANIVERSARIO').AsString,1,2));
                         M_NRFONE := '('+
                               Copy(FieldByName('CLI_FONE1').AsString,1,2)+')'+
                               Copy(FieldByName('CLI_FONE1').AsString,3,4)+'-'+
                               Copy(FieldByName('CLI_FONE1').AsString,7,4);
                         //
                         AddCliente(FieldByName('CLI_CODIGO').AsInteger, M_NUMDIA,
                                  FieldByName('CLI_NOME').AsString,
                                  FieldByName('CLI_CPF').AsString,
                                  M_NRFONE,
                                  FieldByName('CLI_LOGRADOURO').AsString+', '+FieldByName('CLI_NUMERO').AsString,
                                  FieldByName('CLI_CDCIDADE').ASString,
                                  FieldByName('CLI_CDBAIRRO').ASString,
                                  FieldByName('CLI_DTANIVERSARIO').AsDatetime);
                      End;
                      // Próximo
                      Next;
                  End;
           End;
           //
           Result := True;
      End;
end;

function TfrmRelAniveriantes.ImprimirCliente(aCliente,
  aDispositivo: String): Boolean;
begin
     if not (cdsDados.IsEmpty) Then
      begin
           uFuncoes.FilterCDS(dmDados.cdsCliente, fsInteger, aCliente);
           //
           If (dmDados.cdsCliente.IsEmpty) Then
              ShowMessage('Cliente não encontrado!!!');
           //
           uFuncoes.FilterCDS(dmDados.cdsCarta, fsInteger, '1');
           With ppReport1 do
            begin
                 If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                       ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                 txtTitulo.Caption := dmDados.cdsCartaCAR_TITULO.AsString;
                 txtDia.Caption    := 'DIA '+ cdsDadosDIA.AsString;
                 txtTexto.Lines.Clear;
                 txtTexto.Lines.Add(dmDados.cdsCartaCAR_TEXTO.AsString);
                 txtRodape.Caption := 'Teresina, '+ uFuncoes.DataExtenso(Date);
                 //
                 if (aDispositivo = 'T') Then
                     DeviceType := 'Screen'
                 Else
                     DeviceType := 'Printer';
                 PrintReport;
            End;
      End;
end;

procedure TfrmRelAniveriantes.btnVisualizarClick(Sender: TObject);
begin
     if not (cdsDados.IsEmpty) Then
        ImprimirCliente(cdsDadosCODIGO.AsString, 'T');
end;

procedure TfrmRelAniveriantes.BtImprimirClick(Sender: TObject);
begin
  if not (cdsDados.IsEmpty) Then
  begin
    If Application.MessageBox('Confirma a impressão de todos os clientes?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
      begin
         if not (cdsDados.IsEmpty) Then
          begin
               With cdsDados do
                begin
                     DisableControls;
                     First;
                     While not (Eof) do
                      begin
                           ImprimirCliente(cdsDadosCODIGO.AsString, 'I');
                           //
                           Next;
                      End;
                      //
                      EnableControls;
                End;
          End;
     End;
  End;   
end;

procedure TfrmRelAniveriantes.BitBtn1Click(Sender: TObject);
begin
     frmMain.AbreForm(TfrmCadCartas, frmCadCartas);
end;

end.
