# Dictionary 활용 영어 단어장



### 1. 단어장 만들기

```python
voca = {}
while True:
    word = input('영어단어, 뜻: ')
    if word == '':
        break
    
    else:
        eng = word.split(',')[0]
        kor = word.split(',')[1]
    
    voca[eng] = kor.strip()
```

​	무한루프 생성한 뒤, input() 함수로 영단어와 뜻을 받는다. 그리고 word가 없으면 break 하는 if문 조건을 입력한다. 만약 입력값이 있으면 split으로 나눠서 각각 eng와 kor에 추가해 voca 딕셔너리에 추가한다. 이때 strip()을 통해 공백을 제거해 준다.



---



### 2. 테스트하기

```python
count = 0

for eng, kor in voca.items():
    answer = input(eng)
    if answer == kor:
        print('참 잘했어요~')
        count += 1
    else:
        print('아쉬워요~')
```

​	for문을 돌려 key와 value의 값이 일치하는지를 확인한다. input(eng)로 하면 key 값이 반환되는데, 이것이 kor의 value와 연결된 항목이면 '참 잘했어요~'라는 문구와 함께 count를 1 증가시켜 맞은 개수를 측정한다.



---



### 3. 점수 확인하기

```python
>>> print(count, len(voca), round(count/len(voca)*100, 1),sep='|')
3|4|75.0
```

​	전체 문제 중 얼마나 맞혔는지를 확인하고, 점수로 나타내보는 코드다. 얼마나 맞혔는지는 count를 출력하면 확인 가능할 것이고, len() 함수를 사용하면 전체 문제 개수를 확인할 수 있다. 그리고 전체 문제에서 맞힌 문제를 나누고, 100을 곱하면 점수가 나올 것이다. 그리고 보기 좋게 round() 함수를 사용해 반올림했다. 구분자는 '|'로 지정했다.