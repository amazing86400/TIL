# SQL 기초



### Select문

```sql
SELECT * FROM Customers;
SELECT CustomerID, CustomerName FROM Customers;
```

​	'from ~어디 테이블에서 select ~어떤 데이터를 가져오겠다.'라는 의미. 가장 첫 번째 코드는 Customers 테이블의 전체 데이터를 가져옴.

​	두 번째 코드는 Customers 테이블에서 CustomerID와 CustomerName 데이터만 가져옴. 



---



### DISTINCT

```sql
SELECT DISTINCT Country FROM Customers;
SELECT DISTINCT City FROM Customers;
```

​	DISTINCT는 중복 값을 제거한다. 첫 번째는 Country를 불러오는데, 중복된 값은 제거하여 갖고 온다. 두 번째는 City를 불러오는데, 여기서도 중복된 값을 제거하여 갖고 온다.



---



### 정렬

```sql
SELECT * FROM Customers ORDER BY CustomerID DESC;
SELECT * FROM Customers ORDER BY CustomerID ASC;
```

​	정렬은 오름차순과 내림차순이 있는데, DESC가 내림차순, ASC가 오름차순이다.



---



### 코드 작동

```sql
SELECT * 
FROM Customers 
ORDER BY CustomerName DESC;

SELECT * 
FROM Customers 
ORDER BY CustomerName asc;
```

​	코드를 위와 같이 각각 나눠서 입력해도 작동이 된다. 그리고 소문자로 써도 된다.



---



### 별칭

```sql
SELECT CustomerName AS 회원이름
FROM Customers 
ORDER BY CustomerName ASC;

SELECT CustomerID AS 회원번호, CustomerName AS 회원이름
FROM Customers 
ORDER BY CustomerName ASC;

SELECT CustomerID 회원번호, CustomerName 회원이름
FROM Customers 
ORDER BY CustomerName ASC;
```

​	파이썬과 같이 'AS'를 사용해 별칭을 지어줄 수 있다. 중요한 것은 라이브러리의 이름 자체가 바뀐 것이 아닌 별칭만 지어주는 것이다.

​	여러 개도 함께 사용 가능하며, 'AS'를 사용하지 않고 띄어쓰기만으로도 가능하다.



---



### 산술연산

```sql
SELECT 1+1;
SELECT 3-1;
SELECT 5*8;
SELECT 9/3;

SELECT CustomerID + 100 FROM Customers;
```

​	기본적인 산술연산은 select을 통해 모두 가능하다. 그리고 컬럼에도 연산을 할 수 있다.



```sql
SELECT ProductName AS 제품이름, Price AS 기존가, Price * 0.2 AS 할인된가격, Price * 0.8 AS 최종가
FROM Products
```

​	컬럼에 연산을 사용했다. 연산을 통해 새로운 컬럼도 생성하여 확인할 수 있다.



---



### 컬럼 합쳐서 나타내기(연결연산자)

```sql
SELECT Country || City || Address FROM Customers;
SELECT Country|| ' ' || ' ' || City || ' ' || Address FROM Customers;
SELECT Country|| ' ' || ' ' || City || ' ' || Address AS 주소 FROM Customers;
```

​	Customers 테이블에서 Country, City, Address 이 세 컬럼을 하나의 컬럼으로 나타내고 싶다. 이럴 땐 '||'를 컬럼명 사이마다 넣어주면 된다.

​	두 번째 코드는 공백을 포함시켜 내용의 구분을 주는 코드이다. 그리고 마지막 코드를 통해 컬럼명을 '주소'로 설정한다.

​	오라클에서 위와 같은 방법을 사용하고, MSQL에서는 플러스 연산자를 사용하고, MYSQL에서는 공백으로도 연결할 수 있다.



---



### 논리연산

```sql
SELECT * FROM Customers WHERE CustomerID BETWEEN 30 AND 50;
SELECT * FROM Customers WHERE CustomerID IN (10,20,30);
SELECT * FROM Customers WHERE CustomerID LIKE '1';
SELECT * FROM Customers WHERE CustomerID LIKE '1_';
SELECT * FROM Customers WHERE CustomerID LIKE '_1';
```

​	WHERE에 대해 조금만 설명하자면 '내가 앞에서 선택한 것 중에서 ~어떤 조건을 달아서 출력하겠다.'라는 의미다. 위 코드를 해석하자면 Customers 테이블에서 CustomerID가 30에서 50 사이에 있는 값을 출력하라는 의미이다.

​	두 번째 코드는 CustomerID가 10, 20, 30인 데이터를 추출한다.

​	세 번째 코드는 아이디에 1이 들어가는 것만 출력한다. 언더바'_'를 1 뒤에 입력하면 10부터 19까지를 출력한다. 반대로 1 앞에 위치하면 뒤에 숫자가 1인 수를 추출한다.(11, 21, 31, 41 등)



---



### 와일드카드

```sql
Paullab, Palutest, Paulcode

LIKE 'Paul%'
LIKE 'Paul_'
LIKE 'Paul___'
LIKE '%Paul%'
```

