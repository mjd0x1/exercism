struct ISBN <: AbstractString
    data::String
    ISBN(s) = isvalid(ISBN, s) ?  new(split(s, "-") |> join) :  throw(DomainError("invalid ISBN"))  
end

macro isbn_str(s) 
    ISBN(s).data
    
end
    
function isvalid(isbn::Type{ISBN}, s)
    raw  =  split(s, "-") |> join
    valid = match(r"\d{9}[X|\d]", raw)
    if isnothing(valid) return false end 
    if length(raw) != 10 return false end

    mod(sum([isnumeric(first(x)) ? parse(Int, x) : 10  for x in collect(valid.match)] .* (10:-1:1)), 11)  == 0 
end