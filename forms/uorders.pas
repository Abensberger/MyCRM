unit uorders;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TfrmOrders }

  TfrmOrders = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmOrders: TfrmOrders;

implementation

{$R *.lfm}

{ TfrmOrders }

procedure TfrmOrders.FormCreate(Sender: TObject);
begin
  Tag := Color
end;

end.

