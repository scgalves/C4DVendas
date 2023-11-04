inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades buscar'
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
          FieldName = 'NOME'
          Width = 420
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_IBGE'
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
    ExplicitLeft = -328
    ExplicitTop = 330
    inherited rdgFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'UF (F3)')
      ExplicitTop = 0
      ExplicitWidth = 434
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
      ExplicitLeft = 680
      ExplicitHeight = 47
      inherited pnlBtnUtilizar2: TPanel
        ExplicitHeight = 41
        inherited btnUtilizar: TSpeedButton
          ExplicitWidth = 89
        end
      end
    end
    inherited pnlBtnAlterar1: TPanel
      ExplicitLeft = 569
      ExplicitHeight = 47
      inherited pnlBtnAlterar2: TPanel
        ExplicitWidth = 89
        ExplicitHeight = 41
      end
    end
    inherited pnlBtnCadastrar1: TPanel
      ExplicitLeft = 458
      ExplicitHeight = 47
      inherited pnlBtnCadastrar2: TPanel
        ExplicitWidth = 89
        ExplicitHeight = 41
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
