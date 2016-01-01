unit unit_edit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, SynMemo, IpHtml, Forms, Controls,
  Graphics, Dialogs, Menus, ComCtrls, StdCtrls;

type
  TUndo = class
    undo:string;
    x:longint;
    y:longint;
    start:integer;
    lenge:integer;
  end;

  TUndoList = class(TList)
  private
    function Get(Index: Integer): TUndo;
    procedure Put(Index: Integer; const Value: TUndo);
  public
    property Items[Index: Integer]: TUndo read Get write Put; default;
     destructor Destroy; override;
  end;
  { TEditform }

  TEditform = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    Memo1: TMemo;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SynEdit1: TSynEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    procedure ApplicationProperties1DropFiles(Sender: TObject;
      const FileNames: array of String);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: char);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1DropFiles(Sender: TObject; X, Y: integer; AFiles: TStrings
      );
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1KeyPress(Sender: TObject; var Key: char);
    procedure SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }

  public
    { public declarations }
    Edit:TstringList;
    filename_path:string;
    save_complate:boolean;
    nameing_complate:boolean;
    char_sets:string;
    UndoList:TUndoList;
    Undo_count:integer;
    HelpLine:string;
    edittype:string;
    Json_write:TStringList;
    editCaretY,editCaretX:integer;
  end;

var
  Editform: TEditform;


implementation

uses mainform,interfaceunit;

{$R *.lfm}

{ TEditform }

function TUndoList.Get(Index: Integer): TUndo;
begin
  Result :=  TUndo( inherited Get(Index) );
end;

procedure TUndoList.Put(Index: Integer; const Value: TUndo);
begin
  inherited Put( Index, Value );
end;

destructor TUndoList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;
procedure TEditform.MenuItem2Click(Sender: TObject);
begin
  edit.Clear;
   SynEdit1.ClearAll;
   Memo1.Clear;

end;

procedure TEditform.MenuItem4Click(Sender: TObject);
begin
  if not  OpenDialog1.Execute then
    exit;
  edit.LoadFromFile( OpenDialog1.FileName);
   SynEdit1.Lines.Text:= edit.Text;
   Memo1.Lines.Text:= edit.Text;
end;

procedure TEditform.MenuItem6Click(Sender: TObject);
begin
  if SaveDialog1.FileName <> '' then begin
    edit.SaveToFile(savedialog1.FileName);
  end;
end;

procedure TEditform.MenuItem7Click(Sender: TObject);
begin
  if not savedialog1.Execute then
    exit;
  edit.SaveToFile(savedialog1.FileName);
end;

procedure TEditform.MenuItem8Click(Sender: TObject);
begin
   Close;
end;

procedure TEditform.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage =  TabSheet1 then begin
    SynEdit1.Lines.Text := edit.Text;
  end else if PageControl1.ActivePage = TabSheet2 then begin
    Memo1.Lines.Text:= edit.Text;
  end;
end;

procedure TEditform.PageControl1Changing(Sender: TObject; var AllowChange: Boolean
  );
begin
  if PageControl1.ActivePage = TabSheet1 then begin
    edit.Text:= SynEdit1.Lines.Text;
  end else if PageControl1.ActivePage = TabSheet2 then begin
    edit.Text:= Memo1.Lines.Text;
  end;

end;

procedure TEditform.SynEdit1Change(Sender: TObject);
begin
  save_complate := false;
end;

procedure TEditform.SynEdit1DropFiles(Sender: TObject; X, Y: integer;
  AFiles: TStrings);
begin

end;

procedure TEditform.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  editCaretY := synEdit1.BlockBegin.y;
  editCaretX := synEdit1.BlockBegin.x;
end;

procedure TEditform.SynEdit1KeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TEditform.SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  editCaretY := synEdit1.BlockBegin.y;
  editCaretX := synEdit1.BlockBegin.x;

end;

procedure TEditform.FormCreate(Sender: TObject);
begin
  nameing_complate := false;
  save_complate := true;
  Edit := TStringList.Create;
  Json_write := TStringList.Create;
  Json_write.Clear;
  Edit.Clear;
  PageControl1.PageIndex:= 0;
  undo_count := 0;
  UndoList := TUndoList.Create;
  UndoList.Clear;
  UndoList.Add(UndoList);
  UndoList.Items[undo_count] := TUndo.Create;
  UndoList.Items[undo_count].undo:=char(0);
  UndoList.Items[undo_count].x:=0;
  UndoList.Items[undo_count].y:=0;
  UndoList.Items[undo_count].lenge:=0;

end;

procedure TEditform.ApplicationProperties1DropFiles(Sender: TObject;
  const FileNames: array of String);
begin

end;

procedure TEditform.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
begin

end;

procedure TEditform.Memo1Change(Sender: TObject);
begin
  save_complate := false;
end;

procedure TEditform.Memo1KeyPress(Sender: TObject; var Key: char);
begin
  save_complate := false;
end;

procedure TEditform.MenuItem10Click(Sender: TObject);
begin
   Close;
end;

procedure TEditform.MenuItem12Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.CaretX:= UndoList.Items[undo_count-1].x;
     SynEdit1.CaretY:= UndoList.Items[undo_count-1].y;
     //SynEdit1.BlockBegin.x:=SynEdit1.CaretX;
     //SynEdit1.BlockBegin.y:=SynEdit1.CaretY;
     SynEdit1.SelEnd:= UndoList.Items[undo_count-1].lenge;
     SynEdit1.SelText:= UndoList.Items[undo_count -1].undo;
     dec(undo_count);

  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.Undo;
  end;
end;

procedure TEditform.MenuItem13Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.Redo;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.Undo;
  end;
end;

procedure TEditform.MenuItem15Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.CutToClipboard;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.CutToClipboard;
  end;
end;

procedure TEditform.MenuItem16Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.CopyToClipboard;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.CopyToClipboard;
  end;
end;

procedure TEditform.MenuItem17Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.PasteFromClipboard;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.PasteFromClipboard;
  end;
end;

end.

