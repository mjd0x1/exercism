function isvalid(d, s)
    chars   = [x.match for x in eachmatch(r"[A-Z0-9]", s)]
    if length(chars) != 10 return false end
    if length(match(r"[0-9]*", join(chars[1:9])).match) != 9 return false end
    mod(map(x -> isnumeric(first(x)) ? parse(Int, x) : 10,  [x.match for x in eachmatch(r"[A-Z0-9]", s)]) .* (10:-1:1) |> sum, 11) == 0
end