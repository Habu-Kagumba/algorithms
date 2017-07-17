/*
 * =====================================================================================
 *
 *    Description:  Implement Linear Search
 *                  ------------------------------
 *
 *                  Method to search element in list sequentially.
 *
 * =====================================================================================
 */
package linear_search

// Basic Algorithm
func Basic(l []int, t int) int {
	for i := 0; i < len(l); i++ {
		if l[i] == t {
			return i
		}
	}

	// for i, element := range l {
	// 	if element == t {
	// 		return i
	// 	}
	// }

	return -1
}
