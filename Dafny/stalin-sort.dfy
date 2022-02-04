predicate sorted(a: array<int>)
reads a
{   if a.Length <= 1 then true 
   else  forall j, k :: 0 <= j < k < a.Length ==> a[j] <= a[k]
}



method append<T>(items:array<T>,item:T) returns (r:array<T>)
ensures fresh(r);
ensures items == old(items);
ensures r[items.Length] == item;
ensures r.Length == items.Length + 1 ;
ensures forall i :nat :: i < items.Length ==> r[i] == old(items[i]);
{
   var nitems := new T[items.Length+1](i requires 0<=i<items.Length+1 => item);
   var i:nat := 0 ;
   while (i < items.Length)
   invariant  && i <= items.Length ;
   invariant forall j:nat :: j<i ==> nitems[j] == items[j];
   invariant nitems[items.Length] == item;
   modifies nitems ;
   {
      nitems[i] := items[i] ;
      i := i + 1 ;
   }
   return nitems ;
}


 
method StalinSort(items:array<int>) returns (result:array<int>)
ensures sorted(result);
ensures result.Length <= items.Length;
ensures forall k:nat:: k < result.Length ==> result[k] in items[..];
{
   if (items.Length <= 1) {
        return items;
   }

   var temp    := new int[1];
   var max:int := items[0];
   temp[0]     := items[0];

   for i:int := 1 to items.Length
   invariant 0 < i <= items.Length;
   invariant sorted(temp);
   invariant temp.Length <= i;
   invariant forall k:nat:: k < temp.Length ==> temp[k] in items[..];
   invariant forall k:nat:: k < temp.Length ==> temp[k] <= max;
   {
      if(items[i] >= max){
         max  := items[i];
         temp := append(temp,max);
      }
   }
   return temp;
} 

method Main()
{
   var  a:= new int[6];
   a[0],a[1],a[2],a[3],a[4],a[5]:= 1,2,4,4,3,6;
   var k := 0 ;
   var j := StalinSort(a);
   while( k < j.Length ) { print j[k], ", " ; k := k+1 ; }
   print "\n";
   return;
}
