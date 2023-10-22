object ModelPessoasDM: TModelPessoasDM
  OnCreate = DataModuleCreate
  Height = 82
  Width = 265
  object QPessoasCadastro: TFDQuery
    AfterOpen = QPessoasCadastroAfterOpen
    AfterInsert = QPessoasCadastroAfterInsert
    BeforePost = QPessoasCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from pessoa')
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
    object QPessoasCadastroFANTASIA_APELIDO: TStringField
      DisplayLabel = 'Nome de Fantasia/Apelido'
      FieldName = 'FANTASIA_APELIDO'
      Origin = 'FANTASIA_APELIDO'
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
    object QPessoasCadastroLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 60
    end
    object QPessoasCadastroNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object QPessoasCadastroCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 40
    end
    object QPessoasCadastroBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
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
    object QPessoasCadastroTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(99\)\ 9999-9999;0;_'
      Size = 15
    end
    object QPessoasCadastroCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      EditMask = '!\(99\)\ 99999-9999;0;_'
      Size = 15
    end
    object QPessoasCadastroEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object QPessoasCadastroTIPO_JURIDICO: TSmallintField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'TIPO_JURIDICO'
      Origin = 'TIPO_JURIDICO'
    end
    object QPessoasCadastroCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 14
    end
    object QPessoasCadastroRG_IE: TStringField
      DisplayLabel = 'RG/Inscri'#231#227'o Estadual'
      FieldName = 'RG_IE'
      Origin = 'RG_IE'
      Size = 14
    end
    object QPessoasCadastroATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object QPessoasCadastroDT_NASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'DT_NASCIMENTO'
      Origin = 'DT_NASCIMENTO'
      OnSetText = QPessoasCadastroDT_NASCIMENTOSetText
      EditMask = '!99/99/9999;1;_'
    end
    object QPessoasCadastroDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QPessoasCadastroDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QPessoasBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select p.id,'
      ' case p.ativo'
      '  when '#39'S'#39' then '#39'Sim'#39
      '  when '#39'N'#39' then '#39'N'#227'o'#39
      ' end as ativo,'
      ' case p.tipo_juridico'
      '  when 0 then '#39'F'#237'sica'#39' '
      '  when 1 then '#39'Jur'#237'dica'#39
      ' end as tipo_pessoa,'
      ' case p.cliente'
      '  when '#39'S'#39' then '#39'Sim'#39
      '  when '#39'N'#39' then '#39'N'#227'o'#39
      ' end as cliente,'
      ' case p.fornecedor'
      '  when '#39'S'#39' then '#39'Sim'#39
      '  when '#39'N'#39' then '#39'N'#227'o'#39
      '  end as fornecedor,'
      ' p.nome, p.fantasia_apelido, '
      
        ' p.id_cidade, c.nome cidadenome, c.uf, p.logradouro, p.telefone,' +
        ' p.celular,'
      ' p.dthr_insert'
      'from pessoa p'
      'join cidade c on c.id = p.id_cidade')
    Left = 168
    Top = 8
    object QPessoasBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QPessoasBuscaATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QPessoasBuscaTIPO_PESSOA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
    object QPessoasBuscaCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      FixedChar = True
      Size = 3
    end
    object QPessoasBuscaFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      FixedChar = True
      Size = 3
    end
    object QPessoasBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QPessoasBuscaFANTASIA_APELIDO: TStringField
      DisplayLabel = 'Nome de Fantasia/Apelido'
      FieldName = 'FANTASIA_APELIDO'
      Origin = 'FANTASIA_APELIDO'
      Size = 60
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
    object QPessoasBuscaLOGRADOURO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 60
    end
    object QPessoasBuscaTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(99\)\ 9999-9999;0;_'
      Size = 15
    end
    object QPessoasBuscaCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      EditMask = '!\(99\)\ 99999-9999;0;_'
      Size = 15
    end
    object QPessoasBuscaDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
  end
end
