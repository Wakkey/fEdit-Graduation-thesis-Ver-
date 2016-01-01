unit interfaceunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, menus, fpjson, jsonparser;

type

  { Tinterface_unit }

  Tinterface_unit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

    {Main menu}
    function addnew_tab(sw:boolean):boolean;
    function new():boolean;
    function open(FileNames: String):boolean;
    function reopen(Tabs:integer):boolean;
    function saveas(Tabs:integer):boolean;
    function save(Tabs:integer):boolean;
    function allsaveas():boolean;
    function allsave():boolean;
    function char_set(SetTab:integer;char_type:string):boolean;
    function close(CloceTab:integer;sw:boolean):boolean;
    function Allclose():boolean;
    function exitAPP():boolean;
    {Edit menu}
    function undo():boolean;
    function redo():boolean;
    function cut():boolean;
    function copy():boolean;
    function past():boolean;
    function selectAll():boolean;
    function delete():boolean;
    function Calendar(Tabs:integer):boolean;
    function Time(Tabs:integer):boolean;
    function Calac(Tabs:integer):boolean;

    {Find Menu}
    function findwindow():boolean;

    function find1page(i:integer;find_base,find_output:TStringlist):boolean;
    function findallpage():boolean;
    function selselect(Tabs:integer): boolean;

    function HelpGoogl(word,helpword:string):boolean;
    function findsearch:string;

    {Option Menu}
    function colordlgopen(typesw:integer):boolean;
    function memofont:boolean;

    function toolbaraligin(s:string):string;

    {interface unit}
    function memoload(i:integer;s:string):boolean;
    function memosave(i:integer;s:string;memo:TStringList):boolean;

    function Mcrocheck(send:TObject;sw:boolean):boolean;
    function macro_run(file_name:string):boolean;
    function CodeRun:boolean;
    function MacroInsart(i:integer;Lng:string):boolean;
    function LngeMenu_copy:boolean;

    function JsonParse(ST,ST2:TStringlist;findword:string):boolean;
  end;

var
  interface_unit: Tinterface_unit;

implementation

uses functionunit, mainform, comp,windowsunit,
  {$IFDEF WIN32}
    windows,
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  find_unit, colordlg,
  tool_window;

{$R *.lfm}

{ Tinterface_unit }

//---Main unit function---

function Tinterface_unit.memoload(i:integer;s:string):boolean;
begin
        {$IFDEF WIN32}
           windows_unit.memoload(i,s);
        {$ENDIF}
        {$IFDEF LINUX}
           function_unit.editlist.Items[i].Edit.LoadFromFile(function_unit.editlist.Items[i].filename_path);
        {$ENDIF}
        {$IFDEF Darwin}
           function_unit.editlist.Items[i].Edit.LoadFromFile(function_unit.editlist.Items[i].filename_path);
        {$ENDIF}

end;

function Tinterface_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
begin
        {$IFDEF WIN32}
             windows_unit.memosave(i,s,memo);
        {$ENDIF}
        {$IFDEF LINUX}
           function_unit.editlist.Items[i].Edit.SaveToFile(function_unit.editlist.Items[i].filename_path);
        {$ENDIF}
        {$IFDEF Darwin}
           function_unit.editlist.Items[i].Edit.SaveToFile(function_unit.editlist.Items[i].filename_path);
        {$ENDIF}
end;

procedure Tinterface_unit.FormCreate(Sender: TObject);
begin

end;

function Tinterface_unit.addnew_tab(sw:boolean):boolean;
begin
  if sw then begin
    Main.PageControl1.AddTabSheet;
    Main.PageControl1.Page[Main.PageControl1.PageCount-1].Caption:= 'ADD';
    Main.PageControl1.ActivePageIndex := Main.PageControl1.PageCount -2;
  end else begin
    if Main.PageControl1.PageCount > 0 then begin
      if Main.PageControl1.Pages[Main.PageControl1.PageCount-1].Caption = 'ADD' then begin
        Main.PageControl1.Pages[Main.PageControl1.PageCount-1].Destroy;
      end;
    end;
  end;
end;

function Tinterface_unit.new():boolean;
var
  i:integer;
begin
  new := false;
  try

    interface_unit.addnew_tab(false);
    Main.PageControl1.AddTabSheet;
    main.PageControl1.PageIndex:= main.PageControl1.PageCount-1;
    i := main.PageControl1.PageIndex;
    function_unit.newwindow(i);
    function_unit.window_off(i);
    interface_unit.addnew_tab(true);
    function_unit.LoadHighLightColorPriSet(function_unit.HighlintColorIndex);
    if function_unit.editlist.Count -1 <> 0 then begin
      function_unit.editlist.Items[i].AllowDropFiles := true;
      function_unit.editlist.Items[i].SynEdit1.Color := function_unit.editlist.Items[i-1].SynEdit1.Color;
      function_unit.editlist.Items[i].SynEdit1.Font := function_unit.editlist.Items[i-1].SynEdit1.font;

      function_unit.editlist.Items[i].SynEdit1.ClearAll;
    end;
    //function_unit.LoadHighLightColorPriSet(function_unit.HighlintColorIndex);
  finally
    new := true;
  end;
