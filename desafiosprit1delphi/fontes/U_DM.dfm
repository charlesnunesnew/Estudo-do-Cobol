object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conexao: TFDConnection
    Params.Strings = (
      'Database=\usuarios.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 168
    Top = 112
  end
  object fdqinsert: TFDQuery
    Connection = conexao
    Left = 304
    Top = 144
  end
  object FDQconsulta: TFDQuery
    Connection = conexao
    Left = 312
    Top = 232
  end
end
