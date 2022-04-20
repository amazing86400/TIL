# 반복문 - foreach



```swift
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

