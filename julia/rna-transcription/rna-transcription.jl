const RNA_DATA = Dict('C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U')

function to_rna(dna)
   
    if map(x -> x ∉ keys(RNA_DATA), collect(dna)) |> any
        throw(ErrorException("Invalid nucleotide"))
    end
    map(x -> RNA_DATA[x], dna)

end

