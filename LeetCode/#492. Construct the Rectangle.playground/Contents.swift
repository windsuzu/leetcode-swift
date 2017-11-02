/* 2017. 8. 18
 
 For a web developer, it is very important to know how to design a web page's size. So, given a specific rectangular web page’s area, your job by now is to design a rectangular web page, whose length L and width W satisfy the following requirements:
 
 1. The area of the rectangular web page you designed must equal to the given target area.
 
 2. The width W should not be larger than the length L, which means L >= W.
 
 3. The difference between length L and width W should be as small as possible.
 
 給一個四邊形，必須找到他的「長」跟「寬」。
 
 1. 長乘以寬剛好等於給予的面積
 2. 長必須要大於等於寬
 3. 長與寬盡量趨近於相等（正方形）。
 
 Example:
 
 Input: 4
 Output: [2, 2]
 
 Explanation: 
 The target area is 4, and all the possible ways to construct it are [1,4], [2,2], [4,1].
 But according to requirement 2, [1,4] is illegal; according to requirement 3,  [4,1] is not optimal compared to [2,2]. So the length L is 2, and the width W is 2.
 
 四邊形的面積為 4 ，他的長寬可能為 [1,4], [2,2], [4,1] ，寬不能大於長所以 [1,4] 去掉， [2,2] 比起 [4,1] 更趨近於正方形，所以答案是 [2,2] 。
 
 */


/* 解題 
 
 要求出趨近於正方形的長寬，最先想到的是把面積開根號，看寬是否為整數。
 
 是整數代表是正方形，直接回傳 [w, w]
 
 如果不是，依序將開根號得來的寬化成整數，減一直到能被面積整除，就可以求得寬。最後回傳 [area/w, w]
 
 */

import Foundation

func constructRectangle(_ area: Int) -> [Int] {
    if area == 0 { return [] }
    
    var w = Int(sqrt(Double(area)))
    while area % w != 0 {
        w -= 1
    }
    return [area / w, w]
}

constructRectangle(4)












