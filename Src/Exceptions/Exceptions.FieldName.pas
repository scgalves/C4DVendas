unit Exceptions.FieldName;

interface

uses
  System.SysUtils;

type
  ExceptionsFieldName = class(Exception)
  private
    FFieldName: string;
  public
    constructor Create(AMessage, AFieldName: string); reintroduce;
    property FieldName: string read FFieldName write FFieldName;
  end;

implementation

{ ExceptionsFieldName }

constructor ExceptionsFieldName.Create(AMessage, AFieldName: string);
begin
  Self.Message := AMessage;
  FFieldName := AFieldName;
end;

end.
