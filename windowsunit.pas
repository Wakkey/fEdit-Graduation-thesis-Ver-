unit windowsunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Process;

type

  { Twindows_unit }

  Twindows_unit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function memoload(i:integer;s:string):boolean;
    function memosave(i:integer;s:string;memo:TStringList):boolean;
    function get_cusol():TPoint;
    function insert_text(Tabs:integer;data:string):boolean;
    function pross(set_name,set_name2:string):boolean;
    function pross3(command:string):boolean;
  end;

var
  windows_unit: Twindows_unit;

implementation

uses functionunit, mainform, comp
  {$IFDEF WIN32}
     ,windows
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF};

{$R *.lfm}

{ Twindows_unit }
function UTF8ToUTF16(const S: AnsiString):WIdeString;
begin
  UTF8ToUTF16 := s;
end;

function UTF16ToUTF8(const S: WIdeString):AnsiString;
begin
  UTF16ToUTF8 := s;
end;

{$IFDEF WIN32}
function Twindows_unit.memoload(i:integer;s:string):boolean;
var
  edt:Tmemo;
  function encode_charset(i:integer;memo:TMemo):boolean;
  begin
    if Main.Menu_Utf16.Checked then begin
      //memo.LoadFromFile((utf16toutf8(s)));
      function_unit.editlist.Items[i].Edit.Text := utf16toutf8(memo.Text);
      encode_charset := true;
    end else if Main.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      function_unit.editlist.Items[i].Edit.Text := ansitoutf8(memo.Text);
      encode_charset := true;
    end else if Main.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
       function_unit.editlist.Items[i].Edit.Text := (memo.Text);
       encode_charset := true;
    end;
    function_unit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      edt := TMemo.Create(owner);
      edt.Parent := windows_unit;
      edt.Enabled:= true;
      edt.Lines.LoadFromFile(s);
      encode_charset(i,edt);
      edt.Free;
    finally

    end;
end;

