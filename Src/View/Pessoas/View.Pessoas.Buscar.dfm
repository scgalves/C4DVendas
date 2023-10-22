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
    Height = 531
    ExplicitWidth = 898
    ExplicitHeight = 530
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
        Caption = 'Cadastro'
        ExplicitWidth = 47
      end
      inherited cmbFiltroCombo: TComboBox
        ItemIndex = 0
        Text = 'Ativo e Inativo'
        OnChange = cmbFiltroComboChange
        Items.Strings = (
          'Ativo e Inativo'
          'Ativo'
          'Inativo')
        ExplicitWidth = 215
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
    inherited rdgFiltros: TRadioGroup
      Top = 468
      Width = 435
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome/Fantasia'
        'Cidade')
      ExplicitTop = 468
      ExplicitWidth = 435
    end
    inherited lbTotal: TLabel
      Left = 676
      Top = 443
      Width = 218
    end
    inherited pnlBtnCadastrar1: TPanel
      Left = 459
      Top = 475
      Width = 97
      ExplicitLeft = 459
      ExplicitTop = 475
      ExplicitWidth = 97
      inherited pnlBtnCadastrar2: TPanel
        ExplicitWidth = 91
      end
    end
    inherited pnlBtnAlterar1: TPanel
      Left = 572
      Top = 475
      ExplicitLeft = 572
      ExplicitTop = 475
    end
    inherited pnlBtnUtilizar1: TPanel
      Left = 684
      Top = 475
      ExplicitLeft = 684
      ExplicitTop = 475
      inherited pnlBtnUtilizar2: TPanel
        ExplicitWidth = 91
      end
    end
    inherited pnlBtnFechar1: TPanel
      Left = 797
      Top = 475
      Width = 97
      ExplicitLeft = 797
      ExplicitTop = 475
      ExplicitWidth = 97
      inherited pnlBtnFechar2: TPanel
        ExplicitWidth = 91
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = ModelPessoasDM.QPessoasBusca
  end
end
