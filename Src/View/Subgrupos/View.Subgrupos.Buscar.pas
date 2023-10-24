unit View.Subgrupos.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TViewSubgruposBuscar = class(TViewHerancasBuscar)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public
    procedure BuscarDados; override;
    procedure ChamarTelaCadastrar(const AId: Integer = 0); override;
  end;

var
  ViewSubgruposBuscar: TViewSubgruposBuscar;

implementation

uses
  Model.Subgrupos.DM, View.Subgrupos.Cadastrar;

{$R *.dfm}

{ TViewSubgruposBuscar }

procedure TViewSubgruposBuscar.BuscarDados;
var
  LStrBuscar,
    LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  LCondicao := '';
  case rdgFiltros.ItemIndex of
    0: LCondicao := 'where s.id like ' + LStrBuscar;
    1: LCondicao := 'where upper(s.descricao) like ' + LStrBuscar;
  end;

  ModelSubgruposDM.SubgruposBuscar(LCondicao);
  inherited;
end;

procedure TViewSubgruposBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
  LViewSubgruposCadastrar: TViewSubgruposCadastrar;
begin
  inherited;
  LViewSubgruposCadastrar := TViewSubgruposCadastrar.Create(nil);
  try
    LViewSubgruposCadastrar.IdRegistroAlterar := AId;
    if LViewSubgruposCadastrar.ShowModal = mrOk then
      Self.BuscarDados;
  finally
    LViewSubgruposCadastrar.Free;
  end;
end;

procedure TViewSubgruposBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(ModelSubgruposDM) then
    ModelSubgruposDM := TModelSubgruposDM.Create(nil);

  Self.DBGrid1.Columns[0].Width := 64;
  Self.DBGrid1.Columns[2].Width := 273;
  Self.DBGrid1.Columns[3].Width := 272;
  Self.DBGrid1.Columns[4].Width := 130;
  Self.DBGrid1.Columns[5].Width := 130;
end;

procedure TViewSubgruposBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelSubgruposDM);
end;

end.
