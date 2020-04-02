program SimpleCallbacksClient;

uses
  Vcl.Forms,
  FormClientUnit in 'FormClientUnit.pas' {FormClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormClient, FormClient);
  Application.Run;
end.
