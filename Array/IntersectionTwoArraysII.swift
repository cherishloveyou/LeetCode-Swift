/**
 * Question Link: https://leetcode.com/problems/intersection-of-two-arrays-ii/
 * Primary idea: Use dictionary to get frequencies of elements of one array, and 
 *               compare with another array to filter the intersection
 * Note: Set cannot help you to find the number of common elements; thus it is not effective
 *
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

 class IntersectionTwoArraysII {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var numsFreq = Dictionary(nums1.map { ($0, 1) }, uniquingKeysWith: +)
        var res = [Int]()
        
        for num in nums2 {
            if let freq = numsFreq[num], freq > 0 {
                res.append(num)
                numsFreq[num] = freq - 1
            }
        }
        
        return res
    }
}
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count > nums2.count {
            return intersect(nums2, nums1)
        }
        var dict = [Int: Int]()
        var res = [Int]()
        for a in nums1 {
            if let num = dict[a] {
                 dict[a] = num + 1
            } else {
                dict[a] = 1
            }
        }
        for b in nums2 {
            if let count = dict[b], count > 0 {
                res.append(b)
                dict[b] = count - 1
            }
        }
        return res
    }
}