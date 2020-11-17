defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna,fn x ->RnaTranscription.process([x]) end)
    |> Enum.join
    |> String.to_charlist
  end

  def process('G') do 'C' end
  def process('C') do 'G' end
  def process('T') do 'A' end
  def process('A') do 'U' end
  def process(_) do '' end


end
