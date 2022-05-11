# 옵셔널(Optional)



​	옵셔널은 Swift가 가진 가장 큰 특징 중 하나이다. 이는 값이 있을 수도 혹은 없을 수도 있다는 것을 의미한다. "안녕"과 ""는 값이 있는 것이다. 따옴표("")는 빈 문자열이다. 이때 값이 없는 문자열은 `nil` 이다. 정수형의 경우 1234와 0은 값이 있는 것이다. 마찬가지로 값이 없을 경우 `nil` 로 표현한다.

​	하지만 모든 변수에 `nil` 을 사용할 수 없다.

```swift
var name: String = "mark"
name = nil // error
```

​	값이 있을 수도 있고, 없을 수도 있는 변수를 정의할 때는 '타입 어노테이션'에 '?'를 붙여야 한다. 이것이 바로 옵셔널이다. 만약 초깃값을 지정하지 않을 경우 이 변수의 기본값은 `nil` 이 된다.

```swift
var email: String? 
print(email) // nil 

email = "aaa@gmail.com" 
print(email) // Optional("aaa@gmail.com")
```



​	이때 옵셔널로 정의한 변수는 옵셔널이 아닌 변수와는 다르다.

```swift
let optionalEmail: String? = "hh940630@gmail.com" 
let requiredEmail: String = optionalEmail // Compile Error
```

​	두 번째 변수는 옵셔널이 아닌 `String`이기 때문에 항상 값을 가지고 있어야 한다. 하지만 첫 번째 변수는 옵셔널로 선언되었기 때문에 실제 코드가 실행되기 전까지는 값이 있는지 없는지를 알 수 없다. 따라서 Swift 컴파일러는 안전을 위해 `requiredEmail`에 옵셔널 변수를 대입할 수 없다.