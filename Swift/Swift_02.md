# 반복문 - foreach



```swift
import UIKit
import Darwin
import Foundation

var myArray : [Int] = [0,1,2,3,4,5,6,7,8,9,10]
for item in myArray{
    print("item: \(i)")
}

// 조건 달기 - where
for item in myArray where item > 5{
    print("item: \(i)")
}

// 짝수
for item in myArray where item % 2 == 0{
    print("짝수: \(i)")
}

// 홀수
for item in myArray where item % 2 != 0{
    print("홀수: \(i)")
}
```

​	swift에서 배열은 자료형 타입에 '[]'를 씌우고, 인자들을 넣으면 된다. 그리고 빈 배열을 생성 시에는 똑같이 변수를 생성하는데, 괄호 안에 값을 빼주면 된다. 그리고 'where'을 통해 조건을 줄 수 있다.
