module StalinSort exposing (stalinsort)

stalinsort : List comparable -> List comparable
stalinsort list =
  case list of
    x::y::zs ->
      if x <= y then
        x :: stalinsort (y::zs)
      else
        stalinsort (y::zs)
    _ ->
      list
