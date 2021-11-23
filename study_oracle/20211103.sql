05. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들과 같은 부서에 속한
사원들의 사번, 성, 부서코드, 업무코드 조회
성에 대소문자 무관하게 z가 포함된 성을 가진 사원들과 같은 부서
SELECT  department_id --60,80,110
FROM    employees
WHERE   LOWER(last_name) LIKE '%z%';

SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --41
FROM    employees e
--WHERE   e.department_id IN (성에 대소문자 무관하게 z가 포함된 성을 가진 사원들과 같은 부서)
WHERE   e.department_id IN ( SELECT  department_id --60,80,110
                             FROM    employees
                             WHERE   LOWER(last_name) LIKE '%z%' );

※ 비교
성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들의
사번, 성, 부서코드, 업무코드 조회
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --60,80,110
FROM    employees e
WHERE   LOWER(e.last_name) LIKE '%z%';

06. 60번 부서원들과 같은 급여를 받는 사원들의
사번, 성, 급여, 부서코드 조회
60번 부서원들의 급여
SELECT  salary
FROM    employees 
WHERE   department_id = 60;

SELECT  e.employee_id, e.last_name, e.salary, e.department_id
FROM    employees e
--WHERE   e.salary IN ( 60번 부서원들의 급여 );
WHERE   e.salary IN ( SELECT  salary
                      FROM    employees 
                      WHERE   department_id = 60 );

07. 60번 부서에 속하지 않으면서
60번 부서원들과 같은 급여를 받는 사원들의
사번, 성, 급여, 부서코드 조회
SELECT  e.employee_id, e.last_name, e.salary, e.department_id
FROM    employees e
--WHERE   e.salary IN ( 60번 부서원들의 급여 );
WHERE   e.salary IN ( SELECT  salary
                      FROM    employees 
                      WHERE   department_id = 60 )
--AND     e.department_id != 60;
--AND     e.department_id <> 60;
AND     e.department_id NOT IN (60);

08. 우리회사 사원들 중 부서명이 Marketing 이거나 IT에 속한 부서의 사원들의
사번, 성, 부서코드 조회
조건 : 부서명과 부서가 속한 테이블 ? : departments 
부서명이 Marketing 이거나 IT에 속한 부서
SELECT  department_id --20,60
FROM    departments 
--WHERE   LOWER(department_name) LIKE ('marketing','it'); --XXX
----------------------------------------------------
--WHERE   LOWER(department_name) LIKE '%marketing%'
--OR      LOWER(department_name) LIKE '%it%'--OOO
----------------------------------------------------
WHERE   LOWER(department_name) IN ('marketing','it'); --OOO

SELECT  e.employee_id, e.last_name, e.department_id --7
FROM    employees e
--WHERE   e.department_id IN (부서명이 Marketing 이거나 IT인 부서);
WHERE   e.department_id IN ( SELECT department_id
                             FROM   departments
                             WHERE  LOWER(department_name) IN ('marketing', 'it') );

3. 다중 컬럼 서브쿼리 : 서브쿼리의 결과 컬럼이 여러 컬럼인 경우, 조건의 결과값을 기준으로 컬럼이 여러개
--★ 다중컬럼은 쌍(pair) 형태로 비교
01. 부서별로 가장 많은 급여를 받는 사원의
부서코드, 최대급여 조회
SELECT  department_id, MAX(salary) max_sal --12
FROM    employees
GROUP BY department_id
ORDER BY 1;

02. 부서별로 가장 많은 급여를 받는 사원의
부서코드, 최대급여, 이름 조회
SELECT  department_id, MAX(salary) max_sal, first_name
FROM    employees
--WHERE   
GROUP BY department_id, first_name
ORDER BY 1; --문법은 맞지만 결과가 이상함

SELECT  e.department_id, e.salary, e.first_name
FROM    employees e
WHERE   (NVL(e.department_id,0), e.salary) IN ( SELECT NVL(department_id,0), MAX(salary)
                                                FROM   employees 
                                                GROUP BY department_id )
ORDER BY 1;

NVL(대상, NULL 일때 표현)
--  ￣￣￣￣￣￣￣￣￣￣(데이터 타입이 일치해야 함)

NVL2(대상, NULL이 아닐때 표현, NULL 일때 표현)
--         ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣(데이터 타입이 일치해야 함)


