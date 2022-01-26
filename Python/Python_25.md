# Open cv_secondary



### 학습 목표

- alpha channel 파일을 합성할 수 있다.
- 각종 그리기 기능을 통해 내 이름을 코드화할 수 있다.
- 웹캠 및 동영상 파일을 읽고 저장할 수 있다.



---



### 라이브러리

```python
import numpy as np
import cv2
import sys
```

​	영상을 다루는 기본 라이브러리는 위와 같다.



---



### alpha channel 합성하기

```python
src = cv2.imread('./fig/puppy.bmp')
dst = cv2.imread('./fig/imgbin_sunglasses_1.png', cv2.IMREAD_UNCHANGED)

# 안경 사이즈 줄이기
dst = cv2.resize(dst, (320, 240))

# 영상과 마스크 추출하기
sunglass = dst[:,:,:3]
mask = dst[:,:,-1]

# 사이즈 맞추기
h,w = mask.shape[:2]
crop = src[90:90+h, 200:200+w]

# 합성하기
cv2.copyTo(sunglass, mask, crop)

cv2.imshow('src', src)
cv2.imshow('sunglass', sunglass)
cv2.imshow('mask', mask)
cv2.imshow('crop', crop)

while True:
    key = cv2.waitKey()
    if key == 27:
        break

cv2.destroyAllWindows()
```

​	alpha channel 영상은 배경이 체크판으로 되어 있다. 그래서 대상만 추출하기가 다른 영상에 비해 매우 수월하다. 그리고 일반 컬러 파일과는 달리 mask 파일을 함께 갖고 있어, shape이 (480, 960, 4)처럼 3(color)이 아닌 4로 되어있다. 컬러에서 1이 추가되었는데, 1은 mask를 의미한다.

​	먼저 합성할 영상 파일을 부른다. alpha 영상은 mask 파일이 있으므로 배경과 대상 파일만 부르면 되겠다. 그리고 alpha 영상은 반드시 cv2.IMREAD_UNCHANGED를 넣어주어야 한다. 나는 강아지 사진과 안경 alpha 파일을 불렀다. 안경을 쓴 강아지를 나타낼 것이다. 그러기 위해선 사이즈부터 조절해야 한다. 안경의 사이즈가 너무 커서 임의로 사이즈를 줄였다. 이때 resize() 함수를 사용한다. opencv 형태로 (x, y) 순이다.

​	그런 다음, mask와 영상 파일을 각각 추출하겠다. 영상 파일은 shape에서 BGR 부분인 3을, mask는 shape에서 가장 뒤에 있는 값을 추출해 주면 되겠다. 그래서 mask = dst[:,:,-1]라는 코드를 사용했다.

​	이제 강아지 눈 부분만 따로 추출할 것이다. 일부만 추출해서 합성을 하는 이유는 영상 크기 때문이다. 합성을 하기 위해서는 영상의 size가 같아야 하는데, 강아지 사진과 안경 사진의 사이즈를 같게 하면 안경이 강아지에 비해 너무 커지기 때문에 어색해질 수 있다. 그래서 강아지의 눈 부분만 추출해 size를 줄인 mask와 크기를 맞추고 합성해 줄 것이다. 그래서 height(높이)와 width(너비)를 mask의 shape[:2]에 맞춰주고, src에 마스크 기능을 적용해 변수로 지정했다. 함수를 사용하지 않고 이렇게 한 이유는 crop이라는 변수에 합성을 하면 원본인 src에도 나타나기 때문이다. 그리고 copyTo() 함수를 사용해 합성을 해주자.



---



### 이름쓰기

```python
img = np.full((600, 1000, 3), 255, np.uint8)

cv2.line(img,(300,200),(250,300), (255,255,0), 6)
cv2.line(img,(300,200),(350,300), (255,0,255), 6)
cv2.line(img,(400,200),(400,300), (255,150,150), 6)
cv2.line(img,(250,350),(250,400), (150,150,255), 6)
cv2.line(img,(250,400),(400,400), (0,200,200), 6)

cv2.line(img,(450,200),(550,200), (150,0,150), 6)
cv2.line(img,(550,200),(450,400), (150,150,0), 6)
cv2.line(img,(600,200),(600,400), (0,0,0), 6)

cv2.line(img,(650,200),(650,300), (0,255,150), 6)
cv2.line(img,(750,200),(750,300), (100,0,255), 6)
cv2.line(img,(650,250),(750,250), (150,255,50), 6)
cv2.line(img,(650,300),(750,300), (255,0,50), 6)
cv2.line(img,(800,200),(800,300), (0,150,255), 6)
cv2.line(img,(750,250),(800,250), (255,100,70), 6)
cv2.rectangle(img, (650,350,150,50), (150,255,100), 6)

cv2.imshow('img', img)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	하얀 캔버스를 만들어 내 이름을 코드로 직접 그려보았다. line()과 rectangle() 함수를 사용해서 만들었다. 두 함수는 각각의 쓰임새만 다를 뿐 코드의 구조는 동일하다. 다만 rectangle() 함수는 방법이 두 가지이다.

​	line() 함수는 선을 그리는 함수다, (영상, 시작 위치 좌표(x, y), 끝 위치 좌표(x,y), color, 두께, line 옵션) 이 구조이며, line 옵션은 생략해도 된다. rectangle() 함수는 사각형을 그리는 함수로 line() 함수와 기본 구조는 동일하다. 내가 쓴 코드가 바로 다른 방식의 구조인데 어렵지 않다. 그냥 시작 위치 좌표를 먼저 입력하고, 얼마나 이동할지를 이어서 써주면 된다. 즉, x = 650, y = 350에서 150, 50 만큼 끝 위치를 설정한다는 의미다.



```python
cv2.ellipse(img,(600,250), (100,50), 20, 0, 360, (0,0,255),5)
```

​	ellipse() 함수는 타원을 그리는 함수다. circle과 함께 알아두면 좋은 코드다. 함수 구조는 (영상, 시작 위치(x, y), 반지름(x, y), 타원의 기울기, 타원 시작 각도, 끝 각도, color, 두께)이다.



```python
text = 'Opencv version = ' + cv2.__version__
cv2.putText(img, text, (800,100), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,0,255), 1, cv2.LINE_AA)
```

​	putText() 함수는 text를 넣는 함수이다. 함수 구조는 (영상, text, 위치, 폰트, 글자 크기, color, 두께, line 옵션)이다. 유용한 함수이니 잘 알아두자.



---



### webcam play

```python
cap = cv2.VideoCapture(0)

