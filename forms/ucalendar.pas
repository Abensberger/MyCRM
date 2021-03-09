unit ucalendar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, VpDayView,
  VpWeekView, VpMonthView, VpTaskList, VpBaseDS, VpIniDs, BCMDButton, VpData;

type

  { TfrmCalendar }

  TfrmCalendar = class(TForm)
    MDButton1: TBCMDButton;
    MDButton2: TBCMDButton;
    Notebook1: TNotebook;
    Page1: TPage;
    Page2: TPage;
    VpControlLink1: TVpControlLink;
    VpDayView1: TVpDayView;
    VpIniDatastore1: TVpIniDatastore;
    VpMonthView1: TVpMonthView;
    VpTaskList1: TVpTaskList;
    VpWeekView1: TVpWeekView;
    procedure BCMDButton1Click(Sender: TObject);
    procedure BCMDButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VpDayView1Click(Sender: TObject);
    procedure VpWeekView1AfterEdit(Sender: TObject; Event: TVpEvent);
  private

  public

  end;

var
  frmCalendar: TfrmCalendar;

implementation

{$R *.lfm}

{ TfrmCalendar }

procedure TfrmCalendar.BCMDButton1Click(Sender: TObject);
begin
  Notebook1.PageIndex := 0;
end;

procedure TfrmCalendar.BCMDButton2Click(Sender: TObject);
begin
  Notebook1.PageIndex := 1;
end;

procedure TfrmCalendar.FormCreate(Sender: TObject);
begin
  Tag := Color;

end;

procedure TfrmCalendar.FormShow(Sender: TObject);
begin
  if VpIniDatastore1.Resources.Count > 0 then
    VpIniDatastore1.Resource := VpIniDatastore1.Resources.Items[0];

end;

procedure TfrmCalendar.VpDayView1Click(Sender: TObject);
begin

end;

procedure TfrmCalendar.VpWeekView1AfterEdit(Sender: TObject; Event: TVpEvent);
begin

end;

end.

