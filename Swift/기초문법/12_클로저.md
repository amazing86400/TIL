# 클로저



```swift
import UIKit

//클로저
// String으로 반환하는 클로저
let myname : String = {
    return "신짱구"
}()

print(myname) // 신짱구


// 클로저 정의
let myRealName = { (name:String) -> String in
                 return "안녕 나는 \(name)이야."}

myRealName("신짱구") // 안녕 나는 신짱구이야.


// 반환하는 값이 없을 때
let myRealNameLogic : (String) -> Void = { (name:String) in
                                         print("안녕 나는\(name)이야.")}

myRealNameLogic("신짱구") // 안녕 나는 신짱구이야.
```

