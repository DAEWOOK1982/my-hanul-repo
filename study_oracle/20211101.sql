--------------------------------------------------------------------------------
JOIN 에 사용되는 테이블이 3개 이상일 경우
첫번째 JOIN 의 결과 두번째 JOIN 을 추가하는 형태로 JOIN 형식을 사용한다.
--------------------------------------------------------------------------------
06. 부서코드 10, 20, 40, 60 인 부서에 속한 사원들의
사번, 성, 부서코드, 부서명, 업무코드, 업무제목
오라클조인 --9
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
AND     e.department_id IN (10,20,40,60);

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
INNER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   e.department_id IN (10,20,40,60);

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name, job_id, j.job_title
FROM    employees e INNER JOIN departments d
USING   (department_id)
INNER JOIN jobs j
USING   (job_id)
WHERE   department_id IN (10,20,40,60);


2. OUTER JOIN : 오라클에서 기호(+)를 사용, 합집합
FROM 절에 LEFT OUTER JOIN/ RIGHT OUTER JOIN 을 사용하고
JOIN 조건은 ON/USING 절에 명시한다.
OUTER JOIN ☞ 기준이 되는 테이블 방향으로 조인한다.
LEFT  OUTER JOIN : 왼  쪽 테이블 기준으로 NULL 포함하여 모두 출력(오라클 조인에서 등호의 오른쪽에 (+) 붙은것)
RIGHT OUTER JOIN : 오른쪽 테이블 기준으로 NULL 포함하여 모두 출력(오라클 조인에서 등호의 왼  쪽에 (+) 붙은것)

01. 모든 사원들의 사번, 성, 부서코드, 부서명 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+);

NULL 갯수 파악
employees의 department_id
SELECT  COUNT(*) cnt
FROM    employees
WHERE   department_id IS NULL;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e LEFT OUTER JOIN departments d
ON      e.department_id = d.department_id;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name
FROM    employees e LEFT OUTER JOIN departments d
USING   (department_id);






































































