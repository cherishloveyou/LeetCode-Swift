/**
 * Question Link: https://leetcode.com/problems/ugly-number-ii/
 * Primary idea: Use three indices to build a helper array
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 */

class UglyNumberII {
    func nthUglyNumber(n: Int) -> Int {
        guard n > 0 else {
            return 0
        }

        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1

        var v2 = 0
        var v3 = 0
        var v5 = 0

        for i in 1...n {

            dp[i] = min(2 * dp[v2], 3 * dp[v3], 5 * dp[v5])

            if dp[i] >= 2 * dp[v2] {
                v2 += 1
            }

            if dp[i] >= 3 * dp[v3] {
                v3 += 1
            }

            if dp[i] >= 5 * dp[v5] {
                v5 += 1
            }
        }

        return dp[n - 1]
    }
}