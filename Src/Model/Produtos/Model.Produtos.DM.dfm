object ModelProdutosDM: TModelProdutosDM
  OnCreate = DataModuleCreate
  Height = 82
  Width = 265
  object QProdutosCadastro: TFDQuery
    AfterInsert = QProdutosCadastroAfterInsert
    BeforePost = QProdutosCadastroBeforePost
    Connection = ModelConexaoDM.FDConnection1
    SQL.Strings = (
      'select * from produto')
    Left = 48
    Top = 8
    object QProdutosCadastroID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QProdutosCadastroID_GRUPO: TIntegerField
      DisplayLabel = 'C'#243'd. Grupo'
      FieldName = 'ID_GRUPO'
      Origin = 'ID_GRUPO'
      Required = True
    end
    object QProdutosCadastroID_SUBGRUPO: TIntegerField
      DisplayLabel = 'C'#243'd. Subgrupo'
      FieldName = 'ID_SUBGRUPO'
      Origin = 'ID_SUBGRUPO'
      Required = True
    end
    object QProdutosCadastroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      OnSetText = QProdutosCadastroNOMESetText
      Size = 100
    end
    object QProdutosCadastroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      OnSetText = QProdutosCadastroDESCRICAOSetText
      Size = 150
    end
    object QProdutosCadastroPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroPORCENTAGEM_VENDA: TFMTBCDField
      DisplayLabel = '% de Venda'
      FieldName = 'PORCENTAGEM_VENDA'
      Origin = 'PORCENTAGEM_VENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosCadastroUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object QProdutosCadastroCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      DisplayWidth = 13
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      OnSetText = QProdutosCadastroCODIGO_BARRASSetText
      EditMask = '9999999999999;;_'
      Size = 13
    end
    object QProdutosCadastroATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QProdutosCadastroDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
      ReadOnly = True
    end
    object QProdutosCadastroDTHR_UPDATE: TSQLTimeStampField
      DisplayLabel = #218'ltima Altera'#231#227'o'
      FieldName = 'DTHR_UPDATE'
      Origin = 'DTHR_UPDATE'
    end
  end
  object QProdutosBusca: TFDQuery
    Connection = ModelConexaoDM.FDConnection1
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'select p.id,'
      ' case p.ativo'
      '  when '#39'S'#39' then '#39'Sim'#39
      '  when '#39'N'#39' then '#39'N'#227'o'#39
      ' end as ativo, '
      ' p.nome, p.descricao produtodescricao, p.codigo_barras,'
      ' p.preco_custo, p.porcentagem_venda, p.preco_venda, p.unidade,'
      
        ' g.descricao grupodescricao, s.descricao subgrupodescricao, p.dt' +
        'hr_insert'
      'from produto p'
      ' join grupo g on g.id = p.id_grupo'
      ' join subgrupo s on s.id = id_subgrupo')
    Left = 168
    Top = 8
    object QProdutosBuscaID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QProdutosBuscaATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 3
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object QProdutosBuscaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object QProdutosBuscaPRODUTODESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PRODUTODESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object QProdutosBuscaCODIGO_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo de Barras'
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
    end
    object QProdutosBuscaPRECO_CUSTO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaPORCENTAGEM_VENDA: TFMTBCDField
      DisplayLabel = '% de Venda'
      FieldName = 'PORCENTAGEM_VENDA'
      Origin = 'PORCENTAGEM_VENDA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaPRECO_VENDA: TFMTBCDField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object QProdutosBuscaUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object QProdutosBuscaGRUPODESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Grupo Descri'#231#227'o'
      FieldName = 'GRUPODESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QProdutosBuscaSUBGRUPODESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Subgrupo Descri'#231#227'o'
      FieldName = 'SUBGRUPODESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QProdutosBuscaDTHR_INSERT: TSQLTimeStampField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTHR_INSERT'
      Origin = 'DTHR_INSERT'
    end
  end
end
