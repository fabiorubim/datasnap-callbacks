program SimpleCallbacksServer;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormServerUnit in 'FormServerUnit.pas' {FormServer},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas',
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormServer, FormServer);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

