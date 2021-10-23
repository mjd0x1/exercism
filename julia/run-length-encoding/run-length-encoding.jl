
freq_string(s) = string(count(x -> x == first(x), s) == 1 ? "" : count(x -> x == first(x), s)) * first(s) 
function encode(s)
    last, partitions, _ = reduce(((s, arr, lastchar), x) -> (lastchar == x ? s * x : x, lastchar == x ? arr : [arr
                                                                                                               s], x), s, init=("", [], ""))
    map(x -> x != "" ? freq_string(x) : "", [partitions
                                            last]) |> join
end


first_char = (s) -> first(split(s, r"[A-Za-z ]"))
expand_char(s) = repeat(last(s), first_char(s) == "" ? 1 : parse(Int, first_char(s)))

function decode(s)
    chars = [x.match for x in  eachmatch(r"[1-9]*[a-zA-Z ]", s)]
    map(x -> expand_char(x), chars) |> join
end
