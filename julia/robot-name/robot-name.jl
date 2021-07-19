using Random

mutable struct Robot
    name::String
    valid_names::Array{String,1}
    myrand::Int
    Robot() = begin
        r =  new()
        r.valid_names = build_robot_names()
        id  = rand(1:length(r.valid_names))
        r.name = r.valid_names[id] #pop!(r.valid_names)
        deleteat!(r.valid_names,id)
        r
    end
    
end

function build_robot_names()
    names = Set()
    Random.seed!()
    for i=1:1000
        push!(names,new_name())
    end
    collect(names)
end

function new_name()
    rand('A':'Z') * rand('A':'Z') * string(rand(0:9)) * string(rand(0:9)) * string(rand(0:9))
end

function reset!(instance::Robot)
    id  = rand(1:length(instance.valid_names))
    instance.name = instance.valid_names[id] #pop!(instance.valid_names)
    deleteat!(instance.valid_names,id)
end

function name(instance::Robot)
    instance.name
end
