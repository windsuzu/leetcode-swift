/* 2017. 9. 22
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 
 有一個陣列，每一個元素代表每一天股票的價格。
 
 如果你只被允許在這麼多天內只能交易一次 (買一賣一) ， 設計一個函式去找出最大的收益。
 
 
 Example 1:
 Input: [7, 1, 5, 3, 6, 4]
 Output: 5
 
 max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
 
 最大收益是在第二天買入 1 ，第五天賣出 6 ，收益為 5 。
 
 
 Example 2:
 
 Input: [7, 6, 4, 3, 1]
 Output: 0
 
 In this case, no transaction is done, i.e. max profit = 0.
 
 在這個案例裡，沒有任何交易可以賺到錢，收益為 0 。
 
 */


/*  Time Limit Exceeded

 func maxProfit(_ prices: [Int]) -> Int {
    var res = 0
    for i in 0..<prices.count {
        for j in i..<prices.count {
            res = min(res, prices[i] - prices[j])
        }
    }
    return abs(res)
}
 
 */





func maxProfit(_ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    var temp = 0
    var res = 0
    
    for i in 1..<prices.count {
        temp += prices[i] - prices[i - 1]
        temp = max(0, temp)
        res = max(res, temp)
    }
    return res
}


maxProfit([7, 1, 5, 3, 6, 4])
maxProfit([])







