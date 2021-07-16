import Dates
import Base:+, -,show
import Printf: @sprintf

struct Clock
    h::Int8
    m::Int8
    Clock(h,m) = begin
        minutes = h * 60 + m
        if minutes < 0
            minutes = 24*60 + minutes % (24*60)
        end
        new_h  = (minutes ÷ 60) % 24
        new_m = minutes % 60
        new(new_h,new_m)
    end
  
end

function -(c::Clock,d::Dates.Minute)
   +(c,-1 * d)
end

function +(c::Clock,d::Dates.Minute)::Clock
    Clock(c.h,c.m+d.value)
end


show(io::IO, c::Clock) = print(io,"\"" * @sprintf("%02d",c.h) * ":"  * @sprintf("%02d",c.m) * "\"")



