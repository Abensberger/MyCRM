unit udashboard;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  BCRadialProgressBar, BCListBox, BCPanel, BCMDButton;

type

  { TfrmDashboard }

  TfrmDashboard = class(TForm)
    BCRadialProgressBar1: TBCRadialProgressBar;
    BCRadialProgressBar2: TBCRadialProgressBar;
    BCRadialProgressBar3: TBCRadialProgressBar;
    BCRadialProgressBar4: TBCRadialProgressBar;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MDButton1: TBCMDButton;
    MDButton2: TBCMDButton;
    MDButton3: TBCMDButton;
    MDButton4: TBCMDButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmDashboard: TfrmDashboard;

implementation

{$R *.lfm}

{ TfrmDashboard }

procedure TfrmDashboard.FormCreate(Sender: TObject);
begin
  Tag := Color;

end;

end.

