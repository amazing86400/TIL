# 기업 내부 데이터베이스 솔루션



### 1980년대

**1. OLTP(On-Line Transaction Processing)**

   - 온라인 거래 처리
   - 주 컴퓨터에서 복수의 사용자 단말에서 발생한 트랜잭션을 처리하여 그 결과를 사용자에게 되돌려 보내 주는 처리 형태
   - 상품 주문, 회원 정보 수정, 은행 이체 등

**2. OLAP(On-Line Analytical Processing)**

   - 온라인 분석 처리
   - 다차원의 데이터를 대화식으로 분석하기 위한 소프트웨어
   - 다차원 데이터로부터 통계적인 요약 정보를 제공함

   - 10년간 A사의 직급별 임금 상승률

**거래(Transaction)와 분석(Analytical)의 차이를 명확히 구분하자.**



---



### 2000년대

**1. CRM(Customer Relationship Management)**

- 고객별 데이터베이스를 분석해 고객에 대한 이해를 돕고, 이를 바탕으로 각종 마케팅 전략을 통해 보다 높은 이익을 창출할 수 있는 솔루션

**2. SCM(Supply Chain Management)**

   - 유통 공급망(제조, 물류, 유통 업체 등)에 참여하는 모든 업체들이 협력해 정보기술을 활용하고 재고를 최적화하기 위한 솔루션
   - 통합된 정보시스템으로 연계하여 시간과 비용을 최적화 시키기 위함
   - 자재 구매 데이터, 생산, 재고 데이터 등



----



### 제조부문 기업 내부 데이터베이스 솔루션

**1. Data Warehouse**

   - 기업 내의 의사결정 지원 애플리케이션을 위한 정보를 제공하는 하나의 통합된 데이터 저장 공간
   - 데이터들은 시간적 흐름에 따라 변화하는 값을 일정 기간 유지
   - 주기적으로 데이터베이스로부터 정보를 추출(Extract)하고, 정해진 규약에 따라 정보를 변환(Transform)한 후, 정보를 적재(Load) >> ETL

   

   **1. DW 특성**

      - 데이터 통합: 데이터들은 전사적 차원에서 일관된 형식으로 정의됨
    
      - 데이터 시계열성: 시간의 흐름에 따라 변화하는 값을 저장함
    
      - 데이터 주제 지향적: 특정 주제에 따라 데이터들이 분류, 저장, 관리됨
    
      - 비소멸성/비휘발성: Batch 작업에 의한 갱신 이외에 변하지 않음




**2. Data Mart**

   - 데이터 웨어하우스로부터 특정 주제, 부서 중심으로 구축된 소규모 단일 주제의 데이터 웨어하우스
   - 재무, 생산, 운영과 같이 특정 조직의 특정 업무 분야에 초점을 두고 있음

   

**3. ERP(Enterprise Resource Planning)**

   - 다양한 비즈니스 분야에서 생산, 구매, 재고 등 주요 프로세스 관리를 돕는, 여러 모듈로 구성된 통합 애플리케이션 소프트웨어 패키지

   

**4. BI(Business Intelligence)**

   - 기업의 데이터 웨어하우스에 접근해 경영 의사결정에 필요한 정보를 획득하고, 이를 경영활동에 활용
   - 데이터를 통합, 분석하여 기업 활동에 연관된 의사결정을 돕는 프로세서
   - '가트너'는 여러 곳에 산재된 데이터를 수집하여 체계적이고 일목요연하게 정리함으로써 사용자가 필요로 하는 정보를 정확한 시간에 제공할 수 있는 환경으로 정의함
   - 하나의 특정 비즈니스 질문에 답변

   

**5. BA(Business Analytics)**

   - 경영 의사결정을 위한 통계적이고 수학적인 분석에 초점을 둔 기법
   - 성과에 대한 이해와 비즈니스 통찰력(Insight)에 초점을 둔 분석 방법
   - 사전에 예측(Forecast)하고 최적화(Optimization)하기 위한 것으로 BI보다 진보된 형태



---



### 금융부문 기업 내부 데이터베이스 솔루션

**블록체인(Block Chain)** : 기존 금융회사의 중앙 집중형 서버에 거래 기록을 보관하는 방식에서 벗어나, 거래에 참여하는 모든 사용자에게 거래 내용을 보내주고 거래 때마다 이를 대조하는 데이터 위조 방지 기술



---



### 유통부문 기업 내부 데이터베이스 솔루션

**1. KMS(Knowledge Management System)**

   - 지식관리시스템으로 조직 내의 지식을 체계적으로 관리하는 시스템

   

**2. RFID**

   - 무선주파수(Radio Frequency)를 이용하여 대상을 식별할 수 있는 기술
   - RF태그에 정보를 저장하여 적용 대상에 부착한 후 RFID 리더를 통해  정보를 인식