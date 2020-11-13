function to_rna(dna)
    d = Dict('C' => 'G' , 'G' => 'C' , 'T' => 'A', 'A' => 'U')
    if map(x-> x ∉ keys(d), [dna...]) |> any
        throw(ErrorException("Invalid nucleotide"))
    end
    map(x-> d[x], dna)
end

