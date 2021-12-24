import string


def is_pangram(sentence):
    """determine if sentence is pangram"""
    letters = set(list(string.ascii_lowercase))
    chars = set(sentence.lower())
    return len(chars.intersection(letters)) == len(letters)
