unit uFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Grids, DBGrids,
  ExtCtrls, DB, uFrmVendas, FMTBcd, SqlExpr, DBXpress, DBClient, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppMemo;

type
  TfrmFormaPagamento = class(TForm)
    pnlFormaPag: TPanel;
    Panel1: TPanel;
    GridModa: TDBGrid;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    qryProcurar: TSQLQuery;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TFloatField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    dsModalidades: TDataSource;
    cdsModalidadeMOD_VALOR: TCurrencyField;
    Panel4: TPanel;
    pnlTroco: TPanel;
    Label2: TLabel;
    qryIncluir: TSQLQuery;
    pnlSuperior: TPanel;
    Label3: TLabel;
    pnlTOMERC: TPanel;
    Label4: TLabel;
    edtDESVAL: TCurrencyEdit;
    txtTOVEND: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    edtDESPER: TCurrencyEdit;
    edtCDCLIE: TEdit;
    edtNMCLIE: TEdit;
    spLocCliente: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    cdsModalidadeMOD_FLFIXA: TStringField;
    qryLocVenda: TSQLQuery;
    qryProdutos: TSQLQuery;
    cdsModalidadeMOD_NRPARCELA: TFloatField;
    ppRepItensVenda: TppReport;
    ppDBItensVenda: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    txtTitulo: TppLabel;
    ppLine2: TppLine;
    ppDBLoja: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    txtVENDA: TppLabel;
    txtCLIENTE: TppLabel;
    txtCAIXA: TppLabel;
    txtVENDEDOR: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine6: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine7: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine8: TppLine;
    txtPagamento: TppMemo;
    ppLabel15: TppLabel;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    txtPagamento2: TppMemo;
    txtTOTAL: TppLabel;
    btnCliente: TBitBtn;
    edtAcrescimo: TCurrencyEdit;
    Label8: TLabel;
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure GridModaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridModaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridModaColEnter(Sender: TObject);
    procedure GridModaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESVALEnter(Sender: TObject);
    procedure edtDESPEREnter(Sender: TObject);
    procedure edtDESVALExit(Sender: TObject);
    procedure edtDESPERExit(Sender: TObject);
    procedure edtDESVALKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESPERKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtNMCLIEEnter(Sender: TObject);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtDESVALChange(Sender: TObject);
    procedure edtDESPERChange(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure edtAcrescimoExit(Sender: TObject);
    procedure edtAcrescimoEnter(Sender: TObject);
  private
    Procedure CALCULAR;
    procedure Acrescimo;
    Procedure NotaFiscal(Local:string);
    Procedure NOTAFISCAL2;
    Procedure BUSCA_CLIENTE;
    Procedure CRIAR_PARCELAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPagamento: TfrmFormaPagamento;
  W_NRVEND, M_CAMINH, M_NMCLIE, M_NMVEND, aCliente, aFLTAXA : String;
  M_VLDIGI, M_TOENTR, M_TOVEND, M_VLLIMP : Real;
  M_CDVEND, M_CDLOJA, M_CDCLIE, M_CDCAIX : Integer;
  M_FLSUPE, M_FLPEDI : Boolean;
  M_VLREAL, M_VLPERC  : Double;
  M_FLIMPR, W_TOTAPC : Integer;
  fValorTaxa : Double;

implementation

Uses uFuncoes, UFrmMain, UdmDados, uFrmParcelas, udmFinanceiro,
  uFrmLocClientes, uFrmCadClientes;

{$R *.dfm}

procedure TfrmFormaPagamento.btConfirmarClick(Sender: TObject);
Var
   M_NMCLIE, M_NRMESA : String;
   M_MDAPRA : Double;
   M_CDCLIE, W_TOTAPC : Integer;
begin
     M_FLPEDI := False;
     //
     // testa se os valores das modalidades s�o maiores que zero
     //cdsModalidade.open;
     cdsModalidade.DisableControls;
     cdsModalidade.First;
     cdsModalidade.DisableControls;
     //
     While not (cdsModalidade.Eof) do
       begin
            cdsModalidade.Edit;
            M_TOENTR := M_TOENTR+cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
            // proximo
            cdsModalidade.Next;
       End;
       //
       cdsModalidade.EnableControls;
       //                        M_VLVEND
       If (Arredondar(M_TOENTR,2) < Arredondar(M_TOVEND,2)) Then
        begin
             Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATEN��O', MB_OK+MB_ICONSTOP);
             cdsModalidade.First;
             cdsModalidade.EnableControls;
             //uDM.M_NRMENS := 1;
             exit;                     // sair da procedure.
        end;
       // testa se modalidades � parcelada
       cdsModalidade.First;
       cdsModalidade.DisableControls;
       //
       While not (cdsModalidade.Eof) do
       begin
            cdsModalidade.Edit;
            If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0)
              AND (cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
              and (cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
            begin
                 M_MDAPRA := M_MDAPRA + cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                 W_TOTAPC := cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                 If not uFuncoes.Empty(edtCDCLIE.Text) Then
                     M_CDCLIE := StrtoInt(edtCDCLIE.Text)
                 Else
                     M_CDCLIE := 1;
                 //
                 uFuncoes.CRIAR_PARCELAS(cdsModalidade.FieldByName('MOD_VALOR').AsCurrency, W_TOTAPC);
                 Application.CreateForm(TfrmParcelas, frmParcelas);
                 with frmParcelas do
                    try
                         ufrmParcelas.M_CDMODA := cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                         ufrmParcelas.M_TOMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                         ufrmParcelas.M_TPMODA := cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
                         lbl_NMMODA.Caption    := cdsModalidade.FieldByName('MOD_NOME').AsString;
                         lbl_VLTOTAL.Caption   := FormatFloat('###,###,##0.#0', cdsModalidade.FieldByName('MOD_VALOR').AsCurrency);
                         //
                         If (ufrmParcelas.M_TPMODA = 'P') AND (M_CDCLIE > 0 ) Then
                         begin
                              edtCDCLIE.Text := InttoStr(M_CDCLIE);
                              edtNMCLIE.Text := dmDados.GetNomeCliente(M_CDCLIE);
                         End;
                         //
                         showmodal;
                    finally
                         If not Empty(edtCDCLIE.Text) Then
                            M_CDCLIE := StrtoInt(edtCDCLIE.Text);
                         free;
                    end;
            End;
            // proximo
            cdsModalidade.Next;
       End;
       //
       cdsModalidade.EnableControls;
       //                        M_VLVEND
       If (Arredondar(M_TOENTR,2) < Arredondar(M_TOVEND,2)) Then
       begin
            Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATEN��O', MB_OK+MB_ICONSTOP);
            cdsModalidade.First;
            //uDM.M_NRMENS := 1;
            exit;                     // sair da procedure.
       end;
     //
     btCancelar.Enabled := False;
     btConfirmar.Enabled   := False;
     try
          Screen.Cursor := crHourGlass;
          //
          uFuncoes.MODALIDADES;
          //
          If uFuncoes.Empty(edtCDCLIE.Text) Then
              M_CDCLIE := 0
          Else
              M_CDCLIE := StrtoInt(edtCDCLIE.text);
          //
          M_NMCLIE := edtNMCLIE.Text;
          //
          {If uFuncoes.Empty(M_CDCLIE) Then
               M_CDCLIE := '0';}
          //
          If uFuncoes.Empty(M_NMCLIE) Then
               M_NMCLIE := 'VENDA AO CONSUMIDOR';
          //    
          uFuncoes.RefreshCDS(DmDados.CdsConfig);
          M_NRMESA := '001';
          //
          {if not (uFuncoes.VENDA(M_TOVEND, edtDESVAL.Value, edtAcrescimo.value, M_CDLOJA, M_CDCAIX,
                M_IMPRES, StrtoInt(M_CDCLIE), 0 , M_CDVEND, Date() , M_NMCLIE, TimetoStr(time()), '1', '',0,0, 0, 0, '', '', '', M_NRMESA, aFLTAXA, fValorTaxa)) Then
            begin
                 If (uDM.M_NRMENS <> 1) Then
                    Application.MessageBox(PChar('Erro no fechamento de venda !'),
                          'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            End
            Else
            begin
                 M_FLPEDI := true;
                 uFrmVendas.M_FLVEND := False;
                 Close;
            End;}
            //
            { GravaVenda(iLoja, iCliente, iVendedor: Integer;
            fValorVenda, fValorEntrada, fVlAcrecimo, fVlDesconto, fVlTroco: Double;
            aCDSItens: TClientDataSet): Boolean; }
            If (dmDados.GravaVenda(1, M_CDCLIE, StrtoInt(uFrmMain.M_CDUSUA),
              M_TOVEND, M_TOENTR, edtAcrescimo.Value, edtDESVAL.Value, M_VLTROC,
                dmFinanceiro.cdsDadosItens)) Then
               begin
                 Application.MessageBox('Venda realizada com sucesso.',
                    'Concu�do', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dmFinanceiro.ImprimirVenda(udmDados.W_NRVEND);
               End
            Else
                 Application.MessageBox('Erro ao realizar venda.',
                    'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            //
            uFrmVendas.M_FLVEND := False;
            udmDados.W_NRVEND := 0;
            Close;
     Finally
          Screen.Cursor := crDefault;
          btCancelar.Enabled   := True;
          btConfirmar.Enabled  := True;
     End;
     //
     Application.ProcessMessages;
end;

procedure TfrmFormaPagamento.btCancelarClick(Sender: TObject);
begin
      //pnlFormaPag.Visible := False;
      M_FLPEDI := False;
      Close;
     { M_TOVEND := W_VLVEND;
      frmVenda.COMPONENTES_INVISIVEL('1');
      frmVenda.edtCodigo.Enabled   :=  True;
      frmVenda.edtCodigo.SetFocus;}
end;

procedure TfrmFormaPagamento.GridModaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     //
     If (key = vk_F2) then
     begin
          //Validar_Entradas;
          btConfirmarClick(Sender);
          //btConfirmar.SetFocus;
     End;
     //
     If (key = vk_Escape) Then
       btCancelar.SetFocus;
     //
     If (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     case key of
        13 : Key := 9;
     end;
     //
end;

procedure TfrmFormaPagamento.GridModaEnter(Sender: TObject);
begin
     GridModa.SelectedIndex := 1; { Vai para a 1� coluna }
end;

procedure TfrmFormaPagamento.FormShow(Sender: TObject);
begin
     KeyPreview := False;
     //
     uFuncoes.RefreshCDS(DmDados.CdsConfig);
     //
     M_VLLIMP := 0;
     //
     If (dmDados.cdsParcelasVenda.Active = False) Then
        dmDados.cdsParcelasVenda.Open;
     dmDados.cdsParcelasVenda.EmptyDataSet;
     //
     uFuncoes.RefreshCDS(dmFinanceiro.cdsListaModas);
     dmFinanceiro.cdsListaModas.First;
     //
     cdsModalidade.Open;
     While not (dmFinanceiro.cdsListaModas.Eof) do
     Begin
          cdsModalidade.Append;
          cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
             dmFinanceiro.cdsListaModas.FieldByName('MOD_CODIGO').AsInteger;
          cdsModalidade.FieldByName('MOD_NOME').AsString      :=
             dmFinanceiro.cdsListaModas.FieldByName('MOD_NOME').AsString;
          cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
             dmFinanceiro.cdsListaModas.FieldByName('MOD_PECOMISSAO').AsFloat;
          cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
             dmFinanceiro.cdsListaModas.FieldByName('MOD_ABREVIACAO').AsString;
          cdsModalidade.FieldByName('MOD_VALOR').AsCurrency := 0;
          cdsModalidade.FieldByName('MOD_FLFIXA').AsString  :=
             dmFinanceiro.cdsListaModas.FieldByName('MOD_FLFIXA').AsString;
          cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger :=
             dmFinanceiro.cdsListaModas.FieldByName('MOD_NRPARCELA').AsInteger;
          cdsModalidade.Post;
          // Proximo
          dmFinanceiro.cdsListaModas.Next;
     End;
     //
     cdsModalidade.First;
     //
     M_TOVEND := uFrmVendas.M_VLVENDA;
     txtTOVEND.Caption  := FormatFloat('###,##0.00', uFrmVendas.M_VLVENDA);
     pnlTOMERC.Caption  := FormatFloat('###,##0.00', uFrmVendas.M_VLVENDA);
     //
     pnlFormaPag.Visible := True;
     btConfirmar.Enabled := True;
     //
     If not uFuncoes.Empty(aCliente) Then
      begin
           edtCDCLIE.SetFocus;
           edtCDCLIE.Text := uFuncoes.StrZero(aCliente,7);
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
     //
     M_FLIMPR := 1;
     // GridModa
     If (uFrmMain.admin) Then
         edtDESVAL.SetFocus
     Else
         GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.GridModaColEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1;
     //
     If not (cdsModalidade.IsEmpty) Then
         If (uFuncoes.Empty(cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
               cdsModalidade.Delete;
end;

procedure TfrmFormaPagamento.GridModaKeyPress(Sender: TObject;
  var Key: Char);
Var
    W_TOVEND : Real;
    bmLocalImportante : TBookmark;
    M_NMMODA : String;
begin
      W_TOVEND := M_TOVEND;
      //StrtoFloat(txtTOVEND.Caption);
      //
      If (Key = #13) Then
      //and (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency>0) Then
      begin
           Key := #0;
           //
           M_VLDIGI := 0;
           //bmLocalImportante := cdsModalidade.GetBookMark;
           M_NMMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
           //
           cdsModalidade.DisableControls;
           cdsModalidade.First;
           //
           While not (cdsModalidade.Eof) do
           begin
              {If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency>0) Then
              Begin}
                If (uFuncoes.Empty(cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
                begin
                     cdsModalidade.Delete;
                     break;
                     GridModa.SetFocus;
                     Exit;
                End;
                //
                //If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                     M_VLDIGI := M_VLDIGI+cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                //
              //End;
              // Proximo
                cdsModalidade.Next;
           End;
           //
           cdsModalidade.EnableControls;
           //
           {If (M_VLDIGI >= W_TOVEND) Then
           begin}
               uFrmVendas.M_VLTROC :=  M_VLDIGI-W_TOVEND;
               //
               //pnlEntrada.Caption := FormatFloat('###,###,##0.#0', M_VLDIGI);
               pnlTroco.Caption  := FormatFloat('###,##0.#0', uFrmVendas.M_VLTROC);
               cdsModalidade.Locate('MOD_NOME',M_NMMODA,[]);
              // cdsModalidade.Next;
               {cdsModalidade.First;
               cdsModalidade.GotoBookMark(bmLocalImportante);
               cdsModalidade.FreeBookMark(bmLocalImportante);
               cdsModalidade.Next;}
           //End;
           //
           If (M_VLDIGI = 0) then
              pnlTroco.Caption  := '0,00';
      End;
      //
      If (key = #13) and (cdsModalidade.Eof) Then
      Begin
           Key := #0;
           btConfirmar.SetFocus;
      End;
      //
end;

procedure TfrmFormaPagamento.edtDESVALEnter(Sender: TObject);
begin
    M_TOVEND := uFrmVendas.M_VLVENDA + edtAcrescimo.Value;
    //
    edtDESPER.Value := 0;
    edtDESVAL.Value := 0;
    //
    M_TOVEND := M_TOVEND + fValorTaxa;
    txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
    txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
    //
    cdsModalidade.EnableControls;
    {uFuncoes.FilterCDS(dmDados.cdsUsuario, fsInteger, InttoStr(M_CDCAIX));
    //
     If not (dmDados.cdsUsuario.IsEmpty) Then
     begin
          If (dmDados.cdsUsuario.FieldByName('SEN_FLSUPER').AsString = 'N')
             OR uFuncoes.Empty(dmDados.cdsUsuario.FieldByName('SEN_FLSUPER').AsString) Then
          Begin
               with TfrmSupervisor.create(self) do
                try
                  showmodal;
                finally
                  free;
                  //
                  If (M_FLSUPE = False) Then
                  Begin
                     GridModa.SelectedIndex := 1;
                  End;
                end;
          End
          Else
          Begin
              M_FLSUPE := True;
              edtDESVAL.SetFocus;
          End;
     End;  }
end;

procedure TfrmFormaPagamento.edtDESPEREnter(Sender: TObject);
begin
     M_TOVEND := uFrmVendas.M_VLVENDA + edtAcrescimo.Value;
     //
     edtDESVAL.Value := 0;
     edtDESPER.Value := 0;
     txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
     //
     cdsModalidade.EnableControls;
     {With dmConsultas.qryUsuarios do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA, SEN_FLSUPER, USU_ADMIN from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := M_CDCAIX;
          //
          Open;
     End;
     //
     If not (dmConsultas.qryUsuarios.IsEmpty) Then
     begin
          If (dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString = 'N')
             OR uFuncoes.Empty(dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString) Then
          Begin
               with TfrmSupervisor.create(self) do
                try
                  showmodal;
                finally
                  free;
                  //
                  If (M_FLSUPE = False) Then
                    GridModa.SetFocus;
                end;
          End
          Else
          begin
              M_FLSUPE := True;
              edtDESPER.SetFocus;
          End;
     End;  }
end;

procedure TfrmFormaPagamento.CALCULAR;
Var
    M_VLVEND : Real;
begin
     M_VLVEND := 0;
     //
     //If (M_FLSUPE = True) Then
     If (uFrmMain.admin = True) Then
     Begin
          M_VLLIMP := uFrmVendas.M_VLVENDA;
          M_VLVEND := M_TOVEND;
     End;
     //
     If (edtDESVAL.Value > 0) Then
     Begin
          {M_VLPERC := (edtDESVAL.Value*100)/M_TOVEND;
          M_TOVEND := (M_TOVEND - edtDESVAL.Value);}
          M_VLPERC := (edtDESVAL.Value*100)/M_VLLIMP;
          M_VLLIMP := (M_VLLIMP - edtDESVAL.Value);
          //
          //txtTOVEND.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
          edtDESPER.Value   := M_VLPERC;
          M_VLREAL := edtDESVAL.Value;
     End
     Else
     Begin
          //M_TOVEND := (M_TOVEND - uFuncoes.Gerapercentual(M_TOVEND, edtDESPER.Value));
          M_VLLIMP := (M_VLLIMP - uFuncoes.Gerapercentual(M_VLLIMP, edtDESPER.Value));
          //edtDESVAL.Value   := M_VLVEND - M_TOVEND;
          edtDESVAL.Value   := M_VLVEND - M_VLLIMP;
          //
          M_VLREAL := edtDESVAL.Value;
          M_VLPERC := edtDESPER.Value;
     End;
     //
     M_TOVEND := M_VLLIMP;
     //
     Acrescimo;
     txtTOVEND.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
end;

procedure TfrmFormaPagamento.edtDESVALExit(Sender: TObject);
begin
      If (edtDESVAL.Value > M_TOVEND) Then
      begin
           Application.MessageBox(PChar('Valor de desconto maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDESVAL.Value := 0;
           If (edtDESVAL.CanFocus) Then
               edtDESVAL.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.edtDESPERExit(Sender: TObject);
begin
      If (edtDESPER.Value >= 100) Then
      begin
           Application.MessageBox(PChar('Percentual de desconto maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDESPER.Value := 0;
           If (edtDESPER.CanFocus) Then
               edtDESPER.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.NotaFiscal(Local: string);
Var
  Impressora:TextFile;
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_UNITEN, M_CAMINHO, M_NMFILE : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT : Real;
  W_QTITEN : Double;
  M_NRITEM : Integer;
begin
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmMain.M_CDUSUA));
     //
     If (fileexists(M_CAMINH+'\impressora.txt')) then
        M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
     Else
     begin
        M_NMFILE := 'CUPOM.TXT';
        //
        If (M_CAMINH = 'C:\') Then
           M_CAMINH := M_CAMINH + M_NMFILE
        Else
           M_CAMINH := M_CAMINH+'\'+M_NMFILE;
     End;

  //
{  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  //Relaciona a vari�vel impressora com a
   AssignFile(IMPRESSORA, M_CAMINH);
  //abre a porta da impress�o
  Rewrite(IMPRESSORA);
  //envia caractere de controle para comprimir a impress�o
  Write(IMPRESSORA,#15);
  Writeln(impressora);
  // Imprime e alinhado � esquerda dentro de uma �rea de 52 caracteres
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  // Imprime a string "Cupom ", alinhado � esquerda"-" dentro de uma �rea de trita caracteres
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('INFOG2 - CUPOM DE VENDA',48)]));
  // Imprime e alinhado � esquerda dentro de uma �rea de 52 caracteres
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  // Imprime o nome da Loja
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]));
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,48)]));
  // Imprime e alinhado � esquerda dentro de uma �rea de 52 caracteres
  Writeln (Impressora,Format('%-30s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['N'+CHR(167)+'. DA VENDA....: '+W_NRVEND]));
  Writeln (Impressora,Format('%-48s', ['CLIENTE.........: '+ M_NMCLIE]));
  Writeln (Impressora,Format('%-30s', ['VENDEDOR........: '+M_NMVEND]));
  Writeln (Impressora,Format('%-30s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - '+UFrmAdmin.M_NMUSUA]));
  // Imprime a Data de Emiss�o, baseada na data atual e salta para pr�xima linha
  Writeln (Impressora,Format('%-30s', ['DATA/HORA.......: '+Data+uFuncoes.Replicate(' ',10) +TimetoStr(Time)]));
  Writeln (Impressora,Format('%-30s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO']));
  Writeln (Impressora,Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']));
  Writeln (Impressora,Format('%-30s', [Replicate('-',48 )]));
  //
  //----- Fase de Emiss�o dos Itens da Nota -----
  // Move o ponteiro para o primeiro registro
  dm.cdsItensVendas.First;
  M_NRITEM := 1;
  While not (dm.cdsItensVendas.Eof) do
  Begin
      //{carrega os dados
       W_CDITEN := dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
       W_NMDESC := Copy(dm.cdsItensVendas.FieldByName('ITE_NMDESC').AsString,1,27);
       W_QTITEN := dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsCurrency;
       W_UNITEN := dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
       W_VLUNIT := dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
       W_VLSUBT := dm.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
       W_FLCANC := dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString;
       //
       Write   (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
       Writeln (Impressora, Format('%2s',    [W_FLCANC]));
       Write   (Impressora, Format('%-12.3f', [W_QTITEN]));
       Write   (Impressora, Format('%-11s', [W_UNITEN]));
       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
       Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));
       //
       M_NRITEM := M_NRITEM + 1;
       dm.cdsItensVendas.Next;
  End;
  //
  Writeln (Impressora,Format('%-48s', [Replicate('-',48)]));
  Writeln (Impressora,Format('%-30s', ['TOTAL........:   '])+ Format('%17s', [pnlTOMERC.caption]));
  Writeln (Impressora,Format('%-48s', [Replicate('-',48)]));
  If (edtDESVAL.Value > 0) Then
      Writeln(Impressora,Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',edtDESVAL.Value)]));
  // Imprime Total a Pagar
  Writeln(Impressora,Format('%-20s',['TOTAL A PAGAR..:    '])+Format('%15s',[txtTOVEND.caption]));
  // Salta tr�s linhas
  Writeln(Impressora);
  //Imprime Modalidades
  cdsModalidade.First;
  While not (cdsModalidade.Eof) do
  Begin
       If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
       Begin
         W_MNMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
         W_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
         //
         Write(Impressora,Format('%-20s',[ W_MNMODA + ' : ']));
         Writeln(Impressora,Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
       End;
       // Proximo
       cdsModalidade.Next;
  End;
  //Imprime troco
  Writeln(Impressora);
  Writeln(Impressora,Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]));
  // Salta tr�s linhas
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]));
  If uFuncoes.Empty(edtNMCLIE.Text) Then
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',48)]))
  Else
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC(edtNMCLIE.Text,48)]));
  // Salta Tr�s linhas
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  // Imprime separador
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]));
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']));
  // Salta uma linhas
  Writeln(Impressora);
  // Fecha a porta de impress�o
  System.Close(Impressora);          }
  // Abri o bloco de notas
  //Winexec(Pchar('NotePad.exe '+M_CAMINH),SW_SHOWNORMAL);
