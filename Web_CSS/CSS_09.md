# Media Query



​	PC, 스마트폰, 태블릿 등 웹은 수많은 시스템에서 동작하는 정보 시스템이다. 즉 수많은 형태의 화면에서 동작해야 된다는 말이다. 이것은 꽤 긴 시간 동안 상당히 어려운 걸림돌이었다. 하지만 사람들은 방법을 찾았다. 그것이 오늘날 '반응형 디자인'이라는 것이다.

​	반응형 웹이란 화면의 크기에 따라 웹 페이지의 각 요소들이 반응해서 동작하는 것을 말한다. 이것에 핵심적인 역할을 하는 'Media Query'라는 것을 오늘 공부했다. 

​	미디어쿼리는 좀 어려운 개념인데, 가장 먼저 화면의 크기를 확인해야 한다. 크기에 맞게 조절을 해야 하기 때문이다. 개발자창을 들어간다. 개발자창을 마우스로 조금씩 움직여보면 우측 상단에 픽셀이 나오는데, 이것을 활용해 몇 픽셀보다 작으면 디자인을 축소하고 반대로 크면 확대하는 식으로 실습해 보겠다.



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mediaquery</title>
    <style>
        div{
            border: 10px solid pink;
            font-size: 60px;
        }
        @media(max-width: 900px){
            div{
                display: none;
            }
        }
    </style>
</head>
<body>
    <div>
        Responsive
    </div>
</body>
</html>
```

​	미디어쿼리는 '@media'를 사용하여 괄호 안에 조건을 주어 사용한다. 즉 어떠한 조건을 만족할 때만 CSS를 동작하게끔 하는 것이다. 위 예제에서는 화면 픽셀이 900을 넘으면 'Responsive'라는 글자가 보이고, 900 보다 작으면 안 보이게끔 display를 'none'으로 지정했다. 'min-width'를 사용하면 그 반대의 의미이다.



```html
<!doctype html>
<html>
<head>
  <title>NIKE Trail - html</title>
  <meta charset="utf-8">
  <style>
    body{
      margin: 0px;
    }
    #grid{
      display: grid;
      grid-template-columns: 230px 1fr;
    }
    a{
      color: black;
      text-decoration: none;
    }
    h1{
      text-align: center;
      font-size: 55px;
      border-bottom: 1px solid gray;
      margin: 0px;
      padding: 20px;
    }
    #grid ol{
      border-right: 1px solid gray;
      width: 150px;
      margin: 0px;
      padding-left: 40px;
      padding-top: 20px;
    }
    @media(max-width:700px){
      h1{
        text-align: left;
        font-size: 35px;
        padding: 10px;
      }
      #grid{
        display: block;
      }
      #grid ol{
      border-right: none;
      }
    }

  </style>
</head>
<body>
  <h1><a href="index.html" target="_blank" title="I'm index">NIKE</a></h1>
  <div id="grid">
    <ol>
      <li><a href="1.html" title="hello" target="_blank">나이키의 역사</a></li>
      <li><a href="2.html" title="Hi" target="_blank">Trail</a></li>
      <li><a href="3.html" title="good" target="_blank">NIKE Air Force 1</a></li>
    </ol>
    <div>
      <h2>Trail</h2>

      <h3>Trail이 뭔가요?</h3>
      <p>Trail은 <strong>'trail runner'</strong>에 영감을 받아 탄생했습니다. trail runner란 "산, 들, 초원 등 포장되지 않은 길을 달리는 사람"을 말하는데요,
        <u>즉 trail은 체육관, 공원, 운동장 등 잘 포장이 된 길이 아닌 자연과 같은 야외 환경에서 달리기를 즐기는 trail runner를 위한 카테고리입니다.</u>
        그러다 보니 일반 러닝 카테고리 제품과는 차이가 좀 있습니다.</p>
      <img src="trail_mark2.png" width="50%">
      <p style="margin-top:40px;"> Trail의 마크 또한 일반 스우시가 아닌 trail만의 차별화된 모습을 볼 수 있습니다. 개인적인 생각으로 삼각형은
        아마 산을 의미하는 것 같습니다. 그리고 구부러진 길은 off-road를 나타냈으며, 세 번 구부러트려 더 역동적인 느낌을 주는 것 같습니다.</p>

      <h3>Trail은 옷이 아닌 장비다.</h3>
      <p> Trail은 자연에서 달리다 보니 아무래도 일반 러닝에 비해 위험요소가 있습니다. 울퉁불퉁한 지형뿐만 아니라 바위나 나뭇가지 등 러닝을 하기에는
        다칠 수 있는 요소들이 있습니다. 그래서 러너의 더 나은 러닝을 위해 환경에 맞춰 고안된 제품입니다.</p>
      <p> Trail의 특성상 대부분 장거리를 달리게 됩니다. 그래서 신발의 경우 경량성과 내구성, 그리고 착화감에 신경을 많이 썼습니다. 오래 달리다 보면
        발에 무리가 가는데요, 특히 오르막길 등 지형도 온전치 않아 발이 더 힘들 겁니다. 그래서 trail 러닝화는 보다 더 가볍게 하고 잘 벗겨지지 않으면서
        편안한 착화감을 선사해줍니다. 오래 신을 수 있도록 내구성 또한 튼튼하게 만들어졌습니다. 그리고 날씨나 환경에 따라 길이 미끄러울 수도 있는데요,
        이를 방지하기 위해선 무엇보다 접지력이 중요합니다. 그래서 trail의 러닝화 밑창은 뛰어난 접지력을 위해 설계되었습니다.</p>
    </div>
  </div>
</body>
</html>
```

​	미디어쿼리 실습 예제이다. 700픽셀보다 작으면 `<h1>`태그의 폰트 사이즈는 줄이고, align을 왼쪽으로 배치한다. 그리고 grid 구조를 없애고 `<ol>`태그의 display를 'block' 해주어 본문을 목록 아래로 위치시켰다. 미디어쿼리를 활용하면 더 많은 기능을 추가할 수 있으니 더 공부해 볼 필요가 있다.