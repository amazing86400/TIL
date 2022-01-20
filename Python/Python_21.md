# folium을 이용한 지도 시각화



### 학습 목표

- folium을 활용하여 지도 시각화를 할 수 있다.
- 시각화한 데이터를 HTML 파일로 저장할 수 있다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
import folium
from folium.plugins import MarkerCluster
```

​	지도 시각화를 하기 위해 folium 라이브러리를 불러온다.



---



### folium 시각화

```python
location = pd.read_excel('./files/3_location_inform.xlsx')
```

​	지도 시각화하기 전 위치 정보별 게시량 데이터를 불러온다. 불러온 데이터에는 총 433개의 위치별 위도/경도 좌표, 게시량 정보가 들어있다.



```python
Mt_Hanla = [33.362500,126.533694]

map = folium.Map(location=Mt_Hanla,
                wedth=700,
                height=300,
                zoom_start=11)

for i in range(len(location)):
    name = location['name_official'][i]
    count = location['place'][i]
    size = int(count)*2
    lng = location['위도'][i]
    lat = location['경도'][i]
    folium.CircleMarker(location=[lng, lat], radius=size, color='red', popup=name).add_to(map)

map
```

​	지도 시각화를 위해서는 지도의 중심 위치 좌표와 표시할 위치별 위도/ 경도 데이터가 필요하다. 지도의 중심 위치를 한라산 좌표로 지정하고, 핫플레이스 좌표를 지도에 표시하겠다. Mt_Hanla가 중심 위치 좌표다. 그리고 map이라는 folium map을 먼저 생성한다. folium.Map은 기본적으로 위 옵션 정도만 설정해 주면 생성된다. location에 좌표 데이터를 넣고, wedth과 height은 지도의 크기를 설정하는 옵션이다. 그리고 zoom_start는 folium 맵을 실행했을 때 확대의 정도이다.

​	for문을 돌려 location 데이터의 핫플레이스를 지도에 시각화할 것이다. 우선 for문은 location의 개수만큼 설정하고 필요한 데이터만 추출하겠다. name은 popup 옵션을 위한 건데, 지도 위에 서클 마커를 클릭하면 해당 위치 이름이 나오도록 하기 위함이다. 그리고 count는 원의 크기를 설정하기 위해 넣어줬고, 위치 count가 많을수록 원의 크기가 크다. lng와 lat에는 각각 위도와 경도 데이터를 넣는다. 그리고 folium.CircleMarker()에 저장한 변수를 하나씩 넣어주면 된다. 우선 서클 마커의 location에는 위도, 경도 정보를 넣어주고, 원의 크기를 설정하는 옵션인 radius에는 size 변수를 넣는다. 그리고 원의 색상은 'red'로 해주겠다. 마지막으로 add_to() 함수로 map에 추가해 주면 된다.



```python
map.save('./files/jeju_map.html')
```

​	맛집 지도를 시각화한 결과물을 HTML 파일로 저장한다. 이후 브라우저로 파일을 열어서 확대/축소 및 지도 이동 등의 동작을 수행할 수 있다.



```python
latlng = []
name = []

for i in range(len(location)):
    data = location.iloc[i]
    latlng.append((data['위도'], data['경도']))
    name.append(data['name_official'])
    
Mt_Hanla = [33.362500, 126.533694]
map = folium.Map(location=Mt_Hanla,zoom_start=11)

tiles = ['stamenwatercolor', 'cartodbpositron', 
         'openstreetmap', 'stamenterrain', 'stamentoner']

for r in tiles:
    folium.TileLayer(r).add_to(map)

maker = MarkerCluster(locations=latlng,
                     popups=name,
                     overlay=True,
                     control=True).add_to(map)

folium.LayerControl().add_to(map)

map
```

​	folium markercluster를 활용한 지도 시각화 코드다. 확인해 보면 알 수 있듯 흩어진 정도에 따라 마커가 합쳐지고 분리된다. 그리고 지도의 배경(tile)도 여러 개로 한 번에 for문을 돌려 지정해 주었다. 유용하게 쓸 수 있을 것 같다.

