unit Model.Pessoas.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TModelPessoasDM = class(TDataModule)
    QPessoasCadastro: TFDQuery;
    QPessoasBusca: TFDQuery;
    QPessoasCadastroID: TIntegerField;
    QPessoasCadastroNOME: TStringField;
    QPessoasCadastroFANTASIA: TStringField;
    QPessoasCadastroCLIENTE: TStringField;
    QPessoasCadastroFORNECEDOR: TStringField;
    QPessoasCadastroCEP: TStringField;
    QPessoasCadastroID_CIDADE: TIntegerField;
    QPessoasCadastroENDERECO: TStringField;
    QPessoasCadastroNUMERO: TStringField;
    QPessoasCadastroBAIRRO: TStringField;
    QPessoasCadastroCOMPLEMENTO: TStringField;
    QPessoasCadastroTELEFONE: TStringField;
    QPessoasCadastroCELULAR: TStringField;
    QPessoasCadastroEMAIL: TStringField;
    QPessoasCadastroTIPO_JURIDICO: TSmallintField;
    QPessoasCadastroCPF: TStringField;
    QPessoasCadastroRG: TStringField;
    QPessoasCadastroCNPJ: TStringField;
    QPessoasCadastroIE: TStringField;
    QPessoasCadastroATIVO: TStringField;
    QPessoasCadastroNASCIMENTO: TDateField;
    QPessoasCadastroDH_CADASTRO: TSQLTimeStampField;
    QPessoasBuscaID: TIntegerField;
    QPessoasBuscaNOME: TStringField;
    QPessoasBuscaFANTASIA: TStringField;
    QPessoasBuscaCLIENTE: TStringField;
    QPessoasBuscaFORNECEDOR: TStringField;
    QPessoasBuscaUF: TStringField;
    QPessoasBuscaENDERECO: TStringField;
    QPessoasBuscaTELEFONE: TStringField;
    QPessoasBuscaCELULAR: TStringField;
    QPessoasBuscaCIDADENOME: TStringField;
    QPessoasBuscaID_CIDADE: TIntegerField;
    procedure QPessoasCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QPessoasCadastroAfterInsert(DataSet: TDataSet);
    procedure QPessoasCadastroNASCIMENTOSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    procedure PessoasBuscar(const ACondicao: string);
    procedure CadastrarGet(const AIdPessoa: integer);
    procedure ValidarDadosQueryCadastro;
  end;

var
  ModelPessoasDM: TModelPessoasDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Conexao.DM, RTTI.FieldName, Exceptions.FieldName, Utils;

{$R *.dfm}

{ TModelPessoasDM }

procedure TModelPessoasDM.CadastrarGet(const AIdPessoa: integer);
begin
  QPessoasCadastro.Close;
  QPessoasCadastro.SQL.Text := 'select * from pessoas ' +
    'where id = :pId';
  QPessoasCadastro.ParamByName('pId').AsInteger := AIdPessoa;
  QPessoasCadastro.Open;
end;

procedure TModelPessoasDM.DataModuleCreate(Sender: TObject);
begin
   QPessoasCadastro.FieldByName('ID').AutoGenerateValue := arDefault;
   QPessoasBusca.FetchOptions.Mode := fmAll;
end;

procedure TModelPessoasDM.PessoasBuscar(const ACondicao: string);
begin
  QPessoasBusca.Close;
  QPessoasBusca.SQL.Text := 'select p.id, p.nome, p.fantasia, p.cliente, p.fornecedor, p.id_cidade,' +
    ' c.nome cidadenome, c.uf, p.endereco, p.telefone, p.celular ' +
    'from pessoas p' +
    ' join cidades c on c.id = p.id_cidade ' + ACondicao;
  QPessoasBusca.Open;
end;

procedure TModelPessoasDM.QPessoasCadastroAfterInsert(DataSet: TDataSet);
begin
  QPessoasCadastroATIVO.AsString := 'S';
  QPessoasCadastroCLIENTE.AsString := 'S';
  QPessoasCadastroFORNECEDOR.AsString := 'S';
  QPessoasCadastroDH_CADASTRO.AsDateTime := Now;
  QPessoasCadastroTIPO_JURIDICO.AsInteger := 0;
