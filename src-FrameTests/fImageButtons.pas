unit fImageButtons;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs;

type
  TfrmImageButtons = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.fmx}

uses
  Gamolf.RTL.Joystick,
  uUIItemsList,
  Gamolf.RTL.UIElements;

procedure TfrmImageButtons.FormCreate(Sender: TObject);
var
  item: TUIElement;
begin
  UIItems.NewLayout;
  item := UIItems.AddUIItem(
    procedure(const Sender: TObject)
    begin
      tthread.forcequeue(nil,
        procedure
        begin
          Close;
        end);
    end);
  item.KeyShortcuts.Add(vkescape, #0, []);
  item.KeyShortcuts.Add(vkHardwareBack, #0, []);
  item.GamePadButtons := [TJoystickButtons.b];
end;

procedure TfrmImageButtons.FormDestroy(Sender: TObject);
begin
  UIItems.RemoveLayout;
end;

procedure TfrmImageButtons.FormKeyDown(Sender: TObject; var Key: Word;
var KeyChar: WideChar; Shift: TShiftState);
begin
  UIItems.KeyDown(Key, KeyChar, Shift);
end;

end.
