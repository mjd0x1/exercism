import Base:isempty,push!,length,==,copy,size,getindex,iterate

struct CustomSet <: AbstractSet{Int64}
    data
    keys
    CustomSet(data) = new(Dict(data .=> 1), data)
end


in(x::Int64,s::CustomSet) = get(s.data, x, "") != ""
isempty(s::CustomSet) = length(s.data) == 0 
function issubset(a::CustomSet, b::CustomSet)
    for x in keys(a.data)
        if get(b.data, x, "") == "" return false end
    end
    true
end

iterate(a::CustomSet,state=a.keys[1]) =  state > length(keys) ? nothing : (a.keys[state], state + 1)
size(a::CustomSet) = size(a.data)
getindex(a::CustomSet,n) =  a.data[n]

copy(a::CustomSet) = CustomSet(copy(a.data))

length(a::CustomSet) = length(a.data)
==(a::CustomSet,b::CustomSet) = a.data == b.data

function disjoint(a::CustomSet, b::CustomSet)
    length(intersection(a, b)) == 0 
end

function intersect(a::CustomSet, b::CustomSet)
    intersection(a, b)
end

function intersect!(a::CustomSet, b::CustomSet)
    for x in keys(a.data)
        if get(b.data, x, "") == ""
            delete!(a.data, x)
        end
    end
end

function complement(a::CustomSet, b::CustomSet) 
    intersect_set  = intersection(a, b)
    complement_set = CustomSet((keys(a.data)))
    for x in keys(intersect_set.data)
        delete!(complement_set.data, x)
    end
    complement_set
end


function complement!(a::CustomSet, b::CustomSet)
    for x in keys(b.data)
        delete!(a.data, x)
    end
end

function union!(a::CustomSet, b::CustomSet)
    for x in keys(b.data)
        a.data[x] = 1
    end
end

function union(a::CustomSet, b::CustomSet)
    CustomSet([collect(keys(a.data)); collect(keys(b.data))])
end

function intersection(a::CustomSet, b::CustomSet)
    intersect_set = CustomSet([])
    for x in keys(a.data),y in keys(b.data)
        if x == y 
            intersect_set.data[x] = 1
        end
    end
    intersect_set
end

function push!(s::CustomSet, x::Int64) 
    s.data[x] = 1
    s 
end
