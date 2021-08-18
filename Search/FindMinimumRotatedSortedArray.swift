/**
 * Question Link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
 * Primary idea: Classic Binary Search
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */

class FindMinimumRotatedSortedArray {
    func findMin(_ nums: [Int]) -> Int {
        var minVal = Int.max
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] >= nums[left] {
                minVal = min(minVal, nums[left])
                left = mid + 1
            } else {
                minVal = min(minVal, nums[mid])
                right = mid - 1
            }
        }
        
        return minVal
    }
}

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[right]
    }
}