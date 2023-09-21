inherited ViewCidadesBuscar: TViewCidadesBuscar
  Caption = 'Cidades buscar'
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited pnGrid: TPanel
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_IBGE'
          Width = 75
          Visible = True
        end>
    end
  end
  inherited pnRodape: TPanel
    inherited rdgFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'UF (F3)')
    end
    inherited pnlBtnFechar1: TPanel
      inherited pnlBtnFechar2: TPanel
        inherited btnFechar: TSpeedButton
          ExplicitLeft = 779
        end
      end
    end
    inherited pnlBtnUtilizar1: TPanel
      inherited pnlBtnUtilizar2: TPanel
        inherited btnUtilizar: TSpeedButton
          ExplicitLeft = 673
        end
      end
    end
    inherited pnlBtnAlterar1: TPanel
      inherited pnlBtnAlterar2: TPanel
        inherited btnAlterar: TSpeedButton
          ExplicitLeft = 567
        end
      end
    end
    inherited pnlBtnCadastrar1: TPanel
      inherited pnlBtnCadastrar2: TPanel
        inherited btnCadastrar: TSpeedButton
          ExplicitLeft = 461
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelCidadesDM.QCidadesBusca
  end
end
