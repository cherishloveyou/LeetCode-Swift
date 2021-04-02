/**
 * Question Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 * Primary idea: Classic Depth-first Search, create phone board at first
 * 
 * Time Complexity: O(4^n), n stands for length of digits 
 * Space Complexity: O(n), n stands for length of digits
 *
 */

class LetterCombinationsPhoneNumber {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return [String]()
        }
        
        var combinations = [String](), combination = ""
        let numberToStr = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        
        dfs(&combinations, &combination, numberToStr, digits, 0)
        
        return combinations
    }
    
    private func dfs(_ combinations: inout [String], _ combination: inout String, _ numberToStr: [String], _ digits: String, _ index: Int) {
        if combination.count == digits.count {
            combinations.append(combination)
            return
        }
        
        let currentStr = fetchCurrentStr(from: digits, at: index, numberToStr)
        
        for char in currentStr {
            combination.append(char)
            dfs(&combinations, &combination, numberToStr, digits, index + 1)
            combination.removeLast()
        }
    }
        
    private func fetchCurrentStr(from digits: String, at index: Int, _ numberToStr: [String]) -> String {
        guard index >= 0 && index < digits.count else {
            fatalError("Invalid index")
        }
        
        let currentDigitChar = digits[digits.index(digits.startIndex, offsetBy: index)]
        
        guard let currentDigit = Int(String(currentDigitChar)), currentDigit >= 0, currentDigit < numberToStr.count else {
            fatalError("Invalid digits")
        }
        
        return numberToStr[currentDigit]
    }
}

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
       guard digits.count > 0 else {
            return [String]()
        }
        let dict: [Character: String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl", "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"];
        var array = [String]()
        for s in digits {
            if let str = dict[s] {
                array.append(str)
            }
        }
        var res = [String]()
        dfs(&res, array, "", 0)
        return res
    }

    func dfs(_ res: inout [String], _ array: [String], _ str: String,  _ index: Int) {
        if index == array.count {
            res.append(str)
            return
        }
        let string = array[index]
        for s in string {
            var str = str
            str.append(s)
            dfs(&res, array, str, index+1)
        }
    } 
}