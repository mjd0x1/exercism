"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

function count_nucleotides(strand)
    
    output = Dict('A' => 0 ,'C' => 0 ,'G' => 0,'T' => 0)

    for s in strand
        if s in keys(output) 
            output[s] = get(output,s,0) + 1
        else
            throw(DomainError(string(s), "require " * string(keys(output))))
        end
    end
    output
    
end
