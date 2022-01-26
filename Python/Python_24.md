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

​	영상을 다루는 기본 라이브러리는 위와 같다.



---



### 영상 속성 알아보기

```python
>>> img = cv2.imread('./fig/puppy.bmp', 0) # 0은 흑백, 1은 컬러
...
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

​	우선 흑백 영상의 속성을 알아보겠다.  cv2 라이브러리를 사용해 영상을 불러오자. 그리고 type, shape, dtype을 print 해서 각각의 정보를 얻는다. 영상의 type은 ndarray 타입으로 넘파이 배열 형태이다. 그리고 shape은 (480, 640)으로 되어 있는데, opencv에서는 (x, y) 순서지만 넘파이에서는 (r, c)기 때문에, 현재 shape은 (행, 열)로 이해하면 된다. 즉, (y, x)로 되어 있다. 그리고 uint8이라는 것은 부호가 없는 정수, 즉 마이너스가 없는 정수 형태의 8비트를 의미한다.



```python
# 컬러 영상 속성
<class 'numpy.ndarray'>
(480, 640, 3)
uint8
```

​	컬러 영상의 속성을 보면 shape 빼고는 모두 같은 속성을 갖고 있다. shape이 다른 이유는 RGB 때문이다. RGB는 각각 8비트씩 갖고 있으며, 3이 의미하는 건 R, G, B 세 가지를 의미한다.



```python
<class 'numpy.ndarray'>
(853, 1280, 3)
uint8
```

​	이미지가 큰 파일의 속성은 이렇다. 이것 역시 dimension만 다른 것을 확인할 수 있다. 여기서 dimension은 영상의 size를 의미한다.



```python
>>> img = cv2.imread('./fig/puppy.bmp', cv2.IMREAD_COLOR)
...
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

​	height(높이)와 width(너비)를 h, w 변수로 만들어 img의 shape을 print 하는 코드를 만들어봤다. 컬러 영상의 경우에는 shape이 (480, 640, 3) 이렇게 3개가 나오지만, 흑백의 경우에는 2개만 나오기 때문에 shape에 인덱스를 사용해서 앞에 2개만 지정해 주었다. 이렇게 해주면 흑백 영상도 오류 없이 결과를 얻을 수 있다. 그리고 img.shape의 순서는 (r, c)기 때문에, h와 w의 위치는 (w, h)로 나타내야 한다. 이렇게 해야 영상 좌표로 잘 볼 수 있기 때문이다.

 

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

​	img1과 2의 중앙값을 찾아볼 것이다. 각각 컬러와 흑백으로 영상을 불러온다.  shape은 두 영상이 모두 같아서 어느 것을 지정해 줘도 상관없다. 나는 img1으로 정했다. 그리고 h와 w를 shape[:2]로 인덱스 해주고, center 변수에 각각을 2로 나눈 값을 담았다. 높이와 너비 모두 반으로 나눠주면 중앙값이 나올 것이다. 그리고 그 값을 print 해보면 color는 중앙 좌표의 BRG가 나오고, 흑백은 중앙 좌표값이 나올 것이다. 



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

​	영상의 일부분만 추출하는 코드다. 코드는 굉장히 쉽지만 좌표값과 x, y 값 순서를 잘 생각해야 한다. img 변수에 [] 인덱스를 해주는데, [r, c] 순서라는 것을 잊지 말자. 즉 [y, x] 순서이다. 그리고 이 값을 0으로 처리하면 추출한 부분이 검은색으로 나온다. 반대로 흰색으로 나타내고 싶을 땐 255로 지정해주면 된다. 만약 빨간색으로 나타내고 싶을 땐 (0, 0, 255)로 해주면 된다. 이 역시 순서가 BGR이기 때문에 제일 끝에 지정해 주었다.



---



### 이미지 판넬 만들기

```python
img1 = np.zeros((240, 320, 3), dtype = np.uint8)
img2 = np.ones((240, 320, 3), dtype = np.uint8) * 255

img1[100:200, 200:300] = 255
img2[100:200, 200:300] = (0,255,0)

cv2.imshow('img1', img1)
cv2.imshow('img2', img2)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	이번에는 영상을 불러오는 것이 아니라 판넬을 직접 만들어 볼 것이다. 이때 넘파이 라이브러리의 zeros() 함수와 ones() 함수를 사용한다. zeros() 함수는 모든 배열, 즉 모든 픽셀을 0으로 채우고, ones() 함수는 1로 채운다. 코드는 np.zeros((r, c, 3), dtype = np.uint8) 이러한 구조이다. 넘파이에 맞게 r, c 순서이고, 3은 BGR을 의미한다. 만약 흑백으로 나타내고 싶으면 3을 생략하면 된다. 그리고 dtype은 uint8로 지정해 준다.

​	두 코드는 배열의 값이 0과 1이라서 실제로 이미지를 보면 검정 화면일 것이다. 그래서 흰 바탕을 원한다면 첫 번째 코드에는 255를 더해주면 되고, 두 번째 코드에는 255를 곱해주면 된다.

​	그리고 앞서 배운 부분 추출도 가능하다. 영상의 일부만 추출해서 원하는 색깔로 바꿔주자.



```python
img1 = np.full((240, 320, 3), 255, dtype = np.uint8)
img2 = np.random.randint(0, 255, size = (240, 320), dtype = np.uint8)

cv2.imshow('img1', img1)
cv2.imshow('img2', img2)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	다음으로는 np.full() 함수와 np.random() 함수를 사용해서 만들어보자. np.full() 함수는 자신이 지정한 값으로 채우는 함수이고, 255로 설정하면 흰색으로 만들어진다. 그리고 np.random() 함수는 지정한 값만큼 랜덤으로 채워준다. 0, 255, size() 를 지정해 주면 0부터 255까지의 숫자를 랜덤으로 추출해 size 만큼 채운다. 이 경우에는 노이즈가 생성된다.



