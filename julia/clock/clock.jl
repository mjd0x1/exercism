import Dates
import Base:+, -,show,==,sprint
import Printf: @sprintf

struct Clock
    h::Int64
    m::Int64
end

negativeHours = (x) -> x < 0 ? 24 + x % 24 : x % 24

function factorise(c::Clock)::Clock
   c.m < 0 ? Clock(negativeHours(c.h),0) - Dates.Minute(abs(c.m)) : Clock(negativeHours(c.h),0) + Dates.Minute(abs(c.m))
end

function ==(c1::Clock,c2::Clock)::Bool
    c1.m % 60 + negativeHours(c1.h + c1.m ÷ 60) * 60 == c2.m % 60  + negativeHours(c2.h + c2.m ÷ 60) * 60
end

function -(c::Clock,d::Dates.Minute)::Clock
    mins = c.m + c.h * 60 - d.value
    mins < 0 ? Clock(24,0) - Dates.Minute(abs(mins)) : Clock(mins ÷ 60, mins % 60)
end

function +(c::Clock,d::Dates.Minute)::Clock
    mins = c.m + d.value
    Clock((c.h + mins ÷ 60)%24, mins % 60)
end

sprint(f::Function,c::Clock)  = show(c)
function show(c::Clock)
    adjusted  = factorise(c)
    "\"$(@sprintf("%02d",adjusted.h)):$(@sprintf("%02d",adjusted.m))\""
end



