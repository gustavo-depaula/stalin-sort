def stalin_sort(arr)
  [] if arr.empty?

  max = arr[0]
  arr.select.with_index do |x,i| 
    max = x if i == 0 or x > max
    x >= max
  end
end


print(stalin_sort ['a', 'c', 'b', 'a','c','d'])
print(stalin_sort [1, 2, 10, 3, 4, 5, 15, 6, 30, 20])
