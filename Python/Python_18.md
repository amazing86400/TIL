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

 오늘 배운 내용을 학습하려면 카카오 API가 필요하다. 그래서 가장 먼저 'https://developers.kakao.com/'에 들어가서 애플리케이션을 만들자. 로그인을 하고 '내 애플리케이션'에 들어가서 '애플리케이션 추가하기'를 클릭해 'search' app을 만들면 된다. 앱 이름과 회사명은 자신이 원하는 키워드를 입력하면 되고 저장을 누르면 간단하게 만들 수 있다. 그리고 앱 이름을 클릭하면 상세 정보를 확인할 수 있다. API 키는 본인 개인 정보이므로 외부에 노출되지 않도록 주의한다.



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

 코드는 정해진 형식을 벗어나면 안 된다. 위 코드와 다를 시 오류가 나올 수 있다. 코드를 살펴보면 url의 마지막 부분인 query= 뒤에 검색할 대상을 추가해 format() 함수를 사용한다. 이러면 검색한 내용을 url로 만들 수 있다. 그리고 headers 정보로는 카카오 API 키 중 REST API 키를 넣어준다. REST API 키는 자신이 만든 앱을 누르면 확인할 수 있다. 그리고 requests.get() 함수를 통해 url 정보를 요청한다. headers을 넣는 이유는 카카오 키를 인증하기 위함인데, 인증에 문제가 없다면 요청한 정보를 결과로 받을 수 있다. 그리고 결과가 json 형태로 돼 있어서 json()을 넣어줬고, 우리가 원하는 결과가 documents에 들어 있다.

 하나의 검색어로 여러 검색 결과를 확인할 수 있고, 정확도가 높은 장소부터 정렬돼 있다.



---



### 첫 번째 장소 함수 정의

```python
def find_places(searching):
    url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(searching)
    headers = {
        "Authorization" : "KakaoAK 카카오API키입력"
    }
    places = requests.get(url, headers = headers).json()['documents']
    place = places[0]
    name = place['place_name']
    x = place['x']
    y = place['y']
    data = [name, x, y, searching]
    
    return(data)
```

 자신이 검색한 정보 중에서 가장 첫 번째(정확도가 가장 높은 장소) 장소의 이름과 경도, 위도 정보를 리스트 형태로 얻고 싶다. 그래서 이를 함수로 정의해 주는데, places 설정까지는 위에서 했던 코드와 동일하다. 그리고 그중 첫 번째인 places[0]를 place 변수에 담고, name, x, y 변수도 지정해 주었다. 그리고 그것을 data라는 리스트에 담아줬다.



 ```python
 >>> find_places('제주공항')
 ['제주국제공항', '126.492769004244', '33.5070789578184', '제주공항']
 ```

 결과는 이렇게 나올 것이다.



---



### Instagram 위치 정보 검색

```python
raw_total = pd.read_excel('./files/1_crawling_raw.xlsx')
location_counts = raw_total['place'].value_counts()
location_counts_df = pd.DataFrame(location_counts)
locations = list(location_counts_df.index)
```

 먼저 저번에 인스타그램 crawling 해서 저장했던 정보를 불러온다. 그리고 그 데이터 중 위치 정보인 'place'를 변수에 담는다. 그리고 place만 따로 추출했기 때문에 data type은 Seriese이다. 그래서 place를 DataFrame으로 만들어 준다. 



```python
locations_inform = []
for location in tqdm(locations[:100]): # location이 10000개나 있어서 우리는 20개만 함
    try:
        data = find_places(location)
        locations_inform.append(data)
        time.sleep(1) # 시간이 좀 걸린다. 막 넣으면 에러가 나온다.
    except:
        pass
```

