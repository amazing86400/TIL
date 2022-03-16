# 조건문과 함수



### CASE WHEN

```sql
>>> SELECT CASE WHEN 'GOOD' = 'JOB' THEN 'HELLO' ELSE 'WORLD' END;
WORLD

>>> SELECT CASE WHEN 'GOOD' = 'GOOD' THEN 'HELLO' ELSE 'WORLD' END;
HELLO

```

​	만약 'GOOD'과 'JOB'이 같다면 'HELLO'를 실행하고, 같지 않다면 'WORLD'를 실행해라. 두 번째는 참이었을 때의 예제이다.



---



### JOIN

```sql
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate # 추출 내용
FROM Orders # 기준인 테이블
INNER JOIN Customers # 붙는 테이블
ON Orders.CustomerID=Customers.CustomerID; # 붙는 컬럼
```

​	여기서는 INNER JOIN만 다루겠다. Orders 테이블이 기준이고, 거기에 Customers를 붙이는데, 겹치는 내용은 CustomerID 컬럼이다.



---



### UNION

```sql
SELECT CITY FROM CUSTOMERS
UNION
SELECT CITY FROM SUPPLIERS
ORDER BY CITY;
```

​	UNION은 합치는 함수다. CUSTOMERS 테이블과 SUPPLIERS 테이블의 CITY 컬럼을 합치는데, CITY 순으로 정렬하여 보겠다.



---



### GRUOP BY

```sql
SELECT CUSTOMERID, COUNTRY 
FROM CUSTOMERS
GROUP BY COUNTRY;

SELECT CUSTOMERID, COUNTRY 
FROM CUSTOMERS
GROUP BY COUNTRY
HAVING COUNT(CUSTOMERID) > 5;
```

​	GROUP BY는 어떤 특정 열을 기준으로 그룹화하여 다른 특정 열에 붙이는 작업이다. 첫 번째는 나라별 몇 개의 값이 있는지 확인하는 코드다. 그리고 그중 CUSTOMERID가 5개 이상인 값만을 추출하는 코드가 밑에 코드이다.

 

---



### Comments

```sql
--Select all:
SELECT * FROM Customers;

SELECT * FROM Customers -- WHERE City='Berlin';

--SELECT * FROM Customers;
SELECT * FROM Products;
```

​	Comments는 주석을 의미하며 '--'을 사용한다.