end;

procedure TModelPessoasDM.QPessoasCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelPessoasDM.QPessoasCadastroNASCIMENTOSetText(Sender: TField; const Text: string);
var
  LData: TDateTime;
begin
  inherited;
  LData := Now; // Somente para não exibir o warning de que a variável não foi inicializada :-(
  try
    try
      LData := StrToDate(Text);
    except
      raise Exception.Create('Data inválida.');
      Abort;
    end;
  finally
    QPessoasCadastroNASCIMENTO.AsDateTime := LData;
  end;
end;

procedure TModelPessoasDM.ValidarDadosQueryCadastro;
var
  LData: TDate;
  LCpfCnpj: string;
begin
  case QPessoasCadastroTIPO_JURIDICO.AsInteger of
    0: // Física
      begin
        if QPessoasCadastroNOME.AsString.Trim.IsEmpty then
          raise ExceptionsFieldName.Create('Preencha o campo Nome.', 'NOME');

        if QPessoasCadastroFANTASIA.AsString.Trim.IsEmpty then
          raise ExceptionsFieldName.Create('Preencha o campo Apelido.', 'FANTASIA');

        LCpfCnpj := StringReplace(StringReplace(
          QPessoasCadastroCPF.AsString.Trim, '.', '', [rfReplaceAll]), '-', '', []);
        if not LCpfCnpj.Trim.IsEmpty then
          if not TUtils.CpfValido(LCpfCnpj) then
            raise ExceptionsFieldName.Create('O CPF não é válido.', 'CPF');
      end;
    1: // Jurídica
      begin
        if QPessoasCadastroNOME.AsString.Trim.IsEmpty then
          raise ExceptionsFieldName.Create('Preencha o campo Razão Social.', 'NOME');

        if QPessoasCadastroFANTASIA.AsString.Trim.IsEmpty then
          raise ExceptionsFieldName.Create('Preencha o campo Nome de Fantasia.', 'FANTASIA');

        LCpfCnpj := StringReplace(StringReplace(StringReplace(
          QPessoasCadastroCNPJ.AsString.Trim, '.', '', [rfReplaceAll]), '-', '', []), '/', '', []);
        if not LCpfCnpj.Trim.IsEmpty then
          if not TUtils.CnpjValido(LCpfCnpj) then
            raise ExceptionsFieldName.Create('O CNPJ não é válido.', 'CNPJ');
      end;
  end;

  if (QPessoasCadastroCLIENTE.AsString = 'N') and (QPessoasCadastroFORNECEDOR.AsString = 'N') then
    raise ExceptionsFieldName.Create('Selecione Cliente e/ou Fornecedor.', 'CLIENTE');

  if QPessoasCadastroID_CIDADE.AsInteger <= 0 then
    raise ExceptionsFieldName.Create('O campo Código Cidade não foi preenchido.', 'ID_CIDADE');

//  if not QPessoasCadastroTIPO_JURIDICO.AsInteger in [0, 1] then
//    raise ExceptionsFieldName.Create('Selecione o Tipo de Pessoa (Física/Jurídica).', 'TIPO_JURIDICO');

  if not QPessoasCadastroEMAIL.AsString.Trim.IsEmpty then
    if not TUtils.EmailValido(QPessoasCadastroEMAIL.AsString) then
      raise ExceptionsFieldName.Create('O E-Mail não é válido.', 'EMAIL');

  if not QPessoasCadastroNASCIMENTO.AsString.IsEmpty then
  begin
//    try
      LData := StrToDate(QPessoasCadastroNASCIMENTO.AsString);
      if LData >= Date then
        raise ExceptionsFieldName.Create('A Data de Nascimento não pode ser maior do que a data de hoje.', 'NASCIMENTO');
//    except
//      raise ExceptionsFieldName.Create('A Data de Nascimento não é válida.', 'NASCIMENTO');
//    end;
  end;
end;

end.
