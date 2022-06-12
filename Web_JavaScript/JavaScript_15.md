# String Method



### indexOf() & lastIndexOf()

```js
var str = 'abcDEFabc';
str.indexOf('abc'); // 0
str.indexOf('D'); // 3 
str.indexOf('asd'); // -1
str.lastIndexOf('abc'); // 6
```

​	다음 메소드는 String 인스턴스에서 특정 문자나 문자열이 처음으로 등장하는 위치나 마지막으로 등장하는 위치를 반환한다. 만약 전달받은 특정 문자나 문자열을 찾을 수 없을 때는 -1을 반환한다.



---



### charAt()

```js
var str = 'abcDEFabc';
str.charAt(0); // a
str.charAt(3); // D
str.charAt(10); // ''
```

​	다음 메소드는 String 인스턴스에서 전달받은 인덱스에 위치한 문자를 반환한다.



---



### slice() & substring() & substr()

```js
var str = 'abcDEFabc';
str.slice(3,6); // DEF
str.slice(-3); // abc
str.slice(-4,-1); // Fab

str.substring(3,6); // DEF
str.substr(3, 3); // DEF
```

​	다음 메소드는 String 인스턴스에서 전달받은 시작 인덱스부터 종료 인덱스 바로 앞까지의 문자열만을 추출하여 만든 새로운 문자열을 반환한다.



---



### concat()

```js
var str = '나는';
str; // '나는'
str.concat(' 짱이야!'); // '나는 짱이야!'
```

​	다음 메소드는 String 인스턴스에 전달받은 문자열을 결합한 새로운 문자열을 반환한다.



---



### trim()

```js
var str = '    js    ';
str; // '    js    '
str.trim(); // 'js'
```

​	다음 메소드는 String 인스턴스의 양 끝에 존재하는 모든 공백과 줄 바꿈 문자(LF, CR 등)를 제거한 새로운 문자열을 반환한다. trim() 메소드는 String 인스턴스의 문자열 값 그 자체에는 영향을 주지 않는다.



---



### replace()

```js
var str = 'abcdefabc';
str.replace('a', 'z'); // 'zbcdefabc'
str.replaceAll('b', 'x'); // 'axcdefaxc'
```

​	다음 메소드는 문자열의 특정 값을 지정한 값으로 바꿔 새로운 문자열을 반환한다. replace() 메소드는 해당 값의 가장 첫 번째 문자만을 변경하고, replaceAll() 메소드는 해당 값 전체를 변경한다.