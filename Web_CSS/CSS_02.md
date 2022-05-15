# CSS 기본 문법



### 속성을 이용한 방법(태그 no!)

```html
  <ol>
    <li><a href="1.html" title="hello" target="_blank" style="color: blue;">나이키의 역사</a></li>
    <li><a href="2.html" title="Hi" target="_blank">Trail</a></li>
    <li><a href="3.html" title="good" target="_blank">NIKE Air Force 1</a></li>
  </ol>
```

​	`<style>`태그를 사용하는 것이 아닌 속성을 이용한 방법에 대해 알아보겠다. 가장 첫 번째 list의 `<a>`태그를 보면 끝부분에 'style="color: blue;"'라는 코드가 있다. 이렇게 하면 '나이키의 역사'라는 문구의 폰트 색이 파란색으로 바뀌게 된다. 이것이 바로 속성을 이용한 방법인데, 이는 HTML과 CSS의 사용 설명서에 적혀 있다. style이라는 속성을 썼으면 그 속성의 값을 웹브라우저는 CSS의 문법에 따라 해석해서 그 결과를 style 속성이 위치하고 있는 이 태그에 적용할 것이라고 적혀 있다. 



```html
  <style>
    a {
      color: black;
      text-decoration: none;
    }
  </style>
```

​	위 태그에서 **'a'**는 '효과를 누구에게 주겠는가'라는 점에서 **'선택자(selector)'**라고 부른다. 그리고 저 선택자에게 지정될 효과를 color, text-decoration.. 이라고 적어 놓았는데, 이것을 **'효과(declaration=선언)'**이라고 한다. 그리고 저기서 **'color'**는 **'Property'**라고 부르고, **'red'**는 property의 값이라는 의미에서 **'value'**라고 부른다. 

​	`text-decoration`을 'none'으로 지정하면 `<a>`태그의 모든 장식(밑줄)이 없어진다. 그리고 **세미콜론(;)**은 하나의 디스크립션의 시작과 끝을 알려주는 **'구분자'**라고 생각하면 된다. 효과를 지정하면 항상 끝에 세미콜론을 넣도록 하자. 



```html
  <ol>
    <li><a href="1.html" title="hello" target="_blank" style="color: blue; text-decoration: underline;">나이키의 역사</a></li>
    <li><a href="2.html" title="Hi" target="_blank">Trail</a></li>
    <li><a href="3.html" title="good" target="_blank">NIKE Air Force 1</a></li>
  </ol>
```

​	세미콜론을 이용해 원하는 문구에 밑줄도 넣어봤다. **'style="color: blue; text-decoration: underline;"'** 이렇게 하면 내가 지정한 특정 문구에만 효과를 줄 수 있다.