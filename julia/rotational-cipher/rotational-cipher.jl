
function process(n::Int64,chars::Array{Char,1})
    c = Dict{Char,Int64}()
    s  = 'a':'z'
    [c[s[x+1]] = x  for x = 0:25]
    output = ""
    for i in chars
        if lowercase(i) ∉ s
            output = string(output,i)
        else
            transformCase  =  isuppercase(i) ?  uppercase  :  lowercase
            newCharacter =  s[(c[lowercase(i)] + n)%26+1] |> transformCase
            output = string(output,newCharacter)
        end
    end
    output
end

function rotate(n::Int64,char::Char)
    process(n,[char]) |> first
end

function rotate(n::Int64,chars::String)
    process(n,[chars...])
end

