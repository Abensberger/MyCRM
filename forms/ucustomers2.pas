unit ucustomers2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  DBCtrls, StdCtrls, ComCtrls, Buttons, DBControlGrid,
  Types, ViewModelMainu, Grids;

type

  { TfrmCustomers }

  TfrmCustomers = class(TForm)
    DBControlGrid2: TDBControlGrid;
    DBText1: TDBText;
    DBText10: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlCustomerToolBar: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    StaticText1: TStaticText;
    procedure DBControlGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBControlGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBControlGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBControlGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Panel2Paint(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    FViewModel : ViewModelMainu.TViewModelMain;
    procedure ToggleSearchWindow;
    procedure ClearSearch;
    function CreateHTMLString : String;
    procedure ViewModelDataChange(Sender: TObject; Field: TField);

  public

  end;

var
  frmCustomers: TfrmCustomers;

implementation


{$R *.lfm}

{ TfrmCustomers }

procedure TfrmCustomers.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
//  ShowMessage('OnClose');
end;

procedure TfrmCustomers.Edit1Change(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    FViewModel.GetFilteredCustomers(Edit1.Text);
    FViewModel.DSCustomers.DataSet.First;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCustomers.DBControlGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure TfrmCustomers.DBControlGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Panel3.Caption := FViewModel.CompanyName;
  Panel3.Caption := FViewModel.DSCustomers.DataSet.FieldByName('bezeichnung').asString;
end;

procedure TfrmCustomers.DBControlGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TfrmCustomers.DBControlGrid2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Panel3.Caption := FViewModel.CompanyName;
  Panel3.Caption := FViewModel.DSCustomers.DataSet.FieldByName('bezeichnung').asString;

end;

procedure TfrmCustomers.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
//  ShowMessage('OnCloseQuery');
end;

procedure TfrmCustomers.FormCreate(Sender: TObject);
begin
  Tag := Color;

  pnlCustomerToolBar.Height := 48;
  FViewModel := TViewModelMain.Create(Self);
  DBControlGrid2.DataSource := FViewModel.DSCustomers;
  FViewModel.GetFilteredCustomers(Edit1.Text);
  FViewModel.DSCustomers.DataSet.First;
  DBText5.DataSource := FViewModel.DSCustomers;
  DBText5.DataField  := 'telefon';
  DBText6.DataSource := FViewModel.DSCustomers;
  DBText6.DataField  := 'vorwahl';
  DBText7.DataSource := FViewModel.DSCustomers;
  DBText7.DataField  := 'email';
  DBText8.DataSource := FViewModel.DSCustomers;
  DBText8.DataField  := 'company';
  DBText9.DataSource := FViewModel.DSCustomers;
  DBText9.DataField  := 'nachname';
  DBText10.DataSource := FViewModel.DSCustomers;
  DBText10.DataField  := 'vorname';
  DBText1.DataSource := FViewModel.DSCustomers;
  DBText1.DataField  := 'company';
{  DBText2.DataSource := FViewModel.DSCustomers;
  DBText2.DataField  := 'kategoriename';
}  FViewModel.DSCustomers.OnDataChange:= @ViewModelDataChange;
end;

procedure TfrmCustomers.FormDestroy(Sender: TObject);
begin
//  ShowMessage('OnDestroy');
end;

procedure TfrmCustomers.Panel2Paint(Sender: TObject);
var
  s : String;
begin
  case FViewModel.DSCustomers.DataSet.FieldByName('kategorie').AsInteger of
  1:Label2.Font.Color := clRed;
  2:Label2.Font.Color := clOlive;
  3:Label2.Font.Color := clGreen;
  else
    Label2.Font.Color := clBlue;
  end; // case
end;

procedure TfrmCustomers.SpeedButton3Click(Sender: TObject);
begin
  ToggleSearchWindow;
end;

procedure TfrmCustomers.SpeedButton4Click(Sender: TObject);
begin
  ClearSearch;
end;

procedure TfrmCustomers.ToggleSearchWindow;
begin
  if pnlCustomerToolBar.Height < 96 then
     pnlCustomerToolBar.Height := 96
  else
     pnlCustomerToolBar.Height := 48;
end;

procedure TfrmCustomers.ClearSearch;
begin
  Edit1.Text := '';
end;

function TfrmCustomers.CreateHTMLString: String;
var s : String;
begin
  s :=
  FViewModel.DSCustomers.DataSet.FieldByName('Vorname').AsString + ' ' +
  FViewModel.DSCustomers.DataSet.FieldByName('Nachname').AsString+'<br>'+
  FViewModel.DSCustomers.DataSet.FieldByName('Strasse').AsString + ' ' +
  FViewModel.DSCustomers.DataSet.FieldByName('Hausnr').AsString+'<br>';

  result := s;
end;

procedure TfrmCustomers.ViewModelDataChange(Sender: TObject; Field: TField);
begin
  Label3.Caption := FViewModel.DSCustomers.DataSet.FieldByName('kategoriename').asString;
  case FViewModel.DSCustomers.DataSet.FieldByName('kategorie').AsInteger of
  1:Label3.Font.Color := clRed;
  2:Label3.Font.Color := clOlive;
  3:Label3.Font.Color := clGreen;
  else
    Label3.Font.Color := clBlue;
  end; // case
end;

end.

