/**
 * Question Link: https://leetcode.com/problems/single-number-ii/
 * Primary idea: Every number has 64 bits, for the i-th bit of each number.
 *               In total, we should have (nums.count) 0s and 1s.
 *               If the i-th bit of the single number is 1, then we should have (3n + 1) 1s, and (3n) 0s.
 *               Otherwise, the i-th bit is 0.
 *               In this way, we can calculate each bit of the single number.
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class SingleNumberIII {
    func singleNumber(nums: [Int]) -> [Int] {
        var all = 0
        for num in nums {
            all ^= num
        }
        var numOne = 1
        while all & numOne == 0 {
            numOne = numOne << 1
        }
        var first  = 0
        for num in nums {
            if num & numOne != 0 {
                first ^= num
            }
        }
        return [first, all ^ first]
    }
}
