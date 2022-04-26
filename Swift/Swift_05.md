# Unwrap



```swift
import UIKit

// 만약 변수가 nil이라면 즉, 값이 없다면 나는 이 변수에 90을 넣겠다.
var someVariable : Int? = nil
if someVariable == nil {
    someVariable = 90
}
print(someVariable)


// if let
// 만약 someVariable에 값이 있다면 otherVariable에 넣어 unwrap 하겠다.
if let otherVariable = someVariable {
    print("언래핑 되었다. 즉 값이 있다. \(otherVariable)")
}else{
    print("값이 없다.")
}


// 기본값
// someVariable이 비어있으면, 즉 값이 없으면 기본값으로 10을 넣겠다
someVariable = nil
let myvalue = someVariable ?? 10
print(myvalue)


// guard let
// 만약 값이 있으면 변수에 넣고, 없으면 return으로 반환한다.
func unwrap(parameter: Int?){
    print("unwrap() called")
    guard let unWrappedParm = parameter else{
        return
    }
    print("unWrappedParm: \(unWrappedParm)")
}

var first : Int? = 30
var second : Int? = 50

print("first: \(first)")
print("second: \(second)")

unwrap(parameter: first)
unwrap(parameter: second)

var third : Int? = nil

print("third: \(third)")
unwrap(parameter: third)
```

​	옵셔널이란 값이 있을 수도 없을 수도 있어 모르는 것을 의미한다. 그래서 물음표(?)를 사용한다.

​	언랩핑이란 감싸져 있는 것을 벗기는 것이다. 안 벗기면 값이 'optional()'이런 식으로 나온다. 벗기는 방법에는 두 가지가 있다. 'if let'과 'guard let'이 있다.