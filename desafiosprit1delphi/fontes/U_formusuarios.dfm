object Formusuarios: TFormusuarios
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rios'
  ClientHeight = 486
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Desafio: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 73
    Align = alTop
    Caption = 'Desafio'
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 73
    Width = 762
    Height = 200
    Align = alTop
    Caption = ' Dados do Usu'#225'rio '
    TabOrder = 1
    object Label1: TLabel
      Left = 95
      Top = 35
      Width = 36
      Height = 15
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 95
      Top = 64
      Width = 37
      Height = 15
      Caption = 'E-mail:'
    end
    object Label3: TLabel
      Left = 96
      Top = 93
      Width = 35
      Height = 15
      Caption = 'Senha:'
    end
    object Label4: TLabel
      Left = 102
      Top = 122
      Width = 29
      Height = 15
      Caption = 'Fone:'
    end
    object ednome: TEdit
      Left = 136
      Top = 32
      Width = 473
      Height = 23
      TabOrder = 0
    end
    object edemail: TEdit
      Left = 136
      Top = 61
      Width = 473
      Height = 23
      CharCase = ecLowerCase
      TabOrder = 1
    end
    object edsenha: TEdit
      Left = 136
      Top = 90
      Width = 129
      Height = 23
      PasswordChar = '*'
      TabOrder = 2
    end
    object edfone: TEdit
      Left = 136
      Top = 119
      Width = 129
      Height = 23
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 352
      Top = 169
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 271
      Top = 90
      Width = 98
      Height = 25
      Caption = 'Mostrar Senha'
      TabOrder = 5
      OnClick = BitBtn3Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 273
    Width = 762
    Height = 120
    Align = alTop
    DataSource = dsusuarios
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'NOME'
        Width = 406
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Title.Caption = 'PHONE'
        Width = 161
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 393
    Width = 762
    Height = 93
    Align = alClient
    TabOrder = 3
    object BitBtn2: TBitBtn
      Left = 624
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
  end
  object dsusuarios: TDataSource
    DataSet = DM.FDQconsulta
    Left = 520
    Top = 225
  end
end