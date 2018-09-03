defmodule Quick do
  defp sorted?([]), do: true
  defp sorted?([h|[]]), do: true
  defp sorted?([h|t]) do
    cond do
        sorted?(t)->
            [h2|t]=t
            h2>=h
        true->false
    end
  end
  defp sort2([]), do: []
  defp sort2(l) do
    cond do
        sorted?(l)->l
        sorted?(Enum.reverse(l))->Enum.reverse(l)
        true->sort(l)
    end
  end
  def sort([h|t]) do
     sort2(Enum.filter(t,&(&1<=h))) ++ [h]  ++ sort2(Enum.filter(t,&(&1>h)))
  end
end


arr = Enum.reverse(Enum.map(1..300000, fn x->x end))

IO.puts length(arr)
IO.inspect Enum.shuffle(arr)
IO.inspect Quick.sort(Enum.shuffle(arr))
