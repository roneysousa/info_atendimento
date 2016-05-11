unit uFrmConsEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr;

type
  TfrmConsEstoque = class(TForm)
    pnlInferior: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    Panel3: TPanel;
    GridEstoque: TDBGrid;
    Panel1: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarEST_CDLOJA: TIntegerField;
    cdsConsultarEST_CDPROD: TStringField;
    cdsConsultarPRO_DESCRICAO: TStringField;
    cdsConsultarEST_QUANTIDADE: TFMTBCDField;
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure Consulta(aCampo : String);
  public
    { Public declarations }
  end;

var
  frmConsEstoque: TfrmConsEstoque;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmConsEstoque.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.First;
end;

procedure TfrmConsEstoque.sbAnteriorClick(Sender: TObject);
begin
    If (cdsConsultar.Active) then
        dsConsultar.DataSet.Prior;
end;

procedure TfrmConsEstoque.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Next;
end;

procedure TfrmConsEstoque.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) then
        dsConsultar.DataSet.Last;
end;

procedure TfrmConsEstoque.edtConsultarChange(Sender: TObject);
begin
     If not uFuncoes.Empty (edtConsultar.Text)
      and (cdsConsultar.Active) Then
     Begin
          case rgConsultar.ItemIndex of
              0: cdsConsultar.Locate('EST_CDPROD',uFuncoes.StrZero(edtConsultar.Text,13), [loPartialKey]);
              1: cdsConsultar.Locate('PRO_DESCRICAO',edtConsultar.Text, [loPartialKey]);
          end;
     End;
end;

procedure TfrmConsEstoque.Consulta(aCampo: String);
Var
   aTexto : String;
begin
     aTexto := 'Select E.EST_CDLOJA, E.EST_CDPROD, P.PRO_DESCRICAO, E.EST_QUANTIDADE ';
     aTexto := aTexto + ' from ESTOQUE E INNER join PRODUTOS P ON P.PRO_CODIGO = E.EST_CDPROD ';
     aTexto := aTexto + ' Where (E.EST_CDLOJA = :pCDLOJA) order by ' + aCampo ;
     //
     With cdsConsultar do
      begin
           DisableControls;
           Close;
           CommandText := aTexto;
           Params[0].AsInteger := 1;
           Open;
           EnableControls;
      End;
end;

procedure TfrmConsEstoque.FormShow(Sender: TObject);
begin
     Consulta('PRO_DESCRICAO');
end;

procedure TfrmConsEstoque.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
      If (cdsConsultar.Active) Then
          Consulta('EST_CDPROD');
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
      If (cdsConsultar.Active) Then
          Consulta('PRO_DESCRICAO');
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmConsEstoque.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

end.
