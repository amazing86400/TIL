# 배열 함수



### 배열 인덱싱

```js
var BlackPink = ["제니", "지수"];
BlackPink[0]; // 제니
BlackPink['0'] // 제니
BlackPink.length; // 2
BlackPink[BlackPink.length-1]; // 지수
```

​	배열은 Var 변수를 생성한 뒤 대괄호를 사용해 인자를 담으면 된다. 그리고 Javascript 역시 인덱싱을 통해 값을 추출할 수 있고, 0부터 시작된다. 이때 대괄호 안에 있는 값은 String, Int 타입 구분 없이 사용 가능하다.

​	배열 안에 인자가 몇 개 있는지 확인하려면 `length`를 사용하면 된다. 가장 마지막 코드는 배열 중 가장 마지막 값을 확인하는 코드다. **이때 Python처럼 인덱싱할 때 [-1]은 사용이 안 된다.**



### push - 배열 뒤에 값 추가

```js
BlackPink.push("로제");
BlackPink[2] // 로제
BlackPink.length; // 3

BlackPink.push(["사나", "나연"]) // 4 >> ["제니", "지수", "로제", Array(2)]
```

​	`push` 함수는 배열 가장 끝에 값을 추가하는 함수다. 값을 추가할 때 배열을 추가하게 되면 Array 형태로 값이 추가되는 것을 확인할 수 있다.



### unshift - 배열 앞에 값 추가

```js
BlackPink.unshift("리사");
BlackPink[0]; // 리사
BlackPink.length; // 4
```

​	`unshift` 함수는 값을 배열 가장 앞에서부터 추가한다.



### pop - 배열 끝에 항목 제거

```js
BlackPink.pop(); // 로제
BlackPink.pop('제니') // 지수
```

​	`pop` 함수는 배열 가장 끝부터 항목을 제거하며, 제거할 때 값을 반환해 주며 제거한다. 그리고 **pop() 함수에 지정 값을 넣어도 가장 끝에 있는 값이 제거된다.**



### shift - 배열 앞에 값 제거

```js
BlackPink.shift() // 리사
```

​	`shift` 함수는 `unshift`의 반대 개념이라고 생각하면 된다. 앞에서부터 값을 제거한다.



### splice - 인덱스 위치 값 제거

```js
BlackPink.splice(1,2) // 제니, 지수
```

​	`splice` 함수는 배열에서 지정한 인덱스의 위치만큼 값을 제거하는 함수다. 예제처럼 1과 2를 선택했다면 인덱스의 1번인 '제니'부터 2개를 제거하는 것이다.



### includes - 특정 요소 포함 여부

```js
var BlackPink = ["제니","지수","로제","리사"]
BlackPink.includes("제니") // true
BlackPink.includes("카리나") // false
```

​	`includes` 함수는 배열에 특정 요소가 있는지 없는지에 대한 포함 여부를 확인하는 함수이다. 값이 있으면 'true'를 반환하고, 없으면 'false'를 반환한다.



### join - 배열의 모든 요소를 하나의 문자열로 연결

```js
var BlackPink = ["제니", "지수", "로제", "리사"]
BlackPink.join() // '제니,지수,로제,리사'
BlackPink.join('') // '제니지수로제리사'
BlackPink.join('-') // '제니-지수-로제-리사'
```

​	`join` 함수는 배열 안에 있는 모든 값들을 연결해 하나의 문자열로 만들어준다. 별다른 조건 없이 함수를 사용하면 반점(',')으로 연결하고 따옴표('')만 사용할 시 한 번에 연결을 한다. 그리고 원하는 값이 있으면 따옴표 안에 입력하면 그 입력값으로 요소를 연결한다.