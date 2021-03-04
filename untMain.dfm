object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 445
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 12
    Top = 132
    Width = 569
    Height = 124
    Caption = 'Endere'#231'o'
    TabOrder = 1
    object edtCep: TLabeledEdit
      Left = 11
      Top = 41
      Width = 89
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'CEP'
      MaxLength = 8
      TabOrder = 0
      OnExit = edtCepExit
    end
    object edtLogradouro: TLabeledEdit
      Left = 106
      Top = 41
      Width = 315
      Height = 21
      EditLabel.Width = 55
      EditLabel.Height = 13
      EditLabel.Caption = 'Logradouro'
      MaxLength = 100
      TabOrder = 1
    end
    object edtNumero: TLabeledEdit
      Left = 427
      Top = 41
      Width = 58
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero'
      MaxLength = 20
      TabOrder = 2
    end
    object edtComplemento: TLabeledEdit
      Left = 490
      Top = 41
      Width = 65
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'Complemento'
      MaxLength = 20
      TabOrder = 3
    end
    object edtBairro: TLabeledEdit
      Left = 11
      Top = 82
      Width = 177
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro'
      MaxLength = 100
      TabOrder = 4
    end
    object edtCidade: TLabeledEdit
      Left = 194
      Top = 82
      Width = 189
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cidade'
      MaxLength = 100
      TabOrder = 5
    end
    object edtEstado: TLabeledEdit
      Left = 389
      Top = 82
      Width = 40
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Estado'
      MaxLength = 2
      TabOrder = 6
    end
    object edtPais: TLabeledEdit
      Left = 434
      Top = 82
      Width = 121
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'Pa'#237's'
      MaxLength = 100
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 12
    Width = 569
    Height = 110
    Caption = 'Dados do Cliente'
    TabOrder = 0
    object edtNome: TLabeledEdit
      Left = 11
      Top = 32
      Width = 290
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      MaxLength = 100
      TabOrder = 0
    end
    object edtIdentidade: TLabeledEdit
      Left = 307
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = 'Identidade'
      MaxLength = 15
      TabOrder = 1
    end
    object edtCPF: TLabeledEdit
      Left = 434
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'CPF'
      MaxLength = 11
      TabOrder = 2
    end
    object edtTelefone: TLabeledEdit
      Left = 11
      Top = 72
      Width = 121
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Telefone'
      MaxLength = 20
      TabOrder = 3
    end
    object edtEmail: TLabeledEdit
      Left = 138
      Top = 72
      Width = 245
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Email'
      MaxLength = 100
      TabOrder = 4
    end
  end
  object btnAdicionar: TBitBtn
    Left = 506
    Top = 262
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF9632099932089932089C32099C32099C32099C31079C
      30079A3309983309FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF953209973106
      C23B13ED4631F65039F75F41F7664CF75542EE4630B23A18953108FF00FFFF00
      FFFF00FFFF00FFFF00FF9332099A3108CF3D19F3573DFB734EFA6541FBAD9CFA
      B7B0EF452EBF3D2195330BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E320B
      DC4725FE7552FF7048FF7757FFE9E5FFE9E5F46447B1391A92320BFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF9A340DCC4C28FC7042F2663FD4A195E1F3F2FE
      CCBBFF7752C14B27923009FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      DE52237A2F2830235316296D213270533B52CE512AC14819FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D1E7D00229803228C011C8700
      1374181B64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      000A290A3EBB0D3BAA0D3CAA0D3AA90C3AAA012297FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF000000092766145CEF104ECC0F49C10F47BF11
      4DC50F43B5FF00FFFF00FFFF00FF1C65081C6508FF00FFFF00FFFF00FF000000
      07275A145BCE114AAB0F48BB0E41B21357D01354D0FF00FFFF00FFFF00FF1C65
      081C6508FF00FFFF00FFFF00FF0101010507080003070A2D571D7DEE1A70ED1C
      7AF6155FE7FF00FF1C65081C650818811D187E1C1C65081C6508FF00FF242220
      242220221E18071F3A1673C9208BEF1E86E90D36A4FF00FF1C65081C65081877
      181877181C65081C6508FF00FFFF00FF2725235A5959514E4C2529320A172807
      1120FF00FFFF00FFFF00FFFF00FF1C65081C6508FF00FFFF00FFFF00FFFF00FF
      FF00FF7877757877756B655F1F1A16FF00FFFF00FFFF00FFFF00FFFF00FF1C65
      081C6508FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 2
    TabStop = False
    OnClick = btnAdicionarClick
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 303
    Width = 601
    Height = 142
    TabStop = False
    Align = alBottom
    DataSource = DataSource
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnEnviarEmail: TBitBtn
    Left = 401
    Top = 262
    Width = 99
    Height = 25
    Caption = 'Enviar Email'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000230B0000230B00000001000000010000FFB56300AD73
      8400B5848400BD848C00D69C9400CEADA500FFD6A500FFD6AD00DEC6BD00EFD6
      BD00F7E7D600FFF7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0102020202020202020202020202020C010B0B0B0B
      0B0B0B0B0B0B0B0B0B020C010B0D0A0A0A0A0A0A0A0A0D0D0D020C010B0D0606
      0606060606060D0D0D020C030B0D0A0A0A0A0A0A0A0A0D0D0D020C030B0D0606
      0606060606060D0D0D020C030B0D0D0D0D0D0D0D0D0D00000A020C040B0D0D0D
      0D0D0D0D0D0D06000A020C040B0D0D0D0D0D0D0D0D0D0A0A0A020C0409090909
      090909090909080805050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C}
    TabOrder = 4
    TabStop = False
    OnClick = btnEnviarEmailClick
  end
  object DataSource: TDataSource
    DataSet = cdsCliente
    Left = 472
    Top = 336
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Identidade'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Logradouro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsClienteAfterOpen
    Left = 400
    Top = 336
  end
end
