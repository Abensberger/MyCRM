unit ModelMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, Dialogs;

type

  { TModelMain }

  TModelMain = class(TDataModule)
    SQLite3Connection1: TSQLite3Connection;
    QueryCustomers: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCustomerCompany: String;
    function GetCustomerCompany: String;
    procedure SetCustomerCompany(AValue: String);

  public
    property  CompanyName : String read GetCustomerCompany;
    procedure GetFilteredCustomers(const aFilterText : String);

  end;

var
  ModelMain: TModelMain;

implementation

{$R *.lfm}

{ TModelMain }


procedure TModelMain.DataModuleCreate(Sender: TObject);
begin
  SQLite3Connection1.DatabaseName:='data\Aussendienst.sqlite';
//  SQLite3Connection1.DatabaseName:='data\dejaoffice.db';
  SQLTransaction1.Database:=SQLite3Connection1;
  QueryCustomers.Transaction:=SQLTransaction1;
  SQLite3Connection1.Open;
end;

procedure TModelMain.SetCustomerCompany(AValue: String);
begin
  if FCustomerCompany=AValue then Exit;
  FCustomerCompany:=AValue;
end;

function TModelMain.GetCustomerCompany: String;
begin
  result := QueryCustomers.FieldByName('company').AsString;
end;

procedure TModelMain.GetFilteredCustomers(const aFilterText: String);
begin
  QueryCustomers.Close;
  QueryCustomers.ParamByName('Filter').AsString := '%'+aFilterText+'%';
 // ShowMessage(QueryCustomers.SQL.Text);
  QueryCustomers.Open;
end;

end.

