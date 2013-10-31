unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FFPBox, FastStrings, FastStringFuncs, ExtCtrls, ExtDlgs,
  StdCtrls,JPEG, cxColorComboBox, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxFontNameComboBox, RxCombos,
  JvComponent, JvgFixFont, cxSpinEdit;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    FlickerFreePaintBox1: TFlickerFreePaintBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    cxColorComboBox1: TcxColorComboBox;
    Label1: TLabel;
    Button2: TButton;
    Memo1: TMemo;
    FontComboBox1: TFontComboBox;
    cxSpinEdit1: TcxSpinEdit;
    charSpacing: TcxSpinEdit;
    wordspacing: TcxSpinEdit;
    linespacing: TcxSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    HeaderY: TcxSpinEdit;
    TopY: TcxSpinEdit;
    LeftX: TcxSpinEdit;
    RightX: TcxSpinEdit;
    BottomX: TcxSpinEdit;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FlickerFreePaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure Button1Click(Sender: TObject);
    procedure cxColorComboBox1PropertiesChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FontComboBox1Change(Sender: TObject);
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    zeminBMP : TBitmap;
    zeminDosya : String;
    procedure WordOut(ACanvas:TCanvas; X,Y : Integer; aWord : String; letterSpace:Integer);
    procedure kitapDiz;
  end;

var
  Form1: TForm1;
  KitapArray : Array[1..10000] of record
                                   satir : string;
                                  end;
  maxSatir : Integer;
  WordWidth : Integer;


  Sayfalar : Array[1..100] of record
                               SayfaYapi : Array[1..500] of Record Yapi:string; xPos,yPos,Genislik,Derinlik : Integer; italicVar,bitisik : Boolean; end;
                               MaxYapi   : Integer;
                              end;
  maxSayfa : Integer;




implementation

uses debug_unit;
{$R *.dfm}


Function BuyukHarf(S:String):String;
var
 i,j,k:Integer;
begin
 for i := 1 to length(S) do
 begin
  if s[i]='ý' then s[i] := 'I' else
  if s[i]='i' then s[i] := 'Ý' else
  if s[i]='ð' then s[i] := 'Ð' else
  if s[i]='þ' then s[i] := 'þ' else
  if s[i]='ç' then s[i] := 'Ç' else
  if s[i]='ö' then s[i] := 'Ö' else
  if s[i]='ü' then s[i] := 'Ü' else s[i] := upcase(s[i]);
 end;
 BuyukHarf := S;
end;

Function Onceki(S:String; X:Integer) : Char;
begin
 Inc(X);
 Repeat
  Dec(X);
 until (S[X]<>'+') or (X=1);
 Onceki := S[X];
end;

Function Sonraki(S:String; X:Integer) : Char;
begin
 Dec(X);
 Repeat
  Inc(X);
 until (S[X]<>'+') or (X=Length(S));
 Sonraki := S[X];
end;


function hecele(giris : String) : String;
var
 i,j,k,l,m,n : Integer;
 s1,s2,s3,s  : String;
 Sesli,Sessiz: Set Of Char;
 BasBosluk   : Integer;
 SS          : Array[0..255] of char;
 Kodlar      : array[1..100] of record ch :char; p:byte; end;
 MaxKod      : Integer;
 Ch          : Char;
 Gercek,Gorsel: Integer;
