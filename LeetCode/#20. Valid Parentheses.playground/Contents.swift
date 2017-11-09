/* 2017. 11. 6
 
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 
 給一個字串，裡面只會包含 '(', ')', '{', '}', '[' , ']' ，現在驗證字串是否符合格式。
 
 這些括號，必須要按照正確的順序合起來， "()" 或 "()[]{}" 就是正確的，但 "(]" 或 "([)]" 就不是。
 
 */


func isValid(_ s: String) -> Bool {
    let s = Array(s)
    var stack = [String]()
    
    for c in s {
        switch c {
        case "(":
            stack.append(")")
        case "{":
            stack.append("}")
        case "[":
            stack.append("]")
        default:
            if stack.isEmpty { return false }
            if let pop = stack.popLast(), pop != String(c)   {
                return false
            }
        }
    }
    return stack.isEmpty
}

isValid("{}[]()")
isValid("{(}}")
isValid("]")
isValid("[{{[]}[]{[]}}]")
