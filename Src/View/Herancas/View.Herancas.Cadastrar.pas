unit View.Herancas.Cadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB;

type
  TViewHerancasCadastrar = class(TForm)
    pnlDados: TPanel;
    pnlRodape: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DataSource1: TDataSource;
    pnlBtnGravar: TPanel;
    pnlBtnCancelar1: TPanel;
    pnlBtnCancelar2: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarMouseEnter(Sender: TObject);
    procedure btnGravarMouseLeave(Sender: TObject);
    procedure pnlBtnCancelar1Click(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FIdRegistroAlterar: integer;
    FIdAtual: Cardinal;
  public
    property IdRegistroAlterar: integer read FIdRegistroAlterar write FIdRegistroAlterar;
    property IdAtual: Cardinal read FIdAtual;
  end;

var
  ViewHerancasCadastrar: TViewHerancasCadastrar;

implementation

uses
  Utils, Lib.Helper;

{$R *.dfm}

procedure TViewHerancasCadastrar.btnCancelarClick(Sender: TObject);
begin
  if Self.DataSource1.DataSet.State in [dsInsert, dsEdit] then
    Self.DataSource1.DataSet.Cancel;

  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewHerancasCadastrar.btnCancelarMouseEnter(Sender: TObject);
begin
  TUtils.OnMouseEnterButton(Sender);
end;

procedure TViewHerancasCadastrar.btnCancelarMouseLeave(Sender: TObject);
begin
  TUtils.OnMouseLeaveButton(Sender);
end;

procedure TViewHerancasCadastrar.btnGravarClick(Sender: TObject);
begin
  FIdAtual := Self.DataSource1.DataSet.FieldByName('ID').AsInteger;

  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TViewHerancasCadastrar.btnGravarMouseEnter(Sender: TObject);
begin
  Self.pnlBtnGravar.Color := TUtils.C_GREEN_MID_LIGHT;
end;

procedure TViewHerancasCadastrar.btnGravarMouseLeave(Sender: TObject);
begin
  Self.pnlBtnGravar.Color := TUtils.C_GREEN_STRONG;
end;

procedure TViewHerancasCadastrar.FormCreate(Sender: TObject);
begin
  FIdRegistroAlterar := 0;

  TUtils.ColorirPanelsDeBotoes([Self.pnlBtnGravar, Self.pnlBtnCancelar1], TUtils.C_GREEN_STRONG);

  Self.btnGravar.DefaultStyleButton(True);
  Self.btnCancelar.DefaultStyleButton;
end;

procedure TViewHerancasCadastrar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F3: Self.btnGravar.Click;
    VK_F4: // Tecla F4
      if (ssAlt in Shift) then // ... e a tecla Alt pressionadas juntas
        Key := 0;
    VK_ESCAPE: Self.btnCancelar.Click;
  end;
end;

procedure TViewHerancasCadastrar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(CM_DIALOGKEY, VK_TAB, 0);
    Key := #0;
  end;
end;

procedure TViewHerancasCadastrar.FormResize(Sender: TObject);
begin
{  pnlBtnCancelar1.MakeRounded(20);
  pnlBtnCancelar2.MakeRounded(20);
    TUtils.MakeRoundedControl(pnlBtnGravar);}
end;

procedure TViewHerancasCadastrar.pnlBtnCancelar1Click(Sender: TObject);
begin
  btnCancelar.Click;
end;

end.
