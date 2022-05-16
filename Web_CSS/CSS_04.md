# 선택자의 기본



###

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

​	`<a>`태그 모두 폰트 색은 검정으로 지정하고 목록 중 위 2개만 파란색으로 지정할 것이다. 이때 방법은 두가지이다. 앞서 배운 것처럼 CSS의 속성을 이용하거나 혹은 선택자를 통해 바꿀 수 있다. 전자로 할 경우 **'style="color: blue;"'**로 지정해줘야 한다. 하지만 이는 효율적이지 않다.

​	더 효율적인 방법은 class를 사용하는 것이다. 'saw'라는 HTML class를 생성한 뒤 `<style>`태그에 '.saw' 선택자를 입력해 property를 입력하면 된다. 여기서 '.'은 class라는 것을 나타내는 약속과 같다. class라는 것은 '그룹핑 하다', '하나로 묶는다'라는 의미가 담겨있다. 



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

​	class는 여러 값을 가질 수 있으며 띄어쓰기로 구분한다. 그리고 하나의 태그에는 여러개의 속성이 들어올 수 있고, 여러 개의 선택자를 통해서 하나의 태그를 공동으로 제어할 수 있다. 하지만 이것도 그닥 좋은 방법은 아니다. 보다 가까이에 있는 명령이(더 나중에 나오는 명령) 더 큰 영향력을 갖기 때문에 뒤에 나온 property를 갖고가게 된다.



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

​	앞선 문제를 해결하기 위해 'id'라는 것이 있다. 'active'를 id로 지정하고 `style`태그에서 선택자 앞에 '#'을 붙이면 순서와 상관없이 효과를 볼 수 있다. 즉, id 선택자와 class 선택자가 붙으면 id 선택자가 이긴다.