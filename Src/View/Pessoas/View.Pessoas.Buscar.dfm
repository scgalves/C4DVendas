inherited ViewPessoasBuscar: TViewPessoasBuscar
  Caption = 'Pessoas buscar'
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
      Height = 380
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
          FieldName = 'TIPO_PESSOA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA_APELIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CIDADE'
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
          FieldName = 'LOGRADOURO'
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
        end
        item
          Expanded = False
          FieldName = 'DTHR_INSERT'
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
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo (F1)'
        'Nome/Fantasia (F2)'
        'Cidade (F3)')
      ExplicitTop = 0
      ExplicitWidth = 434
    end
    inherited pnlBtnFechar1: TPanel
      Left = 797
      Width = 97
      ExplicitLeft = 793
      ExplicitWidth = 97
      inherited pnlBtnFechar2: TPanel
        Width = 91
        ExplicitWidth = 91
      end
    end
    inherited pnlBtnUtilizar1: TPanel
      Left = 686
    end
    inherited pnlBtnAlterar1: TPanel
      Left = 575
      ExplicitLeft = 571
    end
    inherited pnlBtnCadastrar1: TPanel
      Width = 97
      ExplicitLeft = 458
      ExplicitWidth = 97
      inherited pnlBtnCadastrar2: TPanel
        Width = 91
        ExplicitWidth = 91
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
