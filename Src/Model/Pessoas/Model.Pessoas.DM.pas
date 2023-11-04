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
    QPessoasCadastroCLIENTE: TStringField;
    QPessoasCadastroFORNECEDOR: TStringField;
    QPessoasCadastroCEP: TStringField;
    QPessoasCadastroID_CIDADE: TIntegerField;
    QPessoasCadastroNUMERO: TStringField;
    QPessoasCadastroBAIRRO: TStringField;
    QPessoasCadastroCOMPLEMENTO: TStringField;
    QPessoasCadastroTELEFONE: TStringField;
    QPessoasCadastroCELULAR: TStringField;
    QPessoasCadastroEMAIL: TStringField;
    QPessoasCadastroTIPO_JURIDICO: TSmallintField;
    QPessoasCadastroATIVO: TStringField;
    QPessoasBuscaID: TIntegerField;
    QPessoasBuscaNOME: TStringField;
    QPessoasBuscaCLIENTE: TStringField;
    QPessoasBuscaFORNECEDOR: TStringField;
    QPessoasBuscaUF: TStringField;
    QPessoasBuscaTELEFONE: TStringField;
    QPessoasBuscaCELULAR: TStringField;
    QPessoasBuscaCIDADENOME: TStringField;
    QPessoasBuscaID_CIDADE: TIntegerField;
    QPessoasCadastroFANTASIA_APELIDO: TStringField;
    QPessoasCadastroLOGRADOURO: TStringField;
    QPessoasCadastroCPF_CNPJ: TStringField;
    QPessoasCadastroRG_IE: TStringField;
    QPessoasCadastroDT_NASCIMENTO: TDateField;
    QPessoasCadastroDTHR_INSERT: TSQLTimeStampField;
    QPessoasCadastroDTHR_UPDATE: TSQLTimeStampField;
    QPessoasBuscaFANTASIA_APELIDO: TStringField;
    QPessoasBuscaLOGRADOURO: TStringField;
    QPessoasBuscaTIPO_PESSOA: TStringField;
    QPessoasBuscaATIVO: TStringField;
    QPessoasBuscaDTHR_INSERT: TSQLTimeStampField;
    procedure QPessoasCadastroBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QPessoasCadastroAfterInsert(DataSet: TDataSet);
    procedure QPessoasCadastroDT_NASCIMENTOSetText(Sender: TField; const Text: string);
    procedure QPessoasCadastroAfterOpen(DataSet: TDataSet);
    procedure QPessoasCadastroNOMESetText(Sender: TField; const Text: string);
    procedure QPessoasCadastroFANTASIA_APELIDOSetText(Sender: TField; const Text: string);
    procedure QPessoasCadastroLOGRADOUROSetText(Sender: TField; const Text: string);
    procedure QPessoasCadastroNUMEROSetText(Sender: TField; const Text: string);
    procedure QPessoasCadastroCOMPLEMENTOSetText(Sender: TField; const Text: string);
    procedure QPessoasCadastroBAIRROSetText(Sender: TField; const Text: string);
  private
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
  QPessoasCadastro.SQL.Text := 'select * from pessoa ' +
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
  QPessoasBusca.SQL.Text := 'select p.id,' +
    ' case p.ativo' +
    '  when ''S'' then ''Sim''' +
    '  when ''N'' then ''Não''' +
    ' end as ativo,' +
    ' case p.tipo_juridico' +
    '  when 0 then ''Física'' ' +
    '  when 1 then ''Jurídica''' +
    ' end as tipo_pessoa,' +
    ' case p.cliente' +
    '  when ''S'' then ''Sim''' +
    '  when ''N'' then ''Não''' +
    ' end as cliente,' +
    ' case p.fornecedor' +
    '  when ''S'' then ''Sim''' +
    '  when ''N'' then ''Não''' +
    '  end as fornecedor,' +
    ' p.nome, p.fantasia_apelido, p.id_cidade, c.nome cidadenome, c.uf, p.logradouro, p.telefone, p.celular,' +
    ' p.dthr_insert ' +
    'from pessoa p' +
    ' join cidade c on c.id = p.id_cidade ' + ACondicao;
  QPessoasBusca.Open;
end;

procedure TModelPessoasDM.QPessoasCadastroAfterInsert(DataSet: TDataSet);
begin
  QPessoasCadastroATIVO.AsString := 'S';
  QPessoasCadastroCLIENTE.AsString := 'S';
  QPessoasCadastroFORNECEDOR.AsString := 'S';
  QPessoasCadastroTIPO_JURIDICO.AsInteger := 0;
  QPessoasCadastroCPF_CNPJ.EditMask := '999\.999\.999\-99;0;_';
end;

procedure TModelPessoasDM.QPessoasCadastroAfterOpen(DataSet: TDataSet);
begin
  case QPessoasCadastroTIPO_JURIDICO.AsInteger of
    0: // Pessoa física
      QPessoasCadastroCPF_CNPJ.EditMask := '999\.999\.999\-99;0;_';
    1: // Pessoa jurídica
      QPessoasCadastroCPF_CNPJ.EditMask := '99\.999\.999\/9999\-99;0;_';
  end;
end;

procedure TModelPessoasDM.QPessoasCadastroBAIRROSetText(Sender: TField; const Text: string);
begin
  QPessoasCadastroBAIRRO.AsString := QPessoasCadastroBAIRRO.AsString.Trim;
end;

procedure TModelPessoasDM.QPessoasCadastroBeforePost(DataSet: TDataSet);
begin
  Self.ValidarDadosQueryCadastro;
end;

