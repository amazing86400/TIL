# 반복문 - for



```swift
import UIKit

// range(범위)
// 0~5 까지 반복
for i in 0...5 {
    print(i)
}
// 0,1,2,3,4,5


// 5보다 작은 값
for i in 0..<5 {
    print(i)
}
// 0,1,2,3,4


// 5보다 작은 것 중 짝수
for i in 0..<5 where i % 2 == 0 {
    print(i)
}
// 0,2,4


// 빈 배열 만들기
var randomInts : [Int] = []
var randomInts : [Int] = [Int]()

for _ in 0..<25 {
    let randomNum = Int.random(in: 0...100)
    randomInts.append(randomNum)
}
print(randomInts)
```
