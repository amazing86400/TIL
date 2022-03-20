# 문서의 구조와 Super Star



### `<title>`

```html
<title>NIKE - html</title>
```

​	`title` 태그를 사용하면 인터넷 창을 띄웠을 때, 제일 상단에 보이는 창의 이름을 지정할 수 있다. 즉, 사용자에게 명시적으로 알려줄 수 있을 뿐만 아니라 검색 엔진과 같은 기계들은 바로 이 태그를 책으로 치면 책 표지와 같은 정보로 사용한다. 그래서 웹페이지를 만든다면 반드시 사용하자. 사용하지 않으면 굉장한 손해가 된다. 



---



### `<meta>`

```html
<meta charset="utf-8">
```

​	위 태그는 글자 깨짐을 방지하는 태그다. 우리가 지금 사용하는 웹 페이지는 0과 1로 이루어진 utf-8 파일로 저장되어 있다. 그래서 한글의 경우 깨질 수 있는데, 이를 방지하기 위해 이 태그를 사용한다. 위 태그를 해석하자면 '문서를 utf-8로 읽어라'라는 의미다.



---



### `<head>`, `<body>`

```html
<head>
  <title>NIKE - html</title>
  <meta charset="utf-8">
</head>
<body>
  <ul>
    <li>1. HTML</li>
    <li>2. CSS</li>
    <li>3. PYTHON</li>
  </ul>

  <ol>
    <li>제니</li>
    <li>지수</li>
    <li>유진</li>
  </ol>

  <h1>나이키의 역사</h1>
  <p><a href="https://www.nike.com/kr/ko_kr/" target="_blank" title="nike home">나이키의</a> 초창기 이름은 <strong>'Blue Ribbon Sports'</strong>입니다. <u>BRS</u>는 1964년 '빌 바우먼'과 '필 나이트'에 의해 창립되었는데, 이 두 사람은 스승과 제자 사이였어요. 오리건 대학교 <u>육상 코치</u>였던 <strong>빌 바우먼</strong>이 자신의 제자인 <strong>필 나이트</strong>에게 먼저 사업을 제안했다고 합니다.</p>
  <img src="nike.jpg" width="50%">
  <p style="margin-top:40px;">BRS는 자기들만의 제품 출시가 아닌, 일본 신발 브랜드 현재의 아식스인 'Onitsuka Tiger'의 상품을 미국 시장에 유통하며 사업을 시작했어요. 그 이유는 당시 일본의 신발이 매우 우수했거든요. 하지만 신발을 계속해서 주문하고, 생산하고, 재투자하면서 BRS는 자금난에 시달리게 됩니다. 결국 BRS는 Onitsuka Tiger의 신발을 더 이상 판매하지 않기로 합니다. 대신 자기들만의 제품을 개발하기로 다짐했고, 시간이 흘러 1971년 5월 30일에 지금 우리가 알고 있는 'NIKE'가 세상에 나오게 됩니다.</p>
</body>
```

​	본문은 `body` 태크로 묶기로 약속했다. 그래서 본문 부분은 모두 `body`태그로 묶어야 한다. 그리고 본문을 설명하는 태그는 `head`태그로 묶기로 약속했다. 그렇기 때문에 우리는 이을 지켜야만 한다. 즉 HTML에 있는 모든 태그는 `head`태그 또는 `body`태그 이 둘 중에 하나 아래에 놓이게 된다. 



---



### `<html>`

```html
<!doctype html>
<html>
<head>
  <title>NIKE - html</title>
  <meta charset="utf-8">
</head>
<body>
  <ul>
    <li>1. HTML</li>
    <li>2. CSS</li>
    <li>3. PYTHON</li>
  </ul>

  <ol>
    <li>제니</li>
    <li>지수</li>
    <li>유진</li>
  </ol>

  <h1>나이키의 역사</h1>
  <p><a href="https://www.nike.com/kr/ko_kr/" target="_blank" title="nike home">나이키의</a> 초창기 이름은 <strong>'Blue Ribbon Sports'</strong>입니다. <u>BRS</u>는 1964년 '빌 바우먼'과 '필 나이트'에 의해 창립되었는데, 이 두 사람은 스승과 제자 사이였어요. 오리건 대학교 <u>육상 코치</u>였던 <strong>빌 바우먼</strong>이 자신의 제자인 <strong>필 나이트</strong>에게 먼저 사업을 제안했다고 합니다.</p>
  <img src="nike.jpg" width="50%">
  <p style="margin-top:40px;">BRS는 자기들만의 제품 출시가 아닌, 일본 신발 브랜드 현재의 아식스인 'Onitsuka Tiger'의 상품을 미국 시장에 유통하며 사업을 시작했어요. 그 이유는 당시 일본의 신발이 매우 우수했거든요. 하지만 신발을 계속해서 주문하고, 생산하고, 재투자하면서 BRS는 자금난에 시달리게 됩니다. 결국 BRS는 Onitsuka Tiger의 신발을 더 이상 판매하지 않기로 합니다. 대신 자기들만의 제품을 개발하기로 다짐했고, 시간이 흘러 1971년 5월 30일에 지금 우리가 알고 있는 'NIKE'가 세상에 나오게 됩니다.</p>
</body>
</html>
```

​	`html`태그는 `head`와 `body`를 묶는 최고위층 태그이다. 그리고 그 위에 관용적으로 <!doctype html> 이라고 입력해 주는데, 이는 '이 문서는 HTML이다.'라는 의미를 나타낸다.

​	아무 페이지나 가서 페이지 소스를 확인해 보자.(오른쪽 마우스 클릭) 확인하면 실제로 <!doctype html>와 그 밑에 `html`태그가 있는 것을 확인할 수 있다. 그리고 높은 확률로 그 밑에 `head`태그가 보일 것이고, `meta`나 `body`태그도 확인할 수 있을 것이다.
