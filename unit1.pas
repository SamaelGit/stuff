unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    closebtnh: TLabel;
    gamegrid: TStringGrid;
    frogimg: TImage;
    Header: TLabel;
    Loesung: TLabel;
    startbtn: TLabel;
    procedure closebtnClick(Sender: TObject);
    procedure gamegridSelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    procedure LoesungClick(Sender: TObject);
    procedure startbtnClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ZC,ZR: integer;
  gstart:boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.startbtnClick(Sender: TObject);
begin
  Randomize;
  ZC:=random(6);
  ZR:=random(6);
  gamegrid.cells[ZC,ZR]:=' ';
  gstart:=true;
  startbtn.Visible:=false;
  loesung.Visible:=true;

end;

procedure TForm1.closebtnClick(Sender: TObject);
begin
  Close;
end;


procedure TForm1.gamegridSelectCell(Sender: TObject; aCol, aRow: Integer;
  var CanSelect: Boolean);
begin

  if gstart=true then
    if gamegrid.cells[ZC,ZR]=gamegrid.cells[aCol,aRow] then
      begin
        gamegrid.cells[ZC,ZR]:='gefunden';
        frogimg.Visible:=true;
      end
    else gamegrid.cells[aCol,aRow]:='   X';
end;

procedure TForm1.LoesungClick(Sender: TObject);
begin
  gamegrid.cells[ZC,ZR]:='Frog';
end;


end.






