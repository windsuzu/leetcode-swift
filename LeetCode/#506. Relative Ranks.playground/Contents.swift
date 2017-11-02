/* 2017. 9. 4
 
 Given scores of N athletes, find their relative ranks and the people with the top three highest scores, who will be awarded medals: "Gold Medal", "Silver Medal" and "Bronze Medal".
 
 有 N 個運動員，請從他們每個人的分數，排序出他們每個人所得到的排名。
 
 前三名需要頒發給他們獎牌 : "Gold Medal", "Silver Medal" and "Bronze Medal" 。
 
 
 Example 1:
 
 Input: [5, 4, 3, 2, 1]
 
 Output: ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"]
 
 Explanation: The first three athletes got the top three highest scores, so they got "Gold Medal", "Silver Medal" and "Bronze Medal".
 For the left two athletes, you just need to output their relative ranks according to their scores.
 
 5, 4, 3 分別拿到前三高的成績，所以分別獲得金、銀、銅牌。
 
 剩下的 2, 1 只需要給予他們對應的名次， 4 和 5 名。
 
 */



func findRelativeRanks(_ nums: [Int]) -> [String] {
    var pair = [Int](repeating: 0, count: 2)
    var pairs = [[Int]]()
    var count = nums.count
    var res = [String](repeating: "", count: count)
    
    for i in 0..<nums.count {
        pair[0] = nums[i]
        pair[1] = i
        pairs.append(pair as! [Int])
    }
    
    pairs = pairs.sorted { $1[0] < $0[0] }
    
    for i in 0..<nums.count {
        if i == 0 {
            res[pairs[i][1]] = "Gold Medal"
        } else if i == 1 {
            res[pairs[i][1]] = "Silver Medal"
        } else if i == 2 {
            res[pairs[i][1]] = "Bronze Medal"
        } else {
            res[pairs[i][1]] = "\(i + 1)"
        }
    }
    return res
}


findRelativeRanks([5,4,2,3,1])
findRelativeRanks([10,3,8,9,4])






