
const chars = 'a':'z' 
const lookup = Dict(chars .=> 26:-1:1)

letters  =  s ->  filter(x -> isletter(x) || isnumeric(x), s) |> lowercase
cipher  = s -> map(x -> isnumeric(x) ? x :  chars[lookup[x]], letters(s)) |> join

encode(input) = cipher(input) |> s ->  join([join(x) for x in Iterators.partition(s, 5)], " ") 
decode  = cipher
