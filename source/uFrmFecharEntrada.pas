unit uFrmFecharEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DBXpress,
  DB, DBClient, FMTBcd, SqlExpr;

type
  TfrmFecharEntrada = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    edtVLMERC: TCurrencyEdit;
    Label9: TLabel;
    edtBASEICMS: TCurrencyEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtBASESUBS: TCurrencyEdit;
    Label12: TLabel;
    edtVLSUBST: TCurrencyEdit;
    Label13: TLabel;
    cmbTPFRETE: TComboBox;
    Label14: TLabel;
    edtVLFRETE: TCurrencyEdit;
    Label15: TLabel;
    edtVLIPI: TCurrencyEdit;
    Label16: TLabel;
    edtVLSEGURO: TCurrencyEdit;
    Label17: TLabel;
    edtDespesas: TCurrencyEdit;
    Label18: TLabel;
    edtDesconto: TCurrencyEdit;
    Label19: TLabel;
    edtVLNOTA: TCurrencyEdit;
    cdsEntrada: TClientDataSet;
    cdsEntradaENT_NUMERO: TIntegerField;
    cdsEntradaENT_LOJA: TIntegerField;
    cdsEntradaLOJ_NMLOJA: TStringField;
    cdsEntradaFOR_CODIGO: TIntegerField;
    cdsEntradaFOR_NOME: TStringField;
    cdsEntradaENT_DTPEDIDO: TDateField;
    cdsEntradaENT_DTEMISSAO: TDateField;
    cdsEntradaENT_DTRECEBIMENTO: TDateField;
    cdsEntradaENT_NRNOTA: TIntegerField;
    cdsEntradaENT_SERIENOTA: TStringField;
    cdsEntradaENT_VALORMERCADORIA: TCurrencyField;
    edtVLICMS: TCurrencyEdit;
    qryProdutos: TSQLQuery;
    cdsEntradaENT_TRANSPORTADORA: TIntegerField;
    Label20: TLabel;
    edtCDTRANSP: TEdit;
    Panel3: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    cdsEntradaENT_NMTRANSP: TStringField;
    spTransportadora: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    dbeDTPEDI: TMaskEdit;
    dbeDTEMISS: TMaskEdit;
    lbl_Transportadora: TEdit;
    procedure BtGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDTRANSPExit(Sender: TObject);
    procedure edtCDTRANSPKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDTRANSPChange(Sender: TObject);
    procedure edtVLMERCExit(Sender: TObject);
    procedure edtVLSUBSTExit(Sender: TObject);
    procedure edtVLIPIExit(Sender: TObject);
    procedure edtVLSEGUROExit(Sender: TObject);
    procedure edtDespesasExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtVLNOTAExit(Sender: TObject);
    procedure spTransportadoraClick(Sender: TObject);
  private
     function VALOR_NOTA() : Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecharEntrada: TfrmFecharEntrada;
  M_FLCANC, M_CDFORN : String;
  W_TOMERC, W_TOTIPI, W_TOICMS : Real;
  W_VALIPI, W_VLICMS : Real;

implementation

uses UdmDados, UFrmMain, uFrmCadEntradaMercadoria, uFuncoes, udmFinanceiro,
  uFrmLocFornecedor;

{$R *.dfm}

procedure TfrmFecharEntrada.BtGravarClick(Sender: TObject);
Var
   M_NRPEDI, M_NRENTR, M_CDLOJA, M_SEQPAG, W_NRSEQU, M_QTITEM, M_NRITEM : Integer;
   M_QTANTE, M_QTATUA : Double;
   M_CDPROD, M_HOMOVI : String;
   M_VLNOTA, M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
   M_VALIPI, M_VLICMS : Real;
   M_DTMOVI : TDate;
   iUsuario : Integer;
