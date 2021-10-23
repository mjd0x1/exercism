function matching_brackets(s)
    if s == "" return true end
    stack = []
    brackets_only  = [x.match for x in eachmatch(r"\(|\[|\)|\]|\{|\}", s)]
    push!(stack, brackets_only[1])
    for x in brackets_only[2:end]
        if (length(stack) > 0 &&  x == ")" && stack[end] == "(")  ||  (length(stack) > 0  && x == "]" && stack[end] == "[") || (length(stack) > 0  && x == "}" && stack[end] == "{")
            pop!(stack)
        else
            push!(stack, x)
        end
    end
    stack == []
end