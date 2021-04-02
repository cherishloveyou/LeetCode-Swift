/**
 * Question Link: https://leetcode.com/problems/two-sum/
 * Primary idea: Traverse the array and store target - nums[i] in a dict
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class FindTheDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0, fast = 0;
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while (slow != fast)
        slow = 0;
        while (slow != fast) {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var dict = [Int: Bool]()
        for num in nums {
            if dict[num] ?? false {
                return num
            } else {
                dict[num] = true
            }
        }
        return 0
    }
}