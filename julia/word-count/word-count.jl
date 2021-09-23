# import StatsBase as sb

function wordcount(sentence)
    validate =  (lowercase(m.match) for m in eachmatch(r"\w+'*\w+|\d|a", sentence))
    # sb.countmap(validate)
    my_countmap(validate)
end

my_countmap(some_data)  =  Dict([(i, count(x -> x == i, some_data)) for i in some_data])


         
