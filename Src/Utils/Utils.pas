unit Utils;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, Vcl.Forms, Vcl.Controls, Vcl.ComCtrls, Exceptions.FieldName,
  Vcl.Graphics, Vcl.ExtCtrls, Vcl.Buttons;

type
  TUtils = class
  private
    class procedure SetFocusComponent(AWinControl: TWinControl);
  public
    const C_GREEN_STRONG: TColor = $00376300;//$00D77800;//$00DA9C73; // Ex.: cor de botão sem foco; borda de botão
    const C_GREEN_MID_LIGHT: TColor = $0062AD05;//$0074CF06;//$00FF0000; // Ex.: cor de botão com foco
    const C_GREEN_LIGHT: TColor = $0000D484;//$000BA839;
//    const C_COR_FUNDO_TITULO_COLUNA_DBGRID: TColor = $00E8C9A8; // Ex.: fundo dos títulos das colunas em DGBrids
//    const C_AZUL_4: TColor = $00FFEFDF;
//    const C_AZUL_5: TColor = $00D77800;
    const C_WHITE: TColor = $00FFFFFF;
    const C_BLACK: TColor = $00000000;
    const C_GREY_LIGHT: TColor = $00EBEBEB; // Ex.: fundo dos linhas em DGBrids
//    const C_COR_FUNDO_TITULO_COLUNA_DBGRID2: TColor = $000000FF;//$006D5545; // Ex.: fundo dos títulos das colunas em DBGrid
    class procedure TratarExceptionsFieldName(const AForm: TForm; const E: ExceptionsFieldName);
    class procedure MakeRoundedControl(AControl: TWinControl);
    class procedure ColorirPanelsDeBotoes(const APanels: TArray<TPanel>; const ACor: TColor);

    /// <summary>Habilita ou Desablita objetos de uma lista.</summary>
    /// param name="AControls: TArray<TControl>"Array de objetos.</param>
    /// param name="ADesabilitar: Boolean = True"Informar <c>False</c> quando for para Desabilitar os objetos.</param>
    class procedure HabilitarDesabilitarObjetos(const AControls: TArray<TControl>; const ADesabilitar: Boolean = True);

    /// <summary>Mostra ou Oculta objetos de uma lista.</summary>
    /// param name="AControls: TArray<TControl>"Array de objetos.</param>
    /// param name="AOcultar: Boolean = True"Informar <c>False</c> quando for para Mostrar os objetos.</param>
    class procedure MostrarOcultarObjetos(const AControls: TArray<TControl>; const AOcultar: Boolean = True);
    class procedure EstiloPadraoEmBotoesSemGravar(const AButtons: TArray<TSpeedButton>);

    /// <summary>
    ///   Configura o layout do botão ao passar o mouse sobre.
    /// </summary>
    class procedure OnMouseEnterButton(const Sender: TObject);

    /// <summary>
    ///   Configura o layout do botão ao perder o foco do mouse.
    /// </summary>
    class procedure OnMouseLeaveButton(const Sender: TObject);

    class function CpfValido(const ACpf: string): Boolean;

    class function CnpjValido(const ACnpj: string): Boolean;

    class function EmailValido(const AEmail: string): Boolean;
  end;

implementation

uses
  RTTI.FieldName, Winapi.Windows, Winapi.Messages, Lib.Helper, System.StrUtils, RegularExpressions;

{ TUtils }

class procedure TUtils.TratarExceptionsFieldName(const AForm: TForm; const E: ExceptionsFieldName);
var
   LRttiContext: TRttiContext;
   LRttiType: TRttiType;
   LRttiField: TRttiField;
   LCustomAttribute: TCustomAttribute;
   LFieldName: FieldName;
   LComponent: TComponent;
