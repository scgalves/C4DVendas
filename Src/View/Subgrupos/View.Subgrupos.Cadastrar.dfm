inherited ViewSubgruposCadastrar: TViewSubgruposCadastrar
  Caption = 'Subgrupos cadastrar/alterar'
  ClientHeight = 331
  ClientWidth = 534
  OnShow = FormShow
  ExplicitWidth = 546
  ExplicitHeight = 369
  TextHeight = 15
  inherited pnlDados: TGridPanel
    Width = 518
    Height = 263
    ColumnCollection = <
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = edtID
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 4
        Control = edtDESCRICAO
        Row = 1
      end
      item
        Column = 0
        Control = edtIdGrupo
        Row = 2
      end
      item
        Column = 1
        ColumnSpan = 3
        Control = edtNomeGrupo
        Row = 2
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = edtDTHR_INSERT
        Row = 3
      end
      item
        Column = 2
        ColumnSpan = 2
        Control = edtDTHR_UPDATE
        Row = 3
      end>
    RowCollection = <
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end
      item
        Value = 25.000000000000000000
      end>
    ExplicitWidth = 514
    ExplicitHeight = 262
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
    object edtDESCRICAO: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 90
      Width = 502
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'DESCRICAO'
      DataSource = DataSource1
      TabOrder = 1
      EditLabel.Width = 54
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Segoe UI'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      EditLabel.Layout = tlCenter
    end
    object edtIdGrupo: TLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 156
      Width = 114
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
      TabOrder = 2
      Text = ''
      OnExit = edtIdGrupoExit
      OnKeyDown = edtIdGrupoKeyDown
    end
    object edtNomeGrupo: TLabeledEdit
      AlignWithMargins = True
      Left = 138
      Top = 156
      Width = 372
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      TabStop = False
      Align = alTop
      Color = clBtnFace
      EditLabel.Width = 86
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome do Grupo'
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      Text = ''
    end
    object edtDTHR_INSERT: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 221
      Width = 243
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
      TabOrder = 4
      EditLabel.Width = 91
      EditLabel.Height = 15
      EditLabel.Caption = 'Data do Cadastro'
      EditLabel.Layout = tlCenter
    end
    object edtDTHR_UPDATE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 267
      Top = 221
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
      TabOrder = 5
      EditLabel.Width = 88
      EditLabel.Height = 15
      EditLabel.Caption = #218'ltima Altera'#231#227'o'
      EditLabel.Layout = tlCenter
    end
  end
  inherited pnlRodape: TPanel
    Top = 271
    Width = 518
    ExplicitTop = 270
    ExplicitWidth = 514
    inherited pnlBtnGravar: TPanel
      Left = 266
      ExplicitLeft = 262
    end
    inherited pnlBtnCancelar1: TPanel
      Left = 392
      ExplicitLeft = 388
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
    DataSet = ModelSubgruposDM.QSubgruposCadastro
    Left = 248
    Top = 104
  end
end
