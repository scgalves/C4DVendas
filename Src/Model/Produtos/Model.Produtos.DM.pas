unit Model.Produtos.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TModelProdutosDM = class(TDataModule)
    QProdutosCadastro: TFDQuery;
    QProdutosBusca: TFDQuery;
    QProdutosBuscaID: TIntegerField;
    QProdutosBuscaDTHR_INSERT: TSQLTimeStampField;
    QProdutosBuscaGRUPODESCRICAO: TStringField;
    QProdutosBuscaSUBGRUPODESCRICAO: TStringField;
    QProdutosBuscaNOME: TStringField;
    QProdutosBuscaPRECO_CUSTO: TFMTBCDField;
    QProdutosBuscaPORCENTAGEM_VENDA: TFMTBCDField;
    QProdutosBuscaPRECO_VENDA: TFMTBCDField;
    QProdutosBuscaCODIGO_BARRAS: TStringField;
    QProdutosBuscaATIVO: TStringField;
    QProdutosBuscaPRODUTODESCRICAO: TStringField;
    QProdutosBuscaUNIDADE: TStringField;
    QProdutosCadastroID: TIntegerField;
    QProdutosCadastroID_GRUPO: TIntegerField;
    QProdutosCadastroID_SUBGRUPO: TIntegerField;
    QProdutosCadastroNOME: TStringField;
    QProdutosCadastroDESCRICAO: TStringField;
    QProdutosCadastroPRECO_CUSTO: TFMTBCDField;
    QProdutosCadastroPORCENTAGEM_VENDA: TFMTBCDField;
    QProdutosCadastroPRECO_VENDA: TFMTBCDField;
    QProdutosCadastroUNIDADE: TStringField;
    QProdutosCadastroCODIGO_BARRAS: TStringField;
    QProdutosCadastroATIVO: TStringField;
    QProdutosCadastroDTHR_INSERT: TSQLTimeStampField;
    QProdutosCadastroDTHR_UPDATE: TSQLTimeStampField;
    procedure QProdutosCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QProdutosCadastroAfterInsert(DataSet: TDataSet);
    procedure QProdutosCadastroCODIGO_BARRASSetText(Sender: TField; const Text: string);
    procedure QProdutosCadastroNOMESetText(Sender: TField; const Text: string);
    procedure QProdutosCadastroDESCRICAOSetText(Sender: TField; const Text: string);
  private
  public
    procedure ProdutosBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdProduto: integer);
    procedure ValidarDadosQueryCadastro;
  end;

var
  ModelProdutosDM: TModelProdutosDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Conexao.DM, RTTI.FieldName, Exceptions.FieldName, Utils;

{$R *.dfm}

{ TModelProdutosDM }

procedure TModelProdutosDM.CadastrarGet(const AIdProduto: integer);
begin
  QProdutosCadastro.Close;
  QProdutosCadastro.SQL.Text := 'select * from produto ' +
    'where id = :pId';
  QProdutosCadastro.ParamByName('pId').AsInteger := AIdProduto;
  QProdutosCadastro.Open;
end;

procedure TModelProdutosDM.DataModuleCreate(Sender: TObject);
begin
  QProdutosCadastro.FieldByName('ID').AutoGenerateValue := arDefault;
  QProdutosBusca.FetchOptions.Mode := fmAll;
end;

procedure TModelProdutosDM.ProdutosBuscar(const ACondicao: string);
begin
  QProdutosBusca.Close;
  QProdutosBusca.SQL.Text := 'select p.id,' +
    ' case p.ativo' +
    '  when ''S'' then ''Sim'''+
    '  when ''N'' then ''Não'''+
    ' end as ativo, p.nome, p.descricao produtodescricao, p.codigo_barras,' +
    ' p.preco_custo, p.porcentagem_venda, p.preco_venda, p.unidade, g.descricao grupodescricao,' +
    ' s.descricao subgrupodescricao, p.dthr_insert ' +
    'from produto p' +
    ' join grupo g on g.id = p.id_grupo' +
    ' join subgrupo s on s.id = id_subgrupo ' + ACondicao;
  QProdutosBusca.Open;
end;

procedure TModelProdutosDM.QProdutosCadastroAfterInsert(DataSet: TDataSet);
begin
  QProdutosCadastroATIVO.AsString := 'S';
end;

procedure TModelProdutosDM.QProdutosCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelProdutosDM.QProdutosCadastroCODIGO_BARRASSetText(Sender: TField; const Text: string);
begin
  QProdutosCadastroCODIGO_BARRAS.AsString := QProdutosCadastroCODIGO_BARRAS.AsString.Trim;
end;

procedure TModelProdutosDM.QProdutosCadastroDESCRICAOSetText(Sender: TField; const Text: string);
begin
  QProdutosCadastroDESCRICAO.AsString := QProdutosCadastroDESCRICAO.AsString.Trim;
end;

procedure TModelProdutosDM.QProdutosCadastroNOMESetText(Sender: TField; const Text: string);
begin
  QProdutosCadastroNOME.AsString := QProdutosCadastroNOME.AsString.Trim;
end;

procedure TModelProdutosDM.ValidarDadosQueryCadastro;
begin
  if QProdutosCadastroID_GRUPO.AsInteger <= 0 then
    raise ExceptionsFieldName.Create('O campo Código do Grupo não foi preenchido.', 'ID_GRUPO');

  if QProdutosCadastroID_SUBGRUPO.AsInteger <= 0 then
    raise ExceptionsFieldName.Create('O campo Código do Subgrupo não foi preenchido.', 'ID_SUBGRUPO');

  if QProdutosCadastroNOME.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Nome.', 'NOME');

  if Length(QProdutosCadastroNOME.AsString.Trim) < 4 then
    raise ExceptionsFieldName.Create('O Nome deve ter no mínimo 3 caracteres.', 'NOME');

  if QProdutosCadastroPRECO_CUSTO.AsInteger = 0 then
    raise ExceptionsFieldName.Create('Preencha o campo Preço de Custo.', 'PRECO_CUSTO');

  if QProdutosCadastroPRECO_CUSTO.AsInteger < 0 then
    raise ExceptionsFieldName.Create('O campo Preço de Custo não pode ter valor menor do que 0.', 'PRECO_CUSTO');

  if QProdutosCadastroPORCENTAGEM_VENDA.AsInteger = 0 then
    raise ExceptionsFieldName.Create('Preencha o campo % de Venda.', 'PORCENTAGEM_VENDA');

  if QProdutosCadastroPRECO_VENDA.AsInteger = 0 then
    raise ExceptionsFieldName.Create('Preencha o campo Preço de Venda.', 'PRECO_VENDA');

  if QProdutosCadastroPRECO_VENDA.AsInteger < 0 then
    raise ExceptionsFieldName.Create('O Preço de Venda não pode ter valor menor do que 0.', 'PRECO_VENDA');

  if QProdutosCadastroUNIDADE.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Unidade.', 'UNIDADE');

  if (Length(QProdutosCadastroCODIGO_BARRAS.AsString.Trim) > 0) and
    (Length(QProdutosCadastroCODIGO_BARRAS.AsString.Trim) <> 13) then
    raise ExceptionsFieldName.Create('O Código de Barras deve ter 13 caracteres.', 'CODIGO_BARRAS');

end;

end.
