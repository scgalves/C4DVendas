unit View.Produtos.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName;

type
  TViewProdutosCadastrar = class(TViewHerancasCadastrar)
    edtID: TDBLabeledEdit;
    [FieldName('NOME')]
    edtNOME: TDBLabeledEdit;
    edtDESCRICAO: TDBLabeledEdit;
    pnlAtivo: TPanel;
    chkAtivo: TDBCheckBox;
    [FieldName('ID_GRUPO')]
    edtIdGrupo: TLabeledEdit;
    edtDescricaoGrupo: TLabeledEdit;
    [FieldName('PRECO_CUSTO')]
    edtPRECO_CUSTO: TDBLabeledEdit;
    edtDTHR_INSERT: TDBLabeledEdit;
    edtDTHR_UPDATE: TDBLabeledEdit;
    [FieldName('PORCENTAGEM_VENDA')]
    edtPORCENTAGEM_VENDA: TDBLabeledEdit;
    [FieldName('PRECO_VENDA')]
    edtPRECO_VENDA: TDBLabeledEdit;
    [FieldName('ID_SUBGRUPO')]
    edtIdSubgrupo: TLabeledEdit;
    edtDescricaoSubgrupo: TLabeledEdit;
    edtCODIGO_BARRAS: TDBLabeledEdit;
    pnlUnidade: TPanel;
    lblUnidade: TLabel;
    [FieldName('UNIDADE')]
    cmbUnidade: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtIdGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtIdGrupoExit(Sender: TObject);
    procedure edtIdSubgrupoExit(Sender: TObject);
    procedure edtIdSubgrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPRECO_VENDAExit(Sender: TObject);
    procedure edtPRECO_CUSTOExit(Sender: TObject);
    procedure edtPORCENTAGEM_VENDAExit(Sender: TObject);
  private
    function CalcularPorcentagemVenda: Double;
  public

  end;

implementation

uses
  Model.Produtos.DM, Exceptions.FieldName, Utils, View.Grupos.Buscar, Model.Grupos.DM, View.Subgrupos.Buscar,
  Model.Subgrupos.DM, System.StrUtils;

{$R *.dfm}

