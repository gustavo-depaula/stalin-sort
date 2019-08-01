defmodule StalinSort do
  def sort(list) do
    list
      |> Enum.with_index
      |> Enum.reduce([], fn({number, index}, acc) -> 
        is_ordered = index == 0 || number > Enum.at(acc, -1)
        case is_ordered do
            true ->  acc ++ [number]
            false -> acc
        end
      end)
  end
end
