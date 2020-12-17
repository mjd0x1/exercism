defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(integer) :: String.t()
  def numeral(number) do
    divisions = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
    keys =  ["M","CM","D", "CD","C","XC","L","XL","X","IX","V","IV","I"]
    process(number,"",divisions,keys)
  end

  @spec process(0, any, any, any) :: any
  def process(0,acc,_,_) do acc end
  def process(n ,acc,[dh | dt],[kh | kt]) do
    d =div(n,dh)
    vals =  [1,10,100,1000]
    cond do
        d > 0 && dh in vals ->
          process(rem(n,dh),acc <> String.duplicate(kh,d),dt,kt)
        d > 0 &&  dh not in vals ->
          process(rem(n,dh),acc <> kh,dt,kt)
        true ->
          process(n,acc,dt,kt)
    end
  end

end
