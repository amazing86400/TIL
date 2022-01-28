# Histogram



### 학습 목표

- opencv를 통해 histogram을 구할 수 있다.
- 정규화와 평활화를 할 수 있다.



---



### 라이브러리

```python
import numpy as np
import cv2
import sys
```



---



```python
# opencv에서 히스토그램을 구하는 방법

src = cv2.imread('./fig/lenna.bmp', 0)

hist = cv2.calcHist([src], [0], None, [256], [0,256])
# [영상], 채널 [0,1,2], mask 영상입력, 히스토그램 크기, 


cv2.imshow('src',src)
plt.plot(hist)
plt.show()

cv2.waitKey()
cv2.destroyAllWindows()
```



```python
src = cv2.imread('./fig/lenna.bmp')

b = cv2.calcHist([src], [0], None, [256], [0,256])
g = cv2.calcHist([src], [1], None, [256], [0,256])
r = cv2.calcHist([src], [2], None, [256], [0,256])
# [영상], 채널 [0,1,2], mask 영상입력, 히스토그램 크기, 


cv2.imshow('src',src)
plt.plot(b, color = 'b')
plt.plot(g, color = 'g')
plt.plot(r, color = 'r')
plt.show()

cv2.waitKey()
cv2.destroyAllWindows()
```



```python
# normalization

src = cv2.imread('./fig/Hawkes.jpg', 0)

dst_norm = cv2.normalize(src, None, 0, 255, cv2.NORM_MINMAX, -1)
# 소스영상, dst, 최소값, 최대값, NORM_MINMAX, src와 같은 type
# 교재에 수식있으니까 직접 한번 해보길

dst_equal = cv2.equalizeHist(src)
# 이거는 이러면 알아서 해줌

cv2.imshow('src', src)
cv2.imshow('dst_norm', dst_norm)
cv2.imshow('dst_equal', dst_equal)

cv2.waitKey()
cv2.destroyAllWindows()
```



```python
# 컬러 영상 equal

src = cv2.imread('./fig/field.bmp')

src_hsv = cv2.cvtColor(src, cv2.COLOR_BGR2HSV)
h,s,v = cv2.split(src_hsv)

v_equal = cv2.equalizeHist(v)

src_hsv_eq = cv2.merge((h,s,v_equal))

src_hsv_eq_bgr = cv2.cvtColor(src_hsv_eq, cv2.COLOR_HSV2BGR)

cv2.imshow('src', src)
cv2.imshow('src_hsv', src_hsv_eq_bgr)

cv2.waitKey()
cv2.destroyAllWindows()
```

