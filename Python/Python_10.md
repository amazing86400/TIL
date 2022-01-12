# Pandas_read & save



```python
import pandas as pd
import numpy as np
```

 우선 pandas와 numpy 라이브러리를 불러온다.



### read_저장된 파일

```python
pd.read_excel('./files/sample.xlsx)
```

 read() 함수는 저장된 파일을 불러오는 함수로, 저장된 파일의 종류에 따라 언더바(_) 다음의 코드가 달라진다. 위 코드는 엑셀을 불러오는 코드고, 경로를 설정해 주면 된다. 처음에는 경로 찾기에서 오류가 많이 나니까 경로 파악을 잘 해두자. 개발자의 기본 중 기본이다.



```python
pd.read_excel('./files/sample.xlsx', header = 1, usecols = 'A:C', skipfooter = 2)
```

 파일을 불러올 때 필요한 부분만 불러오는 것이 가장 효율적이다. 그러기 위해서는 옵션을 설정해야 한다. 우선 header는 여러 가지 값들이 어떤 의미를 갖는지 표시한 행(row)을 말한다. 그래서 header를 1로 설정하면 1행이 가장 위에 나타나게 된다. usecols는 열(columns)을 설정하는 옵션으로, 'A:C'까지만 나타나게 한다. 그리고 skipfooter는 아래에서 설정한 값만큼 제거하는 옵션이다.  



---



### read_웹 데이터

```python
pd.read_csv('https://bit.ly/fish_csv', encoding = 'utf-8')
```

 웹 데이터를 읽을 때도 비슷하다. 파일 경로 대신 사이트 주소를 입력하면 된다. 그리고 encoding은 문자가 깨질 때가 있는데 그럴 때 사용하는 옵션이다. 만약 한글이 깨진다면 'euc-kr'을 써주면 된다.



---



### Data를 활용한 기초지식

```python
>>> sample = pd.read_excel('./files/sample.xlsx', header = 1, usecols = 'A:C', skipfooter = 2)
>>> sample.dtypes
...
국적코드    object
성별      object
입국객수     int64
```

 불러온 파일의 타입을 확인할 수 있다. 결과를 보면 '입국객수'만 int인 것을 확인할 수 있다. 숫자로 되어 있는 연속형 데이터라는 의미다.



```python
sample = pd.read_excel('./files/sample.xlsx', header = 1, usecols = 'A:C', skipfooter = 2, dtype = {'입국객수':np.float64})
```

 데이터의 연산을 할 때는 소수점까지 나오는 경우가 대부분이기 때문에 int보다는 float(실수)로 바꿔주는 것이 더 좋다. 그래서 dtype 옵션을 주는데, 여기서는 딕셔너리를 사용해서 해줘야 한다.



```python
sample.head()
sample.tail()
```

 head()와 tail() 함수는 각각 처음과 끝의 5개씩만 보는 것이다. 데이터양이 많을 때 유용하게 사용할 수 있다.



```python
>>> sample.info()
...
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 6 entries, 0 to 5
Data columns (total 3 columns):
 #   Column  Non-Null Count  Dtype  
---  ------  --------------  -----  
 0   국적코드    6 non-null      object 
 1   성별      6 non-null      object 
 2   입국객수    6 non-null      float64
dtypes: float64(1), object(2)
memory usage: 272.0+ bytes
```

 Data의 자료 정보를 알 수 있다. columns, Null 값, Dtype 등을 알 수 있다. RangeIndex는 6개의 entries로 이뤄져 있고, 0부터 5까지 있다는 의미다.



```python
>>> sample.describe()
...
입국객수
count	6.000000
mean	114995.333333
std	98105.752006
min	42.000000
25%	26819.250000
50%	132616.000000
75%	183305.000000
max	232943.000000
```

 연속형 데이터의 요약 통계를 보여준다. 위에서 알 수 있듯 입국객수만 숫자형이라서 입국객수의 자료만 나왔다. 이 함수를 통해 평균, 최솟값, 최댓값 등을 확인할 수 있다.



```python
sample['입국객수']
sample['성별']
sample[['입국객수', '성별']]
```

 원하는 column만 뽑고 싶을 때는 위와 같이 입력하면 된다. 만약 여러 개를 함께 보고 싶으면 [[]]처럼 두개로 묶어준다.



```python
people = sample['입국객수'] >= 5000
sample[people]

gender = sample['성별'] == '남성'
sample[gender]
sample[~gender]

sample[people & gender]
sample['국적코드'].isin(['A01','A31'])
```

 마스크 기능도 물론 가능하다. 조건을 걸어 그 값의 True, False를 알 수 있고, 그것을 DataFrame 전체에 적용하는 코드가 위 코드이다. 가독성을 위해 조건을 변수에 담았다. 그리고 변수 앞에'~'를 입력하면 조건의 반대 값이 입력된다. 예시의 경우 남성이 아닌 여성이 결과로 나올 것이다.

 and와 or도 사용이 가능한데, or의 경우에서 만약 조건이 많다면 isin() 함수를 사용하면 매우 유용하다. 마지막 코드는 국적코드가 A01이거나 A31인 것을 찾는 코드이다.



```python
sample['기준년월'] = '2022/01/12'
```

 column을 추가하는 코드이다. 자동으로 가장 오른쪽에 생성된다.



---



### save

```python
sample.to_excel('./files/sample_me.xlsx', index = False, na_rep = 'NaN', sheet_name = 'amazing')
```

 작업한 파일을 저장할 때는 위와 같이 코드를 입력하면 된다. 우선 파일 타입에 따라 excel 대신 csv나 text가 들어갈 수도 있다. 그리고 저장할 위치에 저장할 파일 이름을 입력해 주면 된다. 만약 이미 파일이 존재한다면 그 위에 덮어씐다. 그리고 옵션들을 보면 index는 엑셀파일을 열었을 때 index의 존재 여부이다. 따로 입력을 안 하면 default 값으로 True가 되는데, 이러면 자신이 지정하거나 혹은 그냥 숫자로 된 index가 함께 저장된다. 엑셀의 경우 이러면 index가 겹치기 때문에 False를 해서 제거해 줬다. 그리고 빈칸이 있을 경우에는 na_rep 옵션으로 자신이 원하는 문자를 지정할 수 있다. 그냥 빈칸보다는 'NaN'으로 표시하는 것이 더 깔끔하기 때문에 설정한다. 마지막으로 sheet_name은 엑셀의 sheet 이름이다.



```python
with pd.ExcelWriter('./files/multiple_sheet.xslx') as writer:
    sample.to_excel(writer, sheet_name = 'myone')
    sample.to_excel(writer, sheet_name = 'mytwo', index = False, na_rep = 'NaN')
```

 한 개의 파일에 다른 sheet로 저장하는 코드이다.