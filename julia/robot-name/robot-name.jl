using Random

function generate_list()
    lst = []
    for x in 'A':'Z' , y in 'A':'Z', z in 0:9, u in 0:9, v in 0:9
        push!(lst, string(x, y, z, u, v))
    end
    shuffle!(lst)
end

const robot_names  = generate_list()


mutable struct Robot
    name::String
    Robot() = !isempty(robot_names) ? new(pop!(robot_names)) : throw(error("")) 
end
# 92.004 ns (3 allocations: 55 bytes)
    

function reset!(r::Robot)
    r.name  = (Robot()).name
end
    
name(r::Robot) =  r.name

