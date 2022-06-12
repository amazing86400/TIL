# DataType - Number(Int) & String



​	Javascript의 언어 타입은 **'원시 값'**과 **'객체'**로 나뉜다.

*<u>원시값</u>*

- Boolean
- Null
- Undefined
- Number
- Bight
- String
- Symbol



### 숫자(Number)

```js
1+1 // 더하기
2-1 // 빼기
3*7 // 곱하기
6/2 // 나누기
```

​	가장 기본이 되는 사칙연산이다.



---



### 문자(String)

```js
"hello world"
'hello world'

'hello world'.length         // 10
"hello world".toUpperCase()  // HELLO WORLD
"HELLO WORLD".toLowerCase()  // hello world

"hello world".indexOf('O')   // -1
"hello world".indexOf('o')   // 4

"          hello         ".trim()  // hello
```

​	String 입력은 다른 언어와 마찬가지로 따옴표('')를 사용한다. String에 관한 몇가지 함수들을 알아보겠다.

1. 문자열이 몇개인지 세야할 때는 `length()`를 사용한다.
2. 문자를 **대문자**로 치환할 때는 `toUpperCase()`를 사용한다.
3. 문자를 **소문자**로 치환할 때는 `toLowerCase()`를 사용한다.
4. `indexOf()`는 문자열에서 주어진 값과 일치하는 첫 번째 인덱스를 반환한다. 일치하는 값이 없으면 '-1'을 반환한다.
5. 문자열에서 공백을 없애고자 할때는 `trim()`을 사용한다.



----



### type of

```js
typeof 10; // number
typeof 'apple' // string

var num = 1000;
typeof num; // number

var str = 'Javascript';
typeof str; // string
```

​	typeof 연산자는 피연산자의 타입을 반환하는 피연산자가 단 하나뿐인 연산자다. typeof를 통해 변수의 타입도 확인할 수 있다.



---



### null & undefined

```js
var num; // 초기화하지 않았으므로 undefined 값을 반환
var str = null; // object 타입의 null 값
typeof secondNum; // 정의되지 않은 변수에 접급하면 undefined 값 반환
```

​	자바스크립트에서 null이란 object 타입이며, 아직 **'값'이 정해지지 않은 것**을 의미한다. 또한, undefined란 null 과는 달리 **'타입'이 정해지지 않은 것**을 의미한다. 따라서 자바스크립트에서 undefined는 초기화되지 않은 변수나 존재하지 않는 값에 접근할 때 반환된다.



```js
null == undefined; // true
null === undefined; // false
```

​	null과 undefined는 동등 연산자(==)와 일치 연산자(===)로 비교할 때 그 결과값이 다르므로 주의하자. null과 undefined는 타입을 제외하면 같은 의미지만, 타입이 다르므로 일치하지는 않는다.