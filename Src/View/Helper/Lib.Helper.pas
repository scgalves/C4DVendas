unit Lib.Helper;

interface

uses
  Vcl.Controls, Winapi.Windows, Vcl.Graphics, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TWinControlHelper = class helper for Vcl.Controls.TWinControl
  private
  public
    /// <summary>Cantos arredondados no componente.</summary>
    /// <param name="ACornerRadius: SmallInt = 8">O tamanho do raio.</param>
    procedure MakeRounded(ACornerRadius: SmallInt = 8);
  end;

  TDBGridHelper = class helper for TDBGrid
  private
  public
    /// <summary>Estilo do cabe�alho das coluna em DBGrid.</summary>
    procedure ColumnHeaderStyle;

    /// <summary>Op��es default para a propriedade Options do componente.</summary>
    procedure DefaultOptions;
  end;

  TSpeedButtonHelper = class helper for TSpeedButton
  private
  public
    /// <summary>Estilo padr�o para o bot�o.</summary>
    /// <param name="AGravar: Boolean = False">
    ///   O padr�o <c>False</c> � para a maioria dos bot�es. <c>True</c> � somente para o bot�o Gravar.
    /// </param>
    procedure DefaultStyleButton(AGravar: Boolean = False);
  end;

implementation

uses
  Winapi.Messages, Utils, System.Classes, Vcl.Forms;

{ TWinControlHelper }

procedure TWinControlHelper.MakeRounded(ACornerRadius: SmallInt);
var
  rgn: HRGN;
  dc: HDC;
begin
  Assert(ACornerRadius > -1);
  rgn := CreateRoundRectRgn(0, 0, Self.Width, Self.Height, ACornerRadius, ACornerRadius);
  dc := GetDC(Self.Handle);
  SetWindowRgn(Self.Handle, rgn, True);
  ReleaseDC(Self.Handle, dc);
  DeleteObject(rgn);
end;

{ TDBGridHelper }

procedure TDBGridHelper.ColumnHeaderStyle;
var
  i: integer;
begin
  Self.DrawingStyle := gdsClassic;
  for i := 0 to Pred(Self.Columns.Count) do
  begin
    Self.Columns[i].Title.Color := TUtils.C_GREEN_MID_LIGHT;//C_COR_FUNDO_TITULO_COLUNA_DBGRID;//C_AZUL_3;
    Self.Columns[i].Title.Alignment := taCenter;
  end;
  Self.TitleFont.Color := TUtils.C_WHITE;
  Self.TitleFont.Style := [fsBold];
//  end;
end;

procedure TDBGridHelper.DefaultOptions;
begin
  Self.Align := alClient;
  Self.AlignWithMargins := True;
  Self.BorderStyle := bsNone;
  Self.DrawingStyle := gdsClassic;
  Self.Margins.Bottom := 8;
  Self.Margins.Left := 8;
  Self.Margins.Right := 8;
  Self.Margins.Top := 8;
  Self.Options := Self.Options - [dgEditing, dgColLines, dgRowLines, dgIndicator] +
    [dgRowSelect, dgAlwaysShowSelection];
  Self.FixedColor := TUtils.C_GREEN_MID_LIGHT;//C_COR_FUNDO_TITULO_COLUNA_DBGRID;
end;

{ TSpeedButtonHelper }

procedure TSpeedButtonHelper.DefaultStyleButton(AGravar: Boolean = False);
begin
  case AGravar of
    True: Self.Font.Color := TUtils.C_WHITE;
    False: Self.Font.Color := TUtils.C_GREEN_STRONG; // Par�metro padr�o
  end;
  Self.Font.Size := 10;
  Self.Font.Style := [fsBold];
  Self.Flat := True;
  Self.Cursor := crHandPoint;
end;

end.
