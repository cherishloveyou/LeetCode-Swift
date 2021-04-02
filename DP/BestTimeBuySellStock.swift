/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * Primary idea: Dynamic Programming, iterate the array while changing lowest 
 *               when there is smaller value and update the result
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

class BestTimeBuySellStock {
    func maxProfit(prices: [Int]) -> Int {
        guard prices.count > 0 else {return 0}
        var maxProfit = 0
        var buyDay = 0
        
        for i in 1 ..< prices.count {
            let profit = prices[i] - prices[buyDay]
            if profit < 0 {
                buyDay = i
            }
            maxProfit = max(profit, maxProfit)
        }
        
        return maxProfit
    }
}

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        guard prices.count > 0 else {return 0}

        var minPrice: Int = prices[0]
        var maxProfit: Int = 0
        
        for i in 1 ..< prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            }else { // i天卖出获得的最大利润
                maxProfit = max(maxProfit, prices[i] - minPrice)
            }
        }
        return maxProfit
    }
}