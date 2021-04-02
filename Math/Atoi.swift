/**
 * Question Link: https://leetcode.com/problems/string-to-integer-atoi/
 * Primary idea: Trim, positive and negative, integer overflow, is character digit
 *
 * Time Complexity: O(n), Space Complexity: O(1)
 */

class Atoi {
    func myAtoi(_ s: String) -> Int {
        var res = 0, flag = 1, index = 0
        let intMax = 2147483647, intMin = -2147483648, strChars = Array(s)
        
        // trim
        while index < strChars.count {
            let currentChar = strChars[index]
            // trim
            guard currentChar.isWhitespace else {
                break
            }
            index += 1
        }
        
        guard index < strChars.count else {
            return res
        }
        
        // handle flag
        if strChars[index] == "-" {
            flag = -1
            index += 1
        } else if strChars[index] == "+" {
            index += 1
        }
        
        // cast to number
        while index < strChars.count {
            let currentChar = strChars[index]
            
            guard currentChar.isNumber else {
                break
            }
            
            res = res * 10 + currentChar.wholeNumberValue!
            
            if res >= intMax {
                if flag == 1 {
                    return intMax
                } else if flag == -1 && res > intMax {
                    return intMin
                }
            }
            
            index += 1
        }
        
        return flag * res
    }
}

class Solution {
    func myAtoi(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        // 去掉空格
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        let noWhitespaceStr = s.trimmingCharacters(in: whitespace)
        var result = 0
        // 正负值标识
        var sign = 1
        for (index, scalars) in noWhitespaceStr.unicodeScalars.enumerated() {
            if ((scalars.value >= 48 && scalars.value <= 57) || (scalars.value == 45 && index == 0)) {
                //如果第一位是字符 - 则标识结果为负数
                if scalars.value == 45 && index == 0 {
                    sign = -1
                    continue
                }
                
                //判断依据：当前结果大于最大值除10 (214748364)
                if result > Int32.max / 10 || (result == Int32.max / 10 && Int(String(scalars))! > 7) {
                    return sign == 1 ? Int(Int32.max) : Int(Int32.min)
                }
                
                result = result * 10 + Int(String(scalars))!
            }else if scalars.value == 43 && index == 0 {
                continue
            }else {
                break
            }
        }
        return result*sign
    }
}