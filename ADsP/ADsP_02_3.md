# 분석 방법론



### KDD

> Database에서 의미 있는 지식을 탐색하는 data 마이닝 프로세서



**1. 분석 대상의 비즈니스 도메인 이해, 프로젝트 목표 설정**

**2. Dataset 선택**(dataset: 실제로 분석을 하기 위한 data 묶음)

**3. Data 전처리**: dataset에 포함된 잡음(Noise), 이상값(Outlier), 결측치(Missing Value)를 식별하고 필요시 제거

**4.Data 변환**: 분석 목적에 맞는 변수 선택, data 차원 축소, data mining을 효율적으로 적용할 수 있도록 dataset 변경 작업

**5. Data mining**: 분석 목적에 맞는 data mining 기법과 알고리즘 선택, data의 패턴을 찾거나 분류 또는 예측 등 우리가 흔히 아는 분석 작업

**6. Data mining 결과 평가**



---



### CRISP-DM

> 6단계로 구성되어 있고, 단계간 피드백을 통하여 단계별 완성도를 높이게 구성됨



**1. 업무 이해**: 업무 목적 파악 > 상황 파악 > Data mining 목표 설정 > 프로젝트 계획 수립

**2. Data 이해**: Data 품질에 대한 문제점 식별 및 숨겨져 있는 insight를 발견하는 단계 (Data 수집, data 기술 분석, Data 탐색, Data 품질 확인)

**3. Data 준비**: dataset을 편성하는 단계로 많은 시간이 소요될 수 있음

**4. Modeling**: 다양한 modeling 기법과 알고리즘 선택, data 분석 방법론, 머신러닝을 이용한 수행 모델을 만들거나 data를 분할하는 부분 ( 모델링 기법 선택, Modeling 작성, 모델 평가)

**5. 평가**: 프로젝트 목적에 부합한지 평가 (modeling 과정 평가, model 적용성 평가)

**6. 전개**: 실제 업무에 적용하기 위한 계획 수립
