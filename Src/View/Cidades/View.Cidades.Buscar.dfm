inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades buscar'
  OnDestroy = FormDestroy
  ExplicitWidth = 922
  ExplicitHeight = 583
  TextHeight = 15
  inherited GridPanel1: TGridPanel
    ExplicitWidth = 890
    ExplicitHeight = 528
    inherited pnlFiltroCombo: TPanel
      Visible = False
      ExplicitLeft = 671
      ExplicitWidth = 223
      inherited cmbFiltroCombo: TComboBox
        ExplicitWidth = 207
      end
    end
    inherited DBGrid1: TDBGrid
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
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTHR_UPDATE'
          Width = 130
          Visible = True
        end>
    end
    inherited rdgFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'UF')
    end
    inherited lbTotal: TLabel
      ExplicitLeft = 735
      ExplicitTop = 441
    end
    inherited pnlBtnCadastrar1: TPanel
      ExplicitLeft = 455
      ExplicitTop = 473
      inherited pnlBtnCadastrar2: TPanel
        Width = 90
        inherited btnCadastrar: TSpeedButton
          Width = 90
        end
      end
    end
    inherited pnlBtnUtilizar1: TPanel
      inherited pnlBtnUtilizar2: TPanel
        Width = 89
        inherited btnUtilizar: TSpeedButton
          Width = 89
        end
      end
    end
    inherited pnlBtnFechar1: TPanel
      ExplicitLeft = 790
      ExplicitTop = 473
      inherited pnlBtnFechar2: TPanel
        Width = 90
        inherited btnFechar: TSpeedButton
          Width = 90
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
