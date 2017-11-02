/* 2017. 8. 26
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 
 給定陣列，他的第 i 個元素代表某股票在第 i 天的價格，設計一個算法來找到最大的利潤。
 可以盡可能完成越多次的交易，但不能同時參與多個交易 (必須在購買下一次股票前出售手上的股票)。
 
 舉例 [2,1,3,4,5,4,2,8,7]
 
 你可以在第二天買 1 第五天賣 5 賺 4 ，
 在第七天買 2 第五天賣 8 賺 6，總共賺了 10 。
 
 */


func maxProfit(_ prices: [Int]) -> Int {
    var res = 0
    var last = -1
    
    for price in prices {
        if last >= 0 && price - last > 0 {
            res += (price - last)
        }
        last = price
    }
    return res
}


maxProfit([0,1,4,2,3])
maxProfit([2,1,3,4,5,4,2,8,7])







