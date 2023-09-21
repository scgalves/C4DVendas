unit View.Cidades.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Herancas.Cadastrar, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, RTTI.FieldName;

type
  TViewCidadesCadastrar = class(TViewHerancasCadastrar)
    GridPanel1: TGridPanel;
    pnlUf: TPanel;
    lblUf: TLabel;
    [FieldName('UF')]
    cmbUf: TDBComboBox;
    edtID: TDBLabeledEdit;
    [FieldName('NOME')]
    edtNOME: TDBLabeledEdit;
    [FieldName('CODIGO_IBGE')]
    edtCODIGO_IBGE: TDBLabeledEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

{var
  ViewCidadesCadastrar: TViewCidadesCadastrar;}

implementation

uses
  Model.Cidades.DM, Exceptions.FieldName, Utils;

{$R *.dfm}

procedure TViewCidadesCadastrar.btnGravarClick(Sender: TObject);
begin
  try
    DataSource1.Dataset.Post;
  except on E: ExceptionsFieldName do
    TUtils.TratarExceptionsFieldName(Self, E);
  end;
  inherited;
end;

procedure TViewCidadesCadastrar.FormShow(Sender: TObject);
begin
  inherited;
  ModelCidadesDM.CadastrarGet(inherited IdRegistroAlterar);

  if DataSource1.DataSet.IsEmpty then
    DataSource1.DataSet.Append
  else
    DataSource1.DataSet.Edit;

//  edtNOME.SetFocus;
end;

end.
