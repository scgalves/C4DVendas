inherited ViewCidadesCadastrar: TViewCidadesCadastrar
  Caption = 'Cidades cadastrar/alterar'
  ClientHeight = 332
  ClientWidth = 538
  OnShow = FormShow
  ExplicitWidth = 550
  ExplicitHeight = 370
  TextHeight = 15
  inherited pnlDados: TPanel
    Width = 522
    Height = 264
    ExplicitWidth = 518
    ExplicitHeight = 263
    object GridPanel1: TGridPanel
      Left = 8
      Top = 8
      Width = 506
      Height = 248
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = pnlUf
          Row = 2
        end
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
          Control = edtCODIGO_IBGE
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
      TabOrder = 0
      ExplicitWidth = 502
      ExplicitHeight = 247
      object pnlUf: TPanel
        Left = 0
        Top = 124
        Width = 253
        Height = 62
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object lblUf: TLabel
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 237
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
          Width = 237
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
      object edtID: TDBLabeledEdit
        AlignWithMargins = True
        Left = 8
        Top = 24
        Width = 237
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
        Top = 86
        Width = 490
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
      object edtCODIGO_IBGE: TDBLabeledEdit
        AlignWithMargins = True
        Left = 8
        Top = 210
        Width = 237
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
    DataSet = ModelCidadesDM.QCidadesCadastro
    Left = 480
    Top = 160
  end
end
