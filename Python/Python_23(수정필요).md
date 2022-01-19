# 왜 우리 동네에는 스타벅스가 없을까?



## starbucks web crawling



### 학습 목표

- 스타벅스 사이트의 웹크롤링을 통해 서울에 위치한 스타벅스 전 매장의 정보를 얻을 수 있다.
- 



---



### 라이브러리

```python
import pandas as pd
import numpy as np
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
import time
```

​	웹크롤링을 위해 selenium와 bs4 라이브러리를 부른다. 그리고 HTML 정보를 추출하기 위해 BeautifulSoup 라이브러리도 추가했다. find_element() 함수를 사용하기 위해 By 라이브러리도 가져오고 error 방지를 위해 time도 불러온다.



---



### 데이터 수집_web crawling

```python
ser = Service('../chromedriver/chromedriver.exe')
driver = webdriver.Chrome(service = ser)
url = 'https://www.starbucks.co.kr/'
driver.get(url)
```

​	오늘은 다른 방식으로 web crawilng을 할 것이다. 이전에 인스타그램 crawling을 했을 때 사용했던 find_element() 함수 방식을 사용하는 방법이다. 먼저 크롬 드라이버를 열고, url을 스타벅스 홈페이지로 설정한다. 직접 [store] > [매장찾기] > [지역검색]에 들어가서 개발자창을 열고 '서울' 태그를 찾는다. 그리고 그 태그를 오른쪽 마우스로 클릭하고 [copy] > [copy selector]를 눌러 복사한다.



```python
seoul_btn = '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a'
driver.find_element(By.CSS_SELECTOR, seoul_btn).click()
time.sleep(3)
```

​	복사한 태그의 구조 정보(CSS selector)를 seoul_btn에 붙여 넣고, find_element() 함수를 사용해 click() 명령을 추가하면 해당 버튼을 클릭한다. 즉, 매장 지역검색에서 서울이 선택된다. 그리고 error를 방지하기 위해 time.sleep(3)을 해주었다.



```python
all_btn = '#mCSB_2_container > ul > li:nth-child(1) > a'
driver.find_element(By.CSS_SELECTOR, all_btn).click()
time.sleep(3)
```

​	같은 방식으로 '전체'의 CSS selector를 가져와 all_btn에 넣고 실행한다.



```python
html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')

# 서울 전매장
starbucks_list = soup.select('ul.quickSearchResultBoxSidoGugun > li.quickResultLstCon')
starbucks_store = starbucks_list[0]

# 매장명
name = starbucks_store.select('li.quickResultLstCon > strong')[0].text.strip()

# 위도
lat = starbucks_store['data-lat']

# 경도
lng = starbucks_store['data-long']

# 매장 타입
store_type = starbucks_store.select('i')[0]['class'][0][4:]

# 주소
## 방법 1
add = str(starbucks_store.select('p.result_details')[0]).split('<br/>')[0].split('>')[1]
## 방법 2
add = starbucks_store.select('p.result_details')[0].text[:-9]

# 전화번호
## 방법 1
tel = str(starbucks_store.select('p.result_details')[0]).split('<br/>')[1].split('<')[0]
## 방법 2
tel = starbucks_store.select('p.result_details')[0].text[-9:]
```

​	이제 서울에 위치해 있는 총 568개 전 매장의 매장명, 위도, 경도, 매장 타입, 주소, 그리고 전화번호의 data를 가져올 것이다. 가장 먼저 BeautifulSoup()을 통해 HTML 정보를 가져온다. 그리고 select() 함수로 필요한 정보만 추출하자. 태그 위치는 개발자창을 통해 찾는다.

​	일단 스타벅스 전 매장의 리스트부터 찾아야 한다. 그래야 나중에 for문을 돌릴 때 전 매장의 data를 가져올 수 있기 때문이다. 태그 중 'li' 태그를 확인해 보면 각각의 매장이 선택되고, 그 매장들마다 태그와 형식이 모두 동일하게 되어 있는 것을 확인할 수 있다. 코드를 입력해서 확인해 보자. 잘 나왔는지는 len() 함수를 통해 매장 개수와 동일한지를 확인하고 처음과 끝을 확인하면 알 수 있다.

​	그리고 for문을 돌리기 전에 제일 첫 번째 매장으로 각각 필요한 정보를 추출해 보자. 이렇게 하면 for문을 돌릴 때 수월하게 진행할 수 있다. name은 매장명 중에 빈칸이 있어서 제거해 주기 위해 strip() 함수를 사용했다.  store_type은 태그 안에 있는 'general'이이라는 단어만 얻고 싶어서 위와 같이 코드를 입력했다. 그리고 주소와 전화번호는 방법이 두 개인데, 하나는 str으로 select() 함수를 묶고 split() 함수를 사용하는 방식과 나머지 하나는 슬라이싱을 하는 방식이다. 두 가지 모두 결과는 동일하다. 장단점이 있는데, 만약 전화번호가 전 매장 모두 동일한 개수라면 슬라이싱이 간편해서 좋다. 하지만 그렇지 않고 전화번호가 매장마다 개수가 다르다면 호환성이 좋은 방법 1이 알맞다.



```python
starbucks = []

for star in starbucks_list:
    name = star.select('li.quickResultLstCon > strong')[0].text.strip()
    lat = star['data-lat']
    lng = star['data-long']
    store_type = star.select('i')[0]['class'][0][4:]
    add = str(star.select('p.result_details')[0]).split('<br/>')[0].split('>')[1]
    tel = str(star.select('p.result_details')[0]).split('<br/>')[1].split('<')[0]
    mylist = [name, lat, lng, store_type, add, tel]
    starbucks.append(mylist)
```

​	for문을 돌린 코드는 위와 같다. starbucks라는 빈 리스트를 만들고 여기에 데이터를 넣어줄 것이다. 그리고 앞서 찾은 스타벅스 전 매장의 리스트(starbucks_list)를 star로 돌리고 select() 함수를 사용해 정보를 추출한다. 그리고 mylist에 변수들을 모두 담아 starbucks에 append() 해준다. 그러면 추출한 모든 스타벅스 정보가 리스트에 담길 것이다.



```python
columns = ['매장명','위도','경도','매장타입','주소','전화번호']
seoul_starbucks_df = pd.DataFrame(starbucks, columns=columns)
seoul_starbucks_df.head()

seoul_starbucks_df.to_excel('./files/seoul_starbucks_list_class.xlsx', index=False)
```

​	완성된 리스트 파일을 데이터프레임 형태로 바꿔주는데, 구분을 짓기 위해 컬럼을 지정해 준다. 그리고 to_excel로 저장하면 된다.

