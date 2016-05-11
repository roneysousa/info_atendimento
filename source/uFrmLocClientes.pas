unit uFrmLocClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocalizar, FMTBcd, DB, DBClient, Provider, SqlExpr, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmConsClientes = class(TfrmConsultas)
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    procedure edtConsultarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsClientes: TfrmConsClientes;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmConsClientes.edtConsultarChange(Sender: TObject);
Var
  aTexto : String;
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        aTexto := 'select CL.CLI_CODIGO, CL.CLI_NOME from CLIENTES CL ';
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := aTexto;
            CommandText := CommandText + ' Where (UPPER(CL.CLI_NOME) like :pNOME)';
            CommandText := CommandText + 'order by CL.CLI_NOME ';
            datasetConsultar.Params.ParamByName('pNOME').AsString   := Copy(edtConsultar.Text,1,59) + '%';
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