end;

function Tinterface_unit.open(FileNames: String):boolean;
var
  i2:integer;
  function opfiles(i,i1:integer):boolean;
  var
    s:string;
  begin
    try
      new();
      //i := main.PageControl1.ActivePageIndex;
      function_unit.editlist.Items[i].filename_path:= DataModule1.OpenDialog1.Files[i1];
      function_unit.editlist.Items[i].OpenDialog1.FileName:= DataModule1.OpenDialog1.Files[i1];
      function_unit.editlist.Items[i].nameing_complate:= true;
      main.PageControl1.ActivePage.Caption:= extractfilename(DataModule1.OpenDialog1.Files[i1]);
      function_unit.TitleSet(
        DataModule1.OpenDialog1.Files[i1]
      );

      s := extractfileext(DataModule1.OpenDialog1.Files[i1]);
      //showmessage(s);
      case s of
        '.txt':;
        '.html':Main.Menu_HTMLClick(Main.Menu_HTML);
        '.htm':Main.Menu_HTMLClick(Main.Menu_HTML);
        '.js':Main.Menu_JSClick(Main.Menu_JS);
        '.json':Main.Menu_JsnClick(Main.Menu_jsn);
        '.xml':Main.Menu_XMLClick(Main.Menu_XML);
        '.pas':Main.Menu_DelphiClick(Main.Menu_Delphi);
        '.c':Main.Menu_CClick(Main.Menu_C);
        '.h':Main.Menu_CClick(Main.Menu_C);
        '.cpp':Main.Menu_CClick(Main.Menu_C);
        '.sql':Main.Menu_SQLClick(Main.Menu_SQL);
        '.css':Main.Menu_CssClick(Main.Menu_Css);
        '.parl':Main.Menu_PerlClick(Main.Menu_Perl);
        '.php':Main.Menu_PHPClick(Main.Menu_PHP);
        '.vb':Main.Menu_VBScriptClick(Main.Menu_VBScript);
        '.bat':Main.Menu_BATClick(Main.Menu_BAT);
        '.ini':Main.Menu_INIClick(Main.Menu_INI);
        '.java':Main.Menu_JavaClick(Main.Menu_Java);
        '.sh':Main.MenuI_UnixShellClick(Main.MenuI_UnixShell);
      end;

      interface_unit.memoload(i,function_unit.editlist.Items[i].filename_path);

      with function_unit.editlist.Items[i] do begin
        if PageControl1.ActivePage =  TabSheet1 then begin
          SynEdit1.Lines.Text := edit.Text;
        end else if PageControl1.ActivePage = TabSheet2 then begin
          Memo1.Lines.Text:= edit.Text;
        end;
      end;
    except
      showmessage('ファイル 「' +
        function_unit.editlist.Items[i].filename_path +
        '」を開けませんでした。'
      );
      open := false;
    end;
  end;
begin
  if FileNames = '' then begin
    open := false;
    if not DataModule1.OpenDialog1.Execute then
      exit;
    for i2 := 0 to DataModule1.OpenDialog1.Files.Count -1 do begin;
      opfiles(main.PageControl1.ActivePageIndex+1,i2);
    end;
  end else begin
    DataModule1.OpenDialog1.Files.Clear;
    DataModule1.OpenDialog1.Files.Add(FileNames);
    opfiles(main.PageControl1.ActivePageIndex+1,0);
    //function_unit.count_window;
  end;

  open := true;
end;


function Tinterface_unit.reopen(Tabs:integer):boolean;
var
  i:integer;
begin
  reopen := false;
  try
    try
      i := Tabs;
      with function_unit.editlist.Items[i] do begin
        function_unit.TitleSet(function_unit.editlist.Items[i].filename_path);

        interface_unit.memoload(i,function_unit.editlist.Items[i].filename_path);

        if PageControl1.ActivePage =  TabSheet1 then begin
          SynEdit1.Lines.Text := edit.Text;
        end else if PageControl1.ActivePage = TabSheet2 then begin
          Memo1.Lines.Text:= edit.Text;
        end;
      end;
    except
    showmessage('ファイル 「' +
      function_unit.editlist.Items[i].filename_path +
      '」を開けませんでした。'
    );
      reopen := false;
    end;
  finally
    reopen := true;
  end;
