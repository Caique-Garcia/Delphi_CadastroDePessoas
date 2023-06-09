object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 422
  Width = 598
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=caiquedb'
      'User_Name=root'
      'Server=serv01'
      'Password=ever2008'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 112
  end
  object tbPessoa: TFDTable
    Active = True
    IndexFieldNames = 'cod'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'caiquedb.pessoa'
    Left = 216
    Top = 112
    object tbPessoacod: TFDAutoIncField
      FieldName = 'cod'
      Origin = 'cod'
      ReadOnly = True
    end
    object tbPessoanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object tbPessoaendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 40
    end
    object tbPessoanumero: TIntegerField
      FieldName = 'numero'
      Origin = 'numero'
    end
    object tbPessoabairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 30
    end
    object tbPessoacidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 30
    end
    object tbPessoacep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object tbPessoauf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object tbPessoaprofissao: TIntegerField
      FieldName = 'profissao'
      Origin = 'profissao'
    end
    object tbPessoasexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      Size = 12
    end
    object tbPessoaNomeProfissao: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProfissao'
      LookupDataSet = tbProfissoes
      LookupKeyFields = 'id'
      LookupResultField = 'nomeProfissao'
      KeyFields = 'profissao'
      Size = 30
      Lookup = True
    end
  end
  object tbProfissoes: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'caiquedb.profissoes'
    Left = 216
    Top = 168
    object tbProfissoesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object tbProfissoesnomeProfissao: TStringField
      FieldName = 'nomeProfissao'
      Origin = 'nomeProfissao'
      Required = True
      Size = 50
    end
  end
  object sqlConsulta: TFDQuery
    Active = True
    MasterFields = 
      'bairro;cep;cidade;cod;endereco;nome;NomeProfissao;numero;profiss' +
      'ao;sexo;uf'
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT cod as COD, nome as NOME, endereco as ENDERECO, numero as' +
        ' NUMERO,'
      
        ' bairro as BAIRRO, cidade as CIDADE, cep as CEP, uf as UF, sexo ' +
        'as SEXO, nomeProfissao as PROFISSAO'
      
        'FROM pessoa join profissoes WHERE profissao = profissoes.id ORDE' +
        'R BY COD')
    Left = 304
    Top = 112
  end
  object dsProfissoes: TDataSource
    DataSet = tbProfissoes
    Left = 216
    Top = 232
  end
  object dsPessoa: TDataSource
    DataSet = sqlConsulta
    Left = 376
    Top = 112
  end
  object frxReLCadastro: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45033.732789525460000000
    ReportOptions.LastChange = 45033.732941655090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 360
    Top = 304
    Datasets = <
      item
        DataSet = frxRelSQLConsulta
        DataSetName = 'dsSQLConsulta'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 1046.929133858268000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 51.841740547049310000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'COD')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 51.841740547049310000
          Width = 177.002065896185800000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 228.843806443235100000
          Width = 167.803208631904500000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'ENDERECO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 396.647015075139600000
          Width = 69.082411550130450000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'NUMERO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 465.729426625270000000
          Width = 124.528503464803000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'BAIRRO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 590.257930090073100000
          Width = 123.339491671487100000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'CIDADE')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 713.597421761560200000
          Width = 50.058222857075400000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 763.655644618635600000
          Width = 22.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 785.655644618635600000
          Width = 61.680199270443520000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'SEXO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 847.335843889079100000
          Width = 199.593289969188600000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'PROFISSAO')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 1046.929810000000000000
        DataSet = frxRelSQLConsulta
        DataSetName = 'dsSQLConsulta'
        RowCount = 0
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Width = 51.841740547049310000
          Height = 18.897650000000000000
          DataField = 'COD'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."COD"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 51.841740547049310000
          Width = 177.002065896185800000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."NOME"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 228.843806443235100000
          Width = 167.803208631904500000
          Height = 18.897650000000000000
          DataField = 'ENDERECO'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."ENDERECO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 396.647015075139600000
          Width = 69.082411550130450000
          Height = 18.897650000000000000
          DataField = 'NUMERO'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."NUMERO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 465.729426625270000000
          Width = 124.528503464803000000
          Height = 18.897650000000000000
          DataField = 'BAIRRO'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."BAIRRO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 590.257930090073100000
          Width = 123.339491671487100000
          Height = 18.897650000000000000
          DataField = 'CIDADE'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."CIDADE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 713.597421761560200000
          Width = 50.058222857075400000
          Height = 18.897650000000000000
          DataField = 'CEP'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."CEP"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 763.655644618635600000
          Width = 22.000000000000000000
          Height = 18.897650000000000000
          DataField = 'UF'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."UF"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 785.655644618635600000
          Width = 61.680199270443520000
          Height = 18.897650000000000000
          DataField = 'SEXO'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."SEXO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 847.335843889079100000
          Width = 199.593289969188600000
          Height = 18.897650000000000000
          DataField = 'PROFISSAO'
          DataSet = frxRelSQLConsulta
          DataSetName = 'dsSQLConsulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dsSQLConsulta."PROFISSAO"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 1046.929810000000000000
        object Memo23: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo25: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.339210000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object frxRelSQLConsulta: TfrxDBDataset
    UserName = 'dsSQLConsulta'
    CloseDataSource = False
    DataSet = sqlConsulta
    BCDToCurrency = False
    DataSetOptions = []
    Left = 360
    Top = 360
  end
  object sqlDadosPessoa: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT cod as COD, nome as NOME, endereco as ENDERECO, numero as' +
        ' NUMERO,'
      
        ' bairro as BAIRRO, cidade as CIDADE, cep as CEP, uf as UF, sexo ' +
        'as SEXO, nomeProfissao as PROFISSAO'
      'FROM pessoa join profissoes WHERE profissao = profissoes.id')
    Left = 304
    Top = 168
  end
  object frxDsDadosDaPessoa: TfrxDBDataset
    UserName = 'frxDsDadosDaPessoa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD=COD'
      'NOME=NOME'
      'ENDERECO=ENDERECO'
      'NUMERO=NUMERO'
      'BAIRRO=BAIRRO'
      'CIDADE=CIDADE'
      'CEP=CEP'
      'UF=UF'
      'SEXO=SEXO'
      'PROFISSAO=PROFISSAO')
    DataSet = sqlDadosPessoa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 472
    Top = 360
  end
  object frxRelDados: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45033.541125798600000000
    ReportOptions.LastChange = 45033.546788668980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 472
    Top = 304
    Datasets = <
      item
        DataSet = frxDsDadosDaPessoa
        DataSetName = 'frxDsDadosDaPessoa'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Dados do cliente: [frxDsDadosDaPessoa."NOME"]')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 207.874150000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        DataSet = frxDsDadosDaPessoa
        DataSetName = 'frxDsDadosDaPessoa'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'COD')
          ParentFont = False
          Style = 'Header'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'COD'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."COD"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'NOME')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 18.897650000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."NOME"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'ENDERECO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 37.795300000000000000
          Width = 298.000000000000000000
          Height = 18.897650000000000000
          DataField = 'ENDERECO'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."ENDERECO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'NUMERO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 56.692950000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."NUMERO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 75.590600000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'BAIRRO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 75.590600000000000000
          Width = 225.000000000000000000
          Height = 18.897650000000000000
          DataField = 'BAIRRO'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."BAIRRO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 94.488250000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'CIDADE')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 94.488250000000000000
          Width = 225.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CIDADE'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."CIDADE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 113.385900000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 113.385900000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CEP'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."CEP"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 132.283550000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          Style = 'Header'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 132.283550000000000000
          Width = 19.000000000000000000
          Height = 18.897650000000000000
          DataField = 'UF'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."UF"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Top = 151.181200000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'SEXO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 151.181200000000000000
          Width = 92.000000000000000000
          Height = 18.897650000000000000
          DataField = 'SEXO'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."SEXO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 170.078850000000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'PROFISSAO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 100.897650000000000000
          Top = 170.078850000000000000
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'PROFISSAO'
          DataSet = frxDsDadosDaPessoa
          DataSetName = 'frxDsDadosDaPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsDadosDaPessoa."PROFISSAO"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        object Memo22: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo24: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object dsPessoaProf: TDataSource
    DataSet = tbPessoa
    Left = 440
    Top = 112
  end
end
