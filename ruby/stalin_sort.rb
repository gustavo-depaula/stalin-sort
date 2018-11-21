def stalin_sort(arr)
  return [] if arr.empty?

  max = arr[0]
  arr.select do |x|
    next if max > x
    max = x
    x
  end
end


print(stalin_sort ['a', 'c', 'b', 'a','c','d'])
print(stalin_sort [1, 2, 10, 3, 4, 5, 15, 6, 30, 20])
