inherited ViewGruposBuscar: TViewGruposBuscar
  Caption = 'Grupos buscar'
  ClientWidth = 914
  OnDestroy = FormDestroy
  ExplicitHeight = 583
  TextHeight = 15
  inherited GridPanel1: TGridPanel
    Width = 898
    ExplicitHeight = 465
    inherited edtBuscar: TLabeledEdit
      Width = 657
    end
    inherited pnlFiltroCombo: TPanel
      Left = 673
      Width = 225
      Visible = False
      inherited lblFiltroCombo: TLabel
        Width = 209
      end
      inherited cmbFiltroCombo: TComboBox
        Width = 209
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 882
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
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
      Left = 673
      Width = 217
      ExplicitTop = 441
    end
  end
  inherited pnlRodape: TPanel
    Width = 898
    ExplicitTop = 473
    ExplicitWidth = 894
    inherited rdgFiltros: TRadioGroup
      Width = 436
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Descri'#231#227'o (F2)')
      ExplicitTop = 0
      ExplicitWidth = 432
      ExplicitHeight = 55
    end
    inherited pnlBtnFechar1: TPanel
      ExplicitLeft = 791
      ExplicitHeight = 47
      inherited pnlBtnFechar2: TPanel
        ExplicitWidth = 89
        ExplicitHeight = 41
      end
    end
    inherited pnlBtnUtilizar1: TPanel
      Left = 682
      Width = 97
      ExplicitLeft = 678
      ExplicitWidth = 97
      ExplicitHeight = 47
      inherited pnlBtnUtilizar2: TPanel
        Width = 91
        ExplicitWidth = 91
        ExplicitHeight = 41
        inherited btnUtilizar: TSpeedButton
          Width = 91
        end
      end
    end
    inherited pnlBtnAlterar1: TPanel
      Left = 571
      ExplicitLeft = 567
      ExplicitHeight = 47
      inherited pnlBtnAlterar2: TPanel
        ExplicitWidth = 89
        ExplicitHeight = 41
      end
    end
    inherited pnlBtnCadastrar1: TPanel
      Left = 460
      ExplicitLeft = 456
      ExplicitHeight = 47
      inherited pnlBtnCadastrar2: TPanel
        ExplicitWidth = 89
        ExplicitHeight = 41
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelGruposDM.QGruposBusca
  end
end
