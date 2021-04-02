/**
 * Question Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 * Primary idea: keep a index, compare the element at that index with the element moving forward
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class RemoveDuplicatesFromSortedArray {
    func removeDuplicates(inout nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var index = 0
        
        for num in nums where num != nums[index] {
            index += 1
            nums[index] = num
        }
        
        return index + 1
    }

    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var i = 0
        for j in 1 ..< nums.count {
            if (nums[j] != nums[i]) {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }

}