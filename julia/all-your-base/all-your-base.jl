# Implement number base conversion

function all_your_base(d, base_in, base_out)
    if base_in < 2 throw(DomainError("input base must be > 1")) end
    if base_out < 2 throw(DomainError("output base must be > 1")) end
    if d == [] return [0] end
    if any(x -> x < 0,  d) throw(DomainError("digits must be +ive")) end
    if any(x -> x > base_in - 1,  d) throw(DomainError("digits must be +ive")) end
    
    powers = base_in.^(length(d) - 1:-1:0)
    digits(powers'd, base=base_out) |> reverse
end

function base_convert(n, base)

    digits = []
    for k = floor(log(base, n)):-1:0
        push!(digits, div(n, base^k)) 
        n = mod(n, base^k)
    end
    digits
end