/**
 * Question Link: https://leetcode.com/problems/powx-n/
 * Primary idea: Classic Recursion and handle positive/negative case at first
 *
 * Time Complexity: O(logn), Space Complexity: O(1)
 */

class Pow {
    func myPow(x: Double, _ n: Int) -> Double {
        var x = x, n = n
    
        if n < 0 {
            x = 1.0 / x
            n = -n
        }

        var res = 1.0

        while n > 0 {
            if n % 2 != 0 {
                res *= x
            }
            x *= x
            n /= 2
        }

        return res
    }
}

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x, n = n
        var res = 1.0
        if x == 0 { return 0 }
        if n < 0 {
            x = 1 / x
            n = -n
        }
        while n != 0 {
            if n & 1 == 1 { res = res * x }
            x = x * x
            n = n >> 1
        }
        return res
    }
}