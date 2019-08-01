-- based on the python implementation
stalinSort = (l) ->
  max    = l[1]
  filter = (x) ->
    max = x
    x
  [filter elem for elem in *l when elem >= max]

{ :stalinSort }
