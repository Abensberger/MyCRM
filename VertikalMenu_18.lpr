program VertikalMenu_18;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, umain, rxnew, lazcontrols, ucustomers2, uorders, uproducts, udashboard,
  ucalendar, usettings, utools, uhelp
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCustomers, frmCustomers);
  Application.CreateForm(TfrmOrders, frmOrders);
  Application.CreateForm(TfrmProducts, frmProducts);
  Application.CreateForm(TfrmDashboard, frmDashboard);
  Application.CreateForm(TfrmCalendar, frmCalendar);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmTools, frmTools);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.Run;
end.

