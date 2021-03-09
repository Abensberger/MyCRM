unit ufk_colors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Graphics, LCLIntf, lclType;

function Darker(MyColor:TColor; Percent:Byte):TColor;
function Lighter(MyColor:TColor; Percent:Byte):TColor;
function IsLightColor(const AColor: TColor): Boolean;
function DisabledColor(AColor: TColor; APercent: Integer): TColor;
function HotColor(AColor: TColor; const APercent: Integer): TColor;

implementation

function Darker(MyColor:TColor; Percent:Byte):TColor;
var r,g,b:Byte;
begin
  MyColor:=ColorToRGB(MyColor);
  r:=GetRValue(MyColor);
  g:=GetGValue(MyColor);
  b:=GetBValue(MyColor);
  r:=r-muldiv(r,Percent,100);  //Percent% closer to black
  g:=g-muldiv(g,Percent,100);
  b:=b-muldiv(b,Percent,100);
  result:=RGB(r,g,b);
end;

function Lighter(MyColor:TColor; Percent:Byte):TColor;
var r,g,b:Byte;
begin
  MyColor:=ColorToRGB(MyColor);
  r:=GetRValue(MyColor);
  g:=GetGValue(MyColor);
  b:=GetBValue(MyColor);
  r:=r+muldiv(255-r,Percent,100); //Percent% closer to white
  g:=g+muldiv(255-g,Percent,100);
  b:=b+muldiv(255-b,Percent,100);
  result:=RGB(r,g,b);
end;

function IsLightColor(const AColor: TColor): Boolean;
var
  r, g, b, yiq: integer;
begin
  r := GetRValue(AColor);
  g := GetGValue(AColor);
  b := GetBValue(AColor);
  yiq := ((r*299)+(g*587)+(b*114)) div 1000;
  if (yiq >= 128) then
    result := True
  else
    result := False;
end;

function DisabledColor(AColor: TColor; APercent: Integer): TColor;
begin
  if IsLightColor(AColor) then
    Result := Darker(AColor, APercent)
  else
    Result := Lighter(AColor, APercent);
end;

function HotColor(AColor: TColor; const APercent: Integer): TColor;
begin
  if IsLightColor(AColor) then
    Result := Lighter(AColor, APercent)
  else
    Result := Darker(AColor, APercent);
end;

end.

