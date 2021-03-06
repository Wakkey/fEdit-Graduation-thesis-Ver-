unit functionunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ComCtrls, unit_edit, mainform, tool_window;

type
  TeditList = class(TList)
  private
    function Get(Index: Integer): TEditform;
    procedure Put(Index: Integer; const Value: TEditform);
  public
    property Items[Index: Integer]: TEditform read Get write Put; default;
     destructor Destroy; override;
  end;
  { Tfunction_unit }

  Tfunction_unit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    saveep:array[0..255] of integer;
    fcolorset,bcolorset:string;

    o1:array[0..255] of integer;
    o2:array[0..255] of integer;
    b:array[0..50] of tbutton;
    tb:array[0..255] of tbutton;

    //colorset
    SymbolFrameColor,SymbolBackground,SymbolForeground,
    StringFrameColor,StringBackground,StringForeground,
    SpaceFrameColor,SpaceBackground,SpaceForeground,
    KeyFrameColor,KeyBackground,KeyForeground,
    IdentifierFrameColor,IdentifierBackground,IdentifierForeground,
    IDEDirectiveFrameColor,IDEDirectiveBackground,IDEDirectiveForeground,
    DirectiveFrameColor,DirectiveBackground,DirectiveForeground,
    commentFrameColor,commentBackground,commentForeground,
    caseFrameColor,caseBackground,caseForeground,
    asmFrameColor,asmBackground,asmForeground,
    DocumentFrameColor,DocumentBackground,DocumentForeground,
    InvalidFrameColor,InvalidBackground,InvalidForeground,
    NumberFrameColor,NumberBackground,NumberForeground,
    DirecFrameColor,DirecBackground,DirecForeground,
    DefaultPackageFrameColor,DefaultPackageBackground,DefaultPackageForeground,
    FunctionFrameColor,FunctionBackground,FunctionForeground,
    PLSQLFrameColor,PLSQLBackground,PLSQLForeground,
    SQLPlusFrameColor,SQLPlusBackground,SQLPlusForeground,
    TableNameFrameColor,TableNameBackground,TableNameForeground,
    VariableFrameColor,VariableBackground,VariableForeground,
    DocTypeFrameColor,DocTypeBackground,DocTypeForeground,
    NamespaceAttributeFrameColor,NamespaceAttributeBackground,NamespaceAttributeForeground,
    NamespaceAttributeValueFrameColor,NamespaceAttributeValueBackground,NamespaceAttributeValueForeground,
    ElementFrameColor,ElementBackground,ElementForeground,
    TextFrameColor,TextBackground,TextForeground,
    AndFrameColor,AndBackground,AndForeground,
    ASPFrameColor,ASPBackground,ASPForeground,
    UndefKeyFrameColor,UndefKeyBackground,UndefKeyForeground,
    ValueFrameColor,ValueBackground,ValueForeground,
    AttributeFrameColor,AttributeBackground,AttributeForeground,
    AttributeValueFrameColor,AttributeValueBackground,AttributeValueForeground,
    SectionFrameColor,SectionBackground,SectionForeground,
    ConstantFrameColor,ConstantBackground,ConstantForeground,
    ObjectFrameColor,ObjectBackground,ObjectForeground,
    SecondKeyFrameColor,SecondKeyBackground,SecondKeyForeground,
    varFrameColor,varBackground,varForeground,
    DefaultFrameColor,DefaultBackground,DefaultForeground,
    InvalidSymbolFrameColor,InvalidSymbolBackground,InvalidSymbolForeground,
    OperatorFrameColor,OperatorBackground,OperatorForeground,
    PragmaFrameColor,PragmaBackground,PragmaForeground
    :integer;
  public
    { public declarations }


    lng_mnu:array[0..20] of TMenuItem;
    lng_mnu_count:integer;
    macro_lng:string;
    lun_macro:string;
    lngtype1,lngtype2:string;

    MainTitle,version,Filename:string;
    editlist:TEditList;
    //lngtype1,lngtype2:string;
    synHL_No:integer;
    count_window:integer;
    m:array[0..255]of TMenuItem;
    NewSet:TStringList;
    TabpageNo:integer;
    p:array[0..100] of TTabSheet;
    p1:array[0..100] of TTabSheet;
    ptoolbar:array[0..100] of TToolbar;

    toolbar:string;
    toolbarset : boolean;
    HighlintColorIndex:integer;
    toolbarbuttoncount,toolbarbuttoncount2,
      toolbarbuttonparnt,toolbarbuttonparnt2,
      toolbarcount:TStringList;
    toolbar_deflut:boolean;
    toolbar_deflut2:boolean;
    toolbar_compreat:boolean;
    tabtoolbarcount:integer;

    readkey1,readkey2,readkey3,readkey4:string;
    macrocount:integer;
    r_name:array[0..10]of string;
    macro_c:array[0..10]of string;
    macro_p:array[0..10]of string;
    r:array[0..10]of TmenuItem;
    macro_comand:array[0..10]of string;
    macro_param:array[0..10]of string;
    listvkkey,listvkkey2:integer;
    popupkey,popupkey2:integer;
    type_editbox:TStringList;

    function boot():boolean;
    function create_StringList():boolean;
    function mnu_Load():boolean;
    function loadmenulist:boolean;
    function toolbar_start():boolean;

    function TitleSet(fname:string):boolean;
    function versionSet(ver:string):boolean;
    function window_off(i:integer):boolean;
    function newwindow(tabs:integer):boolean;
    function str_charsets(i:integer;s:string):string;
    function selselect: boolean;
    function findtext(fText:string;setText,getText:TStringList;X:integer):boolean;
    function findtext_test1(fText:string;setText,getText:TStringList;X:integer):boolean;
    function findtext_test2(fText:string;setText,getText:TStringList;X:integer):boolean;

    function reprace_selselect(pos:integer;find:string): boolean;
    function TXTReplace(): boolean;
    function reprace_macro(s,find,reprace:string;tabs:integer):boolean;
    function heighligthcheck(i:integer;sw:boolean):string;
    function synchang(i:integer):boolean;

    function TabAdd():boolean;

    function pas(s:string):boolean;
    function fpas(s:string):boolean;
    function cpp(s:string):boolean;
    function java(s:string):boolean;
    function sql(s:string):boolean;
    function xml(s:string):boolean;
    function html(s:string):boolean;
    function css(s:string):boolean;
    function vbs(s:string):boolean;
    function bat(s:string):boolean;
    function ini(s:string):boolean;
    function freeset(s:string):boolean;
    function unics(s:string):boolean;
    function php(s:string):boolean;
    function perl(s:string):boolean;
    function JS(s:string):boolean;
    function highlitercolorset(fgcolor,bgcolor,frcolor:integer;s:string):boolean;
    function seteditcolor(fcolor,bcolor,fgcolor,bgcolor,frcolor:integer):boolean;
    function editcolor(fcolor,bcolor:integer):boolean;
    function LoadHighLightColorPriSet(i:integer):integer;
    function LoadEditColorPriset(alist:TstringList):boolean;
    function HighLightColorPriSet(alist:TStringList):boolean;
    function editcolorset(Fcolor,Bcolor:string):boolean;

    function load(setfile,setname2:widestring):boolean;
    function save(setfile,setname1:widestring):boolean;

    function resizedocwindow(tabs:integer):boolean;
    function write_saves(tabs:integer;bool:boolean):boolean;
    function read_saves(i:integer):boolean;
    function write_names(i:integer; s:string):string;

    function SelectToolBarPreSet(i:integer):integer;
    function SelectToolBarPreSet2(i:integer):integer;
    function toolbuttonset_autoset(i:integer):boolean;
    function setToolBarPreSet(S:TstringList):boolean;
    function setToolBarPreSet2(St:TstringList):boolean;
    function settoolbar(S:TstringList):boolean;

    function loadtoobutton:boolean;
    function loadtoobutton2(btn_count:integer):boolean;

    function toolbuttonset(i,i1:integer):boolean;
    function toolbuttonset2(i,i1,i2,btn_count:integer):boolean;

    function pagenew(i:integer;Tabname:string):boolean;
    function pagenew2(i:integer;s:string):TComponent;

    function toolwindow_off:boolean;
    function tabseting1:boolean;
    function tabseting2:boolean;

    function deletebutton():boolean;
    function deletebutton2():boolean;

    function setdialog:boolean;

    function pagedelete(i:integer):boolean;
    function pageout:boolean;

    function iniread:boolean;
    function iniwrite:boolean;

    function macro(send:TObject):boolean;
    function macrosetup(i:integer):boolean;

    function json_Keword_parse(st,st1:TStringList):boolean;
  end;

var
  function_unit: Tfunction_unit;

implementation

uses interfaceunit, find_unit, comp, colordlg, macrow
  {$IFDEF WIN32}
    ,windowsunit,windows
  {$ENDIF}
  {$IFDEF LINUX}
    ,linuxunit
  {$ENDIF} ;

{$R *.lfm}

{ Tfunction_unit }
function TeditList.Get(Index: Integer): TEditform;
begin
  Result :=  TEditform( inherited Get(Index) );
end;

procedure TeditList.Put(Index: Integer; const Value: TEditform);
begin
  inherited Put( Index, Value );
end;

destructor TeditList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;

function UTF8ToUTF16(const S: AnsiString):WIdeString;
begin
  UTF8ToUTF16 := s;
end;

function UTF16ToUTF8(const S: WIdeString):AnsiString;
begin
  UTF16ToUTF8 := s;
end;

function Tfunction_unit.boot():boolean;
var
  i,i1:integer;
begin
  i := 0;
  boot := false;
  try
    main.AllowDropFiles := not true;

    function_unit.Filename:= '';
    function_unit.version:= '';;
    function_unit.versionSet('0.20');
    function_unit.TitleSet('');
    inc(i);
    function_unit.create_StringList();
    inc(i);
    toolwindow.Show;
    function_unit.toolwindow_off;
    function_unit.mnu_Load();
    {$IFDEF WIN32}
         inc(i);
         main.Menu_Ansi.Checked:= true;
    {$ENDIF}
    {$IFDEF LINUX}
         main.Menu_UTF8.Checked:= true;
    {$ENDIF}
    {$IFDEF MacOSX}
         main.Menu_UTF8.Checked:= true;
    {$ENDIF}
    inc(i);
    interface_unit.new();
    try
      function_unit.iniread;
     except
       //function_unit.frmpsnset;
       function_unit.iniwrite;
       function_unit.iniread;
     end;
     inc(i);
     function_unit.setdialog;
     inc(i);
     function_unit.toolbar_start();

     interface_unit.LngeMenu_copy;


     for i1 := 1 to ParamCount do begin
       interface_unit.open(ansitoutf8(Paramstr(i1)));
     end;
  except
    showmessage('起動に失敗しました。'+chr(13)+'エラーコード '+inttostr(i));
  end;
  boot := true;
end;

function Tfunction_unit.toolbar_start():boolean;
begin
   if not function_unit.toolbar_deflut then begin
      function_unit.loadtoobutton;
    end;
    interface_unit.toolbaraligin(function_unit.toolbar);
    if not function_unit.toolbarset then begin
      toolwindow.ToolBar2.Visible:= true;
    end else begin
      //MainForm.PageControl1.Visible:= true;
      color_form.CheckBox3.Checked:= true;
    end;
    color_form.CheckBox4Click(color_form.CheckBox4);
    if not function_unit.toolbar_deflut2 then begin
      function_unit.loadtoobutton2(function_unit.tabtoolbarcount);
    end;
end;

function Tfunction_unit.create_StringList():boolean;
begin
  try
        function_unit.NewSet := TStringList.Create;
        function_unit.NewSet.clear;

        function_unit.toolbarbuttoncount := TStringList.Create;
        function_unit.toolbarbuttoncount.Clear;
        function_unit.toolbarbuttoncount2 := TStringList.Create;
        function_unit.toolbarbuttoncount2.Clear;
        function_unit.toolbarbuttonparnt := TStringList.Create;
        function_unit.toolbarbuttonparnt.Clear;
        function_unit.toolbarbuttonparnt2 := TStringList.Create;
        function_unit.toolbarbuttonparnt2.Clear;
        function_unit.toolbarcount := TStringList.Create;
        function_unit.toolbarcount.Clear;

        //function_unit.iniread;
      except
       // function_unit.frmpsnset;
      //  function_unit.iniwrite;
       // function_unit.iniread;
      end;
end;

function Tfunction_unit.mnu_Load():boolean;
var
  i,i1,i2:integer;
begin
  i2 := 0;
  function_unit.loadmenulist;
      if function_unit.toolbar_deflut then begin
        function_unit.SelectToolBarPreSet(1);
        for i := 0 to Main.Menu.Items.Count -1 do begin
          inc(i2);
          for i1 := 0 to Main.Menu.Items[i].Count -1 do begin
            inc(i2);
          end;
        end;
        for i := 0 to i2 do begin
          function_unit.toolbuttonset_autoset(i);
        end;
      end else begin
      //function_unit.loadmenulist;
      end;
end;

function Tfunction_unit.loadmenulist:boolean;
var
  i,i1:integer;
begin
  i1 := 0;
  color_form.ListBox2.Items.Clear;
  for i := 0 to Main.Menu.Items.Count -1 do begin
    function_unit.o1[1] := i;
    for i1 := 0 to Main.Menu.Items.Items[i].Count -1 do begin
        color_form.ListBox2.Items.Add(Main.Menu.Items.Items[i].Items[i1].Caption);
        function_unit.o2[i1]  := i1;
    end;
  end;
end;


function Tfunction_unit.TitleSet(fname:string):boolean;
begin
  TitleSet := false;
  try
    function_unit.Filename:= fname;
    function_unit.MainTitle := 'fEdit ' + function_unit.version + '[' + function_unit.Filename + ']';
    main.Caption:= function_unit.MainTitle;
  except

  end;
  TitleSet := true;
end;

function Tfunction_unit.versionSet(ver:string):boolean;
begin
  versionSet := false;
  try
    function_unit.version:= ver;
    function_unit.MainTitle := 'fEdit ' + function_unit.version + '[' + function_unit.Filename + ']';
    main.Caption:= function_unit.MainTitle;
  except

  end;
  versionSet := true;
