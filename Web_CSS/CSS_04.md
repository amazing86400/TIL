# 선택자의 기본



### `class`

```html
<head>
  <title>NIKE Trail - html</title>
  <meta charset="utf-8">
  <style>
    a{
      color: black;
      text-decoration: none;
    }
    .saw{
      color: blue;
    }
    h1{
      text-align: center;
      font-size: 55px;
    }

  </style>
</head>
<body>
  <h1><a href="index.html" target="_blank" title="I'm index">NIKE</a></h1>

  <ol>
    <li><a href="1.html" title="hello" target="_blank" class="saw">나이키의 역사</a></li>
    <li><a href="2.html" title="Hi" target="_blank" class="saw">Trail</a></li>
    <li><a href="3.html" title="good" target="_blank">NIKE Air Force 1</a></li>
  </ol>
```

​	`<a>`태그 모두 폰트 색은 검정으로 지정하고 목록 중 위 2개만 파란색으로 지정할 것이다. 이때 방법은 두 가지이다. 앞서 배운 것처럼 CSS의 속성을 이용하거나 혹은 선택자를 통해 바꿀 수 있다. 전자로 할 경우 **'style="color: blue;"'**로 지정해 줘야 한다. 하지만 이는 효율적이지 않다.

​	더 효율적인 방법은 **'class'**를 사용하는 것이다. 'saw'라는 HTML class를 생성한 뒤 `<style>`태그에 **'.saw'** 선택자를 입력해 property를 입력하면 된다. 여기서 **'.'은 class라는 것을 나타내는 약속**과 같다. class라는 것은 '그룹핑 하다', '하나로 묶는다'라는 의미가 담겨있다. 



```html
    }
    .saw{
      color: blue;
    }
    .active{
      color: red
    }
    h1{
      text-align: center;
      font-size: 55px;
    }

  </style>
</head>
<body>
  <h1><a href="index.html" target="_blank" title="I'm index">NIKE</a></h1>

  <ol>
    <li><a href="1.html" title="hello" target="_blank" class="saw">나이키의 역사</a></li>
    <li><a href="2.html" title="Hi" target="_blank" class="saw active">Trail</a></li>
    <li><a href="3.html" title="good" target="_blank">NIKE Air Force 1</a></li>
  </ol>
```

​	class는 여러 값을 가질 수 있으며 **띄어쓰기로 구분**한다. 그리고 **하나의 태그에는 여러 개의 속성이 들어올 수 있고**, **여러 개의 선택자를 통해서 하나의 태그를 공동으로 제어**할 수 있다. 하지만 이것도 그다지 좋은 방법은 아니다. 보다 가까이에 있는 명령이(더 나중에 나오는 명령) 더 큰 영향력을 갖기 때문에 뒤에 나온 property를 갖고 가게 된다. 만약 `.active`가 `.saw`보다 위에 있다면 'Trail'의 폰트색은 빨간색이 아니라 파란색으로 나올 것이다. 



---



### `id`

```html
<style>
    a{
      color: black;
      text-decoration: none;
    }
    #active{
      color: red
    }
    .saw{
      color: blue;
    }  
    h1{
      text-align: center;
      font-size: 55px;
    }

  </style>
</head>
<body>
  <h1><a href="index.html" target="_blank" title="I'm index">NIKE</a></h1>

  <ol>
    <li><a href="1.html" title="hello" target="_blank" class="saw">나이키의 역사</a></li>
    <li><a href="2.html" title="Hi" target="_blank" class="saw" id="active">Trail</a></li>
    <li><a href="3.html" title="good" target="_blank">NIKE Air Force 1</a></li>
  </ol>
```

​	앞선 문제를 해결하기 위해 **'id'**라는 것이 있다. 'active'를 id로 지정하고 `style`태그에서 선택자 앞에 **'#'**을 붙이면 순서와 상관없이 효과를 볼 수 있다. 즉, id 선택자와 class 선택자가 붙으면 id 선택자가 이긴다(id가 더 우선순위). 그리고 class 선택자와 태그 선택자가 붙으면 class 선택자가 이긴다. 정리하자면 **'id >> class >> tag'** 순이다. 만약 선택자가 모두 같다면? <u>가장 마지막에 있는 선택자가 우선순위가 된다.</u>

​	id 선택자는 값이 중복되면 안 된다. 한번 'active'를 사용했다면 다음 id 선택자의 값은 'active'가 되어서는 안 된다. 그래서 id 선택자는 좀 더 구체적이고, a 태그 선택자는 좀 더 포괄적이다.

​	이 정도 배웠으면 이제 검색을 해보자. google에 'css selector'만 입력해도 css의 선택자를 확인할 수 있을 것이다. 선택자를 잘 활용해서 좀 더 효율적이고, 정교한 작업을 해보자.