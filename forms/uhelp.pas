unit uhelp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmHelp }

  TfrmHelp = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.lfm}

{ TfrmHelp }

procedure TfrmHelp.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmHelp.FormCreate(Sender: TObject);
begin
  Tag := Color;
end;

end.

