# Instagram web crawling



### 학습 목표

- Instagram을 web crawling할 수 있다.



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



---



### 크롬 드라이버 활용

```python
ser = Service('../chromedriver/chromedriver.exe')
driver = webdriver.Chrome(service = ser)
url = 'https://www.instagram.com/?hl=ko'
driver.get(url)
```

 로그인하는 코드가 있지만, url을 불러서 로그인 하는 것이 더 낫다.



---



### insta_serching 함수 정의

```python
def insta_serching(word):
    url = 'https://www.instagram.com/explore/tags/' + format(word)
    
    return(url)
```

 사용자가 입력한 값으로 url을 불러오기 위해 함수를 따로 정의해준다. url은 위와같은 코드를 사용해도 되고, 아니면 format() 함수를 써줘도 무방하다.



```python
>>> word = '제주도맛집'
>>> url = insta_serching(word)
>>> url
'https://www.instagram.com/explore/tags/제주도맛집'
```

 결과가 잘 나오는지 확인한다. 입력값이 사이트 주소로 잘 나온다.



```python
word = '제주도맛집'
url = insta_serching(word)
driver.get(url)
time.sleep(5)
```





---



### web crawling

```python
from selenium.webdriver.common.by import By
first = driver.find_element(By.CSS_SELECTOR, 'div._9AhH0')
first.click()
```