end;

function Tinterface_unit.saveas(Tabs:integer):boolean;
var
  i:integer;
  sw:boolean;
begin
  saveas := false;
  i := tabs;
  sw :=  not true;//trueで実験開始用フラグ
  if not sw then begin
  function_unit.editlist.Items[i].SaveDialog1.FileName:= function_unit.editlist.Items[i].filename_path;
  try
    try
      if not function_unit.editlist.Items[i].SaveDialog1.Execute then
        exit;
    except

    end;
  finally

  end;
  if function_unit.editlist.Items[i].save_complate then
    exit;
  end;
  function_unit.editlist.Items[i].filename_path:= function_unit.editlist.Items[i].SaveDialog1.Filename;
  function_unit.editlist.Items[i].SaveDialog1.FileName:= function_unit.editlist.Items[i].SaveDialog1.Filename;
  main.PageControl1.ActivePage.Caption:= extractfilename(function_unit.editlist.Items[i].SaveDialog1.Filename);
  function_unit.TitleSet(function_unit.editlist.Items[i].filename_path);
  with function_unit.editlist.Items[i] do begin
    try
      if PageControl1.ActivePage =  TabSheet1 then begin
        edit.Text := SynEdit1.Lines.Text;
      end else if PageControl1.ActivePage = TabSheet2 then begin
        edit.Text := Memo1.Lines.Text;
      end;

      interface_unit.memosave(i,function_unit.editlist.Items[i].filename_path,function_unit.editlist.Items[i].Edit);

      nameing_complate := true;
      save_complate := true;
    except
      showmessage('ファイル 「' +
      function_unit.editlist.Items[i].filename_path +
      '」を保存できませんでした。'
      );
    end;
  end;

  saveas := true;
end;

function Tinterface_unit.save(Tabs:integer):boolean;
var
  i:integer;
begin
  save := false;
  try
      i := Tabs;

      with function_unit.editlist.Items[i] do begin
        if (not nameing_complate) and (not save_complate) then begin
          saveas(i);
          exit;
        end;
        if save_complate then
          exit;
        if PageControl1.ActivePage =  TabSheet1 then begin
          edit.Text := SynEdit1.Lines.Text;
        end else if PageControl1.ActivePage = TabSheet2 then begin
          edit.Text := Memo1.Lines.Text;
        end;
        function_unit.TitleSet(function_unit.editlist.Items[i].filename_path);

        interface_unit.memosave(i,function_unit.editlist.Items[i].filename_path,function_unit.editlist.Items[i].Edit);

        save_complate := true;
      end;
  except
    showmessage('ファイル 「' +
      function_unit.editlist.Items[i].filename_path +
      '」を保存できませんでした。'
      );
  end;
  save := true;
end;

function Tinterface_unit.allsaveas():boolean;
var
  i:integer;
begin
  for i := 0 to main.PageControl1.PageCount -2 do begin
    //コメントは実験開始用コード
    if 0 < i -2 then begin
      function_unit.editlist.Items[i].SaveDialog1.FileName := extractfilepath(function_unit.editlist.Items[1].filename_path) + inttostr(i-2) + '.csv';
      saveas(i);
    end;
  end;
end;

function Tinterface_unit.allsave():boolean;
var
  i:integer;
begin
  for i := 0 to main.PageControl1.PageCount -2 do begin
    save(i);
  end;
end;

function Tinterface_unit.char_set(SetTab:integer;char_type:string):boolean;
var
  i:integer;
begin
  i := SetTab;
      if char_type = 'ANSI' then begin
        Main.Menu_UTF8.Checked:= false;
        Main.Menu_UTF16.Checked:= false;
        Main.Menu_Ansi.Checked:= true;
        function_unit.str_charsets(i,char_type);
      end else if char_type = 'UTF8' then begin
        Main.Menu_UTF8.Checked:= true;
        Main.Menu_UTF16.Checked:= false;
        Main.Menu_Ansi.Checked:= false;
        function_unit.str_charsets(i,char_type);
      end else if char_type = 'UTF16' then begin
        Main.Menu_UTF8.Checked:= false;
        Main.Menu_UTF16.Checked:= true;
        Main.Menu_Ansi.Checked:= false;
        function_unit.str_charsets(i,char_type);
      end;
end;

function Tinterface_unit.close(CloceTab:integer;sw:boolean):boolean;
var
  i:integer;
begin
  i := CloceTab;
  if i < 0 then
    exit;
  interface_unit.addnew_tab(false);
  main.PageControl1.ActivePageIndex:=i;
  function_unit.editlist.Items[i].Close;
  dec(function_unit.count_window);
  main.PageControl1.ActivePage.Destroy;
  if not sw then
    interface_unit.addnew_tab(true);
