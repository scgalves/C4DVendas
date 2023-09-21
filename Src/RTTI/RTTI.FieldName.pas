unit RTTI.FieldName;

interface

uses
  System.SysUtils;

type
  FieldName = class(TCustomAttribute)
  private
    FNome: string;
  public
    constructor Create(AName: string);
    property Nome: string read FNome write FNome;
  end;

implementation

{ FieldName }

constructor FieldName.Create(AName: string);
begin
  FNome := AName;
end;

end.
