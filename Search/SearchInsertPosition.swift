/**
 * Question Link: https://leetcode.com/problems/search-insert-position/
 * Primary idea: Binary Search, until two variables left
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */

class SearchInsertPosition {
    func searchInsert(nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let middle:Int = (left + right )/2
            if target == nums[middle] {
                return middle
            } else if target > nums[middle]{
                left = middle + 1
            } else if target < nums[middle] {
                right  = middle - 1
            }
        }
        return left
    }
}