# Instagram KAKAO API



### 학습 목표

- 카카오 검색 API를 이용해 정확한 위치 정보를 얻을 수 있다.
- Instagram crawling을 통해 얻은 위치(이름)를 카카오 API를 이용해 정확한 위치 정보를 얻을 수 있다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
import time
import requests
from tqdm.notebook import tqdm
```





---



### 카카오 검색 API 가입

​	오늘 배운 내용을 학습하려면 카카오 API가 필요하다. 그래서 가장 먼저 'https://developers.kakao.com/'에 들어가서 애플리케이션을 만들자. 로그인을 하고 '내 애플리케이션'에 들어가서 '애플리케이션 추가하기'를 클릭해 'search' app을 만들면 된다. 앱 이름과 회사명은 자신이 원하는 키워드를 입력하면 되고 저장을 누르면 간단하게 만들 수 있다. 그리고 앱 이름을 클릭하면 상세 정보를 확인할 수 있다. API 키는 본인 개인 정보이므로 외부에 노출되지 않도록 주의한다.



---



### 카카오 로컬 API를 활용한 장소 검색

```python
searching = '합정 스타벅스'
url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(searching)
headers = {
    "Authorization" : "KakaoAK 카카오API키입력"
}
places = requests.get(url, headers = headers).json()['documents']
```

​	코드는 정해진 형식을 벗어나면 안 된다. 위 코드와 다를 시 오류가 나올 수 있다. 코드를 살펴보면 url의 마지막 부분인 query= 뒤에 검색할 대상을 추가해 format() 함수를 사용한다. 이러면 검색한 내용을 url로 만들 수 있다. 그리고 headers 정보로는 카카오 API 키 중 REST API 키를 넣어준다. REST API 키는 자신이 만든 앱을 누르면 확인할 수 있다. 그리고 requests.get() 함수를 통해 url 정보를 요청한다. headers을 넣는 이유는 카카오 키를 인증하기 위함인데, 인증에 문제가 없다면 요청한 정보를 결과로 받을 수 있다. 그리고 결과가 json 형태로 돼 있어서 json()을 넣어줬고, 우리가 원하는 결과가 documents에 들어 있다.

​	하나의 검색어로 여러 검색 결과를 확인할 수 있고, 정확도가 높은 장소부터 정렬돼 있다.



---



### 첫 번째 장소 함수 정의

```python
def find_places(searching):
    # 접속 url 만들기
    url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(searching)
    
    # headers 입력하기
    headers = {
        "Authorization" : "KakaoAK 카카오API키입력"
    }
    
    # API 요청 및 정보 받기
    places = requests.get(url, headers = headers).json()['documents']
    
    # 필요한 정보 선택하기
    place = places[0]
    name = place['place_name']
    x = place['x']
    y = place['y']
    data = [name, x, y, searching]
    
    return(data)
```

​	자신이 검색한 정보 중에서 가장 첫 번째(정확도가 가장 높은 장소) 장소의 이름과 경도, 위도 정보를 리스트 형태로 얻고 싶다. 그래서 이를 함수로 정의해 주는데, places 설정까지는 위에서 했던 코드와 동일하다. 그리고 그중 첫 번째인 places[0]를 place 변수에 담고, name, x, y 변수도 지정해 주었다. 그리고 그것을 data라는 리스트에 담아줬다.



 ```python
 >>> find_places('제주공항')
 ['제주국제공항', '126.492769004244', '33.5070789578184', '제주공항']
 ```

​	결과는 이렇게 나올 것이다.



---



### Instagram 위치 정보 검색

```python
raw_total = pd.read_excel('./files/1_crawling_raw.xlsx')
location_counts = raw_total['place'].value_counts()
location_counts_df = pd.DataFrame(location_counts)
locations = list(location_counts_df.index)
```

​	이제 크롤링한 인스타그램 게시글 정보가 들어 있는 엑셀 파일에서 게시글별 위치 정보를 가져오겠다. 인스타그램에서 정보를 수집한 파일을 불러와 위치 정보별로 빈도수를 집계한다. 그러면 중복된 값들은 집계돼서 인덱스가 하나씩 나올 것이다. 그 인덱스만 리스트로 만들면 위치 정보만 선택돼 사용할 수 있다.



```python
locations_inform = []
for location in tqdm(locations):
    try:
        data = find_places(location)
        locations_inform.append(data)
        time.sleep(1) # 시간이 좀 걸린다. 막 넣으면 에러가 나온다.
    except:
        pass
```

 	이제 for문을 돌려 locations의 데이터를 kakao API를 활용해 정확한 위치 정보를 얻을 것이다. 이때 반드시 time.sleep을 0.5 ~ 1초씩 설정해 대기하게 한다. 과도하게 빠른 요청 때문에 API 서버에서 접근을 차단함으로써 오류가 발생할 수 있기 때문이다. 그리고 인스타그램의 위치 정보가 지도에서 검색되지 않는 곳일 경우 에러가 나올 수 있기 때문에 try/except문을 사용했다.



---



### 저장하기

```python
locations_inform_df = pd.DataFrame(locations_inform)
locations_inform_df.columns = ['네이버위치명','경도','위도','인스타위치명']
locations_inform_df.to_excel('./files/3_3_locations.xlsx', index = False)
```

​	검색한 위치 정보가 저장된 변수를 pandas 데이터 프레임 형태로 만든 후 컬럼을 설정해 주고 저장한다.
