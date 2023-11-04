unit Model.Grupos.DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.RTTI, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TModelGruposDM = class(TDataModule)
    QGruposCadastro: TFDQuery;
    QGruposBusca: TFDQuery;
    QGruposCadastroID: TIntegerField;
    QGruposBuscaID: TIntegerField;
    QLook: TFDQuery;
    QGruposCadastroDTHR_INSERT: TSQLTimeStampField;
    QGruposCadastroDTHR_UPDATE: TSQLTimeStampField;
    QGruposBuscaDTHR_INSERT: TSQLTimeStampField;
    QGruposBuscaDTHR_UPDATE: TSQLTimeStampField;
    QGruposCadastroDESCRICAO: TStringField;
    QGruposBuscaDESCRICAO: TStringField;
    QLookDESCRICAO: TStringField;
    procedure QGruposCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QGruposCadastroDESCRICAOSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    procedure GruposBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdGrupo: integer);
    procedure ValidarDadosQueryCadastro;
    procedure LookGrupo(const AIdGrupo: integer);
  end;

var
  ModelGruposDM: TModelGruposDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Conexao.DM, RTTI.FieldName, Exceptions.FieldName;

{$R *.dfm}

{ TModelGruposDM }

procedure TModelGruposDM.GruposBuscar(const ACondicao: string);
begin
  QGruposBusca.Close;
  QGruposBusca.SQL.Text := 'select * from grupo ' + ACondicao;
  QGruposBusca.Open;
end;

procedure TModelGruposDM.DataModuleCreate(Sender: TObject);
begin
  QGruposCadastro.FieldByName('ID').AutoGenerateValue := arDefault;
  QGruposBusca.FetchOptions.Mode := fmAll;
end;

procedure TModelGruposDM.LookGrupo(const AIdGrupo: integer);
begin
  QLook.Close;
  QLook.ParamByName('IdGrupo').AsInteger := AIdGrupo;
  QLook.Open;
end;

procedure TModelGruposDM.QGruposCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelGruposDM.QGruposCadastroDESCRICAOSetText(Sender: TField; const Text: string);
begin
  QGruposCadastroDESCRICAO.AsString := QGruposCadastroDESCRICAO.AsString.Trim;
end;

procedure TModelGruposDM.ValidarDadosQueryCadastro;
begin
  if QGruposCadastroDESCRICAO.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Descrição.', 'DESCRICAO');
end;

procedure TModelGruposDM.CadastrarGet(const AIdGrupo: integer);
begin
  QGruposCadastro.Close;
  QGruposCadastro.SQL.Text := 'select * from grupo ' +
    'where id = :pId';
  QGruposCadastro.ParamByName('pId').AsInteger := AIdGrupo;
  QGruposCadastro.Open;
end;

end.
