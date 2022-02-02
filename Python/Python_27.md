# List 연습문제



### 연습문제 1
​	다음은 학생 별 [국어,영어,수학]점수가 저장된 리스트이다. score_list = [[96,84,80],[96,86,76],[76,95,83],[89,96,69],[90,76,91]]

​	각 학생의 세 과목의 성적의 [총점, 평균]을 구하여 리스트에 담으시오. (평균은 반올림하여 소수점 1자리까지 표현한다.)

```python
stu_scores = []

for i in score_list:
    total = sum(i)
    avg = round(sum(i) / 3)
    stu_scores.append([total, avg])
```



---



### 연습문제 2

​	다음은 학생 별 [국어,영어,수학]점수가 저장된 리스트이다. score_list = [[96,84,80],[96,86,76],[76,95,83],[89,96,69],[90,76,91]]

​	각 과목의 리스트를 분리하고 과목별 평균을 구해봅시다. 평균은 소수점 1자리까지 출력한다.

```python
kor = []
eng = []
math = []

for i in score_list:
    kor.append(i[0])
    eng.append(i[1])
    math.append(i[2])
    
kor = round(sum(kor) / len(kor), 1)
eng = round(sum(eng) / len(eng), 1)
math = round(sum(math) / len(math), 1)
```



---



### 연습문제 3

​	메뉴를 입력받아 랜덤으로 메뉴를 정하는 프로그램을 작성해봅시다. 공백('')을 입력할 때까지 메뉴를 입력받습니다.

```python
import random

menu_list = []

while True:
    menu = input('메뉴: ')
    if menu == '':
        break
    menu_list.append(menu)
    
random.choice(menu_list)
```

