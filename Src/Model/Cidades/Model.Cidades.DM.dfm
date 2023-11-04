object ModelCidadesDM: TModelCidadesDM
  OnCreate = DataModuleCreate
  Height = 162
  Width = 274
  object QCidadesCadastro: TFDQuery
    BeforePost = QCidadesCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from cidade')
    Left = 48
    Top = 8
    object QCidadesCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = ',0'
    end
    object QCidadesCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      OnSetText = QCidadesCadastroNOMESetText
      Size = 60
    end
    object QCidadesCadastroUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QCidadesCadastroCODIGO_IBGE: TIntegerField
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
    object QCidadesCadastroDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QCidadesCadastroDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QCidadesBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from cidade')
    Left = 184
    Top = 8
    object QCidadesBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0'
    end
    object QCidadesBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QCidadesBuscaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object QCidadesBuscaCODIGO_IBGE: TIntegerField
      DisplayLabel = 'C'#243'digo IBGE'
      FieldName = 'CODIGO_IBGE'
      Origin = 'CODIGO_IBGE'
    end
    object QCidadesBuscaDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QCidadesBuscaDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QLook: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select nome, uf'
      'from cidade'
      'where id = :IdCidade')
    Left = 48
    Top = 72
    ParamData = <
      item
        Name = 'IDCIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QLookNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object QLookUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
  end
end
