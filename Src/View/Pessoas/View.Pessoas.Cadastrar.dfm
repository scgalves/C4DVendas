inherited ViewPessoasCadastrar: TViewPessoasCadastrar
  Caption = 'Pessoas cadastrar/alterar'
  ClientHeight = 519
  ClientWidth = 925
  OnShow = FormShow
  ExplicitWidth = 937
  ExplicitHeight = 557
  TextHeight = 15
  inherited pnlDados: TGridPanel
    Width = 909
    Height = 451
    ColumnCollection = <
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714270000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = edtID
        Row = 0
      end
      item
        Column = 1
        ColumnSpan = 3
        Control = edtNOME
        Row = 0
      end
      item
        Column = 4
        ColumnSpan = 3
        Control = edtFANTASIA_APELIDO
        Row = 0
      end
      item
        Column = 0
        Control = pnlAtivo
        Row = 1
      end
      item
        Column = 1
        Control = pnlCliente
        Row = 1
      end
      item
        Column = 2
        Control = pnlFornecedor
        Row = 1
      end
      item
        Column = 0
        Control = edtCEP
        Row = 2
      end
      item
        Column = 1
        Control = edtIdCidade
        Row = 2
      end
      item
        Column = 2
        ColumnSpan = 2
        Control = edtNomeCidade
        Row = 2
      end
      item
        Column = 4
        ColumnSpan = 3
        Control = edtLOGRADOURO
        Row = 2
      end
      item
        Column = 0
        Control = edtNUMERO
        Row = 3
      end
      item
        Column = 1
        ColumnSpan = 3
        Control = edtCOMPLEMENTO
        Row = 3
      end
      item
        Column = 4
        ColumnSpan = 3
        Control = edtBAIRRO
        Row = 3
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = edtTELEFONE
        Row = 4
      end
      item
        Column = 2
        ColumnSpan = 2
        Control = edtCELULAR
        Row = 4
      end
      item
        Column = 4
        ColumnSpan = 2
        Control = edtEMAIL
        Row = 4
      end
      item
        Column = 6
        Control = edtDT_NASCIMENTO
        Row = 4
      end
      item
        Column = 0
        ColumnSpan = 3
        Control = rdgTIPO_JURIDICO
        Row = 5
      end
      item
        Column = 3
        ColumnSpan = 2
        Control = edtCPF_CNPJ
        Row = 5
      end
      item
        Column = 5
        ColumnSpan = 2
        Control = edtRG_IE
        Row = 5
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = edtDTHR_INSERT
        Row = 6
      end
      item
        Column = 2
        ColumnSpan = 2
        Control = edtDTHR_UPDATE
        Row = 6
      end>
    RowCollection = <
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714290000
      end
      item
        Value = 14.285714285714260000
      end>
    ExplicitWidth = 905
    ExplicitHeight = 450
    object edtID: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 24
      Width = 114
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 0
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      EditLabel.Layout = tlCenter
    end
    object edtNOME: TDBLabeledEdit
      AlignWithMargins = True
      Left = 138
      Top = 24
      Width = 373
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 1
      EditLabel.Width = 107
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome/Raz'#227'o Social'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      EditLabel.Layout = tlCenter
    end
    object edtFANTASIA_APELIDO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 527
      Top = 24
      Width = 374
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'FANTASIA_APELIDO'
      DataSource = DataSource1
      TabOrder = 2
      EditLabel.Width = 141
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome de Fantasia/Apelido'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Layout = tlCenter
    end
    object pnlAtivo: TPanel
      Left = 0
      Top = 64
      Width = 130
      Height = 65
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object chkAtivo: TDBCheckBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 114
        Height = 17
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Ativo?'
        DataField = 'ATIVO'
        DataSource = DataSource1
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object pnlCliente: TPanel
      Left = 130
      Top = 64
      Width = 130
      Height = 65
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object chkCLIENTE: TDBCheckBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 114
        Height = 17
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Cliente'
        DataField = 'CLIENTE'
        DataSource = DataSource1
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object pnlFornecedor: TPanel
      Left = 260
      Top = 64
      Width = 130
      Height = 65
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 5
      object chkFORNECEDOR: TDBCheckBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 114
        Height = 17
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Fornecedor'
        DataField = 'FORNECEDOR'
        DataSource = DataSource1
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object edtCEP: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 153
      Width = 114
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'CEP'
      DataSource = DataSource1
      MaxLength = 9
      TabOrder = 6
      EditLabel.Width = 21
      EditLabel.Height = 15
      EditLabel.Caption = 'CEP'
      EditLabel.Layout = tlCenter
    end
    object edtIdCidade: TLabeledEdit
      AlignWithMargins = True
      Left = 138
      Top = 153
      Width = 114
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      EditLabel.Width = 102
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo Cidade (F8)'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 7
      Text = ''
      OnExit = edtIdCidadeExit
      OnKeyDown = edtIdCidadeKeyDown
    end
    object edtNomeCidade: TLabeledEdit
      AlignWithMargins = True
      Left = 268
      Top = 153
      Width = 243
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      EditLabel.Width = 89
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome da Cidade'
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      Text = ''
    end
    object edtLOGRADOURO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 527
      Top = 153
      Width = 374
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'LOGRADOURO'
      DataSource = DataSource1
      TabOrder = 9
      EditLabel.Width = 62
      EditLabel.Height = 15
      EditLabel.Caption = 'Logradouro'
      EditLabel.Layout = tlCenter
    end
    object edtNUMERO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 217
      Width = 114
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'NUMERO'
      DataSource = DataSource1
      TabOrder = 10
      EditLabel.Width = 44
      EditLabel.Height = 15
      EditLabel.Caption = 'N'#250'mero'
      EditLabel.Layout = tlCenter
    end
    object edtCOMPLEMENTO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 138
      Top = 217
      Width = 373
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'COMPLEMENTO'
      DataSource = DataSource1
      TabOrder = 11
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Complemento'
      EditLabel.Layout = tlCenter
    end
    object edtBAIRRO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 527
      Top = 217
      Width = 374
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'BAIRRO'
      DataSource = DataSource1
      TabOrder = 12
      EditLabel.Width = 31
      EditLabel.Height = 15
      EditLabel.Caption = 'Bairro'
      EditLabel.Layout = tlCenter
    end
    object edtTELEFONE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 282
      Width = 244
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'TELEFONE'
      DataSource = DataSource1
      TabOrder = 13
      EditLabel.Width = 44
      EditLabel.Height = 15
      EditLabel.Caption = 'Telefone'
      EditLabel.Layout = tlCenter
    end
    object edtCELULAR: TDBLabeledEdit
      AlignWithMargins = True
      Left = 268
      Top = 282
      Width = 243
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'CELULAR'
      DataSource = DataSource1
      TabOrder = 14
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Celular'
      EditLabel.Layout = tlCenter
    end
    object edtEMAIL: TDBLabeledEdit
      AlignWithMargins = True
      Left = 527
      Top = 282
      Width = 244
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'EMAIL'
      DataSource = DataSource1
      TabOrder = 15
      EditLabel.Width = 34
      EditLabel.Height = 15
      EditLabel.Caption = 'E-Mail'
      EditLabel.Layout = tlCenter
    end
    object edtDT_NASCIMENTO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 787
      Top = 282
      Width = 114
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'DT_NASCIMENTO'
      DataSource = DataSource1
      MaxLength = 10
      TabOrder = 16
      EditLabel.Width = 107
      EditLabel.Height = 15
      EditLabel.Caption = 'Data de Nascimento'
      EditLabel.Layout = tlCenter
    end
    object rdgTIPO_JURIDICO: TDBRadioGroup
      AlignWithMargins = True
      Left = 8
      Top = 324
      Width = 374
      Height = 55
      Margins.Left = 8
      Margins.Top = 2
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      Caption = ' Tipo de Pessoa '
      Columns = 2
      DataField = 'TIPO_JURIDICO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica')
      ParentFont = False
      TabOrder = 17
      Values.Strings = (
        '0'
        '1')
      OnChange = rdgTIPO_JURIDICOChange
      OnClick = rdgTIPO_JURIDICOClick
    end
    object edtCPF_CNPJ: TDBLabeledEdit
      AlignWithMargins = True
      Left = 398
      Top = 346
      Width = 243
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'CPF_CNPJ'
      DataSource = DataSource1
      TabOrder = 18
      EditLabel.Width = 53
      EditLabel.Height = 15
      EditLabel.Caption = 'CPF/CNPJ'
      EditLabel.Layout = tlCenter
    end
    object edtRG_IE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 657
      Top = 346
      Width = 244
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'RG_IE'
      DataSource = DataSource1
      TabOrder = 19
      EditLabel.Width = 114
      EditLabel.Height = 15
      EditLabel.Caption = 'RG/Inscri'#231#227'o Estadual'
      EditLabel.Layout = tlCenter
    end
    object edtDTHR_INSERT: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 411
      Width = 244
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      DataField = 'DTHR_INSERT'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 20
      EditLabel.Width = 91
      EditLabel.Height = 15
      EditLabel.Caption = 'Data do Cadastro'
      EditLabel.Layout = tlCenter
    end
    object edtDTHR_UPDATE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 268
      Top = 411
      Width = 243
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      DataField = 'DTHR_UPDATE'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 21
      EditLabel.Width = 88
      EditLabel.Height = 15
      EditLabel.Caption = #218'ltima Altera'#231#227'o'
      EditLabel.Layout = tlCenter
    end
  end
  inherited pnlRodape: TPanel
    Top = 459
    Width = 909
    ExplicitTop = 458
    ExplicitWidth = 905
    inherited pnlBtnGravar: TPanel
      Left = 657
      ExplicitLeft = 653
    end
    inherited pnlBtnCancelar1: TPanel
      Left = 783
      ExplicitLeft = 779
      inherited pnlBtnCancelar2: TPanel
        inherited btnCancelar: TSpeedButton
          ExplicitLeft = 633
          ExplicitTop = 21
          ExplicitHeight = 42
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasCadastro
    Left = 448
    Top = 112
  end
end
