unit frmNewListaAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvPageList, JvNavigationPane, JvExControls, JvLookOut,
  JvOutlookBar, ComCtrls, BmsXPPageControl, Grids, DBGrids, ExtCtrls,
  FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls, Buttons;

type
  TfrmNewAgenda = class(TForm)
    JvNavigationPane1: TJvNavigationPane;
    JvNavPanelPage1: TJvNavPanelPage;
    StatusBar1: TStatusBar;
    MonthCalendar1: TMonthCalendar;
    Panel1: TPanel;
    dsConsultar: TDataSource;
    Panel2: TPanel;
    BmsXPPageControl1: TBmsXPPageControl;
    TabSheet1: TTabSheet;
    grdConsultar: TDBGrid;
    Panel3: TPanel;
    btnCancelar: TBitBtn;
    BtSair: TBitBtn;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    btnBaixaAtendimento: TBitBtn;
    procedure MonthCalendar1Click(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure btnBaixaAtendimentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    alterar : String;
  public
    { Public declarations }
  end;

var
  frmNewAgenda: TfrmNewAgenda;

implementation

uses udmDados, uFuncoes, uFrmMain;

{$R *.dfm}


procedure TfrmNewAgenda.MonthCalendar1Click(Sender: TObject);
begin
      dmDados.CarregarLista(MonthCalendar1.Date);
end;

procedure TfrmNewAgenda.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmNewAgenda.btnCancelarClick(Sender: TObject);
Var
   iUsuario : Integer;
begin
     If Application.MessageBox('Confirma Cancelamento de Atendimento?',
        'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
            iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
            If not (dmDados.AlterarStatusAtendimento(dmDados.cdsListaAtendimentoCODIGO.AsInteger, 'C')) Then
               Application.MessageBox(PChar(MSG_ERROR),
                  'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL)
            Else
               If not (dmDados.IncluirTarefaUsuario( iUsuario,
                    'Alterou Status para Cancelado : '+uFuncoes.StrZero(dmDados.cdsListaAtendimentoCODIGO.AsString,7)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usu�rio.');
            //
            MonthCalendar1Click(Sender);
       End;
end;

procedure TfrmNewAgenda.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
  //
  If not (dsConsultar.DataSet.IsEmpty) Then
   begin
        btnBaixaAtendimento.Enabled := (dsConsultar.DataSet.FieldByName('SITUACAO').AsString = 'A');
        btnCancelar.Enabled := (dsConsultar.DataSet.FieldByName('SITUACAO').AsString = 'A');
   End
   Else
   begin
        btnBaixaAtendimento.Enabled := False;
        btnCancelar.Enabled := False;
   End;
end;

procedure TfrmNewAgenda.sbPrimeiroClick(Sender: TObject);
begin
     If (dsConsultar.DataSet.Active ) Then
        dsConsultar.DataSet.First;
end;

procedure TfrmNewAgenda.sbAnteriorClick(Sender: TObject);
begin
     If (dsConsultar.DataSet.Active ) Then
         dsConsultar.DataSet.Prior;
end;

procedure TfrmNewAgenda.sbProximoClick(Sender: TObject);
begin
     If (dsConsultar.DataSet.Active) Then
        dsConsultar.DataSet.Next;
end;

procedure TfrmNewAgenda.sbUltimoClick(Sender: TObject);
begin
     If (dsConsultar.DataSet.Active) Then
        dsConsultar.DataSet.Last;
end;

procedure TfrmNewAgenda.btnBaixaAtendimentoClick(Sender: TObject);
Var
   iUsuario : Integer;
begin
     If Application.MessageBox('Confirma Conclus�o de Atendimento?',
        'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
       begin
            iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
            //
            If not (dmDados.AlterarStatusAtendimento(dmDados.cdsListaAtendimentoCODIGO.AsInteger, 'F')) Then
               Application.MessageBox(PChar(MSG_ERROR),
                  'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL)
            Else
               If not (dmDados.IncluirTarefaUsuario( iUsuario,
                    'Alterou Status para Conclu�do : '+uFuncoes.StrZero(dmDados.cdsListaAtendimentoCODIGO.AsString,7)+' *F*')) Then
                     ShowMessage('Erro ao adicionar tarefa do usu�rio.');
            //
            MonthCalendar1Click(Sender);
       End;
end;

procedure TfrmNewAgenda.FormShow(Sender: TObject);
begin
     MonthCalendar1.Date := Date();
     MonthCalendar1Click(Sender);
end;

procedure TfrmNewAgenda.FormCreate(Sender: TObject);
begin
   If not (UFrmMain.admin) Then
   begin
     //
     alterar := UFrmMain.aAlterar;
     //
     If Empty(alterar) Then
     begin
           dmDados.Verificar_Direito_Acesso(
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Acompanhamento de Agenda...'));
           //
           alterar := UFrmMain.aAlterar;
     End;
     //
     FrmMain.Limpar_Acessos;
     //
     btnBaixaAtendimento.Visible := (alterar = 'S');
     btnCancelar.Visible         := (alterar = 'S');
     //BtExcluir.Visible   := (apagar = 'S');
  End;
end;

end.