end;

function Tinterface_unit.Allclose():boolean;
var
  i,i1:integer;
begin
  interface_unit.addnew_tab(false);
  i1 := main.PageControl1.PageCount -2;
  for i := 0 to main.PageControl1.PageCount -2 do begin
    interface_unit.close(i1,false);
    dec(i1)
  end;
end;

function Tinterface_unit.exitAPP():boolean;
var
  i:integer;
begin
  i:=0;
  exitAPP := false;
  try
    interface_unit.allsave();
    inc(i);
    function_unit.iniwrite();
    //interface_unit.Allclose();
    //inc(i)
  except
    showmessage('終了に失敗しました。'+chr(13)+'エラーコード '+inttostr(i));
  end;
  exitAPP := true;
end;



function Tinterface_unit.undo():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.Undo;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.Undo;
    end;

  end;
end;

function Tinterface_unit.redo():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.Redo;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.Undo;
    end;

  end;
end;

function Tinterface_unit.cut():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.CutToClipboard;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.CutToClipboard;
    end;

  end;
end;

function Tinterface_unit.copy():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.CopyToClipboard;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.CopyToClipboard;
    end;

  end;
end;

function Tinterface_unit.past():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.PasteFromClipboard;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.PasteFromClipboard;
    end;

  end;
end;

function Tinterface_unit.selectAll():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.SelectAll;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.SelectAll;
    end;

  end;
end;

function Tinterface_unit.delete():boolean;
begin
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.SelText:= '';
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.SelText:= '';
    end;

  end;
end;

function Tinterface_unit.Calendar(Tabs:integer):boolean;
var
  i:integer;
begin
  i := tabs;
  if not Datamodule1.CalendarDialog1.Execute then
    exit;
  Datamodule1.CalendarDialog1.date := now;

  Windows_unit.insert_text(i,datetostr(Datamodule1.CalendarDialog1.Date));


end;

function Tinterface_unit.Time(Tabs:integer):boolean;
var
  i:integer;
begin
  i := tabs;
  Windows_unit.insert_text(i,Timetostr(now));

end;

function Tinterface_unit.Calac(Tabs:integer):boolean;
var
  i:integer;
begin
  i := tabs;
  if not Datamodule1.CalculatorDialog1.Execute then
    exit;

    Windows_unit.insert_text(i,floattostr(Datamodule1.CalculatorDialog1.Value));

end;

//---Main unit function---

function Tinterface_unit.find1page(i:integer;find_base,find_output:TStringlist):boolean;
var
  i1,i2,i3,i4,i5:integer;
  s:string;
  sw :boolean;
  st1,st2,st3:TStringList;
begin
  find_base.Text:= function_unit.editlist.Items[i].Edit.Text;

  st1 := TStringList.Create;
  st1.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  st3 := TStringList.Create;
  st3.Clear;

  function_unit.findtext_test1(find_form.FIndTextAlia.Text,find_base,st1,0);
  function_unit.findtext_test2(find_form.FIndTextAlia.Text,find_base,st2,0);
  for i1 := 0 to st1.Count -1 do begin
    if (st1[i1] <> '0') or (st2[i1] <> '0') then
      st3.Add(inttostr(strtoint(st2[i1])+1) + '行' + (st1[i1]) + '文字目');
  end;
  function_unit.findtext(find_form.FIndTextAlia.Text,find_base,find_output,0);
  find_form.Listbox2.Items.Text:= st3.Text;
  find_form.TabControl1.Tabs.Add(
    main.PageControl1.Pages[i].Caption
  );
  //find_output.Text := st3.Text;
    st1.Free;
    st2.Free;
    st3.Free;
  //実験開始用フラグ＝true
  sw := not true;
  {if sw then begin
    //st1 := TStringList.Create;
    //st1.Clear;
    st2 := TStringList.Create;
    st2.Clear;
    //st3 := TStringList.Create;
    //st3.Clear;

     i5 :=0;
    for i2 := 0 to main.PageControl1.PageCount -2 do begin
      interface_unit.new();

      for i3:= 0 to function_unit.editlist.Items[1].SynEdit1.Lines.Count -1 do begin
        function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines.Add(inttostr(i3));
      end;
      if i5 <= 8 then
        i5 := i2 + 2;
      for i4 := 0 to function_unit.editlist.Items[i5].SynEdit1.Lines.Count -1 do begin
        st1.Clear;
        st2.Clear;
        st3.Clear;
        s := function_unit.editlist.Items[i2+2].SynEdit1.Lines[i4];
        function_unit.findtext(s,find_base,st1,0);
        function_unit.findtext_test1(s,find_base,st2,0);
        //function_unit.findtext_test2(s,find_base,st2,0);
       { function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines[0] :=
          function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines[0] + ', "'+s+'"';
        for i1 := 1 to st2.Count -1 do begin
          function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines[i1] :=
          function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines[i1] +
          ' , ' + st2[i1];
        end;}
        //s := '0';
        for i1 := 0 to st1.Count -1 do begin
          st3.Add(((st1[i1]) + '行' + (st2[i1]) + '文字目'));
        end;{
        function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines[st2.Count -1] :=
        function_unit.editlist.Items[function_unit.count_window-1].SynEdit1.Lines[st2.Count -1] +
          ' , ' + s;}
      end;
    end;
    //interface_unit.allsaveas();
    find_output.Text := st3.Text;
    st1.Free;
    st2.Free;
    st3.Free;
  end;}
