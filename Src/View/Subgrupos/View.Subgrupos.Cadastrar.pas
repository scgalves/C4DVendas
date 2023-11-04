unit View.Subgrupos.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName;

type
  TViewSubgruposCadastrar = class(TViewHerancasCadastrar)
    edtID: TDBLabeledEdit;
    [FieldName('DESCRICAO')]
    edtDESCRICAO: TDBLabeledEdit;
    [FieldName('ID_GRUPO')]
    edtIdGrupo: TLabeledEdit;
    edtNomeGrupo: TLabeledEdit;
    edtDTHR_INSERT: TDBLabeledEdit;
    edtDTHR_UPDATE: TDBLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtIdGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtIdGrupoExit(Sender: TObject);
  private

  public

  end;

implementation

uses
  Exceptions.FieldName, Utils, Model.Subgrupos.DM, Model.Grupos.DM, View.Grupos.Buscar;

{$R *.dfm}

procedure TViewSubgruposCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.Dataset.Post;
  except
    on E: ExceptionsFieldName do
     TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

procedure TViewSubgruposCadastrar.edtIdGrupoExit(Sender: TObject);
var
  LModelGruposDM: TModelGruposDM;
begin
  inherited;
  edtNomeGrupo.Clear;
  if Trim(edtIdGrupo.Text).IsEmpty then
    Exit;

  LModelGruposDM := TModelGruposDM.Create(nil);
  try
    LModelGruposDM.LookGrupo(StrToIntDef(edtIdGrupo.Text, 0));
    if LModelGruposDM.QLook.IsEmpty then
    begin
      edtIdGrupo.SetFocus;
      raise Exception.Create('Grupo não localizado.');
    end;

    edtNomeGrupo.Text := LModelGruposDM.QLookDESCRICAO.AsString;
    DataSource1.DataSet.FieldByName('ID_GRUPO').AsInteger := StrToInt(edtIdGrupo.Text);
  finally
    FreeAndNil(LModelGruposDM);
  end;
end;

procedure TViewSubgruposCadastrar.edtIdGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F8 then
  begin
    ViewGruposBuscar := TViewGruposBuscar.Create(nil);
    try
      if ViewGruposBuscar.ShowModal = mrOk then
        edtIdGrupo.Text := ViewGruposBuscar.IdSelecionado.ToString;
    finally
      FreeAndNil(ViewGruposBuscar);
    end;
  end;
end;

procedure TViewSubgruposCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelSubgruposDM.CadastrarGet(inherited IdRegistroAlterar);

  if DataSource1.DataSet.IsEmpty then
    DataSource1.DataSet.Append
  else
  begin
    DataSource1.DataSet.Edit;
    edtIdGrupo.Text := DataSource1.DataSet.FieldByName('ID_GRUPO').AsString;
    edtIdGrupoExit(edtIdGrupo);
  end;

  Self.edtDESCRICAO.SetFocus;
end;

end.
