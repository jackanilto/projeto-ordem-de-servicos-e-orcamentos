object form_conexao: Tform_conexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 353
  Width = 588
  object FDConnection: TFDConnection
    ConnectionName = 'form_conexao.FDConnection'
    Params.Strings = (
      'Database=C:\SWH ORCAMENTOS\DADOS\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    Left = 144
    Top = 32
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 272
    Top = 32
  end
end
