# 제네릭



```swift
import UIKit

struct myArray<T>{
    var elements : [T] = [T]()
    init(_ elements: [T]){
        self.elements = elements
    }
}

struct First {
    var name: String
}

struct Second {
    var name: String
}

var mysomeArray = myArray([1,2,3])
print(mysomeArray)

var mystringArray = myArray(["a", "b", "c"])
print(mystringArray)


let friend_1 = friend(name:"기범")
let friend_2 = friend(name:"제니")
let friend_3 = friend(name:"지수")

var myFriendArray = myArray([friend_1.name, friend_2.name, friend_3.name])
print(myFriendArray)
```

​	제네릭은 어떠한 자료형이라도 받을 수 있다. 제네릭을 선언할 때는 '<>'를 사용하고, 관습적으로 'T'를 넣어준다. 위 예시처럼 Int, String 타입 외에도 다양한 값을 넣어 연습해 보자.