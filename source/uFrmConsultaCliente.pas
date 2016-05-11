unit uFrmConsultaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, FMTBcd,
  DB, SqlExpr, DBCtrls, DBClient, Provider;

type
  TfrmConsultaCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtSair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    dbeCDCLIE: TEdit;
    spLocCliente: TSpeedButton;
    edtNMCLIE: TEdit;
    btnConsulta: TBitBtn;
    pnlGridAtendimento: TPanel;
    grdConsultar: TDBGrid;
    pnlDiagnostico: TPanel;
    dstAtendimentos: TSQLDataSet;
    dspAtendimento: TDataSetProvider;
    cdsAtendimento: TClientDataSet;
    dsAtendimento: TDataSource;
    cdsAtendimentoAGE_ID: TIntegerField;
    cdsAtendimentoAGE_CDLOJA: TIntegerField;
    cdsAtendimentoAGE_DTMOVI: TDateField;
    cdsAtendimentoAGE_HOMOVI: TStringField;
    cdsAtendimentoAGE_CLIENTE: TIntegerField;
    cdsAtendimentoAGE_DTATENDIMENTO: TDateField;
    cdsAtendimentoAGE_HOATENDIMENTO: TStringField;
    cdsAtendimentoAGE_SITUACAO: TStringField;
    cdsAtendimentoAGE_FUNCIONARIO: TIntegerField;
    cdsAtendimentoAGE_DESCRICAO: TMemoField;
    cdsAtendimentoAGE_DIAGNOSTICO: TMemoField;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBMemo2: TDBMemo;
    cdsAtendimentoCLI_NOME: TStringField;
    cdsAtendimentoFUN_NOME: TStringField;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    pnlGridVendas: TPanel;
    Panel5: TPanel;
    sbProximo2: TSpeedButton;
    sbUltimo2: TSpeedButton;
    sbAnterior2: TSpeedButton;
    sbPrimeiro2: TSpeedButton;
    DBGrid1: TDBGrid;
    pnlGridItensVenda: TPanel;
    DBNavigator1: TDBNavigator;
    Panel6: TPanel;
    dbGridItensVendas: TDBGrid;
    dstVendas: TSQLDataSet;
    dspVendas: TDataSetProvider;
    cdsVendas: TClientDataSet;
    dsVendas: TDataSource;
    cdsVendasMOV_PEDIDO: TIntegerField;
    cdsVendasMOV_LOJA: TIntegerField;
    cdsVendasMOV_DATAVENDA: TDateField;
    cdsVendasMOV_CLIENTE: TIntegerField;
    cdsVendasCLI_NOME: TStringField;
    cdsVendasMOV_VALOR: TFMTBCDField;
    cdsVendasMOV_SITUACAO: TStringField;
    dstItensVenda: TSQLDataSet;
    dspItensVenda: TDataSetProvider;
    cdsItensVenda: TClientDataSet;
    dsItensVenda: TDataSource;
    cdsItensVendaMOP_PEDIDO: TIntegerField;
    cdsItensVendaMOP_NRITEM: TIntegerField;
    cdsItensVendaMOP_PRODUTO: TStringField;
    cdsItensVendaPRO_DESCRICAO: TStringField;
    cdsItensVendaMOP_QUANTIDADE: TFMTBCDField;
    cdsItensVendaMOP_UNIDADE: TStringField;
    cdsItensVendaMOP_VALOR: TFMTBCDField;
    cdsItensVendaSUB_TOTAL: TFloatField;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClienteClick(Sender: TObject);
    procedure dbeCDCLIEExit(Sender: TObject);
    procedure dbeCDCLIEChange(Sender: TObject);
    procedure dsAtendimentoDataChange(Sender: TObject; Field: TField);
    procedure btnConsultaClick(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure dsVendasDataChange(Sender: TObject; Field: TField);
    procedure sbPrimeiro2Click(Sender: TObject);
    procedure sbAnterior2Click(Sender: TObject);
    procedure sbProximo2Click(Sender: TObject);
    procedure sbUltimo2Click(Sender: TObject);
    procedure cdsItensVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    Function ConsultaCliente(iCliente : Integer) : Boolean;
    Function VendaIten(iVenda : Integer) : Boolean;
    Procedure FecharDados();
  public
    { Public declarations }
  end;

var
  frmConsultaCliente: TfrmConsultaCliente;

implementation

uses uFuncoes, uFrmLocClientes, udmDados;

{$R *.dfm}

procedure TfrmConsultaCliente.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsultaCliente.FormShow(Sender: TObject);
begin
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmConsultaCliente.dbeCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
      //
     If (key = #13) and uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
           spLocClienteClick(Self);
      End;
     //
     If (key = #13) and not uFuncoes.Empty(dbeCDCLIE.Text) Then
      begin
           key := #0;
      End;
end;

procedure TfrmConsultaCliente.spLocClienteClick(Sender: TObject);
begin
      dbeCDCLIE.SetFocus;
      Application.CreateForm(TfrmConsClientes, frmConsClientes);
      try
          frmConsClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                dbeCDCLIE.Text :=
                    uFuncoes.StrZero(frmConsClientes.cdsConsultarCLI_CODIGO.AsString,7);
                btnConsulta.SetFocus;
           End;
          //
          frmConsClientes.Free;
      End;
end;

procedure TfrmConsultaCliente.dbeCDCLIEExit(Sender: TObject);
begin
   If not uFuncoes.Empty(dbeCDCLIE.Text) Then
      If not (dmDados.ProcurarValor(dbeCDCLIE.Text, 'CLI_CODIGO', 'CLIENTES')) Then
        begin
             Application.MessageBox(Pchar('C�digo do cliente n�o cadastrado.'), 'Aten��o',
                   MB_OK+MB_ICONWARNING);
             edtNMCLIE.Clear;
             dbeCDCLIE.Clear;
             dbeCDCLIE.SetFocus;
             Exit;
        End
        Else
         begin
             dbeCDCLIE.Text := uFuncoes.StrZero(dbeCDCLIE.Text,7);
             edtNMCLIE.Text := dmDados.GetNomeCliente(StrtoInt(dbeCDCLIE.Text));
         End;
end;

procedure TfrmConsultaCliente.dbeCDCLIEChange(Sender: TObject);
begin
   If uFuncoes.Empty(dbeCDCLIE.Text) Then
   begin
        edtNMCLIE.Clear;
        FecharDados;
   End;
end;

procedure TfrmConsultaCliente.dsAtendimentoDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmConsultaCliente.btnConsultaClick(Sender: TObject);
var
   M_CDCLIE : Integer;
begin
      iF not uFuncoes.Empty(dbeCDCLIE.Text) Then
       begin
            M_CDCLIE := StrtoInt(dbeCDCLIE.Text);
            ConsultaCliente(M_CDCLIE);
       End
       Else
           dbeCDCLIE.SetFocus;
end;

function TfrmConsultaCliente.ConsultaCliente(iCliente: Integer): Boolean;
begin
     Result := False;
     With cdsAtendimento do
      begin
           DisableControls;
           Close;
           Params.ParamByName('pLOJA').AsInteger    := 1;
           Params.ParamByName('pCLIENTE').AsInteger := iCliente;
           Params.ParamByName('pSITUACAO').AsString := 'F';
           open;
           EnableControls;
           //
           if not (IsEmpty) Then
               Result := True;
           //
      End;
      //
      With cdsVendas do
        begin
             DisableControls;
             Close;
             Params.ParamByName('pCLIENTE').AsInteger := iCLiente;
             Open;
             EnableControls;
        End;
end;

procedure TfrmConsultaCliente.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsAtendimento.Active ) Then
        dsAtendimento.DataSet.First;
end;

procedure TfrmConsultaCliente.sbAnteriorClick(Sender: TObject);
begin
     If (cdsAtendimento.Active ) Then
         dsAtendimento.DataSet.Prior;
end;

procedure TfrmConsultaCliente.sbProximoClick(Sender: TObject);
begin
     If (cdsAtendimento.Active ) Then
         dsAtendimento.DataSet.Next;
end;

procedure TfrmConsultaCliente.sbUltimoClick(Sender: TObject);
begin
     If (cdsAtendimento.Active ) Then
         dsAtendimento.DataSet.Last;
end;

procedure TfrmConsultaCliente.dsVendasDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro2.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior2.Enabled := sbPrimeiro2.Enabled;
  sbUltimo2.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo2.Enabled := sbUltimo2.Enabled;
  //
  If not (cdsVendas.IsEmpty) Then
     VendaIten(cdsVendasMOV_PEDIDO.AsInteger);
end;

procedure TfrmConsultaCliente.sbPrimeiro2Click(Sender: TObject);
begin
     If (cdsVendas.Active ) Then
        dsVendas.DataSet.First;
end;

procedure TfrmConsultaCliente.sbAnterior2Click(Sender: TObject);
begin
     If (cdsVendas.Active ) Then
        dsVendas.DataSet.Prior;
end;

procedure TfrmConsultaCliente.sbProximo2Click(Sender: TObject);
begin
     If (cdsVendas.Active ) Then
        dsVendas.DataSet.Next;
end;

procedure TfrmConsultaCliente.sbUltimo2Click(Sender: TObject);
begin
     If (cdsVendas.Active ) Then
        dsVendas.DataSet.Last;
end;

function TfrmConsultaCliente.VendaIten(iVenda: Integer): Boolean;
begin
     With cdsItensVenda do
      begin
           DisableControls;
           close;
           Params[0].AsInteger := iVenda;
           Open;
           EnableControls;
      End;
end;

procedure TfrmConsultaCliente.cdsItensVendaCalcFields(DataSet: TDataSet);
begin
    if (cdsItensVendaMOP_QUANTIDADE.AsFloat > 0 )
     and (cdsItensVendaMOP_VALOR.AsFloat > 0) Then
       cdsItensVendaSUB_TOTAL.AsFloat :=
          cdsItensVendaMOP_VALOR.AsFloat * cdsItensVendaMOP_QUANTIDADE.AsFloat;
end;

procedure TfrmConsultaCliente.FecharDados;
begin
     cdsItensVenda.Close;
     cdsVendas.Close;
     cdsAtendimento.Close;
end;

end.
