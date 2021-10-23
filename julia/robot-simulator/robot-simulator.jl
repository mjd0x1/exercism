const NORTH =  1
const SOUTH =  3
const EAST =  2
const WEST = 4

movevectors =  [(0, 1),(1, 0),(0, -1),(-1, 0)]

struct Point{T}
    x::T
    y::T
end

mutable struct Robot 
    position::Point{Int}
    direction::Int
    Robot((x, y), d) = begin
        direction = d
        position = Point{Int}(x, y)
        new(position, direction)
    end
end

position(r::Robot) =  r.position 

heading(r::Robot) = r.direction
move!(r::Robot,command_string) = begin
    commands = split(command_string, "")
    pt = r.position
    (x, y) = (pt.x, pt.y)
    direction = r.direction
    for c in commands
        if c == "R" direction = update_direction(direction,1) end
        if c == "L" direction = update_direction(direction,-1) end
        if c == "A" 
            (x, y)  =  update_point((x,y),direction)
         end
    end
    r.position = Point(x, y)
    r.direction = direction
    r
end 

update_point((x,y),direction) = begin
    dx, dy = movevectors[direction]
    (x, y)  = (x + dx, y + dy)
end

update_direction(direction,x) = mod1(direction + x, 4) 

turn_right!(r::Robot) = begin
    r.direction = update_direction(r.direction,1)
    r
end
turn_left!(r::Robot) = begin
    r.direction = update_direction(r.direction,-1)
    r
end
advance!(r::Robot) = begin
    pt = r.position
    (x, y) = (pt.x, pt.y)
    (x,y) = update_point((x,y),r.direction)
    r.position = Point(x, y)
    r
end