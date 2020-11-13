function bob(stimulus::String)

    hasLetters = length([stimulus...] ∩ ['A':'Z'...]) > 0
    if strip(stimulus) == "" return "Fine. Be that way!" end
    if strip(stimulus)[end]=='?'  && uppercase(stimulus) == stimulus &&  hasLetters return "Calm down, I know what I'm doing!" end
    if strip(stimulus)[end]=='?'  return "Sure." end
    if uppercase(stimulus) == stimulus &&  hasLetters  return  "Whoa, chill out!" end
    "Whatever."

end
