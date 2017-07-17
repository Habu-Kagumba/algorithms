package binary_search

import "sort"

func binary_search(list []int, target int) int {
	sort.Ints(list)
	low, high := list[0], list[len(list)-1]

	if target > high || target < low {
		return -1
	}

	for low <= high {
		mid := low + (high-low)/2
		switch {
		case target < list[mid]:
			high = mid - 1
		case target > list[mid]:
			low = mid + 1
		case target == list[mid]:
			return mid
		}
	}

	return -1
}