end;

function Tinterface_unit.findallpage():boolean;
var
  i:integer;
  s1,s2:TStringList;
begin
  s1 := TStringList.Create;
  s1.Clear;
  s2 := TStringList.Create;
  s2.Clear;


  find_form.Memo1.Clear;
  for i := 0 to 255 do begin
    find_form.Listset[i].Clear;
  end;
  for i := 0 to Main.PageControl1.PageCount -2 do begin
    s1.Clear;
    s2.Clear;
    s1.Text := function_unit.editlist.Items[i].Edit.Text;
    interface_unit.find1page(i,s1,s2);
    find_form.Listset[i].Text:= s2.Text;
    find_form.Listset2[i].Text:= find_form.ListBox2.Items.Text;
    find_form.Memo1.Lines.Add(inttostr(i));
    //chekfinds;
  end;
  find_form.TabControl1.TabIndex:= find_form.TabControl1.Tabs.Count -1;

end;

function Tinterface_unit.findwindow():boolean;
begin
  find_form.Show;
end;

function Tinterface_unit.selselect(Tabs:integer): boolean;
var
  findpos:integer;
  i:integer;
begin
  i := tabs;
  //MainForm.findpage := StrToInt(color_form.Memo1.Lines[tabset1.TabIndex]);
  if find_form.listbox2.ItemIndex = -1 then begin
    if find_form.listbox2.Items.Count > 0 then begin
      find_form.listbox2.ItemIndex := 0;
    end else begin
      exit;
    end;
  end;
  findpos := StrToInt(find_form.ListBox1.Items[find_form.listbox2.ItemIndex]);
  with function_unit.editlist.Items[main.PageControl1.PageIndex] do begin
    if PageControl1.ActivePage =  TabSheet1  then begin
      function_unit.editlist.Items[i].SynEdit1.SelStart := findpos;
      //function_unit.editlist.Items[i].SynEdit1.CaretY := function_unit.editlist.Items[i].SynEdit1.BlockBegin.y;
      //function_unit.editlist.Items[i].SynEdit1.CaretX := function_unit.editlist.Items[i].SynEdit1.BlockBegin.x;
      function_unit.editlist.Items[i].SynEdit1.selend := findpos + length(find_form.FIndTextAlia.Text);
    end else if PageControl1.ActivePage =  TabSheet2 then  begin
      function_unit.editlist.Items[i].memo1.SelStart := findpos -1;

      function_unit.editlist.Items[i].memo1.SelLength := length(find_form.FIndTextAlia.Text);
    end;
  end;
end;

function Tinterface_unit.findsearch:string;
var
  i:integer;
begin
  i := Main.PageControl1.ActivePageIndex;
  with function_unit.editlist.Items[i] do begin
    if main.mnu_SelectORline.Checked then begin
      if PageControl1.ActivePage =  TabSheet1 then begin
        findsearch := SynEdit1.SelText;
      end else begin
        findsearch := Memo1.SelText;
      end;
    end else begin
      if PageControl1.ActivePage =  TabSheet2 then begin
        findsearch := SynEdit1.Lines[SynEdit1.CaretY -1];
      end else begin
        with Memo1 do begin
          //SelStart := SendMessage(RichEdit1.Handle, EM_LINEINDEX, StrToInt(1) - 1, 0);
                  {$IFDEF WIN32}
                     findsearch := Lines[SendMessage(Handle, EM_LINEINDEX, SelStart, 0)];
                  {$ENDIF}
                  {$IFDEF LINUX}
                      findsearch := Lines[memo1.CaretPos.Y];
                  {$ENDIF}
                  {$IFDEF MacOSX}

                  {$ENDIF}

        end;
      end;
    end;
  end;
end;

function Tinterface_unit.HelpGoogl(word,helpword:string):boolean;
var
 url1,url2,url3,url4:string;
