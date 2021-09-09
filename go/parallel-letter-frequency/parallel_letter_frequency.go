package letter

import (
	"sync"
)

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func ConcurrentFrequency(list []string) FreqMap {
	m := FreqMap{}
	write_mutex := &sync.Mutex{}

	var w sync.WaitGroup

	for _, list_item := range list {
		w.Add(1)
		go func(s string) {
			for _, r := range s {
				write_mutex.Lock()
				m[r] += 1
				write_mutex.Unlock()
			}
			w.Done()
		}(list_item)
	}
	w.Wait()
	return m

}

//TestMutex testing mutex on a simple counter
func TestMutex() int {
	count := 0
	write_mutex := &sync.Mutex{}

	var w sync.WaitGroup

	for j := 0; j < 1000; j++ {
		w.Add(1)
		go func() {
			for i := 0; i < 1000; i++ {
				write_mutex.Lock()
				count += 1
				write_mutex.Unlock()
			}
			w.Done()
		}()
	}
	w.Wait()
	return count

}

//TestReadAndWriteMutex testing read and write/but doesn't work?
func TestReadAndWriteMutex() FreqMap {
	m := FreqMap{}
	read_mutex := &sync.RWMutex{}
	write_mutex := &sync.Mutex{}
	var w sync.WaitGroup

	ls := []string{"asaa sdd asadasd sad", "asaasdd asadasd sad"}

	for _, p := range ls {
		w.Add(1)
		go func(s string) {
			for _, r := range s {
				read_mutex.RLock()
				val, ok := m[r]
				read_mutex.RUnlock()

				if ok {
					write_mutex.Lock()
					m[r] = val + 1
					write_mutex.Unlock()
				} else {
					write_mutex.Lock()
					m[r] = 1
					write_mutex.Unlock()
				}
			}
			w.Done()
		}(p)
	}
	w.Wait()
	return m

}
