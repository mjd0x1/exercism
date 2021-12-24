

binarysearch(data, value, reverse::Bool) =  binarysearch_main(data, value, >, identity)

binarysearch(data, value, f::typeof(<)) =  binarysearch_main(data, value, <, identity)
binarysearch(data, value, f::typeof(<))  =  binarysearch_main(data, value, >, identity)
binarysearch(data, value, f::typeof(<))  =  binarysearch_main(data, value, >, identity)
binarysearch(data, value, f::typeof(round)) = binarysearch(data, value, round)
binarysearch(data, value, f::Function) = binarysearch(data, value, f)
binarysearch(data, value)  = binarysearch_main(data, value, <, identity)

"function to perform binary search on data using value"
function binarysearch_main(data, value, sort_operator, function_apply)
    if data == [] return 1:0 end
    sorted_data = sort(function_apply.(data), lt=sort_operator)
    k, lower, upper = length(data), 1, length(data)
    for i = 1:10
        k = div(lower + upper, 2)     
        lower, upper = value  > sorted_data[k] ? (k + 1, upper) : (lower, k) 
    end
    lower:upper
end