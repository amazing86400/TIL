# Stack



### Stack 구조

- 한쪽 끝이 막힌 형태 >> 입구가 하나여서 먼저 들어간 것부터 가장 나중에 나오는 구조
- 선입후출, 후입선출
- ex) 프링글스, 콘 아이스크림, 종이컵



---



### Stack 원리

**기본 구조**

- 스택에 데이터를 삽입하는 작동 : push 

- 스택에 데이터를 추출하는 작동 : pop 

- 스택에 들어 있는 가장 위의 데이터 : top



---



### push

```python
# stack = [None, None, None, None, None]
SIZE = 5
stack = [None for _ in range(SIZE)]  # _ = i, 변수 없이 작동하는 문법
top = -1  # stack 초기화
```

​	우선 stack을 만들어 줄 건데 크기를 5로 설정한다. top이 -1이라는 것은 stack에서 아무것도 있지 않다는 것을 의미한다. 만약 stack이 0이면 첫 번째 칸에 있다는 의미이다.



```python
>>> top += 1
>>> stack[top] = '커피'
>>> top += 1
>>> stack[top] = '녹차'
>>> top += 1
>>> stack[top] = '꿀물'
...
>>> print(stack)
['커피', '녹차', '꿀물', None, None]
```

​	Top을 한 칸 올려주고(0), top에 커피를 넣어준다. 이런 식으로 top을 한 칸씩 올리고, top에 값을 삽입한다고 생각하면 된다.



---



### pop

```python
>>> data = stack[top]
>>> stack[top] = None
>>> top -= 1
...
>>> print('pop--> ', data)
```

​	Data를 top으로 설정해서 가장 위에 있는 값으로 지정한다. 그리고 top을 None으로 만들어주고, 한 칸씩 내려준다. print를 해보면 뺀 것을 확인할 수 있다.



---



### Stack 확인

```python
>>> def  isStackFull():
>>>     global SIZE, stack, top
>>>     if (top >= SIZE-1):
>>>         return True
>>>     else:
>>>         return False
...
>>> stack = ['커피', '녹차', '꿀물', '콜라', None]
>>> top = 4
>>> print('스택 꽉 찼는지 여부--> ', isStackFull())
스택 꽉 찼는지 여부-->  True
```

​	Stack은 data가 넘치면 안 된다. 그래서 stack의 상태를 확인할 수 있는 함수를 만들어 준다. global은 약속이니 외우자. top이 만약 SIZE-1(4) 이상이면 True를 반환하고, 아니면 False를 반환한다. 현재 stack이 4개이므로 결과가 True가 반환된 것이다. stack 역시 가장 아래 있는 것이 0부터 시작돼서 SIZE -1을 해야 가장 마지막 값이 나온다.



---



### Stack 삽입

```python
>>> def push(data):
>>>     global SIZE, stack, top
>>>     if (isStackFull()):
>>>         print('꽉 찼습니다..')
>>>         return
>>>     stack[top] += 1
>>>     stack[top] = data
...
>>> push('맥주')
꽉 찼습니다..
```

​	global은 약속이다. 만약 stack이 꽉 찼다면 다 찼다고 print 해주고, 아니라면 stack의 top을 한 칸 올린 다음 data를 넣어 준다.



---



### Stack 비어있는지 확인

```python
>>> def isStackEmpty():
>>>     global SIZE, stack, top
>>>     if (top == -1):
>>>         return True
>>>     else:
>>>         return False
...
>>> isStackEmpty()
False
```

​	만약 top이 -1이라면(top이 비었다면) True를 반환해라. 



---



### Stack 추출

```python
>>> def pop():
>>>     if (isStackEmpty()):
>>>         print('비어 있습니다.')
>>>         return None
>>>     data = stack[top]
>>>     stack[top] = None
>>>     top -= 1
>>>     return data
...
>>> print(pop())
커피
>>> print(pop())
비어 있습니다.
None
```

​	만약 stack이 비어 있다면 None과 문장을 print 하고, 아니라면 stak[top] 값을 반환하는데, top을 반환하면 None으로 지정한 다음 한 칸 내린다.