inherited ViewProdutosBuscar: TViewProdutosBuscar
  Caption = 'Produtos buscar'
  ClientHeight = 547
  ClientWidth = 918
  OnDestroy = FormDestroy
  ExplicitWidth = 930
  ExplicitHeight = 585
  TextHeight = 15
  inherited GridPanel1: TGridPanel
    Width = 902
    Height = 462
    ExplicitHeight = 461
    inherited edtBuscar: TLabeledEdit
      Width = 660
      ExplicitWidth = 660
    end
    inherited pnlFiltroCombo: TPanel
      Left = 676
      Width = 226
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
        OnChange = cmbFiltroComboChange
        Items.Strings = (
          'Ativo e Inativo'
          'Ativo'
          'Inativo')
        ExplicitWidth = 210
      end
    end
    inherited DBGrid1: TDBGrid
      Width = 886
      Height = 375
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTODESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_BARRAS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAGEM_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPODESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUBGRUPODESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTHR_INSERT'
          Visible = True
        end>
    end
    inherited lbTotal: TLabel
      Left = 676
      Top = 437
      Width = 218
      ExplicitLeft = 747
      ExplicitTop = 437
    end
  end
  inherited pnlRodape: TPanel
    Top = 470
    Width = 902
    inherited rdgFiltros: TRadioGroup
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome (F2)'
        'Produto Descr. (F3)'
        'C'#243'd. de Barras (F4)'
        'Grupo Descr. (F5)'
        'Subgrupo Descr. (F6)')
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
    DataSet = ModelProdutosDM.QProdutosBusca
  end
end
