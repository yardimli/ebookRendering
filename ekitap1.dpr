program ekitap1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  debug_unit in 'debug_unit.pas' {Debug_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDebug_Form, Debug_Form);
  Application.Run;
end.
