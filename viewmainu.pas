unit ViewMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  DBCtrls, ExtCtrls, viewmodelmainu, DBControlGrid, Types;

type

  { TMainForm }

  TMainForm = class(TForm)
    Button1: TButton;
    DBControlGrid1: TDBControlGrid;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBText10: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
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
    procedure Button1Click(Sender: TObject);
    procedure DBControlGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FViewModel : TViewModelMain;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FViewModel := TViewModelMain.Create(Self);
  DBGrid1.DataSource := FViewModel.DSCustomers;
  DBControlGrid1.DataSource := FViewModel.DSCustomers;
  DBText1.DataSource := FViewModel.DSCustomers;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  FViewModel.GetFilteredCustomers(Edit1.Text);
  FViewModel.DSCustomers.DataSet.First;
  DBText1.DataSource := FViewModel.DSCustomers;
  DBText2.DataSource := FViewModel.DSCustomers;
  DBText3.DataSource := FViewModel.DSCustomers;
  DBText4.DataSource := FViewModel.DSCustomers;
  DBText5.DataSource := FViewModel.DSCustomers;
  DBText6.DataSource := FViewModel.DSCustomers;
  DBText7.DataSource := FViewModel.DSCustomers;
  DBText8.DataSource := FViewModel.DSCustomers;
  DBText9.DataSource := FViewModel.DSCustomers;
  DBText10.DataSource := FViewModel.DSCustomers;


  DBText1.DataField  := 'company';
  DBText2.DataField  := 'vorname';
  DBText3.DataField  := 'nachname';
  DBText4.DataField  := 'strasse';
  DBText5.DataField  := 'hausnr';
  DBText6.DataField  := 'plz';
  DBText7.DataField  := 'ort';
  DBText8.DataField  := 'telefon';
  DBText9.DataField  := 'email';
  DBText10.DataField := 'url';
end;

procedure TMainForm.DBControlGrid1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin

end;

end.

