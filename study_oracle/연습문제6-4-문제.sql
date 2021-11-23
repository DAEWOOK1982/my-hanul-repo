-----------------------------------------------------------------------------------------------
[연습문제 6-4]

01. 급여가 적은 상위 5명 사원의 
순위, 사번, 이름, 급여를 조회하는 쿼리문을 
ROWNUM 과 DENSE_RANK()를 사용한 인라인뷰 서브 쿼리를 사용하여 작성

급여 하위 5명의 순위, 사번, 이름, 급여 조회

1. ROWNUM 사용
SELECT  employee_id, first_name, salary
FROM    employees
ORDER BY salary ASC --급여오름차순

SELECT  ROWNUM, e.* --3.
FROM    ( SELECT  employee_id, first_name, salary
          FROM    employees
          ORDER BY salary ASC ) e --1.
WHERE   ROWNUM <= 5;  --2.

2. DENSE_RANK()사용
SELECT  e.*
FROM    ( SELECT  DENSE_RANK() OVER(ORDER BY salary ASC) rank, 
          employee_id, first_name, salary
          FROM    employees
        ) e
WHERE   e.rank <= 5;


02. 부서별로 가장 급여를 많이 받는 사원의 
사번, 이름, 부서코드, 급여, 업무코드를 조회하는 쿼리문 
인라인 뷰 서브 쿼리를 사용하여 작성
다중컬럼 서브쿼리를 사용하여 작성
부서별로 최대급여 급여
SELECT  department_id, MAX(salary)
FROM    employees
GROUP BY department_id;

1. 인라인뷰 서브쿼리
SELECT  e.employee_id, e.first_name, e.department_id, e.salary, e.job_id
FROM    employees e, ( SELECT  department_id, MAX(salary) max_sal
                       FROM    employees
                       GROUP BY department_id ) m
--WHERE   e.department_id = m.department_id(+) --XX
WHERE   NVL(e.department_id,0) = NVL(m.department_id,0) --OO
AND     e.salary = m.max_sal
ORDER BY e.department_id;

2. 다중컬럼 서브쿼리
SELECT  e.employee_id, e.first_name, e.department_id, e.salary, e.job_id
FROM    employees e
WHERE   ( e.department_id, e.salary ) IN ( SELECT  department_id, MAX(salary) max_sal
                                           FROM    employees
                                           GROUP BY department_id )
ORDER BY 3;

-----------------------------------------------------------------------------------------------