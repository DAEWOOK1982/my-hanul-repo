------------------------------------------------------------------------
[연습문제 6-1]
01. 우리회사에서 가장 적은 급여를 받는 사원의 
사번, 성, 업무코드, 부서코드, 부서명, 급여 조회 --1
서브쿼리
최소급여
SELECT  MIN(salary) --2100
FROM    employees;

SELECT  e.employee_id, e.last_name, e.job_id, e.department_id, d.department_name, e.salary
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
--AND     e.salary = (최소급여);
AND     e.salary = ( SELECT MIN(salary)
                     FROM   employees );
                     
02. 부서명이 Marketing 인 부서에 속한 사원들의 
사번, 성명, 부서코드, 업무코드 조회 --2
일반쿼리
SELECT  e.employee_id, e.first_name || ' ' || e.last_name name, e.department_id, e.job_id
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
AND     LOWER(d.department_name) LIKE '%marketing%';

서브쿼리
부서명이 'Marketing'인 부서
SELECT  department_id
FROM    departments
WHERE   LOWER(department_name) LIKE '%marketing%';

SELECT  e.employee_id, e.first_name || ' ' || e.last_name name, e.department_id, e.job_id
FROM    employees e
--WHERE   e.department_id = ( 부서명이 'Marketing'인 부서 );
WHERE   e.department_id = ( SELECT  department_id
                            FROM    departments
                            WHERE   LOWER(department_name) LIKE '%marketing%' );

03. 우리회사 사장님보다 먼저 입사한 사원들의 --내입사일자 <  사장님입사일자, SELF JOIN
사번, 성명, 입사일자 조회 --10
사장은 그를 관리하는 매니저가 없는 사원을 말한다
일반쿼리
SELECT  e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date
FROM    employees e, employees m
--WHERE   e.manager_id = m.employee_id(+) --사장님 입사일자만 알면 되니까 굳이 조인조건식 불필요
WHERE   e.hire_date < m.hire_date --내가 먼저 입사, 03/06/17
AND     m.manager_id IS NULL; --사장님

서브쿼리
사장님 입사일자
SELECT  hire_date--03/06/17
FROM    employees
WHERE   manager_id IS NULL;

SELECT  e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date
FROM    employees e
WHERE   e.hire_date < (SELECT  hire_date
                       FROM    employees
                       WHERE   manager_id IS NULL);
------------------------------------------------------------------------