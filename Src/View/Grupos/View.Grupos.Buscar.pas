unit View.Grupos.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Buscar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.Mask;

type
  TViewGruposBuscar = class(TViewHerancasBuscar)
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
  ViewGruposBuscar: TViewGruposBuscar;

implementation

uses
  Model.Grupos.DM, View.Grupos.Cadastrar;

{$R *.dfm}

procedure TViewGruposBuscar.BuscarDados;
var
  LStrBuscar,
    LCondicao: string;
begin
  LStrBuscar := QuotedStr('%' + edtBuscar.Text + '%').ToUpper;
  LCondicao := '';
  case rdgFiltros.ItemIndex of
    0: LCondicao := 'where id like ' + LStrBuscar;
    1: LCondicao := 'where upper(descricao) like ' + LStrBuscar;
  end;

  ModelGruposDM.GruposBuscar(LCondicao);
  inherited;
end;

procedure TViewGruposBuscar.ChamarTelaCadastrar(const AId: Integer = 0);
var
  LViewGruposCadastrar: TViewGruposCadastrar;
begin
  inherited;
  LViewGruposCadastrar := TViewGruposCadastrar.Create(nil);
  try
    LViewGruposCadastrar.IdRegistroAlterar := AId;
    if LViewGruposCadastrar.ShowModal = mrOk then
    begin
      inherited IdAtual := LViewGruposCadastrar.IdAtual;
      Self.BuscarDados;
    end;
  finally
    LViewGruposCadastrar.Free;
  end;
end;

procedure TViewGruposBuscar.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(ModelGruposDM) then
    ModelGruposDM := TModelGruposDM.Create(nil);

  Self.DBGrid1.Columns[0].Width := 64;
  Self.DBGrid1.Columns[1].Width := 364;
  Self.DBGrid1.Columns[2].Width := 208;
  Self.DBGrid1.Columns[3].Width := 208;
end;

procedure TViewGruposBuscar.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(ModelGruposDM);
end;

end.
