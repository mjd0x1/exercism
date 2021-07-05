from collections import Counter
import re


def count_words(sentence):
    all_words = re.findall(r"\w+'*\w*", sentence.lower().replace("_", " "))
    remove_quotes = map(lambda x: x.strip("'"), all_words)
    return Counter(remove_quotes)
