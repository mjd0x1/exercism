defmodule Bob do

  defp containsChar?(s) do
     true in Enum.map(String.split(s,""), fn (x) -> String.match?(x,~r/^\p{L}$/u) end)
  end
  defp shouting?(s) do String.upcase(s) == s && containsChar?(s) end
  defp question?(s) do String.last(s) == "?" end
  defp silent?(s) do String.trim(s) == "" end
  def hey(input) do
    cleaned = String.trim(input)
    cond do
      silent?(cleaned) -> "Fine. Be that way!"
      shouting?(cleaned) && question?(cleaned)  -> "Calm down, I know what I'm doing!"
      shouting?(cleaned) -> "Whoa, chill out!"
      question?(cleaned) -> "Sure."
      true -> "Whatever."
    end
  end
end