begin

 Sesli := ['A','E','Ý','I','O','Ö','U','Ü','ý','ö','ü'];
 Sessiz:= ['B','C','Ç','D','F','G','Ð','H','J','K','L','M',
	   'N','P','R','S','Þ','T','V','Y','Z','þ','ð','ç'{,''''}];

 S := ' '+Giris+' ';


 MaxKod := 0;

 I := 0;
 if S<>'' then
 Repeat
  Inc(I);
  Ch := S[I];
  if Ch='<' then
  begin
   Inc(MaxKod);
   Kodlar[MaxKod].CH := S[I];
   Kodlar[MaxKod].P  := I;
   S[I] := '+';
   Repeat
    Inc(I);

    Inc(MaxKod);
    Kodlar[MaxKod].CH := S[I];
    Kodlar[MaxKod].P  := I;
    S[I] := '+';
   Until (Kodlar[MaxKod].CH='>') or (I=Length(S));
  end else

  if (UpCase(Ch) in Sesli) or ( UpCase(Ch) in Sessiz) or (ch=' ') then else
  begin
   Inc(MaxKod);
   Kodlar[MaxKod].CH := S[I];
   Kodlar[MaxKod].P  := I;
   S[I] := '+';
  end;
 Until I>=Length(S);

 Repeat
  I := Pos('+',S);
  if I<>0 then delete(S,I,1);
 until I=0;

 begin
  I:=0;
  Repeat
   Inc(I);
   if (UpCase(S[I])   in  Sesli) and (UpCase(S[I+1]) in Sessiz) and
      (UpCase(S[I+2]) in  Sesli) and
      (Onceki(S,I-1)<>' ') then Insert('&shy;',S,I+1);

   if (UpCase(S[I]) in Sessiz ) and (UpCase(S[I+1]) in Sessiz) and
      ((UpCase(S[I+2]) in Sesli) or (Sonraki(S,I+2)=' ')) and
      (Onceki(S,I-1)<>' ') and
      (Sonraki(S,I+2)<>' ') then Insert('&shy;',S,I+1);

   if (UpCase(S[I]) in Sesli) and (UpCase(S[I+1]) in Sesli) and
      (Onceki(S,I-1)<>' ') and
      (Sonraki(S,I+2)<>' ') and
      ( (Sonraki(S,I+2) in Sesli) or (Sonraki(S,I+2) in Sessiz)) then Insert('&shy;',S,I+1);
  Until I>=Length(S);

  (* iki harften sonra bölmeyi engelle *)
//  if Pos('&shy;',S)=4 then Delete(S,4,5);
  (* +++++++++++++++++++++++++++++++++ *)

  (* tek harften sonra bölmeyi engelle *)
  if Pos('&shy;',S)=3 then Delete(S,3,5);
  (* +++++++++++++++++++++++++++++++++ *)
 end;



 if MaxKod>0 then
 begin
  Gercek := 0;
  Gorsel := 0;
  K := 1;
  Repeat
   Inc(Gercek);
   Inc(Gorsel);

   if (Gorsel = Kodlar[K].P) and (K<=MaxKod) then
   begin
    Insert(Kodlar[K].Ch,S,Gercek);
    Inc(K);
   end else
   if ((S[Gercek]='&') and (S[Gercek+1]='s') and (S[Gercek+2]='h') and (S[Gercek+3]='y') and (S[Gercek+4]=';') ) and (Gercek+4<Length(S))  then
   begin
    Inc(Gercek,4);
    Dec(Gorsel);
   end;
  Until (Gercek>=Length(S));
 end;

 s := fastreplace(s,'&shy;','_');

{ ******* Týrnaktan önceki bölmeleri engelle ********

 if (Pos('\rquote',S)<>0) or (Pos('\rdblquote',S)<>0) then
 begin
  repeat
   i := Pos('&shy;',S);
   if I<>0 then Delete(S,i,3);
  Until I=0;
  I := pos('\rquote',S);
  J := pos('\rdblquote',S);

  if (I<>0) then
  begin
   Insert('&shy;',S,I+length('\rquote')+1);
  end;

  if (J<>0) then
  begin
   Insert('&shy;',S,I+length('\rdblquote')+1);
  end;
 end;
 * * * * * * * * * * * * * * * * * * * * * * * * * * * *

}

 Hecele := Copy(S,2,Length(S)-2);
end;

//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------
type
  TKerningpairarray = array[0..600] of Kerningpair;

var
  kpa: TKerningpairarray;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, Num: Integer;
begin
  FlickerFreePaintBox1.canvas.Font.Assign(Label1.Font);
  Num := GetKerningPairs(FlickerFreePaintBox1.canvas.Handle , 600, kpa);
  for i := 0 to num-1 do
  begin
   memo1.Lines.add(chr(kpa[i].wFirst)+' '+chr(kpa[i].wSecond)+' '+inttostr(kpa[i].iKernAmount) );
  end;
   // use the array
end;

procedure TForm1.WordOut(ACanvas:TCanvas; X,Y : Integer; aWord : String; letterSpace:Integer);
var
 i,j,x2:integer;
 ABC : TABC;
begin
 wordWidth := 0;
 if aWord<>'' then
 begin
  x2 := 0;
  for i := 1 to length(aWord) do
  begin
   GetCharABCWidths( ACanvas.Handle , Ord(aWord[i]), Ord(aWord[i]), ABC);
   ACanvas.TextOut(X+x2,Y,aWord[i]);
   x2 := x2 + ABC.abcA;
   x2 := x2 + ABC.abcB;
   x2 := x2 + ABC.abcC;
   x2 := x2 + letterSpace;
  end;
 end;
 wordWidth := x2;
end;

function xWordWidth(ACanvas:TCanvas; aWord : String; letterSpace:Integer) : integer;
var
 i,j,x2:integer;
 ABC : TABC;
begin
 result := 0;
 if aWord<>'' then
 begin
  x2 := 0;
  for i := 1 to length(aWord) do
  begin
   GetCharABCWidths( ACanvas.Handle , Ord(aWord[i]), Ord(aWord[i]), ABC);
//   ACanvas.TextOut(X+x2,Y,aWord[i]);
   x2 := x2 + ABC.abcA;
   x2 := x2 + ABC.abcB;
   x2 := x2 + ABC.abcC;
   x2 := x2 + letterSpace;
  end;
 end;
 result := x2;
end;

procedure SetAntiAliasedCanvasFont(Canvas: TCanvas);
var  LogFont:       TLogFont;
     dwHeight:      Integer;
     hdcDesk:       HDC;
begin
  // Check canvas font handle
  if (GetObject(Canvas.Font.Handle, SizeOf(LogFont), @LogFont) = 0) then
  begin
     // Get desktop canvas
     hdcDesk:=GetDC(0);
     // Resource protection
     try
        // Get height for font
        dwHeight:=MulDiv(Canvas.Font.Size * -1, GetDeviceCaps(hdcDesk, LOGPIXELSY), 72);
        // Update font
        Canvas.Font.Handle:=CreateFont(dwHeight, 0, 0, 0, FW_BOLD, 0, 0, 0, ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, ANTIALIASED_QUALITY, DEFAULT_PITCH, PChar(Canvas.Font.Name));
     finally
        // Release the canvas handle
        ReleaseDC(0, hdcDesk);
     end;
  end
  else
  begin
     // Update the log font with the desired attributes
     LogFont.lfOutPrecision:=OUT_DEFAULT_PRECIS;
     LogFont.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
     LogFont.lfQuality:=5; //ANTIALIASED_QUALITY;
     // Update font
     Canvas.Font.Handle:=CreateFontIndirect(LogFont);
  end;
end;

//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
var
 t,t1,t2:TextFile;
 i,j,k,l:integer;
 s,s1,s2:String;
 charWidths: array[#32..#255] of integer;
// MType : Cardinal;
begin
// MType := FE_FONTSMOOTHINGCLEARTYPE;
// SystemParametersInfo(spi_SetFontSmoothingType, 0, Pointer(MType), spif_UpdateINIFile or spif_SendChange);
DesktopFont := TRUE;

 AssignFile(t,'testkitap.dat');
 reset(t);
 maxSatir := 0;
 repeat
  readln(t,s);
  inc(MaxSatir);
  KitapArray[MaxSatir].satir := s;
 until eof(t);
 closefile(t);
 FontComboBox1.FontName := 'Garamond';
 zeminBMP  := TBitmap.Create;
 zeminDosya := '';

// GetOutlineTextMetrics()

 GetCharWidth32(handle,32,255, charWidths[#32]);
end;

procedure TForm1.KitapDiz;
Var
 say,i,j,k        : integer;
 s,s1,s2,s3,s4,s5 : String;
 XPos,YPos        : Integer;
 EGenislik,E_Derinlik : Integer;

 KomutSatiri : Boolean;
 ParagrafTur : Integer;
 italicVar   : Boolean;
 kodVar      : Boolean;
 bitisik     : Boolean;

 lf: TLogFont;
 tmp : TBitmap;
 OrtalamaSatirYukseklik : Integer;

begin
 Tmp := TBitmap.Create;
 tmp.PixelFormat := pfDevice;
 Tmp.Width := FlickerFreePaintBox1.Width;
 tmp.Height := FlickerFreePaintBox1.Height;


 Tmp.Canvas.Pen.Color := RGB(255,255,255);
 Tmp.Canvas.Pen.Style := psSolid;
 Tmp.Canvas.Brush.Color := RGB(255,255,255);
 Tmp.Canvas.Brush.Style := bsSolid;

 Tmp.Canvas.Rectangle(0,0,FlickerFreePaintBox1.Width,FlickerFreePaintBox1.Height);

 tmp.Canvas.Font.Assign(Label1.Font);
 Tmp.Canvas.Font.Color := cxColorComboBox1.ColorValue;

 Tmp.Canvas.Brush.Style := bsClear;

 ParagrafTur := 0;
 italicVar   := FALSE;

 xPos      := LeftX.Value;
 yPos      := TopY.Value+HeaderY.Value;

 MaxSayfa := 0;

 repeat
  inc(maxSayfa);
  xPos      := LeftX.Value;
  yPos      := TopY.Value+HeaderY.Value;

  say        := 0;
  E_Derinlik := 0;
  OrtalamaSatirYukseklik := 25;

  Sayfalar[maxSayfa].MaxYapi := 0;

  Repeat
   inc(say);
   KomutSatiri := FALSE;
   s := trim(KitapArray[Say].satir);
   s := FastReplace(s,'  ',' ');
   s := FastReplace(s,'  ',' ');
   s := FastReplace(s,'  ',' ');

   if (s<>'') then
   begin
    if (s[1]='<') and (s[length(s)]='>') and(length(s)>=3) then
    begin
     if UpperCase(s) = '<CENTER>' then ParagrafTur := 1;
     if UpperCase(s) = '</CENTER>' then ParagrafTur := 0;
     if UpperCase(s) = '<LEFT>' then ParagrafTur := 0;
     if UpperCase(s) = '</LEFT>' then ParagrafTur := 0;
     if UpperCase(s) = '<RIGHT>' then ParagrafTur := 2;
     if UpperCase(s) = '</RIGHT>' then ParagrafTur := 0;
     KomutSatiri := TRUE;
    end;
   end;

   if (not KomutSatiri) and (s='') then
   begin
    inc(yPos,10);
   end else
   if (not KomutSatiri) and (s<>'') then
   begin
    s := fastReplace(s,'<',' <');
    s := fastReplace(s,'>','> ');
    inc(ypos,E_Derinlik+ integer(linespacing.value) );
    xpos    := LeftX.Value;

    E_Derinlik := 0;
    EGenislik := 0;
    s := s + ' ';
    repeat

     kodVar := FALSE;
     bitisik := FALSE;
     repeat
      s1 := copy(s,1,pos(' ',s)-1); delete(s,1,pos(' ',s));

      if s1 = '<I>' then begin italicVar := TRUE; dec(xPos,integer(wordspacing.value) ); bitisik := TRUE; end;
      if s1 = '</I>' then begin italicVar := FALSE; dec(xPos,integer(wordspacing.value)); bitisik := TRUE; end;
      if s1 = '' then begin inc(xPos,integer(wordspacing.value)); bitisik := FALSE; end; //ek boþluk anlamýna geliyor bu
     until (pos('<',s1)=0) and (s1<>'');

     if italicVar then Tmp.Canvas.Font.Style := [fsItalic] else Tmp.Canvas.Font.Style := [];

     if xPos + Tmp.Canvas.TextWidth(s1)+wordspacing.Value > Tmp.Width-(RightX.Value) then
     begin
      s2 := hecele(s1)+'_';
      s4 := '';

      i := 0;
      repeat
       s3 := copy(s2,1,pos('_',s2)-1);
       s4 := s4 + s3;
       delete(s2,1,pos('_',s2));
       inc(i);
      until (s2='') or (pos('_',s2)=0) or ( xpos + Tmp.canvas.TextWidth(s4+'-') > FlickerFreePaintBox1.Width-RightX.Value);

      if i>1 then //en az bir taký satýra gelebiliyor
      begin
       s2 := hecele(s1);
       s4 := '';
       for j := 1 to i-1 do
       begin
        s3 := copy(s2,1,pos('_',s2)-1);
        s4 := s4 + s3;
        delete(s2,1,pos('_',s2));
       end;
       s2 := fastreplace(s2,'_','');

       inc(Sayfalar[maxSayfa].MaxYapi);
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos     := xPos;
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].yPos     := yPos;
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik := xWordWidth(tmp.Canvas,s4+'-',charSpacing.Value ); // Tmp.Canvas.TextWidth(s4+'-');
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Derinlik := Tmp.Canvas.TextHeight(s4+'-');
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Yapi     := s4+'-';
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].italicVar:= italicVar;
       Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].bitisik  := bitisik;

       if E_Derinlik < Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Derinlik then
        E_Derinlik :=  Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Derinlik;
       s1 := s2;
      end;


      if (Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos + Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik < FlickerFreePaintBox1.Width-RightX.Value) and
         (ParagrafTur=0) then //sola dayamalý standart
      begin
       i := 1;
       repeat
        inc(i);

        repeat
         if Sayfalar[maxSayfa].SayfaYapi[i].bitisik then inc(i);
         if i>=Sayfalar[maxSayfa].MaxYapi then i := 2;
        until (not Sayfalar[maxSayfa].SayfaYapi[i].bitisik);

        for j := i to Sayfalar[maxSayfa].MaxYapi do Sayfalar[maxSayfa].SayfaYapi[j].xPos := Sayfalar[maxSayfa].SayfaYapi[j].xPos+1;

        if i>=Sayfalar[maxSayfa].MaxYapi then i := 2;
       until Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos + Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik >= Tmp.Width-RightX.Value;
      end else

      if ParagrafTur=1 then //ortalama
      begin
       i := (Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos+Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik);
       i := ( (Tmp.Width-(LeftX.Value+RightX.Value)) div 2) - ((i-LeftX.Value) div 2);
       For j := 1 to Sayfalar[maxSayfa].MaxYapi do Sayfalar[maxSayfa].SayfaYapi[j].xpos := Sayfalar[maxSayfa].SayfaYapi[j].xpos + i;
      end else

      if ParagrafTur=2 then //sað dayama
      begin
       i := (Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos+Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik);
       i := (Tmp.Width-RightX.Value) - i;
       For j := 1 to Sayfalar[maxSayfa].MaxYapi do Sayfalar[maxSayfa].SayfaYapi[j].xpos := Sayfalar[maxSayfa].SayfaYapi[j].xpos + i;
      end;

      inc(ypos,(E_Derinlik)+integer(linespacing.value));
      OrtalamaSatirYukseklik := E_Derinlik;
      xpos      := LeftX.Value;
      E_Derinlik := 0;
      EGenislik := 0;
      //MaxYapi := 0;
     end;

     inc(Sayfalar[maxSayfa].MaxYapi);
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos     := xPos;
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].yPos     := yPos;
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik := xWordWidth(tmp.Canvas,s1,charSpacing.Value); //tmp.Canvas.TextWidth(s1);
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Derinlik := tmp.Canvas.TextHeight(s1);
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Yapi     := s1;
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].italicVar:= italicVar;
     Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].bitisik  := bitisik;

     if not kodVar then inc(xpos,Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik+integer(wordspacing.Value)) else
                        inc(xpos,Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik);

     if E_Derinlik < Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Derinlik then
       E_Derinlik := Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Derinlik;

    until (s='') or
          ( (Sayfalar[maxSayfa].MaxYapi=1) and ( (ypos+(OrtalamaSatirYukseklik)) > FlickerFreePaintBox1.Height) );


    if ParagrafTur=1 then //ortalama
    begin
     i := (Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos+Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik);
     i := ( (Tmp.Width-(LeftX.Value+RightX.Value)) div 2) - ((i-LeftX.Value) div 2);
     For j := 1 to Sayfalar[maxSayfa].MaxYapi do Sayfalar[maxSayfa].SayfaYapi[j].xpos := Sayfalar[maxSayfa].SayfaYapi[j].xpos + i;
    end else

    if ParagrafTur=2 then //sað dayama
    begin
     i := (Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].xPos+Sayfalar[maxSayfa].SayfaYapi[Sayfalar[maxSayfa].MaxYapi].Genislik);
     i := (Tmp.Width-RightX.Value) - i;
     For j := 1 to Sayfalar[maxSayfa].MaxYapi do Sayfalar[maxSayfa].SayfaYapi[j].xpos := Sayfalar[maxSayfa].SayfaYapi[j].xpos + i;
    end;

   end;

  until (ypos+(OrtalamaSatirYukseklik) > FlickerFreePaintBox1.Height);
 until (maxSayfa>10);

 tmp.Free;
end;

procedure SetFontAntiAliased(AFont: TFont; Aliased: boolean);
var
   lf: TLogFont;
begin
   // Need a display device context
   GetObject(AFont.Handle, SizeOf(TLogFont), @lf);

   if Aliased then
     lf.lfQuality := ANTIALIASED_QUALITY
   else
     lf.lfQuality := NONANTIALIASED_QUALITY;

   AFont.Handle := CreateFontIndirect(lf);
end;                                 

procedure TForm1.FlickerFreePaintBox1Paint(Sender: TObject;
  Canvas: TCanvas);
Var
 say,i,j,k        : integer;
 s,s1,s2,s3,s4,s5 : String;
 XPos,YPos        : Integer;
 EGenislik,E_Derinlik : Integer;
 SatirYapi : Array[1..260] of Record Yapi:string; xPos,yPos,Genislik,Derinlik : Integer; italicVar,bitisik : Boolean; end;
 MaxYapi   : Integer;
 KomutSatiri : Boolean;
 ParagrafTur : Integer;
 italicVar   : Boolean;
 kodVar      : Boolean;
 bitisik     : Boolean;

 lf: TLogFont;
 tmp : TBitmap;
 OrtalamaSatirYukseklik : Integer;
begin

 Tmp := TBitmap.Create;
 tmp.PixelFormat := pfDevice;
 Tmp.Width := FlickerFreePaintBox1.Width;
 tmp.Height := FlickerFreePaintBox1.Height;


 Tmp.Canvas.Pen.Color := RGB(255,255,255);
 Tmp.Canvas.Pen.Style := psSolid;
 Tmp.Canvas.Brush.Color := RGB(255,255,255);
 Tmp.Canvas.Brush.Style := bsSolid;

 Tmp.Canvas.Rectangle(0,0,FlickerFreePaintBox1.Width,FlickerFreePaintBox1.Height);
 FlickerFreePaintBox1.canvas.Font.Assign(Label1.Font);

 if zeminDosya <> '' then
 begin
  for i := 1 to (FlickerFreePaintBox1.Width div zeminBMP.Width)+1 do
   for j := 1 to (FlickerFreePaintBox1.Height div zeminBMP.Height)+1 do
    Tmp.Canvas.Draw((i-1)*zeminBMP.Width,(j-1)*zeminBMP.Height,zeminBMP);
 end;


(*
 Tmp.Canvas.Font.Name := cxFontNameComboBox1.FontName; // 'Garamond';
 Tmp.Canvas.Font.size := 21;
*)

 tmp.Canvas.Font.Assign(Label1.Font);
 Tmp.Canvas.Font.Color := cxColorComboBox1.ColorValue;

 Tmp.Canvas.Brush.Style := bsClear;


 ParagrafTur := 0;
 italicVar   := FALSE;

 xPos      := LeftX.Value;
 yPos      := TopY.Value+HeaderY.Value;
 tmp.Canvas.Pen.Color := 0;
 tmp.Canvas.MoveTo(LeftX.Value ,ypos);
 tmp.Canvas.LineTo(tmp.Width-RightX.Value ,ypos);

 SetAntiAliasedCanvasFont(Tmp.canvas);
 WordOut(tmp.Canvas,xpos,ypos-22,'Zaman Makinesi',charSpacing.Value);

 say       := 0;
 E_Derinlik := 0;
 OrtalamaSatirYukseklik := 25;
 Repeat
  inc(say);
  KomutSatiri := FALSE;
  s := trim(KitapArray[Say].satir);
  s := FastReplace(s,'  ',' ');
  s := FastReplace(s,'  ',' ');
  s := FastReplace(s,'  ',' ');


  if (s<>'') then
  begin
   if (s[1]='<') and (s[length(s)]='>') and(length(s)>=3) then
   begin
    if UpperCase(s) = '<CENTER>' then ParagrafTur := 1;
    if UpperCase(s) = '</CENTER>' then ParagrafTur := 0;
    if UpperCase(s) = '<LEFT>' then ParagrafTur := 0;
    if UpperCase(s) = '</LEFT>' then ParagrafTur := 0;
    if UpperCase(s) = '<RIGHT>' then ParagrafTur := 2;
    if UpperCase(s) = '</RIGHT>' then ParagrafTur := 0;
    KomutSatiri := TRUE;
   end;
  end;


  if (not KomutSatiri) and (s='') then
  begin
   inc(yPos,10);
  end else
  if (not KomutSatiri) and (s<>'') then
  begin
   s := fastReplace(s,'<',' <');
   s := fastReplace(s,'>','> ');
   inc(ypos,E_Derinlik+ integer(linespacing.value) );
   xpos    := LeftX.Value;
   MaxYapi := 0;

   E_Derinlik := 0;
   EGenislik := 0;
   s := s + ' ';
   repeat

    kodVar := FALSE;
    bitisik := FALSE;
    repeat
     s1 := copy(s,1,pos(' ',s)-1); delete(s,1,pos(' ',s));

     if s1 = '<I>' then begin italicVar := TRUE; dec(xPos,integer(wordspacing.value) ); bitisik := TRUE; end;
     if s1 = '</I>' then begin italicVar := FALSE; dec(xPos,integer(wordspacing.value)); bitisik := TRUE; end;
     if s1 = '' then begin inc(xPos,integer(wordspacing.value)); bitisik := FALSE; end; //ek boþluk anlamýna geliyor bu   "adam <I>bir</I> gün"
    until (pos('<',s1)=0) and (s1<>'');

    if italicVar then Tmp.Canvas.Font.Style := [fsItalic] else Tmp.Canvas.Font.Style := [];

    if xPos + Tmp.Canvas.TextWidth(s1)+wordspacing.Value > Tmp.Width-(RightX.Value) then
    begin

     if not bitisik then
     begin
      s2 := hecele(s1)+'_';
      s4 := '';

      i := 0;
      repeat
       s3 := copy(s2,1,pos('_',s2)-1);
       s4 := s4 + s3;
       delete(s2,1,pos('_',s2));
       inc(i);
      until (s2='') or (pos('_',s2)=0) or ( xpos + Tmp.canvas.TextWidth(s4+'-') > FlickerFreePaintBox1.Width-RightX.Value);

      if i>1 then //en az bir taký satýra gelebiliyor
      begin
       s2 := hecele(s1);
       s4 := '';
       for j := 1 to i-1 do
       begin
        s3 := copy(s2,1,pos('_',s2)-1);
        s4 := s4 + s3;
        delete(s2,1,pos('_',s2));
       end;
       s2 := fastreplace(s2,'_','');

       inc(MaxYapi);
       SatirYapi[MaxYapi].xPos     := xPos;
       SatirYapi[MaxYapi].yPos     := yPos;
       SatirYapi[MaxYapi].Genislik := xWordWidth(tmp.Canvas,s4+'-',charSpacing.Value ); // Tmp.Canvas.TextWidth(s4+'-');
       SatirYapi[MaxYapi].Derinlik := Tmp.Canvas.TextHeight(s4+'-');
       SatirYapi[MaxYapi].Yapi     := s4+'-';
       SatirYapi[MaxYapi].italicVar:= italicVar;
       SatirYapi[MaxYapi].bitisik  := bitisik;
       if E_Derinlik < SatirYapi[MaxYapi].Derinlik then E_Derinlik := SatirYapi[MaxYapi].Derinlik;
       s1 := s2;
      end;
     end;

     if (SatirYapi[MaxYapi].xPos + SatirYapi[MaxYapi].Genislik < FlickerFreePaintBox1.Width-RightX.Value) and (ParagrafTur=0) then //sola dayamalý standart
     begin
      i := 1;
      repeat
       inc(i);

       repeat
        if satirYapi[i].bitisik then inc(i);
        if i>=MaxYapi then i := 2;
       until (not satirYapi[i].bitisik);

       for j := i to MaxYapi do
       begin
        //if (j=i) and (not satirYapi[j].bitisik) then
        SatirYapi[j].xPos := SatirYapi[j].xPos+1;
       end;

       if i>=MaxYapi then i := 2;
      until SatirYapi[MaxYapi].xPos + SatirYapi[MaxYapi].Genislik >= Tmp.Width-RightX.Value;
     end else

     if ParagrafTur=1 then //ortalama
     begin
      i := (satirYapi[MaxYapi].xPos+SatirYapi[MaxYapi].Genislik);
      i := ( (Tmp.Width-(LeftX.Value+RightX.Value)) div 2) - ((i-LeftX.Value) div 2);
      For j := 1 to MaxYapi do
      begin
       SatirYapi[j].xpos := SatirYapi[j].xpos + i;
      end;
     end else

     if ParagrafTur=2 then //sað dayama
     begin
      i := (satirYapi[MaxYapi].xPos+SatirYapi[MaxYapi].Genislik);
      i := (Tmp.Width-RightX.Value) - i;
      For j := 1 to MaxYapi do
      begin
       SatirYapi[j].xpos := SatirYapi[j].xpos + i;
      end;
     end;

     For I := 1 to MaxYapi do
     begin
      if SatirYapi[i].italicVar then Tmp.Canvas.Font.Style := [fsItalic] else Tmp.Canvas.Font.Style := [];
      if SatirYapi[i].bitisik then Tmp.Canvas.Font.Style := Tmp.Canvas.Font.Style+[fsUnderline];
//      SetFontAntiAliased(tmp.Canvas.Font,true);
      SetAntiAliasedCanvasFont(Tmp.canvas);
//      Tmp.Canvas.TextOut(SatirYapi[i].xpos,SatirYapi[i].ypos+E_Derinlik+2,SatirYapi[i].Yapi);
       WordOut(tmp.Canvas,SatirYapi[i].xpos,SatirYapi[i].ypos,SatirYapi[i].Yapi,charSpacing.Value);
     end;

     inc(ypos,(E_Derinlik)+integer(linespacing.value));
     OrtalamaSatirYukseklik := E_Derinlik;
     xpos      := LeftX.Value;
     E_Derinlik := 0;
     EGenislik := 0;
     MaxYapi := 0;
    end;

    inc(MaxYapi);
    SatirYapi[MaxYapi].xPos     := xPos;
    SatirYapi[MaxYapi].yPos     := yPos;
    SatirYapi[MaxYapi].Genislik := xWordWidth(tmp.Canvas,s1,charSpacing.Value); //tmp.Canvas.TextWidth(s1);
    SatirYapi[MaxYapi].Derinlik := tmp.Canvas.TextHeight(s1);
    SatirYapi[MaxYapi].Yapi     := s1;
    SatirYapi[MaxYapi].italicVar:= italicVar;
    SatirYapi[MaxYapi].bitisik  := bitisik;

//  Canvas.TextOut(xpos,ypos,s1);
    if not kodVar then inc(xpos,SatirYapi[MaxYapi].Genislik+integer(wordspacing.Value)) else inc(xpos,SatirYapi[MaxYapi].Genislik);
    if E_Derinlik < SatirYapi[MaxYapi].Derinlik then E_Derinlik := SatirYapi[MaxYapi].Derinlik;
   until (s='') or
   ( (MaxYapi=1) and ( (ypos+(OrtalamaSatirYukseklik)) > FlickerFreePaintBox1.Height) );

   if ParagrafTur=1 then //ortalama
   begin
    i := (satirYapi[MaxYapi].xPos+SatirYapi[MaxYapi].Genislik);
    i := ( (Tmp.Width-(LeftX.Value+RightX.Value)) div 2) - ((i-LeftX.Value) div 2);
    For j := 1 to MaxYapi do
    begin
     SatirYapi[j].xpos := SatirYapi[j].xpos + i;
    end;
   end else

   if ParagrafTur=2 then //sað dayama
   begin
    i := (satirYapi[MaxYapi].xPos+SatirYapi[MaxYapi].Genislik);
    i := (Tmp.Width-RightX.Value) - i;
    For j := 1 to MaxYapi do
    begin
     SatirYapi[j].xpos := SatirYapi[j].xpos + i;
    end;
   end;

   if ( (MaxYapi=1) and ( (ypos+(OrtalamaSatirYukseklik)) > FlickerFreePaintBox1.Height) ) then
   begin
     //bu sözcük bir sonraki sayfanýnýn ilki olmalý
   end else
   if MaxYapi>0 then
    For I := 1 to MaxYapi do
    begin
     if SatirYapi[i].italicVar then Tmp.Canvas.Font.Style := [fsItalic] else Tmp.Canvas.Font.Style := [];
     SetAntiAliasedCanvasFont(Tmp.canvas);
//     Tmp.Canvas.TextOut(SatirYapi[i].xpos,SatirYapi[i].ypos+22,SatirYapi[i].Yapi);
     WordOut(tmp.Canvas,SatirYapi[i].xpos,SatirYapi[i].ypos,SatirYapi[i].Yapi,charSpacing.Value);
    end;
  end;

 until (ypos+(OrtalamaSatirYukseklik) > FlickerFreePaintBox1.Height);

 Canvas.Draw(0,0,tmp);
 tmp.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 imagefile : TPicture;
begin

 OpenPictureDialog1.InitialDir := ExtractFilePath(Application.ExeName)+'zeminler';
 if OpenPictureDialog1.Execute then
 begin
  imagefile :=TPicture.Create;
  imagefile.LoadFromFile(OpenPictureDialog1.FileName);

  zeminDosya := OpenPictureDialog1.FileName;

  zeminBMP.Assign(imagefile.Graphic);
  zeminBMP.Width := imagefile.Width;
  zeminBMP.Height := imagefile.Height;


  imagefile.Free;

  FlickerFreePaintBox1.Refresh;
 end;
end;

procedure TForm1.cxColorComboBox1PropertiesChange(Sender: TObject);
begin
 FlickerFreePaintBox1.Refresh;
end;

procedure TForm1.FontComboBox1Change(Sender: TObject);             
var
  i, Num: Integer;
begin
 label1.Font.Name := FontComboBox1.FontName;
 label1.Font.Size := cxSpinEdit1.Value;
 FlickerFreePaintBox1.canvas.Font.Assign(Label1.Font);
 FlickerFreePaintBox1.canvas.Font.Style := [fsitalic];
(*
 memo1.lines.clear;
 Num := GetKerningPairs(FlickerFreePaintBox1.canvas.Handle , 600, kpa);
 for i := 0 to num-1 do
 begin
  memo1.Lines.add(chr(kpa[i].wFirst)+' '+chr(kpa[i].wSecond)+' '+inttostr(kpa[i].iKernAmount) );
 end;

 memo1.Lines.add('---------' );
 FlickerFreePaintBox1.canvas.Font.Assign(Label1.Font);

 Num := GetKerningPairs(FlickerFreePaintBox1.canvas.Handle , 600, kpa);
 for i := 0 to num-1 do
 begin
  memo1.Lines.add(chr(kpa[i].wFirst)+' '+chr(kpa[i].wSecond)+' '+inttostr(kpa[i].iKernAmount) );
 end;
 *)
 FlickerFreePaintBox1.Refresh;
end;

procedure TForm1.cxSpinEdit1PropertiesChange(Sender: TObject);
begin
 FontComboBox1Change(Sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i,j,k,l:integer;
begin
 kitapDiz;
 debug_form.show;
 for i:= 1 to maxSayfa do
 begin
  for j := 1 to Sayfalar[i].MaxYapi do
  begin
   Debug_Form.Memo1.Lines.Add( sayfalar[i].SayfaYapi[j].Yapi);
  end;
 end;
end;

end.


(*
-textrect ile çiz
-margin ayarlamalarý yap
-tüm kitabý var olan ayarlarla açýlýþta diz (okurken dizme yapma)
-sayfa kesme kodu
-sayfa sayýsý
-önceki sonraki sayfa hareketi
-resim ekleme (sol, sað, orta)



http://groups.google.com/group/borland.public.delphi.nativeapi/browse_thread/thread/f13ab51310f8ca86/8e1a8ae943e77a6e?lnk=st&q=font+kerning+delphi&rnum=23&hl=en#8e1a8ae943e77a6evar
   N: DWord;
   KerningPairs: array of TKerningPair;
begin
   N := GetKerningPairs(DC, 0, PKerningPair(nil)^);
   if N = 0 then RaiseLastWin32Error;
   SetLength(KerningPairs, N);
   N := GetKerningPairs(DC, N, KerningPairs[0]);
   if N = 0 then RaiseLastWin32Error;
   // use the array
end;

--





*)