---



### 복사

```python
img = cv2.imread('./fig/puppy.bmp')

if img is None:
    print('image read failed')
    sys.exit()

img2 = img    
img[100:200, 200:300] = 0

cv2.namedWindow('image')
cv2.imshow('image', img)
cv2.imshow('image2', img2)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	영상을 복사하여 사용할 수도 있다. 복사에도 방법이 여러 개 있는데, 우선 이 방법은 영상의 주소 자체를 복사하는 방법이다. img2 = img로 해줌으로써 둘은 완전히 같아진다. 그래서 어느 한쪽을 수정하면 다른 한쪽도 함께 수정된다.



```python
img = cv2.imread('./fig/puppy.bmp')

if img is None:
    print('image read failed')
    sys.exit()

img2 = img.copy()
img[100:200, 200:300] = 255

cv2.namedWindow('image')
cv2.imshow('image', img)
cv2.imshow('image2', img2)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	이번 방법은 copy() 함수를 사용한 방법이다. 이렇게 함수를 사용하게 되면 영상만 저장해 구분을 지어 사용할 수 있다. 어느 한쪽을 변경해도 나머지 하나는 기존에 copy 한 영상 파일을 유지한다. 백업할 때 주로 사용한다.



---



### circle

```python
img = cv2.imread('./fig/puppy.bmp')

if img is None:
    print('image read failed')
    sys.exit()
    
cv2.circle(img, (300,200), 50, (0,0,255), 3, cv2.LINE_AA)

cv2.namedWindow('image')
cv2.imshow('image', img)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	cv2.circle()은 영상 안에 동그란 선을 넣어주는 함수이다. 코드는 cv2.circle(영상파일, (x, y), 원 크기, (선 색상), thickness, linetype) 구조이다. 나는 위치와 크기를 정해주고 색상은 빨간색으로 지정했다. 그리고  cv2.LINE_AA를 해줌으로써 선을 부드럽게 만들어 주었다.



```python
img = cv2.imread('./fig/puppy.bmp')
if img is None:
    print('image read failed')
    sys.exit()

img2 = img.copy()
img3 = img[200:400, 300:500]
cv2.circle(img3, (100,100), 50, (0,0,255), 3, cv2.LINE_AA)

cv2.namedWindow('image')
cv2.imshow('image', img)
cv2.imshow('image2', img2)
cv2.imshow('image3', img3)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	앞서 배운 일부 추출과 복사, 그리고 circle() 함수를 사용해 만든 코드이다. copy()로 백업 파일을 만든 다음, img3가 img와 일치시켜서 img3에 원을 그리면 원본에 그려지는지를 확인했다. 결과는 내 생각과 같았다. 작업할 때 이러한 방식으로 하면 될 것 같다.



---



### 합성하기

```python
src = cv2.imread('./fig/airplane.bmp')
mask = cv2.imread('./fig/mask_plane.bmp')
dst = cv2.imread('./fig/field.bmp')

if src is None or mask is None or dst is None:
    print('image read failed')
    sys.exit()

cv2.copyTo(src, mask, dst)

cv2.imshow('src', src)
cv2.imshow('mask', mask)
cv2.imshow('dst', dst)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	합성은 copyTo() 함수를 사용한다. 그리고 합성을 하기 위해선 영상 파일이 3개가 필요하다. 배경이 되는 사진과 대상이 되는 사진, 그리고 대상의 mask 파일이 필요하다. mask 파일이란 영상이 0과 1로 되어있는 binary 파일을 말한다.

​	src에는 대상 파일을, dst에는 배경 파일을 불러주고, mask 파일까지 cv2.copyTo() 함수에 넣어주면 합성이 된다. 함수 순서는 위 코드와 동일하다.



```python
src = cv2.imread('./fig/airplane.bmp')
dst = cv2.imread('./fig/field.bmp')

if src is None or mask is None or dst is None:
    print('image read failed')
    sys.exit()

src_gray = cv2.cvtColor(src, cv2.COLOR_BGR2GRAY)
ret, mask = cv2.threshold(src_gray, 163, 255, cv2.THRESH_BINARY_INV)

cv2.copyTo(src, mask, dst)

cv2.imshow('src', src)
cv2.imshow('mask', mask)
cv2.imshow('dst', dst)

while True:
    key = cv2.waitKey()
    if key == 27 or key == ord('q'):
        break

cv2.destroyAllWindows()
```

​	만약 mask 파일이 따로 없다면 직접 만들어주는 수밖에 없다. mask 파일을 만드는 방법은 여러 가지인데, 오늘은 그중 threshold() 함수를 사용한 방법을 알아보겠다. 사실 threshold() 함수는 포토샵에 비하면 그다지 좋은 방법은 아니다. 하지만 간단한 작업은 가능하므로 한번 해보도록 하겠다.

​	우선 color 타입으로 read 한 src 파일을 흑백 타입으로 만들어준다. 이때 cvtColor() 함수를 사용한다. 그리고 바꿔준 파일을 대상으로 threshold() 함수를 사용하는데, 마지막에 cv2.THRESH_BINARY_INV 이 코드는 배경이 0이고 대상을 1로 만드는 코드이다. 색상이 하얀 부분을 합성시키는 것이기 때문에 대상이 1이 되어야 한다. 만약 배경을 추출하고 싶다면 _INV를 생략하면 된다. 그리고 max는 8비트기 때문에 255로 설정을 해주었고, thresh 부분의 숫자를 조절하며 대상을 추출하면 된다. 나는 163을 했을 때 가장 좋은 결과가 나왔다.

​	mask까지 만들었다면 copyTo() 함수로 합성해주면 된다.
