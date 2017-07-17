package linear_search

import (
	"testing"
)

func TestBasic(t *testing.T) {
	t.Log("Testing the Basic algorithm")

	list := []int{9, 8, 7, 6, 5, 4, 3, 2, 1}
	target := 6
	i := Basic(list, target)

	if i == -1 {
		t.Error("Couldn't find target.")
	}

	t.Logf("Find %d in %d", target, list)
	t.Logf("Answer: %d (index)", i)
}
