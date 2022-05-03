# Swift 기본 문법



### 변수 & 상수

```swift
var name = "kbshin"
let btd = 1997

name = "shinkb"
btd = 0814 // compile error
// Cannot assign to value: 'birthyear' is a 'let' constant
```

​	swift에서는 변수를 선언할 때 'var'와 'let'을 사용한다. 이 둘의 차이점은 수정 가능 여부이다. var로 선언한 변수는 인자를 변경할 수 있다. 반면 let으로 선언한 변수의 값은 변경이 불가능하다.



---



### 정적 타이핑

```swift
var name : String = "kbshin"
let btd : Int = 1997
var height : Float = 180.2

btd + height // error

Float(btd) + height

btd + Int(height)

"안녕 나는" + String(btd) + "년도에 태어났어!"
"안녕 나는 \(btd)년도에 태어났어!"
```

​	swift는 타입에 매우 엄격하다. 그래서 변수나 상수를 정의할 때 그 자료형이 어떤 것인지를 명시해 주는데, 이러한 언어를 '정적 타이핑'이라고 한다. 만약 다른 type의 변수를 함께 사용하고 싶다면 강제로 형을 변환하여 연산을 할 수 있다.

​	swift는 그리고 '타입추론(Type Inference)' 기능을 지원한다. 따옴표("")로 변수가 선언되면 String 타입인 것을 알고, 숫자이면 Int 타입인 것을 추론한다.



---



### 배열(Array) & 딕셔너리(Dictionary)

```swift
var lng = ["kor", "eng", "spn"]
var city = [
    "한국":"서울",
    "일본":"도쿄",
    "중국":"베이징"
]

lng[0] // "kor"
lng[2] = "jpn"

city["한국"]
city["프랑스"] = "파리"

print(city.keys)
print(city.values)

var lng : [String] = []
var city : [String:String] = [:]

var lng = [String]()
var city = [String:String]()
```

​	배열과 딕셔너리는 모두 '대괄호([])'를 사용한다. 그리고 이 역시 var 변수로 선언하게 되면 인자를 변경할 수 있지만 let 변수는 변경이 불가능하다. 그리고 아래 코드는 빈 배열을 생성하는 코드다.