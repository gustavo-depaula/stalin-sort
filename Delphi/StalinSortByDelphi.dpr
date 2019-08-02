(*
 * Stalin Sort by Delphi 10.3.2
 * If you want to compile this code, please download Delphi 10.3.2
 *   https://www.embarcadero.com/jp/products/delphi/starter
 *)

program StalinSortByDelphi;

{$APPTYPE CONSOLE}

function StalinSort(const iTarget: TArray<Integer>): TArray<Integer>;
begin
  Result := [];

  var H := High(iTarget);
  if H < 0 then
    Exit;

  Result := [iTarget[0]];

  for var i := 1 to H do
    if Result[High(Result)] < iTarget[i] then
      Result := Result + [iTarget[i]];
end;

begin
  var SortedNums := StalinSort([1, 2, 4, 3, 6, 8, 0, 9, 5, 7]);

  for var N in SortedNums do
    Write(N, ' ');

  Readln;
end.
