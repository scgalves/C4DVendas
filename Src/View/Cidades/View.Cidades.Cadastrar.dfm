inherited ViewCidadesCadastrar: TViewCidadesCadastrar
  Caption = 'Cidades cadastrar/alterar'
  ClientHeight = 331
  ClientWidth = 534
  OnShow = FormShow
  ExplicitWidth = 546
  ExplicitHeight = 369
  TextHeight = 15
  inherited pnlDados: TGridPanel
    Width = 518
    Height = 263
    ControlCollection = <
      item
        Column = 0
        Control = edtID
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = edtNOME
        Row = 1
      end
      item
        Column = 0
        Control = pnlUf
        Row = 2
      end
      item
        Column = 1
        Control = edtCODIGO_IBGE
        Row = 2
      end
      item
        Column = 0
        Control = edtDTHR_INSERT
        Row = 3
      end
      item
        Column = 1
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
      Width = 243
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
      Left = 8
      Top = 90
      Width = 502
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'NOME'
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
    object pnlUf: TPanel
      Left = 0
      Top = 132
      Width = 259
      Height = 65
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object lblUf: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 243
        Height = 15
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 15
      end
      object cmbUf: TDBComboBox
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 243
        Height = 22
        Margins.Left = 8
        Margins.Top = 1
        Margins.Right = 8
        Margins.Bottom = 0
        Style = csOwnerDrawFixed
        Align = alTop
        DataField = 'UF'
        DataSource = DataSource1
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO'
          'EX')
        TabOrder = 0
      end
    end
    object edtCODIGO_IBGE: TDBLabeledEdit
      AlignWithMargins = True
      Left = 267
      Top = 156
      Width = 243
      Height = 23
      Margins.Left = 8
      Margins.Top = 24
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alTop
      DataField = 'CODIGO_IBGE'
      DataSource = DataSource1
      TabOrder = 3
      EditLabel.Width = 66
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo IBGE'
      EditLabel.Layout = tlCenter
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
      Color = clWhite
      ExplicitLeft = 262
      inherited btnGravar: TSpeedButton
        ExplicitLeft = 337
        ExplicitTop = 21
      end
    end
    inherited pnlBtnCancelar1: TPanel
      Left = 392
      ExplicitLeft = 388
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
    DataSet = ModelCidadesDM.QCidadesCadastro
    Left = 480
    Top = 160
  end
end
