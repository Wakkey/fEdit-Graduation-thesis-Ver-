unit LinuxUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TLinux_unit }

  TLinux_unit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function memoload(i:integer;s:string):boolean;
    function memosave(i:integer;s:string;memo:TStringList):boolean;
  end;

var
  Linux_unit: TLinux_unit;

implementation

uses mainform, functionunit;

{$R *.lfm}

{ TLinux_unit }

function UTF8ToUTF16(const S: AnsiString):WIdeString;
begin
  UTF8ToUTF16 := s;
end;

function UTF16ToUTF8(const S: WIdeString):AnsiString;
begin
  UTF16ToUTF8 := s;
end;

function TLinux_unit.memoload(i:integer;s:string):boolean;
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

function TLinux_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
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

procedure TLinux_unit.FormCreate(Sender: TObject);
begin

end;

end.

