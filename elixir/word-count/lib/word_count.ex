defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    cleaned = String.to_charlist(sentence)
        |> Enum.filter(&(&1 not in [?!,?&,?£,?@,?$,?%,?^,?*,?:,?,]))
        |> List.to_string
        |> String.replace("_"," ")


    words = String.split(cleaned," ")
            |>  (&Enum.map(&1,fn t -> String.downcase(t) end)).()
            |> Enum.filter(&(&1!=""))

    keys =  Enum.uniq(words)

    Enum.map(keys, fn t ->  {t,Enum.count(words,&(&1==t))} end)
          |> Map.new

  end
end
