# 함수



### LOWER & UPPER

```sql
SELECT LOWER('HELLO WORLD')
SELECT UPPER('hello world')


SELECT CustomerID, CustomerName,
       LOWER(CustomerName) AS 소문자,
       UPPER(CustomerName) AS 대문자
FROM Customers;
```

​	LOWER와 UPPER는 각각 소문자와 대문자로 변환시켜주는 함수다. 파이썬에서 배웠기 때문에 어렵지 않다. 



---



### SUBSTR

```sql
>>> SELECT SUBSTR('Hello world', 1, 3)
Hel

>>> SELECT SUBSTR('Hello world', 1, 5)
Hello

>>> SELECT SUBSTR('Hello world', 7, 5)
>>> SELECT SUBSTR('Hello world', -5, 5)
>>> SELECT SUBSTR('Hello world', -5)
world
```

​	SUBSTR은 어떤 문자를 잘라내는 함수다. (문자, 시작 위치, 시작 위치부터의 위치) 구조다. 그리고 여기서도 역시 마이너스 인덱싱을 할 수 있다.



---



### LENGTH & COUNT

```sql
>>> SELECT LENGTH('HELLO WORLD')
11

>>> SELECT LENGTH('안녕하세요')
5

>>> SELECT COUNT('HELLO WORLD')
1
```

​	LENGTH는 문자열의 길이를 출력한다. COUNT는 문자열의 길이가 아닌, 갖고 있는 값의 개수를 출력한다.



---



### REPLACE

```sql
>>> SELECT REPLACE('HELLO WORLD', 'WORLD', 'SQL')
HELLO SQL

>>> SELECT REPLACE('안녕하세요', '하세요', '하시죠?')
안녕하시죠?
```

​	REPLACE는 문자를 다른 문자로 대체해 주는 함수다.



---



### CONCAT

```sql
SELECT CONCAT('HELLO','WORLD')
```

​	CONCAT은 연결을 시켜주는 함수다.



---



### 이름의 길이를 나타내고, 이름 앞 5글자를 '*'로 채우기

```sql
SELECT CustomerID, CustomerName,
LENGTH(CustomerName) AS 이름길이,
REPLACE(CustomerName, SUBSTR(CustomerName, 1, 5), '*****') AS 고객이름
FROM CUSTOMERS;
```

​	LENGTH 함수를 통해 이름의 길이를 나타내는 열을 생성했고, REPLACE와 SUBSTR 함수를 사용해 글자 앞 5자리를 '*'로 변환하였다. 여기서 SUBSTR 함수의 숫자는 (1, 5)로 해도 되고, (0, 6)으로 설정해도 된다.



---



### DATE & TIME

```sql
>>> SELECT DATE()
2022-03-16

>>> SELECT DATE() + 10
2032

>>> SELECT TIME()
14:09:28

>>> SELECT TIME() + 12
26
```

​	날짜를 출력할 수도 있다. 년-월-일. 연산도 해줄 수가 있는데, 연도에 계산이 된다.

​	TIME은 시-분-초로 출력하고, 한국시간은 아니다. 연산은 시에 계산이 되며, 24시가 넘어가는 것을 보니 그냥 숫자를 반환해 주는 것을 확인할 수 있다.



---



### 통계치

```sql
SELECT SUM(CUSTOMERID) AS 전체합 FROM CUSTOMERS;
SELECT MAX(CUSTOMERID) AS 최대값 FROM CUSTOMERS;
SELECT MIN(CUSTOMERID) AS 최소값 FROM CUSTOMERS;
SELECT COUNT(CUSTOMERID) AS 총개수 FROM CUSTOMERS;
SELECT AVG(CUSTOMERID) AS 총평균 FROM CUSTOMERS;
```

​	통계를 나타내는 함수도 파이썬과 비슷하다. 다만 평균을 구하는 부분에서 SQL은 AVG 함수를 사용한다.



---



### 아스키코드

```sql
SELECT CHAR(65) || CHAR(65)
SELECT CONCAT(CHAR(65), CHAR(65))
SELECT ASCII('A')
```

​	아스키코드를  활용한 함수 활용이다.