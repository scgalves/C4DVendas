object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 133
  Width = 266
  object QUnidadesCadastro: TFDQuery
    BeforePost = QUnidadesCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from unidade')
    Left = 48
    Top = 8
    object QUnidadesCadastroID: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QUnidadesCadastroABREVIACAO: TStringField
      DisplayLabel = 'Abrevia'#231#227'o'
      FieldName = 'ABREVIACAO'
      Origin = 'ABREVIACAO'
      Required = True
      Size = 3
    end
    object QUnidadesCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QUnidadesCadastroDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QUnidadesCadastroDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QUnidadesBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select id, abreviacao, descricao, dthr_insert, dthr_update'
      'from unidade')
    Left = 168
    Top = 8
    object QUnidadesBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QUnidadesBuscaABREVIACAO: TStringField
      DisplayLabel = 'Abrevia'#231#227'o'
      FieldName = 'ABREVIACAO'
      Origin = 'ABREVIACAO'
      Required = True
      Size = 3
    end
    object QUnidadesBuscaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 10
    end
    object QUnidadesBuscaDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
    object QUnidadesBuscaDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Atualiza'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QLook: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select descricao'
      'from unidade'
      'where id = :IdUnidade')
    Left = 48
    Top = 72
    ParamData = <
      item
        Name = 'IDUNIDADE'
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
