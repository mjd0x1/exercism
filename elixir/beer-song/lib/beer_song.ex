defmodule BeerSong do

  defp action(number) do

    action_store = "Go to the store and buy some more"
    action_takedown = &("Take #{&1} down and pass it around")
    case number do
      0  ->  action_store
      1  ->  action_takedown.("it")
      _ ->   action_takedown.("one")

    end
  end

  defp bottle(number,value) do
    if number == value , do: "bottle", else: "bottles"
  end

  defp count_pre(number) do
    if number  > 0 , do: ~s(#{number}), else: "no more"
  end

  defp count_post(number) do
    cond do
       number == 0 -> ~s(99)
       number  == 1 -> "no more"
       true -> ~s(#{number-1})
    end
  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    ~s"""
    #{String.capitalize(count_pre(number))} #{bottle(number,1)} of beer on the wall, #{count_pre(number)} #{bottle(number,1)} of beer.
    #{action(number)}, #{count_post(number)} #{bottle(number,2)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
      Enum.map_join(range,"\n",&(BeerSong.verse(&1)))
  end
end
