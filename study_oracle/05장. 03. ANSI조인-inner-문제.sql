-------------------------------------------------------------------------------------------------
--실습 오라클 조인, ANSI JOIN(JOIN ON, JOIN USING) 까지 --INNER 조인까지만
--
--01. 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회 --106

오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id
AND     d.location_id = l.location_id;

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
INNER JOIN locations l
ON      d.location_id = l.location_id;

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name, location_id, l.city
FROM    employees e INNER JOIN departments d
USING   (department_id)
INNER JOIN locations l
USING   (location_id);

--02. 사번이 110, 130, 150 인 사원들의 사번, 성, 부서명 조회 --3
오라클 조인
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     e.employee_id IN (100,130,150);

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   e.employee_id IN (100,130,150);

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   e.employee_id IN (100,130,150);

--03. 사번, 성명, 관리자사번, 관리자 성명, 관리자업무코드 조회 --106, SELF JOIN
오라클 조인
SELECT  e.employee_id, e.first_name || ' ' || e.last_name 성명, 
        e.manager_id 관리자사번, m.first_name || ' ' || m.last_name 관리자성명, 
        m.job_id 관리자업무코드
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id;

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.first_name || ' ' || e.last_name 성명, 
        e.manager_id 관리자사번, m.first_name || ' ' || m.last_name 관리자성명, 
        m.job_id 관리자업무코드
FROM    employees e INNER JOIN employees m
ON      e.manager_id = m.employee_id;

ANSI 조인 JOIN USING --컬럼명 다르므로 사용불가

--04. 성이 king 인 사원의 사번, 성명, 부서코드, 부서명 조회 --2
오라클 조인
SELECT  e.employee_id, e.first_name || ' ' || e.last_name 성명, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     LOWER(last_name) LIKE '%king%';

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.first_name || ' ' || e.last_name 성명, e.department_id, d.department_name
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   LOWER(last_name) LIKE '%king%';

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.first_name || ' ' || e.last_name 성명, department_id, d.department_name
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   LOWER(last_name) LIKE '%king%';

--05. 관리자 사번이 149 번인 사원의 
--사번, 성, 부서코드, 부서명 조회 --5
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     e.manager_id = 149;

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   e.manager_id = 149;

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   e.manager_id = 149;

--06. 위치코드 1400인 도시명, 부서명 조회 --1
오라클 조인
SELECT  l.city, d.department_name
FROM    locations l, departments d
WHERE   d.location_id = l.location_id
AND     l.location_id = 1400;

ANSI 조인 JOIN ON
SELECT  l.city, d.department_name
FROM    locations l INNER JOIN departments d
ON      d.location_id = l.location_id
WHERE   l.location_id = 1400;

ANSI 조인 JOIN USING
SELECT  l.city, d.department_name
FROM    locations l INNER JOIN departments d
USING   (location_id)
WHERE   location_id = 1400;

--07. 위치코드 1800에 근무하는 사원들의 
--사번, 성, 업무코드, 부서명, 위치코드 조회 --2
오라클 조인
SELECT  e.employee_id, e.last_name, e.job_id, d.department_id, d.location_id
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     d.location_id = 1800;

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, e.job_id, d.department_id, d.location_id
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   d.location_id = 1800;

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, e.job_id, department_id, d.location_id
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   d.location_id = 1800;

--08. 성에 대소문자 무관하게 z가 있는 사원들의 
--사번, 성, 부서명 조회 --5
오라클 조인
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     LOWER(last_name) LIKE '%z%';

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   LOWER(last_name) LIKE '%z%';

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, d.department_name
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   LOWER(last_name) LIKE '%z%';

--09. 관리자보다 먼저 입사한 사원의 
--사번, 성, 입사일자, 관리자사번, 
--관리자성, 관리자입사일자 조회 --37
오라클 조인
SELECT  e.employee_id, e.last_name, e.hire_date 입사일자, 
        e.manager_id 관리자사번, m.last_name 관리자성, m.hire_date 관리자입사일자
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id
AND     e.hire_date < m.hire_date;

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, e.hire_date 입사일자, 
        e.manager_id 관리자사번, m.last_name 관리자성, m.hire_date 관리자입사일자
FROM    employees e INNER JOIN employees m
ON      e.manager_id = m.employee_id
WHERE   e.hire_date < m.hire_date;

ANSI 조인 JOIN USING --XX 컬럼명이 다르므로 사용불가

--10. 업무코드가 clerk종류의 업무형태인 사원들의 
--사번, 성, 부서명, 업무제목 조회 --45
오라클 조인
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
AND     LOWER(e.job_id) LIKE '%clerk%';

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
INNER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   LOWER(e.job_id) LIKE '%clerk%';

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e INNER JOIN departments d
USING   (department_id)
INNER JOIN jobs j
USING   (job_id)
WHERE   LOWER(e.job_id) LIKE '%clerk%';

--11. toronto 에 근무하는 
--사번, 성, 부서코드, 부서명, 도시명 조회 --2
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, l.city
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id
AND     d.location_id = l.location_id
AND     LOWER(l.city) LIKE '%toronto%';

ANSI 조인 JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, l.city
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
INNER JOIN locations l
ON      d.location_id = l.location_id
WHERE   LOWER(l.city) LIKE '%toronto%';

ANSI 조인 JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM    employees e INNER JOIN departments d
USING   (department_id)
INNER JOIN locations l
USING   (location_id)
WHERE   LOWER(l.city) LIKE '%toronto%';

-------------------------------------------------------------------------------------------------