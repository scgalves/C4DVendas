inherited ViewProdutosCadastrar: TViewProdutosCadastrar
  Caption = 'Produtos cadastrar/alterar'
  ClientHeight = 519
  ClientWidth = 672
  OnShow = FormShow
  ExplicitWidth = 684
  ExplicitHeight = 557
  TextHeight = 15
  inherited pnlDados: TGridPanel
    Width = 656
    Height = 451
    ColumnCollection = <
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = edtID
        Row = 0
      end
      item
        Column = 2
        ColumnSpan = 3
        Control = edtNOME
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 5
        Control = edtDESCRICAO
        Row = 1
      end
      item
        Column = 1
        Control = pnlAtivo
        Row = 0
      end
      item
        Column = 0
        Control = edtIdGrupo
        Row = 4
      end
      item
        Column = 1
        ColumnSpan = 4
        Control = edtDescricaoGrupo
        Row = 4
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = edtPRECO_CUSTO
        Row = 2
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
      end
      item
        Column = 2
        Control = edtPORCENTAGEM_VENDA
        Row = 2
      end
      item
        Column = 3
        ColumnSpan = 2
        Control = edtPRECO_VENDA
        Row = 2
      end
      item
        Column = 0
        Control = edtIdSubgrupo
        Row = 5
      end
      item
        Column = 1
        ColumnSpan = 4
        Control = edtDescricaoSubgrupo
        Row = 5
      end
      item
        Column = 2
        ColumnSpan = 3
        Control = edtCODIGO_BARRAS
        Row = 3
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = pnlUnidade
        Row = 3
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
    ExplicitWidth = 652
    ExplicitHeight = 450
    object edtID: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 24
      Width = 115
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
      Left = 270
      Top = 24
      Width = 378
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'NOME'
      DataSource = DataSource1
      TabOrder = 2
      EditLabel.Width = 34
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      EditLabel.Layout = tlCenter
    end
    object edtDESCRICAO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 88
      Width = 640
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'DESCRICAO'
      DataSource = DataSource1
      TabOrder = 3
      EditLabel.Width = 51
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Layout = tlCenter
    end
    object pnlAtivo: TPanel
      Left = 131
      Top = 0
      Width = 131
      Height = 64
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object chkAtivo: TDBCheckBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 115
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
    object edtIdGrupo: TLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 282
      Width = 115
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      EditLabel.Width = 100
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo Grupo (F8)'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 9
      Text = ''
      OnExit = edtIdGrupoExit
      OnKeyDown = edtIdGrupoKeyDown
    end
    object edtDescricaoGrupo: TLabeledEdit
      AlignWithMargins = True
      Left = 139
      Top = 282
      Width = 509
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      EditLabel.Width = 104
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o do Grupo'
      Enabled = False
      ReadOnly = True
      TabOrder = 10
      Text = ''
    end
    object edtPRECO_CUSTO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 153
      Width = 246
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'PRECO_CUSTO'
      DataSource = DataSource1
      TabOrder = 4
      OnExit = edtPRECO_CUSTOExit
      EditLabel.Width = 80
      EditLabel.Height = 15
      EditLabel.Caption = 'Pre'#231'o de Custo'
      EditLabel.Layout = tlCenter
    end
    object edtDTHR_INSERT: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 411
      Width = 246
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
      TabOrder = 13
      EditLabel.Width = 91
      EditLabel.Height = 15
      EditLabel.Caption = 'Data do Cadastro'
      EditLabel.Layout = tlCenter
    end
    object edtDTHR_UPDATE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 270
      Top = 411
      Width = 247
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
      TabOrder = 14
      EditLabel.Width = 88
      EditLabel.Height = 15
      EditLabel.Caption = #218'ltima Altera'#231#227'o'
      EditLabel.Layout = tlCenter
    end
    object edtPORCENTAGEM_VENDA: TDBLabeledEdit
      AlignWithMargins = True
      Left = 270
      Top = 153
      Width = 116
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'PORCENTAGEM_VENDA'
      DataSource = DataSource1
      TabOrder = 5
      OnExit = edtPORCENTAGEM_VENDAExit
      EditLabel.Width = 61
      EditLabel.Height = 15
      EditLabel.Caption = '% de Venda'
      EditLabel.Layout = tlCenter
    end
    object edtPRECO_VENDA: TDBLabeledEdit
      AlignWithMargins = True
      Left = 402
      Top = 153
      Width = 246
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'PRECO_VENDA'
      DataSource = DataSource1
      TabOrder = 6
      OnExit = edtPRECO_VENDAExit
      EditLabel.Width = 81
      EditLabel.Height = 15
      EditLabel.Caption = 'Pre'#231'o de Venda'
      EditLabel.Layout = tlCenter
    end
    object edtIdSubgrupo: TLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 346
      Width = 115
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      EditLabel.Width = 119
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo Subgrupo (F9)'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 11
      Text = ''
      OnExit = edtIdSubgrupoExit
      OnKeyDown = edtIdSubgrupoKeyDown
    end
    object edtDescricaoSubgrupo: TLabeledEdit
      AlignWithMargins = True
      Left = 139
      Top = 346
      Width = 509
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      EditLabel.Width = 123
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o do Subgrupo'
      Enabled = False
      ReadOnly = True
      TabOrder = 12
      Text = ''
    end
    object edtCODIGO_BARRAS: TDBLabeledEdit
      AlignWithMargins = True
      Left = 270
      Top = 217
      Width = 378
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'CODIGO_BARRAS'
      DataSource = DataSource1
      TabOrder = 8
      EditLabel.Width = 90
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo de Barras'
      EditLabel.Layout = tlCenter
    end
    object pnlUnidade: TPanel
      Left = 0
      Top = 193
      Width = 262
      Height = 65
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 7
      object lblUnidade: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 246
        Height = 15
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 46
      end
      object cmbUnidade: TComboBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 246
        Height = 22
        Margins.Left = 8
        Margins.Top = 1
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Style = csOwnerDrawFixed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Cj  | Conjunto'
          'Cx  | Caixa'
          'Dz  | D'#250'zia'
          'Fd  | Fardo'
          'Fl  | Folha'
          'Gl  | Gal'#227'o'
          'Jg  | Jogo'
          'Kg  | Quilo'
          'Kt  | Kit'
          'L   | Litro'
          'Lta | Lata'
          'M   | Metro'
          'Mil | Milheiro'
          'Par | Par'
          'P'#231'  | Pe'#231'a'
          'Pct | Pacote'
          'Res | Resma'
          'Rl  | Rolo'
          'Ton | Tonelada'
          'Un  | Unidade'
          'Vd  | Vidro')
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 459
    Width = 656
    ExplicitTop = 458
    ExplicitWidth = 652
    inherited pnlBtnGravar: TPanel
      Left = 404
      ExplicitLeft = 400
    end
    inherited pnlBtnCancelar1: TPanel
      Left = 530
      ExplicitLeft = 526
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
    DataSet = ModelProdutosDM.QProdutosCadastro
    Left = 448
    Top = 112
  end
end
