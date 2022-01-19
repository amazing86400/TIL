# 왜 우리 동네에는 스타벅스가 없을까?



## open API 사용



### 학습 목표

- 시군구별로 스타벅스 매장이 얼마나 있는지를 확인할 수 있다.
- 서울열린데이터광장에서 공공데이터 자료를 받을 수 있다.
- 서울열린데이터광장 API를 활용할 수 있다.



---



### 라이브러리

```python
import pandas as pd
import numpy as np
import requests
```



---



### 서울열린데이터광장 API 기초_인증키 신청

1. 서울열린데이터광장(https://data.seoul.go.kr) 사이트 접속
2. 회원가입 및 로그인
3. 나의 화면
4. 일반 인증키 신청
5. 인증키 복사 및 활용



---



### 서울열린데이터광장 API 기초_url

```python
url = 'http://openAPI.seoul.go.kr:8088/{API_key}/json/{Open_API_service}/{start}/{end}'
```

- 나의 화면 > 인증키 관리 > API명에 자신이 원하는 API 설정 > 출력

​	서울열린데이터광장 사이트에서 위와 같이 하면 요청 주소가 나온다. 그러면 우리는 url을 그 형식에 맞춰 쓰면 된다. 내가 쓴 코드 역시 위와 같은 방식으로 알아내서 한것이다. 만약 위/경도 정보를 얻고 싶으면 (좌표계: WG..)가 들어간 API를 활용해야 한다. 만약 지도 정보가 없으면 카카오 API를 활용하자.

​	url을 하나씩 살펴보겠다. 우선 위 코드는 고정된 형식이므로 형식이 달라지면 안된다. 내가 설정할 값은 '{}' 이 부분이다. {API_key}는 서울열린데이터광장에서 발급받은 인증키를 넣으면 된다. {Open_API_service}는 해당 API의 서비스명이다. 사이트에 해당하는 서비스명 코드가 나와있으니 참고하면 되겠다. {start}와 {end}는 가져오고 싶은 데이터의 시작 번호와 종료 번호를 의미한다. 코드 중간에 json은 파일 형태를 의미한다. xml, xls 등 다른 타입도 지원된다.



```python
requests.get(url).json()
```

​	값을 입력해주고 requests.get() 함수를 사용하면 데이터를 가져올 수 있다. 우선 데이터는 딕셔너리로 묶여져 있다. 그리고' list_total_count': 1104'는 전체 데이터 개수를 의미한다. 내가 추출한 데이터가 아니고 기본적으로 가지고 있는 것이다. 그리고 CODE': 'INFO-000' 이렇게 코드가 나왔다는 것은 정상적으로 처리됐다는 의미다.



---



### 서울열린데이터광장 API 기초_딕셔너리 정보 추출

```python
result_dict['GangseoListLoanCompany']
result_dict2['GangseoListLoanCompany']['list_total_count']
result_dict2['GangseoListLoanCompany']['row'][0]['WRKR_BUP_ADDR'].strip()
```

​	딕셔너리 형태의 데이터는 인덱스로 정보를 추출하면 된다. 인덱스로 데이터 하나하나 세부 정보를 추출할 수 있다. 그리고 str 타입이기 때문에 strip() 함수도 사용가능하다.



```python
sample_df = pd.DataFrame(result_dict2['GangseoListLoanCompany']['row'])
```

​	그리고 딕셔너리 타입을 dataframe 형태로 만드려면 위와 같이 원하는 정보를 인덱스로 추출하고 pandas 라이브러리를 통해 dataframe으로 만들 수 있다.

 

---



### 서울열린데이터광장 API 기초_함수 정의

```python
SEOUL_API_AUTH_KEY = 'API key 입력'
service = 'GangseoListLoanCompany' # 예시
url = 'http://openAPI.seoul.go.kr:8088/{}/json/{}/1/5'.format(SEOUL_API_AUTH_KEY, service)

def seoul_open_api_data(url, service):
    data_list = None
    
    try:
        result_dict = requests.get(url).json()
        result_data = result_dict[service]    # 어떤 서비스인지
        code = result_data['RESULT']['CODE']  # 코드 확인. 코드가 정상처리 됐는지
        
        if code == 'INFO-000':
            data_list = result_data['row']
    except:
        pass
    
    return(data_list_list)
```





---



### 시군구 데이터 수집

서울열린데이터광장에서 '서울시 행정구역 시군구 데이터'를 다운받아 pandas 라이브러리로 읽는다.

```python
sgg_pop_df = pd.read_csv('./files/report.txt', header = 2, sep = '\t')

columns = {
    '기간': 'GIGAN',
    '자치구': 'JACHIGU',
    '계': 'GYE_1',
    '계.1': 'GYE_2',
    '계.2': 'GYE_3',
    '남자': 'NAMJA_1',
    '남자.1': 'NAMJA_2',
    '남자.2': 'NAMJA_3',
    '여자': 'YEOJA_1',
    '여자.1': 'YEOJA_2',
    '여자.2': 'YEOJA_3',
    '세대': 'SEDAE',
    '세대당인구': 'SEDAEDANGINGU',
    '65세이상고령자': 'N_65SEISANGGORYEONGJA'
}

sgg_pop_df.rename(columns = columns, inplace = True)

```



```python
condition = sgg_pop_df['JACHIGU'] != '합계'
sgg_pop_df_select = sgg_pop_df[condition]
```



```python
sgg_pop_df_final = sgg_pop_df_select[['JACHIGU', 'GYE_1']]
sgg_pop_df_final.columns = ['시군구명', '주민등록인구']
```



```python
sgg_pop_df_final.to_excel('./files/sgg_pop_class.xlsx', index = False)
```

