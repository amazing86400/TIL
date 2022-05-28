# 제이쿼리(jQuery)



### 정의

​	jQuery는 Javascript 언어를 간편하게 사용할 수 있도록 단순화시킨 **오픈 소스 기반의 자바스크립트 라이브러리**이다.

​	제이쿼리를 이용하면 **'문서 객체 모델(DOM)'**과 **'이벤트'**에 관한 처리를 손쉽게 구현할 수 있다. 또한, **'Ajax 응용 프로그램'** 및 **'플러그인'**도 제이쿼리를 활용해 빠르게 개발할 수도 있다.

​	제이쿼리를 사용하면 짧고 단순한 코드로도 웹 페이지에 다양한 효과나 연출을 적용할 수 있다. 그래서 제이쿼리는 오늘날 가장 인기 있는 자바스크립트 라이브러리 중 하나이다.



---



 ### 사전지식

​	제이쿼리는 자바스크립트 라이브러리라서, 자바스크립트 언어네 대한 기초 지식이 필요하다. 그리고 HTML, CSS 등도 많은 연관이 있다.



---



### 장점

1. 제이쿼리는 주요 웹 브라우저의 구버전을 포함한 대부분의 브라우저에서 지원된다.
2. HTML DOM을 손쉽게 조작할 수 있으며, CSS 스타일도 간단히 적용할 수 있다.
3. 애니메이션 효과나 대화형 처리를 간단하게 적용해 준다.

4. 같은 동작을 하는 프로그램을 더욱 짧은 코드로 구현할 수 있다.

5. 다양한 플러그인과 참고할 수 있는 문서가 많이 존재한다.

6. 오픈 라이선스를 적용하여 누구나 자유롭게 사용할 수 있다.



---



### 적용

​	제이쿼리 파일은 자바스크립트 파일(.js)로 존재한다. 그래서 웹 페이지에서 제이쿼리를 사용하기 위해서는 제이쿼리 파일을 먼저 웹 페이지에 로드(load)해야 한다.

​	[제이쿼리 공식 사이트](https://jquery.com/download/)에서 파일을 다운받아 로드할 수 있다. 다운받은 파일을 서버에 저장하고, `<script>` 태그를 `<head>` 태그 내에 삽입하면 된다.

```html
<!--- 문법 --->
<head>
    <script src="/파일경로/제이쿼리파일명.js"></script>
</head>

<!--- 예제 --->
<head>
    <script src="/git/jquery-1.12.4.min.js"></script>
</head>
```



​	CDN을 사용해서도 제이쿼리를 로드할 수 있다. CDN은 저번에 다루긴 했지만, 웹 사이트의 접속자가 서버에서 콘텐츠를 다운받아야 할 때, 자동으로 가까운 서버에서 다운받도록 하는 기술이다. 이 기술을 사용하면 특정 서버에 트래픽이 집중되지 않고, 콘텐츠 전송 시간이 매우 빨라지는 장점이 있다.

```html
<!--- 1. jQuery.com CDN --->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--- 2. 구글 CDN --->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--- 3. MS CDN --->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>

<!--- 4. CDNJS CDN --->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--- 5. jsDelivr CDN --->
<script src="https://cdn.jsdelivr.net/jquery/1.12.4/jquery.min.js"></script>

<!--- 예제 --->
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
```

