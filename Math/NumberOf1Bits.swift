/**
 * Question Link: https://leetcode.com/problems/reverse-bits/submissions/
 * Primary idea: Iterate through the string and handle the point, exponent, number, and sign cases separately.
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        var res = 0
        while n != 0 {
            res += n & 1
            n = n >> 1
        }
        return res
    }
}