/* 2017. 8. 1
 
 Given an integer array with `even` length, where different numbers in this array represent different `kinds` of candies.
 
 Each number means one candy of the corresponding kind. You need to distribute these candies `equally` in number to brother and sister.
 
 Return the maximum number of kinds of candies the sister could gain.
 
 你有`偶數`顆糖果，在陣列中`不同數字`代表不同糖果。
 現在需要把這些糖果`平分`給哥哥和妹妹，請問妹妹最多可以拿到多少不一樣的糖果 ?
 
 
 Example 1:
 Input: candies = [1,1,2,2,3,3]
 Output: 3
 Explanation:
 There are three different kinds of candies (1, 2 and 3), and two candies for each kind.
 Optimal distribution: The sister has candies [1,2,3] and the brother has candies [1,2,3], too.
 The sister has three different kinds of candies.
 
 現在有三種不同糖果 (1,2,3) ，每種各兩顆。
 如果分成哥哥 (1,2,3) ，妹妹也 (1,2,3) ，妹妹最多可以拿到 3 種不同糖果。
 
 
 Example 2:
 Input: candies = [1,1,2,3]
 Output: 2
 Explanation: For example, the sister has candies [2,3] and the brother has candies [1,1].
 The sister has two different kinds of candies, the brother has only one kind of candies.
 
 如果分成哥哥 (1,1) ，妹妹 (2,3) ，妹妹最多可以拿到 2 種不同糖果。
 
 */


/* 第一次解題 : 618 ms
 
 找出最多能夠分配的糖果數量 -> candies/2
 找出所有種類的糖果 -> use Set remove duplicate
 
 [1,2,3,4,5,6] -> 6 > 3 -> 3
 如果糖果種類比最多能夠分配的糖果數量多 -> return candies.count
 
 [1,2,2,2,2,2] -> 2 < 3 -> 2
 如果能夠分配的糖果數量比種類多 -> return unique.count
 
 */


//func distributeCandies(_ candies: [Int]) -> Int {
//    
//    let maxDivided = candies.count / 2
//    let unique = Array(Set(candies))
//    
//    if unique.count > maxDivided {
//        return maxDivided
//    } else {
//        return unique.count
//    }
//}



/* Better Solution : 422 ms
 
 建立一個 Set 將 candy 依序放入，會自動剔除重複的。
 回傳 min(種類數量, 最多分配數量)
 
 */

func distributeCandies(_ candies: [Int]) -> Int {
    var uniqueCandies: Set<Int> = []
    
    for candy in candies { uniqueCandies.insert(candy) }
    
    return min(uniqueCandies.count, candies.count / 2)
}


distributeCandies([1,2,2,2,2,2])









