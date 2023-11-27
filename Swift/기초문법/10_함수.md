# 함수 매개변수



```swift
import UIKit

// 함수, 메소드 정의
func FirstFunction(name: String) -> String{
    return "안녕하세요. \(name) 입니다."
}

// 함수 호출
FirstFunction(name: "신기범")
// 안녕하세요. 신기범 입니다.


// 매개변수 이름 변경
func SecondFunction(with name: String) -> String {
    return "안녕하세요. \(name) 입니다."
}

SecondFunction(with: "신민아")
// 안녕하세요. 신민아 입니다.

// 제일 간단
func ThirdFunction(_ name: String) -> String {
    return "안녕하세요. \(name) 입니다."
}
ThirdFunction("신짱구")
// 안녕하세요. 신짱구 입니다.
```

​	함수를 정의할 때 내가 원하는 매개변수를 입력할 수 있다. 이 매개변수에는 타입을 정해줘야 한다. 그리고 매개변수 이름을 변경하고 싶다면 변경하고 싶은 문자를 기존에 있던 매개변수 앞에 입력하면 된다. 그리고 이게 귀찮으면 '_'를 사용하면 손쉽게 함수를 사용할 수 있다.

