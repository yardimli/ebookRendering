object Form1: TForm1
  Left = 328
  Top = 74
  Width = 456
  Height = 684
  Caption = 'izlenim Ekitap'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 13
    Width = 448
    Height = 486
    Align = alClient
    BorderWidth = 5
    TabOrder = 0
    object FlickerFreePaintBox1: TFlickerFreePaintBox
      Left = 6
      Top = 6
      Width = 436
      Height = 474
      OnPaint = FlickerFreePaintBox1Paint
      Align = alClient
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 13
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 499
    Width = 448
    Height = 151
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 90
      Width = 44
      Height = 26
      Caption = 'insan'
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Palatino Linotype'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 244
      Top = 126
      Width = 33
      Height = 13
      Caption = 'Bottom'
    end
    object Label3: TLabel
      Left = 343
      Top = 46
      Width = 50
      Height = 13
      Caption = 'Chr Space'
    end
    object Label4: TLabel
      Left = 334
      Top = 66
      Width = 60
      Height = 13
      Caption = 'Word Space'
    end
    object Label5: TLabel
      Left = 339
      Top = 87
      Width = 54
      Height = 13
      Caption = 'Line Space'
    end
    object Label6: TLabel
      Left = 243
      Top = 46
      Width = 35
      Height = 13
      Caption = 'Header'
    end
    object Label7: TLabel
      Left = 258
      Top = 68
      Width = 19
      Height = 13
      Caption = 'Top'
    end
    object Label8: TLabel
      Left = 258
      Top = 87
      Width = 18
      Height = 13
      Caption = 'Left'
    end
    object Label9: TLabel
      Left = 252
      Top = 108
      Width = 25
      Height = 13
      Caption = 'Right'
    end
    object Button1: TButton
      Left = 6
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Zemin'
      TabOrder = 0
      OnClick = Button1Click
    end
    object cxColorComboBox1: TcxColorComboBox
      Left = 273
      Top = 12
      Width = 76
      Height = 21
      Properties.DefaultColor = clBlack
      Properties.OnChange = cxColorComboBox1PropertiesChange
      Properties.Items = <>
      Properties.PrepareInfo = ''
      TabOrder = 1
    end
    object Button2: TButton
      Left = 6
      Top = 39
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Memo1: TMemo
      Left = 87
      Top = 39
      Width = 148
      Height = 89
      Lines.Strings = (
        'Memo1')
      TabOrder = 3
    end
    object FontComboBox1: TFontComboBox
      Left = 87
      Top = 12
      Width = 184
      Height = 20
      TabOrder = 4
      OnChange = FontComboBox1Change
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 354
      Top = 12
      Width = 40
      Height = 21
      Properties.MaxValue = 120.000000000000000000
      Properties.MinValue = 7.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 5
      Value = 14
    end
    object charSpacing: TcxSpinEdit
      Left = 396
      Top = 42
      Width = 40
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 50.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 6
    end
    object wordspacing: TcxSpinEdit
      Left = 396
      Top = 63
      Width = 40
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 50.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 7
      Value = 5
    end
    object linespacing: TcxSpinEdit
      Left = 396
      Top = 84
      Width = 40
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 50.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 8
      Value = 2
    end
    object HeaderY: TcxSpinEdit
      Left = 282
      Top = 42
      Width = 49
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 50.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 9
      Value = 30
    end
    object TopY: TcxSpinEdit
      Left = 282
      Top = 63
      Width = 49
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 50.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 10
      Value = 5
    end
    object LeftX: TcxSpinEdit
      Left = 282
      Top = 83
      Width = 49
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 200.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 11
      Value = 10
    end
    object RightX: TcxSpinEdit
      Left = 282
      Top = 103
      Width = 49
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 100.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 12
      Value = 10
    end
    object BottomX: TcxSpinEdit
      Left = 282
      Top = 123
      Width = 49
      Height = 21
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 50.000000000000000000
      Properties.OnChange = cxSpinEdit1PropertiesChange
      TabOrder = 13
      Value = 20
    end
    object Button3: TButton
      Left = 6
      Top = 67
      Width = 75
      Height = 25
      Caption = 'debug'
      TabOrder = 14
      OnClick = Button3Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 111
    Top = 549
  end
end
