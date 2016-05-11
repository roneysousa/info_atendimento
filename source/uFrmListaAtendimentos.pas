unit uFrmListaAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, ComCtrls, Buttons, Grids,
  DBGrids, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TfrmListaAtendimentos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtDtInicial: TDateEdit;
    StatusBar1: TStatusBar;
    grdConsultar: TDBGrid;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    dstConsultar: TSQLDataSet;
    cdsConsultar: TClientDataSet;
    dspConsultar: TDataSetProvider;
    dsConsultar: TDataSource;
    cdsConsultarAGE_ID: TIntegerField;
    cdsConsultarAGE_DTMOVI: TDateField;
    cdsConsultarAGE_HOMOVI: TStringField;
    cdsConsultarAGE_CLIENTE: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    cdsConsultarAGE_DTATENDIMENTO: TDateField;
    cdsConsultarAGE_HOATENDIMENTO: TStringField;
    cdsConsultarAGE_SITUACAO: TStringField;
    cdsConsultarAGE_FUNCIONARIO: TIntegerField;
    cdsConsultarFUN_NOME: TStringField;
    edtDtFinal: TDateEdit;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    btnConsultar: TBitBtn;
    btnBaixaAtendimento: TBitBtn;
    btnCancelar: TBitBtn;
    btnRemarcar: TBitBtn;
    btnFechar: TBitBtn;
    procedure edtDtInicialExit(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure edtDtFinalExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnBaixaAtendimentoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRemarcarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    Function Consulta(aSituacao : String; aDtInicial, aDtFinal : TDate) : Boolean;
  public
    { Public declarations }
  end;

var
  frmListaAtendimentos: TfrmListaAtendimentos;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmListaAtendimentos.edtDtInicialExit(Sender: TObject);
begin
     If (edtDtInicial.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(edtDtInicial.Text);
              edtDtInicial.Date := StrToDate(edtDtInicial.Text);
           except
           on EConvertError do
             begin
                ShowMessage('Data Inválida!');
                edtDtInicial.Clear;
                edtDtInicial.SetFocus;
             End;
           end;
       End;
end;

procedure TfrmListaAtendimentos.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
  //
  If not (dsConsultar.DataSet.IsEmpty) Then
   begin
        btnBaixaAtendimento.Enabled := (dsConsultar.DataSet.FieldByName('AGE_SITUACAO').AsString = 'A');
        btnCancelar.Enabled := (dsConsultar.DataSet.FieldByName('AGE_SITUACAO').AsString = 'A');
        btnRemarcar.Enabled := (dsConsultar.DataSet.FieldByName('AGE_SITUACAO').AsString = 'A');
   End
   Else
   begin
        btnBaixaAtendimento.Enabled := False;
        btnCancelar.Enabled := False;
        btnRemarcar.Enabled := False;
   End;
end;

procedure TfrmListaAtendimentos.edtDtFinalExit(Sender: TObject);
begin
     If (edtDtFinal.Text <> '  /  /    ') Then
       begin
           try
              StrToDate(edtDtFinal.Text);
              edtDtFinal.Date := StrToDate(edtDtFinal.Text);
              //
              If (edtDtFinal.Date < edtDtInicial.Date ) Then
                begin
                     Application.MessageBox('Período final deve ser maior ou igual ao inicial.','ATENÇÃO',
                          MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDtFinal.SetFocus;
                     edtDtFinal.Date := edtDtInicial.Date;
                     Exit;
                End;
           except
           on EConvertError do
             begin
                ShowMessage('Data Inválida!');
                edtDtFinal.Clear;
                edtDtFinal.SetFocus;
             End;
           end;
       End;
end;

procedure TfrmListaAtendimentos.FormShow(Sender: TObject);
begin
     edtDtInicial.Date := Date();
     edtDtFinal.Date   := edtDtInicial.Date;
end;

function TfrmListaAtendimentos.Consulta(aSituacao: String; aDtInicial,
  aDtFinal: TDate): Boolean;
Var
    aTexto : String;
begin
     result := False;
     aTexto := 'select A.AGE_ID, A.AGE_DTMOVI, A.AGE_HOMOVI, A.AGE_CLIENTE, CL.CLI_NOME, ';
     aTexto := aTexto + ' A.AGE_DTATENDIMENTO, A.AGE_HOATENDIMENTO, A.AGE_SITUACAO, ';
     aTexto := aTexto + ' A.AGE_FUNCIONARIO, F.FUN_NOME from AGENDA A ';
     aTexto := aTexto + ' INNER JOIN CLIENTES CL ON CL.CLI_CODIGO = A.AGE_CLIENTE ';
     aTexto := aTexto + ' INNER JOIN FUNCIONARIOS F ON F.FUN_CODIGO = A.AGE_FUNCIONARIO ';
     aTexto := aTexto + ' Where (A.AGE_DTATENDIMENTO >= :pDTINICIAL) and (A.AGE_DTATENDIMENTO <= :pDTFINAL) ';
     If (aSituacao <> 'T') Then
        aTexto := aTexto +  ' AND (A.AGE_SITUACAO = '+QuotedStr(aSituacao)+') ';
     aTexto := aTexto + ' order by A.AGE_DTATENDIMENTO, A.AGE_HOATENDIMENTO';
     //
     With cdsConsultar do
      begin
           DisableControls;
           Close;
           CommandText := aTexto;
           Params.ParamByName('pDTINICIAL').AsDate := aDtInicial;
           Params.ParamByName('pDTFINAL').AsDate   := aDtFinal;
           Open;
           EnableControls;
      End;
      //
     result := True;
end;

procedure TfrmListaAtendimentos.btnConsultarClick(Sender: TObject);
Var
   M_FLSITU : String;
begin
     If (edtDtInicial.Text <> '  /  /    ') and (edtDtFinal.Text <> '  /  /    ') Then
      begin
           Case RadioGroup1.ItemIndex of
              0 : M_FLSITU := 'A';
              1 : M_FLSITU := 'F';
              2 : M_FLSITU := 'C';
              3 : M_FLSITU := 'R';
              4 : M_FLSITU := 'T';
           End;  // fim-caso
           If not (Consulta(M_FLSITU, edtDtInicial.Date, edtDtFinal.Date)) Then
             Begin
                  Application.MessageBox('Não movimento no período indicado.','ATENÇÃO',
                         MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                  //
                  cdsConsultar.close;
             End;
      End;
end;

procedure TfrmListaAtendimentos.btnBaixaAtendimentoClick(Sender: TObject);
begin
     If Application.MessageBox('Confirma Conclusão de Atendimento?',
        'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
            If not (dmDados.AlterarStatusAtendimento(cdsConsultarAGE_ID.AsInteger, 'F')) Then
               Application.MessageBox(PChar(MSG_ERROR),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            //
            btnConsultarClick(Sender);
       End;
end;

procedure TfrmListaAtendimentos.btnCancelarClick(Sender: TObject);
begin
     If Application.MessageBox('Confirma Cancelamento de Atendimento?',
        'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
            If not (dmDados.AlterarStatusAtendimento(cdsConsultarAGE_ID.AsInteger, 'C')) Then
               Application.MessageBox(PChar(MSG_ERROR),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            //
            btnConsultarClick(Sender);
       End;
end;

procedure TfrmListaAtendimentos.btnRemarcarClick(Sender: TObject);
begin
     If Application.MessageBox('Remarcar Atendimento?',
        'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
            If not (dmDados.AlterarStatusAtendimento(cdsConsultarAGE_ID.AsInteger, 'R')) Then
               Application.MessageBox(PChar(MSG_ERROR),
                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            //
            btnConsultarClick(Sender);
       End;
end;

procedure TfrmListaAtendimentos.btnFecharClick(Sender: TObject);
begin
     Close;
end;

end.
