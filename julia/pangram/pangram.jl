"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
ispangram(input)  = length(('A':'Z') ∩ uppercase(input)) == 26

