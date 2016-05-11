unit uFrmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, FMTBcd,
  DBClient, Provider, DB, SqlExpr, Grids, DBGrids,
  ToolEdit, RXDBCtrl;

type
  TfrmCadastro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlBotoes: TPanel;
    pnlProcurar: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtGravar: TBitBtn;
    BtCancelar: TBitBtn;
    BtSair: TBitBtn;
    rgConsultar: TRadioGroup;
    lblConsultar: TLabel;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    Panel3: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    grdConsultar: TDBGrid;
    dsConsultar: TDataSource;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    StatusBar1: TStatusBar;
    dsCadastro: TDataSource;
    Label1: TLabel;
    DBText1: TDBText;
    datasetConsultar: TSQLDataSet;
    procedure BtSairClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure habilitaBotoes(const oper: Char);
    procedure habilitaCampos(const tof: Boolean);
    procedure tratabotoes;
    procedure DataHora();
    Procedure DesFocalizarComponentesBase(sender: TObject);
    Procedure FocalizarComponentesBase(sender: TObject);
  protected
    strOper : Char;
    { Private declarations }
  public
    { Public declarations }
    M_DTMOVI : TDate;
    M_HOMOVI : String;
  end;

var
  frmCadastro: TfrmCadastro;
  corFundo, corFonte : TColor;


implementation

uses uFuncoes, uDMDados;

{$R *.dfm}

procedure TfrmCadastro.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCadastro.habilitaBotoes(const oper: Char);
begin
  case oper of
    'I': //Inclus�o
    begin
      BtAdicionar.Enabled := False;
      BtGravar.Enabled := True;
      BtCancelar.Enabled := True;
      BtExcluir.Enabled := False;
      BtSair.Enabled := False;
      PageControl1.Pages[1].TabVisible := False;
      //sbStatus.Panels[0].Text := 'Incluindo';
    end;
    'A': //Altera��o
    begin
      BtAdicionar.Enabled := False;
      BtGravar.Enabled := True;
      BtCancelar.Enabled := True;
      BtExcluir.Enabled := True;
      BtSair.Enabled := False;
      PageControl1.Pages[1].TabVisible := False;
      //sbStatus.Panels[0].Text := 'Alterando';
    end;
    'C': //Consulta
    begin
      BtAdicionar.Enabled := True;
      BtGravar.Enabled := False;
      BtCancelar.Enabled := False;
      BtExcluir.Enabled := False;
      BtSair.Enabled := True;
      PageControl1.Pages[1].TabVisible := True;
      //sbStatus.Panels[0].Text := 'Consultando';
    end;
  end;
end;

procedure TfrmCadastro.habilitaCampos(const tof: Boolean);
var
  i : Integer;
  cor : TColor;
begin
  if tof then
    cor := clWindow
  else
    cor := clBtnFace;
  for i := 0 to PageControl1.Pages[0].ControlCount - 1 do
  begin
    if (PageControl1.Pages[0].Controls[i] is TEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TComboBox).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TMaskEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TMaskEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TDBLookupComboBox) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBLookupComboBox).Color := cor;
    end
    Else
    if (PageControl1.Pages[0].Controls[i] is TDBEdit) then
    begin
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Enabled := tof;
      (PageControl1.Pages[0].Controls[i] as TDBEdit).Color := cor;
    end
    else
    if (PageControl1.Pages[0].Controls[i] is TRadioGroup) then
      (PageControl1.Pages[0].Controls[i] as TRadioGroup).Enabled := tof
    else
    if (PageControl1.Pages[0].Controls[i] is TCheckBox) then
      (PageControl1.Pages[0].Controls[i] as TCheckBox).Enabled := tof;
  end;
end;

procedure TfrmCadastro.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled    := not BtEditar.Enabled;
   BtExcluir.Enabled   := not BtExcluir.Enabled;
   //BtPesquisar.Enabled := not BtPesquisar.Enabled;
   //
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
end;

