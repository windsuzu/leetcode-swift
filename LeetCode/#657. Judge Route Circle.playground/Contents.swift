/* 2017. 8. 15
 
 Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
 
 The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.
 
 
 有個機器人在座標 (0,0)， 給一個字串讓機器人動起來畫一個圓，意思就是他要走回原點。
 
 字串中 R (Right), L (Left), U (Up) and D (down)，回傳 bool 判斷機器人是否回到原點。
 
 Example 1:
 Input: "UD"
 Output: true
 
 
 Example 2:
 Input: "LL"
 Output: false
 
 
 */



/* 第一次解題 : 428 ms */
func judgeCircle(_ moves: String) -> Bool {
    var dict = [Character: Int]()
    for s in Array(moves.characters) {
        dict[s] = (dict[s] ?? 0) + 1
    }
    return dict["U"] == dict["D"] && dict["R"] == dict["L"]
}





judgeCircle("ULDRULRD")

