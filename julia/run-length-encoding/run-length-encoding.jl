
function encode(s)
    groups = [x.match for x in  eachmatch(r"(.)\1*", s)]
    [string(length(x) > 1 ? length(x) : "") * first(x) for x in groups] |> join
end

function decode(s)
    words = [x.match for x in  eachmatch(r"[1-9]*[a-zA-Z ]", s)]
    numbers =  map(x -> length(x) == 1 ? 1 : parse(Int, split(x, isletter)[1]), words)  
    letters  =  map(x -> last(x), words)
    map((x, y) -> repeat(y, x), numbers, letters) |> join
end
