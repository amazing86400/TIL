# Open cv_basic



### 학습 목표

- 영상을 불러와 그 속성을 확인할 수 있다.
- 영상을 만들 수 있다.
- 영상을 복사할 수 있다.
- 영상의 일부분을 추출할 수 있다.
- 영상을 합성할 수 있다.



---



### 라이브러리

```python
import cv2
import numpy as np
import sys
```



---



### 영상 속성 알아보기

```python
>>> img = cv2.imread('./fig/puppy.bmp', 0) # 0은 흑백, 1은 컬러
>>> if img is None:
>>>     print('image read failed')
>>>     sys.exit()
...
>>> cv2.imshow('image', img)
...
>>> print(type(img))
>>> print(img.shape)
>>> print(img.dtype)
...
>>> while True:
>>>     key = cv2.waitKey()
>>>     if key == 27 or key == ord('q'):
>>>         break
...
>>> cv2.destroyAllWindows()
...
<class 'numpy.ndarray'>
(480, 640)
uint8
```

​	우선 흑백 영상의 속성을 알아보겠다.  cv2 라이브러리를 사용해 영상을 불러오자. 그리고 type, shape, dtype을 print 해서 각각의 정보를 얻는다. 영상의 type은 ndarray 타입으로 넘파이 배열 형태이다. 그리고 shape은 (480, 640)으로 되어 있는데, opencv에서는 (x, y) 순서지만 넘파이에서는 (r, c)기 때문에, 현재 shape은 (행, 열)로 이해하면 된다. 즉, (y, x)로 되어 있다. 그리고 uint8 이라는 것은 부호가 없는 정수, 즉 마이너스가 없는 정수형태의 8비트를 의미한다.



```python
# 컬러 영상 속성
<class 'numpy.ndarray'>
(480, 640, 3)
uint8
```

​	컬러 영상의 속성을 보면 shape 빼고는 모두 같은 속성을 갖고있다. shape이 다른 이유는 RGB때문이다. RGB는 각각 8비트씩 갖고 있으며, 3이 의미하는건 R,G,B 세 가지를 의미한다.



```python
<class 'numpy.ndarray'>
(853, 1280, 3)
uint8
```

​	이미지가 큰 파일의 속성은 이렇다. 이것 역시 dimension만 다른 것을 확인할 수 있다. 여기서 dimension은 영상의 size를 의미한다.



```python
>>> img = cv2.imread('./fig/puppy.bmp', cv2.IMREAD_COLOR)
>>> if img is None:
>>>     print('image read failed')
>>>     sys.exit()
...
>>> cv2.imshow('image', img)
...
>>> h,w = img.shape[:2]
...
>>> print('img size = {}x{}'.format(w,h))
>>> print(type(img))
>>> print(img.shape)
>>> print(img.dtype)
...
>>> while True:
>>>     key = cv2.waitKey()
>>>     if key == 27 or key == ord('q'):
>>>         break
...
>>> cv2.destroyAllWindows()
...
img size = 640x480
<class 'numpy.ndarray'>
(480, 640, 3)
uint8
```

​	height(높이)와 width(너비)를 h, w 변수로 만들어 img의 shape을 print하는 코드를 만들어봤다. 컬러 영상의 경우에는 shape이 (480, 640, 3) 이렇게 3개가 나오지만, 흑백의 경우에는 2개만 나오기 때문에 shape에 인덱스를 사용해서 앞에 2개만 지정해주었다. 이렇게 해주면 흑백 영상도 오류없이 결과를 얻을 수 있다. 그리고 img.shape의 순서는 (r, c)기 때문에, h와 w의 위치는 (w, h)로 나타내야 한다. 이렇게 해야 영상좌표로 잘 볼 수 있기 때문이다.

 

---



### 픽셀값 참고

```python
>>> img1 = cv2.imread('./fig/puppy.bmp', 1) # 컬러
>>> img2 = cv2.imread('./fig/puppy.bmp', 0) # 흑백
...
>>> if img1 is None or img2 is None:
>>>     print('image read failed')
>>>     sys.exit()
...
>>> h, w = img1.shape[:2]
>>> img1_center = img1[h//2, w//2]
>>> print('color center = ', img1_center) # BGR 값이 각각 나오는것임
...
>>> img2_center = img2[h//2, w//2]
>>> print('gray center = ', img2_center)
...
>>> cv2.imshow('image1', img1)
>>> cv2.imshow('image2', img2)
...
>>> while True:
>>>     key = cv2.waitKey()
>>>     if key == 27 or key == ord('q'):
>>>         break
...
>>> cv2.destroyAllWindows()
...
color center =  [ 0 14 40]
gray center =  20
```

​	img1과 2의 중앙값을 찾아볼 것이다. 각각 컬러와 흑백으로 영상을 불러온다.  shape은 두 영상이 모두 같아서 어느 것을 지정해줘도 상관없다. 나는 img1으로 정했다. 그리고 h와 w를 shape[:2]로 인덱스 해주고, center 변수에 각각을 2로 나눈 값을 담았다. 높이와 너비 모두 반으로 나눠주면 중앙값이 나올 것이다. 그리고 그 값을 print 해보면 color는 중앙 좌표의 BRG가 나오고, 흑백은 중앙 좌표값이 나올 것이다. 



---



### 영상 부분 추출

```python
img = cv2.imread('./fig/puppy.bmp', 1)

if img is None:
    print('image read failed')
    sys.exit()

img[200:300, 200:300] = 0
 
cv2.imshow('image', img)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	영상의 일부분만 추출하는 코드다. 코드는 굉장히 쉽지만 좌표값과 x, y값 순서를 잘 생각해야한다. img변수에 [] 인덱스를 해주는데, [r, c] 순서라는 것을 잊지말자. 즉 [y, x] 순서이다. 그리고 이 값을 0으로 처리하면 추출한 부분이 검정색으로 나온다. 반대로 흰색으로 나타내고 싶을 땐 255로 지정해주면 된다. 만약 빨간색으로 나타내고 싶을땐 (0, 0, 255)로 해주면 된다. 이 역시 순서가 BGR이기 때문에 제일 끝에 지정해주었다.



