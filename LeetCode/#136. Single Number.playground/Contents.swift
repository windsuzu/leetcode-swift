/* 2017. 8. 5
 
 Given an array of integers, every element appears twice except for one. Find that single one.
 
 給一串整數陣列，每個元素皆會出現兩次，只有一個元素不會。找出那一個元素。
 
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 你的演算法必須設定在 O(n) 時間內完成
 
 */


/* 第一次解題 : Time Limit Exceeded */

//func singleNumber(_ nums: [Int]) -> Int {
//    for num in nums {
//        if (nums.filter { $0 == num }).count < 2 {
//            return num
//        }
//    }
//    return -1
//}


/* 第二次解題 : 
 
 因為已經知道相同數字經過 XOR 運算後會等於 0 ，
 並且 XOR 運算是符合`交換律`的。
 
 XOR 交換律 :
 101 ^ 101 ^ 010 =
 000 ^ 010 =
 010
 
 101 ^ 010 ^ 101 =
 111 ^ 101 =
 010
 
 也就是 1 ^ 1 = 0  -> 
 1 ^ 1 ^ 2 = 2 -> 
 1 ^ 1 ^ 2 ^ 3 ^ 3 = 2
 
 就算順序不同也會出現相同答案 : 1 ^ 2 ^ 1 = 2
 
 */

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result ^= num
    }
    
    return result
}



singleNumber([1,1,2,3,3,6,6])
