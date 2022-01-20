# 정렬(sort)



### 개념

​	중요 알고리즘 중 하나인 정렬(Soft)은 자료들을 일정한 순서대로 나열한 것



---



### 종류

- 선택 정렬(Selection Sort)

- 삽입 정렬(Insertion Sort)

- 버블 정렬(Bubble Sort)

- 퀵 정렬(Quick Sort)



​	정렬 방법은 수십가지인데, 오름차순 정렬이든 내림차순 정렬이든 결과의 형태만 다를 뿐이지 같은 방식으로 처리된다. 따라서 가장 간단한 선택정렬을 하고, 양이 많다면 퀵 정렬을 사용하자.



---



### 선택 정렬_최솟값 찾기

```python
>>> testAry = [55,77,21,77]
...
>>> def findMinIndex(ary):
>>>     minIdx = 0
>>>     for i in range(1, len(ary)):
>>>         if (ary[minIdx] > ary[i]):
>>>             minIdx = i
...            
>>>     return minIdx
...
>>> minPos = findMinIndex(testAry)
>>> print('제일 작은 값--> ', testAry[minPos])
21
```

​	선택 정렬은 여러 데이터 중에서 가장 작은 값을 뽑아서 정렬하는 방식이다. array를 만들어 준다음 함수를 만들 것이다. 가장 작은 값을 minIdx로 지정할 것이다. 그리고 for문을 1번부터 배열 마지막까지 돌린다. 그래서 minIdx와 ary[1]을 비교해서 ary가 작다면 그거를 minIdx로 바꿔준다. 그리고 그 값을 리턴한다.



---



### 선택 정렬_정렬

```python
>>> dataAry = [random.randint(1,99) for _ in range(20)]
...
>>> import random
...
>>> def selectionSort(ary):
>>>     n = len(ary)
>>>     for i in range(0, n-1): # 0, 1, 2(i가 제일 작은값)
>>>         minIdx = i
>>>         for k in range(i+1, n):
>>>             if (ary[minIdx] > ary[k]):
>>>                 minIdx = k
>>>         ary[i], ary[minIdx] = ary[minIdx], ary[i]    
>>>     return ary
...
>>> print('정렬 전 -->', dataAry)
>>> dataAry = selectionSort(dataAry)
>>> print('정렬 후 -->', dataAry)
정렬 전 --> [75, 23, 62, 49, 97, 60, 33, 11, 33, 6, 82, 28, 4, 19, 67, 53, 23, 62, 51, 43]
정렬 후 --> [4, 6, 11, 19, 23, 23, 28, 33, 33, 43, 49, 51, 53, 60, 62, 62, 67, 75, 82, 97]
```

​	random 함수를 불러오고 배열을 random함수를 통해 정수 20개만 뽑는다. n은 배열 인자 개수로 설정해서 20이다. 그리고 for문을 0부터 n-1을 하는 이유는 마지막은 2개가 한 쌍으로 되어 있기때문에 1을 빼줘야한다. 일단 i를 가장 작은 값으로 설정해준다. 그리고 다음 for문을 지금 값의 다음부터로 돌리고, i와 비교한다. 그래서 둘 중 더 작은 값을 최솟값으로 지정한다. 