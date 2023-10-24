inherited ViewGruposBuscar: TViewGruposBuscar
  Caption = 'Grupos buscar'
  ClientWidth = 914
  OnDestroy = FormDestroy
  ExplicitHeight = 583
  TextHeight = 15
  inherited GridPanel1: TGridPanel
    Width = 898
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTHR_UPDATE'
          Width = 64
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
    inherited rdgFiltros: TRadioGroup
      Width = 436
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ExplicitTop = 0
      ExplicitWidth = 432
    end
    inherited pnlBtnFechar1: TPanel
      ExplicitLeft = 791
    end
    inherited pnlBtnUtilizar1: TPanel
      Left = 682
      Width = 97
      ExplicitLeft = 678
      ExplicitWidth = 97
      inherited pnlBtnUtilizar2: TPanel
        Width = 91
        ExplicitWidth = 91
      end
    end
    inherited pnlBtnAlterar1: TPanel
      Left = 571
      ExplicitLeft = 567
    end
    inherited pnlBtnCadastrar1: TPanel
      Left = 460
      ExplicitLeft = 456
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelGruposDM.QGruposBusca
  end
end
