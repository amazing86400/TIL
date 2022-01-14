# Pandas_Series



### 학습 목표

- Pandas 라이브러리의 기능을 살펴본다.
- numpy와의 관계를 이해한다.



---



### pandas 정의

 numpy 기반의 데이터 분석용 라이브러리다. 내용이 매우 방대해 pandas만을 다룬 전문서적이 있을 정도다. panel datas(패널 자료)의 약자로 파이썬을 활용한 데이터 분석에서 가장 많이 활용한다. 1차원 배열 형태를 Series라고 부르고, 2차원 배열 형태를 DataFrame이라고 부른다.



---



### 라이브러리 불러오기

```python
import pandas as pd
from pandas import Series, DataFrame
```

 import를 활용해서 pandas를 불러오며, 보통 pd로 별칭을 붙인다. 그리고 from으로 자주 사용하는 Series와 DataFrame만 불러서 사용할 수도 있는데, 이렇게 불러오면 코드를 짤 때 굳이 pd를 안 붙여도 Series와 DataFrame을 사용할 수 있다.



---



### Series

```python
>>> Series([1,2,3,4])
0    1
1    2
2    3
3    4
dtype: int64
    
>>> Series([1,2,3,4], index = ['a','b','c','d'])
a    1
b    2
c    3
d    4
dtype: int64
```

 기본적으로 Series는 index와 함께 나타나는 1차원 형태이다. index는 따로 설정을 안 하면 숫자가 default 값으로 나오고, list 요소에 맞게 설정해 줘도 된다. 여기서 index는 생략해 줘도 된다.



---



### 색인

```python
>>> s1 = Series([1,2,3,4], index = ['a','b','c','d'])
>>> s1[0]
1

>>> s1[-1]
4

>>> s1[0:1]
a    1

>>> s1[[0,3]]
a    1
d    4

>>> s1['a']
1

>>> s1.a
1

>>> s1['a':'c']
a    1
b    2
c    3

>>> s1 > 2
a    False
b    False
c     True
d     True

>>> s1[s1 > 2]
c    3
d    4
```

 Series의 색인은 매우 다양하다. 먼저 첫 번째와 두 번째처럼 [0] 혹은 [-1] 해주면 차원이 축소되어 결과가 나온다. 반대로 슬라이싱을 하면 차원 축소는 발생하지 않는다. 그리고 index를 활용해서 색인을 할 수도 있지만, key 값을 사용해도 결과는 같다. 그리고 마스크 기능도 사용할 수 있는데, 마지막처럼 변수 전체에 적용했을 때와 그렇지 않을 때를 비교해서 알아두자.



---



### 연산

```python
>>> s1 = Series([1,2,3,4])
>>> s1 + 1
0    2
1    3
2    4
3    5

>>> s2 = Series([3,4,5,6])
>>> s1 + s2
0     4
1     6
2     8
3    10

>>> s3 = Series([5,6,7,8], ['a','b','c','d'])
>>> s2 + s3
a   NaN
b   NaN
c   NaN
d   NaN
0   NaN
1   NaN
2   NaN
3   NaN

>>> s4 = Series([10,20,30,40], ['c','d','e','f'])
>>> s4.add(s3, fill_value=0)
a     5.0
b     6.0
c    17.0
d    28.0
e    30.0
f    40.0
dtype: float64
    
>>> s4.sub(s3, fill_value=0)
a    -5.0
b    -6.0
c     3.0
d    12.0
e    30.0
f    40.0

>>> s4.mul(s3, fill_value=1)
>>> s4.div(s3, fill_value=1)
```

 Series는 연산도 가능하다. 연산을 할 때는 배열과 index가 맞는지 잘 확인하자. 만약 다르다면 세 번째처럼 결과가 NaN 값으로 나오게 된다. 그리고 add()는 더하는 함수이다. fill_value 매개변수는 index가 다른 값을 0으로 만들어 계산을 도와준다. sub은 빼기, mul은 곱하기, div는 나누기이다. mul과 div는 fill_value를 0으로 하면 값이 0이 나오기 때문에 1을 해주도록 한다.



---



### 기본 method

```python
>>> s3[['c','d','a','b']]
c    7
d    8
a    5
b    6

>>> s3.reindex(['a','b','c','d'])
a    5
b    6
c    7
d    8

>>> s3.index = ['A','B','C','D']
A    7
B    8
C    5
D    6

>>> s3[0] = 10
A    10
B     8
C     5
D     6
```

  첫 번째 코드는 index 순서를 내가 원하는 순서대로 바꿀 수 있는 코드다. index에 맞춰 요소도 함께 순서가 바뀐다. 두 번째 코드 역시 index의 순서를 바꿀 수 있다. 세 번째 코드는 index를 바꿔주는 코드다. 소문자를 대문자로 바꿔주었다. 마지막 코드는 value를 바꾸는 코드다.