function Twindows_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
  function encode_charset(i:integer;memo:TStringList):boolean;
  begin
    if function_unit.editlist.Items[i].char_sets = 'UTF16' then begin
      memo.Text:= (utf8toutf16(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'ANSI' then begin
      memo.Text:= (utf8toansi(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
    end;
  end;
begin
    encode_charset(i,memo);
  try
    memo.SaveToFile(utf8toansi((s)));
  finally

  end;
end;

function Twindows_unit.get_cusol():TPoint;
var
  aPos:TPoint;
begin
  GetCaretPos(aPos);
  aPos.Y := aPos.Y + Abs(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.Font.Height);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.ClientToScreen(apos);

end;

function TWindows_unit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := function_unit.editlist.Items[i].SynEdit1.CaretY -1;
    function_unit.editlist.Items[i].SynEdit1.SelStart:= i1;
    function_unit.editlist.Items[i].SynEdit1.SelText := data;
  end else if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    i1 := SendMessage(function_unit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, function_unit.editlist.Items[i].Memo1.SelStart, 0);
    function_unit.editlist.Items[i].Memo1.SelStart:= i1;
    function_unit.editlist.Items[i].Memo1.SelText := data;
  end;
end;

function TWindows_unit.pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];


    //sd.CommandLine := 'sudo';
    sd.Execute;
    //sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := 'open' + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := 'pass';

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function TWindows_unit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    //ps := form1.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S ' + command );
    sv.Execute;
    sv.Free;
end;

{$ENDIF}
{$IFDEF LINUX}

function TWindows_unit.memoload(i:integer;s:string):boolean;
  function encode_charset(i:integer;memo:Tstringlist):boolean;
  begin
    if Main.Menu_Utf16.Checked then begin
      //memo.LoadFromFile((utf16toutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (utf16toutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (utf16toutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (ansitoutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (ansitoutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
       function_unit.editlist.Items[i].Synedit1.Text:=memo.Text;
       function_unit.editlist.Items[i].memo1.Text:= memo.Text;
       encode_charset := true;
    end;
  end;
begin
  try
    function_unit.editlist.Items[i].Edit.LoadFromFile((utf8toansi(s)));
  finally
    try
      encode_charset(i,function_unit.editlist.Items[i].Edit);
    finally

    end;
  end;
end;

function TWindows_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
  function encode_charset(i:integer;memo:TStringList):boolean;
  begin
    if function_unit.editlist.Items[i].char_sets = 'UTF16' then begin
      memo.Text:= (utf8toutf16(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'ANSI' then begin
      memo.Text:= (utf8toansi(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
    end;
  end;
begin
    encode_charset(i,memo);
  try
    memo.SaveToFile(utf8toansi((s)));
  finally

  end;
end;

function Twindows_unit.get_cusol():TPoint;
var
  aPos:TPoint;
begin
  //GetCaretPos(aPos);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.CaretXY;
  aPos.Y := aPos.Y + Abs(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.Font.Height);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.ClientToScreen(apos);

end;

function TWindows_unit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.SelStart:= i1;
    function_unit.editlist.Items[i].SynEdit1.CaretY:=function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.CaretX:=function_unit.editlist.Items[i].SynEdit1.CaretXY.X;
    function_unit.editlist.Items[i].SynEdit1.SelText := data;
  end else if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    i1 := function_unit.editlist.Items[i].Memo1.CaretPos.Y;  //SendMessage(function_unit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, function_unit.editlist.Items[i].Memo1.SelStart, 0);
    function_unit.editlist.Items[i].Memo1.SelStart:= i1;
    function_unit.editlist.Items[i].Memo1.SelText := data;
  end;
end;

function TWindows_unit.pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];


    //sd.CommandLine := 'sudo';
    sd.Execute;
    //sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := set_name + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := 'm0jpw10p';

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function TWindows_unit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    //ps := form1.password;

    sv.Executable:= '/bin';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' {+ps+ ' | sudo -S '} + command );
    sv.Execute;
    sv.Free;
end;

{$ENDIF}


{$IFDEF Darwin}

function TWindows_unit.memoload(i:integer;s:string):boolean;
  function encode_charset(i:integer;memo:Tstringlist):boolean;
  begin
    if Main.Menu_Utf16.Checked then begin
      //memo.LoadFromFile((utf16toutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (utf16toutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (utf16toutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (ansitoutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (ansitoutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
       function_unit.editlist.Items[i].Synedit1.Text:=memo.Text;
       function_unit.editlist.Items[i].memo1.Text:= memo.Text;
       encode_charset := true;
    end;
  end;
begin
  try
    function_unit.editlist.Items[i].Edit.LoadFromFile((utf8toansi(s)));
  finally
    try
      encode_charset(i,function_unit.editlist.Items[i].Edit);
    finally

    end;
  end;
end;

function TWindows_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
  function encode_charset(i:integer;memo:TStringList):boolean;
  begin
    if function_unit.editlist.Items[i].char_sets = 'UTF16' then begin
      memo.Text:= (utf8toutf16(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'ANSI' then begin
      memo.Text:= (utf8toansi(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
    end;
  end;
begin
    encode_charset(i,memo);
  try
    memo.SaveToFile(utf8toansi((s)));
  finally

  end;
end;

function Twindows_unit.get_cusol():TPoint;
var
  aPos:TPoint;
begin
  //GetCaretPos(aPos);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.CaretXY;
  aPos.Y := aPos.Y + Abs(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.Font.Height);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.ClientToScreen(apos);

end;

function TWindows_unit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.SelStart:= i1;
    function_unit.editlist.Items[i].SynEdit1.CaretY:=function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.CaretX:=function_unit.editlist.Items[i].SynEdit1.CaretXY.X;
    function_unit.editlist.Items[i].SynEdit1.SelText := data;
  end else if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    i1 := function_unit.editlist.Items[i].Memo1.CaretPos.Y;  //SendMessage(function_unit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, function_unit.editlist.Items[i].Memo1.SelStart, 0);
    function_unit.editlist.Items[i].Memo1.SelStart:= i1;
    function_unit.editlist.Items[i].Memo1.SelText := data;
  end;
end;

function TWindows_unit.pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];


    //sd.CommandLine := 'sudo';
    sd.Execute;
    //sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := form1.Edit19.Text + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := form1.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function TWindows_unit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    ps := form1.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S ' + command );
    sv.Execute;
    sv.Free;
end;

{$ENDIF}

procedure Twindows_unit.FormCreate(Sender: TObject);
begin

end;

end.

