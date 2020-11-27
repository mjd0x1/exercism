function rotate(n::Int64,chars::String)
    offsets  = ((0:25) .+13) .% 26 .+ 1
    chars[offsets]
end