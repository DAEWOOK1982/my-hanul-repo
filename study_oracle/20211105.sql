8장. DML : DQL(SELECT) + DML + TCL
DML(Data Manupulation Language) - INSERT, UPDATE, DELETE
+ TCL(Transaction Control Language) - COMMIT(작업확정), ROLLBACK(작업취소)

1. 삽입 저장 : INSERT
1.1 INSERT INTO 테이블명
    VALUES ( 테이블 구조 순서에 맞는 데이터값 목록 );
1.2 INSERT INTO 테이블명 ( 컬럼명 나열 )
    VALUES ( 나열된 컬럼명 순서에 맞는 데이터값 목록 );
1.2 INSERT INTO 테이블명 --AS없음
    조회쿼리문(SELECT)
    ☜ ITAS : VALUE 절 없이 SELECT 절 사용해 서브쿼리 테이블로부터 여러행을 복사 저장
    INSERT 절의 저장할 컬럼 목록과 SELECT 절에 컬럼 목록 갯수가 같아야 함.

지정하지 않은 컬럼값은 자동으로 NULL 이 저장
날짜 데이터는 날짜 포맷형식을 사용해서 저장할 수 있음.

NULL : NULL, '', --OO, 'NULL' --XX

DESC departments;
이름              널?       유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)

1.1 
INSERT INTO 테이블명
VALUES  ( 테이블 구조 순서에 맞는 데이터값 목록 );

01. departments 테이블에 새로운 부서를 등록하자
부서코드 : 301, 부서명 : 영업부, 매니저코드 : '', 위치코드 : NULL

INSERT INTO departments
VALUES (300, '영업부', '', NULL);

SELECT  *
FROM    departments
ORDER BY 1 DESC;

INSERT INTO departments
VALUES (310, '개발부', NULL,'');

03. 기본값 : DEFAULT : NULL
INSERT INTO departments
VALUES (320, '개발부', DEFAULT, DEFAULT);

SELECT  *
FROM    departments
ORDER BY 1 DESC;

ROLLBACK;

1.2 
INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
VALUES  ( 나열된 컬럼명에 매칭될 데이터값의 목록 )

DESC departments;

INSERT INTO 테이블명 (테이블구조에서 NOT NULL 인 컬럼 + 추가컬럼목록)
VALUES  ( 나열된 컬럼명에 매칭될 데이터값의 목록 )

01. 
INSERT INTO departments (department_id, department_name)
VALUES (300,'개발부');

02. 
INSERT INTO departments (department_id)
VALUES (330);

03. 
DESC  employees;
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_Id, salary, department_id)
VALUES (301, '길동','홍','GILDONG', TO_DATE('10/10/10'), 'MK_REP',3000, 300);

SELECT  *
FROM    employees
ORDER BY 1 DESC;

COMMIT;

1.3. ☞ ITAS : 여러행을 한번에 삽입 저장, 테스트용 데이터
INSERT INTO 테이블명 --AS없음
  조회쿼리문(SELECT 절)

01. departments 테이블에 새로운 department_id( 1을 더하기)를 departments 테이블의 정보를 복사하여 저장
INSERT INTO departments
  SELECT  department_id + 1, department_name, manager_id, location_id
  FROM    departments;
  
SELECT  *
FROM    departments;

CTAS  (Create Table As Select) --NOT NULL 이외의 조건(Primary KEY 등)은 복사되지 않는다.
CREATE TABLE 테이블명 AS 조회쿼리문(SELECT 문)

CREATE TABLE emp1 AS
  SELECT  employee_id id, first_name, last_name, hire_date, job_id, department_id dept_id
  FROM    employees 
  WHERE   1 = 2;

CREATE TABLE emp1 AS
  SELECT  employee_id id, first_name, last_name, hire_date, job_id, department_id dept_id
  FROM    employees --전체테이블 생성해서 복사

SELECT  *
FROM    emp1;

CREATE TABLE emp2 AS
  SELECT  employee_id id, first_name, last_name, hire_date, job_id, department_id dept_id
  FROM    employees 
  WHERE   1 = 2; --엉터리 조건을 주어서 거짓이 되게 만들면 테이블 구조만 복사
  
SELECT *
FROM    emp2;

DROP TABLE 테이블명
DROP TABLE emp1;

테이블 복구
FLASHBACK TABLE 테이블명 TO BEFORE DROP;
FLASHBACK TABLE emp1 TO BEFORE DROP;

DROP TABLE emp1;
DROP TABLE emp2;

휴지통 비우기
PURGE RECYCLEBIN;

CREATE TABLE emp AS
  SELECT  employee_id id, first_name, last_name, hire_date, job_id, department_id dept_id
  FROM    employees 
  WHERE   1 = 2; --엉터리 조건을 주어서 거짓이 되게 만들면 테이블 구조만 복사

