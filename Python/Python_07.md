# random 함수



### random 함수란

```python
import random
```

​	파이썬에서 random 관련한 함수들을 모아놓은 모듈이다. random() 함수를 사용하려면 'import random'을 해줘야 한다. 그리고 random() 함수는 다양한 세부 함수가 있는데, 자주 사용하는 것으로 정리할 계획이다.



---



### random.random()

```python
>>> import random
>>> a = random.random()
>>> print(a)
...
0.8306538540775784
```

​	**random.random()** 함수는 0.0부터 1.0 사이의 **실수(float)**를 반환한다. 정확히는 1.0을 포함하지 않는 **0.0 <= a < 1.0** 이다.



---



### random.uniform(a,b)

```python
>>> import random
>>> a = random.uniform(1, 5)
>>> print(a)
...
3.869984109303195
```

​	**random.uniform(a,b)** 함수는 매개변수 a와 b 사이의 **실수(float)**를 반환한다. 즉 **1 <= a <= 5**라고 생각하면 된다.



---



### random.randint(a,b)

```python
>>> import random
>>> a = random.randint(1, 5)
>>> print(a)
...
4
```

​	**random.randint(a,b)** 함수는 uniform 함수와 매우 유사하다. 다만 결괏값을 **정수(int)**로 반환한다는 점에서 uniform 함수와 차이가 있다.



---



### random.randrange(a,b)

```python
>>> import random
>>> a = random.randrange(2,10)
>>> print(a)
9

>>> b = random.randrange(10)
>>> print(b)
0
```

​	**random.randrange(a,b)** 함수는 매개변수 a부터 b-1 사이의 수를 정수(int)로 반환한다. 즉, b를 포함하지 않는다는 것이다. 앞서 본 randint와 차이점이다. 그리고 만약 매개변수를 하나만 써준다면 0부터 매개변수 사이의 숫자를 반환한다. 



---



### random.choice(seq)

```python
>>> import random
>>> a = random.choice('hihello')
>>> print(a)
'e'

>>> b = random.choice('')
>>> print(b)
indexError
```

​	**random.choice(seq)** 함수는 매개변수로 시퀀스(seq) 타입을 받는다. 시퀀스 타입이란 문자열, 튜플, range, list 타입을 말한다. 그리고 seq 타입에서 무작위로 하나의 원소를 뽑아 반환한다. 만약 비어있는 시퀀스 타입의 객체를 인자로 넣으면 indexError가 발생한다.



---



### random.rand(a,b)

```python
>>> import random
>>> import numpy as np
>>> a = np.random.rand(3,3)
>>> print(a)
[[0.04132677 0.23777224 0.02430994]
 [0.55064248 0.74516377 0.39568568]
 [0.37961111 0.37205553 0.06490052]]

>>> b = np.random.rand(2,4)
>>> print(b)
[[0.3076609  0.85467999 0.15178242 0.7100089 ]
 [0.55558668 0.54728713 0.46040863 0.52492163]]
```

​	넘파이에도 random 함수가 있는데, 그중 rand 함수는 매개변수 a와 b를 행과 열 형태로 배열을 만들어 그 사이를 균일 분포(0~1 사이 숫자)에서 무작위로 채운다. 이 함수는 numpy 라이브러리를 불러와야 한다는 것을 잊지 말자. 