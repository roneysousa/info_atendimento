unit uFrmRelCartaInativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,
  DBClient, Provider, Grids, DBGrids, ppBands, ppCache, ppClass, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppCtrls, ppPrnabl,
  ppStrtch, ppMemo;

type
  TfrmCartaInativo = class(TfrmRelPadrao)
    Panel3: TPanel;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    grdConsultar: TDBGrid;
    cdsConsultaCLI_CODIGO: TIntegerField;
    cdsConsultaCLI_NOME: TStringField;
    cdsConsultaCLI_CPF: TStringField;
    cdsConsultaCLI_SITUACAO: TIntegerField;
    bntConsulta: TBitBtn;
    btnVisualizar: TBitBtn;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    txtRodape: TppLabel;
    ppLine1: TppLine;
    ppImgLogo: TppImage;
    txtTitulo: TppLabel;
    ppLine2: TppLine;
    txtTexto: TppMemo;
    ppDBText3: TppDBText;
    btnCarta: TBitBtn;
    procedure BtImprimirClick(Sender: TObject);
    procedure bntConsultaClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnCartaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Consulta(iSituacao : Integer);
    Function ImprimirCliente(aCliente, aDispositivo : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCartaInativo: TfrmCartaInativo;

implementation

uses udmDados, uFuncoes, uFrmMain, uFrmCadCartas;

{$R *.dfm}

procedure TfrmCartaInativo.BtImprimirClick(Sender: TObject);
begin
  inherited;
 if not (cdsConsulta.IsEmpty) Then
  begin
    If Application.MessageBox('Confirma a impressão de todos os clientes?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
      begin
         if not (cdsConsulta.IsEmpty) Then
          begin
               {With cdsConsulta do
                begin
                     DisableControls;
                     First;
                     While not (Eof) do
                      begin}
                           ImprimirCliente(cdsConsultaCLI_CODIGO.AsString, 'I');
                           //
                           {Next;
                      End;
                      //
                      EnableControls;
                End;}
          End;
     End;
  End;   
end;

procedure TfrmCartaInativo.Consulta(iSituacao: Integer);
begin
     With cdsConsulta do
      begin
           DisableControls;
           Close;
           Params.ParamByName('pSITUACAO').AsInteger := iSituacao;
           Open;
           EnableControls;
      End;
end;

procedure TfrmCartaInativo.bntConsultaClick(Sender: TObject);
begin
  inherited;
       Consulta(2);
end;

function TfrmCartaInativo.ImprimirCliente(aCliente,
  aDispositivo: String): Boolean;
begin
     if not (cdsConsulta.IsEmpty) Then
      begin
           uFuncoes.FilterCDS(dmDados.cdsCliente, fsInteger, aCliente);
           //
           If (dmDados.cdsCliente.IsEmpty) Then
              ShowMessage('Cliente não encontrado!!!');
           //
           uFuncoes.FilterCDS(dmDados.cdsCarta, fsInteger, '3');
           With ppReport1 do
            begin
                 If FileExists(ExtractFilePath(Application.ExeName)+'logo.bmp') Then
                       ppImgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logo.bmp');
                 txtTitulo.Caption := dmDados.cdsCartaCAR_TITULO.AsString;
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


procedure TfrmCartaInativo.btnVisualizarClick(Sender: TObject);
begin
  inherited;
     if not (cdsConsulta.IsEmpty) Then
        ImprimirCliente(cdsConsultaCLI_CODIGO.AsString, 'T');
end;

procedure TfrmCartaInativo.btnCartaClick(Sender: TObject);
begin
  inherited;
     frmMain.AbreForm(TfrmCadCartas, frmCadCartas);
end;

End.
