# 프로퍼티 & 옵저버



```swift
import UIKit

var myAge = 0 {
    willSet {
        print("myAge: \(myAge)")
    }didSet{
        print("myAge: \(myAge)")
    }
}

myAge = 10
// myAge: 0
// myAge: 10

myAge = 20
// myAge: 10
// myAge: 20
```



