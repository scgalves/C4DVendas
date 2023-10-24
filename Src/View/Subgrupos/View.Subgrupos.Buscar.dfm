inherited ViewSubgruposBuscar: TViewSubgruposBuscar
  Caption = 'Subgrupos buscar'
  ClientHeight = 547
  ClientWidth = 918
  OnDestroy = FormDestroy
  ExplicitWidth = 930
  ExplicitHeight = 585
  TextHeight = 15
  inherited GridPanel1: TGridPanel
    Width = 902
    Height = 468
    ExplicitWidth = 898
    ExplicitHeight = 467
    inherited edtBuscar: TLabeledEdit
      Width = 660
      ExplicitWidth = 660
    end
    inherited pnlFiltroCombo: TPanel
      Left = 676
      Width = 226
      Visible = False
      ExplicitLeft = 676
      ExplicitWidth = 226
      inherited lblFiltroCombo: TLabel
        Width = 210
        Caption = 'Cadastro'
        ExplicitWidth = 47
      end
      inherited cmbFiltroCombo: TComboBox
        Width = 210
        ItemIndex = 0
        Text = 'Ativo e Inativo'
        Items.Strings = (
          'Ativo e Inativo'
          'Ativo'
          'Inativo')
        ExplicitWidth = 210
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 886
      Height = 380
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_GRUPO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SUBGRUPODESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPODESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTHR_INSERT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTHR_UPDATE'
          Visible = True
        end>
    end
    inherited lbTotal: TLabel
      Left = 676
      Top = 443
      Width = 218
      ExplicitLeft = 747
      ExplicitTop = 443
    end
  end
  inherited pnlRodape: TPanel
    Top = 476
    Width = 902
    inherited rdgFiltros: TRadioGroup
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
    end
    inherited pnlBtnFechar1: TPanel
      Left = 797
      Width = 97
      ExplicitLeft = 793
      ExplicitWidth = 97
      inherited pnlBtnFechar2: TPanel
        Width = 91
        ExplicitWidth = 91
        inherited btnFechar: TSpeedButton
          Width = 91
          ExplicitWidth = 91
        end
      end
    end
    inherited pnlBtnUtilizar1: TPanel
      Left = 686
      ExplicitLeft = 682
    end
    inherited pnlBtnAlterar1: TPanel
      Left = 575
      ExplicitLeft = 571
    end
    inherited pnlBtnCadastrar1: TPanel
      Width = 97
      ExplicitWidth = 97
      inherited pnlBtnCadastrar2: TPanel
        Width = 91
        ExplicitWidth = 91
        inherited btnCadastrar: TSpeedButton
          Width = 91
          ExplicitWidth = 91
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelSubgruposDM.QSubgruposBusca
  end
end
