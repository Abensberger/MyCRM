unit usettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfrmSettings }

  TfrmSettings = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmSettings: TfrmSettings;

implementation

{$R *.lfm}

{ TfrmSettings }

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
    Tag := Color;

end;

end.

