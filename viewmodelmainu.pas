unit ViewModelMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, modelmainu;

type

  { TViewModelMain }

  TViewModelMain = class(TDataModule)
    DSCustomers: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DSCustomersDataChange(Sender: TObject; Field: TField);
  private
    FModel : TModelMain;
  public
    function CompanyName : String;
    procedure GetFilteredCustomers(const aFilterText : String);
  end;

var
  ViewModelMain: TViewModelMain;

implementation

{$R *.lfm}

{ TViewModelMain }

procedure TViewModelMain.DataModuleCreate(Sender: TObject);
begin
  FModel := TModelMain.Create(Self);
  DSCustomers.DataSet := FModel.QueryCustomers;
end;

procedure TViewModelMain.DSCustomersDataChange(Sender: TObject; Field: TField);
begin

end;

function TViewModelMain.CompanyName: String;
begin
  result := FModel.CompanyName;
end;


procedure TViewModelMain.GetFilteredCustomers(const aFilterText: String);
var
  LFilterText : String;
begin
  LFilterText := Trim(aFilterText);
  FModel.GetFilteredCustomers(LFilterText);
end;

end.

