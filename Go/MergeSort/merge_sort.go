/*
 * =====================================================================================
 *
 *    Description:  Implement Merge Sort Algorithm
 *                  ------------------------------
 *
 *                  Recursive algorithm that follows the Divide and Conquer Paradigm.
 *                  Sorts any array on length N in time proportional to NlogN
 *
 * =====================================================================================
 */
package merge_sort

import (
	"math"
)

type Sort struct {
	A []int
}

/*
 * Abstract in-place merge
 */

func (s *Sort) merge(lo, mid, hi int) {
	i, j := lo, mid+1

	aux := make([]int, len(s.A))
	copy(aux, s.A)

	for k := lo; k <= hi; k++ {
		if i > mid {
			s.A[k] = aux[j]
			j++
		} else if j > hi {
			s.A[k] = aux[i]
			i++
		} else if aux[j] < aux[i] {
			s.A[k] = aux[j]
			j++
		} else {
			s.A[k] = aux[i]
			i++
		}
	}
}

// STRATEGIES

/*
 * Top-Down MergeSort
 */

func (s *Sort) mergeSortTD(lo, hi int) {
	if hi <= lo {
		return
	}
	mid := lo + (hi-lo)/2
	s.mergeSortTD(lo, mid)
	s.mergeSortTD(mid+1, hi)
	s.merge(lo, mid, hi)
}

/*
 * Bottom-Up MergeSort
 */

func (s *Sort) mergeSortBU() {
	n := len(s.A)
	for sz := 1; sz < n; sz = sz + sz {
		for lo := 0; lo < n-sz; lo = lo + sz + sz {
			s.merge(lo, lo+sz-1, int(math.Min(float64(lo+sz+sz-1), float64(n-1))))
		}
	}
}

// SORT FUNC

func (s *Sort) Sort(strategy string) {
	if strategy == "td" {
		s.mergeSortTD(0, len(s.A)-1)
	} else {
		s.mergeSortBU()
	}
}
