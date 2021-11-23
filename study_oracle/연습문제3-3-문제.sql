-----------------------------------------------------------------------------------------------
--[연습문제 3-3]
--01. 사원테이블에서 30번 부서의 사번, 성명, 급여, 근무개월수, 근무년수를 조회
--단, 근무개월수는 오늘 날짜를 기준으로 날짜함수를 사용
SELECT  employee_id, first_name || ' ' || last_name name, salary, 
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "근무개월수",
        TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) "근무년수"
FROM    employees
WHERE   department_id = 30;

--02. 급여가 12000 이상인 사원들의 
--사번, 성명, 급여를 조회하여 급여순으로 정렬한다.
--급여는 공백없이(TRIM, FM) 천단위 기호(,)를 사용하여 표현한다.
--       ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
SELECT  employee_id, first_name || ' ' || last_name name, 
        TO_CHAR(salary,'FM9,999,999') salary1,
        TRIM(TO_CHAR(salary,'9,999,999')) salary2
FROM    employees
WHERE   salary >= 12000
ORDER BY salary ASC;

--03. 2005년 전(2004년까지)에 입사한 사원들의 
--사번, 성명, 입사일자, 입사일의 요일(DAY, DY) 을 조회하여 
--최근에 입사(DESC)한 사원순으로 정렬한다.
SELECT  employee_id, first_name || ' ' || last_name name, hire_date, 
        TO_CHAR(hire_date,'DY') hire_day
FROM    employees
--WHERE   TO_CHAR(hire_date,'YYYY') <= 2004
--WHERE   hire_date <= TO_DATE('2004-12-31')
WHERE   hire_date < TO_DATE('2005-01-01')
ORDER BY hire_date DESC;



-----------------------------------------------------------------------------------------------


