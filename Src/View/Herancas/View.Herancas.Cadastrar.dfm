object ViewHerancasCadastrar: TViewHerancasCadastrar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'ViewHerancasCadastrar'
  ClientHeight = 352
  ClientWidth = 780
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
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  TextHeight = 15
  object pnlDados: TGridPanel
    Left = 8
    Top = 8
    Width = 764
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <>
    ParentBackground = False
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    ExplicitWidth = 760
    ExplicitHeight = 283
  end
  object pnlRodape: TPanel
    Left = 8
    Top = 292
    Width = 764
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    Padding.Right = 8
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 291
    ExplicitWidth = 760
    object pnlBtnGravar: TPanel
      AlignWithMargins = True
      Left = 512
      Top = 8
      Width = 110
      Height = 36
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alRight
      BevelOuter = bvNone
      Color = 15253928
      ParentBackground = False
      TabOrder = 0
      OnMouseEnter = btnGravarMouseEnter
      OnMouseLeave = btnGravarMouseLeave
      ExplicitLeft = 508
      object btnGravar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 36
        Align = alClient
        Caption = '&Gravar (F3)'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnGravarClick
        OnMouseEnter = btnGravarMouseEnter
        OnMouseLeave = btnGravarMouseLeave
        ExplicitWidth = 116
      end
    end
    object pnlBtnCancelar1: TPanel
      AlignWithMargins = True
      Left = 638
      Top = 8
      Width = 110
      Height = 36
      Cursor = crHandPoint
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      OnClick = pnlBtnCancelar1Click
      ExplicitLeft = 634
      object pnlBtnCancelar2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 104
        Height = 30
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object btnCancelar: TSpeedButton
          Left = 0
          Top = 0
          Width = 104
          Height = 30
          Align = alClient
          Caption = '&Cancelar (Esc)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHotLight
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnCancelarClick
          OnMouseEnter = btnCancelarMouseEnter
          OnMouseLeave = btnCancelarMouseLeave
          ExplicitTop = -5
          ExplicitWidth = 134
          ExplicitHeight = 26
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 360
    Top = 120
  end
end
