unit utools;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfrmTools }

  TfrmTools = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmTools: TfrmTools;

implementation

{$R *.lfm}

{ TfrmTools }

procedure TfrmTools.FormCreate(Sender: TObject);
begin
    Tag := Color;

end;

end.

