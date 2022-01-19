# Youtube rank 시각화



### 학습 목표

- Youtube rank 엑셀파일을 파이(pie) 차트 형태로 시각화할 수 있다.
- Youtube 장르별 구독자 수를 확인해서 insight를 얻는다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc, font_manager
```

​	데이터를 시각화하기 위해서는 matplotlib 라이브러리를 불러와야 한다. 그리고 폰트를 설정하기 위해 matpltlib의 rc와 font_manager도 불러온다.



---



### 데이터 읽어오기

```python
df = pd.read_excel('./files/youtube_class.xlsx')
```

​	Pandas 함수를 통해 엑셀 파일을 읽고, 파일을 사용하기 위해 df 변수에 담는다.



---



### 데이터 속성 바꾸기

```python
df.info()
df['구독자수'] = df['구독자수'].str.replace('만','0000')
df['구독자수'] = df['구독자수'].astype('int')
```

​	장르별 구독자 수를 알아야 하기 때문에 구독자수의 type이 'int'여야 한다. 'str'이면 산수 연산이 불가능하기 때문이다. 그래서 info() 함수를 통해 data의 속성을 알아보자. 구독자수의 data type은 object다. 그래서 바꿔주겠다.

​	우선 replace() 활용해 '만'을 '0000'으로 바꿔주자. 그냥 replace() 함수를 사용하면 오류가 나온다. 그 이유는 data type 때문이다. str method를 써줘야 replace를 해줄 수가 있다. 그리고 변수에 다시 저장한다.

​	type을 바꾸기 위해서 astype() 함수를 사용하자. int로 바꿔줬다면 다시 변수에 저장한다.



---



### pivot

```python
df.pivot_table(index = '장르', values = '구독자수', aggfunc = 'sum')
df.pivot_table(index = '장르', values = '구독자수', aggfunc = ['sum','count'])
```

​	장르별 구독자수를 알아보는 것이기 때문에 index는 장르로 설정하고, values는 구독자수로 설정한다. 그리고 aggfunc의 default 값이 mean(평균)이기 때문에 'sum'으로 설정을 해준다. 만약 sum 이외에 다른 것도 구하고 싶다면 []로 묶어 2개의 함수를 넣어주면 된다.



```python
df_pivot = df.pivot_table(index = '장르', values = '구독자수', aggfunc = 'sum')
df_pivot = df_pivot.reset_index()
df_pivot = df_pivot.sort_values(by='구독자수', ascending = False)
```

​	피벗테이블이 만들어졌다면 이제 보기 좋게 만들어주는 작업이 필요하다. 우선 reset_index() 함수를 통해 인덱스를 생성해 준다. 그리고 sort_values() 함수로 정렬을 할 건데, 기준은 구독자수이고, ascending을 False로 해서 내림차순으로 정렬한다.



---



### Pie chart

```python
plt.rc('font', family = 'Malgun Gothic')
plt.rcParams['axes.unicode_minus'] = False
```

​	우선 한글이 나올 수 있도록 설정을 해줘야 한다. 첫 번째 코드는 폰트를 '맑은 고딕'으로 설정하는 코드이다. 그리고 두 번째 코드는 '-'기호를 포함시켜주는 코드이다.



```python
plt.rcParams['font.size'] = 12
plt.figure(figsize = (6,6))
plt.pie(dfpi.head(6)['구독자수'], labels = dfpi.head(6)['장르'], autopct='%.1f%%')
plt.show()
```

​	가장 먼저 plt.pie() 함수로 파이 차트를 만들 것이다. 가장 처음 설정해 줄 것은 'ratio'로 데이터 범위(값)이다. 나는 구독자수로 설정했다. 그리고 labels을 설정해 준다. 나는 장르로 설정했다. 원래는 데이터 전체를 하려고 했지만, 장르가 많아서 그렇게 하면 보기가 힘들어진다. 그래서 head() 함수를 6으로 설정해 가장 위 6개만 차트로 만들었다. 나중에는 나머지 장르를 기타로 통합해서 하면 좋을 것 같다. 그리고 각 장르별 차지하는 비율을 정확하게 나타내기 위해 autopct를 설정했다. 소수점 1자리까지만 퍼센트지로 나타낸다는 코드다. 마지막으로 폰트 크기와 차트 크기도 설정해 줬는데, 첫 번째와 두 번째 코드를 보면 된다.

​	여기서 중요한 것은 두 번째 코드가 세 번째 코드보다 아래에 있으면 차트 크기가 변하지 않는다.



---



### Insight

​	Youtube rank를 시각화한 결과 [음악/댄스/가수]가 59.5%로 1위를 기록했다. 2위는 [키즈/어린이] 18.2%, 3위는 [음식/요리/레시피]가 10.3%를 차지했다. 기존 팬덤이 형성된 연예인이나 기획사 채널에서 구독자가 많은 것으로 보인다. 그리고 2위가 키즈 채널인 것으로 보아 아이들이 상당히 유튜브를 많이 접한다는 것을 알 수 있다.
