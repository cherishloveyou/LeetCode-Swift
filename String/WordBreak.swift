/**
 * Question Link: https://leetcode.com/problems/anagrams/
 * Primary idea: Iterate the string array and categories strings with the same sorted one
 *
 * Time Complexity: O(nmlogm), n stands for number of words, m stands for the length of a word
 * Space Complexity: O(n)
 */

class WordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1..<s.count+1 {
            for j in 0..<wordDict.count {
                var temp = wordDict[j]
                var len = temp.count
                if i < len {
                    dp[i] = false
                } else {
                    var startIndex = s.index(s.startIndex, offsetBy: i - len)
                    var endIndex = s.index(s.startIndex, offsetBy: i - 1)
                    var subStr  = String(s[startIndex...endIndex])
                    if subStr == temp {
                        dp[i] = dp[i - len]
                        if dp[i] == true {
                            break
                        }
                    }
                }
            }
        }
        return dp[s.count]
    }
}
