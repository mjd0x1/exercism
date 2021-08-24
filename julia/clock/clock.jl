import Dates
import Base:+, -,show
import Printf: @sprintf

struct Clock
    h::Int8
    m::Int8
    Clock(h,m) = begin
        new(mod(h + fld(m,s60),24),mod(m,60))
    end
  
end

function -(c::Clock,d::Dates.Minute)
   +(c,-d)
end

function +(c::Clock,d::Dates.Minute)::Clock
    Clock(c.h,c.m+d.value)
end


show(io::IO, c::Clock) = print(io,"\"" * @sprintf("%02d",c.h) * ":"  * @sprintf("%02d",c.m) * "\"")



