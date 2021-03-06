unit JSONFormEdit;

{$MODE Delphi}

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, FileUtil, shellapi,comobj, Process,
  lclintf, Menus;

type
  TCompList = class(TList)
  private
    function Get(Index: Integer): TControl;
    procedure Put(Index: Integer; const Value: TControl);
  public
    property Items[Index: Integer]: TControl read Get write Put; default;
     destructor Destroy; override;
  end;

  { TJSONEditForm }

  TJSONEditForm = class(TForm)
   Button1: TButton;
   Button12: TButton;
   Button15: TButton;
   Button2: TButton;
   alpaca: TButton;
   Button5: TButton;
   Button6: TButton;
   Button7: TButton;
   Button8: TButton;
   ComboBox2: TComboBox;
   ComboBox3: TComboBox;
   ComboBox4: TComboBox;
   ComboBox5: TComboBox;
   ComboBox6: TComboBox;
   Edit1: TEdit;
   GroupBox1: TGroupBox;
   GroupBox2: TGroupBox;
   GroupBox3: TGroupBox;
   GroupBox4: TGroupBox;
   GroupBox8: TGroupBox;
   Image2: TImage;
   Label1: TLabel;
   Label2: TLabel;
   Label3: TLabel;
   Label4: TLabel;
   Label5: TLabel;
   ListBox1: TListBox;
   MeisiForm: TPanel;
   MeisiPIc: TImage;
   Memo2: TMemo;
   Panel1: TPanel;
   Panel10: TPanel;
   Panel5: TPanel;
   Panel6: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Panel9: TPanel;
    setCompIMG: TGroupBox;
    S_description: TEdit;
    S_discription_Check: TCheckBox;
    S_ID: TEdit;
    S_ID_Check: TCheckBox;
    S_Title: TEdit;
    S_Title_Check: TCheckBox;
    S_Var: TEdit;
    S_Var_Check: TCheckBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    OpenDialog1: TOpenDialog;
    FontDialog1: TFontDialog;
    UpDown: TUpDown;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    waku: TPanel;
    procedure alpacaClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonschemaClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure GroupBox3Click(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure GroupBox5Click(Sender: TObject);
    procedure GroupBox6Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5DblClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MeisiPIcClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure S_TitleChange(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown4Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown3Changing(Sender: TObject; var AllowChange: Boolean);
    procedure setCompIMGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure setCompIMGMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure setCompIMGMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wakuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wakuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure wakuMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure print2Click(Sender: TObject);
 private
    { Private 宣言 }
    QRMemo1 : TMemo;
    savedir,loadfile:string;
    crentDir,SearchDir:String;
    waku_move_sw:boolean;
    waku_sizeY_sw,waku_sizeX_sw:boolean;
    dwncount:integer;
    ptX,ptY:integer;
    count:integer;
    bmp_base,meisi_base:TBitmap;
  public
    { Public 宣言 }
    compset:TLabel;
    compset1:Timage;
    compset2:TCombobox;
    compset3:TCheckGroup;
    compset4:TRadioGroup;
    compset5:TPanel;
    compset6:TMemo;
    compset7:TButton;
    schemafile:string;
    tempmemo:string;
    comp,qrcomp:TCompList;
    setprjdir,setdir:String;
    S_JSON1:TStringlist;
    qrimg:array [0..30] of Timage;
    QRLabel:array [0..30] of TMemo;
    QRMemo:array [0..30] of TMemo;
    QRImg2:array [0..30] of Timage;

    imgtext:array[0..15] of TMemo;
    img2:array[0..15] of TImage;
    Edit14:Tedit;
    loadprj:boolean;
    nmlsize_W,nmlsize_H:integer;
    prtimg:TImage;
    imgset:integer;
    setwidth,setheight:integer;
    J_V_OP:TStringList;
    //function printPIC(pagenum:integer;filename:string):boolean;
    function resetprot:boolean;
    function setMeisiSize:boolean;
    function setcomb(Top,Left,Height,Width:integer):boolean;
    function setSizeCombo:boolean;
    function setMoveCompSet(tp,lf,ht,wd:integer):boolean;
    function EnumFileFromDir(SearchDir: string): boolean;
    function Priset1:boolean;
    function resetcomp:boolean;
    function set_editcomp(i:integer;cmp:Tcontrol):boolean;
    function create_pic(savefile:string;i:integer;img:TImage;loadPIC:boolean):boolean;
    function create_comp(cmp:TControl;p:TWinControl;i,tp,lf,dt,ht:integer):boolean;
    function select_comp(set_json,s,dir:string;tp,lf,ht,dt:integer):boolean;
    function loadSeting(s:string):boolean;
    function load_setJSON(s:string):string;
    function saveSeting(s:string):boolean;
    function print_meisi(size:real):TBitmap;
    function view_meisi():boolean;
    function changupdown:boolean;
    function changcombobox:boolean;
    function changtrackbar:boolean;
    function set_compSize:boolean;
    function create_memo(savefile:string;i:integer;memo,m:TLabel;sw:boolean):boolean;
    function create_button(savefile:string;i:integer;memo,m:Tbutton;sw:boolean):boolean;
    function create_check(savefile:string;i:integer;memo,m:TCheckGroup;sw:boolean):boolean;
    function create_Label(savefile:string;i:integer;memo,m:TLabel;sw:boolean):boolean;
    function create_panel(savefile:string;i:integer;memo,m:TPanel;sw:boolean):boolean;
    function create_radio(savefile:string;i:integer;memo,m:TRadioGroup;sw:boolean):boolean;
    function create_combo(savefile:string;i:integer;memo,m:TCombobox;sw:boolean):boolean;
  end;

var
  JSONEditForm: TJSONEditForm;

implementation

uses JSONFormdialog, functionunit, interfaceunit, Jsonparse, mainform;

{$R *.lfm}

function TCompList.Get(Index: Integer): TControl;
begin
  Result :=  TControl( inherited Get(Index) );
end;

function TJSONEditForm.resetcomp:boolean;
var
  i:integer;
begin
  combobox6.Items.Clear;
  combobox6.Text := '';
  for i := 0 to comp.Count -1 do begin
     try
       comp.Items[0].free;
     except end;
     try
       comp.Delete(0);
     except end;
  end;

end;

function TJSONEditForm.EnumFileFromDir(SearchDir: string): boolean;
var
  Rec: TSearchRec;
begin
  begin
    //指定ディレクトリのすべての種類のファイルを列挙
    if FindFirstUTF8(SearchDir + '*.*',faAnyFile,Rec) { *Converted from FindFirst* } = 0 then
    try
      repeat
         if ((Rec.Attr and faDirectory > 0)) and
               (Rec.Name <> '.') and (Rec.Name <> '..') then
           begin
             //見つかったフォルダを追加
             if ExtractFIleExt(Rec.Name) = '.Form' then begin
               ListBox1.Items.Add(Rec.Name);
             end;
           end;
       until (FindNextUTF8(Rec) { *Converted from FindNext* } <> 0);
       Result :=true;
    finally
      FindCloseUTF8(Rec); { *Converted from FindClose* }
    end;
  end;
end;

function setfilename(st:TStringList;c:TControl):boolean;
  var
    s2,s3:String;
    i2,i3,i4:integer;
  begin
    st.Clear;
    s2 := c.hint;
    i2 := 1;
    i4 := 0;
    s3 := '';
    if 0 = ansipos(';',s2) then begin
        st.Text := s2;
        //showmessage(st.Text);
      end else begin
        //s2 := s2 + ';';
        while i2 >= 1 do begin
          i2 := ansipos(';',s2);
          //showmessage(s2);
          st.Text:= s2;
          for i3 := i4 to i2 -1 do begin
            s3 := s3 + s2[i3];
          end;
          //showmessage(s2);
          s2[i2] := chr(13);

          i4 := i2 -1;
          //showmessage('aaa' + st.Text);
          st.Add(s3);

          s3 := '';

        end;
      end;
  end;

function TJSONEditForm.setcomb(Top,Left,Height,Width:integer):boolean;
var
  i,Max:integer;
  function setMax(i,i2:integer):integer;
  begin
    if i < i2 then
      i := i2;
    setMax := i
  end;
begin
  Max := Top;
  Max := setMax(Max,Left);
  Max := setMax(Max,Height);
  Max := setMax(Max,Width);
    for i := 0 to Max do begin
      if i <= Top then
        combobox2.Items.Add(inttostr(i));
      if i <= Left then
        combobox3.Items.Add(inttostr(i));
      if i <= Height then
        combobox4.Items.Add(inttostr(i));
      if i <= Width then
        combobox5.Items.Add(inttostr(i));
    end;
end;

function TJSONEditForm.setSizeCombo:boolean;
begin
    updown1.Position := 50;
    updown2.Position := 50;
    updown3.Position := 50;
    updown4.Position := 50;
end;

function TJSONEditForm.setMeisiSize:boolean;
begin

    TrackBar1.Max := Height;
    TrackBar2.Max := Width;
    TrackBar3.Max := Height;
    TrackBar4.Max := Width;

    UpDown1.Max := Height;
    UpDown2.Max := Width;
    UpDown3.Max := Height;
    UpDown4.Max := Width;
    setcomb(Top,Left,Height,Width);
end;

function TJSONEditForm.setMoveCompSet(tp,lf,ht,wd:integer):boolean;
var
  i,i1:integer;
  R:TRect;
  B:TBitmap;
begin
  {B := TBitMap.Create;
  B.Width := wd;
  B.Height := ht;
  R := Rect(10,10,20, 30);
  B.Canvas.Pen.Color := clBlack;
  //B.Canvas; //(10,10,20,20,40,40,50,50);
  //B.Canvas.Pen.Style := pssolid;
  //B.Canvas.Brush.Style:= bssolid;
  //B.Canvas.Brush.Color := clblack;
  //B.Canvas.Rectangle(R.Left,R.Top,R.Right,R.Bottom);
  JSONEditForm.setcompIMG.Picture.Bitmap := (B);
  }

    setcompIMG.top := tp;
    setcompIMG.Left := lf ;
    setcompIMG.Width := wd+ 4;
    setcompIMG.Height := ht +8;

    waku.Width := wd-6;
    waku.Height := ht-8;

  //B.Free;
end;

function TJSONEditForm.changupdown:boolean;
begin
    TrackBar1.Position := updown1.Position;
    TrackBar2.Position := updown2.Position;
    TrackBar3.Position := updown3.Position;
    combobox4.Text := inttostr(trackbar3.position);
    TrackBar4.Position := updown4.Position;
    setMoveCompSet(
      updown1.Position,
      updown2.Position,
      updown3.Position,
      updown4.Position
    );

end;

function TJSONEditForm.changtrackbar:boolean;
begin
    updown1.Position := TrackBar1.Position;
    updown2.Position := TrackBar2.Position;
    combobox3.Text := inttostr(TrackBar2.Position);
    updown3.Position := TrackBar3.Position;
    updown4.Position := TrackBar4.Position;
    setMoveCompSet(
        TrackBar1.Position,
        TrackBar2.Position,
        TrackBar3.Position,
        TrackBar4.Position
    );
end;

function TJSONEditForm.changcombobox:boolean;
begin
    try
      TrackBar1.Position := strtoint(combobox2.text);
    except
    end;
    try
      TrackBar2.Position := strtoint(combobox3.text);
    except
    end;
    try
      TrackBar3.Position := strtoint(combobox4.text);
      updown3.Position := strtoint(combobox4.text);
    except
    end;
    try
      TrackBar4.Position := strtoint(combobox5.text);
    except
    end;
    setMoveCompSet(
       strtoint(combobox2.text),
       strtoint(combobox3.text),
       strtoint(combobox4.text),
       strtoint(combobox5.text)
    );
end;

function TJSONEditForm.set_compSize:boolean;
begin
  changcombobox;
  changupdown;
  changtrackbar;
end;

function  TJSONEditForm.set_editcomp(i:integer;cmp:Tcontrol):boolean;
var
  c:Tcontrol;
  s1,s2,s3,s4:string;
begin
      c := comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      cmp.Hint := c.Hint;
      ComboBox2.Text := inttostr(comp.Items[i].Top);
      ComboBox3.Text := InttoStr(comp.Items[i].left);
      ComboBox4.Text := IntToStr(comp.Items[i].Height);
      ComboBox5.Text := IntToStr(comp.Items[i].Width);
      s1 := (ComboBox2.Text);
      s2 := (ComboBox3.Text);
      s3 := (ComboBox4.Text);
      s4 := (ComboBox5.Text);
      //showmessage(s);
      changcombobox;

        setMoveCompSet(
          strtoint(s1),
          strtoint(s2),
          strtoint(s3),
          strtoint(s4)
        );
        TrackBar1.Position := strtoint(s1);
        TrackBar2.Position := strtoint(s2);
        TrackBar3.Position := strtoint(s3);
        TrackBar4.Position := strtoint(s4);


end;


function TJSONEditForm.create_combo(savefile:string;i:integer;memo,m:TCombobox;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
    end else begin

       JsonForm2.ShowModal;
       m.Items.Text :=JsonForm2.Memo1.Lines.Text;

     end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 3;
    //t := m.Font.Style;
    //showmessage(t);

    comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';';    //showmessage(comp.Items[i].Hint);
end;


function TJSONEditForm.create_radio(savefile:string;i:integer;memo,m:TRadioGroup;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    //m.Caption := memo.Caption;
    //m.Font := memo.Font;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end else begin

       JsonForm2.ShowModal;
       m.Items.Text :=JsonForm2.Memo1.Lines.Text;

     end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 5;
    //t := m.Font.Style;
    //showmessage(t);

    comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';';
    //showmessage(comp.Items[i].Hint);
end;


function TJSONEditForm.create_panel(savefile:string;i:integer;memo,m:TPanel;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end else begin

       JsonForm2.ShowModal;
       m.Caption:=JsonForm2.Memo1.Lines.Text;

     end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 7;
    //t := m.Font.Style;
    //showmessage(t);

   comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';';    //showmessage(comp.Items[i].Hint);
end;

function TJSONEditForm.create_Label(savefile:string;i:integer;memo,m:TLabel;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end else begin

       JsonForm2.ShowModal;
       m.Caption:=JsonForm2.Memo1.Lines.Text;

     end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 1;
    //t := m.Font.Style;
    //showmessage(t);

    comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';' + m.Font.Name + ';' + inttostr(m.Font.Size) + ';' + inttostr(m.Font.Color) + ';' + s;
    //showmessage(comp.Items[i].Hint);
end;

function TJSONEditForm.create_check(savefile:string;i:integer;memo,m:TCheckGroup;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end else begin

       JsonForm2.ShowModal;
       m.Items.Text :=JsonForm2.Memo1.Lines.Text;

     end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 6;
    //t := m.Font.Style;
    //showmessage(t);

    comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';';    //showmessage(comp.Items[i].Hint);

end;

function TJSONEditForm.create_button(savefile:string;i:integer;memo,m:Tbutton;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end else begin

       JsonForm2.ShowModal;
       m.caption :=JsonForm2.Memo1.Lines.Text;

     end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 8;
    //t := m.Font.Style;
    //showmessage(t);

    comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';';    //showmessage(comp.Items[i].Hint);
end;


function TJSONEditForm.create_memo(savefile:string;i:integer;memo,m:TLabel;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin

    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    m.WordWrap:= true;
    m.AutoSize := false;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end else begin

      ShowModal;
      m.Caption:=JsonForm2.Memo1.Lines.Text;

    end;

      comp.Items[i].Hint := savefile;
      m.top := UpDown1.Position;
      m.Left := UpDown2.Position;
      m.Height := UpDown3.Position;
      m.Width := UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := Memo1Change;

    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 2;
    //t := m.Font.Style;
    //showmessage(t);
    if m.Font.Style = [fsBold] then begin
     // s := styletostr();//'fsBold';
    end;
    if m.Font.Style = [fsItalic] then begin
      s :=  s + ';fsItalic';
    end;

    if m.Font.Style = [fsUnderline] then begin
      s := s + ';fsUnderline';
    end;
    if m.Font.Style = [fsStrikeOut] then begin
      s := s + ';fsStrikeOut';
    end;
    comp.Items[i].hint := setdir + ExtractFileName(savefile) + ';' + m.Font.Name + ';' + inttostr(m.Font.Size) + ';' + inttostr(m.Font.Color) + ';' + s;
    //showmessage(comp.Items[i].Hint);

end;

function TJSONEditForm.create_pic(savefile:string;i:integer;img:TImage;loadPIC:boolean):boolean;
var
  J:TJPegImage;
  B:TBitmap;
begin
    //image2.Picture.Clear;
    if loadPIC then begin
      if not opendialog1.Execute then
        exit;
      B := TBitmap.Create;
      J :=TJpegImage.Create;
      J.LoadFromFile(opendialog1.filename);
      J.SaveToFile( savefile );
      B.Assign(J);
      img.Picture.Assign(B);
      img.OnClick:= Image2.OnClick;
      //JSONEditForm.Image2.Picture.Assign(B);
      B.Free;
      J.Free;

    end else begin
      if img = nil then begin
        with comp.Items[i] do begin
             Hint := setdir +ExtractFileName(savefile);
             top := TrackBar1.Position;
             Left := TrackBar2.Position;
             Width := TrackBar4.Position;
             Height := TrackBar3.Position;
             Visible := true;
             Parent := Parent;
             //Stretch := true;
         end;
        exit;
      end;


      B := TBitmap.Create;
      J :=TJpegImage.Create;
      J.LoadFromFile(savefile);
      //J.SaveToFile( savefile );
      B.Assign(J);
      img.Picture.Assign(B);
      img.OnClick:= Image2.OnClick;
      //JSONEditForm.Image2.Picture.Assign(B);
      B.Free;
      J.Free;

    end;


  with comp.Items[i] do begin
      Hint := setdir + '\' + savefile;
      img.top := TrackBar1.Position;
      img.Left := TrackBar2.Position;
      img.Width := TrackBar4.Position;
      img.Height := TrackBar3.Position;
      img.Visible := true;
      img.Parent := Parent;
      img.Stretch := true;
  end;
  //if loadPIC then begin
    try
      comp.Items[i].Visible:= false;
    except end;

    //JSONEditForm.comp.Items[i].Create(JSONEditForm);
    comp.Items[i] := img;
    comp.Items[i].Visible:= true;
    //showmessage(JSONEditForm.setdir +ExtractFileName(savefile));
   // showmessage(JSONEditForm.comp.Items[i].hint);

    comp.Items[i].hint := setdir +ExtractFileName(savefile);
    comp.Items[i].Tag := 1;
 // end;
end;

function TJSONEditForm.create_comp(cmp:TControl;p:TWinControl;i,tp,lf,dt,ht:integer):boolean;
begin
  with cmp do begin;
    Parent := p;
    top    := tp;
    Left   := lf;
    width  := dt;
    height := ht;

    Tag := i;
    Enabled := true;
    Visible:= true;
  end;
  comp.Add(cmp);
end;

function create_qrcomp1(bmp:Tbitmap;cmp:TMemo;p:TControl;i,tp,lf,dt,ht:integer):boolean;
var
  Rect1:TRect;
begin
  with bmp.Canvas do begin;
    with Rect1 do begin
      begin//ここでコピー先の位置を決める
        Top:=tp;Left:=lf;
        Right:=dt;Bottom:=ht;
      end;
      font := cmp.Font;
      pen.Color := cmp.Font.Color;

      //TextRect(Rect1,lf,tp,'aaaaaa');
      Rectangle(Rect1);
      TextRect(Rect1,lf,tp,cmp.Lines.Text);
         // stretchDraw(Rect1,);
    end;
  end;
end;

function create_qrcomp2(bmp:Tbitmap;cmp:TImage;p:TControl;i,tp,lf,dt,ht:integer):boolean;
var
  Rect1:TRect;
begin
  with bmp.Canvas do begin;
    with Rect1 do begin
      begin//ここでコピー先の位置を決める
        Top:=tp;Left:=lf;
        Right:=dt;Bottom:=ht;
      end;
      Rectangle(Rect1);
      stretchDraw(Rect1,cmp.Picture.Bitmap);
    end;
  end;

end;

function TJSONEditForm.select_comp(set_json,s,dir:string;tp,lf,ht,dt:integer):boolean;
begin
  if s = '写真' then begin
    compset1 := TImage.Create(JSONEditForm);
    compset1.OnClick:= Label5Click;
    create_comp(JSONEditForm.compset1,JSONEditForm.MeisiForm,1,tp,lf,dt,ht);
    create_pic(dir + inttostr(JSONEditForm.comp.count-1),JSONEditForm.comp.Count -1,TImage.Create(JSONEditForm),true);
  end else if 0 < ansipos('オブジェクト',s) then begin
   compset6 := TMemo.Create(JSONEditForm);
   //JSONEditForm.Memo1.Lines.Clear;
   //JSONEditForm.compset.ReadOnly:= true;
   //JSONEditForm.compset.BorderStyle:= bsnone;
   //compset.AutoSize:= false;
   compset6.Align:= albottom;
   compset6.WordWrap:= true;
   compset6.text := set_json;
   //compset6.OnClick:= Label5Click;
   compset6.Lines.SaveToFile(dir);
   compset6.Free;
   compset := TLabel.Create(JSONEditform);
   compset.Align:= albottom;
   compset.WordWrap:= true;
   compset.OnClick:= Label5Click;
   compset.Hint:= dir;
   compset.Caption := set_json;
   create_comp(compset,MeisiForm,2,tp,lf,dt,ht);
   //showmessage(inttostr(JSONEditForm.comp.count));
   //create_memo(dir + inttostr(JSONEditForm.comp.count-1),JSONEditForm.comp.Count -1,TLabel.Create(JSONEditForm),JSONEditForm.compset6,not true);
  end else if 0 < ansipos('エンド',s) then begin
   compset6 := TMemo.Create(JSONEditForm);
   //JSONEditForm.Memo1.Lines.Clear;
   //JSONEditForm.compset.ReadOnly:= true;
   //JSONEditForm.compset.BorderStyle:= bsnone;
   //compset.AutoSize:= false;
   compset6.Align:= albottom;
   compset6.WordWrap:= true;
   compset6.text := '}';
   //compset6.OnClick:= Label5Click;
   compset6.Lines.SaveToFile(dir);
   compset6.Free;
   compset:= TLabel.Create(JSONEditform);
   compset.Align:= albottom;
   compset.WordWrap:= true;
   compset.Caption := set_json;
   compset.OnClick:= Label5Click;
   compset.Hint:= dir;
   create_comp(compset,MeisiForm,2,tp,lf,dt,ht);
   //showmessage(inttostr(JSONEditForm.comp.count));
   //create_memo(dir + inttostr(JSONEditForm.comp.count-1),JSONEditForm.comp.Count -1,TLabel.Create(JSONEditForm),JSONEditForm.compset6,not true);
  end else begin
   compset6 := TMemo.Create(JSONEditForm);
   //JSONEditForm.Memo1.Lines.Clear;
   //JSONEditForm.compset.ReadOnly:= true;
   //JSONEditForm.compset.BorderStyle:= bsnone;
   //compset.AutoSize:= false;
   compset6.Align:= albottom;
   compset6.WordWrap:= true;
   compset6.text := set_json;
   //compset6.OnClick:= Label5Click;
   compset6.Lines.SaveToFile(dir);
   compset6.Free;
   compset := TLabel.Create(JSONEditform);
   compset.Align:= albottom;
   compset.WordWrap:= true;
   compset.OnClick:= Label5Click;
   compset.Caption := set_json;
   compset.Hint:= dir;
   create_comp(compset,MeisiForm,2,tp,lf,dt,ht);
   //showmessage(inttostr(JSONEditForm.comp.count));
   //create_memo(dir + inttostr(JSONEditForm.comp.count-1),JSONEditForm.comp.Count -1,TLabel.Create(JSONEditForm),JSONEditForm.compset6,not true);
  end;
  ComboBox6.Items.Add(
    inttostr(comp.count-1) + s
  );
  Memo2.Clear;
  //Memo1.Clear;
end;


function TJSONEditForm.loadSeting(s:string):boolean;
var
  i,i1,i2,i3,i4,i5:integer;
  SL:TStringList;
  cmpname:string;
  M:Tlabel;
  X:Tcombobox;
  C:TcheckGroup;
  R:TRadioGroup;
  P:Tpanel;
  t:TButton;

  s1,s2,s3:string;
  st,st2:TStringList;
  img:TImage;
  J:TJPegImage;
  B:TBitmap;
begin
  SL := TStringList.Create;
  SL.Clear;
  SL.LoadFromFile(utf8toansi(s));
  //showmessage(sl.Text);
  sl.Text:= ansitoutf8(sl.Text);
  M := TLabel.Create(JSONEditForm);
  m.Parent := JSONEditForm;
  m.visible := false;
  m.Caption:= '';

  x := TCombobox.Create(JSONEditForm);
  x.Parent := JSONEditForm;
  x.visible := false;

  c := TcheckGroup.Create(JSONEditForm);
  c.Parent := JSONEditForm;
  c.visible := false;

  r := TradioGroup.Create(JSONEditForm);
  r.Parent := JSONEditForm;
  r.visible := false;

  p := TPanel.Create(JSONEditForm);
  p.Parent := JSONEditForm;
  p.visible := false;

  t := TButton.Create(JSONEditForm);
  t.Parent := JSONEditForm;
  t.visible := false;


  st := TStringList.Create;
  st.Clear;
  //showmessage(sl.Text);

  B := TBitmap.Create;
  J :=TJpegImage.Create;
  try
    J.LoadFromFile(setdir + 'haikei');
    B.Assign(J);
    MeisiPIC.Picture.Assign(B);
  except
    B.Canvas.Create;
    B.Width := MeisiPIc.Width;
    B.Height := MeisiPIc.Height;
    B.Canvas.Brush.Color:= clWhite;
    B.Canvas.Rectangle(0,0,B.Width,B.Height);
    MeisiPIC.Picture.Assign(B);
    J.Assign( MeisiPIC.Picture.Bitmap );
    J.SaveToFile(JSONEditForm.setdir + 'haikei');
  end;
  B.Free;
  J.Free;

  i := 0;
  i1 := 0;
  while i < SL.Count -1 do begin
    if SL[i] = '2' then begin
      try
           compset6 := TMemo.Create(JSONEditForm);
           //JSONEditForm.Memo1.Lines.Clear;
           //JSONEditForm.compset.ReadOnly:= true;
           //JSONEditForm.compset.BorderStyle:= bsnone;
           //compset.AutoSize:= false;
           compset6.Align:= albottom;
           compset6.WordWrap:= true;
           //showmessage(sl[i + 1]);
           compset6.Lines.LoadFromFile(sl[i + 1]);
           //compset6.OnClick:= Label5Click;
           compset6.Hint:= sl[i +1];

           s1 := extractfileext(sl[i+1]);
           s2 := '';
           for i1 := 2 to length(s1) do begin
             s2 := s2 + s1[i1];
           end;
           cmpname := s2;


           //create_comp(compset6,MeisiForm,2,tp,lf,dt,ht);
        create_comp(compset6,MeisiForm,2,0,0,60,60);
        ComboBox6.Items.Insert(ComboBox6.Items.Count,
      inttostr(ComboBox6.Items.Count) + cmpname
    );
      except end;

    end;


    inc(i);
  end;
  M.free;
  SL.Free;
end;

function TJSONEditForm.load_setJSON(s:string):string;
var
  i,i1:integer;
  SL:TStringList;
  st:TMemo;
  st2:TStringList;
begin
  SL := TStringList.Create;
  SL.Clear;
  SL.LoadFromFile(utf8toansi(s));
  //showmessage(sl.Text);
  sl.Text:= ansitoutf8(sl.Text);

  st := TMemo.Create(owner);
  st.Lines.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  //showmessage(sl.Text);
  //showmessage(s + sl.Text);
  i := 0;
  i1 := sl.Count-1;
  while i < SL.Count -1 do begin
    if SL[i] = '2' then begin
      try
        //showmessage(sl[i + 1]);
        st.Lines.LoadFromFile(sl[i + 1]);
        //showmessage(st.Text);
        st2.Insert(st2.Count,st.Text);
      except end;
    end;
    inc(i);
    dec(i1);
  end;
  //showmessage(st2.Text);
  load_setJSON := st2.Text;
  st.free;
  st2.Free;
  SL.Free;
end;

function TJSONEditForm.saveSeting(s:string):boolean;
var
  i:integer;
  SL:TStringList;
  B:Tbitmap;
  J:TJPegImage;
begin
  SL := TStringList.Create;
  SL.Clear;
  i := 0;
  while i < comp.Count do begin
    with comp.Items[i] do begin
      SL.add(inttostr(tag));
      SL.add( {JSONEditForm.savedir +} utf8toansi(hint));
      SL.add(inttostr(TOP));
      SL.add(inttostr(LEFT));
      SL.add(inttostr(Height));
      SL.add(inttostr(Width));
      inc(i);
    end;
  end;
  B := TBitmap.Create;
  J := TJpegImage.Create;
  B.Canvas.Create;
  B.Width := MeisiPIc.Width;
  B.Height := MeisiPIc.Height;
  B.Canvas.Brush.Color:= clWhite;
  B.Canvas.Rectangle(0,0,B.Width,B.Height);
  MeisiPIC.Picture.Assign(B);
  J.Assign( MeisiPIC.Picture.Bitmap );
  J.SaveToFile(setdir + 'haikei');
  B.Free;
  J.Free;
  //showmessage(sl.Text);
  SL.SaveToFile((s));
  SL.Free;
end;


function TJSONEditForm.Priset1:boolean;
var
  st:TStringList;
  searchdir:string;
begin
  if ListBox1.Items.Count = 0 then begin
    //CreateDirUTF8(ansitoutf8(ExtractFilePath( Paramstr(0) )) + 'サンプル.Label'); { *Converted from CreateDir* }
    {st := TStringList.Create;
    st.Text :=
    '2' + chr(13)
    + '0;ＭＳ Ｐゴシック;9' + chr(13)
    + '20' + chr(13)
    + '68' + chr(13)
    + '36' + chr(13)
    + '261' + chr(13)
    + '2' + chr(13)
    + '0;ＭＳ Ｐゴシック;14' + chr(13)
    + '63' + chr(13)
    + '68' + chr(13)
    + '36' + chr(13)
    + '261' + chr(13)
    + '2' + chr(13)
    + '0;ＭＳ Ｐゴシック;10' + chr(13)
    + '108' + chr(13)
    + '9' + chr(13)
    + '94' + chr(13)
    + '321' + chr(13)
    + '1' + chr(13)
    + '0' + chr(13)
    + '27' + chr(13)
    + '9' + chr(13)
    + '62' + chr(13)
    + '53' + chr(13);
    //showmessage(ansitoutf8(ExtractFilePath( Paramstr(0) )) + '名刺サンプル' + '\Meisi.mpr');
    st.SaveToFile((ExtractFilePath( Paramstr(0)) + utf8toansi('サンプル.Label' + '\Meisi.mpr')));
    st.Free;
    {JSONEditForm.setprjdir := ExtractFilePath( Paramstr(0) ) + '名刺サンプル' + '\';
    loadseting(ExtractFilePath( Paramstr(0) ) + '名刺サンプル' + '\Meisi.mpr');}
    SearchDir := ansitoutf8(ExtractFilePath( Paramstr(0) ));
    EnumFileFromDir(SearchDir);
    //JSONEditForm.ListBox1.ItemIndex := 0;
    //JSONEditForm.ListBox1DblClick(JSONEditForm.ListBox1);
  end;
end;

procedure TCompList.Put(Index: Integer; const Value: TControl);
begin
  inherited Put( Index, Value );
end;

destructor TCompList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;


procedure TJSONEditForm.Button10Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button12Click(Sender: TObject);
var
  s:string;
begin
  if not Panel1.Visible then
    exit;
  s := ( setprjdir + 'Meisi.mpr');
  saveSeting(utf8toansi(s));
end;

procedure TJSONEditForm.Button2Click(Sender: TObject);
var
  s1:string;
begin
  resetcomp;
  panel1.Visible:= true;
  GroupBox4.Visible:= true;
  MeisiForm.Visible := true;
  if -1 = ListBox1.Items.IndexOf(edit1.Text) then begin
    s1 := ansitoutf8(ExtractFilePath( Paramstr(0) )) + edit1.Text + '.Form';
    CreateDirUTF8((s1));{ *Converted from CreateDir* }
    MeisiForm.Width:= 500;
    MeisiForm.Height:=480;
    setMeisiSize;
    setprjdir := (s1 + '\');
    setdir := ExtractFileName( s1 ) + '\';
    SearchDir := ansitoutf8(ExtractFilePath( Paramstr(0) ));
    listbox1.Items.Clear;
    EnumFileFromDir(SearchDir);
    comp.Free;
    comp := TcompList.Create;
    comp.Clear;
    qrcomp.Free;
    qrcomp := TcompList.Create;
    qrcomp.Clear;
    saveseting(utf8toansi(setprjdir + 'Meisi.mpr'));

    S_JSON1.Clear;

  end;
end;

procedure TJSONEditForm.Button5Click(Sender: TObject);
var
  i,i1,i2,i3,i4,i5,i6:integer;
  s,s1,s2:string;
begin
   i := combobox6.ItemIndex;
   if i = -1 then begin
     showmessage('項目が選択されていません');
     exit;
   end;
   if 0 < ansipos('オブジェクト',combobox6.Items[i]) then begin
     s2 := 'オブジェクト';
   end else if 0 < ansipos('エンド',combobox6.Items[i]) then begin
     s2 := 'エンド';
   end;
   if 0 < ansipos(s2,combobox6.Items[i]) then begin
     i1 := length(s2);
     i2 := length(combobox6.Items[i]);
     s := combobox6.Items[i];
     s1 := '';
     for i3 := 1 to length(s1) do begin
       if (s1[i3] in ['0'..'9']) then begin
         i6 := i3;
       end;
     end;
     //showmessage(inttostr(i6));
     for i3 := i6 + 2 to i2- i1 do begin
       s1 := s1 + s[i3];
     end;


     try
       comp.Items[i].free;
     except end;
     try
      comp.Delete(i);
     except end;
     //showmessage(s1);
     combobox6.Items.delete(i);
     combobox6.text := '';
    try
       for i5 := 0 to combobox6.Items.Count -1 do begin;
         i4 := ansipos((s1),combobox6.Items[i5]);
        //showmessage(s1 + inttostr(i4));
         if i4 <> 0 then begin
          //showmessage(combobox6.Items[i5]);
           try
             comp.Items[i5].free;
           except end;
           try
            comp.Delete(i5);
           except end;
           combobox6.Items.delete(i5);
           combobox6.text := '';
         end;
       end;
     except

    end;
  end;
   combobox6.ItemIndex:=0;
end;

procedure TJSONEditForm.Button6Click(Sender: TObject);
begin
  try
    create_pic(JSONEditForm.setprjdir + inttostr(JSONEditForm.ComboBox6.ItemIndex),JSONEditForm.ComboBox6.ItemIndex,TImage.Create(JSONEditForm),true);
  except
    showmessage('項目が選択されていません。');
  end;
  SetCurrentDirUTF8(ExtractFilePath( Paramstr(0) )); { *Converted from SetCurrentDir* }
end;

procedure TJSONEditForm.Button7Click(Sender: TObject);
var
  l:TLabel;
  i:integer;
begin
  i := combobox6.ItemIndex;
   if i = -1 then begin
     showmessage('項目が選択されていません');
     exit;
   end;
    savedir := setprjdir;
  //if 0 < ansipos('メモ',combobox6.Text) then begin
    try
      l := TLabel.Create(JSONEditForm);
      l.Visible:= false;
      l.WordWrap:=true;
      l.AutoSize:=false;
      l.Caption:= JSON_pars.json_s[i];
      l.Font := memo2.Font;
      l.OnClick:= Image2.OnClick;
      Label5.Caption := memo2.Text;
      Label5.Font := memo2.Font;
      Label5.Visible:=true;
      create_memo( setprjdir + inttostr(combobox6.ItemIndex),combobox6.ItemIndex,l,TLabel.Create(JSONEditForm),true);
      l.Free;
    except end;
  //end else if 0 < ansipos('写真',combobox6.Text) then begin
    //try
      //loadSeting(JSONEditForm.loadfile);

      //create_PIC( setprjdir + inttostr(combobox6.ItemIndex),combobox6.ItemIndex,nil,false);

      //JSONEditForm.Button2Click(JSONEditForm.button2);
      //
   // except end;
  //end;
end;

procedure TJSONEditForm.Button8Click(Sender: TObject);
begin
  if not fontdialog1.Execute then
    exit;
  memo2.Font := fontdialog1.Font;
end;

function TJSONEditForm.print_meisi(size:real):TBitmap;
var
  i,i1,i2,x,y,w,h:integer;
  s:string;
  st,st2:TStringList;
  b,b1:Tbitmap;
  J:TJpegImage;
  Rect,Rect1:Trect;

  function set_editcomp(i:integer;cmp:Tcontrol):TRect;
  var
    c:Tcontrol;
  begin
    with comp.Items[i] do begin
      c := comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      cmp.Hint := c.Hint;
      set_editcomp.Top := Top;
      set_editcomp.left := left;
      set_editcomp.Bottom := top + Height;
      set_editcomp.Right := left + Width;
    end;
  end;
begin

  B := TBitmap.Create;
  J := TJpegImage.Create;
  st := TStringList.Create;
  st.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  meisi_base:= TBitmap.Create;
  rect.Top := 0;
  rect.Left := 0;
  rect.Right := trunc(JSONEditForm.MeisiPic.Width * (size));
  rect.Bottom := trunc(JSONEditForm.MeisiPic.Height * (size));

  meisi_base := MeisiPic.Picture.Bitmap;

  meisi_base.Width := rect.Right;
  meisi_base.Height := rect.Bottom;

  //JSONEditForm.meisi_base.Canvas.StretchDraw(rect, MeisiPIc.Picture.Bitmap);


  for i := 0 to comp.count - 1 do begin

    y := trunc(JSONEditForm.comp.Items[i].Top * size);
    x := trunc(JSONEditForm.comp.Items[i].Left * size);
    h := trunc(JSONEditForm.comp.Items[i].Height * size);
    w := trunc(JSONEditForm.comp.Items[i].Width * size);

    //Y := y *2;
   // x := x * 2;
    //h := h * 2;
    //w := w * 2;

    setfilename(st,JSONEditForm.comp.Items[i]);
    Rect1 := set_editcomp(i,JSONEditForm.comp.Items[i]);

    rect := rect1;

    Rect1.Top := trunc(Rect1.Top * size);
    Rect1.Left := trunc(Rect1.Left * size);
    rect1.Right := trunc(rect1.Right* size);
    Rect1.Bottom := trunc(Rect1.Bottom * size);

    Rect.Top := trunc(Rect1.Top * size-0.5);
    Rect.Left := trunc(Rect1.Left * size-0.5);
    rect.Right := trunc(rect1.Right* size-0.5);
    Rect.Bottom := trunc(Rect1.Bottom * size-0.5);

    SetCurrentDirUTF8(ansitoutf8(ExtractFilePath( Paramstr(0) ))); { *Converted from SetCurrentDir* }


    if comp.Items[i].Tag = 2 then begin
      with meisi_base.Canvas do begin
        st2.LoadFromFile(st[0]);
        font.Name := st[1];
        font.Size := trunc(strtoint(st[2])*size);
        pen.Color := strtoint(st[3]);
        brush.Style := bsClear;
        i2 :=0;
        for I1 := 0 to st2.Count - 1 do begin
          TextRect(Rect1,x,y+ i2 ,st2[i1]);
          i2 := i2 + TextHeight(st2[i1]);
        end;
      end;
    end;
    if comp.Items[i].Tag = 1 then begin
      j.LoadFromFile(JSONEditForm.comp.Items[i].hint);
      b.Assign(j);
      B1 := TBitmap.Create;
      b1.Width := rect1.Right;
      b1.Height := rect1.Bottom;
      b1.Canvas.StretchDraw(rect1,b);


      //JSONEditForm.meisi_base.Canvas.Rectangle(Rect1);
      meisi_base.Canvas.StretchDraw(Rect1,b);
      b1.Free;
    end;
  end;
  print_meisi := meisi_base;

end;


function TJSONEditForm.view_meisi():boolean;
var
  i,i1,i2,x,y,w,h:integer;
  s,set_name:string;
  st,st2:TStringList;
  b:Tbitmap;
  J:TJpegImage;
  Rect1:Trect;

  function set_editcomp(i:integer;cmp:Tcontrol):TRect;
  var
    c:Tcontrol;
  begin
    with comp.Items[i] do begin
      c := comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      //showmessage(inttostr(cmp.Tag));
      cmp.Hint := c.Hint;
      set_editcomp.Top := Top;
      set_editcomp.left := left;
      set_editcomp.Bottom := top + Height;
      set_editcomp.Right := left + Width;
    end;
  end;
begin
  bmp_base := TBitmap.Create;
  bmp_base.Canvas.Brush.Color := clBlack;
  bmp_base.Width := MeisiPIc.Width*4;
  bmp_base.Height := MeisiPIc.Height*4;
  bmp_base.Canvas.Create;
  bmp_base.Canvas.Brush.Color := clwhite;
  bmp_base.Canvas.pen.Color := clBlack;

  B := TBitmap.Create;
  J := TJpegImage.Create;
  st := TStringList.Create;
  st.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  meisi_base:= TBitmap.Create;
  meisi_base := MeisiPIc.Picture.Bitmap;


  for i := 0 to comp.count - 1 do begin

    y := comp.Items[i].Top;
    x := comp.Items[i].Left;
    h := comp.Items[i].Height * 4;
    w := comp.Items[i].Width * 4;
    //showmessage(st.Text);
    setfilename(st,JSONEditForm.comp.Items[i]);
    Rect1 := set_editcomp(i,JSONEditForm.comp.Items[i]);
    //st.Text:= utf8toansi(st.Text);
    //showmessage(st.Text);
    SetCurrentDirUTF8(utf8toansi(ExtractFilePath( Paramstr(0) ))); { *Converted from SetCurrentDir* }
    //showmessage(inttostr(JSONEditForm.comp.Items[i].Tag));
    if comp.Items[i].Tag = 2 then begin
      with meisi_base.Canvas do begin
        set_name := {ansitoutf8(ExtractFilePath( Paramstr(0) )) +} (utf8toansi(st[0]));
        //showmessage(utf8toansi(set_name));
        //showmessage(ansitoutf8(set_name));
        //showmessage(ansitoutf8(ExtractFilePath( Paramstr(0) ) + (utf8toansi(st[0]))));
        //showmessage((ExtractFilePath( Paramstr(0) ) + utf8toansi(st[0])));
        //showmessage((ExtractFilePath( Paramstr(0) ) + utf8toansi(st[0])));


        st2.LoadFromFile(utf8toansi(set_name));
        //showmessage(st2.Text + st[0]);
        font.Name := st[1];
        font.Size := strtoint(st[2]);
        pen.Color := strtoint(st[3]);
        brush.Style := bsClear;
        i2 :=0;
        for I1 := 0 to st2.Count - 1 do begin
          TextRect(Rect1,x,y+ i2 ,st2[i1]);
          i2 := i2 + TextHeight(st2[i1]);
        end;
      end;
    end else if comp.Items[i].Tag = 1 then begin
      j.LoadFromFile(utf8toansi(JSONEditForm.comp.Items[i].hint));
      b.Assign(j);
      meisi_base.Canvas.Rectangle(Rect1);
      meisi_base.Canvas.StretchDraw(Rect1,b);
    end;
  end;
  bmp_base.Canvas.Draw(0,0,JSONEditForm.meisi_base);
end;



procedure TJSONEditForm.ComboBox1Click(Sender: TObject);
begin
  select_comp(
              '',//jsonデータ挿入
              'メモ',
              setprjdir,
              strtoint(combobox2.Text),
              strtoint(combobox3.Text),
              strtoint(combobox4.Text),
              strtoint(combobox5.Text));

  ComboBox6.ItemIndex := ComboBox6.Items.Count -1;
  ComboBox6Change(Sender);
end;

procedure TJSONEditForm.ComboBox2Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TJSONEditForm.ComboBox2KeyPress(Sender: TObject; var Key: Char);
var
  i,i1:integer;
begin
  //showmessage(inttostr(dwncount));
  {if key = char(dwncount) then begin
    dwncount := word(key) * 10;
  end else begin
    dwncount := word(key);
  end;
  for i := 0 to TComboBox(JSONEditForm.ActiveControl).items.count -1 do begin
    i1 := ansipos(inttostr(dwncount),TComboBox(JSONEditForm.ActiveControl).items[i]);
    if 0 < i1 then begin
      dwncount := i1;

      break
    end;
  end;}
  TComboBox(JSONEditForm.ActiveControl).itemIndex := i;
  key := chr(0);
  //PostMessage(TComboBox(JSONEditForm.ActiveControl).Handle, CB_SHOWDROPDOWN, 1, 0);
end;

procedure TJSONEditForm.ComboBox3Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TJSONEditForm.ComboBox4Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TJSONEditForm.Memo2DblClick(Sender: TObject);
begin
  memo2.Text:= Memo2.Text;
  Memo2.Visible:=false;

  Button7Click(Sender);
end;

procedure TJSONEditForm.Panel8Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.RadioGroup1Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to comp.Count -1 do begin
    if comp[i] = sender then begin
      ComboBox6.ItemIndex:= i;
      //JSONEditForm.Memo2.Visible:=false;
      ComboBox6Change(ComboBox6);
    end;
  end;
end;

procedure TJSONEditForm.S_TitleChange(Sender: TObject);
begin
  JSON_Pars.S_title:= S_Title.Text;
end;

procedure TJSONEditForm.ComboBox5Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TJSONEditForm.ComboBox6Change(Sender: TObject);
var
  J:TJPegImage;
  B:TBitmap;
  ST:TStringList;
begin
  try
      set_editcomp(combobox6.itemIndex,memo2);
      try
        //if image1.Visible then
          //image1.Visible := not true;
        if image2.Visible then
          image2.Visible := not true;
      except

      end;
      ST := TStringList.Create;

      setfilename(st,memo2);
      if st.Count > 0 then begin
        try
          //showmessage(st[0]);
          //showmessage(ansitoutf8(st[0]));
          //showmessage(utf8toansi(st[0]));
          //showmessage(utf8decode(st[0]));

          memo2.Lines.LoadFromFile((st[0]));
          //memo2.Text:= (memo2.Text);
        except end;
        //memo2.Font.Name := st[1];
        //memo2.ReadOnly:= not true;
        //showmessage(st[0]+st[1]+st[2]);
        //memo2.Font.Size := strtoint(st[2]);
      end;
      memo2.Visible := true;
      Label5.Visible:= true;
   //   showmessage(JSONEditForm.memo2.Font.Name);
     // showmessage(JSONEditForm.Label5.Font.Name);

      Label5.Font := memo2.Font;
     // Label5.Font.Size := memo2.Font.Size;
     //  Label5.Font.Style := memo2.Font.Style;
      //JSONEditForm.Label5.AutoSize:= false;
      //JSONEditForm.Label5.WordWrap:=true;
      Label5.Caption:= memo2.Text;

    except

    end;

  st.Free;
end;

procedure TJSONEditForm.FormCreate(Sender: TObject);
begin
  with json_pars do begin
    set_JsonTitle.Create;
    set_JsonData.Clear;
    get_sw := false;
    JSON_output.Clear;
    JSON_start.Clear;
    st_temp.Clear;
    S_PD.Clear;
    P_Name.Clear;
    st_i_short.Clear;
    st_i_long.Clear;
    example_st.Clear;
    enum_st.Clear;
    set_comp_name.Clear;
    set_caption.Clear;

    json_s_count :=0;
    obj_sw_count := 0;
    htmobj_count := 0;
  end;
    //createmeomo;
  dwncount := 0;
  comp := TCompList.Create;
  comp.clear;
  QrComp := TCompList.Create;
  QrComp.clear;
  S_JSON1 := TStringList.Create;
  S_JSON1.Clear;
  J_V_OP := TStringList.Create;
  J_V_OP.Clear;
  setMeisiSize;
  setSizeCombo;
  JSON_Pars.S_title:= S_Title.Text;
  //JSONEditForm.setcompIMG := Timage.Create(JSONEditForm);
  with setcompIMG do begin
    parent := MeisiForm;
    visible := true;
  end;
  setMoveCompSet(
    50,
    50,
    50,
    50
  );
  crentdir := ExtractFilePath( Paramstr(0) );
  SearchDir := ExtractFilePath( Paramstr(0) );
  EnumFileFromDir(SearchDir);
  Priset1;


end;

procedure TJSONEditForm.ListBox1DblClick(Sender: TObject);
var
  s,s1:string;
  i:integer;
begin
  if ListBox1.ItemIndex = -1 then
    exit;
  ComboBox6.Items.Clear;
  resetcomp;
  panel1.Visible:= true;
  GroupBox4.Visible:= true;
  MeisiForm.Visible := true;
  loadfile := ansitoutf8(ExtractFilePath( Paramstr(0) )) + listbox1.Items[listbox1.itemindex] +'\Meisi.mpr';
   setprjdir := ansitoutf8(ExtractFilePath( Paramstr(0) )) + listbox1.Items[listbox1.itemindex] + '\';
   s := setprjdir;
     s1 := '';
     for i := 0 to length(s)-1 do begin
       s1 := s1 + s[i]
     end;
     //showmessage(s1);
    s := ExtractFileExt(s1);

   MeisiForm.Width:= 500;
   MeisiForm.Height:=480;

   //JSONEditForm.Image1.Picture.Clear;
   Image2.Picture.Clear;
   memo2.Lines.Clear;
   label5.Caption:= '';
   setMeisiSize;
   setdir := {ExtractFilePath( Paramstr(0) ) +} listbox1.Items[listbox1.itemindex] + '\';
   loadSeting(loadfile);
   //view_meisi();
  //showmessage('aaa');
end;

procedure TJSONEditForm.memo1Change(Sender: TObject);
var
  i:integer;
  cmpmemo:TComponent;
begin
  //ここに、メモ保存処理を記述する。
  for i := 0 to comp.Count -1 do begin
    if sender = comp.Items[i] then begin
      //cmpmemo := FindComponent('m' + inttostr(i));

      create_memo( setprjdir + inttostr(i),i,compset,TLabel.Create(JSONEditForm),true);
    end;
  end;
end;

procedure TJSONEditForm.ComboBox1Change(Sender: TObject);
begin

end;

procedure TJSONEditForm.GroupBox1Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.GroupBox2Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.GroupBox3Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.GroupBox4Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.GroupBox5Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.GroupBox6Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Image1Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to comp.Count -1 do begin
    if comp[i] = sender then begin
      ComboBox6.ItemIndex:= i;
      Memo2.Visible:=false;
      ComboBox6Change(JSONEditForm.ComboBox6);

    end;
  end;

end;

procedure TJSONEditForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TJSONEditForm.Image2Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Image2DblClick(Sender: TObject);
begin
  Button6Click(Sender);
end;

procedure TJSONEditForm.Label5Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to comp.Count -1 do begin
    if comp[i] = sender then begin
      ComboBox6.ItemIndex:= i;
      Memo2.Visible:=false;
      ComboBox6Change(ComboBox6);
    end;
  end;
end;

procedure TJSONEditForm.Label5DblClick(Sender: TObject);
begin
  Memo2.Text := Label5.Caption;
  Memo2.Font := Label5.Font;
  Memo2.Visible := true;


end;



procedure TJSONEditForm.ListBox1Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.MeisiPIcClick(Sender: TObject);
begin

end;



procedure TJSONEditForm.Button9Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button1Click(Sender: TObject);
var
  s1,s2,s3,s4,s5:string;
begin
    Button12Click(Sender);
    loadSeting(loadfile);
    interface_unit.new();
    //Schema
      s1 := '"$schema": "'+S_Var.Text+'",' + chr(13);
      s2 := '"id": "'+S_ID.Text+'",' + chr(13);
      s3 := '"title": "'+S_Title.Text+'",' + chr(13);
      s4 := '"description": "'+ S_description.Text +'",' + chr(13);
      s5 := '"type": "object"' + chr(13);
      if not S_Var_Check.Checked then
        s1 := '';
      if not S_title_Check.Checked then
        s2 := '';
      if not S_ID_Check.Checked then
        s3 := '';
      if not S_discription_Check.Checked then
        s4 := '';

      json_pars.JSON_start.Clear;
       //showmessage(function_unit.type_editbox.Text);

    begin
         function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
          s1 := '"$schema": "'+S_Var.Text+'",' + chr(13);
          s2 := '"id": "'+S_ID.Text+'",' + chr(13);
          s3 := '"title": "'+S_Title.Text+'",' + chr(13);
          s4 := '"description": "'+ S_description.Text +'",' + chr(13);
          s5 := '"type": "object"' + chr(13);
         //json_pars.JSON_start.Add( '');
         function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
         //function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add('var Schema = ');
         function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text :=
          function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text + (
          '{' + chr(13)
          +  s1
          +  s2
          +  s3
          +  s4
          +  s5
         );
         function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text :=
          function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text +
          load_setJSON(loadfile) +  char(13) + '}' ;
       end;
    //else begin
        //json_pars.JSON_start.Add( 'function onButtonClick() {' );
        //json_pars.JSON_start.Add( 'var ' + S_Title.Text+' = {};' );
     //   json_pars.JSON_start.Add( '$scope.'+S_Title.Text+' = {};');
        //json_pars.JSON_start.Add( '');
     //   function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
        //function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add('var Schema = ');
     //   function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text :=
     //     function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text + (
     //     '{' + chr(13)
     //     +  s1
     //     +  s2
     //     +  s3
     //     +  s4
     //     +  s5
         // + '{'
     //     + function_unit.type_editbox.Text
    //      +  char(13) + '}'
    //      );
    //  end;


    //showmessage(function_unit.type_editbox.Text);
      //type_editbox := '},"required": [';
    function_unit.editlist.Items[main.PageControl1.ActivePageIndex].save_complate := false;
    function_unit.editlist.Items[function_unit.TabpageNo].SaveDialog1.DefaultExt:= '.json';
    try
      interface_unit.saveas(main.PageControl1.ActivePageIndex);
    except

    end;
    schemafile := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].filename_path;
    JSON_pars.st_temp.Text:=function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text;



    Json_pars.JSONfile:= function_unit.editlist.Items[main.PageControl1.ActivePageIndex].filename_path;
    Json_pars.get_sw := true;
    //Json_pars.OpenFile(Json_pars.JSONfile);//JSONファイルを保存してからパースする。そこから、値をとっておく。
    Json_pars.get_sw := false;
    json_pars.OpenFile(schemafile);

end;

procedure TJSONEditForm.Button11Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.alpacaClick(Sender: TObject);
    var
      s1,s2,s3,s4,s5:string;
    begin

        interface_unit.new();
        //Schema
          {s1 := '"$schema": "'+S_Var.Text+'",' + chr(13);
          s2 := '"id": "'+S_ID.Text+'",' + chr(13);
          s3 := '"title": "'+S_Title.Text+'",' + chr(13);
          s4 := '"description": "'+ S_description.Text +'",' + chr(13);
          s5 := '"type": "object"' + chr(13);
          if not S_Var_Check.Checked then
            s1 := '';
          if not S_title_Check.Checked then
            s2 := '';
          if not S_ID_Check.Checked then
            s3 := '';
          if not S_discription_Check.Checked then
            s4 := '';}

         begin
            function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
             s1 := '"$schema": "'+S_Var.Text+'",' + chr(13);
             s2 := '"id": "'+S_ID.Text+'",' + chr(13);
             s3 := '"title": "'+S_Title.Text+'",' + chr(13);
             s4 := '"description": "'+ S_description.Text +'",' + chr(13);
             s5 := '"type": "object"' + chr(13);
            //json_pars.JSON_start.Add( '');
            function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
            //function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add('var Schema = ');
            function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text :=
             function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text + (
             '{' + chr(13)
             +  s1
             +  s2
             +  s3
             +  s4
             +  s5
            );
            function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text :=
             function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text +
             load_setJSON(loadfile) +  char(13) + '}' ;
          end;
           showmessage(
            function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text
           );

          //json_pars.JSON_start.Clear;

          //json_pars.JSON_start.Add( 'function onButtonClick() {' );
          //json_pars.JSON_start.Add( 'var ' + S_Title.Text+' = {};' );
         // json_pars.JSON_start.Add( '$scope.'+S_Title.Text+' = {};');
          //json_pars.JSON_start.Add( '');
         // function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
          //function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add('var Schema = ');
         // function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text :=
         //   function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text + (
         //   '{' + chr(13)
         //   +  s1
         //   +  s2
         //   +  s3
         //   +  s4
         //   +  s5
           // + '{'
         //   + function_unit.type_editbox.Text
         //   +  char(13) + '}'
         //   );
        //showmessage(function_unit.type_editbox.Text);
          //type_editbox := '},"required": [';
    function_unit.editlist.Items[main.PageControl1.ActivePageIndex].save_complate := false;
    function_unit.editlist.Items[function_unit.TabpageNo].SaveDialog1.DefaultExt:= '.json';
    try
      interface_unit.saveas(main.PageControl1.ActivePageIndex);
    except

    end;
    schemafile := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].filename_path;
    JSON_pars.st_temp.Text:=function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text;



    Json_pars.JSONfile:= function_unit.editlist.Items[main.PageControl1.ActivePageIndex].filename_path;
    Json_pars.get_sw := true;
    //Json_pars.OpenFile(Json_pars.JSONfile);//JSONファイルを保存してからパースする。そこから、値をとっておく。
    Json_pars.get_sw := false;
        json_pars.Openalpaca(schemafile);

end;

procedure TJSONEditForm.Button13Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button14Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button15Click(Sender: TObject);
var
  s:string;
  i:integer;
  f : TJsonForm2;
begin
  //JSON_pars.S_PD.add( 'edits' );
  f := TJsonForm2.Create(function_unit);f.item_st.Clear;
      f.item_st.Add(setprjdir);
      f.item_st.Add(combobox2.Text);
      f.item_st.Add(combobox3.Text);
      f.item_st.Add(combobox4.Text);
      f.item_st.Add(combobox5.Text);

  f.ShowModal;
  //showmessage(f.comp_type);
  //f.comp_type:= extractfiledir(f.comp_type);
  //showmessage(f.comp_type);
  JSON_pars.S_PD.add( f.comp_type );
  if S_JSON1.Text <> '' then
      S_JSON1.Text:= S_JSON1.Text + ',';
    S_JSON1.Text:= S_JSON1.Text + f.S_JSON2.Text;
  //json_pars.JSON_output.Add( '$scope.' + S_Title.Text + '.'+ JSON_pars.P_Name[JSON_pars.P_Name.Count-1] + ' = ""'{' = $scope.' + S_Title.Text + '.' + JSON_pars.P_Name});
  Memo2.Text:=f.Memo1.Text;
  if J_V_OP.Text <> '' then begin
    J_V_OP.Text := J_V_OP.Text + ',';
  end;
  J_V_OP.Text:= J_V_OP.Text + f.S_JSON3.Text;

    function_unit.type_editbox.Text :=
      function_unit.type_editbox.Text + char(13) + f.P_type.Text+ char(13);
    //showmessage(f.obj_item.Text);
    //showmessage(f.P_type.Text);
  for i := 0 to f.obj_item.count -1 do begin
    s := f.obj_item[i];
              select_comp(
              json_pars.json_s[i],
              s,
              setprjdir + inttostr(i) + '.' + f.obj_item[i],
              strtoint(combobox2.Text),
              strtoint(combobox3.Text),
              strtoint(combobox4.Text),
              strtoint(combobox5.Text));

    ComboBox6.ItemIndex := ComboBox6.Items.Count -1;
    ComboBox6Change(Sender);

  end;
  f.Free;
end;

procedure TJSONEditForm.Button16Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button17Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button18Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button19Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.Button3Click(Sender: TObject);
var
  s1:string;
begin
  resetcomp;
  panel1.Visible:= true;
  GroupBox4.Visible:= true;
  MeisiForm.Visible := true;
  if -1 = ListBox1.Items.IndexOf(edit1.Text) then begin
    s1 := ansitoutf8(ExtractFilePath( Paramstr(0) )) + edit1.Text + '.Meisi';
    CreateDirUTF8((s1));{ *Converted from CreateDir* }
    MeisiForm.Width:= 347;
    MeisiForm.Height:=208;
    setMeisiSize;
    setprjdir := (s1 + '\');
    setdir := ExtractFileName( s1 ) + '\';
    SearchDir := ansitoutf8(ExtractFilePath( Paramstr(0) ));
    listbox1.Items.Clear;
    EnumFileFromDir(SearchDir);
    comp.Free;
    comp := TcompList.Create;
    comp.Clear;
    qrcomp.Free;
    qrcomp := TcompList.Create;
    qrcomp.Clear;
    saveseting(utf8toansi(JSONEditForm.setprjdir + 'Meisi.mpr'))
  end;
end;

procedure TJSONEditForm.Button4Click(Sender: TObject);
begin

end;

procedure TJSONEditForm.ButtonschemaClick(Sender: TObject);
begin

end;

procedure TJSONEditForm.print2Click(Sender: TObject);
begin

end;

function TJSONEditForm.resetprot:boolean;
var
  i:integer;
begin
 with JSONEditForm do begin

  for i := 0 to 30 do begin
    qrimg[i].free;
    QRLabel[i].free;
    QRMemo[i].free;
    QRImg2[i].free;
  end;
 end;
end;




procedure TJSONEditForm.setCompIMGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //if ( Y > 12 ) and ( X > 4 ) then begin
    setCompIMG.ShowHint := true;
    if ( X > setcompimg.width -15 ) and ( Y > setcompimg.Height -25 ) then begin
      waku_sizeY_sw := true;
      waku_sizeX_sw := true;
    end else if X > setcompimg.width -15 then begin
      waku_sizeY_sw := true;
    end else if Y > setcompimg.Height -25 then begin
      waku_sizeX_sw := true;
    end;
    {waku_move_sw := true;
    ptY := Y;
    ptX := X;}
  //end
end;

procedure TJSONEditForm.setCompIMGMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  setX,setY:integer;
begin
  if waku_sizeY_sw then begin
    setCompIMG.Hint := 'SizeX:' + inttostr(setCompIMG.Width) + ' SizeY:' + inttostr(setCompIMG.Height);
    if setCompIMG.Width > 20 then begin
      with setCompIMG do begin
        setX :=  X;
        width := setX
      end;
      with waku do begin
        setX :=  X -10;
        width := setX
      end;
      TrackBar4.Position := setX;
      ComboBox5.Text := inttostr(setX);
      UpDown4.Position := setX;
      if setCompIMG.Width < 20 then begin
        setCompIMG.Width := 30;
        waku.Width:= 20;
        TrackBar4.Position := 30;
        ComboBox5.Text := inttostr(30);
        UpDown4.Position := 30
      end;
    end else begin
     setCompIMG.Width := 30;
     waku.Width:= 20;
     TrackBar4.Position := 30;
     ComboBox5.Text := inttostr(30);
     UpDown4.Position := 30
    end;
  end;
  if waku_sizeX_sw then begin
    if setCompIMG.Height > 20 then begin
      with setCompIMG do begin
        setY :=  Y;
        Height := setY
      end;
      with waku do begin
        setY := Y-10;
        Height := setY
      end;
      TrackBar3.Position := setY;
      ComboBox4.Text := inttostr(setY);
      UpDown3.Position := setY;
      if setCompIMG.Height < 20 then begin
        setCompIMG.Height := 30;
        waku.Height:= 20;
        TrackBar3.Position := 30;
        ComboBox4.Text := inttostr(30);
        UpDown3.Position := 30
      end;
    end else begin
     setCompIMG.Height := 30;
     waku.Height:= 20;
     TrackBar3.Position := 30;
     ComboBox4.Text := inttostr(30);
     UpDown3.Position := 30
    end;
  end;
end;

procedure TJSONEditForm.setCompIMGMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  waku_sizeY_sw := not true;
  waku_sizeX_sw := not true;
  changtrackbar;
  setCompIMG.ShowHint := not true;
end;

procedure TJSONEditForm.TrackBar1Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TJSONEditForm.TrackBar2Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TJSONEditForm.TrackBar3Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TJSONEditForm.TrackBar4Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TJSONEditForm.UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TJSONEditForm.UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TJSONEditForm.UpDown3Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TJSONEditForm.UpDown4Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TJSONEditForm.wakuMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  waku_move_sw := true;
  waku.ShowHint := true;
  ptY := Y;
  ptX := X;
end;

procedure TJSONEditForm.wakuMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  setx,sety:integer;
begin
  if waku_move_sw then begin
    waku.Hint := 'X:' + inttostr(waku.Top) + ' Y:' + inttostr(waku.Left);
    with setCompIMG do begin
      setY := top + Y - ptY ;//JSONEditForm.SpinEdit1.Value;
      setX := left + x - ptX ;//JSONEditForm.SpinEdit2.Value;
      top := setY;
      left := setX;
    end;
    TrackBar1.Position := setY;
    TrackBar2.Position := setX;
    ComboBox2.Text := inttostr(setY);
    ComboBox3.Text := inttostr(setX);
    UpDown1.Position := setY;
    UpDown2.Position := setX;
  end;
end;

procedure TJSONEditForm.wakuMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  waku_move_sw := not true;
  waku.ShowHint := not true;
  changtrackbar;
end;

end.
