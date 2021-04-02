/**
 * Question Link: https://leetcode.com/problems/jump-game/
 * Primary idea: check each position with the previous farest step can reach. If i > last farest step, means cannot reach
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        var maximumIndex = nums[0]
        
        for (currentIndex, value) in nums.enumerated(){
            
            if currentIndex > maximumIndex{
                return false
            }
            
            maximumIndex = max(maximumIndex, currentIndex + value)
        }
         
        return true
    }
}

//超时
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        var dp = Array(repeating: false, count: nums.count)
        
        dp[0] = true
        for i in 1..<nums.count {
            for j in 0..<i {
                if (dp[j] && j + nums[j] >= i) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[nums.count - 1]
    }
}

