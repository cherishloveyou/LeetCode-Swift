/**
 * Question Link: https://leetcode.com/problems/longest-consecutive-sequence/
 * Primary idea: Iterate the array and check all neighbor numbers with the help of set
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

class LongestConsecutiveSequence {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set<Int>(nums), longest = 0
        
        for num in nums {
            var currentLength = 1
            dfs(num, &set, &longest, &currentLength)
        } 
        
        return longest
    }
    
    private func dfs(_ num: Int, _ set: inout Set<Int>, _ longest: inout Int, _ length: inout Int) {
        if !set.contains(num) {
            return
        }
        
        longest = max(longest, length)
        set.remove(num)
        length += 1
        
        dfs(num + 1, &set, &longest, &length)
        dfs(num - 1, &set, &longest, &length)
    }
}

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let hashMap = Set(nums)
        var result = 0
        for item in hashMap {
            if !hashMap.contains(item-1) {
                var currentNum = item
                var temp = 1
                while hashMap.contains(currentNum+1) {
                    temp += 1
                    currentNum += 1
                }
                result = max(result, temp)
            }
        }
        return result
    }
}