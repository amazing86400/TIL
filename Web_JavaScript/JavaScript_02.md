# HTML과 JS의 만남 - event



​	**웹브라우저 위에서 일어나는 일들을 사건, 영어로는 'event'라고 한다.**



### `<input>`

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>java</title>
  </head>
  <body>
    <input type="button" value="hi" onclick="alert('hi')">
    <input type="text" onchange="alert('changed')">
    <input type="text" onkeydown="alert('key down!')">
  </body>
</html>
```

​	`<input>`은 버튼을 나타내는 태그로, 클릭을 할 수 있다. 그리고 **value** 옵션으로 버튼 안에 이름을 지어줄 수도 있다.

​	onclick 속성에 **alert를 입력하면 경고 창**을 나타낼 수 있다. **onclick** 속성은 아주 특별한 속성이다. 이 속성에는 **반드시 자바스크립트**가 와야 한다고 나와있기 때문이다. 그리고 onclick 속성의 속성 값은 **웹브라우저가 기억하고 있다가 버튼을 클릭하면 자바스크립트 코드를 실행**한다.

​	태그 타입을 'text'로 입력하면 html에 글자를 입력할 수 있는 칸이 생긴다. 그리고 onclick을 **'alert('changed)'**로 설정하면 내용이 변했을 때 이벤트를 체크한다. 쉽게 말해 글자를 입력하고 마우스를 다른 공간으로 빼면 changed 메시지가 나온다. **onkeydown** 속성을 입력해 주면 text 창에서 키보드를 누르면 내가 지정한 문구 메시지가 나온다.

​	google에 'javascript keydown event attribute'를 입력해 자바스크립트의 다양한 속성에 대해 추가적으로 공부해보자. 'W3C School'을 애용하자.

​	우리는 이렇게 몇가지의 이벤트를 이용해서 사용자와 상호작용하는 웹페이지, 웹사이트를 만들 수 있다.
