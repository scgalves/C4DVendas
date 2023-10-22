unit View.Cidades.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Mask;

type
  TViewCidadesBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  protected
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  public
    { Public declarations }
  end;

var
  ViewCidadesBuscar: TViewCidadesBuscar;

implementation

uses
  Model.Cidades.DM, View.Cidades.Cadastrar;

{$R *.dfm}

procedure TViewCidadesBuscar.BuscarDados;
var
  LStrBuscar,
    LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  LCondicao := '';
  case rdgFiltros.ItemIndex of
    0: LCondicao := 'where id like ' + LStrBuscar;
    1: LCondicao := 'where upper(nome) like ' + LStrBuscar;
    2: LCondicao := 'where upper(uf) like ' + LStrBuscar;
  end;

  ModelCidadesDM.CidadesBuscar(LCondicao);
  inherited;
end;

procedure TViewCidadesBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
  LViewCidadesCadastrar: TViewCidadesCadastrar;
begin
  inherited;
  LViewCidadesCadastrar := TViewCidadesCadastrar.Create(nil);
  try
    LViewCidadesCadastrar.IdRegistroAlterar := AId;
    if LViewCidadesCadastrar.ShowModal = mrOk then
    begin
      inherited IdAtual := LViewCidadesCadastrar.IdAtual;
      Self.BuscarDados;
    end;
  finally
    LViewCidadesCadastrar.Free;
  end;
end;

procedure TViewCidadesBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(ModelCidadesDM) then
    ModelCidadesDM := TModelCidadesDM.Create(nil);

  Self.DBGrid1.Columns[0].Width := 64;
  Self.DBGrid1.Columns[1].Width := 400;
  Self.DBGrid1.Columns[2].Width := 28;
  Self.DBGrid1.Columns[3].Width := 80;
  Self.DBGrid1.Columns[4].Width := 130;
  Self.DBGrid1.Columns[5].Width := 130;
end;

procedure TViewCidadesBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelCidadesDM);
end;

end.
