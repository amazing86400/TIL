# 엑셀 파일 중복 내용 제거 후 통합하기



### 학습 목표

- 엑셀 파일의 중복 내용을 제거한 뒤 통합할 수 있다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
```

 pandas와 numpy 라이브러리를 import한다.



---



### Data 파일 가져오기

```python
jeju_insta = pd.DataFrame()
files = ['1_crawling_jejudoMatJip.xlsx', '1_crawling_jejudoGwanGwang.xlsx', 
          '1_crawling_jejuMatJip.xlsx', '1_crawling_jejuYeoHang.xlsx']

for i in files:
    path = './files/' + i
    temp = pd.read_excel(path)
    jeju_insta_df = jeju_insta.append(temp)
```

 4개의 엑셀파일을 한 번에 가져올 것이다. 우선 files 리스트에 4개의 엑셀 파일을 입력한다. 그리고 for문을 돌리는데, 가독성을 위해 read_excel()의 경로를 path라는 변수에 담았다. read 했으면 불러온 데이터를 dataframe 변수인 jeju_insta에 append() 해주고 그것을 재사용하기 위해 jeju_insta_df에 저장한다.



---



### 중복데이터 제거하기

```python
jeju_insta_df.shape

jeju_insta_df.drop_duplicates(subset = ['content'], inplace = True)
jeju_insta_df.to_excel('./files/jeju_insta.xlsx', index = False)

jeju_insta_df.shape
```

 인스타그램에서 여러 개의 키워드로 검색하거나 여러 번에 걸쳐 데이터를 수집하는 경우 동일한 게시물이 중복으로 수집되는 경우가 발생한다. 그래서 이를 제거하는 과정이 필요하다. 

 'content' 열 데이터에 들어있는 게시글의 본문 내용이 동일하면 중복으로 판단해서 제거한다.  여기서 inplace = True 옵션은 변경 내용을 변수에 저장하는 내용이다. inplace를 해줘야 데이터가 변경되어 있다. (jeju_insta_df = jeju_insta_df.drop_duplicates(subset = ['content'])) 이렇게 해줘도 된다. 판다스에서는 단계별로 데이터 확인 및 복구가 용이하도록 기본적으로 inplace가 False로 되어있어 원본을 변경하지 않는다.

 변경 내용을 엑셀로 저장한다.