end;
function Tfunction_unit.newwindow(tabs:integer):boolean;
begin

  editlist.add(Teditform);
  editlist.Items[tabs] := Teditform.Create(self);
  editlist.Items[tabs].Visible:=false;
  editlist.Items[tabs].filename_path:= 'newfile' + inttostr(tabs);
  editlist.Items[tabs].char_sets:= 'UTF8';

  editlist.Items[tabs].OpenDialog1.Filter:=
  'AllFile|*.*|Text|*.txt|JavaScript|*.js|HTML|*.html;*.htm|Css|*.css|XML|*.xml|Java|*.java|C|*.c|C++|*.cpp|C hedder|*.h|C++ hedder|*.hpp|Pascal/Delphi|*.pas|PHP|*.php|UnixShell|*.sh|Bat|*.bat|INI|*.ini';
  editlist.Items[tabs].SaveDialog1.Filter:=
  'AllFile|*.*|Text|*.txt|JavaScript|*.js|HTML|*.html;*.htm|Css|*.css|XML|*.xml|Java|*.java|C|*.c|C++|*.cpp|C hedder|*.h|C++ hedder|*.hpp|Pascal/Delphi|*.pas|PHP|*.php|UnixShell|*.sh|Bat|*.bat|INI|*.ini';


  main.PageControl1.ActivePage.Caption:=
    editlist.Items[tabs].filename_path;
  function_unit.Filename:=editlist.Items[tabs].filename_path;
  editlist.Items[tabs].Visible:= true;
  function_unit.TitleSet(
    editlist.Items[tabs].filename_path
  );
  inc(function_unit.count_window);
  //editlist.Items[tabs].SynMemo1.Lines.Clear;
  //function_unit.write_names(tabs,'NewFile' + inttostr(MainForm.tabs_new));
  //MainForm.Caption:= editname + function_unit.coll_filename(tabs) + ']';
  //MainForm.TabControl1.Tabs.Add(function_unit.coll_filename(tabs));
  //MainForm.TabControl1.TabIndex := tabs;
  //function_unit.write_saves(tabs,false);
  with editlist.Items[tabs] do
  begin
    DragMode := dmAutomatic;
    //Caption := utf8tosys(ExtractFileName(function_unit.coll_filename(tabs)));
    //No := tabs;
    //function_unit.write_saves(tabs,False);
    //MainForm.Caption := editname + utf8tosys(function_unit.coll_filename(tabs)) + ']';
    Show;

    //editlist.Items[tabs].Top := Main.Top {+ MainForm.Height} + 20;
    //editlist.Items[tabs].Left := Main.Left;
    //editlist.Items[tabs].Width := Main.Width;
    //editlist.Items[tabs].Height:= main.Height;
    //WindowState:= wsMinimized;
   // editfrm[tabs].SynMemo1.ScrollBars:= ssBoth;
    //inc(MainForm.tabs_new);
  end;
end;

function Tfunction_unit.window_off(i:integer):boolean;
begin
   try
      with editlist.Items[i] do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        ManualDock(Main);
        ManualDock(Main.PageControl1.ActivePage);
        BorderStyle:= bsnone;
        Align := alclient;
        //function_unit.resizedocwindow;

        WindowState:= wsNormal;
        width := width +1;
        Visible:=true;
      end;
   except
   end;
end;

function Tfunction_unit.toolwindow_off:boolean;
begin
   try
      with toolwindow do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        ManualDock(Main);
        ManualDock(Main.toolpanel);
        BorderStyle:= bsnone;
        Align := alclient;
        //function_unit.resizedocwindow;

        WindowState:= wsNormal;
        width := width +1;
        Visible:=true;
      end;
   except
   end;
end;

function Tfunction_unit.str_charsets(i:integer;s:string):string;
begin
  if s = '?' then
    str_charsets := editlist.Items[i].char_sets
  else
    function_unit.editlist.Items[i].char_sets:= s;
end;

function Tfunction_unit.findtext(fText:string;setText,getText:TStringList;X:integer):boolean;
var
  s:Tstringlist;
  s1:string;
  i,i1,i2,i4,i5:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false;
    end
    else begin
      i4 := 0;
      if (x <> 0) then begin
        i5 := x;
        if i5 > i3 then begin
          i5 := i3;
        end;
      end else begin
        i5 := 0;
      end;
      for i3 := i5 to i1 -1 do begin
        i4 := i4 + length(s[i3]) + 2;
      end;
      i4 := i4 + i;
      getText.Add(inttostr(i4));
      findword := true;
    end;
    //getText.Add(s2);
  end;
begin
  //findtext.Free;
  //時間を見て、X（列）指定検索に対応させる
  s:=TStringlist.Create;
  s.Clear;
  memo:=Tmemo.Create(owner);
  memo.Visible := false;
  memo.Parent := function_unit;
  //function_unit.Show;
  memo.Text := settext.Text;
  //getText := TStringList.Create;
  //getText.Clear;
  s.Text:=settext.Text;
  i := -1;
  i1 := 0;
  for i1 := 0 to s.Count -1 do begin;
    if findword then begin
      s1 := s[i1];
      for i2 := i to length(s1) do begin
        s1[i] := ' ';
      end;
      s[i1] := s1;
    end;
  end;
  memo.Free;
  s.Free;
end;

function Tfunction_unit.findtext_test1(fText:string;setText,getText:TStringList;X:integer):boolean;
var
  s:Tstringlist;
  s1,s2:string;
  i,i1,i2,i4,i5:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false;
      s2 := '0';
    end else begin
      i4 := 0;
      if (x <> 0) then begin
        i5 := x;
        if i5 > i3 then begin
          i5 := i3;
        end;
      end else begin
        i5 := 0;
      end;
      for i3 := i5 to i1 -1 do begin
        i4 := i4 + length(s[i3]) + 2;
      end;
      //i4 := i4 + i;
      //getText.Add(inttostr(i3));
      //s2 := inttostr(i5);
      findword := true;
    end;
    //getText.Add(s2);
  end;
begin
  //findtext.Free;
  //時間を見て、X（列）指定検索に対応させる
  s:=TStringlist.Create;
  s.Clear;
  s2 := '0';
  memo:=Tmemo.Create(owner);
  memo.Visible := false;
  memo.Parent := function_unit;
  //function_unit.Show;
  memo.Text := settext.Text;
  //getText := TStringList.Create;
  //getText.Clear;
  s.Text:=settext.Text;
  i := -1;
  i1 := 0;
  for i1 := 0 to s.Count -1 do begin;
    if findword then begin
      s1 := s[i1];
      i2 := ansipos(ftext,s1);
      s[i1] := s1;
      s2 := inttostr(i2);
      gettext.Add(s2);
    end;
  end;

  memo.Free;
  s.Free;
end;

function Tfunction_unit.findtext_test2(fText:string;setText,getText:TStringList;X:integer):boolean;
var
  s:Tstringlist;
  s1,s2:string;
  i,i1,i2,i4,i5:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false;
      s2 := '0';
    end
    else begin
      i4 := 0;
      if (x <> 0) then begin
        i5 := x;
        if i5 > i3 then begin
          i5 := i3;
        end;
      end else begin
        i5 := 0;
      end;



      s2 := inttostr(i1);
      getText.Add(s2);
      findword := true;
    end;

  end;
begin
  //findtext.Free;
  //時間を見て、X（列）指定検索に対応させる
  s:=TStringlist.Create;
  s.Clear;
  memo:=Tmemo.Create(owner);
  memo.Visible := false;
  memo.Parent := function_unit;
  //function_unit.Show;
  memo.Text := settext.Text;
  //getText := TStringList.Create;
  //getText.Clear;
  s.Text:=settext.Text;
  i := -1;
  i1 := 0;
  for i1 := 0 to s.Count -1 do begin;
    if findword then begin
      s1 := s[i1];
      for i2 := i to length(s1) do begin
        s1[i] := ' ';
      end;
      s[i1] := s1;
    end;
  end;
  memo.Free;
  s.Free;
end;

function Tfunction_unit.TXTReplace():boolean;
var
  i,i1,ans:integer;
  msg:string;
  s1,s2:TStringList;
begin
  find_form.WindowState:= wsMinimized;
  i1 := Main.PageControl1.ActivePageIndex;
  msg  := '文字列を置き換えます' + chr($d) + chr($a) + 'よろしいですか？';
  s1 := TStringList.Create;
  s2 := TStringList.Create;
  s1.Clear;
  s2.Clear;
        if function_unit.editlist.Items[i1].PageControl1.ActivePage =  function_unit.editlist.Items[i1].TabSheet1 then begin
          s1.Text := function_unit.editlist.Items[i1].SynEdit1.Text;
        end else if function_unit.editlist.Items[i1].PageControl1.ActivePage =  function_unit.editlist.Items[i1].TabSheet2 then begin
          s1.Text := function_unit.editlist.Items[i1].Memo1.Text;
        end;
  function_unit.findtext(find_form.FIndTextAlia.Text,s1,s2,0);
  find_form.Listbox1.Items.Text:= s2.Text;
  i := find_form.listbox1.ItemIndex;
  if (i < 0) and (find_form.listbox1.Items.Count -1 > 0) then begin
    i := 0
  end else if i < find_form.listbox1.Items.Count then
    exit;
  find_form.listbox1.ItemIndex := i;
  interface_unit.selselect(
      main.PageControl1.ActivePageIndex
    );
  while 0 <> find_form.ListBox1.Items.Count do begin
    ans := messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0);
    if ans = 1 then begin
        interface_unit.selselect(i1);
        if function_unit.editlist.Items[i1].PageControl1.ActivePage =  function_unit.editlist.Items[i1].TabSheet1 then begin
          function_unit.editlist.Items[i1].SynEdit1.SelText:= find_form.RplaceTextAlia.Text;
          s1.Text := function_unit.editlist.Items[i1].SynEdit1.Text;
        end else if function_unit.editlist.Items[i1].PageControl1.ActivePage =  function_unit.editlist.Items[i1].TabSheet2 then begin
          function_unit.editlist.Items[i1].Memo1.SelText:= find_form.RplaceTextAlia.Text;
          s1.Text := function_unit.editlist.Items[i1].Memo1.Text;
        end;
         s2.Clear;

         function_unit.findtext(find_form.FIndTextAlia.Text,s1,s2,0);
         find_form.Listbox1.Items.Text:= s2.Text;
         find_form.listbox1.ItemIndex := i;

       end else if  ans = 7 then begin
        inc(i);
        find_form.listbox1.ItemIndex := i;
       end else if ans = 2 then begin
        break;
      end;
  end;
  s1.Free;
  s2.Free;
  find_form.WindowState:= wsNormal;
end;

function Tfunction_unit.selselect: boolean;
var
  findpos:integer;
  i:integer;
begin
  i := Main.PageControl1.ActivePageIndex;
  //MainForm.findpage := StrToInt(color_form.Memo1.Lines[tabset1.TabIndex]);
  findpos := StrToInt(find_form.ListBox1.Items[find_form.listbox1.ItemIndex]);
  //showmessage(inttostr(findpos));
  if Main.PageControl1.ActivePageIndex = 0 then begin
      //function_unit.editlist.Items[i].SynEdit1;
      function_unit.editlist.Items[i].SynEdit1.SelStart := findpos;
      function_unit.editlist.Items[i].SynEdit1.selend := findpos + length(find_form.FIndTextAlia.Text);
    end else if Main.PageControl1.ActivePageIndex = 1 then begin
      function_unit.editlist.Items[i].memo1.SelStart := findpos -1;
      function_unit.editlist.Items[i].memo1.SelLength := length(find_form.FIndTextAlia.Text) +1;
    end;
end;

function Tfunction_unit.reprace_selselect(pos:integer;find:string): boolean;
var
  findpos:integer;
  i:integer;
begin
  i := Main.PageControl1.ActivePageIndex;
  //MainForm.findpage := StrToInt(color_form.Memo1.Lines[tabset1.TabIndex]);
  findpos := pos;

  if Main.PageControl1.ActivePageIndex = 0 then begin
      function_unit.editlist.Items[i].SynEdit1.SelStart := findpos;
      function_unit.editlist.Items[i].SynEdit1.selend := findpos + length(find);
    end else if Main.PageControl1.ActivePageIndex = 1 then begin
      function_unit.editlist.Items[i].memo1.SelStart := findpos -1;
      function_unit.editlist.Items[i].memo1.SelLength := length(find) +1;
    end;
end;


function TextCheng(i,x,y:integer;find1,find2,reprace1,reprace2:string):boolean;
var
  st,st1,st2,st3,st4:TStringList;
  i1,i2,i3,i4:integer;
  s,s1,s2:string;
