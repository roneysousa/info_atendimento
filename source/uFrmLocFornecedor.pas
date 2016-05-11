unit uFrmLocFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocalizar, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmConsFornecedor = class(TfrmConsultas)
    cdsConsultarFOR_CODIGO: TIntegerField;
    cdsConsultarFOR_RAZAO: TStringField;
    cdsConsultarFOR_FANTASIA: TStringField;
    procedure edtConsultarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsFornecedor: TfrmConsFornecedor;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmConsFornecedor.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select FOR_CODIGO, FOR_RAZAO, FOR_FANTASIA from FORNECEDORES ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            CommandText := CommandText + ' Where (UPPER(FOR_RAZAO) like :pNOME)';
            CommandText := CommandText + 'order by FOR_RAZAO ';
            datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1, 49) + '%';
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
