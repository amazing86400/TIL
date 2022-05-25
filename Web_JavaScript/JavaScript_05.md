# 웹브라우저 제어



```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>java</title>
  </head>
  <body>
    <h1>JavaScript</h1>
    <h2>Step1</h2>
    <input type="button" value="GoodNight" onclick="
    document.querySelector('body').style.background='black';
    document.querySelector('body').style.color='white';">
    <input type="button" value="GoodMorning" onclick="
    document.querySelector('body').style.background='white';
    document.querySelector('body').style.color='black';">
  </body>
</html>
```

​	정적인 HTML에 동적인 Javascript 코드를 사용해 보다 똑똑하고 **사용자와 대화하는 것과 같은 느낌**의 애플리케이션을 만드는 핵심적인 원리와  그 중요한 사례 중의 하나를 공부했다. 버튼 두 개를 만들어 하나는 화면을 검은색으로 하고 글자색은 흰색으로 설정했다. 또 다른 하나는 화면을 다시 밝게 만들고 글자색은 검은색으로 했다.

​	클릭했을 때 변화가 나타나도록 `onclick`을 사용했고, 화면 전체를 바꾸기 위해 `<body>`태그를 사용했다. 여기서 **'document'**는 **'문서'**를 의미하고 **'querty'**는 **'질의하다'**라는 뜻을 갖고 있다. 그리고 **'Selector'**는 CSS의 **'선택자(Selector)'**를 의미한다.