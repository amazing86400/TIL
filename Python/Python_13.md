# Youtube_web crawling



### 학습 목표

- web crawling을 통해 Youtube rank 100 data를 엑셀로 저장할 수 있다.



---



### 라이브러리

```python
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np
import time
```

​	web crawling을 위한 라이브러리를 불러온다. 'import time'은 실시간으로 작업할 때 주로 사용한다. 데이터가 들어올 때는 걸리는 시간이 있는데, 실시간으로 하다 보면 page가 넘어가서 error가 나올 경우가 있다. 그것을 방지하기 위해 time의 sleep() 함수를 사용한다. 즉, 데이터가 들어올 때까지 다음으로 넘어가지 않도록 sleep 기능을 하기 위함이다. 오늘은 사용하지 않는다!



---



### 크롬 브라우저로 youtube rank HTML 가져오기

```python
ser = Service('../chromedriver/chromedriver.exe')
driver = webdriver.Chrome(service = ser)
url = 'https://www.youtube-rank.com/board/bbs/board.php?bo_table=youtube'
driver.get(url)
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
soup
```

​	크롬 브라우저를 활용했고, 코드는 이전 melon, genie 파일과 같다. url만 바꿔주도록 하자.



---



### 정보 찾기

```python
>>> chart = soup.select('form > table > tbody > tr')
>>> len(chart)
100

# [음악/댄스/가수]
chart[0].select('p.category')[0].text.strip()

# 채널명
chart[0].select('h1 > a')[0].text.strip()

# 구독자 수
chart[0].select('td.subscriber_cnt')[0].text

# View 수
chart[0].select('td.view_cnt')[0].text

# 동영상 수
chart[0].select('td.video_cnt')[0].text
```

​	내가 원하는 정보는 [장르, 채널명, 구독자 수, 시청 수, 동영상 수]이다. 여기서 가장 중요한 작업은 제일 첫 번째 코드이다. 원하는 정보의 개수가 맞는지가 중요하다. 만약 100개를 원했는데, 101개가 나온다면 다른 정보가 하나 더 있다는 얘기다. 이럴 때는 슬라이싱으로 하는 방법도 있지만, 되도록이면 상위 태크를 추가하면서 data를 찾도록 하자.



---



### Youtube rank 저장하기

```python
data = []
rank = 1
for vd in chart:
    category = vd.select('p.category')[0].text.strip()
    singer = vd.select('h1 > a')[0].text.strip()
    subscriber = vd.select('td.subscriber_cnt')[0].text
    view = vd.select('td.view_cnt')[0].text
    video = vd.select('td.video_cnt')[0].text
    mylist = [category, rank, singer, subscriber, view, video]
    data.append(mylist)
    rank += 1

pd_youtube = pd.DataFrame(data, columns = ['장르','순위','채널명','구독자 수','View 수','동영상 수'])
pd_youtube.to_excel('./files/youtube_class.xlsx', index = False)
```

​	youtube의 rank를 저장하는 것 또한 이전에 했던 방식과 다를 것이 없다. 변수 vd를 for문을 통해 chart를 돌게 하고, 각각의 텍스트들을 추출한다. 그리고 mylist라는 변수에 모두 담아서 미리 만들어 둔 빈 리스트 data에 append() 해준다. 그리고 엑셀파일로 저장한다.

