object ViewHerancasBuscar: TViewHerancasBuscar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Buscar base'
  ClientHeight = 546
  ClientWidth = 914
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 8
  Padding.Top = 8
  Padding.Right = 8
  Padding.Bottom = 8
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object GridPanel1: TGridPanel
    Left = 8
    Top = 8
    Width = 898
    Height = 467
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ColumnCollection = <
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        ColumnSpan = 6
        Control = edtBuscar
        Row = 0
      end
      item
        Column = 6
        ColumnSpan = 2
        Control = pnlFiltroCombo
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 8
        Control = DBGrid1
        Row = 1
        RowSpan = 6
      end
      item
        Column = 6
        ColumnSpan = 2
        Control = lbTotal
        Row = 7
      end>
    ParentBackground = False
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
        Value = 14.285714285714290000
      end
      item
        SizeStyle = ssAbsolute
        Value = 25.000000000000000000
      end>
    TabOrder = 0
    ExplicitWidth = 894
    ExplicitHeight = 441
    object edtBuscar: TLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 24
      Width = 657
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      EditLabel.Width = 71
      EditLabel.Height = 15
      EditLabel.Caption = 'Pesquisar por'
      TabOrder = 0
      Text = ''
      OnChange = edtBuscarChange
      OnKeyDown = edtBuscarKeyDown
      OnKeyPress = edtBuscarKeyPress
    end
    object pnlFiltroCombo: TPanel
      Left = 673
      Top = 0
      Width = 225
      Height = 63
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblFiltroCombo: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 6
        Width = 209
        Height = 15
        Margins.Left = 8
        Margins.Top = 6
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Caption = 'lblFiltroCombo'
        ExplicitWidth = 80
      end
      object cmbFiltroCombo: TComboBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 209
        Height = 22
        Margins.Left = 8
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Style = csOwnerDrawFixed
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 8
      Top = 63
      Width = 882
      Height = 379
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alClient
      DataSource = DataSource1
      PopupMenu = PopupMenu1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnKeyPress = DBGrid1KeyPress
      OnTitleClick = DBGrid1TitleClick
    end
    object lbTotal: TLabel
      AlignWithMargins = True
      Left = 673
      Top = 442
      Width = 217
      Height = 25
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alClient
      Alignment = taRightJustify
      Caption = 'Registros localizados: 000000'
      Layout = tlCenter
      ExplicitLeft = 739
      ExplicitWidth = 151
      ExplicitHeight = 15
    end
  end
  object pnlRodape: TPanel
    Left = 8
    Top = 475
    Width = 898
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object rdgFiltros: TRadioGroup
      AlignWithMargins = True
      Left = 8
      Top = 0
      Width = 438
      Height = 55
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      Caption = 'Buscar por'
      TabOrder = 0
      OnClick = rdgFiltrosClick
      ExplicitTop = 10
      ExplicitWidth = 431
      ExplicitHeight = 44
    end
    object pnlBtnFechar1: TPanel
      AlignWithMargins = True
      Left = 795
      Top = 7
      Width = 95
      Height = 47
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 7
      Margins.Right = 8
      Margins.Bottom = 9
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitHeight = 62
      object pnlBtnFechar2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 89
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 90
        ExplicitHeight = 30
        object btnFechar: TSpeedButton
          Left = 0
          Top = 0
          Width = 89
          Height = 41
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alClient
          Caption = '&Fechar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnFecharClick
          OnMouseEnter = btnCadastrarMouseEnter
          OnMouseLeave = btnCadastrarMouseLeave
          ExplicitTop = 3
          ExplicitWidth = 90
          ExplicitHeight = 25
        end
      end
    end
    object pnlBtnUtilizar1: TPanel
      AlignWithMargins = True
      Left = 684
      Top = 7
      Width = 95
      Height = 47
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 7
      Margins.Right = 8
      Margins.Bottom = 9
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitHeight = 62
      object pnlBtnUtilizar2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 89
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitHeight = 30
        object btnUtilizar: TSpeedButton
          Left = 0
          Top = 0
          Width = 89
          Height = 41
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alClient
          Caption = '&Utilizar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnUtilizarClick
          OnMouseEnter = btnCadastrarMouseEnter
          OnMouseLeave = btnCadastrarMouseLeave
          ExplicitLeft = 8
          ExplicitTop = 1
          ExplicitWidth = 91
          ExplicitHeight = 107
        end
      end
    end
    object pnlBtnAlterar1: TPanel
      AlignWithMargins = True
      Left = 573
      Top = 7
      Width = 95
      Height = 47
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 7
      Margins.Right = 8
      Margins.Bottom = 9
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      ExplicitHeight = 62
      object pnlBtnAlterar2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 89
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 90
        ExplicitHeight = 30
        object btnAlterar: TSpeedButton
          Left = 0
          Top = 0
          Width = 89
          Height = 41
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alClient
          Caption = '&Alterar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnAlterarClick
          OnMouseEnter = btnCadastrarMouseEnter
          OnMouseLeave = btnCadastrarMouseLeave
          ExplicitLeft = 8
          ExplicitTop = 4
          ExplicitWidth = 98
          ExplicitHeight = 44
        end
      end
    end
    object pnlBtnCadastrar1: TPanel
      AlignWithMargins = True
      Left = 462
      Top = 7
      Width = 95
      Height = 47
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 7
      Margins.Right = 8
      Margins.Bottom = 9
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
      ExplicitHeight = 62
      object pnlBtnCadastrar2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 89
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 90
        ExplicitHeight = 30
        object btnCadastrar: TSpeedButton
          Left = 0
          Top = 0
          Width = 89
          Height = 41
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alClient
          Caption = '&Cadastrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnCadastrarClick
          OnMouseEnter = btnCadastrarMouseEnter
          OnMouseLeave = btnCadastrarMouseLeave
          ExplicitLeft = 8
          ExplicitWidth = 90
          ExplicitHeight = 50
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 56
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 128
    object Atualizar1: TMenuItem
      Caption = 'Atualizar'
      OnClick = Atualizar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
