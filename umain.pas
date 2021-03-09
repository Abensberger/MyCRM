unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, Menus, ActnList;

const
   _MENUWIDTH_COLLAPSED       = 50;
   _MENUWIDTH_EXPANDED        = 200;
   _MENU_FONTSIZE             = 11;
   _MENU_FONTNAME             = 'Segoe UI';
   _MENU_FONTCOLOR           : TColor = clBlack;
   _MENU_BACKGROUNDCOLOR     : TColor = clWhite;
   _DARKMENU_BACKGROUNDCOLOR : TColor = clWhite;
   _CAPTION_COLOR             = clTeal;
   _FOCUSBAR_WIDTH            = 4;

type

  { TForm1 }

  TForm1 = class(TForm)
    actDashboard: TAction;
    actCustomers: TAction;
    actCalendar: TAction;
    actHelp: TAction;
    actSwitchDarkmode: TAction;
    actSettings: TAction;
    actTools: TAction;
    actProducts: TAction;
    actOrders: TAction;
    actMenu: TAction;
    actQuit: TAction;
    ActionList1: TActionList;
    btnTools1: TSpeedButton;
    btnTools2: TSpeedButton;
    btnTools3: TSpeedButton;
    btnTools4: TSpeedButton;
    btnTools6: TSpeedButton;
    imgLstBlack: TImageList;
    imgLstWhite: TImageList;
    f: TLabel;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    pnlMenuAlt: TPanel;
    pnlCaption: TPanel;
    pnlFocus: TPanel;
    pnlWorkArea: TPanel;
    pnl_submenu_tools: TPanel;
    pnlClient: TPanel;
    pnl_submenu_settings: TPanel;
    captBtnDarkmode: TSpeedButton;
    captBtnQuit: TSpeedButton;
    procedure actCalendarExecute(Sender: TObject);
    procedure actCustomersExecute(Sender: TObject);
    procedure actDashboardExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actMenuExecute(Sender: TObject);
    procedure actOrdersExecute(Sender: TObject);
    procedure actProductsExecute(Sender: TObject);
    procedure actQuitExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actSwitchDarkmodeExecute(Sender: TObject);
    procedure actSwitchDarkmodeUpdate(Sender: TObject);
    procedure actToolsExecute(Sender: TObject);
    procedure btn_mainMenuMouseEnter(Sender: TObject);
    procedure btn_menuMouseClick(Sender: TObject);
    procedure btn_menuMouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure pnl_submenu_toolsMouseLeave(Sender: TObject);
    procedure pnl_submenu_toolsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure captBtnQuitClick(Sender: TObject);

  private
    workingform : TForm;
    DarkMode    : Boolean;
    workingFormColor : TColor;
    procedure Show_SubMenu(aButton : TSpeedButton; bactivate : Boolean);
    procedure Show_Fokus(aPanel : Tpanel; aButton : TSpeedButton; bactivate : Boolean);
    procedure MainMenuToPanel(aMenu : TMainMenu; aPanel : TPanel);
    procedure ShowFokusPanel(aPanel : TPanel; aButton : TSpeedButton);
    procedure OpenChildForm(const aForm: TForm; aParentPanel : TPanel);

  public

  end;

var
  Form1: TForm1;

implementation

uses udashboard, ucustomers2, uorders, uProducts, uCalendar, uTools, uHelp, uSettings,
     ufk_colors;
{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  DarkMode := false;
  pnlMenuAlt.Width    := _MENUWIDTH_COLLAPSED;
  pnlMenuAlt.ShowHint := true;
  pnlCaption.Color    := _CAPTION_COLOR;
  pnlFocus.Color      := pnlCaption.Color;
  ActionList1.Images  := imgLstBlack;
  MainMenu1.Images    := ActionList1.Images;
  MainMenuToPanel(MainMenu1,pnlMenuAlt);
end;

procedure TForm1.btn_menuMouseClick(Sender: TObject);
begin
  Show_SubMenu(TComponent(Sender) as TSpeedButton,false);
end;

procedure TForm1.btn_mainMenuMouseEnter(Sender: TObject);
begin
  Show_SubMenu(nil,false);
end;

procedure TForm1.actDashboardExecute(Sender: TObject);
begin
  if Sender is TSpeedButton then
     ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmDashboard,pnlWorkArea);
end;

procedure TForm1.actCustomersExecute(Sender: TObject);
begin
  if Sender is TSpeedButton then
     ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmCustomers,pnlWorkArea);
end;

