# Queue



### 정의 및 특징

- 먼저 들어간 것이 먼저 나오는 구조를 의미(FIFO)(LILO)

- 양쪽이 뚫린 구조
- 입구와 출구가 따로 있는 원통 형태
- Data 양이 많다면 오버헤드가 발생한다.
- ex) ATM기, 기차 터널



---



### 구조와 용어

- 큐에 data를 삽입하는 작동 : enQueue(인큐) 

- data를 추출하는 작동 : deQueue(데큐) 

- 저장된 data 중 첫 번째 data : front(머리)

- 저장된 data 중 마지막 data : rear(꼬리)



---



### enQueue 기본 구조

```python
# queue = [None, None, None, None, None]
# front = rear = -1
>>> SIZE = 5
>>> queue = [None for _ in range(SIZE)]
>>> front = rear = -1
...
>>> rear += 1
>>> queue[rear] = '제니'
...
>>> rear += 1
>>> queue[rear] = '지수'
...
>>> rear += 1
>>> queue[rear] = '로제'
...
>>> print('출구<--', queue, '<--입구')
출구<-- ['제니', '지수', '로제', None, None] <--입구
```

​	큐와 스택의 구조는 배열로써, 동일하다. 즉, 어떻게 조작하냐에 따라 stack과 queue로 구분하는 것이다. None 값으로 5개의 배열을 만들어주고, rear을 1 추가해 데이터를 추가한다. 제니, 지수, 로제 순으로 추가했다.



---



### deQueue 기본 구조

```python
>>> front += 1
>>> data = queue[front]
>>> queue[front] = None
...
>>> front += 1
>>> data = queue[front]
>>> queue[front] = None
...
>>> front += 1
>>> data = queue[front]
>>> queue[front] = None
...
>>> print('출구<--', queue, '<--입구')
출구<-- [None, None, None, None, None] <--입구
...
>>> print(front, rear)
2 2
```

​	deQueue는 반대로 front를 1씩 추가하면 된다. 그리고 data를 queue의 front 값으로 하고 front 값을 깔끔하게 None 해준다.



---



### isQueFull()

```python
>>> def isQueueFull():
>>>     global SIZE, queue, front, rear
>>>     if (rear == SIZE-1):
>>>         return True
>>>     else:
>>>         return False
...
>>> queue = ['제니','지수','로제','리사','사나']
>>> front = -1
>>> rear = 4
,,,
>>> print(isQueueFull())
True
```

​	꽉 찼는지 확인하는 함수다. 꽉 찼으면 넣을 수 없기 때문에 인큐하기 전 확인을 해줘야 한다. global은 변수가 4개여서 약속으로 넣어줬다. 풀이하자면 만약 꼬리(rear)가 배열 안 인자 총개수(SIZE -1)와 같다면 True를 반환하고, 아니면 False를 반환해라. 제니, 지수, 로제, 리사, 사나 이렇게 총 5명이라고 가정하고, front와 rear의 위치도 알맞게 설정했다. 그리고 print 해보니 True가 나왔으면 잘 된 거다.



---



### enQueue

```python
>>> def enQueue(data):
>>>     global SIZE, queue, front, rear
>>>     if (isQueueFull()):
>>>         print('꽉 찼어요!') # 안해줘도 되지만 이뻐보이기 위해
>>>         return
>>>     rear += 1  # 꼬리 증가
>>>     queue[rear] = data  # 꼬리에 데이터 입력
...    
>>> queue = ['제니','지수','로제','리사',None]
>>> front = -1
>>> rear = 3
...
>>> enQueue('사나')
>>> print('출구<--', queue, '<--입구')
출구<-- ['제니', '지수', '로제', '리사', '사나'] <--입구
>>> enQueue('지효')
>>> print('출구<--', queue, '<--입구')
꽉 칬어요!
출구<-- ['제니', '지수', '로제', '리사', '사나'] <--입구
```