10번, 20번 부서원들의 정보를 복사 --3개 삽입

INSERT INTO emp(id, first_name, last_name, hire_date, job_id, dept_id) --AS 없음
  SELECT  employee_id, first_name, last_name, hire_date, job_id, department_id
  FROM    employees
  WHERE   department_id IN (10,20);

SELECT  *
FROM    emp;

COMMIT; --작업 확정

2. 변경저장 : UPDATE ☞ 반드시 조건지정
UPDATE  테이블
SET     컬럼명1 = 값1, 컬럼명2 = 값2
WHERE   조건식;

01. emp테이블에서 id = 202인 사원의 dept_id 를 30으로, 
job_id 를 'programmer' 로 변경저장

UPDATE  emp
SET     dept_id = 30, job_id = 'programmer'
WHERE   id = 202;

SELECT  *
FROM    emp;

COMMIT;

02. emp 테이블에서 id 가 202 인 사원의 job_id를 'PU_CLERK' 로 변경한다.
UPDATE  emp
SET     job_id = 'PU_CLERK'
WHERE   id = 202;


03. emp 테이블에서 id 가 202 인 사원의 dept_id를 NULL 로 변경한다.
UPDATE  emp
SET     dept_id = NULL
WHERE   id = 202;

SELECT  *
FROM    emp;

04. 서브쿼리로 데이터 행 변경
emp 테이블의 부서배치 받지 않은 사원의 부서코드를
employees 테이블의 job_id 'AD_PRES'인 사원의 부서코드로 변경

SELECT  department_id
FROM    employees
WHERE   job_id = 'AD_PRES'

UPDATE  emp
SET     dept_id = ( SELECT  department_id
                    FROM    employees
                    WHERE   job_id = 'AD_PRES' )
WHERE   dept_id IS NULL;

SELECT  *
FROM    emp;

05. employees 테이블의
301번 사원의 salary 를 4000으로, fist_name을 우치로 last_name을 전으로 변경저장
UPDATE  employees
SET     salary = 4000, first_name = '우치', last_name = '전'
WHERE   employee_id = 301;

06. employees 테이블의 
300번 부서에 속한 사원들의 salary를 5000으로 변경저장
UPDATE  employees
SET     salary = 5000
WHERE   department_id = 300;

07. employee테이블에 새로운 사원정보를 삽입저장하자.
300번으로 사번을 지정하고 급여는 60번 부서의 평균급여로 저장하자
employee_id, first_name, last_name, email, hire_date, job_id, salary
300, 길동, 홍, hong@naver.com, 오늘날짜, IT_PROG, 60번 부서의 평균
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (300,'길동','홍','hong@naver.com', SYSDATE, 'IT_PROG', (SELECT  ROUND(AVG(salary)) 
                                                               FROM    employees
                                                               WHERE   department_id = 60));

08. 300번 사원의 급여를 우리회사 최고급여 전화번호는 062.1234.5678로 변경저장
UPDATE  employees
SET     salary = ( SELECT MAX(salary)
                   FROM   employees), phone_number = '062.1234.5678'
WHERE   employee_id = 300;

실습
01. emp 테이블의 202 번 사원의 입사일자를
오늘로 부터 6개월 전 날짜로 변경 저장
UPDATE  emp
SET     hire_date = ADD_MONTHS(SYSDATE, -6)
WHERE   id = 202;

02. emp 테이블의 200 번 사원에 대해
employees 테이블의 60번 부서원들중 가장 최근에 입사한 입사일자로 변경저장
UPDATE  emp
SET     hire_date = ( SELECT  MAX(hire_date)
                      FROM    employees
                      WHERE   department_id = 60 )
WHERE   id = 200;  

COMMIT;

3. 데이터 행 삭제 : DELETE --반드시 조건기술
DELETE  FROM  테이블명
WHERE   조건절

01. employees 테이블에서 300번 사원코드를 삭제하자
DELETE  FROM employees
WHERE   employee_id = 300;

SELECT  *
FROM    employees;

02. departments 테이블에서 300번 부서를 삭제 하자
DELETE  FROM departments
WHERE   department_id = 300; --무결성 제약 조건 위반

그래서, 사원테이블에서 300번 부서를 삭제하고
그리고 나서 부서테이블에서 300번 부서를 삭제

DELETE  FROM  employees
WHERE   department_id = 300;

DELETE  FROM  departments
WHERE   department_id = 300;

03. emp 테이블의 20번 부서원들의 정보를 삭제
DELETE   FROM    emp
WHERE   dept_id = 20;

SELECT  *
FROM    emp;

COMMIT;








