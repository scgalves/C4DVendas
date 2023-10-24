object ModelSubgruposDM: TModelSubgruposDM
  OnCreate = DataModuleCreate
  Height = 82
  Width = 265
  object QSubgruposCadastro: TFDQuery
    BeforePost = QSubgruposCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from subgrupo')
    Left = 48
    Top = 8
    object QSubgruposCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSubgruposCadastroID_GRUPO: TIntegerField
      DisplayLabel = 'C'#243'digo Grupo'
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
    end
    object QSubgruposCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QSubgruposCadastroDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QSubgruposCadastroDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QSubgruposBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      
        'select s.id, s.descricao subgrupodescricao, s.id_grupo, g.descri' +
        'cao grupodescricao, '
      ' s.dthr_insert, s.dthr_update'
      'from subgrupo s'
      'join grupo g on g.id = s.id_grupo')
    Left = 168
    Top = 8
    object QSubgruposBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QSubgruposBuscaID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
    end
    object QSubgruposBuscaSUBGRUPODESCRICAO: TStringField
      DisplayLabel = 'Subgrupo Descri'#231#227'o'
      FieldName = 'SUBGRUPODESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QSubgruposBuscaGRUPODESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Grupo Descri'#231#227'o'
      FieldName = 'GRUPODESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QSubgruposBuscaDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QSubgruposBuscaDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Atualiza'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
end
