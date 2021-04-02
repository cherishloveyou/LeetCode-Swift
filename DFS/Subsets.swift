/**
 * Question Link: https://leetcode.com/problems/subsets/
 * Primary idea: Classic Depth-first Search
 * 
 * Time Complexity: O(n^n), Space Complexity: O(n)
 *
 */

class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        
        let nums = nums.sorted(by: <)
        
        dfs(&res, &path, nums, 0)
        
        return res
    }
    
    private func dfs(_ res: inout [[Int]],  _ path: inout [Int], _ nums: [Int], _ index: Int) {
        // termination case

        res.append(path)
        
        for i in index..<nums.count {
            path.append(nums[i])
            dfs(&res, &path, nums, i + 1)
            path.removeLast()
        }
    }
}

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var n = nums.count 

        for i in 0 ..< (1<<n) {
            var path = [Int]()
            for j in 0 ..< n {
                if (((i >> j) & 1) == 1) {
                    path.append(nums[j])
                }
            }
            res.append(path)
        }
        return res
    }
}
