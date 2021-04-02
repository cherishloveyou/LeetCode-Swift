/**
 * Question Link: https://leetcode.com/problems/jump-game/
 * Primary idea: check each position with the previous farest step can reach. If i > last farest step, means cannot reach
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class JumpGame {
  func jump(_ nums: [Int]) -> Int {
        let n = nums.count
        var farthestIndex = 0
        var end = 0
        var jumps = 0
        for i in 0..<n-1 {
            farthestIndex = max(farthestIndex, i + nums[i]) 
            if end == i {
                jumps += 1
                end = farthestIndex
            }
            
        }
        return jumps
    }
}