end;

procedure TfrmFormaPagamento.edtDESVALKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.edtDESPERKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.BUSCA_CLIENTE;
begin
     uFuncoes.FilterCDS(dmDados.cdsCliente, fsInteger, edtCDCLIE.Text);
     //
     If (dmDados.cdsCliente.IsEmpty) Then
     Begin
           Application.MessageBox(PChar('C�digo de cliente n�o cadastrado!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtNMCLIE.Enabled := True;
           edtNMCLIE.SetFocus;
     End
     Else
     Begin
          edtNMCLIE.Enabled := False;
          edtNMCLIE.text := dmDados.cdsClienteCLI_NOME.AsString;
          //
          GridModa.SetFocus;
     End;
     //
     edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
end;

procedure TfrmFormaPagamento.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          edtDESVAL.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
         BUSCA_CLIENTE;
end;

procedure TfrmFormaPagamento.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
         edtNMCLIE.Clear;
end;

procedure TfrmFormaPagamento.spLocClienteClick(Sender: TObject);
begin
      edtCDCLIE.SetFocus;
      Application.CreateForm(TfrmConsClientes, frmConsClientes);
      try
          frmConsClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                edtCDCLIE.Text :=
                    uFuncoes.StrZero(frmConsClientes.cdsConsultarCLI_CODIGO.AsString,7);
                //
                GridModa.SetFocus;
           End;
          //
          frmConsClientes.Free;
      End;
end;

procedure TfrmFormaPagamento.edtNMCLIEEnter(Sender: TObject);
begin
     edtNMCLIE.Clear; 
end;

procedure TfrmFormaPagamento.edtNMCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(edtNMCLIE.Text) Then
     Begin
          Key := #0;
          edtDESVAL.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.FormCreate(Sender: TObject);
begin
     M_FLSUPE := False;
     aFLTAXA  := 'N';
end;

procedure TfrmFormaPagamento.edtDESVALChange(Sender: TObject);
begin
     If not (uFrmMain.admin) Then
        edtDESVAL.ReadOnly := True
     Else
        edtDESVAL.ReadOnly := False;
end;

procedure TfrmFormaPagamento.edtDESPERChange(Sender: TObject);
begin
     If not (uFrmMain.admin) Then
        edtDESPER.ReadOnly := True
     Else
        edtDESPER.ReadOnly := False;
end;

procedure TfrmFormaPagamento.CRIAR_PARCELAS;
Var
    M_QTPARC : integer;
    M_TOMODA, M_VLPARC, M_VLDIFE, W_ULTIPC : Real;
begin
     If (dmDados.cdsParcelas.Active = False) Then
         dmDados.cdsParcelas.Open;
     //
     M_TOMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
     M_VLPARC := uFuncoes.Arredondar(M_TOMODA/W_TOTAPC,2);
     //
     M_VLDIFE := M_TOMODA-(M_VLPARC * W_TOTAPC);
     //
     If (M_VLDIFE < M_TOMODA) Then
       W_ULTIPC := M_VLPARC+M_VLDIFE;
     //
     dmDados.cdsParcelas.EmptyDataSet;
     //
     dmDados.cdsParcelas.DisableControls;
     For M_QTPARC := 1 to W_TOTAPC do
     Begin
          // Incluir
          dmDados.cdsParcelas.Append;
          dmDados.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger   := M_QTPARC;
          dmDados.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := IncMonth(Date,M_QTPARC);
          dmDados.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC;
          If (M_QTPARC <> W_TOTAPC) Then
              dmDados.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC
          Else
              dmDados.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := W_ULTIPC;
           //
          dmDados.cdsParcelas.Post;
     End;
     //
     dmDados.cdsParcelas.First;
     dmDados.cdsParcelas.EnableControls;
end;

procedure TfrmFormaPagamento.NotaFiscal2;
Var
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_QTITEN, W_UNITEN : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT : Real;
begin
  //
 { dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
      With ppRepItensVenda do
      Begin
           txtVENDA.Caption    := W_NRVEND;
           txtCLIENTE.Caption  := M_NMCLIE;
           txtVENDEDOR.Caption := M_NMVEND;
           txtCAIXA.Caption    := uFuncoes.StrZero(InttoStr(M_CDCAIX),3);
           txtTOTAL.Caption    := Format('%15s',[FormatFloat('###,##0.#0',StrtoFloat(pnlTOMERC.caption))]);
           //
           If (edtDESVAL.Value > 0) Then
           Begin
             txtPagamento.Lines.Add(Format('%-20s',['DESCONTO:']));
             txtPagamento2.Lines.Add(Format('%15s',[FormatFloat('###,##0.#0',edtDESVAL.Value)]));
           End;
           //
           txtPagamento.Lines.Add(Format('%-20s',['TOTAL A PAGAR:']));
           txtPagamento2.Lines.Add(Format('%15s',[FormatFloat('###,##0.#0',StrtoFloat(txtTOVEND.caption))]));
           txtPagamento.Lines.Add(' ');
           txtPagamento2.Lines.Add('');
           // Imprime Modalidades
           cdsModalidade.First;
           While not (cdsModalidade.Eof) do
           Begin
               If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
               Begin
                     W_MNMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
                     W_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                     //
                     txtPagamento.Lines.Add(Format('%-20s', [ W_MNMODA + ':']));
                     txtPagamento2.Lines.Add(Format('%-15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
               End;
               // Proximo
               cdsModalidade.Next;
            End;
            // Imprime troco
            If (M_VLTROC > 0) Then
            Begin
                txtPagamento.Lines.Add(' ');
                txtPagamento2.Lines.Add(' ');
                txtPagamento.Lines.Add(Format('%-20s',  ['TROCO:']));               //)+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))
                txtPagamento2.Lines.Add(Format('%-15s', [FormatFloat('###,##0.00', M_VLTROC)]));
            End;
           //
           PrintReport;
      End;     }
end;

procedure TfrmFormaPagamento.btnClienteClick(Sender: TObject);
Var
   W_CDCLIE : String;
begin
      W_CDCLIE := '';
      edtCDCLIE.SetFocus;
      Application.CreateForm(TfrmCadClientes, frmCadClientes);
      try
          frmCadClientes.ShowModal;
      Finally
          If not (frmConsClientes.cdsConsultar.IsEmpty) Then
           begin
                edtCDCLIE.Text :=
                    uFuncoes.StrZero(dmDados.cdsClienteCLI_CODIGO.AsString,7);
                //
                GridModa.SetFocus;
           End;
          //
          frmCadClientes.Free;
      End;
 { with TFrmClientes.create(self) do
  try
    showmodal;
  finally
    If not Empty(Dm.CdsClientesCLI_CODIGO.AsString) Then
      W_CDCLIE := Dm.CdsClientesCLI_CODIGO.AsString;
    //
    free;
    //
    edtCDCLIE.SetFocus;
    If not Empty(W_CDCLIE) Then
      begin
           edtCDCLIE.Text := W_CDCLIE;
           GridModa.SetFocus;
      End;
  end; }
end;

procedure TfrmFormaPagamento.edtAcrescimoExit(Sender: TObject);
begin
      If (edtAcrescimo.Value > M_TOVEND) Then
      begin
           Application.MessageBox(PChar('Valor de acr�scimo maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtAcrescimo.Value := 0;
           If (edtAcrescimo.CanFocus) Then
               edtAcrescimo.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.edtAcrescimoEnter(Sender: TObject);
begin
    { edtAcrescimo.Value := 0;
     edtDESVAL.Value    := 0;
     edtDESPER.Value    := 0;}
     cdsModalidade.EnableControls;
end;

procedure TfrmFormaPagamento.Acrescimo;
begin
     If (edtAcrescimo.Value > 0) Then
        M_TOVEND := M_VLLIMP + edtAcrescimo.Value;
end;

end.
