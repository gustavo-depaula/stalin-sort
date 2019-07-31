stalin_sort = 
 function (x, y, ...) 
  return (not y or #{...} == 0) and {x} or 
  (function (...) 
    if (y >= x) then
      return {x, unpack(stalin_sort(y, ...))}
     else 
       return stalin_sort(x, ...)
    end
   end) (...)
 end

local list = (stalin_sort(0, 2, 1, 4, 3, 6, 5))
print(table.concat(list, " "))