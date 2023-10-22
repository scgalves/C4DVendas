object ModelConexaoDM: TModelConexaoDM
  Height = 97
  Width = 379
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 16
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=c4dvendas'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=192.168.0.103'
      'Port=3259'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Firebird\FB_2_5_9_27139_0_x86\bin\fbclient.dll'
    Left = 288
    Top = 16
  end
end
