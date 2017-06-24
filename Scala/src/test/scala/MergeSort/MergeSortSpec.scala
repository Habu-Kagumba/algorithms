package merge_sort

import org.scalatest.FunSpec
import org.scalatest.BeforeAndAfter

class SortSpec extends FunSpec with BeforeAndAfter {
  var merge_sort: Sort = _
  var arr = Array(9, 8, 7, 6, 5, 4, 3, 2, 1)
  var exp = Array(1, 2, 3, 4, 5, 6, 7, 8, 9)

  before {
    merge_sort = new Sort(arr)
  }

  describe("Top Down merge sort") {
    it("sorts the array") {
      merge_sort.sort("td")
      assert(arr.deep == exp.deep)
    }
  }

  describe("Bottom Up merge sort") {
    it("sorts the array") {
      merge_sort.sort("bu")
      assert(arr.deep == exp.deep)
    }
  }
}
