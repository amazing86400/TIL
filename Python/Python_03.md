# 올림픽 메달 집계 현황



### 학습 목표

- 웹 페이지를 읽고 엑셀로 저장할 수 있다.
- pandas 라이브러리를 통해 데이터를 수정할 수 있다.



---



### 1. 구글 '올림픽 메달 집계' 페이지 링크불러오기



```python
import pandas as pd
df = pd.read_html('https://ko.wikipedia.org/wiki/%EC%98%AC%EB%A6%BC%ED%94%BD_%EB%A9%94%EB%8B%AC_%EC%A7%91%EA%B3%84')
print(df)
```

​	구글에  '올림픽 메달 집계'를 검색한 뒤, 위키백과 페이지의 링크를 복사해 read_html() 함수로 데이터를 불러온다. read_html() 함수는 웹 페이지에서 테이블 형태의 데이터를 추출하는 함수다. 그리고 이를 df라는 변수에 저장한다. 그리고 데이터를 보면 []로 담겨 있는 것을 알 수 있다. 즉, 리스트 형태라는 뜻이다. 



---



### 2. 인덱스 확인 및 수정하기



```python
df = pd.read_html('https://ko.wikipedia.org/wiki/%EC%98%AC%EB%A6%BC%ED%94%BD_%EB%A9%94%EB%8B%AC_%EC%A7%91%EA%B3%84', index_col=0)
df[2]
```

​	데이터가 표 형태로 깔끔하게 정리되었다. 먼저 나는 index_col 옵션을 0으로 설정해 기존 번호 인덱스를 없애고 국가 이름이 오도록 설정했다. 그리고 상단에는 column을 확인할 수 있다.



---



### 3. column value 설정하기



```python
summer = df[2].iloc[:,0:5]
summer.columns = ['하계참가횟수','금','은','동','계']
summer
```

​	하계 결과만 보기 위해 iloc 함수를 이용해 df[2]의 행은 모두 포함하고, 열은 0~4번째까지 설정했다. 그리고 column 이름을 메달과 총 계로 설정했다.



---



### 4. 정렬 및 엑셀파일로 저장하기



```python
import pandas as pd
df = pd.read_html('https://ko.wikipedia.org/wiki/%EC%98%AC%EB%A6%BC%ED%94%BD_%EB%A9%94%EB%8B%AC_%EC%A7%91%EA%B3%84',
                 index_col = 0)
summer = df[2].iloc[:,0:5]   
summer.columns = ['하계참가횟수','금','은','동','계']

print(summer.sort_values('금', ascending=False))
```

​	sort_values() 함수를 사용해 금메달을 기준으로 정렬한다. 옵션으로 ascending을 False를 해줌으로써 내림차순 정렬했다. 오름차순을 하고 싶을 땐 True로 해주면 된다.



```python
summer.to_excel('하계올림픽메달.xlsx')
```

​	위 코드를 사용해 작업한 내용을 엑셀로 저장한다.





