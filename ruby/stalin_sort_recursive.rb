def stalin_sort(array, prev = nil)
  first, *rest = *array
  if first.nil?
    []
  elsif prev.nil? || first >= prev
    [first, *stalin_sort(rest, first)]
  else
    stalin_sort(rest, prev)
  end
end
