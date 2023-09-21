inherited ViewPessoasCadastrar: TViewPessoasCadastrar
  Caption = 'Pessoas cadastrar/alterar'
  ClientHeight = 519
  ClientWidth = 925
  OnShow = FormShow
  ExplicitWidth = 937
  ExplicitHeight = 557
  TextHeight = 15
  inherited pnlDados: TPanel
    Width = 909
    Height = 451
    ExplicitWidth = 905
    ExplicitHeight = 450
    object grdDados: TGridPanel
      Left = 8
      Top = 8
      Width = 893
      Height = 435
      Align = alClient
      BevelOuter = bvNone
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
          ColumnSpan = 3
          Control = rdgTIPO_JURIDICO
          Row = 5
        end
        item
          Column = 0
          Control = edtCodigo
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
          Control = edtFANTASIA
          Row = 0
        end
        item
          Column = 0
          Control = edtCEP
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
          Control = edtENDERECO
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
          Control = edtNASCIMENTO
          Row = 4
        end
        item
          Column = 3
          ColumnSpan = 2
          Control = edtCPF
          Row = 5
        end
        item
          Column = 5
          ColumnSpan = 2
          Control = edtRG
          Row = 5
        end
        item
          Column = 0
          ColumnSpan = 2
          Control = edtCNPJ
          Row = 6
        end
        item
          Column = 2
          ColumnSpan = 2
          Control = edtIE
          Row = 6
        end
        item
          Column = 4
          ColumnSpan = 2
          Control = edtDH_CADASTRO
          Row = 6
        end
        item
          Column = 1
          Control = edtIdCidade
          Row = 2
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
          Value = 14.285714285714270000
        end>
      TabOrder = 0
      ExplicitWidth = 889
      ExplicitHeight = 434
      object pnlAtivo: TPanel
        Left = 0
        Top = 62
        Width = 128
        Height = 62
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 3
        object chkAtivo: TDBCheckBox
          AlignWithMargins = True
          Left = 8
          Top = 24
          Width = 112
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
        Left = 128
        Top = 62
        Width = 127
        Height = 62
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 4
        object chkCLIENTE: TDBCheckBox
          AlignWithMargins = True
          Left = 8
          Top = 24
          Width = 111
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
        Left = 255
        Top = 62
        Width = 128
        Height = 62
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 5
        object chkFORNECEDOR: TDBCheckBox
          AlignWithMargins = True
          Left = 8
          Top = 24
          Width = 112
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
      object rdgTIPO_JURIDICO: TDBRadioGroup
        AlignWithMargins = True
        Left = 8
        Top = 313
        Width = 367
        Height = 52
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
      end
      object edtCodigo: TDBLabeledEdit
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 112
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
        Left = 136
        Top = 24
        Width = 366
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
      object edtFANTASIA: TDBLabeledEdit
        AlignWithMargins = True
        Left = 518
        Top = 24
        Width = 367
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'FANTASIA'
        DataSource = DataSource1
        TabOrder = 2
        EditLabel.Width = 98
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome de Fantasia'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        EditLabel.Layout = tlCenter
      end
      object edtCEP: TDBLabeledEdit
        AlignWithMargins = True
        Left = 8
        Top = 148
        Width = 112
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
      object edtNomeCidade: TLabeledEdit
        AlignWithMargins = True
        Left = 263
        Top = 148
        Width = 239
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
      object edtENDERECO: TDBLabeledEdit
        AlignWithMargins = True
        Left = 518
        Top = 148
        Width = 367
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'ENDERECO'
        DataSource = DataSource1
        TabOrder = 9
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o'
        EditLabel.Layout = tlCenter
      end
      object edtNUMERO: TDBLabeledEdit
        AlignWithMargins = True
        Left = 8
        Top = 210
        Width = 112
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
        Left = 136
        Top = 210
        Width = 366
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
        Left = 518
        Top = 210
        Width = 367
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
        Top = 273
        Width = 239
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
        Left = 263
        Top = 273
        Width = 239
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
        Left = 518
        Top = 273
        Width = 239
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
      object edtNASCIMENTO: TDBLabeledEdit
        AlignWithMargins = True
        Left = 773
        Top = 273
        Width = 112
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'NASCIMENTO'
        DataSource = DataSource1
        MaxLength = 10
        TabOrder = 16
        EditLabel.Width = 107
        EditLabel.Height = 15
        EditLabel.Caption = 'Data de Nascimento'
        EditLabel.Layout = tlCenter
      end
      object edtCPF: TDBLabeledEdit
        AlignWithMargins = True
        Left = 391
        Top = 335
        Width = 239
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'CPF'
        DataSource = DataSource1
        TabOrder = 18
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'CPF'
        EditLabel.Layout = tlCenter
      end
      object edtRG: TDBLabeledEdit
        AlignWithMargins = True
        Left = 646
        Top = 335
        Width = 239
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'RG'
        DataSource = DataSource1
        TabOrder = 19
        EditLabel.Width = 15
        EditLabel.Height = 15
        EditLabel.Caption = 'RG'
        EditLabel.Layout = tlCenter
      end
      object edtCNPJ: TDBLabeledEdit
        AlignWithMargins = True
        Left = 8
        Top = 397
        Width = 239
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'CNPJ'
        DataSource = DataSource1
        TabOrder = 20
        EditLabel.Width = 27
        EditLabel.Height = 15
        EditLabel.Caption = 'CNPJ'
        EditLabel.Layout = tlCenter
      end
      object edtIE: TDBLabeledEdit
        AlignWithMargins = True
        Left = 263
        Top = 397
        Width = 239
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        DataField = 'IE'
        DataSource = DataSource1
        TabOrder = 21
        EditLabel.Width = 94
        EditLabel.Height = 15
        EditLabel.Caption = 'Inscri'#231#227'o Estadual'
        EditLabel.Layout = tlCenter
      end
      object edtDH_CADASTRO: TDBLabeledEdit
        AlignWithMargins = True
        Left = 518
        Top = 397
        Width = 239
        Height = 23
        Margins.Left = 8
        Margins.Top = 24
        Margins.Right = 8
        Margins.Bottom = 0
        TabStop = False
        Align = alTop
        Color = clBtnFace
        DataField = 'DH_CADASTRO'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 22
        EditLabel.Width = 129
        EditLabel.Height = 15
        EditLabel.Caption = 'Data e Hora do Cadastro'
        EditLabel.Layout = tlCenter
      end
      object edtIdCidade: TLabeledEdit
        AlignWithMargins = True
        Left = 136
        Top = 148
        Width = 111
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
        ExplicitLeft = 386
        ExplicitTop = 89
        ExplicitWidth = 121
      end
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
