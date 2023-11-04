unit View.Produtos.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TViewProdutosBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbFiltroComboChange(Sender: TObject);
  private
  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  end;

var
  ViewProdutosBuscar: TViewProdutosBuscar;

implementation

uses
  Model.Produtos.DM, View.Produtos.Cadastrar;

{$R *.dfm}

{ TViewProdutosBuscar }

procedure TViewProdutosBuscar.BuscarDados;
var
  LStrBuscar,
    LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  LCondicao := '';
  case rdgFiltros.ItemIndex of
    0: LCondicao := 'where p.id like ' + LStrBuscar;
    1: LCondicao := 'where upper(p.nome) like ' + LStrBuscar;
    2: LCondicao := 'where upper(p.descricao) like ' + LStrBuscar;
    3: LCondicao := 'where p.codigo_barras like ' + LStrBuscar;
    4: LCondicao := 'where upper(g.descricao) like ' + LStrBuscar;
    5: LCondicao := 'where upper(s.descricao) like ' + LStrBuscar;
  end;

  case cmbFiltroCombo.ItemIndex of
    1: // Ativo
      LCondicao := LCondicao + ' and p.ativo = ''S''';
    2: // Inativo
      LCondicao := LCondicao + ' and p.ativo = ''N''';
  end;

  ModelProdutosDM.ProdutosBuscar(LCondicao);
  inherited;
end;

procedure TViewProdutosBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
  LViewProdutosCadastrar: TViewProdutosCadastrar;
begin
  inherited;
  LViewProdutosCadastrar := TViewProdutosCadastrar.Create(nil);
  try
    LViewProdutosCadastrar.IdRegistroAlterar := AId;
    if LViewProdutosCadastrar.ShowModal = mrOk then
      Self.BuscarDados;
  finally
    LViewProdutosCadastrar.Free;
  end;
end;

procedure TViewProdutosBuscar.cmbFiltroComboChange(Sender: TObject);
begin
  Self.BuscarDados;
  inherited;
end;

procedure TViewProdutosBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(ModelProdutosDM) then
    ModelProdutosDM := TModelProdutosDM.Create(nil);

  Self.DBGrid1.Columns[0].Width := 64;
  Self.DBGrid1.Columns[1].Width := 37;
  Self.DBGrid1.Columns[2].Width := 364;
  Self.DBGrid1.Columns[3].Width := 346;
  Self.DBGrid1.Columns[4].Width := 100;
  Self.DBGrid1.Columns[5].Width := 98;
  Self.DBGrid1.Columns[6].Width := 88;
  Self.DBGrid1.Columns[7].Width := 98;
  Self.DBGrid1.Columns[8].Width := 54;
  Self.DBGrid1.Columns[9].Width := 164;
  Self.DBGrid1.Columns[10].Width := 164;
  Self.DBGrid1.Columns[11].Width := 140;
end;

procedure TViewProdutosBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelProdutosDM);
end;

end.
