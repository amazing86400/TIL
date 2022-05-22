# HTML과 JavaScript의 만남 - Script 태그



### JavaScript란

​	JavaScript는 사람들과 상호작용하는 언어이며, 기본적으로 HTML 위에서 동작하며 HTML을 제어하는 언어이다. 즉, 고정되어 있는 HTML(정적)을 동적으로 만들어준다. 

 	JavaScript와 Java가 이름 때문에 서로 밀접한 연관이 있다고 착각했었다. 하지만 이 둘은 인도와 인도네시아 처럼 서로 연관성 없는 다른 프로그래밍 언어이다. 자바스크립트는 초창기 다른 이름으로 불렸는데, Java가 인기를 끌면서 마케팅 수단으로 이름을 자바스크립트라고 바꿨다고 한다.(정확한 정보인지는 확인하지 못하였다)



---



### `<script>`

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>JavaScript</h1>
    <script>
      document.write('hello world');
    </script>
    <h1>HTML</h1>
    hello world
  </body>
</html>
```

​	html에 **'지금부터 자바스크립트가 시작됩니다'**라고 알리는 작업을 우선 입력해 주어야 한다. 이때 사용하는 태그가 바로 `<script>` 태그이다. 이러면 태그 안쪽에는 자바스크립트가 오도록 약속되어 있기 때문에 웹브라우저는 `<script>` 태그 안쪽에 있는 코드를 자바스크립트로 해석한다. 그래서 `<scrip>` 태그 안쪽에 'document.write('hello world');'라는 자바스크립트 언어를 입력하면 html에 'hello world'라고 적혀있는 것을 확인할 수 있다.

​	그런데 여기서 하나 의문이 생길 것이다. '그러면 일반 html 언어랑 무슨 차이지?'라는 것이다. 위 코드처럼 입력하면 화면상에서는 아무런 차이를 못 느끼고 하나의 언어로만 작업했다고 느낄 것이다.



```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>JavaScript</h1>
    <script>
      document.write(1+1);
    </script>
    <h1>HTML</h1>
    1+1
  </body>
</html>
```

​	하지만 이 둘에는 큰 차이점이 있다. 바로 **'동적'**이라는 부분이다. 정적인 HTML 과는 달리 JavaScript는 동적인 특징을 갖고 있다. 그래서 1+1을 입력할 경우 HTML은 문자 그대로를 인식해 '1+1'로 나타내고, 자바스크립트는 계산을 실행하여 숫자 '2'를 나타낸다.