unit uFuncoes;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, Graphics,
StdCtrls, Mask,Db, DBTables,DBIProcs,TypInfo,WinProcs, ExtCtrls,
DBXpress, SqlExpr, DBClient, Provider, uFrmMain, DateUtils,
uFormaPagamento, udmFinanceiro;


type
   TTypeLocalizar = (fsInteger, fsString);

// Funcões e procedures para o sistema.

Function StrZero(Zeros:string;Quant:integer):String;
Function StrAsterisco(Asterisco:string;Quant:integer):String;
Procedure Limpar_Status;
function Empty(inString:String): Boolean;
Function Codifica( const Str1: string): String;
Function SysComputerName: string;
Function ContaCaracs(Edit:String): integer;
Function Replicate( Caracter:String; Quant:Integer ): String;
Function CPF(num: string): boolean;
Function CGC(num: string): boolean;
Function Alltrim(const Search: string): string;
Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
Function DataExtenso(Data:TDateTime): String;
Function MesExtenso (xMes : TDateTime) : string;
function StrToPChar(const Str: string): PChar;
Function Arredondar(Valor: Double; Dec: Integer): Double;
Function tbReplChar(const Ch: Char; const Len: integer): string;
Function Padr(s:string;n:integer):string;
function PadC(S:string;Len:byte):string;
Function Justifica(mCad:string;mMAx:integer):string;
function extenso (valor: real): string;
function Maiuscula(Texto:String): String;
Function DiadaSemana(Data : String) : string;
Function OnLine(Porta:Word):Boolean;
Function EsvaziaTabela(Tabela : TTable): Boolean;
function RemoveChar(Const Texto:String):String;
function StrIsFloat(const S: string): boolean;
function StrIsInteger(const S: string): boolean;
function CalculaCnpjCpf(Numero : String) : String;
function FormataCPF(cTexto : String) : String;
function FormataCNPJ(CNPJ: string): string;
function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
function mvcodigo(campo,tabela:string):integer;
function mvcodigomax(campo,tabela:string):integer;
function mscodigo(campo,tabela:string):string;
function Buscar_Dados_Str(campo, valor, tabela : String): boolean;
function RemoveVirgula(Str:String): String;
function IDTransation : String;
Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
procedure RefreshCDS(aDateSet : TClientDataSet);
function tbPadC(const S: string; const Len: integer; const Ch: Char): string;
Function AnoBiSexto(Ayear: Integer): Boolean;
Function DiasPorMes(Ayear, AMonth: Integer): Integer;
Function Validar_Data(M_DATA : String): boolean;
Function FormatarData(M_DATA : String): TDate;
Function FormatarMesReferencia(M_DATA : TDate): String;
Function FormatarDataAno(M_DATA : String): String;
function Gerapercentual(valor:real;Percent:Real):real;
function FormataCep(M_NUNCEP : string) : String;
Function Calcula_Percentual(M_VALOR1, M_VALOR2 : Double) : Double;
Function Calcula_Quantidade_Parcela(M_VALOR, M_VLPARC : Double) : Double;
Function Acrescentar_Dias_Data(M_DATA : TDate) : TDate;
Function Numero_Doc_Caixa(M_NRNOSS : String) : String;
function FormataFONE(sFONE: string): string;
function RetirarCarecterAtalho(const texto : string) : string;
Function retornaProximoCodigoMenu : integer;
function retornarCodMenu(const textoMenu : String) : Integer;
Function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
Function CopiarArquivo(aOrigem, aDestino : String) : boolean;
Function DigitoNossoNumero(aVal1:Double; aVal2, aVal3 : integer) : String;
function Data_Juliana (Data_Atual: TDateTime): String;
function CalcularJuros(ValorParcela, pJuros, pMulta : Double): Double;
Procedure MesesEntreDatas(DataFinal,DataInicial : TDate; var Anos,Meses,Dias : Integer);
Function StrToReal(inString :String): Real;
function mvExameitem(iExame : integer; campo,tabela:string):integer;
function Idade(Nasc : TDate) : String;
Function StrPontos(Pontos : string;Quant:integer):String;
Procedure MODALIDADES;
function PASTA_CUPOM(M_CDUSUA : Integer) : String;
Procedure CRIAR_PARCELAS(M_VLMODA : Double; M_QTPARC : Integer);
function DifHora(Inicio,Fim : String):String;
function AdicionaHora(TimeAdd: Integer) : String;


