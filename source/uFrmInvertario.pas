unit uFrmInvertario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, Mask, DBCtrls, ToolEdit,
  CurrEdit;

type
  TfrmInvertario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlGrid: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    edtCDPROD: TEdit;
    dbeDescricao: TEdit;
    spLocalizar: TSpeedButton;
    BtGravar: TBitBtn;
    BtCancelar: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    edtQTENTRADA: TCurrencyEdit;
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODChange(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    Procedure Busca(iLoja: Integer; aProduto : String);
  public
    { Public declarations }
  end;

var
  frmInvertario: TfrmInvertario;

implementation

uses udmDados, uFuncoes, uFrmLocalizaProduto, uFrmMain, DBClient;

{$R *.dfm}

procedure TfrmInvertario.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and uFuncoes.Empty(edtCDPROD.Text) Then
     begin
         key := #0;
         spLocalizarClick(Sender);
     End;
end;

procedure TfrmInvertario.spLocalizarClick(Sender: TObject);
begin
    edtCDPROD.SetFocus;
    frmLocProdutos := TfrmLocProdutos.create(application);
    try
        frmLocProdutos.showmodal;
    finally
        If not (frmLocProdutos.cdsConsultar.IsEmpty) Then
        begin
            edtCDPROD.Text := frmLocProdutos.cdsConsultarPRO_CODIGO.AsString;
            Perform(WM_NEXTDLGCTL, 0, 0);
            //edtCDPROD.SetFocus;
        End;
        //
        frmLocProdutos.Release;
        frmLocProdutos := nil;
    end;
end;

procedure TfrmInvertario.edtCDPRODExit(Sender: TObject);
Var
    M_CDPROD : String;
    M_CDLOJA : Integer;
begin
      If not uFuncoes.Empty(edtCDPROD.Text) Then
        begin
             M_CDPROD := uFuncoes.StrZero(edtCDPROD.Text, 13);
             //
             If not (dmDados.ProcurarValor(M_CDPROD, 'PRO_CODIGO', 'PRODUTOS')) Then
               Begin
                    edtCDPROD.SetFocus;
                    dbeDescricao.Clear;
                    Application.MessageBox('Código não cadastrado.','ATENÇÃO',
                       MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    pnlGrid.Enabled := False;
                    Exit;
               End
               Else
               begin
                    uFuncoes.FilterCDS(DMDados.cdsProduto, fsString , M_CDPROD);
                    //
                    If (DMDados.cdsProdutoPRO_FLPROD.AsString = 'S') Then
                     Begin
                          Application.MessageBox(PChar('O produto indicado é um serviço.'),
                                'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                          DMDados.cdsProduto.Close;
                          edtCDPROD.Clear;
                          edtCDPROD.SetFocus;
                          pnlGrid.Enabled := False;
                          Exit;
                     End;
                    //
                    M_CDLOJA := 1;
                    edtCDPROD.Text := M_CDPROD;
                    dbeDescricao.Text := dmDados.GetNomeProduto(edtCDPROD.Text);
                    pnlGrid.Enabled := True;
                    Busca(M_CDLOJA, M_CDPROD);
                    //
                    edtQTENTRADA.SetFocus;
               End;
        End
end;

procedure TfrmInvertario.edtCDPRODChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDPROD.Text) Then
      begin
          dbeDescricao.Clear;
          //
          If (dmDados.cdsEstoque.Active) Then
           begin
                With dmDados.cdsEstoque do
                  begin
                       Cancel;
                       Close;
                       //
                       edtQTENTRADA.Clear;
                       pnlGrid.Enabled := false;
                  End;
           End;
      End;
end;

procedure TfrmInvertario.BtCancelarClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmInvertario.BtGravarClick(Sender: TObject);
Var
    M_FLGRAV : Boolean;
    M_VLCOMP, M_VLVEND, M_QTANTE, M_QTMOVI, M_QTATUA : Double;
    M_DTMOVI : TDateTime;
    aHora, aProduto, aUnidade : String;
    M_NRITEM, iUsuario : Integer;
begin
      //
     If uFuncoes.Empty(edtQTENTRADA.Text) Then
      begin
           Application.MessageBox('Digite a quantidade do produto.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtQTENTRADA.SetFocus;
           Exit;
      End;
      //
     iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
     //
     M_FLGRAV := False;
     aHora    := Copy(TimetoStr(Time),1,5);
     M_DTMOVI := Date();
     //
     dmDados.Start;
     try
         M_QTANTE := dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat;
         M_QTMOVI := edtQTENTRADA.Value;
         M_QTATUA := dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat + M_QTMOVI;
         //
         dmDados.cdsEstoqueEST_QUANTENTRADA.AsFloat := M_QTMOVI;
         dmDados.cdsEstoqueEST_QUANTIDADE.AsFloat   := M_QTATUA;
         dmDados.cdsEstoque.ApplyUpdates(0);
         //
         aProduto := dmDados.cdsEstoqueEST_CDPROD.AsString;
         aUnidade := dmDados.cdsEstoqueEST_UNPROD.AsString;
         //
         dmDados.Comit(udmDados.Transc);
         //
         M_FLGRAV := True;
     Except
         dmDados.Rollback;
         Exit;
     End;
     //
     If (M_FLGRAV) Then
      begin
          M_NRITEM := 1;
          uFuncoes.FilterCDS(dmDados.cdsProduto, fsString, aProduto);
          M_VLCOMP := dmDados.cdsProdutoPRO_VLCOMPRA.AsFloat;
          M_VLVEND := dmDados.cdsProdutoPRO_VLVENDA.AsFloat;
          //  iLOJA, iNRITEM,
          //  iDOCUMENTO, iUSUARIO, iMOTIVO: Integer; aPRODUTO, aUNIDADE, aHORA,
          //  aTIPO: String; aDATA: TDateTime; fANTERIOR, fMOVIMENTO, fATUAL,
          //  fVLCOMPRA, fVLVENDA: Double
          dmDados.AddHistoricoProduto(1, M_NRITEM, 0, StrtoInt(uFrmMain.M_CDUSUA), 0, aProduto, aUnidade,
             aHora, 'E', M_DTMOVI, M_QTANTE, M_QTMOVI, M_QTATUA, M_VLCOMP, M_VLVEND);
          //
          If not (dmDados.IncluirTarefaUsuario( iUsuario,
              'Alterou estoque do produto : '+aProduto+' *F*')) Then
              ShowMessage('Erro ao adicionar tarefa do usuário.');
      End;
     //
      Application.MessageBox(PChar(MSG_OK),
              'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     //
     edtCDPROD.Clear;
     edtCDPROD.SetFocus;
end;

procedure TfrmInvertario.Busca(iLoja: Integer; aProduto: String);
begin
     If  (iLoja > 0)
      and not uFuncoes.Empty(aProduto) Then
      begin
           //
           With dmDados.cdsEstoque do
            begin
                 DisableControls;
                 Close;
                 Params.ParamByName('pCDLOJA').AsInteger :=  iLoja;
                 Params.ParamByName('pCDPROD').AsString  :=  aProduto;
                 Open;
                 EnableControls;
                 //
                 If (IsEmpty) Then
                 begin
                      uFuncoes.FilterCDS(dmDados.cdsProduto, fsString, aProduto);
                      Append;
                      FieldByName('EST_CDLOJA').AsInteger := iLoja;
                      FieldByName('EST_CDPROD').AsString  := aProduto;
                      FieldByName('EST_UNPROD').AsString  := dmDados.cdsProdutoPRO_UNIDADE.AsString;
                      FieldByName('EST_DTENTRADA').AsDateTime := Date();
                      FieldByName('EST_QUANTIDADE').AsFloat := 0;
                 End
                 Else
                      Edit;
            End;
      End;
end;

procedure TfrmInvertario.FormCreate(Sender: TObject);
begin
   If not (UFrmMain.admin) Then
   begin
     //
     novo    := UFrmMain.aNovo;
     alterar := UFrmMain.aAlterar;
     apagar  := UFrmMain.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dmDados.Verificar_Direito_Acesso(
            Strtoint(UFrmMain.M_CDUSUA), DmDados.GetCodMenu('Invertário...'));
           //
           novo    := UFrmMain.aNovo;
           alterar := UFrmMain.aAlterar;
           apagar  := UFrmMain.aApagar;
           //
     End;
     //
     FrmMain.Limpar_Acessos;
     //
     {BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');}
  End;
end;

end.
