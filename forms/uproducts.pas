unit uproducts;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TfrmProducts }

  TfrmProducts = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmProducts: TfrmProducts;

implementation

{$R *.lfm}

{ TfrmProducts }

procedure TfrmProducts.FormCreate(Sender: TObject);
begin
    Tag := Color;

end;

end.

