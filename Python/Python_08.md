# 조건문 연습문제



### 다음 코드의 결괏값을 말하시오.

```python
a = "Life is too short, you need python"

if "wife" in a: print("wife")
elif "python" in a and "you" not in a: print("python")
elif "shirt" not in a: print("shirt")
elif "need" in a: print("need")
else: print("none")
```

 정답은 'shirt'이다. 하나씩 살펴보면, 첫 번째는 wife가 a 문자열에 없다. 두 번째 조건은 and로 조건 두 개 모두 만족해야 한다. 하지만 전자는 참이지만 후자의 조건이 거짓이라 다음으로 넘어갔다. 세 번째 조건은 shirt라는 단어가 없으면 shirt를 print 하라는 의미이다. 조건이 참이므로 shirt가 출력된다. 이미 조건이 참이므로 뒤에 조건은 안 봐도 된다.



---



### while문을 사용해 1부터 1000까지의 자연수 중 3의 배수의 합을 구하시오.

```python
>>> result = 0
>>> i = 1
>>> while i <= 1000:
>>>     if i % 3 == 0:
>>>         result += i
>>>     i += 1
>>> print(result)
...
166833
```

 이 조건문은 3의 배수를 알아내는 변수와 그 합을 구하기 위한 변수를 만들어 줬다. 먼저 1000까지의 자연수기 때문에 1000 이하로 조건을 줬고, 3의 배수를 알아내기 위해 i를 3으로 나누고 그 값이 0인 것을 참으로 설정했다. 그리고 참일 때마다 result 변수에 i 만큼 증가하도록 했다. 그리고 i도 하나씩 증가해야 1000까지 계산이 가능하므로 if문 밖에서 코드를 입력했다.



---



### while문을 사용하여 다음과 같이 나타내라.

```python
*
**
***
****
*****
```



```python
i = 0
while i < 5:
    i += 1
    print('*'*i)
    
i = 0
while True:
    i += 1
    if i > 5:
        break
    print('*'*i)
```

 2가지 방법으로 나왔는데, 첫 번째 코드는 정말 단순하게 짜봤다. i를 5보다 작다고 지정하고 1씩 증가하도록 했다. 그리고 i 만큼 *을 print 하도록 했다. 두 번째 방법은 무한 루프를 사용한 방법이다. 동일하게 i를 1씩 증가하도록 하고, i가 만약 5를 넘는다면 break 하도록 설정했다.



---



### for문을 사용해 1부터 100까지의 숫자를 출력하라.

```python
for i in range(1, 101):
    print(i)
```

 range() 함수를 사용해 1부터 100까지 출력하도록 했다. y-1 임을 잊지 말자.



---



### for문을 사용하여 A 학급의 평균 점수를 구하라.

```python
>>> A = [70, 60, 55, 75, 95, 90, 80, 80, 85, 100]
>>> total = 0
>>> for i in A:
>>>     total += i
>>> print(total / len(A))
79.0

>>> A = [70, 60, 55, 75, 95, 90, 80, 80, 85, 100]
>>> total = 0
>>> for i in A:
>>>     total += i
>>> average = total / len(A)
>>> print(average)
79.0
```

 이 문제도 2가지 방법으로 짜봤다. 두 코드는 거의 동일한데, 마지막에 변수로 묶어서 print 하느냐의 차이다. for문을 통해 A 리스트 요소를 하나씩 total에 추가하고 print 할 때 len() 함수를 써서 A의 전체 요소로 나눈 값, 즉 평균을 구할 수 있었다.



---



### 아래 코드를 리스트 내포(list comprehension)를 사용하여 표현하라.

```python
>>> numbers = [1, 2, 3, 4, 5]
>>> result = []
>>> for n in numbers:
>>>     if n % 2 == 1:
>>>         result.append(n*2)
>>> print(result) 
...
[2, 6, 10]
```



```python
>>> numbers = [1, 2, 3, 4, 5]
>>> result = [n*2 for n in numbers if n % 2 == 1]
>>> print(result)
...
[2, 6, 10]
```

 내포하기는 매우 편리한 기능이니까 꼭 알아두자.