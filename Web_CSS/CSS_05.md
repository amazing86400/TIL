# CSS 박스 모델



### BOX Model

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NIKE NEWS</title>
    <style>
        h1{
            border-width: 5px;
            border-color: red;
            border-style: solid;
        }
        a{
            border-width: 5px;
            border-color: blue;
            border-style: solid;
        }
    </style>
</head>
<body>
    <h1>What to Know</h1>
    <p>Over the past 50 years, <a href="https://www.nike.com/kr/ko_kr/" target="_blank" title="JUST DO IT">Nike</a> has been a champion for athletes and sport and will remain true to that. Nike’s 50th anniversary isn’t about looking back — it’s about looking to the past for inspiration as the brand expands sport for a new generation.</p>
    <p>Timed with its 50th anniversary, Nike presents its latest global brand anthem, “Seen It All,” celebrating the strength of Nike’s past and the promise of its future.</p>
</body>
</html>
```

​	`<style>`태그에 `<h1>` 선택자를 넣어 한번 테두리를 그려보겠다. 어떻게 나오는지 확인해 보자. 우선 테두리에 관한 property는 `border`이다. 'width'는 테두리의 두께를 나타내고, 'color'는 테두리의 색이다. 그리고 'style'은 선의 스타일을 의미하는데, 'solid'는 그냥 일반적인 '단선'을 의미한다. 태그는 화면 전체를 쓴다는 것을 알 수 있다.

​	그리고 똑같이 `<a>` 선택자에 적용해 보자. 결과가 어떤가? `<a>`태그는 화면 전체를 사용하지 않고 자기 콘텐츠만큼의 부피를 쓴다는 것을 확인할 수 있다. 

​	여기서 `<h1>`태그와 같이 화면 전체를 쓰는 태그들을 **'block level element'**라고 부른다(element는 태그와 같은 말이다).  반대로 `<a>`태그와 같이 자기 자신의 부피만큼만 차지하는 것을 

**'inline element'**라고 부른다. 명칭은 중요하지 않지만 어떤 태그가 화면 전체를 사용하는지, 어떤 태그가 전체를 사용하지 않는지를 잘 알아야 한다. 



```html
<style>
    h1{
        border-width: 5px;
        border-color: red;
        border-style: solid;
        display: inline;
        /* display: none; */
    }
    a{
        border-width: 5px;
        border-color: blue;
        border-style: solid;
        display: block;
    }
</style>
```

​	'display'라는 property를 사용하면 block인 선택자도 inline처럼 사용할 수 있다. 그 반대도 가능하다. 즉, block과 inline은 그냥 **기본값**일 뿐 CSS를 통해 내가 언제든지 바꿀 수 있다.

​	그리고 display를 none으로 지정할 경우 `<h1>`태그가 사라진다. 화면에서 안 보이게 하는 기능인 것 같다.



```html
<style>
    h1, a{
        border: 5px solid red;
    }
</style>
```

​	만일 CSS의 코드가 중복될 경우 ','를 사용하여 선택자를 한 번에 사용하면 된다. 이렇게 하면 더 간결하고 효율적인 코드가 된다.

​	그리고 border property 역시 중복되는 것을 막고자 border만 입력하고 값들을 띄어쓰기로 구분해서 넣어도 된다. 이렇게 하면 코드는 더 간결하고 결과는 동일하게 나온다. value의 순서는 상관없다. 



```html
<head>
<style>
    h1{
        border: 5px solid red;
        padding: 20px;
        margin: 20px;
        width: 250px;
    }
    a{
        border: 5px solid blue;
    }
</style>
</head>
<body>
    <h1>What to Know</h1>
    <h1>What to Know</h1>
</body>
```

​	`padding` property는 박스 안 공간(여백)을 의미한다. 그래서 설정을 해주게 되면 `<h1>`태그에 여백이 생긴다.

​	`margin` property는 박스와 박스 간 간격을 조절한다. `<h1>`태그가 2개 있는데 margin이 0일 경우 두 박스는 붙게 될 것이고, 값이 클수록 멀리 떨어질 것이다. 그리고 앞서 `<h1>`는 기본값이 block인데, 이 역시 `width`를 통해 너비를 조절할 수 있다. google에 'css box model'을 검색하면 이해하기 쉽게 설명 나온다.

​	개발자창을 열어 'Elements > Styles'에 보면 태그에 적용된 CSS property를 확인할 수 있다. 이 기능을 사용한다면 나중에 복잡한 CSS도 잘 이해할 수 있을 것이다. 그리고 그 밑에 네모난 박스가 있는데, 이것을 통해 박스의 속성을 확인할 수 있다. 다른 사이트의 속성을 개발자창을 통해 확인해 보며 공부해 보자.

