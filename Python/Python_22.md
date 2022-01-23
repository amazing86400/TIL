# 특정 단어 찾기



### 학습 목표

- 수집한 인스타그램 게시글 중에 특정 단어를 포함하는 게시글을 찾을 수 있다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
```

​	판다스와 넘파이 라이브러리를 불러온다.



---



```python
raw_total = pd.read_excel('./files/1_crawling_raw.xlsx')
```

​	이전에 인스타그램에서 크롤링한 파일을 가져온다. 파일에는 게시물 내용, 날짜, 좋아요 수, 장소, 해시태그가 있다.



```python
select_word = '해돋이'
check_list = []

for content in raw_total['content']:
    if select_word in content:
        check_list.append(True)
    else:
        check_list.append(False)
        
check_list
select_df = raw_total[check_list]
select_df
```

​	게시물에 '해돋이'가 있는 게시물만 찾고 싶다. for문을 활용해 content가 raw_total 파일의 게시물을 하나씩 돌게끔 하고, 만약 해돋이가 content에 있으면 그 게시물은 check_list에 추가하고 아니면 하지 말라는 코드다. 그리고 check_list는 raw_total로 마스크 기능을 활용하면 해돋이가 포함된 자료들만 데이터프레임 형태로 볼 수 있다.



```python
for i in select_df.index:
    print(select_df.loc[i, 'content'])
    print('-'*50)
```

​	그리고 데이터프레임을 활용해 다른 방식으로도 나타낼 수 있다. 데이터프레임의 index를 for문으로 돌리고, loc를 활용해 행은 i, 열은 content로 지정하면 게시글이 하나씩만 추출되어 나올 것이다. 그리고 구분선으로 게시글을 구분해 준다. 이러면 해돋이가 포함된 게시물만 볼 수 있다.



```python
def select_word(select_word_list):
    for select_word in select_word_list:
        check_list = []
        for content in raw_total['content']:
            if select_word in content:
                check_list.append(True)
            else:
                check_list.append(False)
        select_df = raw_total[check_list]
        fpath = './files/4_select_data_class_{}.xlsx'.format(select_word)
        select_df.to_excel(fpath, index = False)
```

```python
select_word_list = ['해돋이','박물관','힐링','게스트하우스','섭지코지']
select_word(select_word_list)
```

​	이번에는 여러 개의 검색 단어 리스트를 이용해 각 단어를 포함한 글을 엑셀파일에 저장하는 코드이다. 우선 단어가 포함된 게시글을 담을 빈 리스트를 만든다. 그리고 for문으로 리스트 안의 단어들을 하나씩 추출하고 content에 있는지 확인한다. 만약 있으면 추가하고, 그렇지 않다면 추가하지 않는다. 그리고 format() 함수를 활용해 각각의 저장 경로를 설정하고 to_excel 해준다.
