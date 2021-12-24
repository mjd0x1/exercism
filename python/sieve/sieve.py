import numpy as np


def primes(limit):
    a = np.ndarray(limit, dtype=bool)
    a.fill(1)
    for i in range(2, limit // 2):
        a[2 * i :: i] = 0
    return np.arange(0, limit)[a]
