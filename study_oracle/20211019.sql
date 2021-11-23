2.3 산술연산자
1. 산술연산자 : +, -, *, / : SELECT 절과 WHERE 절에서 사용 가능

01. 80번 부서의 사원의
사번, 성, 급여, 한해동안 받은 급여(연봉) 조회
SELECT  employee_id, last_name, salary, salary * 12 AS "연봉" --34
FROM    employees
WHERE   department_id = 80;

SELECT 절에 다음과 같을때 ALIAS(별칭, 별명, 애칭) 를 습관적으로 지정하기
1. 컬럼표현에 연산자/함수가 사용된 경우
2. 컬럼표현이 지나치게 긴 경우

○ ALIAS 사용 방법
1. 키워드 AS 사용    : 컬럼표현 AS ALIAS명
2. 공백을 두고 사용  : 컬럼표현 ALIAS명 --★ 가장 많이 사용
3. ALIAS 명에 공백이 있으면 쌍따옴표(")를 사용하고 공백이 없으면 쌍따옴표(") 생략

02. 연봉이 15000이상인 사원들의
사번, 이름, 성, 업무코드, 급여, 연봉 조회
SELECT  employee_id, first_name, last_name, job_id, salary, salary * 12 연봉
FROM    employees
--WHERE   연봉 >= 15000; --XXX, WHERE절에서는 ALIAS 사용 불가
WHERE   salary * 12 >= 15000; --XXX, WHERE절에서는 ALIAS 사용 불가

03. 성명이 'StevenKing' 인 사원의
사번, 이름, 업무코드, 급여, 부서코드(dept_id 로 ALIAS) 조회
SELECT  employee_id, first_name, job_id, salary, department_id dept_id
FROM    employees
WHERE   first_name || last_name = 'StevenKing'; --성명이 StevenKing

04. 사번이 101번인 사원의 사번, 성명을 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 ALIAS 한다.
SELECT  employee_id, first_name || ' ' || last_name name
FROM    employees
WHERE   employee_id = 101;

05. 사번이 101번인 사원의 성명과 연봉을 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 ALIAS
연봉은 'annual salary'로 ALIAS
SELECT  first_name || ' ' || last_name name, 
        salary * 12 "annual salary"
FROM    employees
WHERE   employee_id = 101;

3. 비교 연산자 : =, !=, <>, ^=, >, <, >=, <=
01. 급여가 3000이하인 사원의
사번, 성, 급여, 부서코드, 업무코드 조회
SELECT  employee_id, last_name, salary, department_id, job_id
FROM    employees
WHERE   salary <= 3000;

02. 부서코드가 80 초과인 사원의
사번, 성, 급여, 부서코드 조회
SELECT  employee_id, last_name, salary, department_id
FROM    employees
WHERE   department_id > 80;

03. 부서코드가 90 인 부서의 속한 사원들의
사번, 이름, 성, 부서코드, 업무코드 조회
SELECT  employee_id, first_name, last_name, department_id, job_id
FROM    employees
WHERE   department_id = 90;

★ 문자데이터의 표현 : 반드시 홑따옴표로 묶어 사용(문자, 날짜)
04. 성이 King인 사원들의
사번, 이름, 성, 부서코드 조회
SELECT  employee_id, first_name, last_name, department_id
FROM    employees
WHERE   last_name = 'King';

기본날짜 데이터 포맷 조회
시스템의 현재날짜를 반환하는 함수 - SYSDATE
다른 함수와는 달리 파라미터가 필요하지 않은 함수
--직접 입력된 날짜는 TO_CHAR로 변환 안됨
--SYSDATE와 hire_date 등 날짜가 입력되어 있는 컬럼은 TO_CHAR 로 변환

SELECT  *
FROM    v$nls_parameters;

SELECT  VALUE --RR/MM/DD
FROM    nls_session_parameters
WHERE   parameter = 'NLS_DATE_FORMAT';

--오늘날짜를 조회, 
SELECT  SYSDATE today --21/10/19, 날짜는 '/'로 구분
FROM    dual; --dual : 가짜데이터 테이블, 가라테이블

--TO_CHAR : 날짜 포맷을 이용하여 사용자가 원하는 형태의 문자로 변환
SELECT  TO_CHAR(SYSDATE, 'YYYY/MM/DD') today --2021/10/19
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YYYY-MM-DD') today --2021-10-19
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YYYY.MM.DD') today --2021.10.19
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS') today --2021/10/19 11:29:36(12시각제)
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') today --2021/10/19 11:29:36(24시각제)
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YEAR-MONTH-DAY') today --TWENTY TWENTY-ONE-10월-화요일
FROM    dual;

