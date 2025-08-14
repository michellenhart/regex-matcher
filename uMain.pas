unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    edRegex: TEdit;
    lbRegex: TLabel;
    lbTestString: TLabel;
    edTestString: TRichEdit;
    procedure edRegexChange(Sender: TObject);
    procedure edTestStringChange(Sender: TObject);
  private
    procedure Match;
    function CountChar(const pText: String; const pChar: Char; const pPosIni: Integer): Integer;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.RegularExpressions;

function TfrmMain.CountChar(const pText: String; const pChar: Char; const pPosIni: Integer): Integer;
var
  wSubText: string;
  wPosIni: Integer;
begin
  wPosIni := pPosIni;
  if wPosIni < 1 then
    wPosIni := 1;

  wSubText := Copy(pText, 0, wPosIni);
  Result := Length(wSubText) - Length(StringReplace(wSubText, pChar, '', [rfReplaceAll]));
end;

procedure TfrmMain.edRegexChange(Sender: TObject);
begin
  Match;
end;

procedure TfrmMain.edTestStringChange(Sender: TObject);
begin
  Match;
end;

procedure TfrmMain.Match;
var
  Match: TMatch;
  CursorPos, PosIni: Integer;
  Str: String;
  Regex: TRegex;
begin
  CursorPos := edTestString.SelStart;
  edTestString.HideSelection := True;
  edTestString.SelectAll;
  edTestString.SelAttributes.Color := clBlack;

  try
    if edRegex.Text = '' then Exit;
    if edTestString.Text = '' then Exit;

    Regex := TRegEx.Create(edRegex.Text, [roIgnoreCase, roMultiLine]);

    Str := edTestString.Text;
    Match := Regex.Match(Str);
    while Match.Success do
    begin
      PosIni := Match.Index;
      PosIni := PosIni - CountChar(Str, #13, PosIni);
      edTestString.SelStart := PosIni - 1;
      edTestString.SelLength := Match.Length;
      edTestString.SelAttributes.Color := clRed;
      edTestString.SelAttributes.Style := [fsBold];

      Match := Match.NextMatch;
    end;
  finally
    edTestString.SelStart := CursorPos;
    edTestString.SelLength := 0;
    edTestString.HideSelection := False;
  end;
end;

end.
