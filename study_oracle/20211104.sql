6. FROM 절에 사용하는 인라인 뷰 서브쿼리
SELECT 절의 결과를 FROM 절에서 하나의 테이블 처럼 사용(테이블 대체 용도)
--★★★FROM 절에 사용하는 인라인 뷰 서브쿼리에서 그룹함수는 반드시 ALIAS 로 지정해야 함
--★★★메인 쿼리에서 ALIAS 명을 컬럼명으로 사용하기 위해

01. 우리회사 최대급여, 최소급여, 평균급여 조회
SELECT  MAX(salary) max_sal, MIN(salary) min_sal, ROUND(AVG(salary)) avg_sal --24000	2100	6462
FROM    employees;

02. 우리회사 사번, 성, 급여, 최대급여, 최소급여, 평균급여 조회
스칼라 서브쿼리
SELECT  e.employee_id, e.last_name, e.salary, 
        ( SELECT  MAX(salary) FROM employees ) max_sal,
        ( SELECT  MIN(salary) FROM employees ) min_sal,
        ( SELECT  ROUND(AVG(salary)) FROM employees ) avg_sal
FROM    employees e;

인라인 뷰 서브쿼리
SELECT  e.employee_id, e.last_name, e.salary, m.*
FROM    employees e, ( SELECT MAX(salary) max_sal,
                              MIN(salary) min_sal,
                              ROUND(AVG(salary)) avg_sal
                       FROM   employees ) m;

03. 사원이 받는 급여가 회사평균급여 이상 최대급여 이하에 해당하는 사원들의
사번, 성, 급여, 우리회사최대급여, 우리회사최소급여, 우리회사평균급여 조회
1. 스칼라서브쿼리 --51
SELECT  e.employee_id, e.last_name, e.salary,
        ( SELECT  MAX(salary) FROM  employees ) max_sal,
        ( SELECT  MIN(salary) FROM  employees ) min_sal,
        ( SELECT  ROUND(AVG(salary)) FROM  employees ) avg_sal
FROM    employees e
WHERE   e.salary BETWEEN (SELECT  ROUND(AVG(salary)) FROM  employees) 
AND     (SELECT  MAX(salary) FROM  employees);

2. 인라인뷰서브쿼리
SELECT  e.employee_id, e.last_name, e.salary, m.*
FROM    employees e, ( SELECT MAX(salary) max_sal, MIN(salary) min_sal, ROUND(AVG(salary)) avg_sal
                       FROM   employees ) m
WHERE   e.salary BETWEEN m.avg_sal AND m.max_sal;

04. 각 부서별 가장 많은 급여를 받는 사원들의
사번, 성, 부서코드, 급여 조회
부서별 최대급여
SELECT  department_id, MAX(salary) 
FROM    employees
GROUP BY department_id
ORDER BY 1;

다중컬럼 서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.salary --11
FROM    employees e
WHERE   (e.department_id, e.salary) IN ( SELECT  department_id, MAX(salary) 
                                         FROM    employees
                                         GROUP BY department_id )
ORDER BY 3;

인라인 뷰 서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.salary --11
FROM    employees e, ( SELECT  department_id, MAX(salary) max_sal
                       FROM    employees
                       GROUP BY department_id ) m
WHERE   e.department_id = m.department_id(+)
AND     e.salary = m.max_sal
ORDER BY 3;

05. 사번, 성, 부서코드, 급여, 각 부서별 부서원수, 부서최대급여, 부서최소급여, 부서평균급여 조회
인라인뷰 서브쿼리 --107

각 부서별 부서원수, 부서최대급여, 부서최소급여, 부서평균급여 조회 --12
SELECT  department_id, COUNT(*) cnt, MAX(salary) max_sal, MIN(salary) min_sal, ROUND(AVG(salary)) avg_sal
FROM    employees 
GROUP BY department_id
ORDER BY 1;

SELECT  e.employee_id, e.last_name, e.department_id, e.salary, m.cnt, m.max_sal, m.min_sal, m.avg_sal
FROM    employees e, ( SELECT  department_id, 
                               COUNT(*) cnt, 
                               MAX(salary) max_sal, 
                               MIN(salary) min_sal, 
                               ROUND(AVG(salary)) avg_sal 
                       FROM    employees 
                       GROUP BY department_id ) m