if not cap.isOpened():
    print('Videocap open failed')
    sys.exit()

while True:
    ret, frame = cap.read()
    
    if not ret:
        print('video read failed')
        break
    
    edge = cv2.Canny(frame, 50, 150)
    
    cv2.imshow('img', frame)
    cv2.imshow('edge', edge)
    
    if cv2.waitKey(20) == 27:
        break

cap.release()
cv2.destroyAllWindows()
```

​	웹캠의 영상 데이터를 가져오는 코드이다. VideoCapture(\) 함수를 사용하며 0이 default 값이다. 보통 0이 현재 사용하는 웹캠이다. 캠이 여러 개라면 숫자를 하나씩 늘려서 확인하면 된다. 그리고 예외 처리로 만약 캠이 없을 경우를 대비해 if문을 사용했다. 그리고 무한루프를 활용해서 데이터를 받아올 것이다. ret, frame = cap.read() 여기서 ret은 true, false 값이 들어오고 frame 변수에 영상이 들어간다. 그리고 if문을 통해 ret이 false 이면 break 되도록 해주었다. 다음으로 edge를 설정해 줬는데, Canny() 함수는 영상을 binary 형태로 보여준다. 그리고 여기서는 cap.release() 함수를 꼭 입력해 줘야 한다. 이 코드가 없으면 실행이 안 된다.



```python
cap = cv2.VideoCapture('./fig/piano.mp4')  # 웹캠 지정. 0 디폴트

if not cap.isOpened():
    print('Videocap open failed')
    sys.exit()

# 동영상 저장
w = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))  
h = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps = int(cap.get(cv2.CAP_PROP_FPS)*0.7)
fourcc = cv2.VideoWriter_fourcc(*'DIVX')
out = cv2.VideoWriter('output_class.avi', fourcc, fps, (w, h))

while True:
    ret, frame = cap.read()
    
    if not ret:
        print('video read failed')
        break
    
    # 동영상 편집 부분
    #########################################
    edge = cv2.Canny(frame, 30, 150)
    edge = 255 - edge
    edge_color = cv2.cvtColor(edge, cv2.COLOR_GRAY2BGR)
    #########################################
    
    cv2.imshow('img', frame)
    cv2.imshow('edge', edge_color)
    
    out.write(frame)       # 이거는 영상 저장
    out.write(edge_color)  # 이거는 엣지 저장
    
    if cv2.waitKey(20) == 27:
        break
    
cap.release()
out.release()
cv2.destroyAllWindows()
```

​	동영상 파일은 VideoCapture() 함수에 동영상 파일 경로를 입력하면 된다. 나머지는 웹캠이랑 동일하다. 그리고 저장을 해볼 건데 동영상을 저장할 때 width, height, fps, fourcc 이 네 개를 반드시 설정해 줘야 한다. width, height는 영상의 size를 의미하고, 모두 float으로 되어 있어 int로 묶어줬다. fps는 초당 몇 개의 프레임이 들어오는지를 설정하는 코드다. 보통 속도가 빠르거나 느릴 때 설정해 준다. 그리고 fourcc는 코덱을 설정하는 함수다. 일반적으로는 DIVX를 사용하며, 만약 일치하는 코덱이 없다면 다운받아 줘야 한다. 그리고 VideoWriter() 함수로 저장해 주면 된다. 이때 out.release() 함수도 가장 밑에 함께 입력해 줘야 한다.

​	edge도 저장이 가능한데, 저장하기 전에 gray 타입을 BGR로 바꿔줘야 한다. 그리고 out.write() 함수로 edge를 저장하면 된다. 중간에 edge = 255 - edge 이 코드는 edge를 하얗게 볼 수 있게 한다.

