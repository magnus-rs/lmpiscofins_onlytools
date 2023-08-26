object FRM_Energia_Lancamento: TFRM_Energia_Lancamento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Energia El'#233'trica - C500 - Lan'#231'amento do Rateio de Pis e Cofins'
  ClientHeight = 384
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 205
    Width = 68
    Height = 13
    Caption = 'Registro C500'
  end
  object Label4: TLabel
    Left = 8
    Top = 263
    Width = 94
    Height = 13
    Caption = 'Registro C501 - PIS'
  end
  object Label5: TLabel
    Left = 8
    Top = 320
    Width = 116
    Height = 13
    Caption = 'Registro C505 - COFINS'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 177
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 93
      Height = 13
      Caption = 'M'#234's de Refer'#234'ncia:'
    end
    object Label2: TLabel
      Left = 304
      Top = 14
      Width = 45
      Height = 13
      Caption = 'Empresa:'
    end
    object CB_MesRef: TComboBox
      Left = 107
      Top = 11
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      OnChange = CB_MesRefChange
    end
    object CB_Empresa: TComboBox
      Left = 355
      Top = 11
      Width = 382
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = CB_EmpresaChange
    end
    object BTN_Localizar: TButton
      Left = 192
      Top = 48
      Width = 385
      Height = 25
      Caption = 'Localizar'
      Enabled = False
      TabOrder = 2
      OnClick = BTN_LocalizarClick
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 80
      Width = 753
      Height = 57
      DataSource = DS_Energia
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ValorTotal'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Rateio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BaseCalculo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercentPis'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorPis'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercentCofins'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorCofins'
          Width = 100
          Visible = True
        end>
    end
  end
  object BTN_Sped: TButton
    Left = 82
    Top = 183
    Width = 201
    Height = 25
    Caption = 'Busca Registro no SPED'
    Enabled = False
    TabOrder = 1
    OnClick = BTN_SpedClick
  end
  object DGC500: TDBGrid
    Left = 8
    Top = 220
    Width = 765
    Height = 41
    DataSource = DS_C500
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DOC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_COFINS'
        Visible = True
      end>
  end
  object DGC501: TDBGrid
    Left = 8
    Top = 278
    Width = 765
    Height = 41
    DataSource = DS_C501
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_BC_PIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PIS'
        Width = 100
        Visible = True
      end>
  end
  object DGC505: TDBGrid
    Left = 8
    Top = 335
    Width = 765
    Height = 41
    DataSource = DS_C505
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_BC_COFINS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_COFINS'
        Visible = True
      end>
  end
  object BTN_Efetiva_Sped: TButton
    Left = 536
    Top = 183
    Width = 201
    Height = 25
    Caption = 'Efetivar Altera'#231#245'es no SPED'
    Enabled = False
    TabOrder = 5
    OnClick = BTN_Efetiva_SpedClick
  end
  object BTN_Atualiza_Calculos: TButton
    Left = 308
    Top = 183
    Width = 201
    Height = 25
    Caption = 'Atualizar os Dados de Rateio'
    Enabled = False
    TabOrder = 6
    OnClick = BTN_Atualiza_CalculosClick
  end
  object FDQ_MesRef: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from Planilhas')
    Left = 128
    object FDQ_MesRefChave: TFDAutoIncField
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQ_MesRefMes_Ref: TStringField
      FieldName = 'Mes_Ref'
      Origin = 'Mes_Ref'
      Required = True
      Size = 6
    end
  end
  object FDQ_Empresa: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from Estabelecimentos')
    Left = 576
    object FDQ_EmpresaChave: TFDAutoIncField
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQ_EmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 14
    end
    object FDQ_EmpresaRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Origin = 'Razao_Social'
      Required = True
      Size = 100
    end
    object FDQ_EmpresaDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 100
    end
  end
  object FDQ_Energia: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from energia')
    Left = 360
    Top = 88
    object FDQ_EnergiaChave: TFDAutoIncField
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQ_EnergiaidEstabelecimento: TIntegerField
      FieldName = 'idEstabelecimento'
      Origin = 'idEstabelecimento'
      Required = True
    end
    object FDQ_EnergiaidMesRef: TIntegerField
      FieldName = 'idMesRef'
      Origin = 'idMesRef'
      Required = True
    end
    object FDQ_EnergiaValorTotal: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_EnergiaRateio: TBCDField
      FieldName = 'Rateio'
      Required = True
      DisplayFormat = '% #0.00'
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_EnergiaBaseCalculo: TBCDField
      DisplayLabel = 'Base de C'#225'lculo'
      FieldName = 'BaseCalculo'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_EnergiaPercentPis: TFloatField
      DisplayLabel = 'Aliq. Pis'
      FieldName = 'PercentPis'
      Origin = 'PercentPis'
      Required = True
      DisplayFormat = '% #0.00'
    end
    object FDQ_EnergiaValorPis: TBCDField
      DisplayLabel = 'Valor de Pis'
      FieldName = 'ValorPis'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_EnergiaPercentCofins: TFloatField
      DisplayLabel = 'Aliq. Cofins'
      FieldName = 'PercentCofins'
      Origin = 'PercentCofins'
      Required = True
      DisplayFormat = '% #0.00'
    end
    object FDQ_EnergiaValorCofins: TBCDField
      DisplayLabel = 'Valor de Cofins'
      FieldName = 'ValorCofins'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object DS_Energia: TDataSource
    DataSet = FDQ_Energia
    Left = 456
    Top = 88
  end
  object CDS_C500: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 224
    object CDS_C500CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CDS_C500VL_DOC: TCurrencyField
      DisplayLabel = 'Valor do Documento'
      FieldName = 'VL_DOC'
    end
    object CDS_C500VL_PIS: TCurrencyField
      DisplayLabel = 'Valor de PIS'
      FieldName = 'VL_PIS'
    end
    object CDS_C500VL_COFINS: TCurrencyField
      DisplayLabel = 'Valor de COFINS'
      FieldName = 'VL_COFINS'
    end
  end
  object CDS_C501: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 280
    object CDS_C501CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CDS_C501VL_BC_PIS: TCurrencyField
      DisplayLabel = 'Base de C'#225'lculo do PIS'
      FieldName = 'VL_BC_PIS'
    end
    object CDS_C501VL_PIS: TCurrencyField
      DisplayLabel = 'Valor Total de PIS'
      FieldName = 'VL_PIS'
    end
  end
  object CDS_C505: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 336
    object CDS_C505CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object CDS_C505VL_BC_COFINS: TCurrencyField
      DisplayLabel = 'Base de C'#225'lculo de COFINS'
      FieldName = 'VL_BC_COFINS'
    end
    object CDS_C505VL_COFINS: TCurrencyField
      DisplayLabel = 'Valor Total de COFINS'
      FieldName = 'VL_COFINS'
    end
  end
  object DS_C500: TDataSource
    DataSet = CDS_C500
    Left = 216
    Top = 224
  end
  object DS_C501: TDataSource
    DataSet = CDS_C501
    Left = 216
    Top = 280
  end
  object DS_C505: TDataSource
    DataSet = CDS_C505
    Left = 216
    Top = 336
  end
end
