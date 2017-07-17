package merge_sort

import (
	"math/rand"
	"reflect"
	"sort"
	"testing"
)

func makeRange(min, max int) (arr []int) {
	arr = make([]int, max-min+1)
	for i := range arr {
		arr[i] = min + 1
	}
	return
}

func shuffle(l []int) {
	for i := range l {
		j := rand.Intn(i + 1)
		l[i], l[j] = l[j], l[i]
	}
}

func BenchmarkGoSort(b *testing.B) {
	l := makeRange(10, 1000)
	shuffle(l)

	for i := 0; i < b.N; i++ {
		sort.Ints(l)
	}
}

func TestMergeSortTD(t *testing.T) {
	t.Log("Top Down MergeSort")

	a := []int{9, 8, 7, 6, 5, 4, 3, 2, 1}
	expected := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}

	merge_sort := Sort{A: a}
	merge_sort.Sort("td")

	if !reflect.DeepEqual(expected, a) {
		t.Error("Array not properly sorted.")
	}
}

func TestMergeSortBU(t *testing.T) {
	t.Log("Bottom Up MergeSort")

	l := []int{9, 1, 6, 2, 5, 8, 3, 7, 4}
	expected := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}

	merge_sort := Sort{A: l}
	merge_sort.Sort("bu")

	if !reflect.DeepEqual(expected, l) {
		t.Error("Array not properly sorted.")
	}
}

// Benckmarking

func BenchmarkMergeSortTD(b *testing.B) {
	l := makeRange(10, 1000)
	shuffle(l)
	merge_sort := Sort{A: l}

	for i := 0; i < b.N; i++ {
		merge_sort.Sort("td")
	}
}

func BenchmarkMergeSortBU(b *testing.B) {
	l := makeRange(10, 1000)
	shuffle(l)
	merge_sort := Sort{A: l}

	for i := 0; i < b.N; i++ {
		merge_sort.Sort("bu")
	}
}
