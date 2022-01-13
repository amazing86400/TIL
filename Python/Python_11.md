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

 다운받은 크롬 드라이버 파일의 경로를 두 번째 코드에 넣어준다. 나는 가독성을 위해 ser 변수에 담았다. 여기서 중요한 것은 실제 사용하는 크롬 버전과 드라이버 파일의 버전이 동일해야 실행이 가능하다는 것이다. 여기까지 잘 됐다면 크롬 브라우저가 열린다. 기존 사용하던 것과는 다르게 즐겨찾기나 홈페이지가 설정돼 있지 않고 로그인도 돼 있지 않다.
 url 변수도 생성해서 멜론 차트 사이트 주소를 담았다. 그리고 get() 함수를 사용해 멜론 차트 사이트를 크롬 브라우저로 연다.



---



### HTML 가져오기

```python
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
```

 driver.page_source 코드를 통해 현재 펼쳐져 있는 웹 페이지의 HTML 정보를 가져올 수 있다. 그리고 정보를 쉽게 찾기 위해 BeautifulSoup을 사용했고 그것을 변수 안에 담았다. parser은 가져온 HTML을 좀 더 보기 좋게 도와준다.



---



### HTML 기초 지식

- 시작과 끝이 있다. <tag>로 시작하고 </tag>로 끝난다.

- 태그는 다른 태그에 속할 수 있다. (div 안에 p태그가 있고, body 안에 div가 있음)

- 태그 시작과 끝 사이에는 화면에 표시되는 정보가 들어간다.

- 태그 기호 내에 속성을 가질 수 있다. (class, id 이런 것들) (태그 구조가 모두 동일한데, 그걸 구분할 수 있는 것이 id이다)



---



### select 기초 지식

```python
soup.select('tr')
soup.select('tbody > tr')
soup.select('tbody  tr')
```

 정보를 찾을 때는 select를 활용해서 태그를 찾으면 된다. 그런데 정보가 너무 많아 어디를 봐야 할지 처음에는 힘들다. 그래서 F12 키나 Ctrl + Shift + i 키를 눌러서 웹 페이지 개발자창을 열어서 확인한다. 내가 원하는 부분을 오른쪽 마우스 클릭해서 '검사'를 클릭하면 위치를 알 수 있다. 태그의 상/하위에 따라서 '>' 악어 기호를 통해 표시하면 된다. 즉 tbody 안에 tr가 있다는 뜻이다. 가장 마지막 코드는 중간에 있는 태그를 뛰어넘는 의미다.



```python
soup.select('#name')
soup.select('.name')
soup.select('#fruits > span.name')
```

 id와 class를 활용할 수도 있다. id를 활용해서 찾을 땐 앞에 '#'을 붙여주고, class를 활용해서 찾을 땐 앞에 '.'을 붙여준다. 태그를 추가하면 할수록 찾는 정보는 더 정확해질 것이다.



```python
songs = soup.select('tr')
songs[0]
songs[32]
type(songs[0])
songs[0].text
```

 코드를 변수에 담아 색인을 해주면 원하는 위치의 정보를 확인할 수 있다. 파이썬은 0부터 시작이기 때문에 1위를 보고 싶다면 0을 입력하면 된다. 그리고 마지막 코드를 입력하면 HTML의 텍스트를 볼 수 있다. text가 오류가 나올 때가 있는데, 이때는 데이터의 type을 알아보자. type이 tag로 되어 있는 것만 text를 사용할 수 있다.



```python
>>> soup.select('a')
[<a href="http://bit.ly"> 홈페이지 </a>]

>>> tag = soup.select('a')
>>> tag[0]
<a href="http://bit.ly"> 홈페이지 </a>

>>> tag[0].text
홈페이지

>>> tag['href']
http://bit.ly
```

 만약 type이 tag가 아니라면? 이럴 경우에는 보통 리스트에 담아져 있다. 그래서 인댁싱을 해서 리스트를 벗겨내면 text를 사용할 수 있을 것이다. 그리고 상황에 따라 태그에 있는 주소를 얻고 싶을 때가 있는데, 이럴 때는 ['href']를 입력해 주면 된다.



---



### melon chart TOP 100 저장하기

```python
song_data = []
rank = 1 # 이미 순서대로 되어 있어서 랭크는 그냥 1로 설정
chart = soup.select('tbody > tr')

for song in chart:
    title = song.select('div.ellipsis.rank01 > span > a')[0].text
    singer = song.select('div.ellipsis.rank02 > a')[0].text
    mylist = ['melon', rank, title, singer]
    song_data.append(mylist)
    rank += 1
```

 우선 데이터를 담을 빈 리스트를 만들어 주고, rank는 어처피 순서대로 되어 있기 때문에 1로 설정을 해 하나씩 추가만 해줄 것이다. 그리고 for문을 돌려 1위부터 100위까지의 곡 제목과 가수 이름을 가져올 것이다. 앞서 배웠듯이 곡명과 가수의 위치가 어디에 있는지 select를 통해 경로를 알아내는 것이 중요하다. 위치를 찾았다면 텍스트만 추출한다. 그리고 추출한 값들을 mylist라는 변수에 담았는데, 담지 않고 그냥 append() 함수를 써서 리스트에 넣어줘도 상관없다. 마지막으로 rank를 1씩 추가해 줬다.



```python
pd_melon = pd.DataFrame(song_data, columns = ['서비스','순위','곡','가수'])
pd_melon.to_excel('./files/melonchart.xlsx', index = False)
```

 리스트에 담아줬기 때문에 엑셀로 저장이 불가능하다. 그래서 DataFrame으로 만들어 준 후 엑셀로 저장할 것이다. pandas 라이브러리를 활용해 주고, columns도 요소에 맞게 설정한다. 그리고 엑셀로 저장을 하는데, index는 겹치기 때문에 False로 제외한다.
