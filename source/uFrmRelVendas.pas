unit uFrmRelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmRelPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, ToolEdit, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TfrmRelVendas = class(TfrmRelPadrao)
    Panel3: TPanel;
    Panel4: TPanel;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    dbeData: TDateEdit;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaMOV_PEDIDO: TIntegerField;
    cdsConsultaMOV_LOJA: TIntegerField;
    cdsConsultaMOV_DATAVENDA: TDateField;
    cdsConsultaMOV_CLIENTE: TIntegerField;
    cdsConsultaCLI_NOME: TStringField;
    cdsConsultaMOV_VALOR: TFMTBCDField;
    cdsConsultaMOV_SITUACAO: TStringField;
    btnConsulta: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Consultar(aData : Tdatetime);
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

uses udmDados, udmFinanceiro, uFuncoes;

{$R *.dfm}

procedure TfrmRelVendas.FormShow(Sender: TObject);
begin
  inherited;
     dbeData.Date := date();
end;

procedure TfrmRelVendas.Consultar(aData: Tdatetime);
begin
    With cdsConsulta do
      begin
           DisableControls;
           Close;
           Params[0].AsDateTime := aData;
           Open;
           EnableControls;
      End;
end;

procedure TfrmRelVendas.btnConsultaClick(Sender: TObject);
begin
  inherited;
       If not uFuncoes.Empty(dbeData.Text) Then
           Consultar(dbeData.Date);
end;

procedure TfrmRelVendas.BtImprimirClick(Sender: TObject);
begin
  inherited;
     if not (cdsConsulta.IsEmpty) Then
        dmFinanceiro.ImprimirVenda(cdsConsultaMOV_PEDIDO.AsInteger);
end;

end.
