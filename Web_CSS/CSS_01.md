# CSS의 등장



### CSS를 사용하는 이유

​	웹페이지를 꾸미는 방법에는 크게 두 가지 방법이 있다. 첫 번째는 HTML 상에서 태그를 추가하는 것이다. 이것은 기존에 있는 언어에 태그만을 추가하는 것이기 때문에 비교적 매우 쉽기 마련이다. 하지만 이 방법은 그리 효율적이지 않다. 예를 들어 폰트를 바꾼다고 생각해 보자. 이때 과거에는 `<font>`태그를 사용해 폰트를 꾸밀 수 있었다.(지금은 사용 안 함) 하지만 이 방법에는 최대 단점이 있다. 일일이 태그 하나하나 추가를 해줘야 하는 번거로움이다. 만약 꾸며야 하는 태그의 수가 일억 개가 넘는다고 가정한다면 이는 불가능이라고 생각하면 된다.

​	이러한 문제를 덜기 위해 만들어진 것이 바로 CSS이다. CSS는 새로운 컴퓨터 언어이다. 기존 HTML에서 추가로 만들어진 언어이기 때문에 우리는 CSS를 사용하려면 다시 새롭게 학습을 해야 한다. 그래서 앞서 말한 방법보다는 어려운 길일 수도 있다. 하지만 엄청난 효과가 있기 때문에 CSS가 등장하고 사용되는 것 아닐까?

​	웹브라우저가 처음 나왔을 때 웹브라우저는 HTML만을 해석해서 처리하는 프로그램이었다. 그래서 웹브라우저는 코드를 기본적으로 HTML이라고 생각한다. 하지만 CSS는 HTML 과는 완전히 다른 컴퓨터 언어이다. 그래서 우리는 컴퓨터에게 이 코드가 HTML이 아니라 CSS의 문법에 따라 해석해야 된다는 것을 HTML 문법으로 얘기해 줘야 한다. 그것이 바로 `<style>`태그이다. 이 태그는 HTML 언어이면서 동시에 태그 안쪽에 있는 내용이 CSS라는 것을 알려준다.

```html
<!doctype html>
<html>
<head>
  <title>NIKE history - html</title>
  <meta charset="utf-8">
  <style>
    a {
      color: red;
    }
  </style>
</head>
```

​	`<head>`단에 `<style>`태그를 넣고 그 안에 CSS 내용을 추가하면 된다. 'a {}'라는 것은 문서 전체의 `<a>`태그를 의미하며 'color'는 글자 font 색을 의미한다. 즉, 문서 전체 `<a>`태그의 글자 폰트 색을 빨간색으로 바꾸라는 의미다.

​	이처럼 CSS의 가장 큰 장점은 '중복의 제거'이다. 이는 웹페이지의 사이즈를 줄여줄 뿐만 아니라 사용자 규모에 따라 굉장히 중요한 문제가 될 수 있다. 그리고 CSS는 '유지, 보수'를 훨씬 더 편리하게 할 수 있고, '가독성'도 높여준다. 디자인을 위한 공간과 정보를 담는 공간이 나누어져 있기 때문에 작업을 각자의 의도에 맞게 할 수 있을 것이다. 이것이 CSS가 등장한 가장 중요한 이유이다.

​	정리하자면 HTML이 정보에 전념하게 하기 위해서 CSS는 HTML로부터 디자인에 대한 기능을 뺏어왔다. 두 번째는 CSS를 통해 웹페이지를 디자인하는 것이 훨씬 더 효율적이다. 이러한 이유로 CSS라는 언어가 도입된 것이다.