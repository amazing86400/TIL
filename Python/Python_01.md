# 내 생일 기온 변화 그래프 그리기



### 데이터 읽어오기

```python
import csv
f = open('seoul.csv')
data = csv.reader(f)

for row in data:
    print(row)
```

 서울 날씨 공공데이터를 읽어온다.



```python
import csv
f = open('seoul.csv')
data = csv.reader(f)
next(data)  # 헤더 부분 제외

for row in data:
    print(row[-1])  # 최고 기온 추출
```

 next 함수를 통해 맨 윗줄 헤더 부분을 제외한다. 그리고 for 문을 돌려 최고 기온 데이터만 추출한다.



---



### 데이터 리스트에 저장하기

``` python
import csv
f = open('seoul.csv')
data = csv.reader(f)
next(data)
high = []  # 빈 리스트 생성

for row in data:
    if row[-1] != '':  # 최고 기온이 존재한다면
        high.append(float(row[-1]))  # 리스트에 최고 기온 추가
        
print(high)
```

 데이터를 넣을 리스트를 생성해 준다. 그리고 append 함수를 써서 리스트에 최고 기온을 넣어주는데, 여기서 중요한 것은 기온은 실수이기 때문에 반드시 floar 함수를 사용해 준다.



---



### 데이터 시각화하기

```python
import csv
import matplotlib.pyplot as plt  # matplotlib 라이브러리 pyplot 모듈 사용

plt.plot(high, 'r')  # high 리스트를 빨간색 그래프로 나타내기
plt.show()  # 그래프 나타내기
```

 이제 저장한 리스트를 그래프로 나타낸다. 하지만 결괏값이 워낙 많아 의미 파악이 어렵다.



---



### 날짜 데이터 추출하기

```python
for row in data:
    if row[-1] != '':
        if row[0].split('-')[1] == '08':  # 8월에 해당하는 값이라면
            high.append(float(row[-1]))

plt.plot(high, 'r')
plt.show()
```

 조건을 하나 추가해 주었다. split 함수를 사용해 일자(row[0])를 구분해 주고, 그중 '월'이 8월인 데이터만 모은다.



```python
for row in data:
    if row[-1] != '':
        if row[0].split('-')[1] == '08' and row[0].split('-')[2] == '14': 
            high.append(float(row[-1]))
```

 and를 써 '일'까지 추가해 주었다.



---



### 총정리

```python
import csv
import matplotlib.pyplot as plt

f = open('./Data/seoulcopy.csv')
data = csv.reader(f)
next(data)
high = []  # 최고 기온 값 저장 리스트 생성
low = []   # 최저 기온 값 저장 리스트 생성

for row in data:
    if row[-1] != '' and row[-2] != '' :  # 최고/최저 기온 값이 존재한다면
        date = row[0].split('-')  # 날짜 값을 '-'를 기준으로 구분하여 저장
        if 2000 <= int(date[0]):  # 2000년 이후 데이터라면
            if date[1] == '08' and date[2] == '14':  # 8월 14일이라면
                high.append(float(row[-1]))  # 최고 기온 값을 리스트에 저장
                low.appen(float(row[-2]))    # 최저 기온 값을 리스트에 저장

plt.rc('font',family = 'Malgun Gothic')     # 글꼴 설정
plt.rcParams['axes.unicode_minus'] = False  # 마이너스 기호 깨짐 방지
plt.title('My Birthday Temperature Graph')  # 제목 설정
plt.plot(high, 'hotpink', label = 'high')   # 그래프 색과 레이블 설정
plt.plot(low, 'skyblue', label = 'low')     # 그래프 색과 레이블 설정
plt.legend()  # 범례 표시
plt.show()
```

 총정리를 하자면 위 코드와 같다. 최고 기온뿐 아니라 최저 기온도 추가하였다. 그리고 plt의 유용한 설정들은 알아두도록 하자.