begin
  url2 := utf8toansi('');
  url4 := utf8toansi('');
  if helpword <> 'url' then begin
  if Main.Menu_C.Checked then
    url3 := Main.Menu_C.Caption
  else if Main.Menu_Delphi.Checked then
    url3 := Main.Menu_Delphi.Caption
  else if Main.Menu_Pascal.Checked then
    url3 := Main.Menu_Pascal.Caption
  else if Main.Menu_Java.Checked then
    url3 := Main.Menu_Java.Caption
  else if Main.Menu_SQL.Checked then
    url3 := Main.Menu_SQL.Caption
  else if Main.Menu_XML.Checked then
    url3 := Main.Menu_XML.Caption
  else if Main.Menu_HTML.Checked then
    url3 := Main.Menu_HTML.Caption
  else if Main.Menu_Css.Checked then
    url3 := Main.Menu_Css.Caption
  else if Main.Menu_Perl.Checked then
    url3 := Main.Menu_Perl.Caption
  else if Main.Menu_PHP.Checked then
    url3 := Main.Menu_PHP.Caption
  else if Main.Menu_pyhton.Checked then
    url3 := Main.Menu_pyhton.Caption
  else if Main.MenuI_UnixShell.Checked then
    url3 := Main.MenuI_UnixShell.Caption
  else if Main.Menu_VBScript.Checked then
    url3 := Main.Menu_VBScript.Caption
  else if Main.Menu_BAT.Checked then
    url3 := Main.Menu_BAT.Caption
  else if Main.MenuItem38.Checked then
    url3 := Main.MenuItem38.Caption
  else if Main.MenuItem42.Checked then
    url3 := Main.MenuItem42.Caption
  else if Main.MenuItem20.Checked then
    url3 := Main.MenuItem20.Caption
  else if Main.MenuItem12.Checked then
    url3 := Main.MenuItem12.Caption
  else if Main.Menu_FreeHeightLight.Checked then
    url3 := ''
  else if Main.Menu_lazarus.Checked then
    url3 := Main.Menu_lazarus.Caption
  else
    url3 := '';
  url2 := utf8toansi(interface_unit.findsearch);
  url4 := utf8toansi(' ' + helpword);
  end;
  url1 := utf8toansi(word);
  if function_unit.editlist.Items[main.PageControl1.ActivePageIndex].PageControl1.PageIndex = 1 then
    url3 := '';
  {$IFDEF WIN32}
     ShellExecute(Handle, 'OPEN', pchar(url1 + url2 + ' ' + url3 + url4), '', '', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
end;

function Tinterface_unit.colordlgopen(typesw:integer):boolean;
begin
  if typesw = 1 then begin
    color_form.PageControl1.ActivePageIndex:= 0;
  end else  if typesw = 2 then begin
    color_form.PageControl1.ActivePageIndex:= 1;
  end else  if typesw = 3 then begin
    color_form.PageControl1.ActivePageIndex:= 2;
  end else  if typesw = 4 then begin
    color_form.PageControl1.ActivePageIndex:= 3;
  end else if typesw = 5 then begin
    color_form.PageControl1.ActivePageIndex:= 4;
  end;
  color_form.Show;
end;

function Tinterface_unit.memofont:boolean;
var
  i:integer;
begin
  i := Main.PageControl1.ActivePageIndex;


    datamodule1.fontdialog1.Font := function_unit.editlist.Items[i].SynEdit1.Font;
    datamodule1.fontdialog1.Font := function_unit.editlist.Items[i].Memo1.Font;

  if not datamodule1.fontdialog1.Execute then
    exit;
    function_unit.editlist.Items[i].SynEdit1.Font := datamodule1.fontdialog1.Font;
    function_unit.editlist.Items[i].Memo1.Font := datamodule1.fontdialog1.Font;

end;

function Tinterface_unit.toolbaraligin(s:string):string;
var
  i:integer;
begin
  if s = '?' then begin
    if Main.PageControl1.TabPosition = Main.PageControl1.TabPosition.tpleft then
      toolbaraligin := 'left';
    if Main.PageControl1.TabPosition = Main.PageControl1.TabPosition.tpright then
      toolbaraligin := 'right';
    if Main.PageControl1.TabPosition = Main.PageControl1.TabPosition.tptop then
      toolbaraligin := 'top';
    if Main.PageControl1.TabPosition = Main.PageControl1.TabPosition.tpbottom then
      toolbaraligin := 'bottom';

  end;

  if s = 'left'  then begin
    toolwindow.ToolBar2.Align:= alleft;
    toolwindow.PageControl1.Align:=alleft;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.TabPosition:=toolwindow.PageControl1.TabPosition.tpleft;
    main.PageControl1.TabPosition:=main.PageControl1.TabPosition.tpleft;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      function_unit.ptoolbar[i].AutoSize:= true;
      function_unit.ptoolbar[i].Align:= alleft;
    end;
  end;
  if s = 'right'  then begin
    toolwindow.ToolBar2.Align:= alright;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.Align:=alright;
    toolwindow.PageControl1.TabPosition:=toolwindow.PageControl1.TabPosition.tpright;
    main.PageControl1.TabPosition:=main.PageControl1.TabPosition.tpright;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      function_unit.ptoolbar[i].AutoSize:= true;
      function_unit.ptoolbar[i].Align:= alright;
    end;
  end;
  if s = 'top'  then begin
    toolwindow.ToolBar2.Align:= altop;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.Align:=altop;
    toolwindow.PageControl1.TabPosition:=toolwindow.PageControl1.TabPosition.tptop;
    main.PageControl1.TabPosition:=main.PageControl1.TabPosition.tptop;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      function_unit.ptoolbar[i].AutoSize:= true;
      function_unit.ptoolbar[i].Align:= altop;
    end;
  end;
  if s = 'bottom'  then begin
    toolwindow.ToolBar2.Align:= albottom;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.Align:=albottom;
    toolwindow.PageControl1.TabPosition:=toolwindow.PageControl1.TabPosition.tpbottom;
    main.PageControl1.TabPosition:=main.PageControl1.TabPosition.tpbottom;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      function_unit.ptoolbar[i].AutoSize:= true;
      function_unit.ptoolbar[i].Align:= albottom;
    end;
  end;
  if s = '' then begin
    if toolwindow.ToolBar2.Align = alleft then
      toolbaraligin:=('left')
    else if toolwindow.ToolBar2.Align = alright then
      toolbaraligin:=('right')
    else if toolwindow.ToolBar2.Align = altop then
      toolbaraligin:=('top')
    else if toolwindow.ToolBar2.Align = albottom then
      toolbaraligin:=('bottom');
  end;

  function_unit.resizedocwindow(main.PageControl1.ActivePageIndex);
end;


function Tinterface_unit.Mcrocheck(send:TObject;sw:boolean):boolean;
var
  i1:integer;
begin
      for i1 := 0 to function_unit.lng_mnu_count -1 do begin
        if function_unit.lng_mnu[i1] = send then begin
          function_unit.lng_mnu[i1].Checked:= sw;
          function_unit.macro_lng := function_unit.lng_mnu[i1].Caption;
        end else begin
          function_unit.lng_mnu[i1].Checked:= false;
        end;
      end;
end;

function Tinterface_unit.macro_run(file_name:string):boolean;
var
 url:string;
begin
  {$IFDEF WIN32}
    url := utf8toansi(file_name);
    ShellExecute(Handle, 'OPEN', pchar(url), '', '', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
end;

function macro(sl1,sl2:TStringlist):string;
var
  i,i1,start_pos,end_pos:integer;
begin
  for i := 0 to sl1.Count -1 do begin
    start_pos := ansipos('MacroStart',sl1[i]);
    if start_pos > 0 then begin
      i1 := i;
      start_pos := i;
    end;
  end;
  for i := 0 to function_unit.lng_mnu_count -1 do begin
    start_pos := ansipos(function_unit.lng_mnu[i].Caption,sl1[i1]);
    if start_pos > 0 then begin
      macro := function_unit.lng_mnu[i].Caption;
      //break;
    end;
  end;
  for i := 0 to sl1.Count -1 do begin
    end_pos :=  ansipos('MacroEnd',sl1[i]);
    if end_pos <> 0 then begin
      end_pos := i;
      break;
    end;
  end;
  for i := i1 +1 to end_pos -1 do begin
    sl2.Add( sl1[i] );
  end;
end;

function codesave:String;
var
 sorcename,langege:string;
 sl1,sl2:TStringList;
begin
  sorcename := ExtractFilePath( systoutf8(Paramstr(0))) +'test.';
  //ここに、切り取ったソースを保存するコードまたは関数を書く
  sl1 := TStringList.Create;
  sl2 := TStringList.Create;
  sl1.Text := function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.Text;
  sl2.Clear;
  function_unit.lun_macro := macro(sl1,sl2);
  langege := function_unit.lun_macro;
  if langege = '' then begin

  end else if langege = 'C' then begin
    sorcename := sorcename + 'c';
  end else if langege = 'Pascal' then begin
    sorcename := sorcename + 'pas';
  end else if langege = 'Lazarus' then begin
    sorcename := sorcename + 'pas';
  end else if langege = 'Delphi' then begin
    sorcename := utf8tosys(sorcename + 'pas');
  end else if langege = 'Java' then begin
    sorcename := sorcename + 'java';
  end else if langege = 'JavaScript' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'html');
  end else if langege = 'SQL' then begin
    sorcename := sorcename + 'sql';
  end else if langege = 'XML' then begin
    sorcename := sorcename + 'xml';
  end else if langege = 'HTML' then begin
    sorcename := sorcename + 'html';
  end else if langege = 'Css' then begin
    sorcename := sorcename + 'css';
  end else if langege = 'perl' then begin
    sorcename := sorcename + 'pl';
  end else if langege = 'PHP' then begin
    sorcename := sorcename + 'php';
  end else if langege = 'Pythton' then begin

  end else if langege = 'VBA' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'vbs');
  end else if langege = 'UNIX Shell Script' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'sh');
  end else if langege = 'Bat' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'bat');
  end;
  sl2.SaveToFile(sorcename);
  sl1.Free;
  sl2.Free;
  codesave := sorcename;
