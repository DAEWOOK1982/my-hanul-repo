--실습
-----------------------------------------------------------------------------------------------
--01. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의
--사번, 성, 부서코드, 부서명 조회 --5개
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     LOWER(last_name) LIKE '%z%';

--02. 커미션을 받는 사원들의 
--사번, 성, 급여, 커미션요율, 업무제목 조회 --35개
SELECT  e.employee_id, e.last_name, e.salary, e.commission_pct, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
AND     e.commission_pct IS NOT NULL;

--03. 커미션을 받는 사원들의 
--사번, 성, 급여, 커미션금액, 부서명 조회  --34개
SELECT  e.employee_id, e.last_name, e.salary, e.commission_pct, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     e.commission_pct IS NOT NULL;

--04. 각 부서에 대한 정보를 파악하고자 한다.
--각 부서의 부서코드, 부서명, 위치코드, 도시를 조회  --27개
--위치코드 : location_id 
--도시명   : city
SELECT  d.department_id, d.department_name, d.location_id, l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id;

--05. 사번, 성, 부서코드, 부서명, 근무지도시명, 주소 조회  --106개, 조인조건은 table갯수 -1 만큼 필요!!
--주소     : street_address
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, l.city, l.street_address
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id
AND     d.location_id = l.location_id;

--06. 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회  --106개, 조인조건은 table갯수 -1 만큼 필요!!
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id;

--07. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명, 대륙명 조회 --27개, 조인조건은 table갯수 -1 만큼 필요!!
--위치코드 : location_id 
--도시명   : city
--국가코드 : country_id
--국가명   : country_name
--대륙명   : region_name
SELECT  d.department_id, d.department_name, d.location_id, l.city, c.country_id, c.country_name,
        r.region_name
FROM    departments d, locations l, countries c, regions r
WHERE   d.location_id = l.location_id
AND     l.country_id = c.country_id
AND     c.region_id = r.region_id;
-----------------------------------------------------------------------------------------------












