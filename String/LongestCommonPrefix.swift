/**
 * Question Link: https://leetcode.com/problems/longest-common-prefix/
 * Primary idea: Use the first string as the result at first, trim it while iterating the array
 * Time Complexity: O(nm), Space Complexity: O(m), m stands for the length of longest prefix
 */

class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var res = strs.first else { return "" }

        for string in strs {
            while !string.hasPrefix(res) {
                res = String(res.dropLast())
            }
        }
        return res
    }
}