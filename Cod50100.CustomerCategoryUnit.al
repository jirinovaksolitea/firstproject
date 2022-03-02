codeunit 50100 "Customer Category Unit"
{
    procedure GetIdentifier(IntVal: Integer; IntLen: Integer): Text;
    var
        TextVal: Text;
    begin
        TextVal := Format(IntVal);
        exit(PadStr('', IntLen - StrLen(TextVal), '0') + TextVal);
    end;

    procedure FreeIdentifier(Prefix: Text) FreeId: Text
    var
        CustomerCategory: Record "Customer Category";
        Counter: Integer;
    begin
        Counter := 1;
        FreeId := 'NONE';
        While Counter < 100000 do begin
            FreeId := Prefix + GetIdentifier(Counter, 5);
            if not CustomerCategory.Get(FreeId) then
                break;
            Counter += 1;
        end;
    end;

    procedure FreeIdentifier(): Text
    begin
        exit(FreeIdentifier('DEFAULT'));
    end;

    procedure ProcShowOption(Par: Option abc,,"d e",xz)
    begin
        Message('Par1: %1', Par);
    end;

    procedure ProcWithOptionalParam(Param1: Integer)
    begin

    end;

    var
        Param1: Integer;
}