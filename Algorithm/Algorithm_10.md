# 검색



### 개념

- '검색’은 정렬된 상태에서 빠르게 원하는 것을 찾는 것이다.



---



### 순차 검색

```python
import random

dataAry = [ random.randint(1,99) for _ in range(20)]
findData = dataAry[random.randint(0,len(dataAry)-1)]

def seqSearch(ary, fData):
    pos = -1
    size = len(ary)
    for i in range(size):
        if ary[i] == fData:
            pos = i
            break
    return pos

print('배열-->', dataAry)
position = seqSearch(dataAry, findData)
if position == -1 :
    print(findData, ' 없습니다.');
else :
    print(findData, ':', position, ' 위치에 있음')
```



정렬되지 않은 집합의 순차 검색 원리와 구현