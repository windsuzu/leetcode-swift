/* 2017. 8. 26 
 
 Assume you are an awesome parent and want to give your children some cookies.
 
 But, you should give each child at most one cookie. Each child i has a greed factor gi, which is the minimum size of a cookie that the child will be content with;
 
 and each cookie j has a size sj. If sj >= gi, we can assign the cookie j to the child i, and the child i will be content.
 
 Your goal is to maximize the number of your content children and output the maximum number.
 
 給定兩個陣列，一個代表各個餅乾的尺寸， 一個代表每個小孩想要的餅乾尺寸。
 
 現在將餅乾分配給小孩們，但分配的餅乾尺寸不能夠小於小孩期望的餅乾尺寸。
 
 求這些餅乾最多可以滿足幾個小孩。
 
 Example 1:
 Input: [1,2,3], [1,1]
 
 Output: 1
 
 Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3.
 And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
 You need to output 1.
 
 現在有三個小孩，兩個尺寸為 1 的餅乾，但只有一個小孩接受尺寸為 1 的餅乾，所以得出答案 1 。
 
 
 Example 2:
 Input: [1,2], [1,2,3]
 
 Output: 2
 
 Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2.
 You have 3 cookies and their sizes are big enough to gratify all of the children,
 You need to output 2.
 
 現在有兩個小孩，三個尺寸為 1, 2, 3 的餅乾，一個小孩接受尺寸為 1 的餅乾， 另一個接受尺寸為 2 的餅乾，所以得出答案 2 。
 
 */



func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    let g = g.sorted(by: <)
    let s = s.sorted(by: <)
    var i = 0
    var j = 0
    
    while(i<g.count && j<s.count) {
        if g[i] <= s[j] {
            i += 1
        }
        j += 1
    }
    return i
}



findContentChildren([2,12,4,3,4,1,4,6,14,5],[1,1,3,2,3,4,4,3,2,1])




