const
    MSG_OK   = 'Registro gravado com sucesso.';
    MSG_ERRO = 'Erro ao tentar gravar registro.';
    MSG_PERGUTA = 'Deseja excluir este registro?';
    MSG_PERMISSOES = 'Você não tem pemissão para isto';
    MSG_ERROR = 'Ocorreu um erro!';


implementation

uses uDMDados;


function CalculaCnpjCpf(Numero : String) : String;
var
  i,j,k, Soma, Digito : Integer;
  CNPJ : Boolean;
begin
  Result := Numero;
  case Length(Numero) of
  9:
  CNPJ := False;
  12:
  CNPJ := True;
  else
  Exit;
  end;
  for j := 1 to 2 do
  begin
  k := 2;
  Soma := 0;
  for i := Length(Result) downto 1 do
  begin
  Soma := Soma + (Ord(Result[i])-Ord('0'))*k;
  Inc(k);
  if (k > 9) and CNPJ then
  k := 2;
  end;
  Digito := 11 - Soma mod 11;
  if Digito >= 10 then
  Digito := 0;
  Result := Result + Chr(Digito + Ord('0'));
  end;
end;

function FormataCPF(cTexto : String) : String;
begin
     //  999.999.999-99
     result := Copy(cTexto,1,3)+'.'+
               Copy(cTexto,4,3)+'.'+
               Copy(cTexto,7,3)+'-'+
               Copy(cTexto,10,2);
end;

function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
   OBJETIVO: Eliminar caracteres inválidos e acrescentar caracteres à esquerda ou à direita do texto original para que a string resultante fique com o tamanho desejado

   Texto : Texto original
   TamanhoDesejado: Tamanho que a string resultante deverá ter
   AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda
      TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
             Se o tamanho do texto form MAIOR que o desejado, eliminar primeiros caracteres do texto
      FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à esquerda
             Se o tamanho do texto form MAIOR que o desejado, eliminar últimos caracteres do texto
   CaracterAcrescentar: Carácter que deverá ser acrescentado
}
var
   QuantidadeAcrescentar,
   TamanhoTexto,
   PosicaoInicial,
   i : integer;

begin
   case CaracterAcrescentar of
      '0'..'9','a'..'z','A'..'Z' : ;{Não faz nada}
      else
         CaracterAcrescentar := ' ';
   end;

   Texto := Trim(Texto);
   TamanhoTexto := Length(Texto);
   for i := 1 to (TamanhoTexto) do
   begin
      if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
      begin
         case Texto[i] of
            'á','Á' : Texto[i] := 'A';
            'é','É' : Texto[i] := 'E';
            'í','Í' : Texto[i] := 'I';
            'ó','Ó' : Texto[i] := 'O';
            'ú','Ú' : Texto[i] := 'U';
            'à','À' : Texto[i] := 'A';
            'è','È' : Texto[i] := 'E';
            'ì','Ì' : Texto[i] := 'I';
            'ò','Ò' : Texto[i] := 'O';
            'ù','Ù' : Texto[i] := 'U';
            'â','Â' : Texto[i] := 'A';
            'ê','Ê' : Texto[i] := 'E';
            'î','Î' : Texto[i] := 'I';
            'ô','Ô' : Texto[i] := 'O';
            'û','Û' : Texto[i] := 'U';
            'ä','Ä' : Texto[i] := 'A';
            'ë','Ë' : Texto[i] := 'E';
            'ï','Ï' : Texto[i] := 'I';
            'ö','Ö' : Texto[i] := 'O';
            'ü','Ü' : Texto[i] := 'U';
            'ç','Ç' : Texto[i] := 'C';
            'ñ','Ñ' : Texto[i] := 'N';
            else Texto[i] := ' ';
         end;
      end;
   end;

   QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
   if QuantidadeAcrescentar < 0 then
      QuantidadeAcrescentar := 0;
   if CaracterAcrescentar = '' then
      CaracterAcrescentar := ' ';
   if TamanhoTexto >= TamanhoDesejado then
      PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
   else
      PosicaoInicial := 1;

   if AcrescentarADireita then
      Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
   else
      Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

   Result := AnsiUpperCase(Texto);
