# Type conversion - 타입변환



### type conversion

```js
var num = 20; // number 타입의 20
num = '이십'; // string 타입의 이십
var num; // 한 변수에 여러 번 대입할 수는 있지만, 변수의 재선언은 할 수 없다. 무시됨.
```

​	자바스크립트는 타입 검사가 매우 유연한 언어다. 자바스크립트의 변수는 타입이 정해져 있지 않으며, 같은 변수에 다른 타입의 값을 다시 대입할 수 있다.



---



### implicit type conversion(묵시적 타입 변환)

```js
10 + '살입니다.'; // '10살입니다.' 문자열 연결을 위해 숫자 10이 문자열로 변환
'3' * '5'; // 15 곱셈 연산을 위해 두 문자열이 모두 숫자로 반환
1 - '살입니다.'; // NaN
```

​	자바스크립트는 특정 타입의 값을 기대하는 곳에 다른 타입의 값이 오면, 자동으로 타입을 변환하여 나타낸다. 즉, 문자열 값이 오길 기대하는 곳에 숫자가 오더라도 자바스크립트는 알아서 숫자를 문자열로 변환한다.

​	세 번째 예제는 의미에 맞게 자동으로 타입을 변환할 수 없어, NaN 값을 반환했다.

> NaN은 Not a Number의 축양형으로, 정의되지 않은 값이나 표현할 수 없는 값이라는 의미다. 숫자로 변환할 수 없는 피연산자로 산술 연산을 시도하는 경우에 반환되는 읽기 전용 값이다.



---



### explicit type conversion(명시적 타입 변환)

```js
Number("10") // 숫자 10
String(true) // 문자열 'true'
Boolean(0); // 불리언 false
Object(3); // new Number(3)와 동일한 결과로 숫자 3
```

​	명시적 타입 변환을 위해 자바스크립트가 제공하는 전역 함수는 다음과 같다.

- Number()
- String()
- Boolean()
- Object()
- parseInt()
- parseFloat()