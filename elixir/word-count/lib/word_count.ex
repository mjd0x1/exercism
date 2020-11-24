defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    words =  Enum.map(String.split(sentence,~r/[^[:alnum:]-]/u, trim: true), fn x -> String.downcase(x) end)
    keys =  Enum.uniq(words)

    Enum.map(keys, fn t ->  {t,Enum.count(words,&(&1==t))} end)
          |> Map.new

  end
end