​	enQueue는 삽입(추가) 하는 함수이다. 우선 global과 isQueueFull 조건문을 입력하고, 만약 조건이 False라면 꼬리(rear)를 하나 추가해 그 자리에 data를 넣으라는 의미다. 제니부터 리사까지 4명으로 가정하고 사나를 추가했다. 그리고 지효를 또 추가하려 했더니 꽉 찼다는 메시지가 나온다.



---



### isQueueEmpty

```python
>>> def isQueueEmpty():
>>>     global SIZE, queue, front, rear
>>>     if (front == rear):
>>>         return True
>>>     else:
>>>         return False
```

​	isQueueEmpty는 queue가 비었는지 확인하는 함수다. queue가 비었는지는 front와 rear의 관계를 보면 된다. 만약 둘의 관계가 같다면 queue가 비었다는 것을 의미한다.



---



### deQueue

```python
>>> def deQueue():
>>>     global SIZE, queue, front, rear
>>>     if (isQueueEmpty()):
>>>         print('비었어요!')
>>>         return None
>>>     front += 1
>>>     data = queue[front]
>>>     queue[front] = None
>>>     return data
...

```

​	dequeue는 data를 추출하는 함수다. 그래서 우선 queue가 비었는지 확인을 한 다음, 조건이 False 이면 앞서 배운 dequeue 기본 구조를 사용하면 된다.



---



### peek

```python
>>> def peek():
>>>     global SIZE, queue, front, rear
>>>     if (isQueueEmpty()):
>>>         print('비었어요!')
>>>         return None
>>>     return queue[front+1]
...
>>> queue = ['제니', '지수', None, None, None]
>>> front = -1
>>> rear = 1
...
>>> retData = peek()
>>> print('다음 준비 손님 ==> ', retData)
다음 준비 손님 ==>  화사
```

​	peek은 확인만 하는 함수다. 잘 알아둬야 하는 게 front의 위치인데, front는 지정한 위치의 앞에 있다고 생각하면 된다. 그래서 만약 제니가 0 위치에 있다면 front는 -1이다. queue가 비었으면 None으로 return을 하고, 그렇지 않으면 front에 1을 더한 값(front 바로 뒤에 있는 값)을 확인할 수 있다.



---



### isQueueFull 최종

```python
def isQueueFull():
    global SIZE, queue, front, rear
    if (rear != SIZE-1):
        return False
    elif (rear == SIZE-1) and (front == -1):  # 진짜 꽉찬상태
        return True
    else:
        for i in range(front+1, SIZE, 1):
            queue[i-1] = queue[i]
            queue[i] = None
        front -= 1
        rear -= 1
        return False
```

​	queue의 배열이 처음부터 순서대로 있으면 아주 좋을 것이다. 하지만 항상 그렇진 않다. 만약 [None, None, '제니', '지수', '로제'] 이렇게 있을 때, front는 1이고 rear는 4일 것이다. 이 기준으로 기존의 isQueueFull 함수를 써주면 꽉 찬 상태로 결과를 반환한다. 그 이유는 기존에는 rear를 SIZE-1과 같다고 조건을 주었기 때문이다. 이럴 경우를 대비해서 위의 코드를 수정했다.

​	rear가 SIZE-1 과 같지 않다면 가득 차지 않는 것이기에 False를 반환하고, SIZE-1 과 rear가 같고, front와 -1이 같다면 하나도 빠짐없이 완전히 꽉 찬 상태이다. 이때 True를 반환하는 것이다. 마지막으로 for문을 돌려 false 일 때 순서를 하나씩 당기는 작업을 해준다. i를 front의 +1부터 SIZE까지 하나씩 이동하는데 queue[i]는 그럼 제니가 되고, queue[i-1]은 빈칸이니까 빈칸에 제니를 넣고 원래 제니 자리는 None으로 설정한다. 그리고 하나씩 앞당겨진 만큼 front와 rear도 앞당겨주자.
