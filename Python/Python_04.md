# if문



### 학습 목표

- if문의 구조를 이해하고 코드를 직접 입력할 수 있다.



---



### 기본 구조

```python
if 조건문:
	수행할 문장1
    수행할 문장2
    ...
else:
    수행할 문장A
    수행할 문장B
    ...
```

​	기본 구조는 위와 같다. 참이면 if문 바로 다음 문장을 수행하고, 조건문이 거짓이면 else문 다음 문장을 수행한다. 즉, else문은 if문 없이 독립적으로 사용할 수 없다. 그리고 ':'와 들여쓰기를깜빡하지 말고 반드시 입력해주자.



```python
if 조건문:
	수행할 문장1
    수행할 문장2
  수행할 문장3
```

​	이렇게 쓰면 오류가 발생한다. 너비는 항상 같은 너비로 해야 한다. 들여쓰기는 탭(Tab)이나 공백(Spacebar)로 할 수 있는데, 2가지를 혼용해서 쓰지 말라. 혼용해서 쓰면 오류의 원인이 될 수 있다. *파이썬 커뮤니티에서는 공백(Spacebar) 4개를 사용하는 것을 권장한다.*



---



### 연산자

| 비교연산자 | 설명                  |
| ---------- | --------------------- |
| x < y      | x가 y보다 작다        |
| x > y      | x가 y보다 크다        |
| x == y     | x와 y가 같다          |
| x != y     | x와 y가 같지 않다     |
| x >= y     | x가 y보다 크거나 같다 |
| x <= y     | x가 y보다 작거나 같다 |



---



### 만약 5000원 이상의 돈을 가지고 있으면 밥을 사먹고 그렇지 않으면 집밥을 먹어라.

```python
>>> money = 5000
>>> if money >= 5000:
...     print('식당에서 사먹자')
... else:
...     print('집가서 집밥먹자')
...    
식당에서 사먹자
```

​	money가 5000원 이기 때문에 조건문에 True 결과를 반환받는다.



---



### and, or, not

| 연산자  | 설명                          |
| ------- | ----------------------------- |
| x or y  | x와 y 둘중 하나만 참이어도 참 |
| x and y | x와 y 모두 참이어야 참        |
| not x   | x가 거짓이면 참               |

 	not x 는 x가 거짓이면 참이라는 것을 명심하자.



---



### 돈이 5000원 이상 있거나 카드가 있다면 택시를 타고 그렇지 않으면 걸어 가라.

```python
>>> money = 2000
>>> card = True
>>> if money >= 5000 or card == True:
...     print('식당에서 사먹자')
... else:
...     print('집가서 집밥먹자')
...
식당에서 사먹자
```

 	money는 조건문에 부합되지 않지만 card가 True여서 or문이 참을 반환한다.



---



### in, not in

```python
>>> pocket = ['smartphone','money','cookie']
>>> if 'money' in pocket:
...     print('식당에서 사먹자')
... else:
...     print('집가서 집밥먹자')
...
식당에서 사먹자
```

​	파이썬에서는 in과 not in 조건문도 쓸 수 있다. x in list, x not in list 형태로 써주면 된다. list 안에 x라는 변수가 있으면 in문에서는 참이고 not in문에서는 거짓이다.



---



### 주머니에 돈이 있으면 밥을 사먹고, 주머니에 돈은 없지만 카드가 있으면 밥을 사먹고, 돈도 없고 카드도 없으면 집에 가라.

```python
>>> pocket = ['smartphone','cookie']
>>> card = False
>>> if 'money' in poket:
...     print('식당에서 사먹자')
... elif card:
...     print('식당에서 사먹자')
... else:
...     print('집가서 집밥먹자')
...
집가서 집밥먹자
```

​	조건문이 2개가 넘어가면 elif를 사용해보자. 매우 유용하다. if문 조건이 거짓이면 elif문 조건으로 넘어가고, elif문도 거짓이면 else문으로 넘어간다.