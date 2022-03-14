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
}