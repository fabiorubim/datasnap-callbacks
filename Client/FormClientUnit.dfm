object FormClient: TFormClient
  Left = 0
  Top = 0
  Caption = 'FormClient'
  ClientHeight = 433
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelMessage: TLabel
    Left = 487
    Top = 37
    Width = 55
    Height = 13
    Caption = 'Mensagem:'
  end
  object Label1: TLabel
    Left = 487
    Top = 128
    Width = 68
    Height = 13
    Caption = 'Local Client ID'
  end
  object Label2: TLabel
    Left = 487
    Top = 184
    Width = 76
    Height = 13
    Caption = 'Local CallbackId'
  end
  object Label3: TLabel
    Left = 672
    Top = 128
    Width = 94
    Height = 13
    Caption = 'Destination ClientId'
  end
  object Label4: TLabel
    Left = 672
    Top = 184
    Width = 106
    Height = 13
    Caption = 'Destination CallBackId'
  end
  object MemoLog: TMemo
    Left = 8
    Top = 56
    Width = 473
    Height = 313
    TabOrder = 0
  end
  object ButtonBroadcast: TButton
    Left = 487
    Top = 96
    Width = 161
    Height = 25
    Caption = 'Broadcast to Channel'
    TabOrder = 1
    OnClick = ButtonBroadcastClick
  end
  object EditMsg: TEdit
    Left = 487
    Top = 56
    Width = 338
    Height = 21
    TabOrder = 2
  end
  object EditLocalClientId: TEdit
    Left = 487
    Top = 147
    Width = 180
    Height = 21
    TabOrder = 3
  end
  object EditLocalCallbackId: TEdit
    Left = 487
    Top = 203
    Width = 180
    Height = 21
    TabOrder = 4
  end
  object EditDestinationClientId: TEdit
    Left = 672
    Top = 147
    Width = 180
    Height = 21
    TabOrder = 5
  end
  object EditDestinationCallbackId: TEdit
    Left = 672
    Top = 203
    Width = 180
    Height = 21
    TabOrder = 6
  end
  object ButtonNotifyCallback: TButton
    Left = 487
    Top = 248
    Width = 140
    Height = 25
    Caption = 'Notify Callback'
    TabOrder = 7
    OnClick = ButtonNotifyCallbackClick
  end
  object DSClientCallbackChannelManager1: TDSClientCallbackChannelManager
    DSHostname = '127.0.0.1'
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'DelphiLabsChannel'
    Left = 280
    Top = 8
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Connected = True
    Left = 152
    Top = 16
  end
end