SELECT  TO_CHAR(SYSDATE, 'YEAR-MON-DY') today --TWENTY TWENTY-ONE-10월-화
FROM    dual;

05. 입사일이 2004년 1월 1일 이전(2003년까지) 인 사원의
사원코드, 성, 입사일자 조회 --14개
SELECT  employee_id, last_name, hire_date
FROM    employees
--WHERE   hire_date <= '2003/12/31'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date < '2004/01/01'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date <= '2003-12-31'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date < '2004-01-01'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date <= '03/12/31'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date < '04/01/01'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date <= '03-12-31'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   hire_date < '04-01-01'; --날짜는 반드시 홑따옴표로 묶어 사용
--WHERE   TO_CHAR(hire_date,'YYYY') < 2004;
--WHERE   TO_CHAR(hire_date,'YYYY') < '2004';
--WHERE   TO_CHAR(hire_date,'YYYY') <= 2003;
WHERE   TO_CHAR(hire_date,'YYYY') <= '2003';

SELECT  10 + '10' --20
FROM    dual;

4. 논리연산자
4.1 AND 연산자 : 조건이 모두 TRUE 일때만 TRUE 를 반환

01. 30번 부서 사원 중 급여가 10000이하인 사원의
사번, 성명, 급여, 부서코드 조회
성명은 이름과 성을 합하여 사용하고 'name' 으로 ALIAS 한다.
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
WHERE   department_id = 30 
AND     salary <= 10000;

02. 30번 부서에서 급여가 10000이하이면서 2005년 이전(즉, 2004년까지)에 입사한 사원의
사번, 성명, 급여, 부서코드, 입사일자 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id, hire_date
FROM    employees
WHERE   department_id = 30 
AND     salary <= 10000
--AND     hire_date <= '2004/12/31'; --날짜, 문자는 반드시 홑따옴표로 묶음
AND     TO_CHAR(hire_date,'YYYY') <= '2004';

03. 부서코드가 10이상 30이하인 사원들의
사번, 성명, 부서코드 조회
성명은 이름과 성을 합하여 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, department_id
FROM    employees
WHERE   department_id >= 10
AND     department_id <= 30;

04. 급여가 10000이상 15000이하인 사원들의
사번, 성명, 급여, 업무코드 조회
성명은 이름과 성을 합하여 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, salary, job_id
FROM    employees
WHERE   salary >= 10000
AND     salary <= 15000;

05. 부서가 60인 부서에서 급여가 5000이상인 사원들의
사번, 성명, 부서코드, 급여 조회
성명은 이름과 성을 합하여 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, department_id, salary
FROM    employees
WHERE   department_id = 60
AND     salary >= 5000;

06. 부서코드가 60이하이면서 2003년 6월 17일 이전에 입사한 사원들의
사번, 성명, 입사일자 조회
성명은 이름과 성을 합하여 사용하고 'name'으로 별명한다.
SELECT  employee_id, first_name || ' ' || last_name name, hire_date
FROM    employees
WHERE   department_id <= 60
AND     hire_date <= '2003/06/17';

4.2 OR 연산자는 조건중에 하나만 TRUE 이면 TRUE 를 반환한다.
07. 30번 부서나 60번 부서에 속한 사원들의 
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
WHERE   department_id = 30
OR      department_id = 60;

08. 부서코드가 10, 20, 30 인 부서에 속한 사원들의
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
WHERE   department_id = 10
OR      department_id = 20
OR      department_id = 30;

4.3 AND 연산자와 OR 연산자 를 혼합하여 문장을 작성한다.
09. 30번 부서의 급여가 10000미만인 사원과 --AND
    60번 부서의 급여가  5000이상인 사원의 --AND
    성명, 급여, 부서코드 조회
SELECT  first_name || ' ' || last_name name, salary, department_id
FROM    employees
WHERE   (department_id = 30 AND     salary < 10000)
OR      (department_id = 60 AND     salary >  5000);
  
연산자 순위
산술연산인 경우 : *,/ -> +,-
논리연산인 경우 : AND -> OR 
    