begin
  LRttiContext := TRttiContext.Create;
  LRttiType := LRttiContext.GetType(AForm.ClassInfo);
  for LRttiField in LRttiType.GetFields do
  begin
    if LRttiField.Parent <> LRttiType then // Para não se ocupar com os componentes do form parent
      Continue;

    for LCustomAttribute in LRttiField.GetAttributes do
    begin
      if not (LCustomAttribute is FieldName) then
        Continue;

      LFieldName := FieldName(LCustomAttribute);
      if LFieldName.Nome.ToUpper <> E.FieldName then
        Continue;

      LComponent := AForm.FindComponent(LRttiField.Name);
      if LComponent = nil then
        Continue;

      if not (LComponent is TWinControl) then
        Continue
      else
        Self.SetFocusComponent(TWinControl(LComponent));
    end;
  end;

  raise Exception.Create(E.Message);
end;

class function TUtils.CnpjValido(const ACnpj: string): Boolean;
{https://www.devmedia.com.br/validando-o-cnpj-em-uma-aplicacao-delphi/22372}
var
  dig13, dig14: string;
  sm, i, r, peso: integer;
begin
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do ACnpj em um número
      sm := sm + (StrToInt(ACnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
{$WARNINGS OFF}
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico
{$WARNINGS ON}

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(ACnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
{$WARNINGS OFF}
    else str((11-r):1, dig14);
{$WARNINGS ON}

{ Verifica se os digitos calculados conferem com os digitos informados. }
    Result := ((dig13 = ACnpj[13]) and (dig14 = ACnpj[14]));
  except
    Result := False;
  end;
end;

class procedure TUtils.ColorirPanelsDeBotoes(const APanels: TArray<TPanel>; const ACor: TColor);
var
  I: Word;
begin
  for I := Low(APanels) to High(APanels) do
    TPanel(APanels[I]).Color := ACor;
end;

class function TUtils.CpfValido(const ACpf: string): Boolean;
{https://www.devmedia.com.br/forum/verificar-o-cnpj-como-faco/132387}
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9:integer;
  d1,d2:integer;
  digitado, calculado:string;
begin
  n1:= StrToInt(ACpf[1]);
  n2:= StrToInt(ACpf[2]);
  n3:= StrToInt(ACpf[3]);
  n4:= StrToInt(ACpf[4]);
  n5:= StrToInt(ACpf[5]);
  n6:= StrToInt(ACpf[6]);
  n7:= StrToInt(ACpf[7]);
  n8:= StrToInt(ACpf[8]);
  n9:= StrToInt(ACpf[9]);
  d1:= n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:= 11-(d1 mod 11);
  if d1>=10 then
    d1:=0;
  d2:= d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:= 11-(d2 mod 11);
  if d2>=10 then
    d2:=0;
  calculado:= inttostr(d1)+inttostr(d2);
  digitado:= ACpf[10]+ACpf[11];

  Result := calculado = digitado;
end;

class function TUtils.EmailValido(const AEmail: string): Boolean;
var
  RegEx: TRegEx;
begin
  RegEx := TRegex.Create('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  Result := RegEx.Match(AEmail).Success;
end;

class procedure TUtils.EstiloPadraoEmBotoesSemGravar(const AButtons: TArray<TSpeedButton>);
var
  I: Word;
begin
  for I := Low(AButtons) to High(AButtons) do
    TSpeedButton(AButtons[I]).DefaultStyleButton;
end;

class procedure TUtils.HabilitarDesabilitarObjetos(const AControls: TArray<TControl>; const ADesabilitar: Boolean = True);
var
  I: Word;
begin
  for I := Low(AControls) to High(AControls) do
    TControl(AControls[I]).Enabled := ADesabilitar = False;
end;

class procedure TUtils.MakeRoundedControl(AControl: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with AControl do
  begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
    Perform(EM_GETRECT, 0, lParam(@r));
    InflateRect(r, - 5, - 5);
    Perform(EM_SETRECTNP, 0, lParam(@r));
    SetWindowRgn(Handle, rgn, True);
    Invalidate;
  end;
end;

class procedure TUtils.MostrarOcultarObjetos(const AControls: TArray<TControl>; const AOcultar: Boolean);
var
  I: Word;
begin
  for I := Low(AControls) to High(AControls) do
    TControl(AControls[I]).Visible := AOcultar = False;
end;

class procedure TUtils.OnMouseEnterButton(const Sender: TObject);
var
  LControl1,
    LControl2: TControl;
  S: string;
begin
  if Sender.ClassType <> TSpeedButton then
    raise Exception.Create('Somente componentes da classe TSpeedButton podem usar este método.');

  if (Sender as TSpeedButton).Tag = 1 then
    Exit;

  LControl2 := (Sender as TControl).Parent;
  if LControl2.ClassType <> TPanel then
    raise Exception.Create('A classe do Parent do botão está errada. Classe suportada: TPanel. O botão tem que estar' +
      ' dentro de um TPanel.');

  S := RightStr(LControl2.Name, 1);
  if S <> '2' then
    raise Exception.Create('O nome do Parent do botão ' + (Sender as TSpeedButton).Name + ' tem que terminar com "2".' +
      ' Ex.: pnlBtnCadastrar2.');

  LControl1 := (LControl2 as TControl).Parent;
  if LControl1.ClassType <> TPanel then
    raise Exception.Create('A classe do Parent do Parent do botão está errada. Classe suportada: TPanel. O botão tem' +
      ' que estar dentro de um TPanel, e este dentro de um TPanel.');

  S := RightStr(LControl1.Name, 1);
  if S <> '1' then
    raise Exception.Create('O nome do Parent do Parent do botão ' + (Sender as TSpeedButton).Name + ' tem que' +
      ' terminar com "1". Ex.: pnlBtnCadastrar1.');

  (LControl1 as TPanel).Color := TUtils.C_GREEN_MID_LIGHT;
  (Sender as TSpeedButton).Font.Color := TUtils.C_GREEN_MID_LIGHT;
  (Sender as TSpeedButton).Tag := 1;
end;

class procedure TUtils.OnMouseLeaveButton(const Sender: TObject);
var
  LControl1,
    LControl2: TControl;
  S: string;
begin
  if Sender.ClassType <> TSpeedButton then
    raise Exception.Create('Somente componentes da classe TSpeedButton podem usar este método.');

  (Sender as TSpeedButton).Tag := 0;
  (Sender as TSpeedButton).Font.Color := TUtils.C_GREEN_STRONG;

  LControl2 := (Sender as TControl).Parent;
  if LControl2.ClassType <> TPanel then
    raise Exception.Create('A classe do Parent do botão está errada. Classe suportada: TPanel. O botão tem que estar' +
      ' dentro de um TPanel.');

  S :=  RightStr(LControl2.Name, 1);
  if S <> '2' then
    raise Exception.Create('O nome do Parent do botão ' + (Sender as TSpeedButton).Name + ' tem que terminar com "2".' +
      ' Ex.: pnlBtnCadastrar2.');

  LControl1 := (LControl2 as TControl).Parent;
  if LControl1.ClassType <> TPanel then
    raise Exception.Create('A classe do Parent do Parent do botão está errada. Classe suportada: TPanel. O botão tem' +
      ' que estar dentro de um TPanel, e este dentro de um TPanel.');

  S := RightStr(LControl1.Name, 1);
  if S <> '1' then
    raise Exception.Create('O nome do Parent do Parent do botão ' + (Sender as TSpeedButton).Name + ' tem que' +
      ' terminar com "1". Ex.: pnlBtnCadastrar1.');

  (LControl1 as TPanel).Color := TUtils.C_GREEN_STRONG;
end;

class procedure TUtils.SetFocusComponent(AWinControl: TWinControl);
var
  LParent: TComponent;
begin
  LParent := AWinControl.Parent;
  while (LParent <> nil) and (LParent.ClassParent <> TForm) do
  begin
    if (LParent is TTabSheet) then
      if not TTabSheet(LParent).Showing then
        TTabSheet(LParent).Show;

    LParent := TWinControl(LParent).Parent;
  end;

  if AWinControl.CanFocus then
    AWinControl.SetFocus;
end;

end.
