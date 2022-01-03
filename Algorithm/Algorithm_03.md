# 단순 연결 리스트



### 정의

- Node(데이터 + 링크)들이 물리적으로 떨어진 곳에 위치한다.

- 각 node의 번지는 순차적이지 않다. (선형 리스트는 순차적)

- 화살표로 표시된 링크(Link)를 따라가면 선형 리스트 순서와 같다.



---



### 필요성

 선형 리스트의 경우 많은 작업이 필요하다. 하지만 단순 연결 리스트는 해당 node의 앞뒤 링크만 수정하면 되기 때문에 오버헤드가 거의 발생하지 않는다.

오버헤드: 되기는 되지만, 오랜 시간이 걸림. error는 아니다. 



---



### Node 생성

```python
class Node():  # Node는 아무 단어나 정해서 써도된다. 그런데 첫 글자는 대문자를 쓰자.(관례)
    def __init__(self):
        self.data = None
        self.link = None
        
node1 = Node()
node1.data = '다현'    

node2 = Node()
node2.data = '정연'
node1.link = node2

node3 = Node()
node3.data = '쯔위'
node2.link = node3

node4 = Node()
node4.data = '사나'
node3.link = node4

node5 = Node()
node5.data = '지효'
node4.link = node5
```

 일단 class 코드 내용은 우리의 약속이므로 이해하며 외우도록 하자. None으로 설정한 이유는 새로운 값을 넣기 위한 빈칸을 만들었다고 생각하자.



```python
>>> current = node1
>>> print(current.data,end= '')
>>> while current.link != None:
...     current = current.link
...     print(current.data,end= '')
...    
다현정연쯔위사나지효
```

 current는 현재 작업 중인 위치를 의미한다. current를 node1(다현)으로 설정하고, while 반복문을 돌려 하나씩 요소를 반환할 것이다. 조건은 current.link가 None 값이 아닐 때까지로 설정한다. current에 current.link를 삽입한 것은 현재 node를 현재 node의 링크가 가리키는 node로 변경하는 것을 의미한다. 그래서 순차적으로 결과를 받을 수 있다.



---



### 실무 버전

```python
>>> memory = []
>>> head, current, pre = None, None, None
>>> dataArray = ['다현','정연','쯔위','사나','지효']
...
>>> node = Node()  # 첫 node
>>> node.data = dataArray[0]
>>> head = node
>>> memory.append(node) # 이 함수는 빼도 됨. 나머지가 중요함
...    
>>> for data in dataArray[1:] :  # 첫번째 제외 나머지 다
...     pre = node
...     node = Node()
...     node.data = data
...     pre.link = node
...     memory.append(node)
...    
>>> printNode(head)
다현 정연 쯔위 사나 지효
```

 memory는 값을 기억하기 위함이다. 그리고 처음에 모두 비어 있으면 되기 때문에 head(첫 번째 node), current(현재 처리 중인 node), pre(현재 처리 중인 node의 바로 앞 node) 모두 None으로 설정한다.

 이번엔 node로 통일할 것이다. node 값에 데이터 배열 첫 번째 값을 설정한다. 다현이 설정된다. 그리고 다현을 head로 설정한다. 다음으로 다현을 제외한 나머지를 대상으로 for문을 돌린다. pre를 다현으로 잡아주면 새로운 값을 넣을 수 있는 node = Node() 코드를 실행할 수 있다. 그래서 새 node에 새로운 data(정연)를 넣고, pre를 다시 정연으로 지정한다. 이 내용을 반복하는 것이다.

 이 코드는 실무에서 유용하게 쓸 수 있을 것이다. 지금은 하나씩 값을 입력하고, 양이 적지만 실무에서는 많기 때문에 잘 활용할 수 있다.



---



### Node 삽입

1단계: node 생성

2단계: 링크 수정

```python
newNode = Node()
newNode.data = '미나'
newNode.link = node2.link
node2.link = newNode

다현정연미나쯔위사나지효
```

 새 node를 생성한다. 그리고 새 node의 링크를 정연 node의 링크를 복사한다. 그러면 정연과 미나의 링크는 쯔위를 가리킨다. 그리고 정연 node의 링크를 미나로 지정한다.



---



### 첫 번째 node 삽입

```python
>>> def insertNode(findData, insertData):
>>>     global memory, head, current , pre
>>>     if head.data == findData: # 첫 node 앞에 삽입할 때
...         node = Node()
...         node.data = insertData
...         node.link = head
...         head = node
...         memory.append(node)
...         return
...    
>>> insertNode('다현','화사')
화사다현정연쯔위사나지효
```

  global은 약속이다. if문을 풀이하면, head의 값이 findData(다현)이면 새로운 node에 삽입할 값(화사)을 넣어주고 link를 head로 지정해 줌으로써 화사의 링크가 head와 같아진다. 그리고 head를 화사로 설정해 주면 첫 번째 삽입이 완료된다. 



