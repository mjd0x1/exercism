const allergies =  ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

function allergic_to(score, allergen)
    any(x -> x > 1, (allergies .== allergen) .+ digits(score, base=2, pad=8))
end

function allergy_list(score)
    trunc_score = score > 255 ? score - 256 : score 
    Set(allergies[digits(trunc_score, base=2, pad=8) .== 1])
end
