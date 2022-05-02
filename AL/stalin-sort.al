codeunit 50100 StalinSort
{
    procedure StalinSort(a: List of [Integer]) b: List of [Integer]
    var
        i: Integer;
    begin
        if a.Count < 1 then exit;
        b.Add(a.Get(1));
        for i := 2 to a.Count do
            if a.Get(i) >= b.Get(b.Count) then b.Add(a.Get(i));
    end;

    procedure StalinSort(var RecRef: RecordRef; FieldNo: Integer)
    begin
        StalinSort(RecRef, FieldNo, false);
    end;

    procedure StalinSort(var RecRef: RecordRef; FieldNo: Integer; RunTrigger: Boolean)
    var
        Bigger, FldVal : Decimal;
        FldRef: FieldRef;
        IsFirst: Boolean;
    begin
        IsFirst := true;
        if RecRef.FindSet(true) then begin
            repeat
                Clear(FldRef);
                Clear(FldVal);
                FldRef := RecRef.Field(FieldNo);
                if (FldRef.Type <> FldRef.Type::Integer) and (FldRef.Type <> FldRef.Type::BigInteger) and (FldRef.Type <> FldRef.Type::Decimal) then exit;
                if FldRef.Class = FldRef.Class::FlowField then FldRef.CalcField();
                if IsFirst then begin
                    Bigger := FldRef.Value;
                    IsFirst := false;
                end;
                FldVal := RecRef.Field(FieldNo).Value;
                if FldVal >= Bigger then
                    Bigger := FldVal
                else
                    RecRef.Delete(RunTrigger);
            until RecRef.Next() = 0;
        end;
    end;
}