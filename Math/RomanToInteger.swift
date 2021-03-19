/**
 * Question Link: https://leetcode.com/problems/roman-to-integer/
 * Primary idea: Iterate through end to start, add or minus according to different situations
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

class RomanToInteger {
    func romanToInt(s: String) -> Int {
       let roman = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1]
        var res = 0
        var pre = 0
        for c in s {
            guard let value = roman[String(c)] else {
                return 0
            }
            res += value
            if value > pre {
                res -= 2 * pre
            }
            pre = value
        }
        return res
    }
}