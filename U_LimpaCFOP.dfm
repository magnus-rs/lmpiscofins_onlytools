object FRM_LimpaCFOP: TFRM_LimpaCFOP
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Remover os CFOPs Desnecess'#225'rios'
  ClientHeight = 230
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 152
    Width = 110
    Height = 13
    Caption = 'Toatl CST 49 exclu'#237'do :'
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 24
    Width = 561
    Height = 105
    Caption = ' Sele'#231#227'o de CFOP a serem excluidos do Arquivo '
    TabOrder = 0
    object CB5152: TCheckBox
      Left = 32
      Top = 24
      Width = 81
      Height = 17
      Caption = '5152 / 1152'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CB5152Click
    end
    object CB5557: TCheckBox
      Left = 144
      Top = 24
      Width = 81
      Height = 17
      Caption = '5557 / 1557'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CB5557Click
    end
    object CB5929: TCheckBox
      Left = 256
      Top = 24
      Width = 49
      Height = 17
      Caption = '5929'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CB5929Click
    end
    object CB5915: TCheckBox
      Left = 336
      Top = 24
      Width = 81
      Height = 17
      Caption = '5915 / 1915'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CB5915Click
    end
    object CB5916: TCheckBox
      Left = 448
      Top = 24
      Width = 81
      Height = 17
      Caption = '5916 / 1916'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CB5916Click
    end
    object BTN_Marca: TButton
      Left = 112
      Top = 64
      Width = 129
      Height = 25
      Caption = 'Marcar Todos'
      Enabled = False
      TabOrder = 5
      OnClick = BTN_MarcaClick
    end
    object BTN_Desmarca: TButton
      Left = 296
      Top = 64
      Width = 129
      Height = 25
      Caption = 'Desmarcar Todos'
      TabOrder = 6
      OnClick = BTN_DesmarcaClick
    end
  end
  object BTN_Executar: TButton
    Left = 248
    Top = 184
    Width = 129
    Height = 25
    Caption = 'Executar'
    TabOrder = 1
    OnClick = BTN_ExecutarClick
  end
  object Edit1: TEdit
    Left = 248
    Top = 149
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'Edit1'
  end
end
