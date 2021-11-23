※ ROLLUP
: GROUP BY 절에서 ROLLUP 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께
단계별 소계, 총계 정보를 구함.
--★ GROUP BY 절에서 ★ROLLUP 으로 묶은 컬럼표현★ 에 대해 총계를 구함

01. 각 부서별, 업무별 사원수와 급여합계, 부서별소계(???), 총계(???)를 조회
SELECT  department_id, job_id, SUM(salary)
FROM    employees
--WHERE   
GROUP BY  ROLLUP(department_id, job_id)
--HAVING
ORDER BY department_id ASC, job_id ASC;

※ CUBE
: GROUP BY 절에서 CUBE 함수를 사용하여 GROUP BY 구문에 의한 결과와 함께
모든 경우의 조합에 대해 소계, 총계 정보를 구함.
--★ GROUP BY 절에서 ★CUBE 으로 묶은 컬럼표현★ 에 대해 총계를 구함
SELECT  department_id, job_id, SUM(salary)
FROM    employees
--WHERE   
GROUP BY  CUBE(department_id, job_id)
--HAVING
ORDER BY department_id ASC, job_id ASC;

5. 조인(JOIN)
  하나의 테이블로부터 데이터를 조회할 수 없는 경우
  여러개의 테이블로부터 데이터를 조회하여
  합쳐진 테이블의 데이터를 조회
--￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣

부서정보 --27
SELECT  * FROM  departments;
사원정보 --107
SELECT  * FROM  employees;
업무정보 --19
SELECT  * FROM  jobs;

1. CARTESIAN PRODUCT(곱하기)
: WHERE 절에 JOIN 조건을 기술하지 않아 잘못된 데이터행의 결과를 갖게 되는 현항
cartesian product, cross join 이라고 함, SQL에서는 쓰이는 경우가 없음
사번, 성, 부서명 조회
SELECT  employee_id, last_name, department_name --107*27
FROM    employees, departments;

SELECT  107*27
FROM    dual;

2. EQUI JOIN(ANSI 에서는 INNER JOIN), 교집합
: WHERE 절에 동등(=)한 연산자를 사용하는 JOIN 형식이다.
즉, 테이블간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

※ JOIN 조건 ☞ 컬럼의 값이 같은 컬럼에 대해 조인조건식 설정
    조인조건식 : 테이블명.컬럼명 = 테이블명.컬럼명
--               ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣ 

※ 테이블 조인순서
1. FROM 절에 테이블목록을 나열하며, 테이블명에 ALIAS 설정
   (코드 라인을 줄이고 가독성을 높이기 위해)
2. 조인조건을 WHERE 절에 작성

※ 내부 해석 순서
5. SELECT
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
6. ORDER BY

01. employees, departments 테이블을 사용하여
사원들의 사번, 성, 부서명 조회
SELECT  employee_id, last_name, department_name --106
FROM    employees, departments
WHERE   employees.department_id = departments.department_id;

SELECT  e.employee_id, e.last_name, d.department_name --106
FROM    employees e, departments d
WHERE   e.department_id = d.department_id;
--      FK  =   PK

02. 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id;

03. 사번, 성, 업무코드, 업무제목 정보 조회
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id;

JOIN 하는 대상 테이블이 추가되면 JOIN 조건을 추가
WHERE 절에 JOIN 조건과 일반 조건을 함께 사용

WHERE 조인조건식에서
일반 조건식과 JOIN 조건식이 모두 필요한 경우
WHERE 조인조건식
AND   일반조건식 의 형태로 사용

--조인조건은 테이블갯수 - 1 만큼 필요

04. 사번, 성, 부서명, 업무제목을 조회
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id;

05. 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id;

06. 사번이 101인 사원의 사번, 이름, 부서명, 업무제목 조회
SELECT  e.employee_id, e.first_name, d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
AND     e.employee_id = 101;

07. 사번이 100,120,130,140인 사원들의 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     e.employee_id IN (100,120,130,140);

08. 매니저가 없는 사원의 사번의 이름, 업무제목 조회
SELECT  e.first_name, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
AND     e.manager_id IS NULL;








































































