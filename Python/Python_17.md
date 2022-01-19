# Instagram web crawling



### 학습 목표

- Instagram을 web crawling 할 수 있다.



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

 web crawling을 위해 selenium 라이브러리부터 bs4, 그리고 time 라이브러리를 가져온다.  time 라이브러리는 우리가 실시간으로 data를 받아올 때 사용한다. data가 들어오기도 전에 다음으로 넘어가면 오류가 나기 때문에 sleep() 함수로 data가 들어오는 시간을 벌어줘야 한다.



---



### 크롬 브라우저로 Instagram 열기

```python
ser = Service('../chromedriver/chromedriver.exe')
driver = webdriver.Chrome(service = ser)
url = 'https://www.instagram.com/'
driver.get(url)
```

 변수를 설정해 주고, url을 instagram 주소로 설정한다. instagram의 경우 로그인이 필수기 때문에 아이디가 없다면 회원가입부터 하자. 아이디가 있다면 로그인까지 한 번에 하는 코드가 있는데, 그렇게 하면 개인 정보가 노출되므로 브라우저에서 로그인하도록 하자.



---



### 검색 결과 URL 만들어 접속하기

```python
def enter_serching(word):
    url = 'https://www.instagram.com/explore/tags/' + word
    driver.get(url)
    time.sleep(3)
```

 사용자가 입력한 값으로 url을 불러오기 위해 함수를 따로 정의해 준다. url 변수 코드는 위와 같은 코드를 사용해도 되고, 아니면 format() 함수를 써줘도 무방하다. 그리고 원활한 데이터 처리를 위해 time.sleep(3)을 해줬다.



---



### 첫번째 게시물 열기

```python
def select_first(driver):
    first = driver.find_element(By.CSS_SELECTOR, 'div._9AhH0')
    first.click()
    time.sleep(3)
```

 검색 결과 화면이 나왔으면 그중 첫 번째 게시물을 찾는 코드를 만들어 보겠다. 이 기능을 사용하려면 find_element() 코드를 사용해야 한다. 인스타그램 검색 화면에서 첫 번째 게시물을 개발자 창을 통해 찾은 다음 코드에 입력해 주면 된다.



---



### 게시글 정보 가져오기

```python
import unicodedata

content = soup.select('div.C4VMK > span')[0].text
content = unicodedata.normalize('NFC', contents)
```

 먼저 게시글을 찾을 거다. 브라우저를 통해 게시글의 위치를 얻는다. 처음에 div로만 생각했는데, 자세히 보니 시간도 같이 있어, 온전한 게시글이 아니었다. 그래서 하위 태그인 span을 집어넣었더니 완벽히 결과가 나왔다. 그리고 mac으로 게시글을 작성했을 경우 깨질 우려가 있어 unicodedata를 입력해 줬다.



```python
import re
tags = re.findall(r'#[^\s#.\\]+' , contents)
```

 해시태그(#)를 찾고 싶다. re는 정규 표현식에 사용되는 라이브러리이며, import해야 사용할 수 있다. 풀이하자면 contents 변수의 본문 내용 중 #으로 시작하고, # 뒤에 연속된 문자(공백, #, | 기호가 아닌 경우)를 모두 찾아서 리스트 형태로 저장한다. '^' 이 화살 표시가 'not in'의 의미이다.



```python
date = soup.select('time._1o9PC.Nzb55')[0]['datetime'][:10]
```

 게시글을 올린 날짜를 알아본다. ['datetime']을 빼면 결과가 '14시간 전' 이런 식으로 정확한 날짜가 나오지 않는다. 그래서 ['datetime']으로 정확한 날짜만 슬라이싱해서 값을 얻는다.



```python
like = soup.select('a.zV_Nj > span')[0].text
```

 좋아요 정보를 가져온다.



```python
place = soup.select('a.O4GlU')[0].text
place = unicodedata.normalize('NFC', place)
```

 위치 정보를 얻고 싶다. 이 역시 mac 게시물의 깨짐 방지로 unicodedata 코드를 입력해 줬다.



---



### 함수 정의하기

```python
def get_content(driver):
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')
    
    try: 
        content = soup.select('div.C4VMK > span')[0].text
        content = unicodedata.normalize('NFC', content)
    except:
        content = ""
    
    
    try:
        tags = re.findall(r'#[^\s#,\\]+',content)
    except:
        tags = ""
        
    date = soup.select('time._1o9PC.Nzb55')[0]['datetime'][:10]
    
    try:
        like = soup.select('a.zV_Nj > span')[0].text
    except:
        like = 0
    
    try:
        place = soup.select('a.O4GlU')
        place = unicodedata.normalize('NFC', place)
    except:
        place = ""
    
    
    data = [content, date, like, place, tags]
    
    return(data)
```

 함수로 정의하면 위 코드와 같다. 앞서 정보 가져올 때 사용한 코드들을 합치면 되는데, 첫 번째 게시물이 열린 상태에서 확인한 정보이기 때문에 실행도 게시물이 열려있어야 실행 가능하다. 그리고 찾는 정보가 없는 경우가 있어 오류를 방지하기 위해 try/except구문을 사용했다. 마지막으로 data라는 리스트 변수에 담았다.



---



### 오른쪽으로 넘기기

```python
def move_next(driver):
    right = driver.find_element(By.CSS_SELECTOR, 'div.l8mY4.feth3')
    right.click()
    time.sleep(3)
```

 오른쪽으로 넘기는 함수는 앞서 본 첫 번째 게시물 열기와 거의 똑같고 태그만 다르다. 게시물을 넘기는 태그 위치를 찾아 넣어주자.



```python
def insta_crawling(word,n):
    enter_serching(word)
    time.sleep(3)
    
    select_first(driver)
    time.sleep(3)
    
    result = []
    
    for i in range(n):
        try:
            temp = get_content(driver)
            result.append(temp)
            move_next(driver)
        except:
            time.sleep(3)
            move_next(driver)
            
    return(result)
```

 지금까지 다룬 내용을 하나의 함수로 정의하면 다음과 같다. 내가 검색어만 입력하면 자동으로 첫 번째 게시물부터 n 번째까지 data 정보를 가져온다. for문을 통해 내가 지정한 게시물 수까지 정보를 얻을 수 있다.



---



### Data 저장하기

```python
result_df = pd.DataFrame(result)
result_df.columns = ['contents','date','like','place','tags']
result_df.to_excel('./files/1_crawling_raw.xlsx', index= False)
```

 리스트 형태의 data를 보기 좋게 dataframe 형태로 만들어주고, 컬럼도 정해준다. 그리고 엑셀파일로 저장한다. 이때 인덱스는 False로 설정해 주자.
