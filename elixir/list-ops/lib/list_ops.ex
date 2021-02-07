defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.


  @spec count(list) :: non_neg_integer
  def count(l) do count_(l,0) end
  defp count_([],acc) do acc end
  defp count_([_ | xs], acc) do
     count_(xs,acc+1)
  end

  @spec reverse(list) :: list
  def reverse(l) do  reverse_(l,[]) end
  defp reverse_([],acc) do acc end
  defp reverse_([x| xs], acc) do
     reverse_(xs, [x | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do map_(l,f,[]) |> reverse end
  defp map_([],_,acc) do acc end
  defp map_([x | xs],f,acc) do
    map_(xs,f, [f.(x) | acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do filter_(l,f,[]) |> reverse end
  defp filter_([], _,acc) do acc end
  defp filter_([x | xs], f,acc) do
      case f.(x) do
          false  -> filter_(xs,f,acc)
          true  ->  filter_(xs,f,[x | acc])
      end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _) do acc end
  def reduce([x | xs], acc, f) do
    reduce(xs,f.(x,acc),f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
     reverse(a)
     |> reduce(b, &([&1 | &2]))
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
     reverse(ll) |> reduce([],&(append(&1,&2)))
  end
end
