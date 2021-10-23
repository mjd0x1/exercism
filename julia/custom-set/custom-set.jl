struct CustomSet
    data
    CustomSet(data) = new(Dict(data .=> 1))
end

in(x::Int64,s::CustomSet) = get(s.data, x, "") != ""
empty(s::CustomSet) = length(s) == 0
equal(a::CustomSet,b::CustomSet) =  sort(values(a.data)) == sort(values(b.data))
mypush(s::CustomSet,x::Int64) = begin 
    s.data[x] = 1
    s 
end

myintersect(a::CustomSet,b::CustomSet) = begin

end