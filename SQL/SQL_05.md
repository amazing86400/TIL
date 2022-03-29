# SQL 이론



### DB

​	데이터베이스는 여러 사람이 공유하여 사용할 목적으로 체계화해 통합, 관리하는 데이터의 집합이다. 여러 응용 시스템의 통합된 정보를 저장하여 운영할 수 있는 공용 데이터들의 묶음이다.



---



### DB, RDB, DBMS, RDBMS

- DBMS : DB를 다루는 소프트웨어
- RDBMS : RDBMS를 다루는 소프트웨어

​	TOP3 오픈소스 RDBMS로는 MySQL, PostgreSQL, SQLite가 있다. 오픈소스가 아닌 곳에서는 Oracle이 독보적이다.



---



### 관계형 데이터베이스의 구성 요소

- TABLE : 행과 열로 구성됨
- VIEW : 데이터를 선택하여 만든 가상의 부분 집합 > SELECT 해서 특정 데이터를 추출하여 AS를 하면 화면에서는 바껴서 나오긴 하지만, 실제 문서에는 바뀌어 있지 않다.
- INDEX : 주소
- SEQUENCE : 시퀀스, 고유번호 자동생성
- SYNONYM : 시노임, 객체의 별칭



---



### SQL

​	SQL은 스토리지 언어의 표준이다. 만약 DB를 사용하여 어떤 프로젝트를 한다면 SQL을 다룰 수 있어야 한다.



---



### SQL 명령어 분류

​	BOLD 표시한 곳은 중요하니 많이 익혀두자.

- 데이터 조작어(DML) : DML이라고 알고 있는 것이 일반적이다.
  - **SELECT**
  - **INSERT**
  - **UPDATE**
  - **DELETE**
- 데이터 정의어(DDL)
  - **CREATE DATABASE**
  - **CREATE TABLE**
  - **CREATE INDEX**
  - **ALTER DATABASE**
  - **ALTER TABLE**
  - **DROP TABLE**
  - **DROP INDEX**
  - RENAME
  - TRUNCATE
- 데이터 제어어(DCL)
  - GRANT : 권한 부여
  - REVOKE : 권한 제거
- 트랜젝션 제어어(TCL)
  - COMMIT
  - ROLLBACK
  - SAVEPOINT



---



### Data 분석 과정

- KDD분석 절차(5가지 프로세스) 
  - KDD(Knowledge Discovery in Databases)는 프로파일링 기술을 기반으로 통계적 패턴이나 지식을 찾기 위해 체계적으로 정리한 데이터 마이닝 프로세스
  - 데이터마이닝, 기계학습, 인공지능, 패턴인식, 데이터 시각화 등에서 응용될 수 있는 구조
- 데이터(데이터셋 선택) >> 목표 데이터(데이터 전처리) >> 전처리 데이터(데이터 변환) >> 데이터 변환(데이터 마이닝) >> 패턴(데이터 마이닝 결과 평가) >> 지식



---



### 정형 데이터 and 비정형 데이터

- 정형데이터는 RDBMS에서 사용하는 테이블 안에 들어가 있는 형식이 잡혀 있는 데이터
- 비정형데이터, 비구조화 데이터, 비구조적 데이터는 미리 정의된 데이터 모델이 없거나 미리 정의된 방식으로 정리되지 않은 정보



---



### CRUD

​	개발자들과 의사소통할 때 굉장히 많이 쓰는 용어로 꼭 알고 있는 것을 추천!

- Create
- Read
- Update
- Delete