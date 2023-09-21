inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'Pessoas buscar'
  OnDestroy = FormDestroy
  TextHeight = 15
  inherited pnTopo: TPanel
    ExplicitWidth = 887
    inherited lblPesquisarPor: TLabel
      ExplicitLeft = 8
      ExplicitTop = 8
    end
  end
  inherited pnGrid: TPanel
    ExplicitWidth = 887
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
          FieldName = 'FANTASIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CIDADE'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADENOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULAR'
          Visible = True
        end>
    end
    inherited pnTotal: TPanel
      inherited lbTotal: TLabel
        ExplicitLeft = 732
        ExplicitTop = 0
      end
    end
  end
  inherited pnRodape: TPanel
    ExplicitWidth = 887
    inherited rdgFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome / Fantasia (F2)   '
        'Cidade (F3)')
      ExplicitLeft = 16
      ExplicitTop = 1
      ExplicitWidth = 430
      ExplicitHeight = 54
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
