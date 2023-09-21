program C4DVendas;

uses
  Vcl.Forms,
  View.Principal in 'Src\View\View.Principal.pas' {ViewPrincipal},
  Model.Conexao.DM in 'Src\Model\Conexao\Model.Conexao.DM.pas' {ModelConexaoDM: TDataModule},
  Model.Cidades.DM in 'Src\Model\Cidades\Model.Cidades.DM.pas' {ModelCidadesDM: TDataModule},
  View.Herancas.Buscar in 'Src\View\Herancas\View.Herancas.Buscar.pas' {ViewHerancasBuscar},
  View.Cidades.Buscar in 'Src\View\Cidades\View.Cidades.Buscar.pas' {ViewCidadesBuscar},
  View.Herancas.Cadastrar in 'Src\View\Herancas\View.Herancas.Cadastrar.pas' {ViewHerancasCadastrar},
  View.Cidades.Cadastrar in 'Src\View\Cidades\View.Cidades.Cadastrar.pas' {ViewCidadesCadastrar},
  Model.Pessoas.DM in 'Src\Model\Pessoas\Model.Pessoas.DM.pas' {ModelPessoasDM: TDataModule},
  View.Pessoas.Buscar in 'Src\View\Pessoas\View.Pessoas.Buscar.pas' {ViewPessoasBuscar},
  View.Pessoas.Cadastrar in 'Src\View\Pessoas\View.Pessoas.Cadastrar.pas' {ViewPessoasCadastrar},
  RTTI.FieldName in 'Src\RTTI\RTTI.FieldName.pas',
  Exceptions.FieldName in 'Src\Exceptions\Exceptions.FieldName.pas',
  Utils in 'Src\Utils\Utils.pas',
  Lib.Helper in 'Src\View\Helper\Lib.Helper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Delphi: Sistema de vendas do zero ao multicamadas';
  Application.CreateForm(TModelConexaoDM, ModelConexaoDM);
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
