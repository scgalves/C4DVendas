unit View.Pessoas.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TViewPessoasBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    1: LCondicao := 'where upper(p.nome) like ' + LStrBuscar + ' or upper(p.fantasia) like ' + LStrBuscar;
    2: LCondicao := 'where upper(c.cidadenome) like '  + LStrBuscar;
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

procedure TViewPessoasBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(ModelPessoasDM) then
    ModelPessoasDM := TModelPessoasDM.Create(nil);
end;

procedure TViewPessoasBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelPessoasDM);
end;

end.
