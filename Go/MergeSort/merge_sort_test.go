package merge_sort

import (
	"reflect"
	"testing"
)

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
	l := []int{9, 1, 6, 2, 5, 8, 3, 7, 4}
	merge_sort := Sort{A: l}

	for i := 0; i < b.N; i++ {
		merge_sort.Sort("td")
	}
}

func BenchmarkMergeSortBU(b *testing.B) {
	l := []int{9, 1, 6, 2, 5, 8, 3, 7, 4}
	merge_sort := Sort{A: l}

	for i := 0; i < b.N; i++ {
		merge_sort.Sort("bu")
	}
}
