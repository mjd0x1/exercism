def recite(start_verse, end_verse):
    days = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
    verses = ["a Partridge in a Pear Tree.", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]
    output = []
    for i, x in enumerate(days):
        r = ', '.join(verses[1:i+1][::-1])
        w = r + verses[0] if i == 0 else r + ", and " + verses[0]
        verse = f'On the {x} day of Christmas my true love gave to me: {w}'
        output.append(verse)
    return output[start_verse-1:end_verse]
