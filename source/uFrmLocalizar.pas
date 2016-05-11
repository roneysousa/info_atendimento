unit uFrmLocalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, DB,
  DBClient, Provider, SqlExpr;

type
  TfrmConsultas = class(TForm)
    Panel1: TPanel;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    edtConsultar: TEdit;
    bntConfirma: TBitBtn;
    datasetConsultar: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    dsConsulta: TDataSource;
    procedure edtConsultarChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdConsultarDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses uDMDados, uFuncoes;

{$R *.dfm}

procedure TfrmConsultas.edtConsultarChange(Sender: TObject);
begin
  If uFuncoes.Empty(edtConsultar.Text) Then
      cdsConsultar.Close;
  //
  bntConfirma.Enabled := (edtConsultar.Text <> '');

{     If not (cdsConsultar.IsEmpty) Then
        //bntConfirma.Enabled := dsConsulta.DataSet.IsEmpty;
        bntConfirma.Enabled := not (cdsConsultar.IsEmpty);}
end;

procedure TfrmConsultas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = vk_escape then
        Close;
end;

procedure TfrmConsultas.edtConsultarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (cdsConsultar.Active = True) Then
   Begin
     IF (KEY = VK_UP) then
          cdsConsultar.Prior;
     //
     IF (KEY = VK_DOWN) then
          cdsConsultar.Next;
   End;
end;

procedure TfrmConsultas.grdConsultarDblClick(Sender: TObject);
begin
      If not (cdsConsultar.IsEmpty) Then
         ModalResult := mrOk;
end;

end.
