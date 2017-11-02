/* 2017. 10. 11
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 你是一個專業的小偷，打算沿著整條街偷每一戶的東西。 你可以偷每一戶的東西，但只要在同一天晚上，你偷完一間房子，又偷他左右鄰居，這時就會有警鈴響起，自動呼叫警察過來。
 
 現在給你一個包含正整數的陣列，每個數字代表每間住戶所擁有的財產，你需要找到能夠在一個晚上，偷到最多錢的方法，且不會驚動到警鈴。
 
 */


func rob(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    
    for i in 0..<nums.count{
        if i % 2 == 0 { a = max(a + nums[i], b) }
        if i % 2 == 1 { b = max(b + nums[i], a) }
    }
    return max(a, b)
}


rob([1,3,5,13,9])
rob([1,50,2,3,45])