procedure TfrmCadastro.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'C�digo:';
      edtConsultar.MaxLength := 7;
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descri��o:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadastro.edtConsultarKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadastro.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8, #13] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
  //
  If (key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
    begin
         Key := #0;
         If (btnConsultar.Enabled = True) Then
            btnConsultar.SetFocus;
    End;  
end;

procedure TfrmCadastro.edtConsultarChange(Sender: TObject);
begin
  If uFuncoes.Empty(edtConsultar.Text) Then
      cdsConsultar.Close;
  //
  btnConsultar.Enabled := not (cdsConsultar.IsEmpty);
end;

procedure TfrmCadastro.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmCadastro.BtAdicionarClick(Sender: TObject);
begin
  strOper := 'I';
  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  //
  TabSheet2.TabVisible := False;
  tratabotoes;
  //
  DataHora();
end;

procedure TfrmCadastro.BtEditarClick(Sender: TObject);
begin
  strOper := 'A';
{  habilitaBotoes(strOper);
  habilitaCampos(True);}
  TabSheet2.TabVisible := False;
  tratabotoes;
  DataHora();
end;

procedure TfrmCadastro.BtExcluirClick(Sender: TObject);
begin
  strOper := 'C';
end;

procedure TfrmCadastro.BtCancelarClick(Sender: TObject);
begin
  strOper := 'C';
  tratabotoes;
  TabSheet2.TabVisible := True;

  If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
         dsCadastro.DataSet.Cancel;
  if (dsCadastro.DataSet.IsEmpty) Then
       Close;
{  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);}
end;

procedure TfrmCadastro.BtGravarClick(Sender: TObject);
begin
  strOper := 'C';
  tratabotoes;
  TabSheet2.TabVisible := True;
{  if dsConsultar.DataSet.Active then
    dsConsultar.DataSet.Close;
  habilitaBotoes(strOper);
  habilitaCampos(False);}
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
      PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadastro.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.First;
end;

procedure TfrmCadastro.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
         dsConsultar.DataSet.Prior;
end;

procedure TfrmCadastro.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Next;
end;

procedure TfrmCadastro.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsConsultar.DataSet.Last;
end;

procedure TfrmCadastro.TabSheet2Show(Sender: TObject);
begin
     edtConsultar.Clear;
     cdsConsultar.Close;
     //
     btnConsultar.Enabled := False;
     edtConsultar.SetFocus;
end;

procedure TfrmCadastro.dsConsultarStateChange(Sender: TObject);
begin
  btnConsultar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmCadastro.DataHora;
begin
     M_DTMOVI := Date();
     M_HOMOVI := Copy(TimetoStr(Time()),1,5);
end;

procedure TfrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      If (dsCadastro.DataSet.Active) Then
        dsCadastro.DataSet.close;
end;

procedure TfrmCadastro.DesFocalizarComponentesBase(sender: TObject);
Var
    CorFundoPadrao, CorFontePadrao : TColor;
begin
   CorFundoPadrao := clWindow;
   CorFontePadrao := clBlack;
   //
   If (sender is TEdit) Then
   begin
     (sender as TEdit).Color      := CorFundoPadrao;
     (sender as TEdit).Font.Color := CorFontePadrao;
   End;
     //
   If (sender is TComboBox) Then
   begin
     (sender as TComboBox).Color       := CorFundoPadrao;
     (sender as TComboBox).Font.Color  := CorFontePadrao;
   End;
   //
   if (sender is TMaskEdit) then
    begin
      (sender as TMaskEdit).Color      := CorFundoPadrao;
      (sender as TMaskEdit).Font.Color := CorFontePadrao;
    end;
    //
   if (sender is TDBComboBox) then
    begin
      (sender as TDBComboBox).Color      := CorFundoPadrao;
      (sender as TDBComboBox).Font.Color := CorFontePadrao;
    end;
    //
    if (Sender is TDBLookupComboBox) then
    begin
      (Sender as TDBLookupComboBox).Color      := CorFundoPadrao;
      (Sender as TDBLookupComboBox).Font.Color := CorFontePadrao;
    end;
    //
    if (Sender is TDBEdit) then
    begin
      (Sender as TDBEdit).Color       := CorFundoPadrao;
      (Sender as TDBEdit).Font.Color  := CorFontePadrao;
    end;
    //
    if (Sender is TDBDateEdit) then
    begin
      (Sender as TDBDateEdit).Color       := CorFundoPadrao;
      (Sender as TDBDateEdit).Font.Color  := CorFontePadrao;
    end;
    //
    if (sender is TRadioGroup) then
     begin
      (Sender as TRadioGroup).Color      := clBtnFace;
      (Sender as TRadioGroup).Font.Color := CorFontePadrao;
     end;
