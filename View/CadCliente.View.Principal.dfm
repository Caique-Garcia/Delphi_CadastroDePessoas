object formPrincipal: TformPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 507
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 667
    Height = 265
    Align = alTop
    Caption = 'Pesquisa'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 72
      Width = 617
      Height = 177
      DataSource = DM.dsPessoa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object editNomePesquisa: TEdit
      Left = 24
      Top = 45
      Width = 371
      Height = 21
      TabOrder = 1
    end
    object btnPesquisar: TButton
      Left = 401
      Top = 45
      Width = 113
      Height = 21
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object btnImprimir: TButton
      Left = 520
      Top = 45
      Width = 121
      Height = 21
      Caption = 'Imprimir'
      TabOrder = 3
      OnClick = btnImprimirClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 265
    Width = 667
    Height = 242
    Align = alBottom
    Caption = 'Cadastro'
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 27
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 25
      Top = 70
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label4: TLabel
      Left = 240
      Top = 70
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label5: TLabel
      Left = 23
      Top = 116
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label6: TLabel
      Left = 191
      Top = 113
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label7: TLabel
      Left = 23
      Top = 158
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label8: TLabel
      Left = 175
      Top = 158
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label9: TLabel
      Left = 350
      Top = 27
      Width = 44
      Height = 13
      Caption = 'Profiss'#227'o'
    end
    object lblCod: TLabel
      Left = 320
      Top = 192
      Width = 6
      Height = 13
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object editNome: TEdit
      Left = 23
      Top = 41
      Width = 314
      Height = 21
      TabOrder = 0
    end
    object editEndereco: TEdit
      Left = 24
      Top = 86
      Width = 210
      Height = 21
      TabOrder = 1
    end
    object editNumero: TEdit
      Left = 240
      Top = 86
      Width = 97
      Height = 21
      TabOrder = 2
    end
    object editBairro: TEdit
      Left = 23
      Top = 131
      Width = 162
      Height = 21
      TabOrder = 3
    end
    object editCidade: TEdit
      Left = 23
      Top = 174
      Width = 146
      Height = 21
      TabOrder = 4
    end
    object editUf: TEdit
      Left = 175
      Top = 177
      Width = 59
      Height = 21
      MaxLength = 2
      TabOrder = 5
    end
    object GroupBox3: TGroupBox
      Left = 350
      Top = 80
      Width = 153
      Height = 73
      Caption = 'Sexo'
      TabOrder = 6
      object rdMasculino: TRadioButton
        Left = 16
        Top = 16
        Width = 113
        Height = 17
        Caption = 'Masculino'
        TabOrder = 0
      end
      object rdFeminino: TRadioButton
        Left = 16
        Top = 39
        Width = 113
        Height = 17
        Caption = 'Feminino'
        TabOrder = 1
      end
    end
    object editCep: TMaskEdit
      Left = 191
      Top = 131
      Width = 145
      Height = 21
      EditMask = '##.###-###;1;_'
      MaxLength = 10
      TabOrder = 7
      Text = '  .   -   '
    end
    object btnNovo: TButton
      Left = 535
      Top = 27
      Width = 106
      Height = 46
      Caption = 'Novo'
      TabOrder = 8
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 535
      Top = 79
      Width = 106
      Height = 46
      Caption = 'Salvar'
      TabOrder = 9
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 535
      Top = 131
      Width = 106
      Height = 46
      Caption = 'Cancelar'
      TabOrder = 10
      OnClick = btnCancelarClick
    end
    object btnDeletar: TButton
      Left = 535
      Top = 183
      Width = 106
      Height = 46
      Caption = 'Deletar'
      TabOrder = 11
      OnClick = btnDeletarClick
    end
    object cbProfissao: TDBLookupComboBox
      Left = 350
      Top = 40
      Width = 153
      Height = 21
      DataField = 'profissao'
      DataSource = DM.dsPessoaProf
      KeyField = 'id'
      ListField = 'nomeProfissao'
      ListSource = DM.dsProfissoes
      TabOrder = 12
    end
    object btnImprimirDados: TButton
      Left = 397
      Top = 183
      Width = 106
      Height = 46
      Caption = 'Imprimir Dados'
      TabOrder = 13
      OnClick = btnImprimirDadosClick
    end
  end
end
