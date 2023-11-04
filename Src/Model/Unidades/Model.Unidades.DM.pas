unit Model.Unidades.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    QUnidadesCadastro: TFDQuery;
    QUnidadesCadastroID: TIntegerField;
    QUnidadesCadastroDESCRICAO: TStringField;
    QUnidadesCadastroDTHR_INSERT: TSQLTimeStampField;
    QUnidadesCadastroDTHR_UPDATE: TSQLTimeStampField;
    QUnidadesBusca: TFDQuery;
    QUnidadesBuscaID: TIntegerField;
    QUnidadesBuscaDTHR_INSERT: TSQLTimeStampField;
    QUnidadesBuscaDTHR_UPDATE: TSQLTimeStampField;
    QLook: TFDQuery;
    QLookDESCRICAO: TStringField;
    QUnidadesCadastroABREVIACAO: TStringField;
    QUnidadesBuscaABREVIACAO: TStringField;
    QUnidadesBuscaDESCRICAO: TStringField;
    procedure QUnidadesCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UnidadesBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdUnidade: integer);
    procedure ValidarDadosQueryCadastro;
    procedure LookUnidade(const AIdUnidade: integer);
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Conexao.DM, RTTI.FieldName, Exceptions.FieldName, Utils;

{$R *.dfm}

procedure TDataModule1.CadastrarGet(const AIdUnidade: integer);
begin
  QUnidadesCadastro.Close;
  QUnidadesCadastro.SQL.Text := 'select * from unidade ' +
    'where id = :pId';
  QUnidadesCadastro.ParamByName('pId').AsInteger := AIdUnidade;
  QUnidadesCadastro.Open;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  QUnidadesCadastro.FieldByName('ID').AutoGenerateValue := arDefault;
  QUnidadesBusca.FetchOptions.Mode := fmAll;
end;

procedure TDataModule1.LookUnidade(const AIdUnidade: integer);
begin
  QLook.Close;
  QLook.ParamByName('IdUnidade').AsInteger := AIdUnidade;
  QLook.Open;
end;

procedure TDataModule1.QUnidadesCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TDataModule1.UnidadesBuscar(const ACondicao: string);
begin
  QUnidadesBusca.Close;
  QUnidadesBusca.SQL.Text := 'select id, abreviacao, descricao ' +
    'from unidade ' + ACondicao;
  QUnidadesBusca.Open;
end;

procedure TDataModule1.ValidarDadosQueryCadastro;
begin
  if QUnidadesCadastroABREVIACAO.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Abreviação.', 'ABREVIACAO');

  if QUnidadesCadastroDESCRICAO.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Descrição.', 'DESCRICAO');
end;

end.