03. 부서별로 가장 많은 급여를 받는 사원의
사번, 성, 부서코드, 최대급여, 업무코드
부서별로 가장 많은 급여
SELECT  department_id, MAX(salary)
FROM    employees
GROUP BY department_id;

SELECT  e.employee_id, e.last_name, e.department_id, e.salary, e.job_id
FROM    employees e
WHERE   (NVL(e.department_id,0), e.salary) IN ( SELECT  NVL(department_id,0), MAX(salary)
                                                FROM    employees
                                                GROUP BY department_id )
ORDER BY 3;

04. 각 부서별로 가장 최근에 입사한 사원들의
사번, 성, 부서코드, 가장 최근 입사일자 조회

부서별로 가장 최근에 입사일자
SELECT  department_id, MAX(hire_date)
FROM    employees
GROUP BY department_id;

SELECT  e.employee_id, e.last_name, e.department_id, e.hire_date
FROM    employees e
WHERE   (NVL(department_id,0), hire_date) IN ( SELECT  NVL(department_id,0), MAX(hire_date)
                                               FROM    employees
                                               GROUP BY department_id )
ORDER BY department_id;

05. 매니저가 없는 사원(100번 사원)이 매니저로 있는
부서코드, 부서명 조회 --다중결과행, 5
매니저가 없는 사원
SELECT  employee_id --100
FROM    employees
WHERE   manager_id IS NULL;

manager_id 가 100번인 사원이 매니저로 있는
SELECT  DISTINCT e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
--AND     e.manager_id IN (100)
AND     e.manager_id IN ( SELECT  employee_id
                          FROM    employees
                          WHERE   manager_id IS NULL ) 
ORDER BY 1;

4. 상호연관 서브 쿼리 : 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 형태
- 메인쿼리의 값을 서브 쿼리에 주고, 서브 쿼리의 결과 값을 받아서 메인쿼리로 반환해서 
  수행하는 쿼리
- 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되어 메인쿼리에 독립적이지 않은 형식
- 메인 테이블과 서브 쿼리 테이블 간의 JOIN 조건이 사용됨.
- 메인 쿼리와 서브 쿼리가 계속 정보를 주고 받는다는 의미

★ 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 
  상호연관 서브 쿼리의 형태로 사용된다.(WHERE 절에서 사용)
- 스칼라 서브 쿼리에서 다룰 예정
                          
5. 스칼라 서브 쿼리 : SELECT 절에 사용 , 단일(결과)행, 단일컬럼만 조회가능, 
   Scalar : (크기)하나, Vector : 크기와 방향
- 단순한 그룹함수의 결과를  SELECT 절에서 조회하고자 할때
- SELECT 문에 서브 쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적(표현 용도)
- 조인(Join)의 대체 표현식으로도 자주 사용  
- 코드성 데이터를 조회하고자 할때  
- 조인 조건식이 필요할때는 스칼라 서브쿼리 안에서 WHERE 조건식 사용


1) 단순한 그룹함수의 결과값을 SELECT 절에 조회하고자 할때

01. 각 사원의 급여 수준을 파악하고자 한다.
모든 사원의 사번, 성, 급여, 회사평균급여, 회사최대급여 조회

SELECT  ROUND(AVG(salary)) avg_sal --6462
FROM    employees; 

SELECT  employee_id, last_name, salary, --107개
        ROUND(AVG(salary),0) avg_sal,
        MAX(salary) max_sal
FROM    employees
GROUP BY employee_id, last_name, salary;
--○○○------------------------------------------------------------------------------------------
SELECT  employee_id, last_name, salary, --107개
        ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal,
        ( SELECT MAX(salary) FROM employees ) max_sal
FROM    employees;
-----------------------------------------------------------------------------------------------

2) 코드성 테이블에서 코드명(즉, 데이터 컬럼명)을 SELECT 절에 조회하고자 할 때 : 상호연관 서브 쿼리, Outer Join 사용한것 처럼

01. 모든 사원의 사번, 성, 부서코드, 부서명 조회
일반 쿼리
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name --107개
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
ORDER BY 1;

스칼라서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, 
        ( SELECT  department_name
          FROM    departments
          WHERE   department_id = e.department_id ) department_name --107개
FROM    employees e;






























































