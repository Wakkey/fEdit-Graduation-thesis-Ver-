unit tool_window;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { TToolWindow }

  TToolWindow = class(TForm)
    PageControl1: TPageControl;
    ToolBar2: TToolBar;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ToolWindow: TToolWindow;

implementation

{$R *.lfm}

end.

