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