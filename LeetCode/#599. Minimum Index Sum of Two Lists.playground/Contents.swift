/* 2017. 8. 31
 
 Suppose Andy and Doris want to choose a restaurant for dinner, and they both have a list of favorite restaurants represented by strings.
 
 
 You need to help them find out their common interest with the least list index sum. If there is a choice tie between answers, output all of them with no order requirement. You could assume there always exists an answer.
 
 假設 Andy 和 Doris 想要找一間餐廳吃晚餐，他們兩個人都有一個喜愛的餐廳名單。
 
 你的任務是幫他們兩個找到，第一個共同出現在名單上的餐廳。你可以假設 Andy 和 Doris 一定會有一間一樣喜歡的餐廳。
 
 補充 : 如果皆是同時找到的餐廳，就把全部同時找到的餐廳列出來。
 
 Example 1:
 
 Input:
 ["Shogun", "Tapioca Express", "Burger King", "KFC"]
 ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
 
 Output: ["Shogun"]
 
 Explanation: The only restaurant they both like is "Shogun".
 
 他們兩個人的名單只有一間 Shogun 是共同喜歡的餐廳。
 
 
 Example 2:
 
 Input:
 ["Shogun", "Tapioca Express", "Burger King", "KFC"]
 ["KFC", "Shogun", "Burger King"]
 
 Output: ["Shogun"]
 
 
 Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
 
 他們兩個人的名單有 Shogun 跟 KFC 是共同喜歡的餐廳。但是 Shogun 在兩個人的名單會先被共同找到。
 
 */


/* Time Limit Exceeded

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var res: [Int: [String]] = [:]
    
    for i in 0..<list1.count {
        if let index = list2.index(of: list1[i]) {
            if var common = res[i + index] {
                common.append(list1[i])
                res[i + index] = common
            } else {
                res[i + index] = [list1[i]]
            }
        }
    }
    return res.sorted { $0.key < $1.key}.first!.value
}
 */




/* Time Limit Exceeded Again

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    
    var res = [String]()
    var map = [String: Int]()
    var min = Int.max
    
    for i in 0..<list1.count { map[list1[i]] = i }
    for j in 0..<list2.count {
        if map.keys.contains(list2[j]) {
            if (map[list2[j]])! + j < min {
                min = (map[list2[j]])! + j
                res.removeAll()
                res.append(list2[j])
            } else if (map[list2[j]])! + j == min {
                res.append(list2[j])
            }
        }
    }
    return res
}
 */



/* Time Limit Exceeded AGGGGGAINNNNNN  LOL
 
 func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var res = [String: Int]()
    var dict1 = [String: Int]()
    var dict2 = [String: Int]()
    
    for (i, v) in list1.enumerated() {
        dict1[v] = i
    }
    
    for (i, v) in list2.enumerated() {
        dict2[v] = i
        if let index = list1.index(of: v) {
            res[v] = i + index
        }
    }
    let min = res.values.min()
    return res.filter { $0.value == min }.map { $0.key }
}

 */



/* FINALLY AC */

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var best = Int.max
    var dict1 = [String: Int]()
    var ans = [String]()
    
    for (i,v) in list1.enumerated() { dict1[v] = i }
    for (i,v) in list2.enumerated() {
        if let j = dict1[v] {
            if i + j < best {
                best = i + j
                ans = [v]
            } else if i + j == best {
                ans.append(v)
            }
        }
    }
    return ans
}


 
findRestaurant(["Shogun","Tapioca Express","Burger King","KFC"],
    ["KFC","Burger King","Tapioca Express","Shogun"])

findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"],
["KFC", "Shogun", "Burger King"])












