unit uFrmRelClientesInterropido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, ImgList, ppDB, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppStrtch,
  ppMemo;

type
  TfrmRelClientesInterrompido = class(TForm)
    Panel3: TPanel;
    bntConsulta: TBitBtn;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    btnVisualizar: TBitBtn;
    btnCarta: TBitBtn;
    grdConsultar: TDBGrid;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    cdsConsultaCLI_CODIGO: TIntegerField;
    cdsConsultaCLI_NOME: TStringField;
    cdsConsultaCLI_CPF: TStringField;
    cdsConsultaCLI_SITUACAO: TIntegerField;
    dsConsulta: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosCDS_CODIGO: TIntegerField;
    cdsDadosCDS_NOME: TStringField;
    cdsDadosCDS_CPF: TStringField;
    cdsDadosCDS_SITUACAO: TStringField;
    cdsDadosCDS_FLIMPR: TBooleanField;
    ImageList1: TImageList;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImgLogo: TppImage;
    txtTitulo: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    txtRodape: TppLabel;
    ppLine1: TppLine;
    txtTexto: TppMemo;
    procedure BtSairClick(Sender: TObject);
    procedure btnCartaClick(Sender: TObject);
    procedure bntConsultaClick(Sender: TObject);
    procedure grdConsultarCellClick(Column: TColumn);
    procedure grdConsultarColEnter(Sender: TObject);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdConsultarEnter(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Consulta(iSituacao : Integer);
    function AddCliente() : Boolean;
    Function ImprimirCliente(aCliente, aDispositivo : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmRelClientesInterrompido: TfrmRelClientesInterrompido;

implementation

uses uFrmMain, uFrmCadCartas, udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmRelClientesInterrompido.BtSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelClientesInterrompido.btnCartaClick(Sender: TObject);
begin
     frmMain.AbreForm(TfrmCadCartas, frmCadCartas);
end;

procedure TfrmRelClientesInterrompido.Consulta(iSituacao: Integer);
begin
     With cdsConsulta do
      begin
           DisableControls;
           Close;
           Params.ParamByName('pSITUACAO').AsInteger := iSituacao;
           Open;
           EnableControls;
           //
           AddCliente();
      End;
end;

function TfrmRelClientesInterrompido.AddCliente: Boolean;
begin
    If not (cdsConsulta.IsEmpty) Then
      begin
           cdsDados.Close;
           cdsDados.Open;
           cdsDados.EmptyDataSet;
           //
           With cdsConsulta do
            begin
                 First;
                 While not (Eof) do
                  begin
                       cdsDados.Append;
                       cdsDadosCDS_CODIGO.AsInteger := FieldBYname('CLI_CODIGO').AsInteger;
                       cdsDadosCDS_NOME.AsString    := FieldBYname('CLI_NOME').AsString;
                       cdsDadosCDS_CPF.AsString     := FieldBYname('CLI_CPF').AsString;
                       cdsDadosCDS_SITUACAO.AsInteger := FieldBYname('CLI_SITUACAO').AsInteger;
                       cdsDadosCDS_FLIMPR.AsBoolean := False;
                       cdsDados.Post;
                       //
                       Next;
                  End;
            End;
      End;
end;

procedure TfrmRelClientesInterrompido.bntConsultaClick(Sender: TObject);
begin
      Consulta(1);
end;

procedure TfrmRelClientesInterrompido.grdConsultarCellClick(
  Column: TColumn);
begin
  if Column.Field = cdsDadosCDS_FLIMPR then
  begin
    cdsDados.Edit;
    cdsDadosCDS_FLIMPR.asBoolean := not cdsDadosCDS_FLIMPR.AsBoolean;
  end;

end;

procedure TfrmRelClientesInterrompido.grdConsultarColEnter(
  Sender: TObject);
begin
  if grdConsultar.SelectedField = cdsDadosCDS_FLIMPR then
    grdConsultar.Options := grdConsultar.Options - [dgEditing]
  else
    grdConsultar.Options := grdConsultar.Options + [dgEditing];
end;

procedure TfrmRelClientesInterrompido.grdConsultarDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
    //
    grdConsultar.DefaultDrawDataCell(Rect, grdConsultar.columns[datacol].field, State);
   {pinta checkbox}
   if Column.Field = cdsDadosCDS_FLIMPR then
   begin
        grdConsultar.Canvas.FillRect(Rect);
         ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
        if cdsDadosCDS_FLIMPR.AsBoolean then
             ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
        else
             ImageList1.Draw(grdConsultar.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;
end;

procedure TfrmRelClientesInterrompido.grdConsultarEnter(Sender: TObject);
begin
     grdConsultar.SelectedIndex := 3;
end;

function TfrmRelClientesInterrompido.ImprimirCliente(aCliente,
  aDispositivo: String): Boolean;
begin
     if not (cdsConsulta.IsEmpty) Then
      begin
           uFuncoes.FilterCDS(dmDados.cdsCliente, fsInteger, aCliente);
           //
           If (dmDados.cdsCliente.IsEmpty) Then
              ShowMessage('Cliente não encontrado!!!');
           //
           uFuncoes.FilterCDS(dmDados.cdsCarta, fsInteger, '2');
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

procedure TfrmRelClientesInterrompido.btnVisualizarClick(Sender: TObject);
begin
     if not (cdsDados.IsEmpty) Then
        ImprimirCliente(cdsDadosCDS_CODIGO.AsString, 'T');
end;

procedure TfrmRelClientesInterrompido.BtImprimirClick(Sender: TObject);
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
                           if (cdsDadosCDS_FLIMPR.AsBoolean) Then
                               ImprimirCliente(cdsDadosCDS_CODIGO.AsString, 'I');
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

end.
