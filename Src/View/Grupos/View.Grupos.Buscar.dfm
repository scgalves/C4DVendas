inherited ViewGruposBuscar: TViewGruposBuscar
  Caption = 'Grupos buscar'
  ClientWidth = 914
  OnDestroy = FormDestroy
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
    inherited rdgFiltros: TRadioGroup
      Width = 433
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ExplicitTop = 467
      ExplicitWidth = 433
    end
    inherited lbTotal: TLabel
      Left = 673
      Width = 217
    end
    inherited pnlBtnCadastrar1: TPanel
      Left = 457
      inherited pnlBtnCadastrar2: TPanel
        Width = 90
      end
    end
    inherited pnlBtnAlterar1: TPanel
      Left = 569
    end
    inherited pnlBtnUtilizar1: TPanel
      Left = 681
      Width = 97
      inherited pnlBtnUtilizar2: TPanel
        ExplicitWidth = 91
      end
    end
    inherited pnlBtnFechar1: TPanel
      Left = 794
      inherited pnlBtnFechar2: TPanel
        Width = 90
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelGruposDM.QGruposBusca
  end
end