---



### 중간 node 삽입

```python
>>> def insertNode(findData, insertData):
>>>     global memory, head, current , pre
>>>     if head.data == findData: # 첫 node 앞에 삽입할 때
...         node = Node()
...         node.data = insertData
...         node.link = head
...         head = node
...         memory.append(node)
>>>         return
...
>>> current = head
>>>     while current.link != None:
...         pre = current
...         current = current.link
>>>         if current.data == findData:
...             node = Node()
...             node.data = insertData
...             node.link = current
...             pre.link = node
...             memory.append(node)
>>>             return
...
>>> insertNode('사나','솔라')
화사 다현 정연 쯔위 솔라 사나 지효 
```

 current를 head로 지정하고 None일 때까지 반복한다. pre를 current로 지정하면 current를 새로 지정할 수 있다. current를 link로 지정을 해서 다음 node로 이동할 수 있게 설정한다. if문은 만약 current data 값이 찾을 값(사나)이라면  새로운 노드(솔라)를 생성해 link를 current로 지정하라는 의미다. 그러면 솔라의 link는 사나를 가리키게 된다. 그리고 pre의 link는 node(솔라)를 가리키도록 설정한다.



---



### 마지막 node 삽입

```python
>>> def insertNode(findData, insertData):
>>>     global memory, head, current , pre
>>>     if head.data == findData: # 첫 node 앞에 삽입할 때
...         node = Node()
...         node.data = insertData
...         node.link = head
...         head = node
...         memory.append(node)
>>>         return
...
>>> current = head
>>>     while current.link != None:
...         pre = current
...         current = current.link
>>>         if current.data == findData:
...             node = Node()
...             node.data = insertData
...             node.link = current
...             pre.link = node
...             memory.append(node)
>>>             return
...
>>> node = Node()
...     node.data = insertData
...     current.link = node
...     memory.append(node)
>>>     return
...
>>> insertNode('제니','문별')
화사 다현 정연 쯔위 솔라 사나 지효 문별
```

 만약 찾을 값(제니)를 찾지 못했다면 새로운 node를 생성하고 문별을 값으로 넣어준다. 그리고 current link를 문별로 설정하면 된다.



---



### Node 삭제

1단계: 링크 수정

2단계: node 삭제

```python
node2.link = node3.link
del(node3)
```

 link를 다음 node의 link로 복사를 해 준 뒤, node3을 삭제하면 된다.



---



### 첫 번째 node 삭제

```python
>>> def deleteNode(deleteData):
>>>     global memory, head, current , pre
>>>     if deleteData == head.data:
...         current = head
...         head = head.link
>>>         del(current)
>>>         return
...
>>> deleteNode('화사')
다현정연쯔위솔라사나지효문별
```

  global은 약속! 만약 삭제할 값(화사)이 head data라면 current를 head로 지정해 주고 head를 head의 link(다현)로 지정한다. 그러면 current는 화사가 될 것이고 head는 다현이 될 것이다. 그런 다음 current를 삭제해 주면 된다.



---



### 첫 node 외의 node 삭제

```python
>>> def deleteNode(deleteData):
>>>     global memory, head, current , pre
>>>     if deleteData == head.data:
...         current = head
...         head = head.link
>>>         del(current)
>>>         return
...
...    
>>>     current = head
>>>     while current.link != None:
...         pre = current
...         current = current.link
>>>         if current.data == deleteData:
...             pre.link = current.link
>>>             del(current)
>>>             return
...
>>> deleteNode('쯔위')
다현정연솔라사나지효문별
```

 current를 head로 설정하고 whlie문을 통해 link가 None일 때까지 반복한다. 그런 다음 pre를 current로 설정해서 current의 값을 link로 설정해 주고 조건문을 작성한다. 만약 current의 값이 삭제할 값(쯔위)이라면 pre(정연)의 link를 current(쯔위)의 link()로 복사하고 current(쯔위)를 삭제한다. 그러면 쯔위만 삭제되어 결과가 나온다.



---



### Node 검색

```python
>>> def findNode(findData):
>>>     global memory, head, current, pre
...     current = head
>>>     if current.data == findData:
>>>         return current
>>>     while current.link != None:
...         current = current.link
>>>         if current.data == findData:
>>>             return current
>>>     return Node()
...
>>> fNode = findNode('다현')
>>> print(fNode.data)
다현

>>> fNode = findNode('사나')
>>> print(fNode.data)
사나

>>> fNode = findNode('제니')
>>> print(fNode.data)
None
```

 일단 current를 head로 설정해 준다. 우선 현재 node가 검색할 데이터인지 확인한다. 아니라면 current의 link가 None이 아닐 때까지 반복할 건데, current를 하나씩 이동할 수 있게 link로 설정한다. 그리고 하나씩 찾아간다. 만약 검색 값이 없으면 None으로 결과를 반환한다.
