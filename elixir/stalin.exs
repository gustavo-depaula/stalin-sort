# “The tallest blade of grass is the first to be cut by the scythe.” - Russian proverb

# run in terminal `mix run stalin.exs --no-mix-exs`

defmodule Stalin do
  def sort(list, lowest \\ 0) do
    {result, _} =
      Enum.reduce(list, {[], lowest}, fn(num, {acc, lowest}) ->
        if num >= lowest, do: {acc ++ [num], num}, else: {acc, lowest}
      end)

      result
  end
end

unsorted = [1, 3, 2, 5, 4, 7, 6, 9, 8]

IO.puts ("Unsorted: #{inspect unsorted} and then sorted: #{inspect Stalin.sort(unsorted)}")
