"Your optional docstring here"
function distance(a::String, b::String)
    if length(a) != length(b) throw(ArgumentError("Require equal length of vectors")) end
    map((x,y) -> x - y == 0 ? 0 : 1 , Int.([a...]),Int.([b...]))  |> sum
end
