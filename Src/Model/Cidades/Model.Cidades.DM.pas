unit Model.Cidades.DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.RTTI, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TModelCidadesDM = class(TDataModule)
    QCidadesCadastro: TFDQuery;
    QCidadesBusca: TFDQuery;
    QCidadesCadastroID: TIntegerField;
    QCidadesCadastroNOME: TStringField;
    QCidadesCadastroUF: TStringField;
    QCidadesCadastroCODIGO_IBGE: TIntegerField;
    QCidadesBuscaID: TIntegerField;
    QCidadesBuscaNOME: TStringField;
    QCidadesBuscaUF: TStringField;
    QCidadesBuscaCODIGO_IBGE: TIntegerField;
    QLook: TFDQuery;
    QLookNOME: TStringField;
    QLookUF: TStringField;
    QCidadesCadastroDTHR_INSERT: TSQLTimeStampField;
    QCidadesCadastroDTHR_UPDATE: TSQLTimeStampField;
    QCidadesBuscaDTHR_INSERT: TSQLTimeStampField;
    QCidadesBuscaDTHR_UPDATE: TSQLTimeStampField;
    procedure QCidadesCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QCidadesCadastroNOMESetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    procedure CidadesBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdCidade: integer);
    procedure ValidarDadosQueryCadastro;
    procedure LookCidade(const AIdCidade: integer);
  end;

var
  ModelCidadesDM: TModelCidadesDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Conexao.DM, RTTI.FieldName, Exceptions.FieldName;

{$R *.dfm}

{ TModelCidadesDM }

procedure TModelCidadesDM.CidadesBuscar(const ACondicao: string);
begin
  QCidadesBusca.Close;
  QCidadesBusca.SQL.Text := 'select * from cidade ' + ACondicao;
  QCidadesBusca.Open;
end;

procedure TModelCidadesDM.DataModuleCreate(Sender: TObject);
begin
   QCidadesCadastro.FieldByName('ID').AutoGenerateValue := arDefault;
   QCidadesBusca.FetchOptions.Mode := fmAll;
end;

procedure TModelCidadesDM.LookCidade(const AIdCidade: integer);
begin
  QLook.Close;
  QLook.ParamByName('IdCidade').AsInteger := AIdCidade;
  QLook.Open;
end;

procedure TModelCidadesDM.QCidadesCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelCidadesDM.QCidadesCadastroNOMESetText(Sender: TField; const Text: string);
begin
  QCidadesCadastroNOME.AsString := QCidadesCadastroNOME.AsString.Trim;
end;

procedure TModelCidadesDM.ValidarDadosQueryCadastro;
begin
  if QCidadesCadastroNOME.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo Nome.', 'NOME');

  if QCidadesCadastroUF.AsString.Trim.IsEmpty then
    raise ExceptionsFieldName.Create('Preencha o campo UF.', 'UF');

  if (QCidadesCadastroCODIGO_IBGE.AsInteger > 0) and
    (Length(QCidadesCadastroCODIGO_IBGE.AsString) <> 7) then // 7 caracteres ou sem preenchimento
    raise ExceptionsFieldName.Create('O Código IBGE deve conter 7 caracteres.', 'CODIGO_IBGE');
end;

procedure TModelCidadesDM.CadastrarGet(const AIdCidade: integer);
begin
  QCidadesCadastro.Close;
  QCidadesCadastro.SQL.Text := 'select * from cidade ' +
    'where id = :pId';
  QCidadesCadastro.ParamByName('pId').AsInteger := AIdCidade;
  QCidadesCadastro.Open;
end;

end.
