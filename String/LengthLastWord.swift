/**
 * Question Link: https://leetcode.com/problems/length-of-last-word/
 * Primary idea: Iterate the string in backward direction
 * Time Complexity: O(n), Space Complexity: O(n)
 */

class LengthLastWord {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0

        for i in s.reversed() {
            if res == 0 && i == " " {
                continue
            }
            if i != " " {
                res += 1
            } else {
                return res
            }
        }
        return res
    }
}