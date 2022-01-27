# Open cv_intro



### 학습 목표

- 이미지 파일을 원하는 사이즈와 컬러 타입으로 읽을 수 있다.
- 여러 이미지 파일을 전체 화면 사이즈로 슬라이드 쇼로 나타낼 수 있다.



---



### 라이브러리

```python
import numpy as np
import cv2
import sys
import matplotlib.pyplot as plt
import os
import glob
```

​	이미지 파일 데이터를 활용하기 위한 라이브러리를 불러온다. os와 glob은 슬라이드 쇼를 만들 때 사용하는데, 기능은 비슷하고 glob이 사용하기가 좀 더 편하다.



---



### 파일 읽기

```python
img = cv2.imread('./fig/cat.bmp')

if img is None:
    print('image read failed')
    sys.exit()

cv2.namedWindow('image')
cv2.imshow('image', img)
cv2.waitKey()
cv2.destroyAllWindows()
```

​	위 코드가 가장 기본이 되는 코드이다. 여기서 조금씩만 수정해서 사용하면 되겠다. 우선 코드를 하나씩 보면 cv2.imread() 함수는 사진 파일을 읽어오는 함수다. 여기서 만약 찾는 이미지 파일이 없을 경우를 대비해 if문을 넣어줬다. cv2 코드는 한번 오류 나면 어디서 났는지 확인하기가 어려워 이렇게 예외 처리를 미리 해주는 게 좋다. sys.exit()은 프로그램을 종료하는 함수다.

​	cv2.nameWindow() 함수는 이미지 창의 이름을 설정하는 함수다. 창이 열렸을 때 설정한 값이 왼쪽 상단에 표시된다. 그리고 imshow() 함수에 창 이름과 파일 자료를 넣어준다. 이미지 파일을 보여주는 코드다. 여기까지만 해서는 열리지 않는다. 반드시 밑에 두 코드는 입력해 줘야 한다. waitKey()는 창을 닫을 때 받는 키를 설정하는 함수이고, destroyAllWindows() 함수가 창을 닫는 함수이다. waitKey()를 따로 설정해 주지 않으면 사용자가 키를 누르기 전까지 이미지가 계속 열려져있다. 이때 아무 키나 누르면 창이 닫힌다.



---



### flags 설정

```python
cv2.imread('./fig/cat.bmp', cv2.IMREAD_COLOR)
cv2.imread('./fig/cat.bmp', cv2.IMREAD_GRAYSCALE)
cv2.imread('./fig/cat.bmp', cv2.IMREAD_UNCHANGED)
```

​	이미지 파일의 색상 타입을 설정하는 것이 flags이다. 따로 입력을 해주어 설정을 바꿀 수 있고, 만약 생략한다면 default 값으로 COLOR가 설정된다. GRAYSCALE은 흑백 사진이고, UNCHANGED 'alpha channel image'를 읽어올 때 사용한다. 알파 파일은 채널이 4개이기 때문이다.



---



### Size 조절

```python
img = cv2.imread('./fig/cat.bmp', cv2.IMREAD_REDUCED_COLOR_4)

if img is None:
    print('image read failed')
    sys.exit()
print(img.shape)

cv2.namedWindow('image')
cv2.imshow('image', img)
cv2.waitKey()
cv2.destroyAllWindows()
```

​	사이즈를 조절하는 방법은 몇 가지 있다. 위 코드는 사이즈가 큰 이미지 파일을 작게 나타낼 때 사용한다. 첫 번째 코드에서 flags만 cv2.IMREAD_REDUCED_COLOR_4로 설정해 주면 된다. 이미지 파일의 색상은 COLOR, GRAYSCALE 중에 선택할 수 있고, 사이즈는 2, 4, 8 중에 선택하면 된다. 8이 가장 작은 사이즈다.



```python
img = cv2.imread('./fig/cat.bmp')

if img is None:
    print('image read failed')
    sys.exit()

img_re = cv2.resize(img, (320,240), interpolation = cv2.INTER_AREA)
    
cv2.namedWindow('image')
cv2.imshow('image', img_re)
cv2.waitKey()
cv2.destroyAllWindows()
```

​	이번엔 사이즈를 직접 설정해 주는 방법이다. 코드 한 줄만 추가해 주면 된다. cv2.resize() 함수를 사용해 img 변수를 (사이즈) 만큼 바꿔주고, interpolation 옵션을 입력해 준다. interpolation은 뒤에 자세히 설명하겠다. 지금은 일단 적고 넘어가자.

​	나는 파일 사이즈를 기존의 절반으로 만들었다. 여기서 주의할 것은 현재 이미지 파일 타입을 보면 numpy array 형태이다. 그렇기 때문에 순서가 (r, c) 순으로 되어있다. 하지만 opencv는 (x, y) 순이기 때문에 둘의 순서가 반대이다. 그래서 코드를 입력할 때 주의해야 한다. 즉 파일 shape이 (480, 640, 3)일 때, (240, 320)이 아닌 (320, 240)을 해줘야 더 알맞게 사이즈가 조절된다.



```python
img = cv2.imread('./fig/cat.bmp')

if img is None:
    print('image read failed')
    sys.exit()
    
cv2.namedWindow('image', cv2.WINDOW_NORMAL)
cv2.imshow('image', img)
cv2.waitKey()
cv2.destroyAllWindows()
```

​	이 코드는 namedwindow()를 설정해 사이즈를 조절하는 코드이다. namedwindow() 함수는 다른 설정이 없으면 default 값으로 cv2.WINDOW_AUTOSIZE로 설정이 되는데, 이러면 창의 사이즈를 내 마음대로 조절할 수가 없다. 그래서 이것을 NORMAL로 바꿔주면 자신이 원하는 사이즈만큼 창 끝을 화살표 마우스를 활용해 조절이 가능하다.