--WHERE   e.department_id = m.department_id(+)
WHERE   NVL(e.department_id,0) = NVL(m.department_id,0)
ORDER BY 1;

7. 몇개의 데이터 행만 조회해 보자
데이터 행을 조회 : ROWNUM - 테이블에 존재하지는 않은 컬럼은 아니지만 사용할수 있는 가짜 컬럼(Pseudo Column),
--* SELECT 및 WHERE 절에서 사용
--* 쿼리문의 결과(조회 후, 즉 SELECT 절에 결과)로 나온 각 행에 대한 순서값
* 서브쿼리에서 먼저 정렬(ORDER BY) 후 메인 쿼리에서 순번 매기기(ROWNUM)
--※ ROWNUM 과 인라인뷰의 특성을 이용하여 페이징 처리 등의 작업을 수행

우리회사 사원들의
사번, 성, 급여 조회
SELECT  ROWNUM, employee_id, last_name, salary
FROM    employees;

급여를 많이 받는순으로
사번, 성, 급여 조회
SELECT  ROWNUM, employee_id, last_name, salary
FROM    employees
ORDER BY salary DESC;

사번순으로 조회하여 10번까지
사번, 성, 급여 조회
SELECT  ROWNUM, employee_id, last_name, salary
FROM    employees
WHERE   ROWNUM <= 10;

사번순으로 조회하여 10번까지 급여내림차순
사번, 성, 급여 조회
SELECT  ROWNUM, employee_id, last_name, salary
FROM    employees
WHERE   ROWNUM <= 10
ORDER BY salary DESC;

인라인뷰 급여 상위 10명에 대한
사번, 성, 급여 조회
SELECT  employee_id, last_name, salary
FROM    employees
ORDER BY salary DESC;

SELECT  ROWNUM, e.*
FROM    ( SELECT  employee_id, last_name, salary
          FROM    employees
          ORDER BY salary DESC ) e
WHERE   ROWNUM <= 10;


인라인뷰 이용하여 급여 하위 10명에 대한
사번, 성, 급여 조회
SELECT  ROWNUM, e.*
FROM    ( SELECT  employee_id, last_name, salary
          FROM    employees 
          ORDER BY salary ASC ) e
WHERE   ROWNUM <= 10;

인라인뷰 이용하여 가장최근에 입사한 10명에 대한
사번, 성, 급여 조회
SELECT  ROWNUM, e.*
FROM    ( SELECT  employee_id, last_name, salary
          FROM    employees
          ORDER BY hire_date DESC ) e
WHERE   ROWNUM <= 10;

인라인뷰 이용하여 입사가 가장 빠른 10명에 대한
사번, 성, 급여 조회
SELECT  ROWNUM, e.*
FROM    ( SELECT  employee_id, last_name, salary
          FROM    employees
          ORDER BY hire_date ASC ) e
WHERE   ROWNUM <= 10;

8. 순위를 결정하고 싶다면
RANK() OVER(순위결정기준)       : 1, 2, 2, 4
DENSE_RANK() OVER(순위결정기준) : 1, 2, 2, 3, 3, 3, 4
입사일자를 기준으로 먼저 입사한 사원 10명의
순위, 사번, 성, 입사일자 조회
SELECT  RANK() OVER(ORDER BY hire_date ASC) rank, employee_id, last_name, hire_date
FROM    employees
--WHERE   10등까지
--WHERE   rank <= 10; XXX --WHERE 절은 ALIAS 사용불가, 그룹함수 사용불가
--GROUP BY employee_id, last_name, hire_date;
--HAVING    RANK() OVER(ORDER BY hire_date ASC) < = 10;

그래서, 인라인뷰 사용
SELECT  ROWNUM, e.employee_id, e.last_name, e.hire_date
FROM    ( SELECT  RANK() OVER(ORDER BY hire_date ASC) rank, employee_id, last_name, hire_date
          FROM    employees ) e
WHERE   ROWNUM <= 10;

SELECT  e.*
FROM    ( SELECT  DENSE_RANK() OVER(ORDER BY hire_date ASC) rank, employee_id, last_name, hire_date
          FROM    employees ) e
WHERE   e.rank <= 10;






























































