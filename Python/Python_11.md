# 멜론 TOP100 웹 크롤링



### 라이브러리

```python
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup

# 크롬드라이버 설치
# https://chromedriver.chromium.org/downloads
```

 우선 웹 크롤링을 하기 위해 라이브러리를 불러와야 한다. webdriver로 웹 브라우저를 조작하고, BeautifulSoup 라이브러리를 활용해 웹 페이지 상의 HTML 데이터에서 필요한 정보를 가져올 것이다. webdriver는 크롬이나 익스플로러 등에서 사이트 접속, 버튼 클릭, 글자 입력과 같이 웹 브라우저에서 사람이 할 수 있는 일들을 코드를 통해 제어할 수 있는 라이브러리다. 웹 브라우저 종류에 따라 제어하는 드라이버가 필요하다.*(크롬 드라이버 설치 시 버전 잘 확인해서 설치할 것!)* 그리고 BeautifulSoup의 select를 활용해 입력한 조건을 만족하는 태그를 모두 선택할 수 있다. 



---



### 크롬 드라이버 활용

```python
ser = Service('../chromedriver/chromedriver.exe')
driver = webdriver.Chrome(service = ser)
url = 'https://www.melon.com/chart/index.htm'
driver.get(url)
```

 가독성을 위해 다운받은 driver 파일을 ser 변수에 담았다. 변수 driver를 실행하면 크롬 브라우저가 열린다. 기존 사용하던 것과는 다르게 즐겨찾기나 홈페이지가 설정돼 있지 않고 로그인도 돼 있지 않다. 그리고 url 변수도 생성해서 멜론 차트 사이트 주소를 담았다. 그리고 get() 함수를 사용해 멜론 차트 사이트를 크롬 브라우저로 연다.



---



### HTML 가져오기

```python
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
```

 driver.page_source 코드를 통해 현재 펼쳐져 있는 웹 페이지의 HTML 정보를 가져올 수 있다. 그리고 정보를 쉽게 찾기 위해 BeautifulSoup을 사용했고 변수 안에 담았다.



---



### HTML 기초 지식

- 시작과 끝이 있다. (<html>:시작 </html>: 끝), (<head> </head>), (<div> </div>)

- 태그는 다른 태그에 속할 수 있다. (div 안에 p태그가 있고, body 안에 div가 있음)

- 태그 시작과 끝 사이에는 화면에 표시되는 정보가 들어간다.

- 태그 기호 내에 속성을 가질 수 있다. (class, id 이런 것들) (태그 구조가 모두 동일한데, 그걸 구분할 수 있는 것이 id이다)



---



### 정보 찾기

```python
soup.select('tr')
soup.select('tbody > tr')
soup.select('tbody  tr')
```

 정보를 찾을 때는 select를 활용해서 태그를 찾으면 된다. 그런데 정보가 너무 많아 어디를 봐야 할지 처음에는 힘들다. 그래서 F12 키나 Ctrl + Shift + i 키를 눌러서 웹 페이지 개발자창을 열어서 확인한다. 내가 원하는 부분을 오른쪽 마우스 클릭해서 '검사'를 클릭하면 위치를 알 수 있다. 그리고 크롤링하는 방법은 매우 다양해서 사람마다 코드가 다양하게 나오는데, 자신이 편한 코드로 진행하면 된다. 위 세 코드는 모두 동일한 결과가 나온다.



---



### 원하는 순위 추출

```python
songs = soup.select('tr')
songs[0]
songs[32]
songs[0].text
```

 코드를 변수에 담아 색인을 해주면 원하는 위치의 정보를 확인할 수 있다. 파이썬은 0부터 시작이기 때문에 1위를 보고 싶다면 0을 입력하면 된다. 그리고 마지막 코드를 입력하면 HTML의 텍스트를 볼 수 있다.