5. 범위 조건 연산자 : BETWEEN ~ AND
BETWEEN 시작값 AND 마지막값 : 시작값 이상 마지막값 이하 와 같다.
BETWEEN 이나 관계연산자로 비교할 수 있는 값은 숫자, 문자, 날짜 데이터
A이상 B이하 : 컬럼명 BETWEEN A AND B
A미만 B초과 : 컬럼명 NOT BETWEEN A AND B
              NOT 컬럼명 BETWEEN A AND B
              
01. 사번 110번부터 120번까지 
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
--WHERE   employee_id >= 110
--AND     employee_id <= 120;
WHERE   employee_id BETWEEN 110 AND 120;

02. 사번 110번 미만부터 120번 초과까지 
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
--WHERE   employee_id < 110
--OR      employee_id > 120;
--WHERE   employee_id NOT BETWEEN 110 AND 120;
WHERE   NOT employee_id BETWEEN 110 AND 120;

03. 사번이 110에서 120인 사원중 급여가 5000에서 10000사이의
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name, salary, department_id
FROM    employees
WHERE   employee_id BETWEEN 110 AND 120
AND     salary BETWEEN 5000 AND 10000;

04. 2005년 1월 1일 이후부터 2007년 12월 31일 사이에 입사한 사원의
사번, 성명, 급여, 입사일자 조회 --72
SELECT  employee_id, first_name || ' ' || last_name name, salary, hire_date
FROM    employees
--WHERE   hire_date BETWEEN '2005/01/01' AND '2007/12/31';
--WHERE   TO_CHAR(hire_date,'YYYY') BETWEEN '2005' AND '2007';
WHERE   TO_CHAR(hire_date,'YYYY') BETWEEN 2005 AND 2007;

※ DATE 타입의 hire_date 의 값을 문자값으로 비교했음에도 오류없이 결과가 나오는 이유는
오라클 SQL엔진이 자동으로 묵시적 형변환을 했기 때문이다.
하지만 가급적 명시적으로 형변환 하는것이 바람직하다.
명시적 형변환 함수는 TO_DATE() 이다.
SELECT  employee_id, first_name || ' ' || last_name name, salary, hire_date
FROM    employees
WHERE   hire_date BETWEEN TO_DATE('2005/01/01') AND TO_DATE('2007/12/31');

06. 입사일자가 2003년 8월 1일 부터 2005년 7월 31일 에 해당하는 사원들의
사번, 성명, 입사일자 조회
SELECT  employee_id, first_name || ' ' || last_name name, hire_date
FROM    employees
WHERE   hire_date BETWEEN TO_DATE('2003/08/01') AND TO_DATE('2005/07/31');

07. 부서코드가 20, 30, 40, 60, 100 인 부서에 속한 사원들의
사번, 성명, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, department_id
FROM    employees
WHERE   department_id = 20
OR      department_id = 30
OR      department_id = 40
OR      department_id = 60
OR      department_id = 100;

6. IN 조건 연산자
여러개의 값 중에서 일치하는 값이 있는지 비교할때는 IN (값1, 값2, 값3, ...) 의 형태로
비교하는 값의 목록을 나열한다.
: 동일한 컬럼표현에 대해 동등 비교한 형태의 조건식을 OR 형태로 나열한것
컬럼표현 IN (데이터값 목록) <-> 컬럼표현 NOT IN (데이터값 목록)
                                NOT 컬럼표현 IN (데이터값 목록)

IN 연산자는 OR 연산자와 동일한 기능을 수행
비교할 값이 많을때 OR 연산자를 사용하면 SQL 문장이 길고 복잡해지는데
IN 연산자를 사용하면 문장이 깔끔해지고 가독성이 높아짐.

01. 30번 부서원 또는 60번 부서원 또는 90번 부서원의
사번, 성명, 급여, 부서코드 조회 --14
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
--WHERE   department_id = 30
--OR      department_id = 60
--OR      department_id = 90;
WHERE   department_id IN (30, 60, 90);

02. 30번 부서원 또는 60번 부서원 또는 90번 부서원이 아닌
사번, 성명, 급여, 부서코드 조회
SELECT  employee_id, first_name || ' ' || last_name name, salary, department_id
FROM    employees
--WHERE   department_id != 30
--AND     department_id != 60
--AND     department_id != 90;

--WHERE   department_id NOT IN (30, 60, 90);
WHERE   NOT department_id IN (30, 60, 90); --92

































