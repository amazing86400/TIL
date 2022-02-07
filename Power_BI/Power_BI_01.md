# Power BI_intro



### 비즈니스 인텔리전스(Business Intelligence, BI)

- 기업에서 **데이터를 수집, 정리, 분석하고 활용하여 효율적인 의사결정**을 할 수 있는 방법에 대해 연구하는 학문이다.
- 조직의 구성원(종업원, 중간 관리자, 의사결정자 등)에게 적시에 의사결정을 할 수 있도록 지원한다.



---



### Power BI란

- Microsoft에서 제공하는 손쉬운 데이터 분석 및 시각화 도구이다.
- 신속한 의사결정을 할 수 있도록 Insight를 제공하는 클라우드 데이터 분석 서비스이다.
- 다양한 유형의 데이터 원본 연결 및 데이터 정리, 분석이 가능하다.
- 시각화 보고서를 작성하여 웹 및 모바일 장치에서 탐색할 수 있다.



---



### 데이터 분석 및 시각화 절차

**1. 문제 정의(업무 정의)**

   - 어떤 데이터 분석을 하고 싶은가?



**2. 데이터 가져오기**

   - Excel, Text, CSV,  폴더, DB, Web  등 다양한 데이터 원본 유형 지원



**3. 데이터 정리 및 변환(전처리)**

   - 쿼리 편집기 사용 
   - 비정형 데이터를 분석 가능한 형태의 데이터로 편집



**4. 데이터 모델링**

   - 관계 작성
   - 데이터 형식 지정, 열 기준 정렬
   - DAX(분석식 작성)



**5. 데이터 시각화**

   - 다양한 시각적 대체 사용
   - 시각화 보고서 작성

   

---



### Power BI 옵션 설정

- 정기적으로 업데이트되는 내용 확인하기
- [파일] – [옵션 및 설정] – [옵션] 클릭
-  [미리 보기 기능]에서 새로 업데이트된 항목 선택하기 (항목을 많이 체크할수록 프로그램이 무거워진다.)
- Power BI Desktop 재실행하여 업데이트 내용 확인하기



---



### 데이터 가져오기

- 로드 : Power BI Desktop으로 데이터를 가져와 사용한다.
- 데이터 변환 : 쿼리 편집기로 이동해 데이터 정리 및 편집한다.



---



### 상호작용

- 시각적 개체에서 하나의 데이터 요소를 클릭하면 다른 시각적 개체의 데이터 요소가 필터나 강조 표시된다.
- 이를 시각적 개체 간의 상호 작용이라 한다.



---



### 데이터 새로 고침

- 원본 파일의 데이터가 추가, 편집, 삭제된 경우 사용한다.
- [홈] – [새로 고침]으로 전체 데이터 세트에 데이터 새로 고침 반영
- 데이터 크기나 PC 환경에 따라 처리 속도가 오래 걸릴 수 있다.



---



### 데이터 원본 변경

- 원본 파일의 위치가 변경된 경우에 사용한다.
- [홈] – [데이터 변환] – [데이터 원본 설정] 선택하여 원본 변경



---



### 파일 저장

- [파일]탭 – [다른 이름으로 저장] 선택
- Ctrl + s 단축키 사용
- .PBIX로 저장



---



### 웹 데이터 가져오기

- 웹에서 제공하는 데이터 목록 가져와 데이터 시각화를 할 수 있다.
- HTML로 제공하는 데이터 목록 가져오기 (불필요한 정보 제거) 
- 수시로 데이터 업데이트 발생한다.
- 원하는 웹 URL을 복사 후 [데이터 가져오기]  – [웹] 선택 – 붙여넣기
- 탐색 창에서 가져올 테이블 선택 후, [데이터 변환] 클릭해서 데이터 가공 실행하기



---



### 쿼리 편집기의 이해

- 파워 쿼리(Power Query) 편집기
  - 분석에 적합한 형태로 데이터를 편집하는 작업 도구이다.
  - 다양한 데이터 편집 도구 제공한다.
- 인메모리(In-memory) 방식으로 쿼리 편집기에서 작업 수행 후, 데이터 세트로 사용하는 게 처리 속도 빠르다.
  - 원본 데이터 → 쿼리 편집기 → Power BI Desktop으로 사용



---



### 데이터 모델링의 이해

- 다양한 관점으로 데이터를 탐색하기 위해 데이터를 정의하고 조직화해 나가는 단계이다.
- 관계형 데이터베이스라 한다.
- [데이터]보기나 [모델링]탭에서 제공한다.
- 관계 관리, 데이터 형식, 데이터 범주,  측정값 작성 등



---



### 관계 설정이 필요한 이유

- 여러 테이블을 하나의 테이블처럼 사용하여 다양한 관점의 데이터 분석이 가능하기 때문
- 각 테이블의 관련 필드를 연결해, 데이터의 연동을 통한 시각적 개체의 상호 작용이 가능
- 테이블 간의 관계 설정에 따라 사용자가 원하는 결과를 얻지 못할 수도 있기 때문



---



### 관계 설정(Relationship)

- 모든 테이블 간의 데이터가 함께 작동되도록 기준 필드와 논리적 연결(관계) 작성
  - [거래처] 테이블의 [거래처코드]와 [판매] 테이블의 [거래처코드] 연결
  - [거래처] 테이블의 [거래처코드]는 기본키(Primary Key)로 고유 정보만 포함
  - [판매] 테이블의 [거래처코드]는 외래키(Foreign Key)로 중복되는 정보를 포함하거나 없을 수 있음
- [모델]보기
  - 데이터 모델의 여러 테이블의 모든 관계를 그래픽으로 표시
  - 여러 테이블의 복잡한 관계를 가지고 있는 경우 이해하기 쉽고 사용자 관계 설정 및 편집 가능



---



### 관계 종류(카디널리티)

- 다대일, 일대다
  - 가장 일반적인 관계 형식으로 한 테이블의 열은 중복되는 값(레코드)을 가질 수 있고,  다른 관련 테이블은 하나의 값(레코드)만 가질 수 있음
- 일대일
  - 두 테이블의 열에는 중복 없이 하나의 값(레코드)만 가질 수 있음
- 다대다
  - 두 테이블의 열이 중복된 값(레코드)을 가질 수 있으며 복합 모델을 사용하여 테이블 간에 다대다 관계를 설정
  - 거의 사용을 안 한다.