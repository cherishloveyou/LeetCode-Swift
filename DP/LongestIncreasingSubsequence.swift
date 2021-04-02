/**
 * Question Link: https://leetcode.com/problems/longest-increasing-subsequence/
 * Primary idea: Dynamic Programming, update the array which ends at current index using binary search
 * Time Complexity: O(nlogn), Space Complexity: O(n)
 */

class LongestIncreasingSubsequence {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard let first = nums.first else {
            return 0
        }
        
        var ends = [first]
        
        for i in 1..<nums.count {
            
            // find first greater ends number
            var left = 0, right = ends.count 
            
            while left < right {
                let mid = (right - left) / 2 + left
                
                if ends[mid] < nums[i] {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            
            if right >= ends.count {
                ends.append(nums[i])
            } else {
                ends[right] = nums[i]
            }
        }
        
        return ends.count
    }
}

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0}
        var dp = Array(repeating: 1, count: nums.count)
        var res = 1
        for i in 1..<nums.count {
            for j in 0..<i {
                if (nums[i] > nums[j]) {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
}