inherited ViewGruposCadastrar: TViewGruposCadastrar
  Caption = 'Grupos cadastrar/alterar'
  ClientHeight = 332
  ClientWidth = 538
  OnShow = FormShow
  ExplicitWidth = 550
  ExplicitHeight = 370
  TextHeight = 15
  inherited pnlDados: TGridPanel
    Width = 522
    Height = 264
    ControlCollection = <
      item
        Column = 0
        Control = edtID
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = edtDESCRICAO
        Row = 1
      end
      item
        Column = 0
        Control = edtDTHR_INSERT
        Row = 2
      end
      item
        Column = 1
        Control = edtDTHR_UPDATE
        Row = 2
      end>
    RowCollection = <
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.333333333333340000
      end
      item
        Value = 33.333333333333310000
      end>
    ExplicitWidth = 518
    ExplicitHeight = 263
    object edtID: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 24
      Width = 245
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
      Top = 112
      Width = 506
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'DESCRICAO'
      DataSource = DataSource1
      TabOrder = 1
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
    object edtDTHR_INSERT: TDBLabeledEdit
      AlignWithMargins = True
      Left = 8
      Top = 200
      Width = 245
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
      TabOrder = 2
      EditLabel.Width = 91
      EditLabel.Height = 15
      EditLabel.Caption = 'Data do Cadastro'
      EditLabel.Layout = tlCenter
    end
    object edtDTHR_UPDATE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 269
      Top = 200
      Width = 245
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
      TabOrder = 3
      EditLabel.Width = 88
      EditLabel.Height = 15
      EditLabel.Caption = #218'ltima Altera'#231#227'o'
      EditLabel.Layout = tlCenter
    end
  end
  inherited pnlRodape: TPanel
    Top = 272
    Width = 522
    ExplicitTop = 271
    ExplicitWidth = 518
    inherited pnlBtnGravar: TPanel
      Left = 270
      Color = clWhite
      ExplicitLeft = 266
      inherited btnGravar: TSpeedButton
        ExplicitLeft = 337
        ExplicitTop = 21
      end
    end
    inherited pnlBtnCancelar1: TPanel
      Left = 396
      ExplicitLeft = 392
      inherited pnlBtnCancelar2: TPanel
        inherited btnCancelar: TSpeedButton
          ExplicitLeft = 473
          ExplicitTop = 21
          ExplicitHeight = 42
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelGruposDM.QGruposCadastro
    Left = 480
    Top = 160
  end
end
