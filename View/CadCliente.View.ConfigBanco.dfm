object formConfigBanco: TformConfigBanco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o de Banco de Dados'
  ClientHeight = 191
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 191
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 44
      Top = 55
      Width = 126
      Height = 13
      Caption = 'Nome do Banco de Dados:'
    end
    object Label2: TLabel
      Left = 142
      Top = 86
      Width = 28
      Height = 13
      Caption = 'Local:'
    end
    object editNomeBanco: TEdit
      Left = 176
      Top = 50
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object editLocal: TEdit
      Left = 176
      Top = 82
      Width = 169
      Height = 21
      TabOrder = 1
    end
    object btnSalvar: TButton
      Left = 24
      Top = 136
      Width = 321
      Height = 41
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
  end
end
