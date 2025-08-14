object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Regex matcher'
  ClientHeight = 334
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MinHeight = 373
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    624
    334)
  TextHeight = 15
  object lbRegex: TLabel
    Left = 40
    Top = 13
    Width = 99
    Height = 15
    Caption = 'Regular expression'
  end
  object lbTestString: TLabel
    Left = 40
    Top = 59
    Width = 53
    Height = 15
    Caption = 'Test string'
  end
  object edRegex: TEdit
    Left = 40
    Top = 30
    Width = 537
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = edRegexChange
  end
  object edTestString: TRichEdit
    Left = 40
    Top = 80
    Width = 537
    Height = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = edTestStringChange
  end
end
