# 조건문



```swift
import UIKit
import Darwin
import Foundation

var isDarkmode : bool = true
if isDarkmode == true{
    print("다크모드 입니다.")
}else{
    print("다크모드가 아닙니다.")
}

// 가장 쉬운 구문
if isDarkmode{
    print("다크모드 입니다.")
}else{
    print("다크모드가 아닙니다.")
}

if isDarkmode != false{
    print("다크모드 입니다.")
}else{
    print("다크모드가 아닙니다.")
}

if !isDarkmode{
    print("다크모드 입니다.")
}else{
    print("다크모드 입니다.")
}

// 심화 구문
var title : String = isDarkmode == true ? "다크모드 입니다." : "다크모드가 아닙니다."
print("title: \(title)")

var title : String = isDarkmode ? "다크모드 입니다." : "다크모드가 아닙니다."
print("title: \(title)")

var title : String = !isDarkmode ? "다크모드가 아닙니다." : "다크모드 입니다."
print("title: \(title)")
```



```swift
var age = 19
var student = ""

if age >= 8 && age < 14 {
    student = "초등학생"
} else if age < 17 {
    student = "중학생"
} else if age < 20 {
    student = "고등학생"
} else {
    student = "기타"
}

student // 고등학생
```

