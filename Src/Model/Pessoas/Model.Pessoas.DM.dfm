object ModelPessoasDM: TModelPessoasDM
  OnCreate = DataModuleCreate
  Height = 82
  Width = 265
  object QPessoasCadastro: TFDQuery
    AfterInsert = QPessoasCadastroAfterInsert
    BeforePost = QPessoasCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from pessoas')
    Left = 48
    Top = 8
    object QPessoasCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QPessoasCadastroNOME: TStringField
      DisplayLabel = 'Nome/Raz'#227'o Social'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasCadastroFANTASIA: TStringField
      DisplayLabel = 'Nome de Fantasia'
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 60
    end
    object QPessoasCadastroCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '00000\-999;0;_'
      Size = 10
    end
    object QPessoasCadastroID_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo Cidade'
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      Required = True
    end
    object QPessoasCadastroENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QPessoasCadastroNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object QPessoasCadastroBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object QPessoasCadastroCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object QPessoasCadastroTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(99\)\ 9000-0000;0;_'
      Size = 15
    end
    object QPessoasCadastroCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      EditMask = '!\(99\)\ 0000-0000;0;_'
      Size = 15
    end
    object QPessoasCadastroEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object QPessoasCadastroTIPO_JURIDICO: TSmallintField
      DisplayLabel = 'Tipo Jur'#237'dico'
      FieldName = 'TIPO_JURIDICO'
      Origin = 'TIPO_JURIDICO'
    end
    object QPessoasCadastroCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '000\.000\.000\-00;0;_'
      Size = 14
    end
    object QPessoasCadastroRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Size = 14
    end
    object QPessoasCadastroCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      EditMask = '00\.000\.000\/0000\-00;0;_'
      Size = 18
    end
    object QPessoasCadastroIE: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'IE'
      Origin = 'IE'
      Size = 14
    end
    object QPessoasCadastroATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroNASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'NASCIMENTO'
      Origin = 'NASCIMENTO'
      OnSetText = QPessoasCadastroNASCIMENTOSetText
      EditMask = '!99/99/0000;1;_'
    end
    object QPessoasCadastroDH_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data e Hora Cadastro'
      FieldName = 'DH_CADASTRO'
      Origin = 'DH_CADASTRO'
    end
  end
  object QPessoasBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select p.id, p.nome, p.fantasia, p.cliente, p.fornecedor, p.id_c' +
        'idade, c.nome cidadenome, c.uf, p.endereco, p.telefone, p.celula' +
        'r'
      'from pessoas p'
      'join cidades c on c.id = p.id_cidade')
    Left = 168
    Top = 8
    object QPessoasBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPessoasBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasBuscaFANTASIA: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 60
    end
    object QPessoasBuscaCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscaFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 1
    end
    object QPessoasBuscaID_CIDADE: TIntegerField
      DisplayLabel = 'C'#243'd. cidade'
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      Required = True
    end
    object QPessoasBuscaCIDADENOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADENOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QPessoasBuscaUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object QPessoasBuscaENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QPessoasBuscaTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object QPessoasBuscaCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
  end
end
