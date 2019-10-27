program Stalin;
uses crt;
 
var
   v: array [1..10] of integer = (1, 2, 4, 3, 6, 8, 0, 9, 5, 7);
   sorted: array [1..10] of integer;
   I, fs: integer;
 
procedure stalinSort();
var
   I: integer;
begin
    fs := 1;
    sorted[1] := v[fs];
    for I := 2 to 10 do
    begin
        if v[I] >= sorted[fs] then
        begin
            fs := fs + 1;
            sorted[fs] := v[I]
        end;
    end;
end;
 
begin
    stalinSort();
 
    for I := 1 to fs do
    begin
        write(sorted[I], ' ');
    end;
end.
