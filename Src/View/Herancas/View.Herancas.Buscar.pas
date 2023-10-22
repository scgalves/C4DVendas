unit View.Herancas.Buscar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, FireDAC.Comp.Client, Vcl.Mask;

type
  TViewHerancasBuscar = class(TForm)
    GridPanel1: TGridPanel;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Atualizar1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    edtBuscar: TLabeledEdit;
    pnlFiltroCombo: TPanel;
    lblFiltroCombo: TLabel;
    cmbFiltroCombo: TComboBox;
    DBGrid1: TDBGrid;
    rdgFiltros: TRadioGroup;
    lbTotal: TLabel;
    pnlBtnCadastrar1: TPanel;
    pnlBtnCadastrar2: TPanel;
    btnCadastrar: TSpeedButton;
    pnlBtnAlterar1: TPanel;
    pnlBtnAlterar2: TPanel;
    btnAlterar: TSpeedButton;
    pnlBtnUtilizar1: TPanel;
    pnlBtnUtilizar2: TPanel;
    btnUtilizar: TSpeedButton;
    pnlBtnFechar1: TPanel;
    pnlBtnFechar2: TPanel;
    btnFechar: TSpeedButton;
    pnlRodape: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnUtilizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBuscarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure rdgFiltrosClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnCadastrarMouseLeave(Sender: TObject);
    procedure btnCadastrarMouseEnter(Sender: TObject);
  private
    FIdAtual: Cardinal;
    FIdSelecionado: Cardinal;
  protected
    procedure BuscarDados; virtual; // Dentro de protected para que os formulários filhos possam executar o mesmo método
    procedure ChamarTelaCadastrar(const AId: Integer = 0); virtual; abstract; // abstract = a implementação do método deverá ser feita por quem herdar o form
  public
    property IdAtual: Cardinal write FIdAtual;
    property IdSelecionado: Cardinal read FIdSelecionado write FIdSelecionado;
  end;

  TDBGridPadrao = class(TCustomDBGrid);

var
  ViewHerancasBuscar: TViewHerancasBuscar;

implementation

uses
  Utils, Lib.Helper, Consts;

{$R *.dfm}

