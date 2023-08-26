object FRM_Terraco: TFRM_Terraco
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Terra'#231'o (CST01)'
  ClientHeight = 167
  ClientWidth = 798
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 798
    Height = 167
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 25
      Width = 796
      Height = 121
      Align = alClient
      DataSource = DS2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'idCodPart'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Participante'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotal'
          Width = 100
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
          Width = 40
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
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorCofins'
          Width = 100
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 146
      Width = 796
      Height = 19
      Panels = <
        item
          Width = 150
        end
        item
          Alignment = taCenter
          Width = 200
        end
        item
          Alignment = taCenter
          Width = 200
        end
        item
          Alignment = taCenter
          Width = 200
        end>
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 796
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 5
        Width = 93
        Height = 13
        Caption = 'Mes de Referencia:'
      end
      object CB_MesRef: TComboBox
        Left = 120
        Top = 2
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'CB_MesRef'
        OnChange = CB_MesRefChange
      end
    end
  end
  object FDQ_MesRef: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from Planilhas')
    Left = 32
    Top = 72
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
      EditMask = '!99/0000;0;_'
      Size = 6
    end
  end
  object FDQ_Participante: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from Participantes')
    Left = 209
    Top = 72
    object FDQ_ParticipanteChave: TFDAutoIncField
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQ_ParticipanteCodigo: TStringField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      Required = True
      Size = 50
    end
    object FDQ_ParticipanteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 100
    end
    object FDQ_ParticipanteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 14
    end
    object FDQ_ParticipanteCod_Pais: TStringField
      FieldName = 'Cod_Pais'
      Origin = 'Cod_Pais'
      Required = True
    end
    object FDQ_ParticipanteCod_Municipio: TStringField
      FieldName = 'Cod_Municipio'
      Origin = 'Cod_Municipio'
      Required = True
    end
    object FDQ_ParticipanteSuframa: TStringField
      FieldName = 'Suframa'
      Origin = 'Suframa'
    end
    object FDQ_ParticipanteLogradouro: TStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 100
    end
    object FDQ_ParticipanteNumero: TStringField
      FieldName = 'Numero'
      Origin = 'Numero'
    end
    object FDQ_ParticipanteComplemento: TStringField
      FieldName = 'Complemento'
      Origin = 'Complemento'
      Size = 50
    end
    object FDQ_ParticipanteBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 100
    end
  end
  object DS1: TDataSource
    DataSet = FDQ_Participante
    Left = 273
    Top = 72
  end
  object FDQ_Terraco: TFDQuery
    Active = True
    BeforePost = FDQ_TerracoBeforePost
    AfterPost = FDQ_TerracoAfterPost
    AfterDelete = FDQ_TerracoAfterDelete
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from Terraco')
    Left = 488
    Top = 80
    object FDQ_TerracoChave: TFDAutoIncField
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQ_TerracoidMesRef: TIntegerField
      FieldName = 'idMesRef'
      Origin = 'idMesRef'
      Required = True
    end
    object FDQ_TerracoidCodPart: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'idCodPart'
      Origin = 'idCodPart'
      Required = True
      Size = 50
    end
    object FDQ_TerracoValorTotal: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
      Required = True
      OnChange = FDQ_TerracoValorTotalChange
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_TerracoBaseCalculo: TBCDField
      DisplayLabel = 'Base de C'#225'lculo'
      FieldName = 'BaseCalculo'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_TerracoPercentPis: TFloatField
      DisplayLabel = '% PIS'
      FieldName = 'PercentPis'
      Origin = 'PercentPis'
      Required = True
      DisplayFormat = '% #0.00'
    end
    object FDQ_TerracoValorPis: TBCDField
      DisplayLabel = 'Valor de Pis'
      FieldName = 'ValorPis'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_TerracoPercentCofins: TFloatField
      DisplayLabel = '% COFINS'
      FieldName = 'PercentCofins'
      Origin = 'PercentCofins'
      Required = True
      DisplayFormat = '$ #0.00'
    end
    object FDQ_TerracoValorCofins: TBCDField
      DisplayLabel = 'Valor de Cofins'
      FieldName = 'ValorCofins'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object FDQ_TerracoParticipante: TStringField
      FieldKind = fkLookup
      FieldName = 'Participante'
      LookupDataSet = FDQ_Participante
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'idCodPart'
      Size = 100
      Lookup = True
    end
  end
  object FDTransaction1: TFDTransaction
    Connection = DataModule1.FDConnection1
    Left = 568
    Top = 81
  end
  object DS2: TDataSource
    DataSet = FDQ_Terraco
    Left = 640
    Top = 81
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = DataModule1.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO LMPISCOFINSDBA.dbo.Terraco'
      '(idMesRef, idCodPart, ValorTotal, BaseCalculo, '
      '  PercentPis, ValorPis, PercentCofins, ValorCofins)'
      
        'VALUES (:NEW_idMesRef, :NEW_idCodPart, :NEW_ValorTotal, :NEW_Bas' +
        'eCalculo, '
      
        '  :NEW_PercentPis, :NEW_ValorPis, :NEW_PercentCofins, :NEW_Valor' +
        'Cofins);'
      'SELECT SCOPE_IDENTITY() AS Chave')
    ModifySQL.Strings = (
      'UPDATE LMPISCOFINSDBA.dbo.Terraco'
      
        'SET idMesRef = :NEW_idMesRef, idCodPart = :NEW_idCodPart, ValorT' +
        'otal = :NEW_ValorTotal, '
      '  BaseCalculo = :NEW_BaseCalculo, PercentPis = :NEW_PercentPis, '
      '  ValorPis = :NEW_ValorPis, PercentCofins = :NEW_PercentCofins, '
      '  ValorCofins = :NEW_ValorCofins'
      'WHERE Chave = :OLD_Chave')
    DeleteSQL.Strings = (
      'DELETE FROM LMPISCOFINSDBA.dbo.Terraco'
      'WHERE Chave = :OLD_Chave')
    FetchRowSQL.Strings = (
      
        'SELECT Chave, idMesRef, idCodPart, ValorTotal, BaseCalculo, Perc' +
        'entPis, '
      '  ValorPis, PercentCofins, ValorCofins'
      'FROM ('
      'select * from lmpiscofinsdba.dbo.Terraco'
      ') '
      'WHERE Chave = :OLD_Chave')
    Left = 416
    Top = 80
  end
end
