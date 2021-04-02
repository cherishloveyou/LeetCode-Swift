/**
 * Question Link: https://leetcode.com/problems/largest-rectangle-in-histogram/
 * Primary idea: Traverse the array and store target - nums[i] in a dict
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class LargestRectangleInHistogram {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxAero = 0
        if heights.count < 1 {
            return maxAero
        }
        if heights.count == 1 {
            return heights[0]
        }
        var newHeights = heights;
        newHeights.append(0)
        newHeights.insert(0, at: 0)
        var stack = [Int]()
        for i in 0..<newHeights.count {
            while !stack.isEmpty && newHeights[i] < newHeights[stack.last!] {
                let currentIndex = stack.popLast()!

                let left = stack.last! + 1
                let right = i - 1
                maxAero = max((right - left + 1) * newHeights[currentIndex], maxAero)
            }
            stack.append(i)
        }
        return maxAero
    }
}