begin
//     ShowMessage('Modulo ainda não concluido!!!');
     If uFuncoes.Empty(cmbTPFRETE.Text) Then
     Begin
          Application.MessageBox(PChar('Selecione o tipo de frete!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbTPFRETE.SetFocus;
          Exit;
     End;
     //
     iUsuario := StrtoInt(uFrmMain.M_CDUSUA);
     DMDados.AbrirTabelaConfig;
     //
     Try
        DMDados.Start;
        //
        dmDados.CdsConfig.Edit;
        dmDados.CdsConfigCFG_SEQENTRADA.AsInteger := dmDados.CdsConfigCFG_SEQENTRADA.AsInteger +1;
        //dmDados.CdsConfigCFG_SEQUENCIA.AsInteger := dmDados.CdsConfigCFG_SEQUENCIA.AsInteger + 1;
        //
        M_NRENTR := dmDados.CdsConfigCFG_SEQENTRADA.AsInteger;
        //
        //W_NRSEQU := dmDados.CdsConfigCFG_SEQUENCIA.AsInteger;
        M_CDLOJA := 1;
        //cdsEntrada.FieldByName('ENT_LOJA').AsInteger;
        //
        dmDados.CdsConfig.Post;
        dmDados.CdsConfig.ApplyUpdates(0);
        //
        M_DTMOVI := Date();
        M_HOMOVI := TimetoStr(Time);
        M_VALIPI := edtVLIPI.Value;
        M_VLICMS := edtVLICMS.Value;
        //
        With dmFinanceiro.cdsEntradasProdutos do
        Begin
             Active := False;
             Params.ParamByName('pNUMERO').AsInteger  := M_NRENTR;
             Params.ParamByName('pLOJA').AsInteger    := M_CDLOJA;
             Active := True;
             //
             If (IsEmpty) Then
             Begin
                  Append;
                  FieldByName('ENT_NUMERO').AsInteger  := M_NRENTR;
                  FieldByName('ENT_LOJA').AsInteger    := M_CDLOJA;
                  FieldByName('ENT_DATAPEDIDO').AsDateTime  := cdsEntrada.FieldByName('ENT_DTPEDIDO').AsDateTime;
                  FieldByName('ENT_DATAENTRADA').AsDateTime := cdsEntrada.FieldByName('ENT_DTRECEBIMENTO').AsDateTime;
                  //FieldByName('ENT_NATUREZAOPERACAO').AsInteger  :=
                  FieldByName('ENT_DATAEMISSAONOTA').AsDateTime  := cdsEntrada.FieldByName('ENT_DTEMISSAO').AsDateTime;
                  FieldByName('ENT_FORNECEDOR').AsInteger   := cdsEntrada.FieldByName('FOR_CODIGO').AsInteger;
                  If not uFuncoes.Empty(edtCDTRANSP.Text) Then
                     FieldByName('ENT_TRANSPORTADORA').AsInteger := StrtoInt(edtCDTRANSP.Text);
                  FieldByName('ENT_NUMERONOTA').AsString    := uFuncoes.StrZero(cdsEntrada.FieldByName('ENT_NRNOTA').AsString,10);
                  FieldByName('ENT_SERIENOTA').AsString     := uFuncoes.StrZero(cdsEntrada.FieldByName('ENT_SERIENOTA').AsString,2);
                  FieldByName('ENT_VALORMERCADORIAS').AsCurrency   := edtVLMERC.Value;
                  If (cmbTPFRETE.Text = 'FOB' ) Then
                      FieldByName('ENT_TIPOFRETE').AsString := 'F'
                  Else
                      FieldByName('ENT_TIPOFRETE').AsString := 'C';
                  FieldByName('ENT_VALORFRETE').AsCurrency  := edtVLFRETE.Value;
                  FieldByName('ENT_BASECALCULOICMS').AsCurrency   := edtBASEICMS.Value;
                  FieldByName('ENT_VALORICMS').AsCurrency         := edtVLICMS.Value;
                  FieldByName('ENT_BASECALCULOSUBSTITUICAO').AsCurrency := edtBASESUBS.Value;
                  FieldByName('ENT_VALORSUBSTITUICAO').AsCurrency := edtVLSUBST.Value;
                  FieldByName('ENT_VALORIPI').AsCurrency          := edtVLIPI.Value;
                  FieldByName('ENT_VALORSEGURO').AsCurrency       := edtVLSEGURO.Value;
                  FieldByName('ENT_OUTRASPESPESAS').AsCurrency    := edtDespesas.Value;
                  FieldByName('ENT_VALORDESCONTO').AsCurrency     := edtDesconto.Value;
                  FieldByName('ENT_VALORNOTA').AsCurrency         := edtVLNOTA.Value;
                  FieldByName('ENT_SITUACAO').AsString            := 'F';
                  FieldByName('ENT_USUARIO').AsInteger            := StrtoInt(uFrmMain.M_CDUSUA);
                  // Grava
                  Post;
                  ApplyUpdates(0);
             End;
        // Estoque
        dmFinanceiro.cdsProdutosEntrada.DisableControls;
        dmFinanceiro.cdsProdutosEntrada.First;
        //
        M_QTITEM := 1;
        While not (dmFinanceiro.cdsProdutosEntrada.Eof) do
        Begin
              M_CDPROD := uFuncoes.StrZero(dmFinanceiro.cdsProdutosEntrada.FieldByName('PRO_CODIGO').AsString,13);
              // Tabela ProdutoEntradas
              With dmFinanceiro.cdsItensEntrada do
              Begin
                   Active  := False;
                   Params.ParamByName('pNUMERO').AsInteger  := M_NRENTR;
                   Params.ParamByName('pPRODUTO').AsString  := M_CDPROD;
                   Params.ParamByName('pITEM').AsInteger    := M_QTITEM;
                   Active  := True;
                   //
                   If (IsEmpty) Then
                   Begin
                        Append;
                        FieldByName('ENP_NUMERO').AsInteger    := M_NRENTR;
                        FieldByName('ENP_PRODUTO').AsString  := uFuncoes.StrZero(dmFinanceiro.cdsProdutosEntrada.FieldByName('PRO_CODIGO').AsString,13);
                        FieldByName('ENP_NRITEM').asInteger    := M_QTITEM;
                        FieldByName('ENP_UNDPRO').AsString     := dmFinanceiro.cdsProdutosEntrada.FieldByName('UNI_DESCRICAO').AsString;
                        FieldByName('ENP_QUANTIDADE').AsFloat  := dmFinanceiro.cdsProdutosEntrada.FieldByName('ENP_QUANTIDADE').AsFloat;
                        FieldByName('ENP_VALOR').AsCurrency    := dmFinanceiro.cdsProdutosEntrada.FieldByName('ENP_VALOR').AsCurrency;
                        FieldByName('ENP_IPI').AsCurrency      := dmFinanceiro.cdsProdutosEntrada.FieldByName('ENP_IPI').AsCurrency;
                        FieldByName('ENP_ICMS').AsCurrency     := dmFinanceiro.cdsProdutosEntrada.FieldByName('ENP_ICMS').AsCurrency;
                        Post;
                        ApplyUpdates(0);
                   End;
              End;
              //  Tabela de estoque
              With dmDados.cdsEstoque do
              Begin
                     Active := False;
                     //CommandText := 'Select * from ESTOQUE Where (EST_CDLOJA = :pLOJA) and (EST_CDPRODUTO = :pCODIGO)';
                     //
                     Params.ParamByName('pCDLOJA').AsInteger := M_CDLOJA;
                     Params.ParamByName('pCDPROD').AsString  := M_CDPROD;
                     Active := True;
              End;
              // Tabela de Estoque
              M_QTANTE := 0;
              If (dmDados.cdsEstoque.IsEmpty) Then  // Se não encontrar
                begin
                     dmDados.cdsEstoque.Append;
                     dmDados.cdsEstoque.FieldByName('EST_CDLOJA').AsInteger     := M_CDLOJA;
                     dmDados.cdsEstoque.FieldByName('EST_CDPROD').AsString   := uFuncoes.StrZero(M_CDPROD,13);
                     dmDados.cdsEstoque.FieldByName('EST_UNPROD').AsString      := dmFinanceiro.cdsItensEntradaENP_UNDPRO.AsString;
                     dmDados.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
                     dmDados.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := dmFinanceiro.cdsItensEntradaENP_QUANTIDADE.AsFloat;
                     dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                             dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat +
                             dmFinanceiro.cdsItensEntradaENP_QUANTIDADE.AsFloat;
                     M_QTATUA := dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     //
                     dmDados.cdsEstoque.ApplyUpdates(0);
                End
                Else
                Begin
                     dmDados.cdsEstoque.Edit;
                     //
                     M_QTANTE := dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     //
                     dmDados.cdsEstoque.FieldByName('EST_DTENTRADA').AsDateTime := M_DTMOVI;
                     dmDados.cdsEstoque.FieldByName('EST_QUANTENTRADA').AsFloat := dmFinanceiro.cdsItensEntradaENP_QUANTIDADE.AsFloat;
                     dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                             dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat + dmFinanceiro.cdsItensEntradaENP_QUANTIDADE.AsFloat;
                     M_QTATUA := dmDados.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                     //
                     dmDados.cdsEstoque.ApplyUpdates(0);
                End;
                // Tabela de historico
                {With dmDados.cdsHistorico do
                Begin
                     Active := False;
                     CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                   +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                     Params.ParamByName('pSEQUENCIA').AsInteger := W_NRSEQU;
                     Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                     Params.ParamByName('pPRODUTO').AsString    := M_CDPROD;
                     Active := True;
                End;}
                //
                uFuncoes.FilterCDS(DMDados.cdsProduto, fsString, M_CDPROD);
                //
                {If not (DMDados.cdsProduto.IsEmpty) Then
                begin
                     M_VLCOMP     := DMDados.cdsProduto.FieldByName('PRO_VLCOMPRA').AsCurrency;
                     M_VLCUST     := DMDados.cdsProduto.FieldByName('PRO_VLCUSTO').AsCurrency;
                     M_VLVENDPRO  := DMDados.cdsProduto.FieldByName('PRO_VLVENDA').AsCurrency;
                End
                Else
                Begin
                     M_VLCOMP     := 0;
                     M_VLCUST     := 0;
                     M_VLVENDPRO  := 0;
                End; }
                //
                M_VLCOMP := dmDados.cdsProdutoPRO_VLCOMPRA.AsFloat;
                M_VLVENDPRO := dmDados.cdsProdutoPRO_VLVENDA.AsFloat;
                //  iLOJA, iNRITEM,
                //  iDOCUMENTO, iUSUARIO, iMOTIVO: Integer; aPRODUTO, aUNIDADE, aHORA,
                //  aTIPO: String; aDATA: TDateTime; fANTERIOR, fMOVIMENTO, fATUAL,
                //  fVLCOMPRA, fVLVENDA: Double
                dmDados.AddHistoricoProduto2(M_CDLOJA, M_QTITEM, 0, iUsuario, 0, M_CDPROD, dmFinanceiro.cdsItensEntradaENP_UNDPRO.AsString,
                    M_HOMOVI, 'E', M_DTMOVI, M_QTANTE, dmFinanceiro.cdsItensEntradaENP_QUANTIDADE.AsFloat, M_QTATUA, M_VLCOMP, M_VLVENDPRO);
                //
                If not (dmDados.IncluirTarefaUsuario( iUsuario,
                     'Entrada de estoque do produto : '+M_CDPROD+' *F*')) Then
                      ShowMessage('Erro ao adicionar tarefa do usuário.');
              // Proximo
              M_QTITEM := M_QTITEM + 1;
              dmFinanceiro.cdsProdutosEntrada.Next;
        End;   // Fim-do enquanto
        //
        dmFinanceiro.cdsProdutosEntrada.EnableControls;
        //
        End;
        //
        DMDados.Comit(Transc);
        //
        Application.MessageBox(PChar('Entrada de Mercadoria realizada com sucesso!!!'),
                      'CONCLUÍDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        //
        dmFinanceiro.cdsProdutosEntrada.EmptyDataSet;
        dmFinanceiro.cdsProdutosEntrada.Close;
        //
        Close;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmDados.Rollback;
           //
           Close;
        End;
     End;
end;

procedure TfrmFecharEntrada.FormActivate(Sender: TObject);
begin
     lbl_Transportadora.Clear;
     //
     dbeDTEMISS.Text := cdsEntrada.FieldByName('ENT_DTEMISSAO').AsString;
     dbeDTPEDI.Text  := cdsEntrada.FieldByName('ENT_DTPEDIDO').AsString;
     //dbeDTRECE.Text  := cdsEntrada.FieldByName('ENT_DTRECEBIMENTO').AsString;
     //
     W_TOMERC        := cdsEntrada.FieldByName('ENT_VALORMERCADORIA').AsCurrency;
     edtBASEICMS.Value := W_TOICMS;
     edtVLICMS.Value   := W_VLICMS;
     edtVLIPI.Value    := M_VALIPI;
     edtVLMERC.Value := cdsEntrada.FieldByName('ENT_VALORMERCADORIA').AsCurrency;
     edtVLNOTA.Value := VALOR_NOTA();
     //
     edtCDTRANSP.SetFocus;
end;

procedure TfrmFecharEntrada.BtCancelarClick(Sender: TObject);
begin
     M_FLCANC := 'S';
     Close;
end;

procedure TfrmFecharEntrada.FormCreate(Sender: TObject);
begin
      M_FLCANC := 'N';
end;

procedure TfrmFecharEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin
{  if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;}
end;

procedure TfrmFecharEntrada.edtCDTRANSPExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDTRANSP.Text) Then
     Begin
          If not (dmDados.ProcurarValor(edtCDTRANSP.Text, 'FOR_CODIGO', 'FORNECEDORES')) Then
           begin

              Application.MessageBox(PChar('Transportadora não cadastrado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_Transportadora.Clear;
              edtCDTRANSP.Clear;
              edtCDTRANSP.SetFocus;
              Exit;
           End
           Else
           Begin
                lbl_Transportadora.Text := DMDados.GetNomeForn(StrtoInt(edtCDTRANSP.Text));
                edtCDTRANSP.Text := uFuncoes.StrZero(edtCDTRANSP.Text,5);
                edtBASEICMS.SetFocus;
           End;
           //
     End;
end;

procedure TfrmFecharEntrada.edtCDTRANSPKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (Key = #13) and uFuncoes.Empty(edtCDTRANSP.Text) Then
    Begin
         key:=#0;
         spTransportadoraClick(Sender);
    End;
    //
    If (Key = #13) and not uFuncoes.Empty(edtCDTRANSP.Text) Then
    Begin
         key:=#0;
         edtVLMERC.SetFocus;
    End;
end;

procedure TfrmFecharEntrada.edtCDTRANSPChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDTRANSP.Text) Then
       lbl_Transportadora.Clear;
end;

function TfrmFecharEntrada.VALOR_NOTA: Real;
begin
     result := (edtVLMERC.Value + edtVLIPI.Value + edtVLSUBST.Value
              + edtVLSEGURO.Value + edtDespesas.Value) - edtDesconto.Value; 
end;

procedure TfrmFecharEntrada.edtVLMERCExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLSUBSTExit(Sender: TObject);
begin
      edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLIPIExit(Sender: TObject);
begin
      edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLSEGUROExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtDespesasExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtDescontoExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.edtVLNOTAExit(Sender: TObject);
begin
     edtVLNOTA.Value := VALOR_NOTA();
end;

procedure TfrmFecharEntrada.spTransportadoraClick(Sender: TObject);
begin
      edtCDTRANSP.SetFocus;
      Application.CreateForm(TfrmConsFornecedor, frmConsFornecedor);
      try
          frmConsFornecedor.ShowModal;
      Finally
          If not (frmConsFornecedor.cdsConsultar.IsEmpty) Then
           begin
               edtCDTRANSP.Text := uFuncoes.StrZero(frmConsFornecedor.cdsConsultarFOR_CODIGO.AsString,5);
               edtVLMERC.SetFocus;
           End;
          frmConsFornecedor.Free;
      End;
end;

end.
