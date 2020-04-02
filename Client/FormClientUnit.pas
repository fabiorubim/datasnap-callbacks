//https://edn.embarcadero.com/article/41374

//http://docwiki.embarcadero.com/RADStudio/Seattle/en/Using_Callbacks

//http://docwiki.embarcadero.com/RADStudio/Seattle/en/REST_Heavyweight_Callbacks

//Outro exemplo: C:\Users\Public\Documents\Embarcadero\Studio\20.0\Samples\Object Pascal\DataSnap\LtWeightCallbacks

//http://www.youtube.com/watch?v=5zO3_g9Z-wc
//http://www.youtube.com/watch?v=geEzwg8XX8k
//http://www.youtube.com/watch?v=Hwode7a8O5k

//https://mathewdelong.wordpress.com/2011/05/30/heavyweight-callbacks/
//
//http://edn.embarcadero.com/article/41024
//http://edn.embarcadero.com/article/41025

unit FormClientUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  DBXJSON, Vcl.StdCtrls, Datasnap.DSCommon, Data.DB,
  Data.SqlExpr, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, System.JSON, Datasnap.DSSession;

type
 TMyCallback = class(TDBXCallback)
 public
    function Execute(const Arg: TJSONValue): TJSONValue; override;

 end;

  TFormClient = class(TForm)
    MemoLog: TMemo;
    DSClientCallbackChannelManager1: TDSClientCallbackChannelManager;
    SQLConnection1: TSQLConnection;
    ButtonBroadcast: TButton;
    EditMsg: TEdit;
    LabelMessage: TLabel;
    EditLocalClientId: TEdit;
    EditLocalCallbackId: TEdit;
    EditDestinationClientId: TEdit;
    EditDestinationCallbackId: TEdit;
    ButtonNotifyCallback: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonBroadcastClick(Sender: TObject);
    procedure ButtonNotifyCallbackClick(Sender: TObject);
  private
    { Private declarations }
    FCallbackName: string;
  public
    { Public declarations }
    procedure LogMsg(const s: string);
    procedure QueueLogMsg(const s: string);
  end;

var
  FormClient: TFormClient;

implementation

uses
  DSService, DSProxy;

{$R *.dfm}

{ TMyCallback }

function TMyCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  FormClient.QueueLogMsg(Arg.ToString);
  Result := TJSONTrue.Create;
end;

{ TFormClient }

procedure TFormClient.ButtonBroadcastClick(Sender: TObject);
var AClient: TDSAdminClient;
begin
  AClient := TDSAdminClient.Create(SQLConnection1.DBXConnection);
  try
    AClient.BroadcastToChannel(
      DSClientCallbackChannelManager1.ChannelName,
      TJSONString.Create(EditMsg.Text)
    );
  finally
    AClient.Free;
  end;
end;

procedure TFormClient.ButtonNotifyCallbackClick(Sender: TObject);
var AClient: TDSAdminClient; aResponse: TJSONValue;
begin
  AClient := TDSAdminClient.Create(SQLConnection1.DBXConnection);
  try
    AClient.NotifyCallback(
      DSClientCallbackChannelManager1.ChannelName,
      EditDestinationClientId.Text,
      EditDestinationCallbackId.Text,
      TJSONString.Create(EditMsg.Text),
      aResponse
    );
  finally
    AClient.Free;
  end;
end;

procedure TFormClient.FormCreate(Sender: TObject);
begin
  DSClientCallbackChannelManager1.ManagerId := TDSTunnelSession.GenerateSessionId;

  FCallbackName :=  TDSTunnelSession.GenerateSessionId;

  DSClientCallbackChannelManager1.RegisterCallback(FCallbackName, TMyCallback.Create);




  EditLocalClientId.Text := DSClientCallbackChannelManager1.ManagerId;
  EditLocalCallbackId.Text := FCallbackName;
  EditDestinationClientId.Text := '';
  EditDestinationCallbackId.Text := '';
end;

procedure TFormClient.LogMsg(const s: string);
begin
  MemoLog.Lines.Add(DateTimeToStr(Now) + ': ' + s);
end;

procedure TFormClient.QueueLogMsg(const s: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      LogMsg(s)
    end
  );
end;

end.
