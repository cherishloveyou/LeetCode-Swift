/**
 * Question Link: https://leetcode.com/problems/anagrams/
 * Primary idea: Iterate the string array and categories strings with the same sorted one
 *
 * Time Complexity: O(nmlogm), n stands for number of words, m stands for the length of a word
 * Space Complexity: O(n)
 */

class WordBreakII {

    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var res: [String] = Array()
        var path: [String] = Array()
        dfs(Array(s), wordDict, &res, &path, 0)
        return res
    }
    
    func dfs(_ sArr: [Character], _ wordDict: [String], _ res: inout [String], _ path: inout [String], _ index: Int)  {
        let count = sArr.count
        if index == count {
            res.append(path.joined(separator: " "))
        }
        
        var j = index
        while j < count {
            let subStr = String(sArr[index...j])
            if wordDict.contains(subStr) {
                path.append(subStr)
                dfs(sArr, wordDict, &res, &path, j + 1)
                path.removeLast()
            }
            j += 1
        }
        return
    }
}