procedure TViewHerancasBuscar.Atualizar1Click(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.btnAlterarClick(Sender: TObject);
begin
  if Self.DataSource1.DataSet.IsEmpty then
    raise Exception.Create('Selecione um registro.');

  FIdAtual := Self.DataSource1.DataSet.FieldByName('ID').AsInteger;
  Self.ChamarTelaCadastrar(Self.DataSource1.DataSet.FieldByName('ID').AsInteger);
end;

procedure TViewHerancasBuscar.btnCadastrarClick(Sender: TObject);
begin
  FIdAtual := 0;
  if not Self.DataSource1.DataSet.IsEmpty then
    FIdAtual := Self.DataSource1.DataSet.FieldByName('ID').AsInteger;

  Self.ChamarTelaCadastrar;
end;

procedure TViewHerancasBuscar.btnCadastrarMouseEnter(Sender: TObject);
begin
  TUtils.OnMouseEnterButton(Sender);
end;

procedure TViewHerancasBuscar.btnCadastrarMouseLeave(Sender: TObject);
begin
  TUtils.OnMouseLeaveButton(Sender);
end;

procedure TViewHerancasBuscar.btnFecharClick(Sender: TObject);
begin
  Self.Close;
  Self.ModalResult := mrCancel;
end;

procedure TViewHerancasBuscar.btnUtilizarClick(Sender: TObject);
begin
  if Self.DataSource1.DataSet.IsEmpty then
    raise Exception.Create('Selecione um registro.');

  FIdSelecionado := Self.DataSource1.DataSet.FieldByName('ID').AsInteger;
  Self.Close;
  Self.ModalResult := mrOk;
end;

procedure TViewHerancasBuscar.BuscarDados;
begin
//  Self.lbTotal.Caption := 'Registros localizados: 000000';
  Self.lbTotal.Caption := 'Registros localizados: 0';
  if Self.DataSource1.DataSet.IsEmpty then
     Exit;

//  Self.lbTotal.Caption := 'Registros localizados: ' + FormatFloat('000000', Self.DataSource1.DataSet.RecordCount);
  Self.lbTotal.Caption := 'Registros localizados: ' + FormatFloat(',0', Self.DataSource1.DataSet.RecordCount);

  Self.DataSource1.DataSet.Locate('ID', FIdAtual, []);
end;

procedure TViewHerancasBuscar.DBGrid1DblClick(Sender: TObject);
begin
  Self.btnAlterar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
//  if Odd(Self.DataSource1.DataSet.RecNo) then
//    Self.DBGrid1.Canvas.Brush.Color := $00DDDDDD;
//
//  Self.DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if not (Sender as TDBGrid).DataSource.DataSet.RecNo mod 2 = 0 then // Se ao dividir por 2, o resto <> 0
    if not (gdSelected in State) then // se a célula não está selecionada
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := Consts.C_GREY_LIGHT; // define uma cor de fundo da linha
      (Sender as TDBGrid).Canvas.FillRect(Rect); // pinta a célula
      (Sender as TDBGrid).DefaultDrawDataCell(rect, Column.Field, State); // pinta o texto padrão
    end;
//  Self.DBGrid1.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

procedure TViewHerancasBuscar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Self.btnUtilizar.Click;
end;

procedure TViewHerancasBuscar.DBGrid1TitleClick(Column: TColumn);
var
  LCampo,
    LOrdem: string;
  I: Cardinal;
begin
  if Self.DataSource1.DataSet.IsEmpty then
    Exit;

  for I := 0 to Pred(Self.DBGrid1.Columns.Count) do
//    Self.DBGrid1.Columns[I].Title.Font.Style := []; // Remove os estilos de fontes das colunas
    Self.DBGrid1.Columns[I].Title.Font.Color := Consts.C_WHITE; // Cor da fonte do título

  LCampo := Column.FieldName.Trim;
  if (LCampo.IsEmpty) or (Column.Field.FieldKind in [fkCalculated, fkLookup, fkAggregate]) or
    (Column.Field.DataType in [ftBlob, ftMemo]) then
    Exit;

  if (not TFDQuery(DataSource1.DataSet).IndexFieldNames.Contains(LCampo + ':D')) and
    (not TFDQuery(DataSource1.DataSet).IndexFieldNames.Contains(LCampo + ':A')) then
    LOrdem := LCampo + ':A' // Crescente (primeira vez que clicou na coluna)
  else
    if not TFDQuery(DataSource1.DataSet).IndexFieldNames.Contains(LCampo + ':D') then
      LOrdem := LCampo + ':D' // Decrescente
    else
      LOrdem := LCampo + ':A';
  TFDQuery(Self.DataSource1.DataSet).IndexFieldNames := LOrdem;
  TFDQuery(Self.DataSource1.DataSet).First;

//  Column.Title.Font.Style := [fsBold]; // Negrito na fonte da coluna selecionada
  Column.Title.Font.Color := Consts.C_BLACK;//C_GREEN_STRONG;//C_COR_FUNDO_TITULO_COLUNA_DBGRID;
end;

procedure TViewHerancasBuscar.edtBuscarChange(Sender: TObject);
begin
  Self.BuscarDados;
end;

procedure TViewHerancasBuscar.edtBuscarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP: Self.DataSource1.DataSet.Prior;
    VK_DOWN: Self.DataSource1.DataSet.Next;
  end;
end;

procedure TViewHerancasBuscar.edtBuscarKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (not Self.DataSource1.DataSet.IsEmpty) then
    Self.btnUtilizar.Click;
end;

procedure TViewHerancasBuscar.Excluir1Click(Sender: TObject);
var
  LRecNo: Cardinal;
begin
  LRecNo := 1;

  if Self.DataSource1.DataSet.IsEmpty then
    raise Exception.Create('Selecione um registro.');

  if Application.MessageBox('Confirma a exclusão deste registro?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes then
    Self.DataSource1.DataSet.Delete
  else
    LRecNo := Self.DataSource1.DataSet.RecNo;

  Self.BuscarDados;
  Self.DataSource1.DataSet.RecNo := LRecNo;
end;

procedure TViewHerancasBuscar.FormCreate(Sender: TObject);
begin
  TUtils.ColorirPanelsDeBotoes([Self.pnlBtnAlterar1, Self.pnlBtnCadastrar1, Self.pnlBtnUtilizar1, Self.pnlBtnFechar1],
    Consts.C_GREEN_STRONG);

  TUtils.EstiloPadraoEmBotoesSemGravar([Self.btnCadastrar, Self.btnAlterar, Self.btnUtilizar, Self.btnFechar]);

  Self.lbTotal.Caption := 'Registros localizados: 0';
end;

procedure TViewHerancasBuscar.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
//    VK_MENU: // Tecla Alt
    VK_F4: // Tecla F4
      if (ssAlt in Shift) then // ... e a tecla Alt pressionadas juntas
        Key := 0;
    VK_ESCAPE: Self.btnFechar.Click;
  end;

  if Key in [VK_F1..VK_F12] then
    if Self.rdgFiltros.Items.Count > 1 then
       Self.rdgFiltros.ItemIndex := Key - VK_F1;
end;

procedure TViewHerancasBuscar.FormShow(Sender: TObject);
begin
  FIdSelecionado := 0;
  Self.DBGrid1.ColumnHeaderStyle;
  Self.DBGrid1.DefaultOptions;
//  TDBGridPadrao(Self.DBGrid1).DefaultRowHeight := 30;
//  TDBGridPadrao(Self.DBGrid1).ClientHeight := (30 * TDBGridPadrao(Self.DBGrid1).RowCount) + 30;
  Self.ModalResult := mrCancel;
  Self.edtBuscar.SetFocus;
end;

procedure TViewHerancasBuscar.rdgFiltrosClick(Sender: TObject);
begin
  if edtBuscar.Text <> '' then
    Self.BuscarDados;
  Self.edtBuscar.SetFocus;
end;

end.
