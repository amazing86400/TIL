# Struct & Class



```swift
import UIkit


// struct
struct youtubeSturct {
    var name : String
    var subs : Int
}

var shin = yougtubeSturct(name:"신대리", subs:1234)
var shinkey = shin
print(shinkey.name)

// 이름바꾸기
shinkey.name = "신과장"
print(shinkey.name)
print(shin.name)


// class
class youtubeclass {
    var name : String
    var subs : Int
    init(name:String, subs:Int){
        self.name = name
        self.subs = subs
    }
}

var shin = youtubeclass(name:"신대리", subs:1234)
var shinkey = shin
print(shinkey.name)

// 이름바꾸기
shinkey.name = "신과장"
print(shinkey.name)
print(shin.name)
```

​	Struct와 Class 모두 데이터 덩어리(집합)을 의미한다. 기능은 둘 다 비슷하다. 하지만 큰 차이가 있다. Struct는 값이 따로 변경되며 프린트의 사본을 만드는 느낌이고, Class는 서로 연동되어 값이 함께 변경이 된다. 구글의 docs 느낌이다. 그리고 클래스에서 init을 하는 이유는 생성자 때문인데, 이는 데이터를 메모리에 올리기 위해 하는 작업이다.