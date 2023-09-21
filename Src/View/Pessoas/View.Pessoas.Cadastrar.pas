unit View.Pessoas.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName;

type
  TViewPessoasCadastrar = class(TViewHerancasCadastrar)
    grdDados: TGridPanel;
    pnlAtivo: TPanel;
    chkAtivo: TDBCheckBox;
    pnlCliente: TPanel;
    chkCLIENTE: TDBCheckBox;
    pnlFornecedor: TPanel;
    chkFORNECEDOR: TDBCheckBox;
    [FieldName('TIPO_JURIDICO')]
    rdgTIPO_JURIDICO: TDBRadioGroup;
    edtCodigo: TDBLabeledEdit;
    [FieldName('NOME')]
    edtNOME: TDBLabeledEdit;
    [FieldName('FANTASIA')]
    edtFANTASIA: TDBLabeledEdit;
    edtCEP: TDBLabeledEdit;
    edtNomeCidade: TLabeledEdit;
    edtENDERECO: TDBLabeledEdit;
    edtNUMERO: TDBLabeledEdit;
    edtCOMPLEMENTO: TDBLabeledEdit;
    edtBAIRRO: TDBLabeledEdit;
    edtTELEFONE: TDBLabeledEdit;
    edtCELULAR: TDBLabeledEdit;
    [FieldName('EMAIL')]
    edtEMAIL: TDBLabeledEdit;
    [FieldName('NASCIMENTO')]
    edtNASCIMENTO: TDBLabeledEdit;
    [FieldName('CPF')]
    edtCPF: TDBLabeledEdit;
    edtRG: TDBLabeledEdit;
    [FieldName('CNPJ')]
    edtCNPJ: TDBLabeledEdit;
    edtIE: TDBLabeledEdit;
    edtDH_CADASTRO: TDBLabeledEdit;
    [FieldName('ID_CIDADE')]
    edtIdCidade: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure rdgTIPO_JURIDICOChange(Sender: TObject);
    procedure edtIdCidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtIdCidadeExit(Sender: TObject);
  private
    procedure HabilitarComponentesTipoPessoa;
  public

  end;

{var
  ViewPessoasCadastrar: TViewPessoasCadastrar;}

implementation

uses
  Model.Pessoas.DM, Exceptions.FieldName, Utils, View.Cidades.Buscar, Model.Cidades.DM;

{$R *.dfm}

procedure TViewPessoasCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.Dataset.Post;
  except on E: ExceptionsFieldName do
    TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

procedure TViewPessoasCadastrar.edtIdCidadeExit(Sender: TObject);
var
  LModelCidadesDM: TModelCidadesDM;
begin
  inherited;
  edtNomeCidade.Clear;
  if Trim(edtIdCidade.Text).IsEmpty then
    Exit;

  LModelCidadesDM := TModelCidadesDM.Create(nil);
  try
    LModelCidadesDM.LookCidade(StrToIntDef(edtIdCidade.Text, 0));
    if LModelCidadesDM.QLook.IsEmpty then
    begin
      edtIdCidade.SetFocus;
      raise Exception.Create('Cidade não localizada.');
    end;

    edtNomeCidade.Text := Format('%s / %s', [LModelCidadesDM.QLookNOME.AsString, LModelCidadesDM.QLookUF.AsString]);
    DataSource1.DataSet.FieldByName('ID_CIDADE').AsInteger := StrToInt(edtIdCidade.Text);
  finally
    FreeAndNil(LModelCidadesDM);
  end;
end;

procedure TViewPessoasCadastrar.edtIdCidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F8 then
  begin
    ViewCidadesBuscar := TViewCidadesBuscar.Create(nil);
    try
      if ViewCidadesBuscar.ShowModal = mrOk then
        edtIdCidade.Text := ViewCidadesBuscar.IdSelecionado.ToString;
    finally
      FreeAndNil(ViewCidadesBuscar);
    end;
  end;
end;

procedure TViewPessoasCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelPessoasDM.CadastrarGet(inherited IdRegistroAlterar);

  if DataSource1.DataSet.IsEmpty then
  begin
    DataSource1.DataSet.Append;
    chkAtivo.Checked := True;
  end
  else
  begin
    DataSource1.DataSet.Edit;
    edtIdCidadeExit(edtIdCidade);
  end;

//  rdgTIPO_JURIDICO.ItemIndex := ModelPessoasDM.QPessoasCadastroTIPO_JURIDICO.AsInteger;

  Self.HabilitarComponentesTipoPessoa;
end;

procedure TViewPessoasCadastrar.rdgTIPO_JURIDICOChange(Sender: TObject);
begin
  inherited;
  case rdgTIPO_JURIDICO.ItemIndex of
    0: // Física
      begin
        edtNOME.EditLabel.Caption := 'Nome';
        edtFANTASIA.EditLabel.Caption := 'Apelido';

        if not Trim(edtCNPJ.Text).IsEmpty then
          DataSource1.DataSet.FieldByName('CNPJ').Clear;
        if not Trim(edtIE.Text).IsEmpty then
          DataSource1.DataSet.FieldByName('IE').Clear;
      end;
    1: // Jurídica
      begin
        edtNOME.EditLabel.Caption := 'Razão Social';
        edtFANTASIA.EditLabel.Caption := 'Nome de Fantasia';

        if not Trim(edtNASCIMENTO.Text).IsEmpty then
          DataSource1.DataSet.FieldByName('NASCIMENTO').Clear;
        if not Trim(edtCPF.Text).IsEmpty then
          DataSource1.DataSet.FieldByName('CPF').Clear;
        if not Trim(edtRG.Text).IsEmpty then
          DataSource1.DataSet.FieldByName('RG').Clear;
      end;
  end;
  Self.HabilitarComponentesTipoPessoa;
//  Perform(CM_DIALOGKEY, VK_TAB, 0);
end;

procedure TViewPessoasCadastrar.HabilitarComponentesTipoPessoa;
begin
  case rdgTIPO_JURIDICO.ItemIndex of
    0: // Física
      begin
        TUtils.HabilitarDesabilitarObjetos([edtCNPJ, edtIE]);
        TUtils.HabilitarDesabilitarObjetos([edtCPF, edtRG, edtNASCIMENTO], False);
      end;
    1: // Jurídica
      begin
        TUtils.HabilitarDesabilitarObjetos([edtCNPJ, edtIE], False);
        TUtils.HabilitarDesabilitarObjetos([edtCPF, edtRG, edtNASCIMENTO]);
      end;
  end;
end;

end.
