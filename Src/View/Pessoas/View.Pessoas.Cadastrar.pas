unit View.Pessoas.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName;

type
  TViewPessoasCadastrar = class(TViewHerancasCadastrar)
    edtID: TDBLabeledEdit;
    [FieldName('NOME')]
    edtNOME: TDBLabeledEdit;
    edtFANTASIA_APELIDO: TDBLabeledEdit;
    pnlAtivo: TPanel;
    chkAtivo: TDBCheckBox;
    pnlCliente: TPanel;
    chkCLIENTE: TDBCheckBox;
    pnlFornecedor: TPanel;
    chkFORNECEDOR: TDBCheckBox;
    edtCEP: TDBLabeledEdit;
    [FieldName('ID_CIDADE')]
    edtIdCidade: TLabeledEdit;
    edtNomeCidade: TLabeledEdit;
    edtLOGRADOURO: TDBLabeledEdit;
    edtNUMERO: TDBLabeledEdit;
    edtCOMPLEMENTO: TDBLabeledEdit;
    edtBAIRRO: TDBLabeledEdit;
    [FieldName('TELEFONE')]
    edtTELEFONE: TDBLabeledEdit;
    [FieldName('CELULAR')]
    edtCELULAR: TDBLabeledEdit;
    [FieldName('EMAIL')]
    edtEMAIL: TDBLabeledEdit;
    [FieldName('DT_NASCIMENTO')]
    edtDT_NASCIMENTO: TDBLabeledEdit;
    [FieldName('TIPO_JURIDICO')]
    rdgTIPO_JURIDICO: TDBRadioGroup;
    [FieldName('CPF_CNPJ')]
    edtCPF_CNPJ: TDBLabeledEdit;
    edtRG_IE: TDBLabeledEdit;
    edtDTHR_INSERT: TDBLabeledEdit;
    edtDTHR_UPDATE: TDBLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure rdgTIPO_JURIDICOChange(Sender: TObject);
    procedure edtIdCidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtIdCidadeExit(Sender: TObject);
    procedure rdgTIPO_JURIDICOClick(Sender: TObject);
  private
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
  except
    on E: ExceptionsFieldName do
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
    rdgTIPO_JURIDICO.ItemIndex := 0;
//    rdgTIPO_JURIDICO.OnClick(Self);
  end
  else
  begin
    {ToDo: Verificar por que os labels de PF/PJ não estão corretos ao editar um registro.}
    DataSource1.DataSet.Edit;
    edtIdCidade.Text := DataSource1.DataSet.FieldByName('ID_CIDADE').AsString;
    edtIdCidadeExit(edtIdCidade);
  end;
  rdgTIPO_JURIDICO.OnClick(Self);

  Self.edtNOME.SetFocus;
end;

procedure TViewPessoasCadastrar.rdgTIPO_JURIDICOChange(Sender: TObject);
begin
  inherited;
//  end;
end;

procedure TViewPessoasCadastrar.rdgTIPO_JURIDICOClick(Sender: TObject);
begin
  inherited;
  case rdgTIPO_JURIDICO.ItemIndex of
    0: // Física
      begin
        edtNOME.EditLabel.Caption := 'Nome';
        edtFANTASIA_APELIDO.EditLabel.Caption := 'Apelido';
        edtCPF_CNPJ.EditLabel.Caption := 'CPF';
        edtRG_IE.EditLabel.Caption := 'RG';
        edtDT_NASCIMENTO.Enabled := True;
        { A máscara com somente dígitos 9 não obriga o usuário a digitar o máximo de dígitos possíveis no campo.
        Todavia, o conteúdo do campo será validado antes de salvar o registro. }
        DataSource1.DataSet.FieldByName('CPF_CNPJ').EditMask := '999\.999\.999\-99;0;_';
      end;
    1: // Jurídica
      begin
        edtNOME.EditLabel.Caption := 'Razão Social';
        edtFANTASIA_APELIDO.EditLabel.Caption := 'Nome de Fantasia';
        edtCPF_CNPJ.EditLabel.Caption := 'CNPJ';
        edtRG_IE.EditLabel.Caption := 'Inscrição Estadual';
        edtDT_NASCIMENTO.Enabled := False;

        if not Trim(edtDT_NASCIMENTO.Text).IsEmpty then
          DataSource1.DataSet.FieldByName('DT_NASCIMENTO').Clear;

        DataSource1.DataSet.FieldByName('CPF_CNPJ').EditMask := '99\.999\.999\/9999\-99;0;_';
      end;
  end;
//  edtCPF_CNPJ.SetFocus;
end;

end.
