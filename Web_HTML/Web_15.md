# `<input>`



​	<u>요즘은 input의 속성들 대신 JS를 사용해 입력받은 정보를 검사하거나 다듬어 사용하는 것이 추세다.</u>



```html
<input type="text">
```

​	텍스트를 쓸 수 있는 상자가 생긴다. 글자를 입력할 수 있다. 태그에서 default가 되는 타입이다.



```html
<input type="search" value="search" onfocus="value = ''">
```

​	텍스트 타입과 마찬가지로 텍스트를 입력할 수 있는 상자이며, 오른쪽에 입력한 문자를 모두 지우는 'x' 버튼이 추가된다. 그리고 초기값을 설정했고, 입력하려고 클릭하면 초기값이 없어지도록 코딩했다.



```html
<input type="number">
```

​	오직 숫자만 입력할 수 있다. 텍스트는 입력 안된다. 그리고 오른쪽에 숫자를 1식 증가시킬 수 있는 버튼이 생긴다. 



```html
<input type="password">
```

​	입력하는 모든 텍스트가 마스킹 처리가 되어 나온다.



```html
<input type="tel">
```

​	웹에서 사용할 때는 text 타입과 별 다를 것이 없다. 하지만 스마트폰 등 일부 디바이스에서는 쿼티 자판 대신 전화번호를 입력할 수 있는 다이얼패드를 띄워준다.



```html
<input type="button">
```

​	`<button>` 태그와 유사한 기능이다.



```html
<input type="submit" value="search">
```

​	submit 타입은 `<form>` 태그와 함께 사용되며 버튼을 누르면 다른 컴퓨터로 데이터가 전송된다.



버튼 태그, input 태그의 버튼 타입, 그리고 submit 타입은 겉보기에는 차이가 없다. 하지만 거의 모든 경우에 버튼 태그가 상위호환 기능이다. 버튼 태그는 CSS와 JS를 함께 사용하기에도 매우 좋다. 그래서 훨씬 간편하면서 범용성도 뛰어나다.



```html
<input type="file">
```

​	파일을 업로드 할 수 있는 타입이다. 버튼을 누르면 탐색기가 실행된다. 



```html
<input type="checkbox">원하는 문구 입력
```

​	체크 박스를 생성하며 클릭할 수 있다. 그리고 태그 끝에 원하는 문구를 넣어줘도 된다.



```html
<input type="radio" name="radio1" checked>한식
<input type="radio" name="radio1">중식
<input type="radio" name="radio1">양식
<input type="radio" name="radio1">일식
```

​	여러 선택지 중에 하나를 선택할 수 있는 타입이다. 'checked'를 태그 안에 넣으면 체크가 된 채로 생성된다. 중복 선택은 안된다.



