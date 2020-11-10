"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    nucleotides =  ['A','C','G','T']
    output = Dict()

    errors = [strand...] ∩ setdiff('A':'Z',nucleotides)

    if length(errors) > 0 
        throw(DomainError(string(errors), "require " * string(nucleotides))) 
    end
  
    for n ∈ nucleotides
        output[n] = strand == "" ? 0  :  sum([strand...].==n)
    end

    output
end
