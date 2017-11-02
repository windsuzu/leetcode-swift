/* 2017. 10. 1
 
 There are 1000 buckets, one and only one of them contains poison, the rest are filled with water. They all look the same. If a pig drinks that poison it will die within 15 minutes. What is the minimum amount of pigs you need to figure out which bucket contains the poison within one hour.
 
 有一千個桶子，只有一個桶子裝滿毒，其他的皆裝滿水。
 
 如果一隻豬喝到毒，他會在 15 分鐘內死掉。
 
 你需要用到最少幾隻豬來試出哪一個桶子有毒 ?
 
 Answer this question, and write an algorithm for the follow-up general case.
 
 回答問題，並且寫出接下來 follow-up 的演算法。
 
 If there are n buckets and a pig drinking poison will die within m minutes, how many pigs (x) you need to figure out the "poison" bucket within p minutes? There is exact one bucket with poison.
 
 如果有 n 個桶子，豬喝到毒會在 m 分鐘內死掉，請問需要幾隻豬 (x) 來找出毒桶子在 p 分鐘內 ?
 
 */

import Foundation

func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
    var pigs = 0.0
    while pow(Double(minutesToTest / minutesToDie + 1), pigs) < Double(buckets) {
        pigs += 1
    }
    return Int(pigs)
}


poorPigs(1000, 15, 60)
