/**
 * Question Link: https://leetcode.com/problems/reverse-bits/submissions/
 * Primary idea: Iterate through the string and handle the point, exponent, number, and sign cases separately.
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var res = 0
        for _ in 1...32 {
            res = res << 1
            res = n & 1 | res
            n = n >> 1
        }
        return res
    }
}