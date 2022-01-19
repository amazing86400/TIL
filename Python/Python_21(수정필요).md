# 지도 시각화(folium)



### 학습 목표

- 
- 



---



### 라이브러리

```python
```



---



```python
location_counts_df = pd.read_excel('./files/3_location_counts.xlsx', index_col = 0)
location_inform_df = pd.read_excel('./files/3_locations.xlsx')
```



```python
location_data = pd.merge(location_inform_df, location_counts_df,
                         how = 'inner', left_on = 'name_official', 
                         right_index = True)
```



```python
location_data = location_data.pivot_table(values='place', index = ['name_official','경도','위도'], aggfunc = 'sum')
```



```python
location_data.sort_values(by='place', ascending=False)
```



```python
Mt_Hanla = [33.362500, 126.533694]
map_jeju = folium.Map(location = Mt_Hanla, zoom_start = 10)

folium.TileLayer('stamenterrain').add_to(map_jeju)

for i in range(len(location_data)):
    name = location_data['name_official'][i]
    count = location_data['place'][i]
    size = int(count)*2
    lng = float(location_data['경도'][i])
    lat = float(location_data['위도'][i])
    
    folium.CircleMarker(location=[lat,lng], radius = size, color = 'red', popup=name).add_to(map_jeju)


map_jeju
```



```python
locations = []
names = []

for i in range(len(location_data)):
    data = location_data.iloc[i]
    locations.append((data['위도'], data['경도']))
    names.append(data['name_official'])
    
Mt_Hanla = [33.362500, 126.533694]
map_jeju2 = folium.Map(location = Mt_Hanla, zoom_start = 10)

tiles = ['stamenwatercolor', 'cartodbpositron', 
         'openstreetmap', 'stamenterrain', 'stamentoner']


for tile in tiles:
    folium.TileLayer(tile).add_to(map_jeju2)
    
maker_cluster = MarkerCluster(locations = locations,
                             popups = names,
                             name = 'jeju',
                             overlay= True,
                             control= True).add_to(map_jeju2)

folium.LayerControl().add_to(map_jeju2)

map_jeju2
```