procedure TForm1.actOrdersExecute(Sender: TObject);
begin
  if Sender is TSpeedButton then
     ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmOrders, pnlWorkArea);
end;

procedure TForm1.actProductsExecute(Sender: TObject);
begin
  if Sender is TSpeedButton then
     ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmProducts, pnlWorkArea);
end;

procedure TForm1.actCalendarExecute(Sender: TObject);
begin
  if Sender is TSpeedButton then
     ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmCalendar, pnlWorkArea);
end;

procedure TForm1.actToolsExecute(Sender: TObject);
begin
  ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmTools, pnlWorkArea);
end;

procedure TForm1.actHelpExecute(Sender: TObject);
begin
  ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmHelp, pnlWorkArea);
end;

procedure TForm1.actSettingsExecute(Sender: TObject);
begin
  ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
  OpenChildForm(frmSettings, pnlWorkArea);
end;

procedure TForm1.actSwitchDarkmodeExecute(Sender: TObject);
begin
  DarkMode := not DarkMode;
  if DarkMode then
  begin
    _MENU_BACKGROUNDCOLOR := clBlack;
    pnlCaption.Color    := clBlack;
     MainMenu1.Images   := imgLstWhite;
    _MENU_FONTCOLOR     := clWhite;
    WorkingForm.Tag     := WorkingForm.Color;
    WorkingForm.Color   := ufk_colors.Darker(WorkingForm.Tag,75);
  end
  else
  begin
    _MENU_BACKGROUNDCOLOR := clWhite;
    pnlCaption.Color      := _CAPTION_COLOR;
     MainMenu1.Images := imgLstBlack;
    _MENU_FONTCOLOR  := clBlack;
    WorkingForm.Color   := WorkingForm.Tag;
  end;
  MainMenuToPanel(MainMenu1, pnlMenuAlt);
end;

procedure TForm1.actSwitchDarkmodeUpdate(Sender: TObject);
begin
  actSwitchDarkMode.Checked := DarkMode;
end;

procedure TForm1.OpenChildForm(const aForm: TForm; aParentPanel : TPanel);
begin
//  WorkingFormColor := aForm.Color;
  if Assigned(workingForm) then
  begin
    WorkingForm.hide;
    WorkingForm.Close;
  end;
  workingForm := aForm;
  workingForm.Parent := aParentPanel;
  workingForm.BorderStyle := bsNone;
  workingForm.Align := alClient;
  if DarkMode then
    workingForm.Color := ufk_colors.Darker(aForm.Tag,75)
  else
  begin
    workingForm.Color := aForm.Tag;
  end;
  workingForm.Show;

{  if Assigned(aForm) then
  begin
    aForm.hide;
    aForm.Close;
  end;
//  workingForm := aForm;
  aForm.Parent := aParentPanel;
  aForm.BorderStyle := bsNone;
  aForm.Align := alClient;
  if DarkMode then
    aForm.Color := ufk_colors.Darker(aForm.Tag,75)
  else
    aForm.Color := aForm.Tag;
  aForm.Show;
}
end;

procedure TForm1.actQuitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.actMenuExecute(Sender: TObject);
begin
  if pnlMenuAlt.Width >  _MENUWIDTH_COLLAPSED then
  begin
     pnlMenuAlt.Width    := _MENUWIDTH_COLLAPSED;
     pnlMenuAlt.ShowHint := true;
  end
  else
  begin
    pnlMenuAlt.Width := _MENUWIDTH_EXPANDED;
    pnlMenuAlt.ShowHint := false;
  end;
end;

procedure TForm1.btn_menuMouseEnter(Sender: TObject);
begin
  Show_SubMenu(TComponent(Sender) as TSpeedButton,true);
  Show_Fokus(pnlFocus, TComponent(Sender) as TSpeedButton,true);
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  ShowFokusPanel(pnlFocus, TSpeedButton(Sender));
end;

procedure TForm1.pnl_submenu_toolsMouseLeave(Sender: TObject);
begin
  pnl_submenu_tools.visible  := false;
end;

procedure TForm1.pnl_submenu_toolsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  pnl_submenu_tools.visible  := true;
end;

procedure TForm1.captBtnQuitClick(Sender: TObject);
begin
  actQuitExecute(Sender);
end;

procedure TForm1.Show_SubMenu(aButton: TSpeedButton; bactivate: Boolean);
var
  i : integer;
