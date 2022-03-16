# 기본문법 태그



### TAG

- 앞에 있는 것이 '열리는 태그', 뒤에 있는 것이 '닫히는 태그'
- 구분을 위해 '/'를 사용
- 문법을 설명한다.
- 쇼핑을 할 때 옷을 사면 옷에 있는 Tag와 같은 개념

```html
<strong> </strong> # Bold. 강조 표시. 두껍게
<u> </u> # Under line. 밑줄

<h1>Heading level 1</h1> # Heading. 제목. 숫자가 작아질수록 글자 크기도 작아짐. 6까지만 있음
<h2>Heading level 2</h2>
<h3>Heading level 3</h3>
<h4>Heading level 4</h4>
<h5>Heading level 5</h5>
<h6>Heading level 6</h6>
```



---



### 태그 활용 연습

```html
<h1>나이키의 역사</h1>
나이키의 초창기 이름은 <strong>'Blue Ribbon Sports'</strong>입니다. <u>BRS</u>는 1964년 '빌 바우먼'과 '필 나이트'에 의해 창립되었는데, 이 두 사람은 스승과 제자 사이였어요. 오리건 대학교 <u>육상 코치</u>였던 <strong>빌 바우먼</strong>이 자신의 제자인 <strong>필 나이트</strong>에게 먼저 사업을 제안했다고 합니다.
```



---



### 통계에 기반한 학습

- 사람들이 많이 사용하는 태그를 정리한 [사이트](https://www.advancedwebranking.com/seo/html-study/)를 통해 기본적으로 학습할 태그를 확인한다.

```html
<br> # new line tag. 줄바꿈. 여러 번 쓸수록 여백이 늘어남. 시각적 의미만 가지고 있어, 무언가를 감쌀 필요가 없다. 닫지 않는다.
<p> # paragraph tag. 단락. 단락을 구분 지을 때는 <br>보다는 이 태그가 나음. 의미론적으로 표현해 줄 수 있기 때문에. 정보로서 더 가치를 가짐. 여백이 정해져 있음.
```



---



### CSS

```html
<p style="margin-top:45px;">
```

​	태그 사이의 여백을 설정할 수 있다. css라는 것인데 여기서는 간략하게만 다룬다. 여백 위쪽을 떨어트릴 것이기에 top으로 설정하고 px는 픽셀인데 이 값을 조정하여 여백을 조정할 수 있다. 시각적으로 부족한 부분은 css를 활용하여 채우면 된다.