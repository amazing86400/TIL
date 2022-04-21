# enum



```swift
import UIKit
import Darwin
import Foundation

enum School {
    case elementary, middle, high
}
let yourSchool = School.high
print("yourSchool: \(yourSchool)")
print("yourSchool:", yourSchool)

enum Grade : Int {
    case first = 1
    case second = 2
}
let yourGrade = Grade.second.rawValue
print("yourGrade: \(yourGrade)")

enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    func getname() -> String {
        switch self {
        case .elementary(let name):
            return name
        case let .middle(name):
            return name
        case let .high(name):
            return name
        }
    }
}
let yourSchoolName = SchoolDetail.middle(name: "문산북중학교")
print("yourSchoolName: \(yourSchoolName.getname())")
```

