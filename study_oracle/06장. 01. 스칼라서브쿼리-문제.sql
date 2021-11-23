-----------------------------------------------------------------------------------------------
01. 모든 사원의 사번, 성, 부서코드, 부서명 조회 ( 스칼라 서브 쿼리로 "부서명" 구하기 )

일반 쿼리
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+);

스칼라 서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, 
        ( SELECT  department_name 
          FROM    departments 
          WHERE   department_id = e.department_id ) department_name
FROM    employees e;

-----------------------------------------------------------------------------------------------
02. 모든 사원의 사번, 성, 부서코드, 업무코드, 업무제목 조회 ( 스칼라 서브 쿼리로 "업무제목" 구하기 )

일반 쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id(+);

스칼라 서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id, 
        ( SELECT  job_title
          FROM    jobs
          WHERE job_id = e.job_id ) job_title
FROM    employees e;
-----------------------------------------------------------------------------------------------
03. 각 부서에 대해 부서코드, 부서명, 도시를 조회 ( 스칼라 서브 쿼리로 "도시" 구하기 )

일반 쿼리
SELECT  d.department_id, d.department_name, l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id(+);

스칼라 서브 쿼리
SELECT  d.department_id, d.department_name, 
        ( SELECT  city
          FROM    locations 
          WHERE   location_id = d.location_id ) city
FROM    departments d;

-----------------------------------------------------------------------------------------------
04. 모든 사원들의 사번, 성, 급여, 부서코드, 부서명, 업무코드 조회

일반 쿼리
SELECT  e.employee_id, e.last_name, e.salary, e.department_id, d.department_name, e.job_id
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+);

스칼라 서브 쿼리 ( 스칼라 서브 쿼리로 "부서명" 구하기 )
SELECT  e.employee_id, e.last_name, e.salary, e.department_id, e.job_id, 
        ( SELECT  department_name
          FROM    departments
          WHERE   department_id = e.department_id) department_name
FROM    employees e;
-----------------------------------------------------------------------------------------------
05. 각 부서에 대해 부서코드, 부서명, 위치코드, 도시명 조회

일반 쿼리
SELECT  d.department_id, d.department_name, d.location_id, l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id(+);

스칼라 서브 쿼리( 스칼라 서브 쿼리로 "도시" 구하기 )
SELECT  d.department_id, d.department_name, d.location_id, 
        ( SELECT  city
          FROM    locations
          WHERE   location_id = d.location_id ) city
FROM    departments d;

-----------------------------------------------------------------------------------------------
06. 각 부서별 부서코드, 부서평균급여 조회

일반 쿼리
SELECT  e.department_id, ROUND(AVG(salary)) avg_sal
FROM    employees e
GROUP BY e.department_id
ORDER BY 1;

스칼라 서브 쿼리( 스칼라 서브 쿼리로 "평균급여" 구하기 )
SELECT  e.department_id, 
        ( SELECT  ROUND(AVG(salary))
          FROM    employees
          WHERE   NVL(department_id,0) = NVL(e.department_id,0) ) avg_sal
FROM    employees e
GROUP BY e.department_id
ORDER BY 1;

-----------------------------------------------------------------------------------------------
07. 각 사원에 대해 사원이 소속된 부서의 급여정보 대비 사원의 급여를 파악하고자 한다.
사번, 성, 부서코드, 급여, 각 사원이 속한 부서의 평균급여 조회
--                        ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
스칼라 서브 쿼리( 스칼라 서브 쿼리로 "평균급여" 구하기 )
부서별 평균급여
SELECT  department_id, ROUND(AVG(salary)) avg_sal
FROM    employees
GROUP BY department_id
ORDER BY 1;

SELECT  e.employee_id, e.last_name, e.department_id, e.salary, ROUND(AVG(salary)) avg_sal
FROM    employees e
GROUP BY e.employee_id, e.last_name, e.department_id, e.salary
ORDER BY 1; --문법상으로는 정상이지만 결과가 이상하게 나옴

SELECT  e.employee_id, e.last_name, e.department_id, e.salary, 
        ( SELECT  ROUND(AVG(salary))
          FROM    employees
          WHERE   NVL(department_id,0) = NVL(e.department_id,0) ) avg_sal
FROM    employees e;


-----------------------------------------------------------------------------------------------