begin
  if bactivate then
  begin
    for i := 0 to Self.ComponentCount - 1 do
    begin
      if (self.Components[i] is TPanel) and ((self.Components[i] as TPanel).Tag <> 0) then
      begin
        if (self.Components[i] as TPanel).Tag = aButton.Tag then
        begin
          (self.Components[i] as TPanel).Visible := true;
          (self.Components[i] as TPanel).Left    := aButton.Left;
          (self.Components[i] as TPanel).Top     := aButton.Top;
          (self.Components[i] as TPanel).BringToFront;
        end
        else
          (self.Components[i] as TPanel).Visible := false;
      end;
    end; // for
  end  // bactivate = true
  else
  begin
    for i := 0 to Self.ComponentCount - 1 do
    begin
      if (self.Components[i] is TPanel) and ((self.Components[i] as TPanel).Tag <> 0) then
      begin
          (self.Components[i] as TPanel).Visible := false;
      end;
    end; // for
  end; // activate = false
end;

procedure TForm1.Show_Fokus(aPanel: Tpanel; aButton: TSpeedButton;
  bactivate: Boolean);
var
  i : integer;
begin
  if bactivate then
  begin
    for i := 0 to Self.ComponentCount - 1 do
    begin
        if (self.Components[i] is TSpeedButton) then
        begin
          if (TSpeedButton(Self.Components[i]) = aButton) then
          begin
            aPanel.Parent  := aButton.Parent;
            aPanel.Visible := true;
            aPanel.Left    := aButton.Left;
            aPanel.Top     := aButton.Top;
            aPanel.Height  := aButton.Height;
            aPanel.Width   := _FOCUSBAR_WIDTH;
            TSpeedButton(Self.Components[i]).Font.Style := [fsBold];
            TSpeedButton(Self.Components[i]).Font.Size  := 10;
          end
          else
          begin
            TSpeedButton(Self.Components[i]).Font.Style := [];
            TSpeedButton(Self.Components[i]).Font.Size  := 10;
          end;
          TSpeedButton(Self.Components[i]).Invalidate;

        end;
    end; // for
  end  // bactivate = true
  else
  begin
    aPanel.Visible := false;
    aButton.Font.Style := [];
  end; // activate = false
end;

procedure TForm1.MainMenuToPanel(aMenu: TMainMenu; aPanel: TPanel);
var i,y : Integer;
    aBtn : TSpeedButton;
begin
  Self.Menu := nil;
  y := 0;
  aPanel.Caption     := '';
  aPanel.Color       := _MENU_BACKGROUNDCOLOR;
  aPanel.BorderStyle := bsNone;
  aPanel.Font.Name   := _MENU_FONTNAME;
  aPanel.Font.Size   := _MENU_FONTSIZE;
  aPanel.Font.Color  := _MENU_FONTCOLOR;

  for i := aPanel.ControlCount - 1  downto 0 do
  begin
    if aPanel.Controls[i] is TSpeedButton then
       aPanel.Controls[i].Free;
  end;

  for i := 0 to aMenu.Items.Count-1 do
  begin
    aBtn := TSpeedButton.Create(aPanel);
    aBtn.Caption    := aMenu.Items[i].Caption;
    aBtn.Hint       := aMenu.Items[i].Hint;
    aBtn.ParentShowHint := true;
    aBtn.Images     := aMenu.Images;
    aBtn.ImageIndex := aMenu.Items[i].ImageIndex;
    aBtn.Tag        := aMenu.Items[i].Tag;
    aBtn.GroupIndex := aMenu.Items[i].GroupIndex;
    aBtn.Flat       := true;
    aBtn.ParentFont := true;
    aBtn.Margin     := 10;
    aBtn.Spacing    := 10;
    aBtn.Height     := 50;
    aBtn.Top        := y;
    if not(aMenu.Items[i].RightJustify) then
       aBtn.Align   := alTop
    else
    begin
      aBtn.Top     := 200000;
      aBtn.Align   := alBottom;
    end;
    aBtn.Parent  := aPanel;
    if Assigned(aMenu.Items[i].Action) then
       aBtn.OnClick := aMenu.Items[i].Action.OnExecute;
    inc(y,aBtn.Height+1);
  end;
end;

procedure TForm1.ShowFokusPanel(aPanel: TPanel; aButton: TSpeedButton);
begin
  aPanel.Parent  := aButton.Parent;
  aPanel.Visible := true;
  aPanel.Left    := aButton.Left;
  aPanel.Top     := aButton.Top;
  aPanel.Height  := aButton.Height-1;
  aPanel.Width   := _FOCUSBAR_WIDTH;
end;

end.

