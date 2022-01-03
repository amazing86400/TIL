# Stack



### Stack 구조란

- 스택은 한쪽 끝이 막힌 형태이다.
- 입구가 하나이기 때문에 먼저 들어간 것이 가장 나중에 나오는 구조이다. (선입후출, 후입선출)
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

 우선 stack을 만들어 줄건데 크기를 5로 설정한다. top이 -1이라는 것은 stack에서 아무것도 있지 않다는 것을 의미한다. 만약 stack이 0이면 첫 번째 칸에 있다는 의미이다.



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

 top을 한 칸 올려주고(0), top에 커피를 넣어준다. 이런식으로 top을 한 칸씩 올리고, top에 값을 삽입한다고 생각하면 된다.



---



### pop

```python
>>> data = stack[top]
>>> stack[top] = None
>>> top -= 1
...
>>> print('팝-->', data)
```

 data를 top으로 설정해서 가장 위에 있는 값으로 지정한다. 그리고 top을 None으로 만들어주고, 한 칸씩 내려준다.





스택은 넘치면 안된다. 푸시를 무조건 하면 안되고 꽉 찼는지 확인 먼저하고 채운다. 꽉 찼는지 확인은 top을 통해 확인.



데이터를 넣을때(push)는 데이터를 정해서 할 수 있지만, 추출할 때(pop)는 어쩔 수 없이 마지막 거 부터 추출한다.