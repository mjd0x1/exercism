

days = [
        "first", "second", "third", "fourth",
        "fifth", "sixth", "seventh", "eighth",
        "ninth", "tenth", "eleventh", "twelfth"
]
verses = [
        "a Partridge in a Pear Tree.", "two Turtle Doves",
        "three French Hens", "four Calling Birds",
        "five Gold Rings", "six Geese-a-Laying",
        "seven Swans-a-Swimming", "eight Maids-a-Milking",
        "nine Ladies Dancing", "ten Lords-a-Leaping",
        "eleven Pipers Piping", "twelve Drummers Drumming"
]


def recite(start_verse, end_verse):
    output = []
    for i, x in enumerate(days):
        reversed_verses = ', '.join(verses[1:i+1][::-1])
        final_verses = reversed_verses + verses[0] if i == 0 \
            else reversed_verses + ", and " + verses[0]
        verse = (
                f'On the {x} day of Christmas my true love gave to me: '
                f'{final_verses}'
        )
        output.append(verse)
    return output[start_verse-1:end_verse]