---



### 시작 위치 조절

```python
img = cv2.imread('./fig/cat.bmp')

if img is None:
    print('image read failed')
    sys.exit()
    
cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.imshow('image', img)
cv2.moveWindow('image', 500,600)
cv2.waitKey()
cv2.destroyAllWindows()
```

​	이미지 창을 열었을 때 시작 위치를 조절하고 싶다면 cv2.moveWindow() 함수를 사용하면 된다. 변수는 (창이름, x, y)으로 설정해 준다. 이번에도 opencv의 형태인 x, y 순을 잊지 말자. 숫자가 커질수록 x는 오른쪽으로, y는 아래쪽으로 이동한다.



---



### waitKey()

```python
cv2.waitKey()
cv2.waitKey(3000)
```

​	앞서 waitKey()를 조금 설명하긴 했는데, 좀 더 기능을 알아보도록 하자. 우선 waitkey를 아무런 값도 설정하지 않는다면 아무 키나 눌러도 창이 닫히고, 키를 누르기 전까지는 이미지가 계속 열린 상태로 있다. 여기서 만약 3초가 지나면 알아서 닫히게 하고 싶다면 3000으로 설정해주면 된다. 이러면 시간이 지나면 알아서 닫힌다. 3초 안에 키를 입력하면 그 전에 닫히기도 한다.



```python
while True:
    key = cv2.waitKey()
	if key == 27:
    	break
```

​	무한루프를 활용한 코드를 만들어봤다. 계속 창을 열어두다가 만약 입력 키가 27이면 닫으라는 의미다. 여기서 27은 ascii 코드인데, 각각의 키는 ascii 코드가 부여된다. 27번은 esc 키고, 다른 키들을 알고 싶다면 구글링을 통해 알아보자.



```python
while True:
    key = cv2.waitKey()
    if key ==27 or key == ord('q')
        break
```

​	ascii 코드를 모두 외우고 다닐 수 없기 때문에 만든 코드이다. ord()를 활용하면 ascii 코드를 몰라도 내가 원하는 키를 활용해 창을 닫을 수가 있다. 위 코드는 q를 누르면 창이 닫히는 코드이다.



---



### matplotlib 활용

```python
img = cv2.imread('./fig/puppy.bmp')
if img is None:
    print('image read failed')
    sys.exit()

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.imshow('image', img)

imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
plt.imshow(imgRGB)
plt.axis('off')
plt.show()

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	matplotlib 라이브러리를 활용해서 이미지 파일을 불러보았다. 이미지 파일을 불러올 땐 imshow() 함수를 사용해 줘야 한다. 그리고 좌표값은 필요 없으므로 axis()를 'off'로 설정했다. 다음으로 plt.show()를 해주면 사진이 나오는데, 사진 색깔이 원본과 다르게 나올 것이다. 그 이유는 opencv가 RGB 순서를 BGR로 반대로 인식하기 때문이다. 그래서 이 경우에는 BGR을 RGB로 바꿔주는 작업이 필요하다. 그것이 바로 중간에 cv2.cvtColor() 함수이다. img 변수를 RGB 형태로 변환하는 코드다.

​	만약 영상을 gray로 불렀다면 plt도 따로 설정을 해줘야 한다. 반드시 imshow() 함수에 cmap = 'gray'를 넣어줘야 흑백 영상으로 나타낼 수 있다.



---



### 전체화면 슬라이드 쇼

```python
img_list = os.listdir('./fig/images/')
path = []
for i in img_list:
    img_path = './fig/images/' + i
    path.append(img_path)

cv2.namedWindow('image', cv2.WINDOW_FULLSCREEN)
cv2.setWindowProperty('image', cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)

idx = 0

while True:
    img_name = path[idx]
    img = cv2.imread(img_name, cv2.IMREAD_COLOR)
    
    cv2.imshow('image', img)
    if cv2.waitKey(2000) == 27:
        break
    
    idx += 1
    if idx >= len(path):
        idx = 0
    
cv2.destroyAllWindows()
```

​	우선 os 라이브러리를 통해 여러 사진 파일을 리스트 형태로 만든다. 그리고 fof문을 통해 각 파일을 파일 경로에 맞게 path에 추가한다. 다음으로는 전체 화면으로 나타내는 코드를 입력한다. 중간에 cv2 코드처럼 옵션을 넣어주면 된다. 그리고 무한루프를 돌려 슬라이드 쇼가 진행되도록 할 것이다. path 리스트의 인덱스를 하나씩 cv2.inread()로 읽을 것이다. 그래서 idx를 0부터 1씩 증가하게 하고, 만약 len(path)를 넘으면 다시 0으로 돌아가서 반복될 수 있도록 조건을 걸었다. 그리고 waitkey() 함수도 if문을 통해 창이 닫히는 조건을 입력했다. 



```python
img_list = glob.glob('./fig/images/*.*') # *.png

cv2.namedWindow('image', cv2.WINDOW_NORMAL)
cv2.setWindowProperty('image', cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)

idx = 0
while True:
    img = cv2.imread(img_list[idx])
    cv2.imshow('image', img)
    if cv2.waitKey(3000) == 27:
        break
    idx += 1
    
    if idx >= len(img_list):
        idx = 0
        
cv2.destroyAllWindows()
```

​	이번엔 glob 라이브러리를 활용한 방법이다.



---



### 저장하기

```python
cv2.imwrite('puppy_resize.png',img)
```

​	작업한 파일을 저장하고 싶으면 imwrite()를 사용해 저장한다.

