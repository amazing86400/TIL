# Genie chart_web crawling & Data 통합



### 라이브러리

```python
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np
```

 크롬 브라우저를 활용해서 정보를 찾을 수 있도록 라이브러리를 불러온다. 상세한 내용은 이전 내용에서 다뤘기 때문에 melon 파일을 참고하자.



---



### 크롬 브라우저로 HTML 가져오기

```python
ser = Service('../chromedriver/chromedriver.exe')
driver = webdriver.Chrome(service = ser)
url = 'https://www.genie.co.kr/chart/top200'
driver.get(url)
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
soup
```

 이 코드 역시 melon 파일과 동일하다. url 주소만 genie 사이트 주소로 변경하자.



---



### 정보 찾기

```python
>>> chart = soup.select('tbody > tr')
>>> len(chart)
50
```

 찾는 방법 또한 동일하게 찾으면 된다. 그런데 genie는 50위씩 페이지가 나누어져 있었다. 그래서 50위까지만 추출하기로 했다. 이후에 페이지 넘기는 방법 또한 공부하겠다.



```python
>>> chart[0].select('td.info > a.title.ellipsis')[0].text
'\n                                        \n                                          \n                                        \n                                        \n                                        \n                                        \n                                            \n                                                취중고백'

>>> chart[0].select('td.info > a.title')[0].text.strip()
'취중고백'

>>> chart[0].select('td.info > a.artist.ellipsis')[0].text
'김민석 (멜로망스)'
```

 경로를 찾아 text를 추출했더니 첫 번째 코드처럼 결과가 나왔다. 저 결과는 공백(빈칸)을 의미하는데, 그대로 Data를 저장하면 지저분하기 때문에 없애주도록 하겠다. 이럴 때는 strip() 함수를 사용하면 된다. 양쪽의 공백을 모두 없애주는 함수이다. 이것만 주의하면 곡이랑 가수 찾는 거는 힘들지 않을 것이다.



---



### Genie chart Top 100 저장하기

```python
song_data = []
rank = 1
chart = soup.select('tbody > tr')

for song in chart:
    title = song.select('td.info > a.title')[0].text.strip()
    singer = song.select('td.info > a.artist')[0].text
    song_data.append(['ginie', rank, title, singer])
    rank += 1
    
pd_genie = pd.DataFrame(song_data, columns = ['서비스','순위','곡','가수'])
pd_genie.to_excel('./files/genie_class.xlsx', index = False)
```

 저장하는 방법도 동일하다. 다만 strip() 함수가 추가됐다는 것만 숙지하자.



---



### Data 통합하기

```python
excel_names = ['./files/melon_class.xlsx', './files/bugs_class.xlsx', './files/genie_class.xlsx']

total_data = pd.DataFrame()
for name in excel_names:
    pd_data = pd.read_excel(name)
    total_data = total_data.append(pd_data)


total_data.to_excel('./files/total_data_class.xlsx', index = False)
```

 이제 엑셀 파일로 만든 각 음원사이트의 정보를 합칠 거다. 우선 변수를 만들어 리스트에 파일들을 담는다. bugs 파일도 미리 만들어놨다. 그리고 데이터들을 모두 저장할 DataFrame()을 만들어서 변수에 담았다. 다음으로 for문을 돌려 각 파일들을 읽고, total_data 변수에 appen() 함수를 사용해 추가해 준다. 가독성을 위해 pd_data라는 변수를 만들었고, 바로 append() 함수에 코드를 넣어줘도 된다. 그리고 저장한다.