procedure TViewProdutosCadastrar.btnGravarClick(Sender: TObject);
begin
  if DataSource1.DataSet.FieldByName('PRECO_VENDA').AsFloat < DataSource1.DataSet.FieldByName('PRECO_CUSTO').AsFloat then
    if Application.MessageBox('O Preço de Venda é menor do que o Preço de Custo.' + sLineBreak +
      'Confirma a Gravação?', 'Atenção', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDNO then
    begin
      edtPRECO_VENDA.SetFocus;
      Exit;
    end;

  try
    if cmbUnidade.Text <> '' then
      DataSource1.DataSet.FieldByName('UNIDADE').AsString := Copy(cmbUnidade.Text, 1, 3);
    DataSource1.Dataset.Post;
  except
    on E: ExceptionsFieldName do
     TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

function TViewProdutosCadastrar.CalcularPorcentagemVenda: Double;
begin
  Result := ((DataSource1.DataSet.FieldByName('PRECO_VENDA').AsFloat * 100) /
    DataSource1.DataSet.FieldByName('PRECO_CUSTO').AsFloat) - 100;
end;

procedure TViewProdutosCadastrar.edtIdGrupoExit(Sender: TObject);
var
  LModelGruposDM: TModelGruposDM;
begin
  inherited;
  edtDescricaoGrupo.Clear;
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

    edtDescricaoGrupo.Text := LModelGruposDM.QLookDESCRICAO.AsString;
    DataSource1.DataSet.FieldByName('ID_GRUPO').AsInteger := StrToInt(edtIdGrupo.Text);
  finally
    FreeAndNil(LModelGruposDM);
  end;
end;

procedure TViewProdutosCadastrar.edtIdGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TViewProdutosCadastrar.edtIdSubgrupoExit(Sender: TObject);
var
  LModelSubgruposDM: TModelSubgruposDM;
begin
  inherited;
  edtDescricaoSubgrupo.Clear;
  if Trim(edtIdSubgrupo.Text).IsEmpty then
    Exit;

  LModelSubgruposDM := TModelSubgruposDM.Create(nil);
  try
    LModelSubgruposDM.LookSubgrupo(StrToIntDef(edtIdSubgrupo.Text, 0));
    if LModelSubgruposDM.QLook.IsEmpty then
    begin
      edtIdSubgrupo.SetFocus;
      raise Exception.Create('Subgrupo não localizado.');
    end;

    edtDescricaoSubgrupo.Text := LModelSubgruposDM.QLookDESCRICAO.AsString;
    DataSource1.DataSet.FieldByName('ID_SUBGRUPO').AsInteger := StrToInt(edtIdSubgrupo.Text);
  finally
    FreeAndNil(LModelSubgruposDM);
  end;
end;

procedure TViewProdutosCadastrar.edtIdSubgrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DataSource1.DataSet.FieldByName('ID_GRUPO').AsInteger = 0 then
  begin
    edtIdGrupo.SetFocus;
    raise Exception.Create('Antes de identificar um Subgrupo, é necessário identificar, primeiro, o Grupo.');
  end;

  if Key = VK_F9 then
  begin
    ViewSubgruposBuscar := TViewSubgruposBuscar.Create(nil);
    ViewSubgruposBuscar.FIdGrupo := DataSource1.DataSet.FieldByName('ID_GRUPO').AsInteger;
    try
      if ViewSubgruposBuscar.ShowModal = mrOk then
        edtIdSubgrupo.Text := ViewSubgruposBuscar.IdSelecionado.ToString;
    finally
      FreeAndNil(ViewSubgruposBuscar);
    end;
  end;
end;

procedure TViewProdutosCadastrar.edtPORCENTAGEM_VENDAExit(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.FieldByName('PORCENTAGEM_VENDA').AsFloat > 0 then
    DataSource1.DataSet.FieldByName('PRECO_VENDA').AsFloat :=  DataSource1.DataSet.FieldByName('PRECO_CUSTO').AsFloat *
      (1 + (DataSource1.DataSet.FieldByName('PORCENTAGEM_VENDA').AsFloat / 100));
end;

procedure TViewProdutosCadastrar.edtPRECO_CUSTOExit(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.FieldByName('PRECO_VENDA').AsFloat > 0 then
    DataSource1.DataSet.FieldByName('PORCENTAGEM_VENDA').AsFloat := CalcularPorcentagemVenda;
end;

procedure TViewProdutosCadastrar.edtPRECO_VENDAExit(Sender: TObject);
begin
  inherited;
  DataSource1.DataSet.FieldByName('PORCENTAGEM_VENDA').AsFloat := CalcularPorcentagemVenda;
end;

procedure TViewProdutosCadastrar.FormShow(Sender: TObject);
var
  I: Byte;
begin
  inherited;
  ModelProdutosDM.CadastrarGet(inherited IdRegistroAlterar);

  if DataSource1.DataSet.IsEmpty then
  begin
    DataSource1.DataSet.Append;
    chkAtivo.Checked := True;
  end
  else
  begin
    DataSource1.DataSet.Edit;
    // A tabela contém no máximo 3 caracteres ref. à unidade. As unidades do Combo contém 'abreviação | descrição'.
    // Percorre os itens do Combo até encontrar a unidade.
    for I := 0 to Pred(cmbUnidade.Items.Count) do
      if DataSource1.DataSet.FieldByName('UNIDADE').AsString = Trim(LeftStr(cmbUnidade.Items[I], 3)) then
      begin
        cmbUnidade.ItemIndex := I;
        Break;
      end;
    edtIdGrupo.Text := DataSource1.DataSet.FieldByName('ID_GRUPO').AsString;
    edtIdGrupoExit(edtIdGrupo);
    edtIdSubgrupo.Text := DataSource1.DataSet.FieldByName('ID_SUBGRUPO').AsString;
    edtIdSubgrupoExit(edtIdSubgrupo);
  end;

  Self.edtNOME.SetFocus;
end;

end.
