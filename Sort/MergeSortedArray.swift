/**
 * Question Link: https://leetcode.com/problems/merge-sorted-array/
 * Primary idea: Merge from tail to head to avoid override
 * Time Complexity: O(n), Space Complexity: O(1)
 */

 class MergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        
        while i >= 0 || j >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }
}

class Solution {
    //88. 合并两个有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard m != 0 else {
            nums1 = nums2
            return
        }
    
        var i1 = m - 1
        var i2 = n - 1
        var curr = nums1.count - 1
        while i2 >= 0 {
            
            if i1 >= 0 && nums1[i1] > nums2[i2] {
                nums1[curr] = nums1[i1]
                i1 = i1 - 1
                curr = curr - 1
            } else {
                nums1[curr] = nums2[i2]
                i2 = i2 - 1
                curr = curr - 1
            }
        }
    }
}
