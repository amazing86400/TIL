# ProDS 문제 1



### 전자제품 제조회사의 효과적인 마케팅

​	글로벌 전자제품 제조회사에서 효과적인 마케팅 방법을 찾기 위해서 채널별 마케팅 예산과 매출금액과의 관계를 분석하고자 한다.



---



#### 데이터 세트 내에 총 결측값의 개수는 몇 개인가? (답안 예시) 23



```python
data1.isna().sum().sum()
data1.isna().any(axis=1).sum()
답 : 26
```

​	첫 번째 코드는 셀 내에 있는 결측값들의 개수이고, 두 번째 코드는 결측값이 포함된 컬럼의 수를 확인하는 코드이다.

​	중요포인트 : 결측치 확인은 .isna()



---



#### TV, Radio, Social Media 등 세 가지 다른 마케팅 채널의 예산과 매출액과의 상관분석을 통하여 각 채널이 매출에 어느 정도 연관이 있는지 알아보고자 한다. 
*매출액과 가장 강한 상관관계를 가지고 있는 채널의 상관계수를 소수점 5번째 자리에서 반올림하여 소수점 넷째 자리까지 기술하시오. (답안 예시) 0.1234*

```python
var_list = ['TV', 'Radio', 'Social_Media', 'Sales']
q1 = data1[var_list].corr()
q2 = data1[var_list].corr().abs().drop('Sales')['Sales']

q2.max()       # 최댓값
q2.nlargest(1) # 상위 n개의 값, 여기서는 1개값
q2.argmax()    # 최댓값의 위치번호. 몇번째 위치에 있는지
q2.idxmax()    # 최댓값의 인덱스명

round(q2.max(),4)
# 답: 0.9995
```

​	상관계수는 .corr() 함수를 활용하여 구한다. 마스크 인덱싱 기능을 활용하는데, 이때 list 변수에 담아서 활용하는 것이 팁이다. 그리고 Sales와 관련된 것만 확인하기 위해 drop()으로 빼줬다. 밑에 함수들도 참고하자.



----



#### 매출액을 종속변수, TV, Radio, Social Media의 예산을 독립변수로 하여 회귀분석을 수행하였을 때, 세 개의 독립변수의 회귀계수를 큰 것에서부터 작은 것 순으로 기술하시오. 
*분석 시 결측치가 포함된 행은 제거한 후 진행하며, 회귀계수는 소수점 넷째 자리 이하는 버리고 소수점 셋째 자리까지 기술하시오. (답안 예시) 0.123*

```python
# 방법 1
from sklearn.linear_model import LinearRegression
q1 = data.dropna()
var_list = ['TV', 'Radio', 'Social_Media']
lm = LinearRegression(fit_intercept=True)
lm.fit(q1[var_list], q1['Sales'])
lm.intercept_
lm.coef_
# [ 3.56256963, -0.00397039,  0.00496402]

# 방법 2
from statsmodels.formula.api import ols
form = 'Sales~'+'+'.join(var_list)
lm2 = ols(form, q1).fit()
round(lm2.params.drop('Intercept').sort_values(ascending=False), 3)
# TV              3.563
# Social_Media    0.005
# Radio          -0.004
```

​	마지막 문제는 회귀분석을 수행하는 것이다. 회귀계수를 구해 큰 것부터 작은 순으로 기술하는 문제인데, 회귀분석 방법은 두 가지 방법이 있다. 하나는 LinearRegression()을 사용하고, 다른 방법은 ols() 방법을 사용한다.

​	절차를 보면 우선 dropna()로 결측값을 제거한다. 그리고 독립변수를 변수에 담는다. 그리고 Linear 함수를 인스턴스화 시킨 다음 fit()으로 학습을 시킨다. intercept_ 는 절편을 보는 것이고, coef_ 가 회귀계수를 확인한다.

​	ols()는 form을  x 값으로 넣는다. 그래서 form을 지정해 줘야 하는데, 이때 정해진 구조를 잘 알고 있자. 그리고 ols() 함수에 변수들을 넣고 fit() 함수로 학습시킨다. 그리고 정답을 도출하기 위해 마지막 코드로 내림차순 정렬하여 큰 값부터 추출한다.