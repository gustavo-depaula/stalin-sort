-- based on the python implementation
stalinSort = (l) ->
  max    = l[1]
  filter = (x) ->
    max = x
    x
  [filter elem for elem in *l when elem >= max]

test = (l) ->
  print "Original: #{table.concat l, ", "}"
  print "Sorted:   #{table.concat (stalinSort l), ", "}"

test {1, 2, 3, 4, 5, 6, 7, 8, 9} -- ordered list
test {9, 8, 7, 6, 5, 4, 3, 2, 1} -- reverse list
test {1, 3, 2, 5, 4, 7, 6, 9, 8} -- mixed list
test {1, 5, 2, 4}                -- test list