procedure TModelPessoasDM.QPessoasCadastroCOMPLEMENTOSetText(Sender: TField; const Text: string);
begin
  QPessoasCadastroCOMPLEMENTO.AsString := QPessoasCadastroCOMPLEMENTO.AsString.Trim;
end;

procedure TModelPessoasDM.QPessoasCadastroDT_NASCIMENTOSetText(Sender: TField; const Text: string);
var
  LData: TDateTime;
begin
  inherited;
  {ToDo: Ver a necessidade de validar aqui, ao invés de em ValidarDadosQueryCadastro.}
  LData := Now; // Somente para não exibir o warning de que a variável não foi inicializada :-(
  try
    try
      LData := StrToDate(Text);
    except
      raise Exception.Create('Data inválida.');
      Abort;
    end;
  finally
    QPessoasCadastroDT_NASCIMENTO.AsDateTime := LData;
  end;
end;

procedure TModelPessoasDM.QPessoasCadastroFANTASIA_APELIDOSetText(Sender: TField; const Text: string);
begin
  QPessoasCadastroFANTASIA_APELIDO.AsString := QPessoasCadastroFANTASIA_APELIDO.AsString.Trim;
end;

procedure TModelPessoasDM.QPessoasCadastroLOGRADOUROSetText(Sender: TField; const Text: string);
begin
  QPessoasCadastroLOGRADOURO.AsString := QPessoasCadastroLOGRADOURO.AsString.Trim;
end;

procedure TModelPessoasDM.QPessoasCadastroNOMESetText(Sender: TField; const Text: string);
begin
  QPessoasCadastroNOME.AsString := QPessoasCadastroNOME.AsString.Trim;
end;

procedure TModelPessoasDM.QPessoasCadastroNUMEROSetText(Sender: TField; const Text: string);
begin
  QPessoasCadastroNUMERO.AsString := QPessoasCadastroNUMERO.AsString.Trim;
end;

procedure TModelPessoasDM.ValidarDadosQueryCadastro;
var
  LData: TDate;
  LCpfCnpj: string;
begin
  LCpfCnpj :=
    StringReplace(
      StringReplace(
        StringReplace(
          QPessoasCadastroCPF_CNPJ.AsString.Trim, '.', '', [rfReplaceAll]),
      '-', '', []),
    '/', '', []);

  case QPessoasCadastroTIPO_JURIDICO.AsInteger of
    0: // Física
      begin
        if QPessoasCadastroNOME.AsString.Trim.IsEmpty then
          raise ExceptionsFieldName.Create('Preencha o campo Nome.', 'NOME');

        if not LCpfCnpj.Trim.IsEmpty then
          if not TUtils.CpfValido(LCpfCnpj) then
            raise ExceptionsFieldName.Create('O CPF não é válido.', 'CPF_CNPJ');
      end;
    1: // Jurídica
      begin
        if QPessoasCadastroNOME.AsString.Trim.IsEmpty then
          raise ExceptionsFieldName.Create('Preencha o campo Razão Social.', 'NOME');

        if not LCpfCnpj.Trim.IsEmpty then
          if not TUtils.CnpjValido(LCpfCnpj) then
            raise ExceptionsFieldName.Create('O CNPJ não é válido.', 'CPF_CNPJ');
        // Apesar do campo estar desabilitado quando Pessoa Jurídica...
        if not QPessoasCadastroDT_NASCIMENTO.AsString.IsEmpty then
          raise ExceptionsFieldName.Create('O Tipo de Pessoa Jurídica não pode ter Data de Nascimento preenchida.',
            'DT_NASCIMENTO');
      end;
  end;

  if (QPessoasCadastroCLIENTE.AsString = 'N') and (QPessoasCadastroFORNECEDOR.AsString = 'N') then
    raise ExceptionsFieldName.Create('Selecione Cliente e/ou Fornecedor.', 'CLIENTE');

  if QPessoasCadastroID_CIDADE.AsInteger <= 0 then
    raise ExceptionsFieldName.Create('O campo Código Cidade não foi preenchido.', 'ID_CIDADE');

  if not QPessoasCadastroTELEFONE.AsString.Trim.IsEmpty then
    if Length(QPessoasCadastroTELEFONE.AsString.Trim) in [1..9] then
      raise ExceptionsFieldName.Create('O número do Telefone não pode ter menos de 10 dígitos.', 'TELEFONE');

  if not QPessoasCadastroCELULAR.AsString.Trim.IsEmpty then
    if Length(QPessoasCadastroCELULAR.AsString.Trim) in [1..10] then
      raise ExceptionsFieldName.Create('O número do Celular não pode ter menos de 11 dígitos.', 'CELULAR');

  if not QPessoasCadastroEMAIL.AsString.Trim.IsEmpty then
    if not TUtils.EmailValido(QPessoasCadastroEMAIL.AsString) then
      raise ExceptionsFieldName.Create('O E-Mail não é válido.', 'EMAIL');

  if not QPessoasCadastroDT_NASCIMENTO.AsString.IsEmpty then
  begin
//    try
      LData := StrToDate(QPessoasCadastroDT_NASCIMENTO.AsString);
      // Retira a "hora da data do servidor" para poder comparar com a data do cadastro
      if LData >= StrToDate(FormatDateTime('dd/mm/yyyy', TUtils.GetDataHoraServidor)) then
        raise ExceptionsFieldName.Create('A Data de Nascimento não pode ser maior ou igual à data de hoje.',
          'DT_NASCIMENTO');
//    except
//      raise ExceptionsFieldName.Create('A Data de Nascimento não é válida.', 'NASCIMENTO');
//    end;
  end;
end;

end.
