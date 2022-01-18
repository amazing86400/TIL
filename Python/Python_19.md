# Instagram web crawling 시각화_막대그래프 & Word Cloud



### 학습 목표

- Instagram web crawling을 통해 얻은 해시태그를 막대그래프와 word cloud로 시각화할 수 있다.
- Counter() 함수를 이해하고 활용할 수 있다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
from collections import Counter
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib import rc, font_manager
import sys
from wordcloud import WordCloud
import platform
```

 해시태그의 빈도수를 알아내기 위해 import Counter를 해준다. 그리고 그래프를 통한 시각화를 위해 seaborn과 seaborn의 기본이 되는 matplotlib을 import 한다. 그리고 글자 깨짐을 방지하기 위해 sys도 불러온다. 그리고 마지막 두 코드가 바로 워드 클라우드를 그리기 위한 라이브러리다.



---



### Word Cloud란

 텍스트 내에서 출현하는 단어들의 출현 빈도수에 비례하는 크기로 표출한 그래프이다. 빈도수가 많을수록 텍스트의 크기가 크다.



---



### 해시태그 데이터 불러오기

```python
raw_total = pd.read_excel('./files/1_crawling_raw.xlsx')
raw_total['tags'][:3]
```

 크롤링한 결과를 dataframe 형태로 불러오고 그중 tags 컬럼을 확인한다. 각 행마다 요소가 []에 담겨있다. 즉, 하나의 행에 담긴 태그들은 지금 모두 한 몸이다. 해시태그의 빈도를 확인하려면 하나의 해시태그 요소들이 각각 떨어져 있어야 한다. 그래서 각 행마다 있는 []를 벗겨낸 뒤 하나의 리스트에 담겠다.



```python
tags_total = []

for tags in raw_total['tags']:
    tags_list = tags[2:-2].split("', '")
    for tag in tags_list:
        tags_total.append(tag)
```

 우선 tags가 raw_total['tags']를 반복한다. tags[2:-2]는 **['#제주핫플레이스', '#제주여행']** 이렇게 되어 있던게 **#제주핫플레이스', '#제주여행** 이렇게 된다는 의미다. 그리고 split("', '") 이거는 요소 사이에 있는 ', '를 기준으로 요소를 나눈다는 것이다. 이렇게 하면 이제 해시태그들이 각각 떨어지게 되고 이제 이것을  tags_total 리스트에 append() 해준다. split("', '") 이 부분에서 ',' 다음에 공백이 한 칸 있다는 걸 꼭 기억하자. 공백이 없으면 요소가 하나로 떨어져 나오지 못한다.



```python
tag_counts = Counter(tags_total)
```

 Counter() 함수를 사용하면 그룹 내 원소의 종류별로 빈도수를 집계할 수 있다. 모든 해시태그의 빈도수를 집계한 결과를 tag_counts 변수에 저장했다.



```python
tag_counts.most_common(50)
```

 most_common() 함수는 빈도수가 높은 순으로 해시태그를 정렬해 준다. 그리고 (50) 설정한 숫자만큼만 보여준다.



```python
STOPWORDS = ['#일상', '#선팔', '#제주도', '#jeju', '#반영구', '#제주자연눈썹',
'#서귀포눈썹문신', '#제주눈썹문신', '#소통', '#맞팔', '#제주속눈썹',
            '#제주일상', '#여행스타그램', '#눈썹문신', '#카멜리아힐',
            '#daily', '#제주반영구', '#여행']

tag_total_selected = []

for tag in tags_total:
    if tag not in STOPWORDS:
        tag_total_selected.append(tag)
        
tag_counts_selected = Counter(tag_total_selected)
tag_counts_selected.most_common(50)
```

 STOPWORDS에 제주도 맛집과는 연관성이 없는 해시태그들을 넣어준다. 그리고 for문을 활용해 tags_total에 있는 해시태그에서 STOPWORDS에 포함되지 않은 해시태그만 tag_total_selected 리스트에 추가한다. 그리고 Counter() 함수로 빈도수를 확인한다.



---



### 막대그래프 그리기

```python
tag_counts_df = pd.DataFrame(tag_counts_selected.most_common(30))
tag_counts_df.columns = ['tags','counts']
```

 tag_counts_selected에서 상위 30개의 데이터만으로 그래프를 그리겠다. 그리고 데이터를 알기 쉽게 컬럼을 추가해 준다. 



```python
tag_counts_df['tags'].replace('', None, inplace = True)
ag_counts_df.dropna(subset=['tags'], inplace = True)
```

 tags 컬럼에 공백이 있어 제거해 줬다.



```python
plt.figure(figsize=(10,8))
sns.barplot(x = 'counts', y = 'tags', data = tag_counts_df)
plt.show()
```

![](E:\Amazing\Bigdata\code\Data_Platform\02_Second\5_Jeju_Hotplace\제주도맛집_해시태그_빈도수_막대그래프.JPG)

 figure() 함수로 이미지 크기를 설정해 주고, sns.barplot()은 seaborn의 막대 차트를 그리는 함수이다. 속성으로 x, y, data를 입력할 수 있다. data는 어떤 데이터로 시각화할 것인지를 의미하며, x와 y는 각각 X축, Y축에 어떤 칼럼을 이용할지를 의미한다.



---



### 워드 클라우드 그리기

```python
font_path = "c:/Windows/Fonts/malgun.ttf"
wordcloud = WordCloud(font_path = font_path,
                     background_color='white',
                     width = 500,
                     height = 350,
                     relative_scaling=0.5,
                     max_words=30).generate_from_frequencies(tag_counts_selected)

plt.figure(figsize=(15,10))
plt.imshow(wordcloud)
plt.axis('off')
plt.show()

plt.savefig('./jeju_wordcloud.png')
```

![](E:\Amazing\Bigdata\code\Data_Platform\02_Second\5_Jeju_Hotplace\제주도맛집_해시태그_빈도수_워드클라우드.JPG)

 WordCloud의 generate_from_frequencies() 함수에 tag_counts_selected 데이터를 넣어 워드 클라우드를 생성한다. font_path는 글꼴의 경로를 의미하고, background_color는 배경색을 의미한다. width와 height는 워드 클라우드의 가로, 세로 이미지 크기이다. 그리고 relative_scaling은 워드 클라우드 내 글자들의 상대적인 크기를 나타낸다. 최소 0부터 최대 1까지 값을 지정할 수 있다. 0에 가까울수록 빈도수의 순위에, 1에 가까울수록 빈도수에 더 큰 영향을 보인다. 마지막으로 max_words은 최대 몇 개의 단어를 나타낼 것인지를 설정한다.

 워드 클라우드는 plt.savefig() 함수를 통해 png 파일로 저장할 수 있다.