end;

function RemoveChar(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] in ['0'..'9']) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
result := S;
end;

function StrIsInteger(const S: string): boolean;
// Verificar se uma string contém um valor inteiro válido
begin
  try
  StrToInt(S);
  Result := true;
  except
  Result := false;
  end;
end;


function StrIsFloat(const S: string): boolean;
// Verificar se uma string contém um valor numérico válido
begin
  try
  StrToFloat(S);
  Result := true;
  except
  Result := false;
  end;
end;

Function StrPontos(Pontos : string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := Pontos;
  Tamanho := length(Pontos);
  Pontos:='';
  for I:=1 to quant-tamanho do
  Pontos:=Pontos + '.';
  aux := aux + Pontos;
  StrPontos := aux;
end;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

Function StrAsterisco(Asterisco:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := Asterisco;
  Tamanho := length(Asterisco);
  Asterisco:='';
  for I:=1 to quant-tamanho do
    Asterisco:=Asterisco + '*';
  aux := Asterisco + aux;
  StrAsterisco := aux;
end;

Function Padr(s: string; n: integer): string;
{alinha uma string à direita}
begin
       Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;


Function tbReplChar(const Ch: Char; const Len: integer): string;
var
  I: integer;
begin
  SetLength(Result, Len);
  for I := 1 to Len do
  Result[I] := Ch;
end;


Procedure Limpar_Status;
begin
     {frmMain.Info.Panels[2].Text := ' ';
     frmMain.Info.Panels[1].Text := '';}
end;

function Empty(inString:String): Boolean;
{Testa se a variavel está vazia ou não}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;

Function Codifica( const Str1: string): String;
{Encripta uma string}
var
Mascara,Str2: String;
PonM, PonS: Byte;
begin
Mascara := '#$%$'#13#12;
Str2 := '';
PonM := 1;
for PonS:=1 to length(Str1) do
  begin
  AppendStr( Str2, Chr( Ord(Str1[PonS]) Xor Ord(Mascara[PonM])));
  Inc( PonM);
  if PonM>Length(Mascara) then
  begin
  PonM:=1;
  end;
  Result := Str2;
  end;
end;

{ Sys }
function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

Function ContaCaracs(Edit: String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
     Result := Length(Edit);
end;

function Replicate(Caracter: String; Quant: Integer): String;
{Repete o mesmo caractere várias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;

Function CPF(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  cpf:=true
  else
  cpf:=false;
end;

function cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

Function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
End;

Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acresçida de mais um certo número de dias
//
var dw:integer;
Begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 7)*2;
End;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'domingo';
  DiaDasemana [2]:= 'segunda-feira';
  DiaDasemana [3]:= 'terça-feira';
  DiaDasemana [4]:= 'quarta-feira';
  DiaDasemana [5]:= 'quinta-feira';
  DiaDasemana [6]:= 'sexta-feira';
  DiaDasemana [7]:= 'sábado';
{ Meses do ano }
  Meses [1] := 'janeiro';
  Meses [2] := 'fevereiro';
  Meses [3] := 'março';
  Meses [4] := 'abril';
  Meses [5] := 'maio';
  Meses [6] := 'junho';
  Meses [7] := 'julho';
  Meses [8] := 'agosto';
  Meses [9] := 'setembro';
  Meses [10]:= 'outubro';
  Meses [11]:= 'novembro';
  Meses [12]:= 'dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result :=  IntToStr(Dia) +' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)+'.';
  //DiaDaSemana[NoDia] + ', '
end;

Function MesExtenso (xMes : TDateTime) : string;
Var
Dia, Mes, Ano : Word;
begin
Mes := 0;
DecodeDate (xMes, Ano, Mes, Dia);
{Try
Mes := Round (xMes);
Except
End;}
case Mes of
1: Result := 'JAN';
2: Result := 'FEV';
3: Result := 'MAR';
4: Result := 'ABR';
5: Result := 'MAI';
6: Result := 'JUN';
7: Result := 'JUL';
8: Result := 'AGO';
9: Result := 'SET';
10: Result := 'OUT';
11: Result := 'NOV';
12: Result := 'DEZ';
else
Result := '';
end;
end;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end
  else
  begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
  StrPCopy(Result,Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
end;

Function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

Function Justifica(mCad:string;mMAx:integer):string;
var
mPos,mPont,mTam,mNr,mCont:integer;
mStr:string;
begin
mTam:=Length(mCad);
if mTam>=mMax then
Result:=copy(mCad,1,mMax)
else
mStr:='';
mCont:=0;
mPont:=1;
mNr:=mMax-mTam;
while mCont<mNr do
begin
mPos:=pos(mStr,copy(mCad,mPont,100));
if mPos=0 then
begin
mStr:=mStr+' ';
mPont:=1;
continue;
end
else
begin
mCont:=mCont+1;
Insert(' ',mCad,mPos+mPont);
mPont:=mPont+mPos+length(mStr);
end;
Result:=mCad;
end;
end;

function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;



function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor está fora do intervalo permitido.';
  msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+' e ';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo'
 else
  Result:=Result+' Centavos';
end;
end;

function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para
maiuscula e as restantes para minuscula}
var
OldStart: Integer;
begin
if Texto <> '' then
  begin
  Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
  Result := Texto;
  end;
end;

Function DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sabado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

Function OnLine(Porta:Word):Boolean;
// Verificar se Impressora esta Conectada
Const
    Portas :Byte = $02;
Var
    Res :Byte;
Begin
    { Código em Assembler }
    Asm
        mov ah,Portas; {Requisita o acesso as portas}
        mov dx,Porta;{Define a porta de teste}
        Int $17; {Chama a interrupção de Impressora}
        mov Res,ah; {Guarda em Res o resultado da operação }
    end;
    Result := (Res and $80) = $80; {Testa o valor de saída}
End;

function EsvaziaTabela(Tabela : TTable): Boolean;
// Esvazia a tabela passada como parametro
var
lExclusivo : boolean;
begin
Tabela.Active := False;
repeat
try
  Tabela.Exclusive := True;
  Tabela.Active := True;
  Tabela.EmptyTable;
  lExclusivo := True;
  Break;
except
  on EDatabaseError do
  if MessageDlg('A tabela está sendo usada por outro usuário. Tenta novamente ?', mtError,[mbOK, mbCancel], 0) <> mrOK then
  begin
  lExclusivo := False;
  raise;
  end;
  end;
until False;
Result := lExclusivo;
end;

function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
var arq: TextFile;
linha: String;
begin
AssignFile ( arq, nomeDoArquivo );
Reset ( arq );
ReadLn ( arq, linha );
while not Eof ( arq ) do
begin
{ Processe a linha lida aqui. }
{ Para particionar a linha lida em pedaços, use a função Copy. }
ReadLn ( arq, linha );
end;
CloseFile ( arq );
result := linha;
end;


function mvcodigo(campo, tabela: string): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := DMDados.sqlConexao;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
end;

function mvcodigomax(campo,tabela:string):integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select max('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlConexao;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
End;    

function mscodigo(campo, tabela: string): string;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlConexao;
      sql.Add(texto);
      open;
      result := fields[0].AsString;
    finally
      free;
    end;
end;

function NOME_PASTA(M_CDUSUA : String): String;
var qraux : TSQLquery;
    texto : string;
begin
{  texto := 'Select SEN_CODIGO, SEN_PASTA from USUARIOS Where (SEN_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.dmDados;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := M_CDUSUA;
      open;
      result := fields[1].AsString;
    finally
      free;
    end;}
End;

function Buscar_Dados_Str(campo, valor, tabela : String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
{  texto := 'Select '+campo+' from '+tabela + ' Where ('+ campo +' = :'+campo+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.dmDados;
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName(campo).AsString := valor;
      open;
      if not (IsEmpty) Then
          Result := True
      Else
          Result := False;
    finally
      free;
    end;}
End;


Function Verificar_Status() : Boolean;
Var
   M_NMPAST : String;
begin
    //M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
    //
    M_NMPAST := M_NMPAST + '\status.txt';
    //
    If FileExists(M_NMPAST) Then
        Result := True
    Else
        Result := False;
End;

Procedure Criar_Status(W_NMARQU : string);
var
  status_saida : textfile;
  M_NMPAST : String;
begin
  //M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  try
      if FileExists(M_NMPAST + '\'+W_NMARQU) then
      begin
          AssignFile(status_saida, M_NMPAST + '\status.ret');
          if not FileExists(M_NMPAST + '\status.ret') then
             Rewrite ( status_saida )
          Else
             reset(status_saida);
          DeleteFile(PChar(M_NMPAST + '\'+W_NMARQU));
      End;
  finally
        CloseFile(status_saida);
  end;
End;

Function Criar_Retorno_Venda(M_STATUS, M_NRVEND : string) : boolean;
var
  status : textfile;
  M_NMPAST : String;
begin
  //M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  try
          if FileExists(M_NMPAST + '\venda.ret') then
             deletefile(PChar(M_NMPAST + '\venda.ret'));
          //
          AssignFile(status, M_NMPAST + '\venda.ret');
          Rewrite(status);
          Append(status);
          //
          if (M_STATUS = 'S')  then
               Writeln(status, M_NRVEND)
          Else
               Writeln(status, M_NRVEND);
          //
          {if (M_STATUS = 'S')  then
               Writeln(status, 'OK')
          Else
               Writeln(status, 'ERRO');}
  finally
        if FileExists(M_NMPAST + '\venda.txt') then
            DeleteFile(PChar(M_NMPAST + '\venda.txt'));
        CloseFile(status);
  end;
End;

function RemoveVirgula(Str:String): String;
Const
    ComVirgula = ',';
    ComPonto = '.';
Var
    x : Integer;
    valor : string;
Begin
    For x := 1 to Length(Str) do
      if (Str[x] = ComVirgula) Then
        valor := valor + ComPonto
      Else
        valor := valor + Str[x];
    Result := valor;
end;

function IDTransation : String;
Var
  i : integer;
Const
  srt = '0123456789';
begin
     for i := 1 to 2 do
      begin
           Randomize;
           Result := Result + srt[Random(Length(srt))+1];
      End;
End;

procedure RefreshCDS(aDateSet : TClientDataSet);
begin
     aDateSet.Close;
     aDateSet.Open;
End;

Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
End;

function tbPadC(const S: string; const Len: integer; const Ch: Char): string;
var
  I, J: integer;
  Pad: string;
  Impar: boolean;
begin
  I := Length(S);
  if I < Len then begin
  J := Len - I;
  Impar := J mod 2 = 1;
  J := J div 2;
  Pad := tbReplChar(Ch, J);
  Result := Pad + S + Pad;
  if Impar then
  Result := Result + Ch;
  end else if I > Len then begin
  J := I - Len;
  Impar := J mod 2 = 1;
  J := J div 2;
  Result := S;
  Delete(Result, I-J+1, J);
  Delete(Result, 1, J);
  if Impar then begin
  Dec(I, J * 2);
  Delete(Result, I, 1);
  end;
  end else
  Result := S;
end;

function AnoBiSexto(Ayear: Integer): Boolean;
begin
// Verifica se o ano é Bi-Sexto
Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or
(AYear mod 400 = 0));
end;


function DiasPorMes(Ayear, AMonth: Integer): Integer;
const DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
    Result := DaysInMonth[AMonth];
    if (AMonth = 2) and AnoBiSexto(AYear) then
        Inc(Result);
end;

Function Validar_Data(M_DATA : String): boolean;
begin
    try
        StrToDate(M_DATA);
        result := True;
    except
        result := False;
        {on EConvertError do
         begin
             ShowMessage ('Data Inválida!');
         End;}
    end;      
End;

Function FormatarData(M_DATA : String): TDate;
begin
     Result := StrtoDate(M_DATA);
End;

function Gerapercentual(valor:real;Percent:Real):real;
// Retorna a porcentagem de um valor
begin
percent := percent / 100;
try
  valor := valor * Percent;
finally
  result := valor;
end;
end;
  
Function FormatarMesReferencia(M_DATA : TDate): String;
begin
    Result := Copy(DatetoStr(M_DATA),4,7);
end;

Function FormatarDataAno(M_DATA : String): String;
begin
    Result := Copy(M_DATA,7,4);
end;

function FormataCep(M_NUNCEP : string) : String;
Begin
     Result := Copy(M_NUNCEP,1,5)+'-'+Copy(M_NUNCEP,6,3);
End;

Function Calcula_Percentual(M_VALOR1, M_VALOR2 : Double) : Double;
begin
     Result := Arredondar((M_VALOR1/M_VALOR2)*100,2);
end;

Function Calcula_Quantidade_Parcela(M_VALOR, M_VLPARC : Double) : Double;
Begin
     Result := Arredondar((M_VALOR/M_VLPARC),2);
End;

Function Acrescentar_Dias_Data(M_DATA : TDate) : TDate;
Var
   M_DIA, M_DIA_MES : Integer;
   Ano, Mes, Dia : word;
BEGIN
     DecodeDate (M_Data, Ano, Mes, Dia);
     //
     M_DIA := StrtoInt(Copy(DatetoStr(M_DATA),1,2));
     //
     M_Data := IncDay(M_Data, 10);
     {If (M_DIA + 10 <= M_ULTIMO_DIA) Then
         M_DIA := M_DIA + 10
     Else
         M_DIA :=}
     {If (M_DIA < 10) Then
      begin
           M_DIA_MES :=
      End
     Else
         M_DIA := M_DIA + 10;}
     //
     Result := M_Data;
     //StrtoDate(InttoStr(M_DIA)+Copy(DatetoStr(M_DATA),3,8));
End;

Function Numero_Doc_Caixa(M_NRNOSS : String) : String;
Begin
     result := Copy(M_NRNOSS,7,6) + Copy(M_NRNOSS,16,3);
End;

function FormataCNPJ(CNPJ: string): string;
begin
  Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+
    Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;

function FormataFONE(sFONE: string): string;
Begin
     // 99 9999 9999
     result := '('+Copy(sFONE,1,2)+')'
                  +Copy(sFONE,3,4)+'-'
                  +Copy(sFONE,7,4);
End;

function PadC(S:string;Len:byte):string;
// Centraliza uma string em um espaço determinado
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then
  begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do
  begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do
  begin
  str := str+s[L];
  end;
 Result := str;
end;

function RetirarCarecterAtalho(const texto : string) : string;
Var
  i, tamanho : integer;
begin
     tamanho := Length(texto);
     for i := 1 to tamanho do
      if texto[i] <> '&' then
        Result := Result + texto[i];
End;

function retornaProximoCodigoMenu : integer;
begin
     with frmMain.dataSetAux do
      begin
           close;
           commandtext :=
            'Select Max(MEN_CODIGO) AS MAIOR FROM MENUS';
           Open;
           Result := Fields[0].AsInteger + 1;
      End;
End;


function retornarCodMenu(const textoMenu : String) : Integer;
begin
     with frmMain.dataSetAux do
      begin
           Close;
           CommandText := 'Select MEN_CODIGO FROM MENUS WHERE MEN_NOME ='+
           QuotedStr(Trim(textoMenu));
           Open;
           //
           If not IsEmpty then
              Result := Fields[0].AsInteger
           Else
              Result := -1;
      End;
End;

Function CopiarArquivo(aOrigem, aDestino : String) : boolean;
var
  SR: TSearchRec;
  I: integer;
begin
  // CopyFile(PChar(txtNomeArquivoRetorno.Text), PChar(M_NMPAST) ,True);
  Result := False;
  if not CopyFile(PChar(aOrigem), PChar(aDestino), true) then
    raise Exception.Create('Erro ao copiar ' + aOrigem + ' para ' + aDestino);
  Result := True;
End;

Function DigitoNossoNumero(aVal1:Double; aVal2, aVal3 : integer) : String;
begin
     Result := FloattoStr(aVal1  + aVal2  + aVal3 );
End;

function Data_Juliana (Data_Atual: TDateTime): String;
var
    Ano, Mes, Dia: Word;
    Data_Final, Data_Inicial: String;
    Resultado: Real;
begin
    //DecodeDate (Date, Ano, Mes, Dia);
    DecodeDate (Data_Atual, Ano, Mes, Dia);
    Data_Final := DateToStr (Data_Atual);
    Data_Inicial := '31/12/' + IntToStr (Ano - 1);
    Resultado := StrToDate (Data_Final) - StrToDate (Data_Inicial);
    Result := FloatToStr (Resultado);
end;

function CalcularJuros (ValorParcela, pJuros, pMulta : Double): Double;
Var
   aValor, aPercentual : double;
begin
     aValor      := ValorParcela + Arredondar(Gerapercentual(ValorParcela, pMulta),2);
     aPercentual := Arredondar(Gerapercentual(aValor, pJuros),2);
     // ((valor+multa)*pejuros)/30
     result := Arredondar(aPercentual/30,2);
End;

Procedure MesesEntreDatas(DataFinal,DataInicial : TDate;
var Anos,Meses,Dias : Integer);
// Retorna a diferença em Dias,Meses e Anos entre 2 datas

  function Calcula(Periodo : Integer) : Integer;
  var
     intCont : Integer;
  begin
    intCont := 0;
    Repeat
    Inc(intCont);
    DataFinal := IncMonth(DataFinal,Periodo * -1);
    Until DataFinal < DataInicial;
    DataFinal := IncMonth(DataFinal,Periodo);
    Inc(intCont,-1);
    Result := intCont;
  End;
begin
  if DataFinal <= DataInicial then
  begin
    Anos := 0;
    Meses := 0;
    Dias := 0;
    exit;
  end;
  Anos := Calcula(12);
  Meses := Calcula(1);
  Dias := Round(DataFinal - DataInicial);
End;


Function StrToReal(inString :String): Real;
{converte um número em Float}
Var
  i : Real;
  k : Integer;
Begin
  Val(inString,i,k);
  StrToReal := i;
End;

function mvExameitem(iExame : integer; campo,tabela:string):integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select max('+campo+') from '+tabela + ' where (MEI_SEQUENCIA = :pSEQUENCIA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := DMDados.sqlConexao;
      sql.Add(texto);
      Params.ParamByName('pSEQUENCIA').AsInteger := iExame;
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
End;


function Idade(Nasc : TDate) : String;
Var AuxIdade, Meses, IdadeReal : String;
  MesesFloat : Real;
  IdadeInc : Integer;
begin
  AuxIdade := Format('%0.2f', [(Date - Nasc) / 365.6]);
  Meses := FloatToStr(Frac(StrToFloat(AuxIdade)));

  if AuxIdade = '0' then begin
  Result := '0,0';
  Exit;
  end;

  if Meses[1] = '-' then
  Meses := FloatToStr(StrToFloat(Meses) * -1);

  Delete(Meses, 1, 2);

  if Length(Meses) = 1 then
  Meses := Meses + '0';

  if (Meses <> '0') And (Meses <> '') then
  MesesFloat := Round(((365.6 * StrToInt(Meses)) / 100) / 30)
  else
  MesesFloat := 0;

  if MesesFloat <> 12 then
  IdadeReal := IntToStr(Trunc(StrToFloat(AuxIdade)))
  //+ ',' + FloatToStr(MesesFloat)
  else begin
  IdadeInc := Trunc(StrToFloat(AuxIdade));
  Inc(IdadeInc);
  IdadeReal := IntToStr(IdadeInc);
  //+ ',' + '0';
  end;

  Result := IdadeReal;
end;

Procedure MODALIDADES;
begin
     //
     frmFormaPagamento.cdsModalidade.First;
     frmFormaPagamento.cdsModalidade.DisableControls;
     //
     dmFinanceiro.cdsModalidade.Close;
     dmFinanceiro.cdsModalidade.Open;
     dmFinanceiro.cdsModalidade.EmptyDataSet;
     //
     While not (frmFormaPagamento.cdsModalidade.Eof) do
     Begin
          dmFinanceiro.cdsModalidade.Append;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_NOME').AsString      :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_NOME').AsString;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_FLFIXA').AsString  :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
          dmFinanceiro.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger :=
             frmFormaPagamento.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
          dmFinanceiro.cdsModalidade.Post;
          // Proximo
          frmFormaPagamento.cdsModalidade.Next;
     End;
     //
     dmFinanceiro.cdsModalidade.First;
     frmFormaPagamento.cdsModalidade.EnableControls;
end;

function PASTA_CUPOM(M_CDUSUA : Integer) : String;
begin
     uFuncoes.FilterCDS(dmDados.cdsUsuario, fsInteger, InttoStr(M_CDUSUA));
     With dmDados.cdsUsuario do
      begin
           //
           If not (IsEmpty) Then
              If not Empty(FieldByName('SEN_PASTA_CUPOM').AsString) Then
                  result := FieldByName('SEN_PASTA_CUPOM').AsString
              Else
                  result := 'C:\';
           //
           Close;
      End;
End;

procedure CRIAR_PARCELAS(M_VLMODA : Double; M_QTPARC : Integer);
Var
    Cont : integer;
    M_TOMODA, M_VLPARC, M_VLDIFE, W_ULTIPC : Real;
begin
     M_VLPARC := 0;
     M_VLDIFE := 0;
     W_ULTIPC := 0;
     //
     If (dmDados.cdsParcelas.Active = False) Then
         dmDados.cdsParcelas.Open;
     //
     M_TOMODA := M_VLMODA;
     //dmConsultas.cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
     //M_VLPARC := uFuncoes.Arredondar(M_TOMODA/W_TOTAPC,2);
     M_VLPARC := uFuncoes.Arredondar(M_TOMODA/M_QTPARC,2);
     //
     M_VLDIFE := M_TOMODA-(M_VLPARC * M_QTPARC);
     //
     If (M_VLDIFE < M_TOMODA) Then
       W_ULTIPC := M_VLPARC+M_VLDIFE;
     //
     dmDados.cdsParcelas.EmptyDataSet;
     //
     dmDados.cdsParcelas.DisableControls;
     For Cont := 1 to M_QTPARC do
     Begin
          // Incluir
          dmDados.cdsParcelas.Append;
          dmDados.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger   := Cont;
          dmDados.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := IncMonth(Date,Cont);
          dmDados.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC;
          //If (M_QTPARC <> W_TOTAPC) Then
          If (M_QTPARC <> Cont) Then
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

function DifHora(Inicio,Fim : String):String;
{Retorna a diferença entre duas horas}
var
  FIni,FFim : TDateTime;
begin
Fini := StrTotime(Inicio);
FFim := StrToTime(Fim);
If (Inicio > Fim) then
  begin
  Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
  end
else
  begin
  Result := TimeToStr(FFim-Fini);
  end;
end;

function AdicionaHora(TimeAdd: Integer) : String;
{Adiciona à hora atual um numero de horas determinado. Caso este numero seje negativo, ele subtrairá da hora atual}
Var
Horas,Min,SomaHoras,SomaMin : Integer;
S, S1 : String;
begin
{    Horas := Strtoint(Copy(TimetoStr(Time),1,2))+ TimeAdd;
    Min := Strtoint(Copy(TimetoStr(Time),4,2))+ TimeAdd ;
    SomaHoras := SomaHoras+Horas;
    SomaMin := SomaMin + Min;
    If SomaMin > 59 Then
      begin
          if SomaMin mod 60 = 0 Then
            begin
              Somahoras := Somahoras+(Somamin div 60);
              Somamin := 0;
            end
            else
            begin
              SomaHoras := SomaHoras + (SomaMin div 60);
              SomaMin := SomaMin mod 60;
            end;
      end;
    If Somamin = 0 Then
    begin
        S := '00';
    end
    else
    begin
        S := InttoStr(Somamin);
    end;
    If Length(InttoStr(SomaHoras)) = 1 Then
     begin
        S1 := Concat('0',InttoStr(Somahoras));
    end
    else
    begin
        S1 := InttoStr(Somahoras);
    end;
    Result := Concat(S1,':',S,':00');}
end;

end.

