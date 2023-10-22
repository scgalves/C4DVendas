object ModelGruposDM: TModelGruposDM
  OnCreate = DataModuleCreate
  Height = 162
  Width = 274
  object QGruposCadastro: TFDQuery
    BeforePost = QGruposCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from grupo')
    Left = 48
    Top = 8
    object QGruposCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = ',0'
    end
    object QGruposCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QGruposCadastroDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QGruposCadastroDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QGruposBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select * from grupo')
    Left = 184
    Top = 8
    object QGruposBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = ',0'
    end
    object QGruposBuscaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QGruposBuscaDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QGruposBuscaDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QLook: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select descricao'
      'from grupo'
      'where id = :IdGrupo')
    Left = 48
    Top = 72
    ParamData = <
      item
        Name = 'IDGRUPO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QLookDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
end