end;

procedure TfrmCadastro.FocalizarComponentesBase(sender: TObject);
begin
   If (sender is TEdit) Then
   begin
    (sender as TEdit).Color      := corFundo;
    (sender as TEdit).Font.Color := corFonte;
   End;
    //
   If (sender is TComboBox) Then
   begin
    (sender as TComboBox).Color      := corFundo;
    (sender as TComboBox).Font.Color := corFonte;
   End;
   //
   if (sender is TMaskEdit) then
    begin
      (sender as TMaskEdit).Color      := corFundo;
      (sender as TMaskEdit).Font.Color := corFonte;
    end;
    //
   if (sender is TDBComboBox) then
    begin
      (sender as TDBComboBox).Color      := corFundo;
      (sender as TDBComboBox).Font.Color := CorFonte;
    end;
    //
    if (Sender is TDBLookupComboBox) then
    begin
      (Sender as TDBLookupComboBox).Color      := corFundo;
      (Sender as TDBLookupComboBox).Font.Color := corFonte;
    end;
    //
    if (Sender is TDBEdit) then
    begin
      (Sender as TDBEdit).Color       := corFundo;
      (Sender as TDBEdit).Font.Color  := corFonte;
    end;
    //
    if (Sender is TDBDateEdit) then
    begin
      (Sender as TDBDateEdit).Color       := corFundo;
      (Sender as TDBDateEdit).Font.Color  := corFonte;
    end;
    //
    if (sender is TRadioGroup) then
     begin
      (Sender as TRadioGroup).Color      := corFundo;
      (Sender as TRadioGroup).Font.Color := corFonte;
     end;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
Var
    cont : integer;
begin
     corFundo := clInfoBk;
     corFonte := clBlack;
     //
  {for cont := 0 to self.ComponentCount - 1 do
    begin
      if(self.Components[cont] is TEdit)then
        begin
          (Components[cont] as TEdit).CharCase:=ecUpperCase;
          (Components[cont] as TEdit).OnEnter:=FocalizarComponentesBase;
          (Components[cont] as TEdit).OnExit:=DesFocalizarComponentesBase;
        end;
        //
      if(self.Components[cont] is TComboBox)then
       begin
          //
          (Components[cont] as TComboBox).OnEnter := FocalizarComponentesBase;
          (Components[cont] as TComboBox).OnExit  := DesFocalizarComponentesBase;
        end;
        //
      if (self.Components[cont] is TMaskEdit) then
        begin
          (Components[cont] as TMaskEdit).OnEnter :=FocalizarComponentesBase;
          (Components[cont] as TMaskEdit).OnExit  := DesFocalizarComponentesBase;
        end;
      //
     if (Components[cont] is TDBComboBox) then
      begin
          (Components[cont] as TDBComboBox).OnEnter := FocalizarComponentesBase;
          (Components[cont] as TDBComboBox).OnExit  := DesFocalizarComponentesBase;
      end;
      //
      if (self.Components[cont] is TDBLookupComboBox) then
        begin
          (self.Components[cont] as TDBLookupComboBox).OnEnter :=FocalizarComponentesBase;
          (self.Components[cont] as TDBLookupComboBox).OnExit  := DesFocalizarComponentesBase;
        end;
      //
      if (self.Components[cont] is TDBEdit) then
        begin
            (self.Components[cont] as TDBEdit).OnEnter:=FocalizarComponentesBase;
            (self.Components[cont] as TDBEdit).OnExit  := DesFocalizarComponentesBase;
        end;
        //
      if (self.Components[cont] is TDBDateEdit) then
        begin
            (self.Components[cont] as TDBDateEdit).OnEnter:=FocalizarComponentesBase;
            (self.Components[cont] as TDBDateEdit).OnExit  := DesFocalizarComponentesBase;
        end;
        //
      if (self.Components[cont] is TRadioGroup) then
         begin
            (self.Components[cont] as TRadioGroup).OnEnter:=FocalizarComponentesBase;
            (self.Components[cont] as TRadioGroup).OnExit  := DesFocalizarComponentesBase;
         end;
    end; }
end;

end.