end;

function Tinterface_unit.CodeRun:boolean;
var
 url1,url2,url3,url4:string;
begin
    url3 := function_unit.lun_macro;
    url1 := utf8toansi('https://www.google.co.jp/search?q=');
    url2 := utf8toansi(codesave);
    url4 := utf8toansi('');
  {$IFDEF win32}

    ShellExecute(Handle, 'OPEN', pchar(url2), '', '', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}
    //Windows_unit.pross3(url2);
    windows_unit.pross(url2,'');
  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
end;

function insert_mark(i:integer;lng:string):boolean;
var
  comment:string;
  comment2:string;
begin
  case lng of
    'Bat':begin
       comment := '@echo';
       comment2 := '@echo off';
       function_unit.lngtype2 := 'echo on';
       function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY , function_unit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'JavaScript':begin
       comment := '//';
       comment2 := '<script type="text/javascript">';
       function_unit.lngtype2 := '</SCRIPT>';
       function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY , function_unit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'VBA':begin
       comment := '''';
       comment2 := '''';
       function_unit.lngtype2 := '''';
       function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY , function_unit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

  end;

  function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY ,  chr(13));
  function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY , comment + ' ここにマクロとして' + lng +'言語を記述します' + chr(13));
  function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY , comment2 + chr(13));
  function_unit.editlist.Items[i].SynEdit1.Lines.Insert(function_unit.editlist.Items[i].SynEdit1.CaretY , function_unit.lngtype1 + chr(13)+ ' MacroStart ' + lng);

end;

function Tinterface_unit.MacroInsart(i:integer;Lng:string):boolean;
begin
  try
    insert_mark(i,lng)
  except
    function_unit.editlist.Items[i].SynEdit1.Lines.Add(char(13));
    insert_mark(i,lng)
  end;

end;

function Tinterface_unit.LngeMenu_copy:boolean;
var
  i2,i3:integer;
begin
  function_unit.lng_mnu_count := 0;
  with color_form do begin
     for i2 := 0 to Main.Menu.Items.Count -1 do begin
      for i3 := 0 to Main.Menu.Items.Items[i2].Count -1 do begin
        if (Main.Menu.Items[i2].Items[i3].Caption = '-') or
            ( not Main.Menu.Items[i2].Items[i3].Visible ) or
             ( Main.Menu.Items[i2].Items[i3].Caption = '自由設定' ) or
             ( Main.Menu.Items[i2].Items[i3].Caption = '補完ライブラリ指定' ) then begin

      end else if Main.Menu.Items[i2].Caption = 'Edit設定' then begin
          function_unit.lng_mnu[i3] := TMenuItem.Create(self);
          function_unit.lng_mnu[i3].Name:= 'Lng_m' + inttostr(i3);
          function_unit.lng_mnu[i3].Caption:= Main.Menu.Items[i2].Items[i3].Caption;
          function_unit.lng_mnu[i3].OnClick:= Main.MenuC_chackmnu.OnClick;
          inc(function_unit.lng_mnu_count);
          Main.MenuItem4.Add(function_unit.lng_mnu[i3]);
        end;
      end;
    end;
  end;
  function_unit.macro_lng := function_unit.lng_mnu[0].Caption;
  function_unit.lng_mnu[0].Checked:= true;
end;


function TInterface_unit.JsonParse(ST,st2:TStringlist;findword:string):boolean;
var
  J: TJSONData;
begin
  try
    // Parse JSON Data to TJSONData
    J:=GetJSON(st.Text);
    // Get the value for the path in edtPath
    st2.Text:=J.FindPath(findword).AsString;
  except
    on E: Exception do ShowMessage('Error finding path!');
  end;


end;

end.

