unit Model.Subgrupos.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TModelSubgruposDM = class(TDataModule)
    QSubgruposCadastro: TFDQuery;
    QSubgruposBusca: TFDQuery;
    QSubgruposCadastroID: TIntegerField;
    QSubgruposBuscaID: TIntegerField;
    QSubgruposCadastroDTHR_INSERT: TSQLTimeStampField;
    QSubgruposCadastroDTHR_UPDATE: TSQLTimeStampField;
    QSubgruposBuscaDTHR_INSERT: TSQLTimeStampField;
    QSubgruposCadastroID_GRUPO: TIntegerField;
    QSubgruposCadastroDESCRICAO: TStringField;
    QSubgruposBuscaID_GRUPO: TIntegerField;
    QSubgruposBuscaGRUPODESCRICAO: TStringField;
    QSubgruposBuscaSUBGRUPODESCRICAO: TStringField;
    QSubgruposBuscaDTHR_UPDATE: TSQLTimeStampField;
    procedure QSubgruposCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    procedure SubgruposBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdSubgrupo: integer);
    procedure ValidarDadosQueryCadastro;
  end;

var
  ModelSubgruposDM: TModelSubgruposDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Conexao.DM, RTTI.FieldName, Exceptions.FieldName, Utils;

{$R *.dfm}

{ TModelPessoasDM }

procedure TModelSubgruposDM.CadastrarGet(const AIdSubgrupo: integer);
begin
  QSubgruposCadastro.Close;
  QSubgruposCadastro.SQL.Text := 'select * from subgrupo ' +
    'where id = :pId';
  QSubgruposCadastro.ParamByName('pId').AsInteger := AIdSubgrupo;
  QSubgruposCadastro.Open;
end;

procedure TModelSubgruposDM.DataModuleCreate(Sender: TObject);
begin
  QSubgruposCadastro.FieldByName('ID').AutoGenerateValue := arDefault;
  QSubgruposBusca.FetchOptions.Mode := fmAll;
end;

procedure TModelSubgruposDM.SubgruposBuscar(const ACondicao: string);
begin
  QSubgruposBusca.Close;
  QSubgruposBusca.SQL.Text := 'select s.id, s.descricao subgrupodescricao, s.id_grupo, g.descricao grupodescricao,' +
    ' s.dthr_insert, s.dthr_update ' +
    'from subgrupo s' +
    ' join grupo g on g.id = s.id_grupo ' + ACondicao;
  QSubgruposBusca.Open;
end;

procedure TModelSubgruposDM.QSubgruposCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelSubgruposDM.ValidarDadosQueryCadastro;
begin
  if QSubgruposCadastroDESCRICAO.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Descrição.', 'DESCRICAO');
end;

end.