​	데이터가 Paullab, Palutest, Paulcode 이렇게 있을 때, LIKE 'Paul%'을 해주면 세 단어 모두 추출된다. 언더바를 하나만 줄 시에는 결과가 안 나오고, 3개를 주면 'Paullab'만이 추출된다. 그리고 마지막처럼 Paul 앞뒤로 '%'를 입력하면 Paul이 포함된 모든 문자를 추출한다.



---



### IS 구문

```sql
SELECT CustomerID, CustomerName FROM Customers WHERE CustomerID IS NULL;

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('leehojun', 'jejusi', 'korea')

SELECT * FROM Customers;
SELECT * FROM Customers WHERE Address IS NULL;
SELECT * FROM Customers WHERE Address IS NOT NULL;
```

​	IS NULL은 NULL 값을 가져온다. 현재 테이블에는 NULL 값이 없어 데이터 추출이 안될 것이다.

​	두 번째 코드는 행을 추가하는 코드이다. Customers 테이블에서 컬럼 (CustomerName, City, Country)에 각각 ('leehojun', 'jejusi', 'korea')라는 데이터를 삽입하여 생성한다. 그리고 실행을 늘릴수록 행이 계속 늘어난다.(3번 실행시키면 행이 3개 추가됨) 

​	Customers 테이블을 확인해 보면 행이 추가된 것을 확인할 수 있고, 컬럼 세 개를 제외한 나머지 컬럼에는 null 값으로 채워진 것을 확인할 수 있다. 그다음 코드를 입력하면 Address가 null 값인 데이터를 가져온다. 그리고 IS NOT NULL을 입력하면 NULL 값이 아닌 값을 가져온다.



---



### WHERE 절

```sql
SELECT CustomerID FROM Customers WHERE CustomerID > 80;
SELECT CustomerID FROM Customers WHERE CustomerID >= 80;
SELECT CustomerID FROM Customers WHERE CustomerID = 80;
SELECT * FROM Customers WHERE CustomerID = 80;

SELECT * FROM Customers WHERE CustomerID > 50 AND City = 'London';
SELECT * FROM Customers WHERE CustomerID > 50 OR City = 'London';

SELECT * FROM Customers WHERE CustomerID > 50 AND City != 'London';
SELECT * FROM Customers WHERE CustomerID > 50 AND NOT (City = 'London');
SELECT * FROM Customers WHERE CustomerID > 50 AND City <> 'London';
```

​	등호연산자를 사용한 WHERE 절이다. 첫 번째는 CustomerID가 80 초과인 값을 가져오고, 두 번째는 80 이상, 그리고 세 번째가 80인 ID를 추출한다. '*'로 전체 데이터를 가져올 때에는 내가 원하는 레코드만을 불러올 수 있다.

​	다섯 번째 코드는 ID가 50보다 크면서 City가 런던인 데이터를 추출하는 거고, 그다음 코드는 ID가 50보다 크거나 City가 런던인 데이터를 가져온다. 그리고 '!=' 이 표시는 같지 않다는 것이다. 즉, ID는 50보다 크면서 City는 런던이 아닌 데이터를 불러온다. 같은 의미로 NOT을 사용해도 되고, '<>'를 사용해도 된다. 편한 것을 사용하자.



---



### UPDATE

```sql
UPDATE Customers
SET CustomerName='하르방', City='한라산', Country='선계'
WHERE CustomerID = 1;

SELECT * FROM Customers;

UPDATE Customers
SET CustomerName='하르방', City='한라산', Country='선계';
```

​	UPDATE는 값을 바꾸는 행위이다. 단, 한번 실행하면 되돌릴 수가 없다. 첫 번째 코드는 Customers 테이블에서 SET에서처럼 값을 바꾸는데, 조건이 CustomerID가 1이어야 한다. 그리고 확인해 보면 바뀐 것을 알 수 있다.

​	조건을 주지 않으면 모든 데이터가 바뀐다. 그래서 이런 것들을 주의해야 한다. 항상 백업도 해둘 것!



---



### DELETE

```sql
DELETE FROM Customers WHERE Country='Germany';
```

​	DELETE는 데이터를 지우는 기능이다. 위 코드는 Customers 테이블에서 지역이 독일인 데이터를 삭제하는 코드다.



---



### TOP & LIMIT

```sql
SELECT TOP 10 * FROM Customers;
SELECT TOP 10 PERCENT * FROM Customers;
SELECT * FROM Customers LIMIT 3;
```

​	Customers 테이블에서 상위 10개의 데이터를 가져온다. 두세 번째 코드도 같은 결과가 나온다.



---



### CREATE & DROP

```sql
CREATE DATABASE sampledata_db;
CREATE TABLE sampledata_table;
DROP DATABASE sampledata_db;
DROP TABLE sampledata_table;
```

​	CREATE은 DB나 TABLE을 만들 수 있게 해주고, DROP은 DB나 TABLE을 지울 수 있게 해준다.



---



### SHOW

```sql
mysql> SHOW databases;
mysql> SHOW tables;
mysql> DESC table_name;
```

​	많이 사용하는 구문이다. 데이터베이스 전체 목록이 뜬다. 테이블도 마찬가지로 전체 테이블이 뜬다. 마지막 코드는 table_name에서 각각의 컬럼값들이 어떤 형태의 값들을 가지고 있는지를 확인할 수 있다. 이거는 마지막 시간에 더 자세히 다룰 예정이다.