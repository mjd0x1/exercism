# Implement number base conversion

function all_your_base(digits, base_in, base_out)
    s  = sum(base_in.^(length(digits) - 1:-1:0) .* digits)
end
