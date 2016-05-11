unit uFrmRelPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfrmRelPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtImprimir: TBitBtn;
    BtSair: TBitBtn;
    procedure BtSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPadrao: TfrmRelPadrao;

implementation

{$R *.dfm}

procedure TfrmRelPadrao.BtSairClick(Sender: TObject);
begin
     Close;
end;

end.
