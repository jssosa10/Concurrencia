defmodule HOF do

  def map([], _) do [] end
  def map([h|t], fun) do [fun.(h) | map(t, fun)] end

  def filter([], _) do [] end
  def filter([h|t], pred?) do
    fn(true) -> [h | filter(t, pred?)]
      (false) -> filter(t, pred?)
    end.(pred?.(h))
  end

  def fold([], _, id) do id end
  def fold([h|t], op, id) do op.(h, fold(t, op, id)) end

  def flat_map([], fun) when is_function(fun, 1) do
    []
  end
  def flat_map([h | t], fun) do
    case fun.(h) do
      list when is_list(list) -> list ++ flat_map(t, fun)
      other -> Enum.to_list(other) ++ flat_map(t, fun)
    end
  end
end
