"convert a trinary number"
trinary_to_decimal(str) = length([x.match for x in eachmatch(r"[^0-2]",str)]) > 0 ? 0 :  sum(3 .^ (0:length(str)-1) .* digits(parse(Int,str)))
   