begin
  with function_unit.editlist.Items[i].SynEdit1 do begin
    //y := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
    //x := SelStart - SendMessage(Handle, EM_LINEINDEX, y, 0);
    //form1.caption := inttostr(y + 1)+ '行' + inttostr(x)+ '列';

    //if key = 13 then begin
      {if Lines.Text = '' then begin
        Lines[y] :=  Lines[y] + 'chr(13) + ';
        exit;
      end;}
      {if Lines[y -1] = 'chr(13) + ' then begin
        Lines[y] := 'chr(13) ';
        exit;
      end;}
      if Lines[y] <> '' then begin
       // if 0 > (y -1) then begin
          st := tstringlist.Create;
          st.Clear;
          st1 := tstringlist.Create;
          st1.Clear;
          st2 := TStringlist.Create;
          st2.Clear;
          st3 := TStringlist.Create;
          st3.Clear;
          st4 := TStringlist.Create;
          st4.Clear;
          st.Text:= lines[y];
          if find1 <> '' then
            function_unit.findtext(find1,st,st1,x)
          else
            function_unit.findtext(find2,st,st1,x);
          //showmessage(st1.Text);
          s := st.Text;
          if st1.Text <> '' then begin
            if find1 <> '' then begin
              s :=  StringReplace(Lines[y],find1,reprace1,[{rfReplaceAll}]);
              {for i2 := strtoint(st1[0]) to strtoint(st1[0]) + length(find1) do begin
                s[i2] := char(0);
              end;}
            end;
            lines[y] := s;
            if find2 <> '' then begin
              st2.Add(lines[y]);
              //検索して、最後尾の検索結果を置き抱える。
              for i1 := 0 to length(lines[y]) do begin
                function_unit.findtext(find2,st2,st4,i1);
                s2 := st4.text;
                if null <> s2 then
                  st3.Add(s2);
              end;
              //showmessage(st3.Text);
              if Lines[y] <> '' then begin
                        s := '';
                        s2 := '';
                        i4 := strtoint(st3[st3.Count-1]);
                        s1 := lines[y];
                        //i2 := ansipos(find2,s1);
                        for i1 := 1 to i4 -1 do begin
                          s2 := s2 + s1[i1];
                        end;
                       // showmessage(s2 + 'e'+ s1 + inttostr(i4));
                        for i1 := i4 to length(s1) do begin
                          s := s + s1[i1];
                        end;
                       // showmessage(s2 + ' ' + s);
                        s := StringReplace(s,find2,reprace2,[{rfReplaceAll}]);
                        //s2 := s2 + s;
                        lines[y] := s2 + s;

                        //showmessage(lines[y]);
                    end;
            end;
          end;



          if (st1.Text <> '') then
            exit;
            //Lines[y] := reprace1 + Lines[y] + reprace2;

          if (reprace1 <> '') or (reprace2 <> '') then
            if ( find1 = '') and ( find2 = '') then
              Lines[y] := reprace1 + Lines[y] + reprace2;

          st.Free;
          st1.Free;
          st2.Free;
          st3.Free;
          st4.Free;
          //exit;
       // end;
        {Lines[y] := '+ ''' + Lines[y] + ''' + chr(13)';
        exit;}
      end;
      //Lines[y] :=  Lines[y] + ' + chr(13)';
    end;
  //end;
end;

function TextCheng2(i,x,y:integer;find,reprace,msg:string):integer;
var
  s,s1,s2,s3:string;
  i1,i2:integer;
begin
  with function_unit.editlist.Items[i].SynEdit1 do begin
      if Lines[y-1] <> '' then begin
          s := '';
          s2 := '';
          s1 := lines[y-1];
          i2 := ansipos(find,s1);
          for i1 := 1 to x -1 do begin
            s2 := s2 + s1[i1];
          end;
          for i1 := x to length(s1) do begin
            s := s + s1[i1];
          end;
          //showmessage(s2 + ' ' + s);
          if msg = '中間' then
            s :=  StringReplace(s,find,reprace,[{rfReplaceAll}]);
          if (msg = '指定行') or (msg = '全列全行') then
            s :=  StringReplace(s,find,reprace,[rfReplaceAll]);
          //s2 := s2 + s;
          lines[y-1] := s2 + s;
      end;
    end;
  TextCheng2 := i2;
end;

function Tfunction_unit.reprace_macro(s,find,reprace:string;tabs:integer):boolean;
var
  i,pos:integer;
  msg:string;
  i1,i2,i3:integer;
  st:TStringList;
begin
  i2 := 0;
  if s = '先頭' then begin
    while i2 < count_window do begin
      TextCheng(main.PageControl1.ActivePageIndex,0,function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY + i2 ,find,'',reprace,'');
      inc(i2);
    end;
  end;

  if s = '中間' then begin
    while i2 < count_window do begin
      {i3 := TextCheng2(main.PageControl1.ActivePageIndex,
                 function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX,
                 function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY+ i2 ,
                 find,reprace,
                 s);}
      while i2 < count_window do begin
        TextCheng(main.PageControl1.ActivePageIndex,function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX,function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY + i2 ,find,'',reprace,'');
        inc(i2);
      end;
      inc(i2);
    end;
    //showmessage(inttostr(i3));
    //function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX := i3 + 1;
   // function_unit.editlist.Items[main.PageControl1.ActivePageIndex].synEdit1.CaretX:= i3 + 1;
  end;

  if s = '行末' then begin
    while i2 < count_window do begin
      TextCheng(main.PageControl1.ActivePageIndex,0,function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY + i2 ,'',find,'',reprace);
      inc(i2);
    end;
  end;

  if s = '指定行' then begin
      TextCheng2(main.PageControl1.ActivePageIndex,
                 function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX,
                 function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY ,
                 find,reprace,
                 s);
  end;

  if s = '全列全行' then begin
      while i2 < function_unit.editlist.Items[main.PageControl1.ActivePageIndex].synEdit1.Lines.Count -1 do begin
        TextCheng2(main.PageControl1.ActivePageIndex,
                   function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX,
                   function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY+ i2 ,
                   find,reprace,
                   s);
        inc(i2);
      end;
    end;

  if s = '指定列' then begin
      while i2 < function_unit.editlist.Items[main.PageControl1.ActivePageIndex].synEdit1.Lines.Count -1 do begin
        i3 := TextCheng2(main.PageControl1.ActivePageIndex,
                   function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX,
                   function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretY+ i2 ,
                   find,reprace,
                   s);
        inc(i2);
      end;
      function_unit.editlist.Items[main.PageControl1.ActivePageIndex].editCaretX := i3 + 1;
      function_unit.editlist.Items[main.PageControl1.ActivePageIndex].synEdit1.CaretX:= i3 + 1;
    end;

  {if s = '' then begin
  i1 := MainForm.TabControl1.TabIndex;
  msg  := '文字列を置き換えます' + chr($d) + chr($a) + 'よろしいですか？';
  st := TStringLIst.Create;
  st.Clear;
  pos := 0;
  while 0 <> count do begin
    //find_form.listbox1.ItemIndex := i;
    function_unit.reprace_selselect(pos,find);
    if messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0) = mrok then begin
      if not MainForm.Menu_MemoMode.Checked then begin
          editfrm[i1].SynMemo1.SelText:= reprace;
        end else begin
          editfrm[i1].Memo.SelText:= reprace;
        end;
        findtext2(find,i1,st);
        if st.Text <> '' then
          pos := strtoint(st[0]);
      end else if  messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0) = 1 then begin

      end else if messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0) = 2 then begin
        st.Free;
        break;
      end;
  end;
  st.Free;
  end;}
end;

function Tfunction_unit.heighligthcheck(i:integer;sw:boolean):string;
    begin
      Main.Menu_C.Checked := false;
      Main.Menu_Delphi.Checked:= false;
      Main.menu_css.Checked := false;
      Main.Menu_Xml.Checked := false;
      Main.Menu_html.Checked := false;
      //Main.Menu_diff.Checked := false;
      Main.Menu_pascal.Checked := false;
      Main.Menu_java.Checked := false;
      Main.Menu_SQL.Checked := false;
      Main.Menu_perl.Checked := false;
      Main.Menu_PHP.Checked := false;
      Main.MenuI_UnixShell.Checked := false;
      Main.Menu_VBScript.Checked := false;
      Main.Menu_BAT.Checked := false;
      Main.Menu_INI.Checked := false;
      Main.Menu_FreeHeightLight.Checked := false;
      Main.Menu_pyhton.Checked:= false;
      Main.Menu_lazarus.Checked:= false;
      Main.Menu_JS.Checked:= false;
      case i of
        0:Main.Menu_C.Checked := sw;
        1:Main.menu_css.Checked := sw;
        //6:Main.Menu_diff.Checked := sw;
        3:Main.Menu_pascal.Checked := sw;
        4:Main.Menu_html.Checked := sw;
        5:Main.Menu_java.Checked := sw;
        7:Main.Menu_Delphi.Checked:= sw;
        8:Main.Menu_perl.Checked := sw;
        9:Main.Menu_PHP.Checked := sw;
        10:Main.Menu_pyhton.Checked:= sw;
        11:Main.Menu_SQL.Checked := sw;
        13:Main.MenuI_UnixShell.Checked := sw;
        14:Main.Menu_VBScript.Checked := sw;
        15:Main.Menu_Xml.Checked := sw;
        16:Main.Menu_BAT.Checked := sw;
        17:Main.Menu_INI.Checked := sw;
        19:Main.Menu_FreeHeightLight.Checked := sw;
        20:Main.Menu_lazarus.Checked := sw;
        21:Main.Menu_JS.Checked := sw;
        22:Main.Menu_jsn.Checked := sw;
      end;
      case i of
        0:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        1:Main.menu_css.Checked := sw;
        //6:Main.Menu_diff.Checked := sw;
        3:begin
             function_unit.lngtype1:= '{';
             function_unit.lngtype2:= '}';
           end;
        4:Main.Menu_html.Checked := sw;
        5:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        7:begin
             function_unit.lngtype1:= '{';
             function_unit.lngtype2:= '}';
           end;
        8:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        9:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        10:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        11:Main.Menu_SQL.Checked := sw;
        13:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        14:begin
             function_unit.lngtype1:= '""';
             function_unit.lngtype2:= '""';
           end;
        15:Main.Menu_Xml.Checked := sw;
        16:begin
             function_unit.lngtype1:= '@echo off';
             function_unit.lngtype2:= '@echo on';
           end;
        17:Main.Menu_INI.Checked := sw;
        19:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        20:begin
             function_unit.lngtype1:= '{';
             function_unit.lngtype2:= '}';
           end;
        21:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
        22:begin
             function_unit.lngtype1:= '/*';
             function_unit.lngtype2:= '*/';
           end;
      end;
end;

function Tfunction_unit.synchang(i:integer):boolean;
var
  i1,i2:integer;
  s:string;
begin
  i1 := Main.PageControl1.ActivePageIndex;
  case i of
    0: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynCppSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynCppSyn1;
      end;
      for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        cpp(s);
      end;
      function_unit.editlist.Items[i1].edittype:= 'cpp';
    end;

    1: begin
      if not Main.Menu_MultWindow.Checked then begin
        DataModule1.SynMultiSyn1.DefaultHighlighter := DataModule1.SynCssSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynCssSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'css';
    end;

    2: begin
       if not Main.Menu_MultWindow.Checked then begin
         function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynDiffSyn1;
       end else begin
         function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynDiffSyn1;
       end;
       function_unit.editlist.Items[i1].edittype:= 'diff';
     end;

    3: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynFreePascalSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynFreePascalSyn1;
      end;
       for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        fpas(s);
      end;
       function_unit.editlist.Items[i1].edittype:= 'fpas';
    end;

    4: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynHTMLSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynHTMLSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'html';
    end;

    5: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJavaSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJavaSyn1;
      end;
       for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        java(s);
      end;
       function_unit.editlist.Items[i1].edittype:= 'java';
    end;

    6: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynLFMSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynLFMSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'lfm';
    end;

    7: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end;
       for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        pas(s);
      end;
      function_unit.editlist.Items[i1].edittype:= 'pas';
    end;

    8: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPerlSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPerlSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'perl';
    end;

    9: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPHPSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPHPSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'php';
    end;

    10: begin
       if not Main.Menu_MultWindow.Checked then begin
         function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPythonSyn1;
        end else begin
          function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPythonSyn1;
        end;
        function_unit.editlist.Items[i1].edittype:= 'python';
    end;

    11: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynSQLSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynSQLSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'sql';
    end;

    12: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynTeXSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynTeXSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'tex';
    end;

    13: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynUNIXShellScriptSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynUNIXShellScriptSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'shell';
    end;

    14: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynVBSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynVBSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'vbs';
    end;

    15: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynXMLSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynXMLSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'xml';
    end;

    16: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynBatSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynBatSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'bat';
    end;

    17: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynIniSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynIniSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'ini';
    end;

    18: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPoSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPoSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'po';
    end;

    19: begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynAnySyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynAnySyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'any';
    end;
    20:begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'laz';
    end;
    21:begin
      if not Main.Menu_MultWindow.Checked then begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJScriptSyn1;
      end else begin
        function_unit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJScriptSyn1;
      end;
      function_unit.editlist.Items[i1].edittype:= 'js';
    end;
  end;
end;

function TFunction_unit.TabAdd():boolean;
var
  i:integer;
  s:string;
begin
  i := main.PageControl1.PageIndex;
  if main.PageControl1.Pages[i].Caption = 'ADD' then begin
    main.PageControl1.PageIndex := function_unit.TabpageNo;
    interface_unit.new();
    exit;
  end else begin
    function_unit.TabpageNo := main.PageControl1.PageIndex;
    function_unit.Filename:= main.PageControl1.Pages[i].Caption;
    function_unit.TitleSet(function_unit.Filename);

    if function_unit.editlist.Count > function_unit.TabpageNo then begin
      s := function_unit.editlist.Items[function_unit.TabpageNo].char_sets;
      //showmessage(s);
      case s of
        'ANSI':interface_unit.char_set(main.PageControl1.ActivePageIndex,'ANSI');
        'UTF8':interface_unit.char_set(main.PageControl1.ActivePageIndex,'UTF8');
        'UTF16':interface_unit.char_set(main.PageControl1.ActivePageIndex,'UTF16');
      end;
    end;
    s := extractfileext( function_unit.Filename );
    //showmessage(s);
    case s of
        '.txt':;
        '.html':Main.Menu_HTMLClick(Main.Menu_HTML);
        '.htm':Main.Menu_HTMLClick(Main.Menu_HTML);
        '.js':Main.Menu_JSClick(Main.Menu_JS);
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
  end;


end;

function setatticolor(s:string;fgcolor,bgcolor,frcolor:integer):boolean;
begin
    with function_unit do begin
      case s of
        'AsmAttri': begin
          if fgcolor <> -1 then
            asmForeground:=fgcolor;
          if bgcolor <> -1 then
            asmBackground:=bgcolor;
          if frcolor <> -1 then
            asmFrameColor:=frcolor;
      end;
        'CaseLabelAttri': begin
           if fgcolor <> -1 then
            caseForeground:=fgcolor;
           if bgcolor <> -1 then
            caseBackground:=bgcolor;
           if frcolor <> -1 then
            caseFrameColor:=frcolor;

        end;
        'CommentAttri': begin
           if fgcolor <> -1 then
            commentForeground:=fgcolor;
           if bgcolor <> -1 then
            commentBackground:=bgcolor;
           if frcolor <> -1 then
            commentFrameColor:=frcolor;

        end;
        'DirectiveAttri': begin
           if fgcolor <> -1 then
            DirectiveForeground:=fgcolor;
           if bgcolor <> -1 then
            DirectiveBackground:=bgcolor;
           if frcolor <> -1 then
            DirectiveFrameColor:=frcolor;

        end;
        'IDEDirectiveAttri': begin
           if fgcolor <> -1 then
            IDEDirectiveForeground:=fgcolor;
           if bgcolor <> -1 then
            IDEDirectiveBackground:=bgcolor;
           if frcolor <> -1 then
            IDEDirectiveFrameColor:=frcolor;

        end;
        'IdentifierAttri': begin
           if fgcolor <> -1 then
            IdentifierForeground:=fgcolor;
           if bgcolor <> -1 then
            IdentifierBackground:=bgcolor;
           if frcolor <> -1 then
            IdentifierFrameColor:=frcolor;

        end;
       'KeyAttri': begin
          if fgcolor <> -1 then
            KeyForeground:=fgcolor;
          if bgcolor <> -1 then
            KeyBackground:=bgcolor;
          if frcolor <> -1 then
            KeyFrameColor:=frcolor;

        end;
        'SpaceAttri': begin
           if fgcolor <> -1 then
            SpaceForeground:=fgcolor;
           if bgcolor <> -1 then
            SpaceBackground:=bgcolor;
           if frcolor <> -1 then
            SpaceFrameColor:=frcolor;

        end;
        'StringAttri': begin
          if fgcolor <> -1 then
            StringForeground:=fgcolor;
          if bgcolor <> -1 then
            StringBackground:=bgcolor;
          if frcolor <> -1 then
            StringFrameColor:=frcolor;

        end;
        'SymbolAttri': begin
           if fgcolor <> -1 then
            SymbolForeground:=fgcolor;
           if bgcolor <> -1 then
            SymbolBackground:=bgcolor;
           if frcolor <> -1 then
            SymbolFrameColor:=frcolor;

        end;
        'DocumentAttri': begin
           if fgcolor <> -1 then
            DocumentForeground:=fgcolor;
           if bgcolor <> -1 then
            DocumentBackground:=bgcolor;
           if frcolor <> -1 then
            DocumentFrameColor:=frcolor;

        end;
        'InvalidAttri': begin
           if fgcolor <> -1 then
            InvalidForeground:=fgcolor;
           if bgcolor <> -1 then
            InvalidBackground:=bgcolor;
           if frcolor <> -1 then
            InvalidFrameColor:=frcolor;

        end;
        'NumberAttri': begin
           if fgcolor <> -1 then
            NumberForeground:=fgcolor;
           if bgcolor <> -1 then
            NumberBackground:=bgcolor;
           if frcolor <> -1 then
            NumberFrameColor:=frcolor;

        end;
        'DirecAttri': begin
          if fgcolor <> -1 then
            DirecForeground:=fgcolor;
          if bgcolor <> -1 then
            DirecBackground:=bgcolor;
          if frcolor <> -1 then
            DirecFrameColor:=frcolor;

        end;
        'DefaultAttri': begin
           if fgcolor <> -1 then
            DefaultForeground:=fgcolor;
           if bgcolor <> -1 then
            DefaultBackground:=bgcolor;
           if frcolor <> -1 then
            DefaultFrameColor:=frcolor;

        end;
        'FunctionAttri': begin
          if fgcolor <> -1 then
            FunctionForeground:=fgcolor;
          if bgcolor <> -1 then
            FunctionBackground:=bgcolor;
          if frcolor <> -1 then
            FunctionFrameColor:=frcolor;

        end;
        'PLSQLAttri': begin
          if fgcolor <> -1 then
            PLSQLForeground:=fgcolor;
          if bgcolor <> -1 then
            PLSQLBackground:=bgcolor;
          if frcolor <> -1 then
            PLSQLFrameColor:=frcolor;

        end;
        'SQLPlusAttri': begin
           if fgcolor <> -1 then
            SQLPlusForeground:=fgcolor;
           if bgcolor <> -1 then
            SQLPlusBackground:=bgcolor;
           if frcolor <> -1 then
            SQLPlusFrameColor:=frcolor;

        end;
        'TableNameAttri': begin
           if fgcolor <> -1 then
            TableNameForeground:=fgcolor;
           if bgcolor <> -1 then
            TableNameBackground:=bgcolor;
           if frcolor <> -1 then
            TableNameFrameColor:=frcolor;

        end;
        'VariableAttri': begin
           if fgcolor <> -1 then
            VariableForeground:=fgcolor;
           if bgcolor <> -1 then
            VariableBackground:=bgcolor;
           if frcolor <> -1 then
            VariableFrameColor:=frcolor;

        end;
        'DocTypeAttri': begin
           if fgcolor <> -1 then
            DocTypeForeground:=fgcolor;
           if bgcolor <> -1 then
            DocTypeBackground:=bgcolor;
           if frcolor <> -1 then
            DocTypeFrameColor:=frcolor;

        end;
        'NamespaceAttributeAttri': begin
          if fgcolor <> -1 then
            NamespaceAttributeForeground:=fgcolor;
          if bgcolor <> -1 then
            NamespaceAttributeBackground:=bgcolor;
          if frcolor <> -1 then
            NamespaceAttributeFrameColor:=frcolor;

        end;
        'NamespaceAttributeValueAttri': begin
          if fgcolor <> -1 then
            NamespaceAttributeValueForeground:=fgcolor;
          if bgcolor <> -1 then
            NamespaceAttributeValueBackground:=bgcolor;
          if frcolor <> -1 then
            NamespaceAttributeValueFrameColor:=frcolor;

        end;
        'ElementAttri': begin
          if fgcolor <> -1 then
            ElementForeground:=fgcolor;
          if bgcolor <> -1 then
            ElementBackground:=bgcolor;
          if frcolor <> -1 then
            ElementFrameColor:=frcolor;

        end;
        'TextAttri': begin
           if fgcolor <> -1 then
            TextForeground:=fgcolor;
           if bgcolor <> -1 then
            TextBackground:=bgcolor;
           if frcolor <> -1 then
            TextFrameColor:=frcolor;

        end;
        'AndAttri': begin
           if fgcolor <> -1 then
            AndForeground:=fgcolor;
           if bgcolor <> -1 then
            AndBackground:=bgcolor;
           if frcolor <> -1 then
            AndFrameColor:=frcolor;

        end;
        'ASPAttri': begin
           if fgcolor <> -1 then
            ASPForeground:=fgcolor;
           if bgcolor <> -1 then
            ASPBackground:=bgcolor;
           if frcolor <> -1 then
            ASPFrameColor:=frcolor;

        end;
        'UndefKeyAttri': begin
           if fgcolor <> -1 then
            UndefKeyForeground:=fgcolor;
           if bgcolor <> -1 then
            UndefKeyBackground:=bgcolor;
           if frcolor <> -1 then
            UndefKeyFrameColor:=frcolor;

        end;
        'ValueAttri': begin
          if fgcolor <> -1 then
            ValueForeground:=fgcolor;
          if bgcolor <> -1 then
            ValueBackground:=bgcolor;
          if frcolor <> -1 then
            ValueFrameColor:=frcolor;

        end;
        'AttributeAttri': begin
          if fgcolor <> -1 then
            AttributeForeground:=fgcolor;
          if bgcolor <> -1 then
            AttributeBackground:=bgcolor;
          if frcolor <> -1 then
            AttributeFrameColor:=frcolor;

        end;
        'AttributeValueAttri': begin
           if fgcolor <> -1 then
            AttributeValueForeground:=fgcolor;
           if bgcolor <> -1 then
            AttributeValueBackground:=bgcolor;
           if frcolor <> -1 then
            AttributeValueFrameColor:=frcolor;

        end;
        'SectionAttri': begin
           if fgcolor <> -1 then
            SectionForeground:=fgcolor;
           if bgcolor <> -1 then
            SectionBackground:=bgcolor;
           if frcolor <> -1 then
            SectionFrameColor:=frcolor;

        end;
        'ConstantAttri': begin
           if fgcolor <> -1 then
            ConstantForeground:=fgcolor;
           if bgcolor <> -1 then
            ConstantBackground:=bgcolor;
           if frcolor <> -1 then
            ConstantFrameColor:=frcolor;

        end;
        'ObjectAttri': begin
           if fgcolor <> -1 then
            ObjectForeground:=fgcolor;
           if bgcolor <> -1 then
            ObjectBackground:=bgcolor;
           if frcolor <> -1 then
            ObjectFrameColor:=frcolor;

        end;
        'SecondKeyAttri': begin
          if fgcolor <> -1 then
            SecondKeyForeground:=fgcolor;
          if bgcolor <> -1 then
            SecondKeyBackground:=bgcolor;
          if frcolor <> -1 then
            SecondKeyFrameColor:=frcolor;

        end;
        'varAttri': begin
           if fgcolor <> -1 then
            varForeground:=fgcolor;
           if bgcolor <> -1 then
            varBackground:=bgcolor;
           if frcolor <> -1 then
            varFrameColor:=frcolor;

        end;

        'InvalidSymbolAttri': begin
          if fgcolor <> -1 then
            InvalidSymbolForeground:=fgcolor;
          if bgcolor <> -1 then
            InvalidSymbolBackground:=bgcolor;
          if frcolor <> -1 then
            InvalidSymbolFrameColor:=frcolor;

        end;

        'OperatorAttri': begin
          if fgcolor <> -1 then
            OperatorForeground:=fgcolor;
          if bgcolor <> -1 then
            OperatorBackground:=bgcolor;
          if frcolor <> -1 then
            OperatorFrameColor:=frcolor;

        end;

        'PragmaAttri': begin
          if fgcolor <> -1 then
            PragmaForeground:=fgcolor;
          if bgcolor <> -1 then
            PragmaBackground:=bgcolor;
          if frcolor <> -1 then
            PragmaFrameColor:=frcolor;

        end;

      end;
    end;
end;

function Tfunction_unit.pas(s:string):boolean;
begin
  with DataModule1.SynPasSyn1 do begin
    with function_unit do begin
      case s of
        'AsmAttri': begin
          with AsmAttri do begin
            Foreground:=AsmForeground;
            Background:=AsmBackground;
            FrameColor:=AsmFrameColor;
          end;
        end;
        'CaseLabelAttri': begin
          with CaseLabelAttri do begin
            Foreground:=CaseForeground;
            Background:=CaseBackground;
            FrameColor:=CaseFrameColor;
          end;
        end;
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'DirectiveAttri': begin
          with DirectiveAttri do begin
            Foreground:=DirectiveForeground;
            Background:=DirectiveBackground;
            FrameColor:=DirectiveFrameColor;
          end;
        end;
        'IDEDirectiveAttri': begin
          with IDEDirectiveAttri do begin
            Foreground:=IDEDirectiveForeground;
            Background:=IDEDirectiveBackground;
            FrameColor:=IDEDirectiveFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.fpas(s:string):boolean;
begin
  with DataModule1.SynFreePascalSyn1 do begin
     with function_unit do begin
      case s of
        'AsmAttri': begin
          with AsmAttri do begin
            Foreground:=AsmForeground;
            Background:=AsmBackground;
            FrameColor:=AsmFrameColor;
          end;
        end;
        'CaseLabelAttri': begin
          with CaseLabelAttri do begin
            Foreground:=CaseForeground;
            Background:=CaseBackground;
            FrameColor:=CaseFrameColor;
          end;
        end;
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'DirectiveAttri': begin
          with DirectiveAttri do begin
            Foreground:=DirectiveForeground;
            Background:=DirectiveBackground;
            FrameColor:=DirectiveFrameColor;
          end;
        end;
        'IDEDirectiveAttri': begin
          with IDEDirectiveAttri do begin
            Foreground:=IDEDirectiveForeground;
            Background:=IDEDirectiveBackground;
            FrameColor:=IDEDirectiveFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.cpp(s:string):boolean;
begin
  with DataModule1.SynCppSyn1 do begin
    with function_unit do begin
      case s of
        'AsmAttri': begin
          with AsmAttri do begin
            Foreground:=AsmForeground;
            Background:=AsmBackground;
            FrameColor:=AsmFrameColor;
          end;
        end;
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'DirecAttri': begin
          with DirecAttri do begin
            Foreground:=DirecForeground;
            Background:=DirecBackground;
            FrameColor:=DirecFrameColor;
          end;
        end;
        'InvalidAttri': begin
          with InvalidAttri do begin
            Foreground:=InvalidForeground;
            Background:=InvalidBackground;
            FrameColor:=InvalidFrameColor;
          end;
        end;
        'NumberAttri':  begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.java(s:string):boolean;
begin
  with DataModule1.SynJavaSyn1 do begin
          with function_unit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
        'InvalidAttri': begin
          with InvalidAttri do begin
            Foreground:=InvalidForeground;
            Background:=InvalidBackground;
            FrameColor:=InvalidFrameColor;
          end;
        end;
        'DocumentAttri': begin
          with DocumentAttri do begin
            Foreground:=DocumentForeground;
            Background:=DocumentBackground;
            FrameColor:=DocumentFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.sql(s:string):boolean;
begin
  with DataModule1.SynSQLSyn1 do begin
          with function_unit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
        'DefaultPackageAttri': begin
          with DefaultPackageAttri do begin
            Foreground:=DefaultPackageForeground;
            Background:=DefaultPackageBackground;
            FrameColor:=DefaultPackageFrameColor;
          end;
        end;
        'FunctionAttri': begin
          with FunctionAttri do begin
            Foreground:=FunctionForeground;
            Background:=FunctionBackground;
            FrameColor:=FunctionFrameColor;
          end;
        end;
        'PLSQLAttri': begin
          with PLSQLAttri do begin
            Foreground:=PLSQLForeground;
            Background:=PLSQLBackground;
            FrameColor:=PLSQLFrameColor;
          end;
        end;
        'SQLPlusAttri': begin
          with SQLPlusAttri do begin
            Foreground:=SQLPlusForeground;
            Background:=SQLPlusBackground;
            FrameColor:=SQLPlusFrameColor;
          end;
        end;
        'TableNameAttri': begin
          with TableNameAttri do begin
            Foreground:=TableNameForeground;
            Background:=TableNameBackground;
            FrameColor:=TableNameFrameColor;
          end;
        end;
        'VariableAttri': begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.xml(s:string):boolean;
begin
  with DataModule1.SynXMLSyn1 do begin
          with function_unit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
       'AttributeAttri': begin
          with AttributeAttri do begin
            Foreground:=AttributeForeground;
            Background:=AttributeBackground;
            FrameColor:=AttributeFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'AttributeValueAttri': begin
          with AttributeValueAttri do begin
            Foreground:=AttributeValueForeground;
            Background:=AttributeValueBackground;
            FrameColor:=AttributeValueFrameColor;
          end;
        end;
        'DocTypeAttri': begin
          with DocTypeAttri do begin
            Foreground:=DocTypeForeground;
            Background:=DocTypeBackground;
            FrameColor:=DocTypeFrameColor;
          end;
        end;
        'NamespaceAttributeAttri': begin
          with NamespaceAttributeAttri do begin
            Foreground:=NamespaceAttributeForeground;
            Background:=NamespaceAttributeBackground;
            FrameColor:=NamespaceAttributeFrameColor;
          end;
        end;
        'NamespaceAttributeValueAttri': begin
          with NamespaceAttributeValueAttri do begin
            Foreground:=NamespaceAttributeValueForeground;
            Background:=NamespaceAttributeValueBackground;
            FrameColor:=NamespaceAttributeValueFrameColor;
          end;
        end;
        'ElementAttri': begin
          with ElementAttri do begin
            Foreground:=ElementForeground;
            Background:=ElementBackground;
            FrameColor:=ElementFrameColor;
          end;
        end;
        'TextAttri': begin
          with TextAttri do begin
            Foreground:=TextForeground;
            Background:=TextBackground;
            FrameColor:=TextFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.html(s:string):boolean;
begin
  with DataModule1.SynHTMLSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'AndAttri': begin
          with AndAttri do begin
            Foreground:=AndForeground;
            Background:=AndBackground;
            FrameColor:=AndFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'ASPAttri': begin
          with ASPAttri do begin
            Foreground:=ASPForeground;
            Background:=ASPBackground;
            FrameColor:=ASPFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'UndefKeyAttri': begin
          with UndefKeyAttri do begin
            Foreground:=UndefKeyForeground;
            Background:=UndefKeyBackground;
            FrameColor:=UndefKeyFrameColor;
          end;
        end;
        'ValueAttri': begin
          with ValueAttri do begin
            Foreground:=ValueForeground;
            Background:=ValueBackground;
            FrameColor:=ValueFrameColor;
          end;
        end;

        'TextAttri': begin
          with TextAttri do begin
            Foreground:=TextForeground;
            Background:=TextBackground;
            FrameColor:=TextFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.css(s:string):boolean;
begin
  with DataModule1.SynCssSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

      end;
    end;
  end;
end;

function Tfunction_unit.vbs(s:string):boolean;
begin
  with DataModule1.SynVBSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.bat(s:string):boolean;
begin
  with DataModule1.SynBatSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'VariableAttri': begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.ini(s:string):boolean;
begin
  with DataModule1.SynIniSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SectionAttri': begin
          with SectionAttri do begin
            Foreground:=SectionForeground;
            Background:=SectionBackground;
            FrameColor:=SectionFrameColor;
          end;
        end;

        'TextAttri': begin
          with TextAttri do begin
            Foreground:=TextForeground;
            Background:=TextBackground;
            FrameColor:=TextFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.freeset(s:string):boolean;
begin
  with DataModule1.SynAnySyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'VariableAttri': begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'ConstantAttri': begin
          with ConstantAttri do begin
            Foreground:=ConstantForeground;
            Background:=ConstantBackground;
            FrameColor:=ConstantFrameColor;
          end;
        end;

        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'ObjectAttri': begin
          with ObjectAttri do begin
            Foreground:=ObjectForeground;
            Background:=ObjectBackground;
            FrameColor:=ObjectFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.unics(s:string):boolean;
begin
  with DataModule1.SynUNIXShellScriptSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'SecondKeyAttri': begin
          with SecondKeyAttri do begin
            Foreground:=SecondKeyForeground;
            Background:=SecondKeyBackground;
            FrameColor:=SecondKeyFrameColor;
          end;
        end;

        'VarAttri': begin
          with VarAttri do begin
            Foreground:=VarForeground;
            Background:=VarBackground;
            FrameColor:=VarFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.JS(s:string):boolean;
begin
  with DataModule1.SynJScriptSyn1 do begin
          with function_unit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        {'SecondKeyAttri': begin
          with SecondKeyAttri do begin
            Foreground:=SecondKeyForeground;
            Background:=SecondKeyBackground;
            FrameColor:=SecondKeyFrameColor;
          end;
        end;}

        {'VarAttri': begin
          with VarAttri do begin
            Foreground:=VarForeground;
            Background:=VarBackground;
            FrameColor:=VarFrameColor;
          end;
        end;}
      end;
    end;
  end;
end;

function Tfunction_unit.php(s:string):boolean;
begin
  with DataModule1.SynPHPSyn1 do begin
    with function_unit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri':  begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
        'InvalidSymbolAttri':  begin
          with InvalidSymbolAttri do begin
            Foreground:=InvalidSymbolForeground;
            Background:=InvalidSymbolBackground;
            FrameColor:=InvalidSymbolFrameColor;
          end;
        end;

        'VariableAttri':  begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunction_unit.perl(s:string):boolean;
begin
  with DataModule1.SynPerlSyn1 do begin
    with function_unit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri':  begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'VariableAttri':  begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
        'InvalidAttri':  begin
          with InvalidAttri do begin
            Foreground:=InvalidForeground;
            Background:=InvalidBackground;
            FrameColor:=InvalidFrameColor;
          end;
        end;

        'OperatorAttri':  begin
          with OperatorAttri do begin
            Foreground:=OperatorForeground;
            Background:=OperatorBackground;
            FrameColor:=OperatorFrameColor;
          end;
        end;

        'PragmaAttri':  begin
          with PragmaAttri do begin
            Foreground:=PragmaForeground;
            Background:=PragmaBackground;
            FrameColor:=PragmaFrameColor;
          end;
        end;

      end;
    end;
  end;
end;

function Tfunction_unit.highlitercolorset(fgcolor,bgcolor,frcolor:integer;s:string):boolean;
begin
  //s := color_form.ComboBox2.Text;
  setatticolor(s,fgcolor,bgcolor,frcolor);
  pas(s);
  fpas(s);
  cpp(s);
  java(s);
  sql(s);
  xml(s);
  html(s);
  css(s);
  vbs(s);
  bat(s);
  ini(s);
  freeset(s);
  unics(s);
  php(s);
  perl(s);
  js(s);
end;

function Tfunction_unit.editcolor(fcolor,bcolor:integer):boolean;
var
  i:integer;
begin
  i := Main.PageControl1.ActivePageIndex;
  with function_unit.editlist.Items[i] do begin
    if PageControl1.ActivePage =  TabSheet1 then begin
      if fcolor <> -1 then
        synEdit1.font.color:= fcolor;
      if bcolor <> -1 then
        SynEdit1.Font.Color:= fcolor;
      SynEdit1.Color:= bcolor;
    end else if PageControl1.ActivePage =  TabSheet2 then begin
      if fcolor <> -1 then
        Memo1.Font.Color:= fcolor;
      if bcolor <> -1 then
        Memo1.Color:=bcolor;
    end;
  end;
end;

function Tfunction_unit.resizedocwindow(tabs:integer):boolean;
begin
  //if MainForm.count > 0 then
  begin
    //if not MainForm.Menu_MultWindow.Checked then
       begin
      with function_unit.editlist.Items[tabs] do begin
      Top:= 0;
      Left:=0;
      Width:= Main.Width;
      Height:=Main.Height;
      end;
    end;
  end;
end;

function Tfunction_unit.load(setfile,setname2:widestring):boolean;
var
  i,i1,i2,i3:integer;
  LIst:TStringList;
  s,s1,s2:string;
begin
  List := TStringList.Create;
  List.Clear;
  try
    try
      List.LoadFromFile(
        utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) ) + setfile )
       ));

    except
      function_unit.save(setfile,setname2);
      function_unit.resizedocwindow(main.PageControl1.ActivePageIndex);
      exit;
    end;
    //function_unit.loadsw:=true;
    Main.Menu_AllCloseClick(main.Menu_AllClose);
    //MainForm.T_W_sw:= true;
    try
      i := main.PageControl1.ActivePageIndex;
      function_unit.editlist.Items[i].Free;
      function_unit.m[i].Free;
      //main.TabControl1.Tabs.Clear;
      function_unit.count_window := 0;
    except

    end;
    //function_unit.loadsw:=false;

  finally
    try
     function_unit.count_window := strtoint(List[0]);
      i := 1;
      i1 := 0;
      while i < function_unit.count_window -1 do begin
        s2 := List[0];
        if 1 = strtoint(s2) then
          function_unit.write_saves(i1,True);
        inc(i1);
        inc(i)
      end;
            i1 := 0;
      i:=1;
      while i1 < function_unit.count_window -1 do begin
        s2 := List[i];
        //function_unit.editlist.Items[i1].charsets := s2;
        inc(i);
        inc(i1);
      end;
      i1 := 0;
      while i1 < function_unit.count_window -1 do begin
        function_unit.saveep[i1] := strtoint(List[i]);
        inc(i);
        inc(i1);
      end;
      function_unit.count_window := 0;
     i := i + 1;
     i1 := 0;
   i2 := list.IndexOf('frmwindowrect');
   if -1 < i2 then begin
      Main.Menu_MultWindow.Checked:= true;
      //Main.mltw_sw:= true;
      Main.Top:= strtoint(list[i2 +1]);
      Main.Left:= strtoint(list[i2 +2]);
      Main.Height:= strtoint(list[i2 +3]);
      Main.Width:= strtoint(list[i2 +4]);
   end;
   i2 := list.IndexOf('editwindowrect');
   i3 := strtoint(list[0]) -1;
   i := strtoint(list[0])-1;
    While  i1 <= i3 do begin
      try
        if not Main.Menu_MultWindow.Checked then begin
          s := (ExtractFilePath( (Paramstr(0)) ) +
            ( IntToStr(i1) + setname2));
          //showmessage(inttostr(i1));
          Main.Menu_NewClick(Main.Menu_New);

          interface_unit.memoload(i1,s);

          //showmessage(list[i-1]);
          if i > list.Count -1 then
            dec(i);
          s1 := ExtractFileName(List[i]);
          //showmessage(s1);

          function_unit.m[i1].Caption:= s1;
          Main.PageControl1.Pages[i1].Caption := s1;
          function_unit.write_names(i1,List[i]);
          //Main.Caption:= editname + List[i] + ']';
          function_unit.TitleSet(List[i]);
          function_unit.resizedocwindow(Main.PageControl1.ActivePageIndex);
        end else begin
          Main.Menu_MultWindow.Checked := true;
          //Main.mltw_sw := true;
          Main.Menu_NewClick(Main.Menu_New);

          //function_unit.edittop[i1] := strtoint(list[i2 +1]);
          //function_unit.editleft[i1] := strtoint(list[i2 +2]);
          //function_unit.editheight[i1] := strtoint(list[i2 +3]);
          //function_unit.editwidth[i1] := strtoint(list[i2 +4]);
          s := utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) ) +
            ( IntToStr(i1) + setname2));
          try

            interface_unit.memoload(i1,s);

          except
            Main.Menu_NewClick(Main.Menu_New);
          end;
          function_unit.editlist.Items[i1].filename_path := s1;
          function_unit.m[i1].Caption:= ExtractFileName(List[i]);
          Main.PageControl1.Pages[i1].Caption := ExtractFileName(List[i]);
          function_unit.write_names(i1,List[i]);
          function_unit.TitleSet(List[i]);

          inc(i2);
        end;

      except

      end;
      inc(i);
      inc(i1);
    end;
      i1 := 0;
      i:=1;
      while i1 < function_unit.count_window -1 do begin
        s2 := List[i];
        function_unit.editlist.Items[i1].char_sets := s2;
        inc(i);
        inc(i1);
      end;
    {for i1 := 0 to Main.count -1 do begin
      if Main.mltw_sw then begin
          s := utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) ) +
          ( IntToStr(i1) + setname2));
          Main.T_W_sw:= true;
          Memoload(i1,s);
          Main.TabControl1.Tabs[i1] := function_unit.coll_filename(i1);
        end else begin

        end;
    end;}
   except

   end;
  end;
  function_unit.count_window := strtoint(List[0]);
  //Main.count_new:= Main.count;
  list.Free;
  //Main.T_W_sw:= false;
  //Main.Timer_MenuEdited.Enabled:= true;
  //function_unit.cancel_of_codelist_load_sw := false;
  color_form.CheckBox3.Checked := not color_form.CheckBox3.Checked;
  color_form.CheckBox3.Checked := not color_form.CheckBox3.Checked;
  //function_unit.cancel_of_codelist_load_sw := true;
  //function_unit.findcode.SaveToFile(ExtractFilePath(Paramstr(0)) + 'codelist.txt');

end;

function Tfunction_unit.save(setfile,setname1:widestring):boolean;
var
  i:integer;
  s,s1:string;
  List:TstringList;
begin
  //一時保存ファイル読み出し設定ファイル作成
  List := TstringList.Create;
  List.Clear;
  List.Add(inttostr(function_unit.count_window));
  try
   for i := 1 to function_unit.count_window -1 do begin
     list.Add(function_unit.editlist.Items[i].char_sets);
   end;
   for i := 1 to function_unit.count_window -1 do begin
    List.Add(inttostr(ord(function_unit.read_saves(i))));
   end;

   for i := 1 to function_unit.count_window -1 do begin
    List.Add(inttostr(function_unit.saveep[i]));
   end;

   for i := 0 to Main.PageControl1.PageCount -2 do begin
     List.Add(function_unit.editlist.Items[i].filename_path);
   end;

  if Main.Menu_MultWindow.Checked then begin
    list.Add('frmwindowrect');
    list.Add(inttostr(Main.Top));
    list.Add(inttostr(Main.Left));
    list.Add(inttostr(Main.Height));
    list.Add(inttostr(Main.Width));
    list.Add('editwindowrect');
    for i:= 0 to function_unit.count_window -1 do begin
      list.Add(inttostr(function_unit.editlist.Items[i].Top));
      list.Add(inttostr(function_unit.editlist.Items[i].Left));
      list.Add(inttostr(function_unit.editlist.Items[i].Height));
      list.Add(inttostr(function_unit.editlist.Items[i].Width));
    end;
  end;
   List.SaveToFile(
    utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) ) + setfile )
   ));

    for i := 0 to function_unit.count_window -1 do begin
     Main.PageControl1.PageIndex := i;
     s1 := Main.PageControl1.Pages[i].Caption;
     s :=  (ansitoutf8( ExtractFilePath( (Paramstr(0) )) +
           IntToStr(i) + setname1));
     try
       //function_unit.save_sw := true;

       interface_unit.memosave(i,s,function_unit.editlist.Items[i].Edit);
     except

     end;
     function_unit.editlist.Items[i].filename_path := ((ExtractFilePath( (Paramstr(0) )) +
          s1));
     Main.PageControl1.Pages[i].Caption := s1;
    end;
  finally
   //function_unit.Timer1.Enabled:= true;
  end;
  //showmessage(inttostr(Main.TabControl1.Tabs.Count));
end;

function Tfunction_unit.seteditcolor(fcolor,bcolor,fgcolor,bgcolor,frcolor:integer):boolean;
begin
  editcolor(fcolor,bcolor);
  highlitercolorset(fgcolor,bgcolor,frcolor,color_form.ComboBox2.Text);
end;

function Tfunction_unit.write_saves(tabs:integer;bool:boolean):boolean;
begin
  function_unit.editlist.Items[tabs].save_complate := bool;
end;

function Tfunction_unit.write_names(i:integer; s:string):string;
begin
  function_unit.editlist.Items[i].filename_path := s;
  write_names := function_unit.editlist.Items[i].filename_path;
end;

function Tfunction_unit.read_saves(i:integer):boolean;
begin
  read_saves := function_unit.editlist.Items[i].save_complate;
end;

function Tfunction_unit.LoadHighLightColorPriSet(i:integer):integer;
var
  st:TStringLIst;
begin
  st := TStringList.Create;
  st.Clear;
  case i of
    0:begin
      LoadHighLightColorPriSet := 4;
    end;
    1:begin
      st.Text:=
      'editcolor' + chr(13)
      + '536870912' + chr(13)
      + '16777215' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '-2147483647' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '32768' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '32768' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16744448' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13);
    end;
    2:begin
      st.Text:=
      'editcolor' + chr(13)
      + '16777215' + chr(13)
      + '32768' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '12632256' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13);
    end;
    3:begin
      st.Text:=
      'editcolor' + chr(13)
      + '16777215' + chr(13)
      + '8388608' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '12632256' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13);
    end;
    4:begin
      st.Text:=
      'editcolor' + chr(13)
      + '65280' + chr(13)
      + '0' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '32768' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
       + chr(13);
    end;
  end;
  function_unit.HighlintColorIndex := i;
  LoadEditColorPriset(st);
  HighLightColorPriSet(st);
  st.Free;
end;

function Tfunction_unit.LoadEditColorPriset(alist:TstringList):boolean;
var
  i:integer;
begin
  i := alist.IndexOf('editcolor');
  if -1 < i then begin
    try
      NewSet.add(alist[i]);
      NewSet.add(alist[i+1]);
      editcolorset((alist[i+1]),
                   (alist[i+2])
                   );
    except
    end;
  end;
end;

function Tfunction_unit.HighLightColorPriSet(alist:TStringList):boolean;
var
  i:integer;
begin
    i := alist.IndexOf('syncolor');
  if -1 < i then begin
    i := alist.IndexOf('CommentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IDEDirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IdentifierAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('KeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SpaceAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('StringAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NumberAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AsmAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SymbolAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('CaseLabelAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirecAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('InvalidAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocumentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DefaultPackageAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('FunctionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('PLSQLAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SQLPlusAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TableNameAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('VariableAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocTypeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ElementAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TextAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AndAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ASPAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('UndefKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SectionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ConstantAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ObjectAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SecondKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('varAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
  end;
end;

function Tfunction_unit.editcolorset(Fcolor,Bcolor:string):boolean;
var
  i:integer;
begin
  fcolorset := fcolor;
  bcolorset := bcolor;
  for i := 0 to main.PageControl1.PageCount -2 do begin
    function_unit.editlist.Items[i].Synedit1.Color:= stringtocolor(bcolor);
    function_unit.editlist.Items[i].SynEdit1.Font.Color:= stringtocolor(fcolor);
  end;
  i := NewSet.IndexOf('editcolor');
  function_unit.NewSet[i+1] := fcolor;
  function_unit.NewSet[i+2] := bcolor;
end;

function Tfunction_unit.SelectToolBarPreSet(i:integer):integer;
var
  s:TStringList;
begin
  s := TStringList.Create;;
  s.Clear;
  case i of
    0:begin
      SelectToolBarPreSet := 5;
    end;
    1:begin
      s.Text:='toolbarbutton' + chr(13)
      + '12' + chr(13)
      + '0' + chr(13)
      + '2' + chr(13)
      + '6' + chr(13)
      + '14' + chr(13)
      + '18' + chr(13)
      + '19' + chr(13)
      + '21' + chr(13)
      + '22' + chr(13)
      + '23' + chr(13)
      + '24' + chr(13)
      + '29' + chr(13)
      + '17' + chr(13);
    end;

    2:begin
     s.Text:='toolbarbutton' + chr(13)
     + '12' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '6' + chr(13)
     + '14' + chr(13)
     + '24' + chr(13)
     + '29' + chr(13)
     + '12' + chr(13)
     + '26' + chr(13)
     + '28' + chr(13)
     + '112' + chr(13)
     + '111' + chr(13)
     + '17' + chr(13);
    end;

    3:begin
     s.Text:='toolbarbutton' + chr(13)
     + '21' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '4' + chr(13)
     + '6' + chr(13)
     + '9' + chr(13)
     + '15' + chr(13)
     + '12' + chr(13)
     + '24' + chr(13)
     + '29' + chr(13)
     + '31' + chr(13)
     + '32' + chr(13)
     + '33' + chr(13)
     + '35' + chr(13)
     + '37' + chr(13)
     + '39' + chr(13)
     + '38' + chr(13)
     + '41' + chr(13)
     + '42' + chr(13)
     + '66' + chr(13)
     + '67' + chr(13)
     + '68' + chr(13);
    end;

    4:begin
     s.Text:='toolbarbutton' + chr(13)
     + '17' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '4' + chr(13)
     + '6' + chr(13)
     + '9' + chr(13)
     + '12' + chr(13)
     + '14' + chr(13)
     + '18' + chr(13)
     + '19' + chr(13)
     + '21' + chr(13)
     + '22' + chr(13)
     + '23' + chr(13)
     + '24' + chr(13)
     + '29' + chr(13)
     + '66' + chr(13)
     + '71' + chr(13)
     + '17' + chr(13);
    end;

    5:begin
     s.Text:='toolbarbutton' + chr(13)
     + '28' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '4' + chr(13)
     + '6' + chr(13)
     + '9' + chr(13)
     + '15' + chr(13)
     + '12' + chr(13)
     + '18' + chr(13)
     + '19' + chr(13)
     + '21' + chr(13)
     + '22' + chr(13)
     + '23' + chr(13)
     + '24' + chr(13)
     + '26' + chr(13)
     + '27' + chr(13)
     + '28' + chr(13)
     + '29' + chr(13)
     + '33' + chr(13)
     + '41' + chr(13)
     + '42' + chr(13)
     + '66' + chr(13)
     + '67' + chr(13)
     + '68' + chr(13)
     + '69' + chr(13)
     + '71' + chr(13)
     + '73' + chr(13)
     + '78' + chr(13)
     + '17' + chr(13);
    end;
  end;
  setToolBarPreSet(S);
  s.Free;
end;

function Tfunction_unit.SelectToolBarPreSet2(i:integer):integer;
var
  s,s1:TStringList;
begin
  s := TStringList.Create;
  s.Clear;
  s1 := TStringList.Create;
  s1.Clear;
  case i of
    0:begin
      SelectToolBarPreSet2 := 1;
    end;
    1:begin
      s.Text:='toolbarbutton2' + chr(13)
      + '79' + chr(13)
      + '0' + chr(13)
      + 't0' + chr(13)
      + '2' + chr(13)
      + 't0' + chr(13)
      + '4' + chr(13)
      + 't0' + chr(13)
      + '6' + chr(13)
      + 't0' + chr(13)
      + '9' + chr(13)
      + 't0' + chr(13)
      + '14' + chr(13)
      + 't0' + chr(13)
      + '15' + chr(13)
      + 't0' + chr(13)
      + '18' + chr(13)
      + 't0' + chr(13)
      + '19' + chr(13)
      + 't0' + chr(13)
      + '21' + chr(13)
      + 't0' + chr(13)
      + '22' + chr(13)
      + 't0' + chr(13)
      + '23' + chr(13)
      + 't0' + chr(13)
      + '24' + chr(13)
      + 't0' + chr(13)
      + '17' + chr(13)
      + 't0' + chr(13)
      + '26' + chr(13)
      + 't1' + chr(13)
      + '27' + chr(13)
      + 't1' + chr(13)
      + '28' + chr(13)
      + 't1' + chr(13)
      + '29' + chr(13)
      + 't1' + chr(13)
      + '31' + chr(13)
      + 't1' + chr(13)
      + '32' + chr(13)
      + 't1' + chr(13)
      + '33' + chr(13)
      + 't1' + chr(13)
      + '34' + chr(13)
      + 't1' + chr(13)
      + '35' + chr(13)
      + 't1' + chr(13)
      + '36' + chr(13)
      + 't1' + chr(13)
      + '37' + chr(13)
      + 't1' + chr(13)
      + '38' + chr(13)
      + 't1' + chr(13)
      + '39' + chr(13)
      + 't1' + chr(13)
      + '41' + chr(13)
      + 't2' + chr(13)
      + '42' + chr(13)
      + 't2' + chr(13)
      + '43' + chr(13)
      + 't2' + chr(13)
      + '66' + chr(13)
      + 't2' + chr(13)
      + '44' + chr(13)
      + 't3' + chr(13)
      + '45' + chr(13)
      + 't3' + chr(13)
      + '46' + chr(13)
      + 't3' + chr(13)
      + '47' + chr(13)
      + 't3' + chr(13)
      + '48' + chr(13)
      + 't3' + chr(13)
      + '49' + chr(13)
      + 't3' + chr(13)
      + '50' + chr(13)
      + 't3' + chr(13)
      + '51' + chr(13)
      + 't3' + chr(13)
      + '52' + chr(13)
      + 't3' + chr(13)
      + '53' + chr(13)
      + 't3' + chr(13)
      + '54' + chr(13)
      + 't3' + chr(13)
      + '55' + chr(13)
      + 't3' + chr(13)
      + '56' + chr(13)
      + 't3' + chr(13)
      + '57' + chr(13)
      + 't3' + chr(13)
      + '58' + chr(13)
      + 't3' + chr(13)
      + '59' + chr(13)
      + 't3' + chr(13)
      + '64' + chr(13)
      + 't3' + chr(13)
      + '67' + chr(13)
      + 't4' + chr(13)
      + '68' + chr(13)
      + 't4' + chr(13)
      + '69' + chr(13)
      + 't4' + chr(13)
      + '71' + chr(13)
      + 't4' + chr(13)
      + '73' + chr(13)
      + 't4' + chr(13)
      + '75' + chr(13)
      + 't4' + chr(13)
      + '78' + chr(13)
      + 't4' + chr(13)
      + '79' + chr(13)
      + 't4' + chr(13)
      + '80' + chr(13)
      + 't4' + chr(13)
      + '81' + chr(13)
      + 't4' + chr(13)
      + '84' + chr(13)
      + 't5' + chr(13)
      + '85' + chr(13)
      + 't5' + chr(13)
      + '86' + chr(13)
      + 't5' + chr(13)
      + '87' + chr(13)
      + 't5' + chr(13)
      + '88' + chr(13)
      + 't5' + chr(13)
      + '91' + chr(13)
      + 't6' + chr(13)
      + '93' + chr(13)
      + 't6' + chr(13)
      + '94' + chr(13)
      + 't6' + chr(13)
      + '95' + chr(13)
      + 't6' + chr(13)
      + '97' + chr(13)
      + 't6' + chr(13)
      + '98' + chr(13)
      + 't6' + chr(13)
      + '99' + chr(13)
      + 't6' + chr(13)
      + '101' + chr(13)
      + 't6' + chr(13)
      + '102' + chr(13)
      + 't6' + chr(13)
      + '103' + chr(13)
      + 't6' + chr(13)
      + '104' + chr(13)
      + 't6' + chr(13)
      + '106' + chr(13)
      + 't7' + chr(13)
      + '107' + chr(13)
      + 't7' + chr(13)
      + '110' + chr(13)
      + 't7' + chr(13)
      + '111' + chr(13)
      + 't7' + chr(13)
      + '112' + chr(13)
      + 't7' + chr(13);

      s1.Text:=
      'toolpage' + chr(13)
      + '8' + chr(13)
      + 'ファイル/編集' + chr(13)
      + '検索/他' + chr(13)
      + '補完機能' + chr(13)
      + '強調表示' + chr(13)
      + 'オプション' + chr(13)
      + 'ツールバー' + chr(13)
      + 'ウインドウ' + chr(13)
      + 'マクロ' + chr(13);
    end;
  end;
  function_unit.tabtoolbarcount := 8;

  settoolbar(s1);
  setToolBarPreSet2(S);
  s.Free;
  s1.Free;
end;

function Tfunction_unit.toolbuttonset(i,i1:integer):boolean;
var
  i2,i3:integer;
  //p1:TTabSheet;
  sw1:boolean;
begin
  //if function_unit.toolbar_deflut then
    //exit;
  with color_form do begin
    b[i] := tbutton.Create(self);
    b[i].Parent := toolwindow.ToolBar2;
    b[i].Left:= toolwindow.ToolBar2.Width;
    b[i].Caption:= ListBox2.Items[i1];
    b[i].AutoSize:= true;
    if not checkbox3.Checked then
      ListBox1.Items.Add(b[i].Caption);
    b[i].Name:= 'b' + inttostr(listbox1.Items.Count -1);
    b[i].Visible:= true;
    if toolwindow.PageControl1.PageCount > 0 then
      sw1 := true;
    for i2 := 0 to Main.Menu.Items.Count -1 do begin
      if not sw1 then begin
        p1[i] := TTabSheet.Create(self);
        p1[i].Caption:= Main.Menu.Items[i2].Caption;
        if -1 = toolwindow.PageControl1.IndexOf(p1[i]) then
          function_unit.pagenew2(i2,Main.Menu.Items[i2].Caption);
        //p1.Free;
      end;
        //MainForm.PageControl1.Add(MainForm.Menu.Items[i2].Caption);
      for i3 := 0 to Main.Menu.Items.Items[i2].Count -1 do begin
        if Main.Menu.Items[i2].Items[i3].Caption = b[i].Caption then
          b[i].OnClick:= Main.Menu.Items[i2].Items[i3].OnClick;
      end;
    end;
  end;
end;

function Tfunction_unit.toolbuttonset2(i,i1,i2,btn_count:integer):boolean;
var
  i3,i4:integer;
  sw:boolean;
  s:string;
begin
  //if function_unit.toolbar_deflut then
    //exit;
  with color_form do begin
    tb[i] := tbutton.Create(self);
    tb[i].Parent := function_unit.ptoolbar[i2];
    tb[i].Left:= toolwindow.ToolBar2.Width;
    tb[i].Caption:= ListBox2.Items[i1];
    tb[i].AutoSize:= true;
    sw := checkbox3.Checked;
    //checkbox3.Checked := true;
    if sw then
      ListBox1.Items.Add(tb[i].Caption);
    s := 'tb' + inttostr(i);
    tb[i].Name:= s;
    //showmessage(inttostr(i2));
    function_unit.toolbarbuttonparnt2.Add(function_unit.tb[i].Parent.Name);

    tb[i].Visible:= true;
    for i3 := 0 to main.Menu.Items.Count -1 do begin
      for i4 := 0 to Main.Menu.Items.Items[i3].Count -1 do begin
        if Main.Menu.Items[i3].Items[i4].Caption = tb[i].Caption then
          tb[i].OnClick:= Main.Menu.Items[i3].Items[i4].OnClick;
      end;
    end;
    //checkbox3.Checked := sw;
  end;

end;

function Tfunction_unit.toolbuttonset_autoset(i:integer):boolean;
var
  i2,i3,i4,i5:integer;
begin
  with color_form do begin
    if function_unit.toolbar_compreat then
      exit;
    i4 := 0;
    for i2 := 0 to Main.Menu.Items.Count -1 do begin
      //if main.Menu.Items[i2].Name <> 'Menu_RootTAB' then begin
        p1[i] := TTabSheet.Create(self);
        p1[i].Caption:= main.Menu.Items[i2].Caption;
        ptoolbar[i2] := TToolbar.Create(self);
        ptoolbar[i2].Parent := p1[i];
     // end;

        //ptoolbar[i2].OnResize := main.ToolBar2.OnResize(self);
        //ptoolbar[i2].Align:= alClient;
        //p1[i].OnResize:= main.TabSheet1Resize(sender);
        //if main.Menu.Items[i2].Visible then begin
        if -1 = main.PageControl1.IndexOf(p1[i]) then
          function_unit.pagenew2(i2,main.Menu.Items[i2].Caption);

      //end;
      //p1.Free;
      for i3 := 0 to Main.Menu.Items.Items[i2].Count -1 do begin
        if (Main.Menu.Items[i2].Items[i3].Caption = '-') or
            ( not Main.Menu.Items[i2].Items[i3].Visible ) then begin

        end else begin
          tb[i3] := tbutton.Create(self);
          tb[i3].Left:= toolwindow.ToolBar2.Width;
          tb[i3].AutoSize:= true;
          //tb[i3].Name:= 'tb' + inttostr(i4);
          tb[i3].Visible:= true;
          tb[i3].Parent :=  ptoolbar[i2];
          tb[i3].Caption:= Main.Menu.Items[i2].Items[i3].Caption;
          tb[i3].OnClick:= Main.Menu.Items[i2].Items[i3].OnClick;
          i5 := ListBox2.Items.IndexOf(Main.Menu.Items[i2].Items[i3].Caption);
          function_unit.toolbarbuttoncount2.Add(inttostr(i5));
          function_unit.toolbarbuttonparnt2.Add(tb[i3].Parent.Name);
          //color_form.ListBox1.Items.Add(color_form.ListBox2.Items[i5]);
          inc(i4);
        end;
    end;
  end;

  end;
  function_unit.toolbar_compreat:= true;
end;

function Tfunction_unit.loadtoobutton:boolean;
var
  i:integer;
begin
  for i := 0 to function_unit.toolbarbuttoncount.Count -1 do begin
    toolbuttonset(i, strtoint(function_unit.toolbarbuttoncount[i]));
  end;
end;

function Tfunction_unit.loadtoobutton2(btn_count:integer):boolean;
var
  i,i1:integer;
  s,s1:string;
begin
  //showmessage(function_unit.toolbarbuttoncount2.Text);
  i1 := 0;
  //color_form.CheckBox3.Checked:= true;
  //color_form.CheckBox3Change(color_form.CheckBox3);
  function_unit.toolbarbuttonparnt2.Clear;
  for i := 0 to function_unit.toolbarbuttoncount2.Count -1 do begin
   s:=function_unit.toolbarbuttonparnt[i];
   //s := s[2];
   s1 := function_unit.toolbarbuttoncount2[i];
   //showmessage(toolbarbuttonparnt.Text);
   //showmessage(s);
   if function_unit.boot then begin
     toolbuttonset2(i, strtoint(s1),
                     strtoint(s) ,
                     btn_count
                     );
   end;
    i1 := i1 +2;
  end;
end;

function Tfunction_unit.setToolBarPreSet(S:TstringList):boolean;
var
  i,i1:integer;
begin
  i := s.IndexOf('toolbarbutton');
   if -1 < i then begin
     for i1 := 0 to strtoint(s[i+1]) -1 do begin
       function_unit.toolbarbuttoncount.Add(s[i1 +2]);
     end;
     function_unit.loadtoobutton;
   end;
end;

function Tfunction_unit.setToolBarPreSet2(St:TstringList):boolean;
var
  i,i1,i2,i3,i4:integer;
  s,s1:string;
begin
   i := st.IndexOf('toolbarbutton2');
   i4 := i;
   if -1 < i then begin
     for i1 := 0 to strtoint(st[i+1]) -1 do begin
       function_unit.toolbarbuttoncount2.Add(st[i4 +2]);
       s := st[i4 + 3];
       s1 := '';
       i2 := length(s);
       //showmessage(s + ' ' + inttostr(i2));
       for i3 := 2 to i2 do begin
         s1 := s1 + s[i3];
       end;
       function_unit.toolbarbuttonparnt.Add(s1);

       i4 := i4 + 2;
     end;
     i4 := strtoint(st[i+1]);
     function_unit.loadtoobutton2(function_unit.tabtoolbarcount);
   end else begin
     function_unit.toolbar_deflut2 := true;
   end;
end;

function Tfunction_unit.settoolbar(S:TstringList):boolean;
var
  i,i1:integer;
  count,count2:integer;
begin
     count := s.IndexOf('toolpage');
     if -1 < count then begin
       //showmessage(s[count+1]);
       for count2 := 0 to strtoint(s[count+1]) -1 do begin
         //showmessage(s[count2 + 2]);
         pagenew(count2,s[count2 + count + 2]);
       end;
     end;
end;

function Tfunction_unit.pagenew(i:integer;Tabname:string):boolean;
begin
  //if function_unit.toolbar_deflut then
    //exit;
  try
  with function_unit do begin
    color_form.TabControl1.Tabs.Add(tabname);
    p[i] := TTabSheet.Create(self);
    p[i].Caption:= tabname;
    p[i].Name:= 'P' + inttostr(i);
    p[i].Parent := toolwindow.PageControl1;
    ptoolbar[i] := TToolBar.Create(self);
    ptoolbar[i].AutoSize:= true;
    ptoolbar[i].Caption:= 't' + inttostr(i);
    ptoolbar[i].Name:='t' + inttostr(i);
    ptoolbar[i].Parent := p[i];
    //ptoolbar[i].Align:=alclient;
      //p[i].AutoSize:= true;
  end;
  except
  end;
end;

function Tfunction_unit.pagenew2(i:integer;s:string):TComponent;
begin
  try
    with function_unit do begin
      p[i] := TTabSheet.Create(self);
      p[i].Caption:= s;
      p[i].Name:= 'p' + inttostr(i);
      p[i].Parent := toolwindow.PageControl1;
      ptoolbar[i] := TToolBar.Create(self);
      ptoolbar[i].AutoSize:= true;
      ptoolbar[i].Caption:= 't' + inttostr(color_form.TabControl1.Tabs.Count-1);
      ptoolbar[i].Name:='t' + inttostr(i);
      ptoolbar[i].Parent := p[i];
      //showmessage(ptoolbar[i].Name);
      //ptoolbar[i].Align:=alclient;
      //p[i].AutoSize:= true;
      //pagenew2 := p[i];
    end;
  except
  end;
end;

function Tfunction_unit.deletebutton():boolean;
var
  i:integer;
begin
  //if function_unit.toolbar_deflut then
    //exit;
  i:= color_form.ListBox1.ItemIndex;
  function_unit.B[i].Free;
  for i := color_form.ListBox1.ItemIndex to function_unit.toolbarbuttoncount.Count -1 do begin
    function_unit.b[i] := function_unit.b[i +1];
  end;
  i := color_form.ListBox1.ItemIndex;
  function_unit.toolbarbuttoncount.Delete(i);
  color_form.ListBox1.Items.Delete(i);
end;

function Tfunction_unit.deletebutton2():boolean;
var
  i:integer;
begin
  i:= color_form.ListBox1.ItemIndex;
  //function_unit.tB[i].Name:= 'a';
  function_unit.tB[i].Free;
  for i := color_form.ListBox1.ItemIndex to function_unit.toolbarbuttoncount2.Count -1 do begin
    function_unit.tb[i] := function_unit.tb[i +1];
  end;
  i := color_form.ListBox1.ItemIndex;
  function_unit.toolbarbuttoncount2.Delete(i);
  color_form.ListBox1.Items.Delete(i);
end;

function Tfunction_unit.pagedelete(i:integer):boolean;
var
  c:TComponent;
begin
  c := FindComponent('t' + inttostr(i));
  if c <> nil then begin
    c.Free;
  end;
  c := FindComponent('p' + inttostr(i));
  if c <> nil then begin
    c.Free;
  end;
end;

function Tfunction_unit.pageout:boolean;
var
  i:integer;
begin
  color_form.TabControl1.Tabs.Clear;
  color_form.ComboBox5.Items.Clear;
  if color_form.CheckBox3.Checked then begin
    for i := 0 to toolwindow.PageControl1.ControlCount -1 do begin
      color_form.TabControl1.Tabs.Add(
        toolwindow.PageControl1.Page[i].Caption
      );

      color_form.ComboBox5.Items.Add(
        toolwindow.PageControl1.Page[i].Caption
      );
    end;
    color_form.ListBox1.Items.Clear;
    for i := 0 to function_unit.toolbarbuttoncount2.Count -1 do begin
      color_form.ListBox1.Items.Add(color_form.ListBox2.Items[strtoint(function_unit.toolbarbuttoncount2[i])]);
    end;
  end else begin
    color_form.ListBox1.Items.Clear;
    for i := 0 to function_unit.toolbarbuttoncount.Count -1 do begin
      color_form.ListBox1.Items.Add(color_form.ListBox2.Items[strtoint(function_unit.toolbarbuttoncount[i])]);
    end;
  end;
end;

function Tfunction_unit.iniread:boolean;
var
  alist:TStringList;
  i,i1,i2,i3:integer;
  s,s1:string;
begin
  alist := TStringList.Create;
  alist.Clear;
  alist.LoadFromFile(
    utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) ) + 'seting.ini')
  );

  i := alist.IndexOf('formtop');
  if -1 < i then begin
    Main.Top := strtoint(alist[i+1]);
  end;
  i := alist.IndexOf('formleft');
  if -1 < i then begin
    Main.Left := strtoint(alist[i+1]);
  end;
  i := alist.IndexOf('formwidth');
  if -1 < i then begin
    Main.Width := strtoint(alist[i+1]);
  end;
  i := alist.IndexOf('formheight');
  if -1 < i then begin
    Main.Height := strtoint(alist[i+1]);
  end;

  i := alist.IndexOf('editcolor');
  if -1 < i then begin
    try
      NewSet.add(alist[i]);
      NewSet.add(alist[i+1]);
      function_unit.editlist.Items[function_unit.count_window -1].SynEdit1.Font.Color := stringtocolor(alist[i+1]);
    except
    end;
    try
      NewSet.add(alist[i+2]);
      function_unit.editlist.Items[function_unit.count_window -1].SynEdit1.Color := stringtocolor(alist[i+2]);
    except
    end;
  end;

  i := alist.IndexOf('memo');
  if not Main.Menu_MultWindow.Checked then begin
    if -1 < i then begin
      if (alist[i+ 1]) = 'on' then begin
        NewSet.add(alist[i]);
        NewSet.add(alist[i+1]);
        //Main.Menu_MemoModeClick(Main.Menu_MemoMode);
      end;
   end;
  end else begin
    if -1 < i then begin
      if (alist[i+ 1]) = 'on' then begin
        NewSet.add(alist[i]);
        NewSet.add(alist[i+1]);
        //Main.Menu_MemoModeClick(Main.Menu_MemoMode);
      end;
    end;
  end;

  i := alist.IndexOf('memocolor');
  if -1 < i then begin
    NewSet.add(alist[i]);
    NewSet.add(alist[i+1]);
    NewSet.add(alist[i+2]);
    function_unit.editlist.Items[function_unit.count_window -1].Memo1.Font.Color := stringtocolor(alist[i+1]);
    function_unit.editlist.Items[function_unit.count_window -1].Memo1.Color := stringtocolor(alist[i+2]);
  end;

  i := alist.IndexOf('chrset');
  if -1 < i then begin
    if 'UTF8' = (alist[i+1]) then begin
      Main.Menu_UTF8click(Main.Menu_UTF8);
    end else if 'UTF16' = (alist[i+1]) then begin
      Main.Menu_UTF16click(Main.Menu_UTF16);
    end else if 'Ansi' = (alist[i+1]) then begin
      Main.Menu_Ansiclick(Main.Menu_Ansi);
    end;
  end;

  i := alist.IndexOf('codeblock');
  if -1 < i then begin
    if alist[i +1 ] = 'on' then
      color_form.CheckBox1.Checked:=true;
  end;

  i := alist.IndexOf('codesupport');
  if -1 < i then begin
    if alist[i +1 ] = 'on' then
      color_form.CheckBox2.Checked:=true;
  end;

  i := alist.IndexOf('listpopup');
  if -1 < i then begin
    function_unit.readkey1 := alist[i +1 ];
    function_unit.readkey2 := alist[i + 2];
  end;

  i := alist.IndexOf('codesupportpopup');
  if  -1 < i then begin
    function_unit.readkey3 := alist[i +1 ];
    function_unit.readkey4 := alist[i + 2];
  end;

  i := alist.IndexOf('syncolor');
  if -1 < i then begin
    i := alist.IndexOf('CommentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IDEDirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IdentifierAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('KeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SpaceAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('StringAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NumberAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AsmAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SymbolAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('CaseLabelAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirecAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('InvalidAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocumentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DefaultPackageAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('FunctionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('PLSQLAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SQLPlusAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TableNameAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('VariableAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocTypeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ElementAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TextAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AndAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ASPAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('UndefKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SectionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ConstantAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ObjectAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SecondKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('varAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
  end;


  i := alist.IndexOf('macro');
  if -1 < i then begin
    function_unit.macrocount:= strtoint(alist[i + 1]);
    for i1 := 0 to function_unit.macrocount -1 do begin
      function_unit.r_name[i1] := alist[i + 2];
      macro_form.Edit1.Text := alist[i+2];
      function_unit.macro_c[i1] := alist[i + 3];
      macro_form.edit2.Text := alist[i + 3];
      function_unit.macro_p[i1] := alist[i + 4];
      macro_form.ComboBox1.text := alist[i + 4];
      i := i + 3;
      function_unit.macrosetup(i1);
    end;
   end;

   i := alist.IndexOf('toolbarbutton');
   if -1 < i then begin
     for i1 := 0 to strtoint(alist[i+1]) -1 do begin
       function_unit.toolbarbuttoncount.Add(alist[i +2]);
       inc(i);
     end;
   end else begin
     function_unit.toolbar_deflut := true;
   end;

   //タブツールバー復元
   function_unit.settoolbar(alist);
   function_unit.setToolBarPreSet2(alist);

   i := alist.IndexOf('toolbar_deflut');
   if i <> -1 then begin
     i := alist.IndexOf('toolbarbutton');
     s := alist[i + 1];
     if '0' = s then begin
       function_unit.toolbar_deflut := true;
     end else begin
       function_unit.toolbar_deflut := false;
     end;
   end;

   i := alist.IndexOf('toolbar_deflut2');
   if i <> -1 then begin
     i := alist.IndexOf('toolbarbutton2');
     s := alist[i + 1];
     if '0' = s then begin
       function_unit.toolbar_deflut2 := true;
     end else begin
       function_unit.toolbar_deflut2 := false;
     end;
   end;

   i := alist.IndexOf('toolbarNotVisble');
   if i <> -1 then begin
     if 'true' = alist[i+1] then
     color_form.CheckBox4.Checked := true;
   end;

   i := alist.IndexOf('toolbarset');
   if -1 < i then begin
    if alist[i +1 ] = 'on' then begin
      //function_unit.toolbarset := true;
      //Timer on;
    end;
  end;

   i := alist.IndexOf('toolbaraligin');
   if -1 < i then begin
    function_unit.toolbar := alist[i + 1];
  end;

  alist.Free;

end;

function Tfunction_unit.iniwrite:boolean;
var
  alist:TStringList;
  i,i1,i2:integer;
begin
  i := Main.PageControl1.ActivePageIndex;
  alist := TStringList.Create;
  alist.Clear;

  alist.Add('formtop');
  alist.Add(inttostr(main.Top));
  alist.Add('formleft');
  alist.Add(inttostr(main.Left));
  alist.Add('formwidth');
  alist.Add(inttostr(main.Width));
  alist.Add('formheight');
  alist.Add(inttostr(main.Height));

  alist.Add('editcolor');
  alist.Add(inttostr(function_unit.editlist.Items[i].SynEdit1.Font.Color));
  alist.Add(inttostr(function_unit.editlist.Items[i].SynEdit1.Color));


  alist.Add('Memo1');
  with function_unit.editlist.Items[i] do begin
    if PageControl1.ActivePage =  TabSheet1 then begin
      alist.Add('off');
    end else if PageControl1.ActivePage =  TabSheet2 then begin
      alist.Add('on');
    end;

    alist.Add('Memo1color');
    alist.Add(inttostr(Memo1.Font.Color));
    alist.Add(inttostr(Memo1.Color));
  end;
  alist.Add('chrset');
  if Main.Menu_UTF8.Checked then begin
    alist.Add('UTF8');
  end else if Main.Menu_Ansi.Checked then begin
    alist.Add('Ansi');
  end else if Main.Menu_UTF16.Checked then begin
    alist.Add('UTF16');
  end;

  alist.add('codeblock');
  if color_form.CheckBox1.Checked then
    alist.Add('on')
  else
    alist.Add('off');

  alist.add('codesupport');
  if color_form.CheckBox2.Checked then
    alist.Add('on')
  else
    alist.Add('off');

  alist.Add('listpopup');
    alist.Add(inttostr(function_unit.listvkkey));
    alist.Add(inttostr(function_unit.popupkey));

  alist.Add('codesupportpopup');
    alist.Add(inttostr(function_unit.listvkkey2));
    alist.Add(inttostr(function_unit.popupkey2));

  alist.Add('syncolor');
    alist.Add('CommentAttri');
    with datamodule1.SynCppSyn1.CommentAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('DirecAttri');
    with datamodule1.SynCppSyn1.DirecAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('IDEDirectiveAttri');
    with datamodule1.SynPasSyn1.IDEDirectiveAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('IdentifierAttri');
    with datamodule1.SynCppSyn1.IdentifierAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('KeyAttri');
    with datamodule1.SynCppSyn1.KeyAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('SpaceAttri');
    with datamodule1.SynCppSyn1.SpaceAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('StringAttri');
    with datamodule1.SynCppSyn1.StringAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('NumberAttri');
    with datamodule1.SynCppSyn1.NumberAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('AsmAttri');
    with datamodule1.SynCppSyn1.AsmAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('SymbolAttri');
    with datamodule1.SynCppSyn1.SymbolAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('CaseLabelAttri');
    with datamodule1.SynPasSyn1.CaseLabelAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('DirecAttri');
    with datamodule1.SynCppSyn1.DirecAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('InvalidAttri');
    with datamodule1.SynCppSyn1.InvalidAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('DocumentAttri');
    with datamodule1.SynJavaSyn1.DocumentAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('DefaultPackageAttri');
    with datamodule1.SynSQLSyn1.DefaultPackageAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('FunctionAttri');
    with datamodule1.SynSQLSyn1.FunctionAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('PLSQLAttri');
    with datamodule1.SynSQLSyn1.PLSQLAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('SQLPlusAttri');
    with datamodule1.SynSQLSyn1.SQLPlusAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('TableNameAttri');
    with datamodule1.SynSQLSyn1.TableNameAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('VariableAttri');
    with datamodule1.SynSQLSyn1.VariableAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('DocTypeAttri');
    with datamodule1.SynXMLSyn1.DocTypeAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('NamespaceAttributeAttri');
    with datamodule1.SynXMLSyn1.NamespaceAttributeAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('NamespaceAttributeValueAttri');
    with datamodule1.SynXMLSyn1.NamespaceAttributeValueAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ElementAttri');
    with datamodule1.SynXMLSyn1.ElementAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('TextAttri');
    with datamodule1.SynXMLSyn1.TextAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('AndAttri');
    with datamodule1.SynHTMLSyn1.AndAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ASPAttri');
    with datamodule1.SynHTMLSyn1.ASPAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('UndefKeyAttri');
    with datamodule1.SynHTMLSyn1.UndefKeyAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ValueAttri');
    with datamodule1.SynHTMLSyn1.ValueAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('AttributeAttri');
    with datamodule1.SynXMLSyn1.AttributeAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('AttributeValueAttri');
    with datamodule1.SynXMLSyn1.AttributeValueAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('SectionAttri');
    with datamodule1.SynIniSyn1.SectionAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('ConstantAttri');
    with datamodule1.SynAnySyn1.ConstantAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ObjectAttri');
    with datamodule1.SynAnySyn1.ObjectAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('SecondKeyAttri');
    with datamodule1.SynUNIXShellScriptSyn1.SecondKeyAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('varAttri');
    with datamodule1.SynUNIXShellScriptSyn1.VarAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

  alist.Add('macro');
  alist.Add(inttostr(function_unit.macrocount));
  for i1 := 0 to function_unit.macrocount -1 do begin
    alist.Add(function_unit.r[i1].Caption);
    alist.Add(function_unit.macro_comand[i1]);
    alist.Add(function_unit.macro_param[i1]);
  end;

  alist.Add('toolbarbutton');
  alist.Add(inttostr(function_unit.toolbarbuttoncount.Count));
  for i1 := 0 to function_unit.toolbarbuttoncount.Count -1 do begin
    alist.Add(function_unit.toolbarbuttoncount[i1]);
  end;

  alist.Add('toolbarNotVisble');
  if color_form.CheckBox4.Checked then
    alist.Add('true')
  else
    alist.Add('false');

  alist.Add('toolbar_deflut');
  alist.Add('off');

  alist.Add('toolpage');
  alist.Add(inttostr(Main.PageControl1.PageCount));
  i2 := color_form.TabControl1.Tabs.Count;
  for i1 := 0 to Main.PageControl1.PageCount -1 do begin
    alist.Add(Main.PageControl1.Pages[i1].Caption);
  end;


    alist.Add('toolbarbutton2');
    alist.Add(inttostr(function_unit.toolbarbuttoncount2.Count));
    //showmessage(function_unit.toolbarbuttonparnt.Text);
    //showmessage(function_unit.toolbarbuttonparnt2.Text);
    for i1 := 0 to function_unit.toolbarbuttoncount2.Count -1 do begin
        alist.Add(function_unit.toolbarbuttoncount2[i1]);
        alist.Add(function_unit.toolbarbuttonparnt2[i1]);
    end;

  alist.Add('toolbar_deflut2');
  alist.Add('off');

  alist.Add('toolbarset');
  if color_form.CheckBox3.Checked then
    alist.Add('on')
  else
    alist.Add('off');

  alist.Add('toolbaraligin');
    alist.Add(interface_unit.toolbaraligin(''));

  alist.SaveToFile(
    utf8tosys(systoutf8(ExtractFilePath( (Paramstr(0)) ) + 'seting.ini')
  ));
end;

function Tfunction_unit.macrosetup(i:integer):boolean;
begin
  with function_unit do begin
    r[i]:= TMenuItem.Create(Main);
    if macro_form.Edit1.Text <> '' then begin
      r[i].Caption:= macro_form.edit1.Text;
    end else begin

    end;
    r[i].Name:= 'r' + inttostr(i);
    r[i].OnClick:= Main.MenuItem90.OnClick;
    if macro_form.edit2.Text = 'コード補完読込' then begin
      //macro_comand[i] := ExtractFilePath( Paramstr(0) ) + 'listoutput.exe';
      //macro_param[i] := 'findtext.txt '
    end else if macro_form.edit2.Text = 'fEdit起動' then begin
      macro_comand[i] := Paramstr(0);
    end else begin;
      macro_comand[i] := macro_form.Edit2.Text;
    end;

    if macro_form.ComboBox1.Text = '' then begin
      macro_param[i] := '';
    end else if macro_form.ComboBox1.Text = 'カレントタブファイル' then begin
      macro_param[i] := 'CalnetTab';
    end else if macro_form.ComboBox1.Text = '次のタブファイル' then begin
      macro_param[i] := 'NextTab';
    end else if macro_form.ComboBox1.Text = '2NextTab' then begin
      macro_param[i] := '2NextTab';
    end else if macro_form.ComboBox1.Text = '3NextTab' then begin
      macro_param[i] := '3NextTab';
    end else if macro_form.ComboBox1.Text = '最初のタブファイル' then begin
      macro_param[i] := 'FirstTab';
    end else if macro_form.ComboBox1.Text = '最後のタブファイル' then begin
      macro_param[i] := 'LastTab';
    end else if macro_form.ComboBox1.Text = 'カレントタブフォルダ' then begin
      macro_param[i] := 'CalnetTab Folda';
    end else if macro_form.ComboBox1.Text = '次のタブフォルダ' then begin
      macro_param[i] := 'NextTab Folda';
    end else if macro_form.ComboBox1.Text = '2NextTab Folda' then begin
      macro_param[i] := '2NextTab Folda';
    end else if macro_form.ComboBox1.Text = '3NextTab Folda' then begin
      macro_param[i] := '3NextTab Folda';
    end else if macro_form.ComboBox1.Text = '最初のタブフォルダ' then begin
      macro_param[i] := 'FirstTab Folda';
    end else if macro_form.ComboBox1.Text = '最後のタブフォルダ' then begin
      macro_param[i] := 'LastTab Folda';
    end else begin
      macro_param[i] := macro_form.ComboBox1.Text;
    end;
    Main.Menu_RootMacro.Add(r[i]);
    //inc(macrocount);
  end;
end;

function Tfunction_unit.macro(send:TObject):boolean;
var
  ad0,ad1,s:string;
  i,i1:integer;
begin
   with function_unit do begin
     for i := 0 to macrocount -1 do begin
       if r[i] = send then
         i1 := i;
     end;
     ad0 := macro_comand[i1];

     if macro_param[i1] = '' then begin
       ad1 := macro_param[i1];
     end else if macro_param[i1] = 'CalnetTab' then begin
       ad1 := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].filename_path;
     end else if macro_param[i1] = 'NextTab' then begin
       ad1 := function_unit.editlist.Items[main.PageControl1.ActivePageIndex+ 1].filename_path;
     end else if macro_param[i1] = '2NextTab' then begin
       ad1 := function_unit.editlist.Items[main.PageControl1.ActivePageIndex+ 2].filename_path;
     end else if macro_param[i1] = '3NextTab' then begin
       ad1 := function_unit.editlist.Items[main.PageControl1.ActivePageIndex+ 3].filename_path;
     end else if macro_param[i1] = 'FirstTab' then begin
       ad1 := function_unit.editlist.Items[0].filename_path;
     end else if macro_param[i1] = 'LastTab' then begin
       ad1 := function_unit.editlist.Items[function_unit.count_window].filename_path;
     end else if macro_param[i1] = 'CalnetTab Folda' then begin
       ad1 := extractfiledir(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].filename_path);
     end else if macro_param[i1] = 'NextTab Folda' then begin
       ad1 := extractfiledir(function_unit.editlist.Items[main.PageControl1.ActivePageIndex+ 1].filename_path);
     end else if macro_param[i1] = '2NextTab Folda' then begin
       ad1 := extractfiledir(function_unit.editlist.Items[main.PageControl1.ActivePageIndex+ 2].filename_path);
     end else if macro_param[i1] = '3NextTab Folda' then begin
       ad1 := extractfiledir(function_unit.editlist.Items[main.PageControl1.ActivePageIndex+ 3].filename_path);
     end else if macro_param[i1] = 'FirstTab Folda' then begin
       ad1 := extractfiledir(function_unit.editlist.Items[0].filename_path);
     end else if macro_param[i1] = 'LastTab Folda' then begin
       ad1 := extractfiledir(function_unit.editlist.Items[function_unit.count_window].filename_path);
     end else begin
       ad1 := macro_param[i1];
     end;
     {$IFDEF WIN32}
          if macro_comand[i1] = 'コード補完読込' then begin
            //function_unit.libopoen2(ad1);
          end else if macro_comand[i1] = 'fEdit起動' then begin
            ShellExecute(Handle, 'OPEN', pchar(Paramstr(0)),pchar(ad1),'', SW_SHOW);
          end else if macro_comand[i1] = 'エクスプローラ起動' then begin
            ShellExecute(Handle, 'OPEN', pchar('explorer.exe'),pchar(ad1),'', SW_SHOW);
          end else begin
            ShellExecute(Handle, 'OPEN', pchar(ad0),pchar(utf8toansi(ad1)),'', SW_SHOW);
          end;
     {$ENDIF}
     {$IFDEF LINUX}

     {$ENDIF}
     {$IFDEF MacOSX}

     {$ENDIF}

   end;
end;

procedure Tfunction_unit.FormCreate(Sender: TObject);
begin
  editList := TeditList.Create;
  editList.Clear;
  type_editbox := TStringlist.Create;
  type_editbox.Clear;
end;

function Tfunction_unit.tabseting1:boolean;
begin
  color_form.combobox5.Visible:= not color_form.combobox5.Visible;
  color_form.Button1.Visible:= not color_form.Button1.Visible;
  color_form.Button2.Visible:= not color_form.Button2.Visible;
  color_form.Button3.Visible:= not color_form.Button3.Visible;
end;

function Tfunction_unit.tabseting2:boolean;
begin
  if not main.Menu_ToolBarTAB.Checked then begin
    toolwindow.PageControl1.Visible:= true;
    toolwindow.ToolBar2.Visible:= false;
    main.Menu_ToolBarTAB.Checked:= true;
  end else begin
    toolwindow.PageControl1.Visible:= false;
    toolwindow.ToolBar2.Visible:= true;
    main.Menu_ToolBarTAB.Checked:= false;
  end;
end;

function Tfunction_unit.json_Keword_parse(st,st1:TStringList):boolean;
var
  st2,st3,st4,st5:Tstringlist;
  i,i1,i2:integer;
  sw:boolean;
  memo1:TMemo;
begin
  st2 := TStringlist.Create;
  st2.Clear;

  st3 := TStringlist.Create;
  st3.Clear;

  st4 := TStringlist.Create;
  st4.Clear;

  st5 := TStringlist.Create;
  st5.Clear;

  memo1 := TMemo.Create(function_unit);
  memo1.ScrollBars:= ssboth;
  memo1.Parent := function_unit;

  function_unit.findtext('"',st,st2,0);
  function_unit.findtext('":',st,st3,0);
  i1 := 0;
  sw := true;
  for i := 0 to st3.count -1 do begin
    sw := true;
    while sw do begin
      if (i1 < st2.Count -1) then begin
        if (strtoint(st2[i1]) > strtoint(st3[i])) then begin
          i2 := i1 -1;
          inc(i1);
          //showmessage(strtoint(st2[i2]);
          st4.Add(st2[i2]);
          sw := false;
        end else begin
          inc(i1);
        end;
      end else begin
        sw := false;
      end;
    end;
  end;
  memo1.Text:= st.Text;
  for i := 0 to st4.Count -1 do begin
    memo1.SelStart:= strtoint(st4[i]);
    memo1.SelLength:= strtoint(st3[i]) -strtoint(st4[i])-1;
    //showmessage(memo1.SelText);
    if -1 = st1.IndexOf(memo1.SelText) then
      st1.Add(memo1.SelText);
  end;
  memo1.Free;
  st2.Free;
  st3.Free;
  st4.Free;
  st5.Free;
end;

function Tfunction_unit.setdialog:boolean;
begin
  datamodule1.OpenDialog1.Filter:=
  'AllFile|*.*|Text|*.txt|JavaScript|*.js|HTML|*.html;*.htm|Css|*.css|Json|*.json|XML|*.xml|Java|*.java|C|*.c|C++|*.cpp|C hedder|*.h|C++ hedder|*.hpp|Pascal/Delphi|*.pas|PHP|*.php|UnixShell|*.sh|Bat|*.bat|INI|*.ini';
  datamodule1.SaveDialog1.Filter:=
  'AllFile|*.*|Text|*.txt|JavaScript|*.js|HTML|*.html;*.htm|Css|*.css|Json|*.json|XML|*.xml|Java|*.java|C|*.c|C++|*.cpp|C hedder|*.h|C++ hedder|*.hpp|Pascal/Delphi|*.pas|PHP|*.php|UnixShell|*.sh|Bat|*.bat|INI|*.ini';
  macro_form.OpenDialog1.Filter:=
  'AllFile|*.*|Text|*.txt|JavaScript|*.js|HTML|*.html;*.htm|Css|*.css|Json|*.json|XML|*.xml|Java|*.java|C|*.c|C++|*.cpp|C hedder|*.h|C++ hedder|*.hpp|Pascal/Delphi|*.pas|PHP|*.php|UnixShell|*.sh|Bat|*.bat|INI|*.ini';
end;


end.

