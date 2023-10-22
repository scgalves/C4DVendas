unit View.Pessoas.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TViewPessoasBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbFiltroComboChange(Sender: TObject);
  private

  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  end;

var
  ViewPessoasBuscar: TViewPessoasBuscar;

implementation

uses
  Model.Pessoas.DM, View.Pessoas.Cadastrar;

{$R *.dfm}

{ TViewPessoasBuscar }

procedure TViewPessoasBuscar.BuscarDados;
var
  LStrBuscar,
    LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  LCondicao := '';
  case rdgFiltros.ItemIndex of
    0: LCondicao := 'where p.id like ' + LStrBuscar;
    1: LCondicao := Format('where (upper(p.nome) like %0:s or upper(p.fantasia_apelido) like %0:s)', [LStrBuscar]);
    2: LCondicao := 'where upper(c.nome) like ' + LStrBuscar;
  end;

  case cmbFiltroCombo.ItemIndex of
    1: // Ativo
      LCondicao := LCondicao + ' and p.ativo = ''S''';
    2: // Inativo
      LCondicao := LCondicao + ' and p.ativo = ''N''';
  end;

  ModelPessoasDM.PessoasBuscar(LCondicao);
  inherited;
end;

procedure TViewPessoasBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
  LViewPessoasCadastrar: TViewPessoasCadastrar;
begin
  inherited;
  LViewPessoasCadastrar := TViewPessoasCadastrar.Create(nil);
  try
    LViewPessoasCadastrar.IdRegistroAlterar := AId;
    if LViewPessoasCadastrar.ShowModal = mrOk then
      Self.BuscarDados;
  finally
    LViewPessoasCadastrar.Free;
  end;
end;

procedure TViewPessoasBuscar.cmbFiltroComboChange(Sender: TObject);
begin
  Self.BuscarDados;
  inherited;
end;

procedure TViewPessoasBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(ModelPessoasDM) then
    ModelPessoasDM := TModelPessoasDM.Create(nil);

  Self.DBGrid1.Columns[0].Width := 64;
  Self.DBGrid1.Columns[1].Width := 37;
  Self.DBGrid1.Columns[2].Width := 66;
  Self.DBGrid1.Columns[3].Width := 41;
  Self.DBGrid1.Columns[4].Width := 64;
  Self.DBGrid1.Columns[5].Width := 364;
  Self.DBGrid1.Columns[6].Width := 364;
  Self.DBGrid1.Columns[8].Width := 364;
  Self.DBGrid1.Columns[9].Width := 18;
  Self.DBGrid1.Columns[10].Width := 364;
  Self.DBGrid1.Columns[11].Width := 94;
  Self.DBGrid1.Columns[12].Width := 94;
  Self.DBGrid1.Columns[13].Width := 140;
end;

procedure TViewPessoasBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelPessoasDM);
end;

end.
