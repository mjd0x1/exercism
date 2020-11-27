defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    words =  String.split(String.downcase(sentence), ~r/[^[:alnum:]-]/u, trim: true)

      #Enum.uniq(words)
      #  |>  Enum.map(fn t -> {t,Enum.count(words,&(&1==t))} end)
      #  |> Map.new

    words  |> Enum.reduce(%{}, fn x, acc -> Map.update(acc,x,1,&(&1+1))  end)

  end
end
