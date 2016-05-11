unit uFrmLocalizaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocalizar, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLocProdutos = class(TfrmConsultas)
    cdsConsultarPRO_CODIGO: TStringField;
    cdsConsultarPRO_DESCRICAO: TStringField;
    procedure edtConsultarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocProdutos: TfrmLocProdutos;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmLocProdutos.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            CommandText := CommandText + ' Where (UPPER(PRO_DESCRICAO) like :pNOME)';
            CommandText := CommandText + 'order by PRO_DESCRICAO ';
            datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1, 59) + '%';
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
    End
    Else
         cdsConsultar.Close;
  inherited;
end;

end.
