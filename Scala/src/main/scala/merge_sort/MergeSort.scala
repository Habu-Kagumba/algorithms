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

class Sort(a: Array[Int]) {

  /*
   * Abstract in-place merge
   */
  def merge(lo: Int, mid: Int, hi: Int): Unit = {
    var i = lo
    var j = mid + 1

    var aux = a.clone

    var k = 0
    for (k <- lo to hi) {
      if (i > mid) {
        a(k) = aux(j)
        j += 1
      } else if (j > hi) {
        a(k) = aux(i)
        i += 1
      } else if (aux(j) < aux(i)) {
        a(k) = aux(j)
        j += 1
      } else {
        a(k) = aux(i)
        i += 1
      }
    }
  }

  // STRATEGIES

  /*
   * Top-Down MergeSort
   */
  def mergeSortTD(lo: Int, hi: Int): Unit = {
    if (hi <= lo) return

    var mid = lo + (hi - lo) / 2

    mergeSortTD(lo, mid)
    mergeSortTD(mid+1, hi)
    merge(lo, mid, hi)
  }

  /*
   * Bottom-Up MergeSort
   */
  def mergeSortBU() = {
    var n = a.length
    var sz = 1
    var lo = 0

    for (sz <- 1 to n by sz+sz) {
      for (lo <- 0 to n-sz by lo+sz+sz) {
        merge(lo, lo+sz-1, math.min(lo+sz+sz-1, n-1))
      }
    }
  }

  // SORT FUNC

  def sort(strategy: String) =  {
    if (strategy == "td") mergeSortTD(0, a.length - 1)
    else mergeSortBU()
  }
}
