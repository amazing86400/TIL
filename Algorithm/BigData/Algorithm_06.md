# 원형 Queue



### 정의 및 특징

- 순차 큐를 구부려서 끝을 이은 원형 큐

- 오버헤드가 발생하지 않는다.
- 데이터도 완전하게 사용할 수 있다.
- 데이터가 많다면 원형 queue를 사용하자.
- 한 칸을 사용하지 못한다.



---



### 초기화

```python
SIZE = 5
queue = [None for _ in range(SIZE)]
front = rear = 0
```

​	일반 queue와 달리 원형 queue는 front와 rear가 이어져있기 때문에 -1은 뒤로 돌아간다. 그래서 초기화를 시키려면 둘의 값을 0으로 설정해 주자.



---



### isQueueEmpty

```python
def isQueueEmpty():
    global SIZE, queue, front, rear
    if (front == rear):
        return True
    else:
        return False
```

​	queue가 빈 경우인데, queue와 동일하다.



---



### isQueueFull

```python
def isQueueFull():
    global SIZE, queue, front, rear
    if ((rear+1) % SIZE == front):
        return True
    else:
        return False
```

​	원형큐는 전체에서 한 칸을 낭비하게 된다. 원형 큐가 한 칸만 빼고 다 찼을 때 하나 더 추가하게 되면 front와 rear가 같아지게 되어 조건문에 따라 꽉 찼다고 반환된다. 그래서 한 칸이 빈 것이 꽉 찬것이다(rear+1 == front). [0,1,2,3,4]가 있을 때, 4 다음은 0이 되는 식이다. 여기서 주의해야할 게 만약 일반 queue문 처럼 rear+1 == front라고 해주면 마지막 차례에서 4다음은 0이기 때문에 둘은 값이 같아지게 된다. 그래서 rear+1에 배열 전체(SIZE)를 나눈 몫이 front와 같다고 설정해 준 것이다.



---



### enQueue

```python
def enQueue(data):
    global SIZE, queue, front, rear
    if (isQueueFull()):
        print('꽉 찼어요!')
        return
    rear = (rear + 1) % SIZE  # 맨 마지막을 만나면 0이 되도록 작동
    queue[rear] = data
```

​	enQueue 함수도 일반 queue에서와 유사한데, 차이점이 있다면 rear에 1을 추가한 뒤 SIZE로 나누는 것이다.



---



### deQueue

```python
def deQueue():
    global SIZE, queue, front, rear
    if (isQueueEmpty()):
        print('비어있어요!')
        return None
    front = (front + 1) % SIZE
    data = queue[front]
    queue[front] = None
    return data
```

​	마찬가지로 deQueue 역시 front에 1을 더하고 SIZE로 나눠준다.
