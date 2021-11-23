6.1 서브쿼리(Sub Query) :
  SQL 문장안에 존재하는 또 다른 SQL 문장을 서브쿼리라 한다.
  서브쿼리는 괄호() 로 묶어 사용하고, 서브쿼리가 포함된 쿼리문을 메인쿼리라 한다.
--           ￣￣￣￣￣￣￣￣￣￣   
  서브쿼리는 단일 행 또는 복수행 비교 연산자와 함께 사용 가능
  서브쿼리는 ORDER BY 를 사용하지 못함.
  ORDER BY 는 메인쿼리의 문장의 마지막에 하나만 사용할수 있다.
  서브쿼리의 결과는 메인쿼리의 조건으로 사용
  서브쿼리는 메인쿼리가 서브쿼리를 포함하는 종속적인 관계
  서브쿼리는 연산자의 오른쪽에 사용
  여러번의 쿼리를 수행해야만 얻을 수 있는 결과를 하나의 중첩된 SQL 문장으로 간편하게 결과를 얻을 수 있게 해줌
  
※ 서브쿼리 사용이유
1. 알려지지 않은 기준을 이용한 검색을 하기 위해
★ 테이블내에서 조건을 설정하기가 어려워 다른 테이블에서 조건을 가져와야 할 경우
  단일 SELECT 문으로 조건식을 만들기에는 조건이 복잡할 때
    또는 완전히 다른 테이블에서 데이터 값을 조회하여 메인쿼리의 조건으로 사용하고자 할 경우
    
2. DB에 접근하는 속도를 향상 시킴

※ 서브쿼리가 사용가능한 곳
SELECT  
FROM    
WHERE   : 제일 많이 사용되는 곳
HAVING
ORDER BY 

INSERT절의 VALUES
UPDATE절의 SET

※ 서브쿼리의 위치에 따른 명칭
1. SELECT   절에 사용하는 서브쿼리
   ○ 스칼라 서브쿼리 ☞ 스칼라 : 단일값(크기하나), 벡터 : 크기와 방향
   SELECT 절에서 하나의 컬럼처럼 사용하기 위한 목적(컬럼 표현 용도)
   조인의 대체 표현식으로도 자주 사용
   
2. FROM     절에 사용하는 서브쿼리
  ○ 인라인 뷰 서브쿼리
  SELECT 절의 결과를 FROM 절에서 하나의 테이블처럼 사용(테이블 대체 용도)
  인라인 뷰 서브쿼리에서 ORDER BY 절은 올 수 없음(출력용도가 아니고 테이블용도이므로)
  인라인 뷰 서브쿼리에서는 반드시 그룹함수에 대해 ALIAS 사용
  
3. WHERE    절에 사용하는 서브쿼리
  ○ 일반 서브쿼리 : 메인 쿼리문 안에 있는 또 다른 쿼리문(WHERE/HAVING 조건절 안에서 사용)
  ★ 서브쿼리의 SELECT 절에 결과를 하나의 변수 또는 상수처럼 사용
  (조건절의 서브쿼리의 결과에 따라 달라짐) ☞ 단일 결과행, 다중 결과행, 다중 컬럼인지에 따라 달라짐
--------------------------------------------------------------------------------
  보통 함수로 구한값과 비교할때, 다른곳에서 구한값과 비교할 때
--------------------------------------------------------------------------------
3.1 단일 결과행 서브쿼리 - 조건절에 사용하는 서브쿼리의 결과행인 단일행인 경우
    (조건의 결과값을 기준으로 결과가 하나)
3.2 다중 결과행 서브쿼리 - 조건절에 사용하는 서브쿼리의 결과행인 여러행인 경우
    (조건의 결과값을 기준으로 결과가 여러개)
3.3 단일 컬럼  서브쿼리  - 조건절에 사용하는 서브쿼리의 결과컬럼인 여러컬럼인 경우
    (조건의 결과값을 기준으로 컬럼이 여러개)
    
01. 급여가 우리회사 평균 급여보다 더 적은 급여를 받는 사원의 
사번, 이름, 성, 급여정보 조회
SELECT  employee_id, first_name, last_name, salary
FROM    employees
WHERE   salary < AVG(salary); --XX, WHERE : 그룹함수 사용 불가

우리회사 평균 급여
SELECT  AVG(salary) --6461.831775700934579439252336448598130841
FROM    employees;

SELECT  employee_id, first_name, last_name, salary --56
FROM    employees
WHERE   salary < 6461.831775700934579439252336448598130841; 

상수 대신 그룹함수 대입 --XX
SELECT  employee_id, first_name, last_name, salary
FROM    employees
WHERE   salary < AVG(salary); --XX

※ 서브쿼리 : 보통 함수로 구한값과 비교할때, 다른곳에서 구한값과 비교할 때
SELECT  employee_id, first_name, last_name, salary --56
FROM    employees
WHERE   salary < ( SELECT  AVG(salary)
                   FROM    employees );

02. 급여가 우리회사 급여 평균보다 더 많게 받는 사원들의
사번, 성, 업무코드, 급여 조회
우리회사 평균 급여
SELECT  AVG(salary)
FROM    employees;

SELECT  employee_id, last_name, job_id, salary --51
FROM    employees 
--WHERE   salary > (우리회사 평균 급여)
WHERE   salary > ( SELECT AVG(salary)
                   FROM   employees );

03. 우리회사에서 가장 많은 급여를 받는 사원의
사번, 이름, 성, 급여 조회
우리회사 최대급여
SELECT  MAX(salary)
FROM    employees;

SELECT  employee_id, first_name, last_name, salary --1
FROM    employees
--WHERE   salary = 최대급여;
WHERE   salary = ( SELECT  MAX(salary)
                   FROM    employees );

04. 사번 150번 보다 더 많은 급여를 받는 사원들의
사번, 성, 부서코드, 업무코드, 급여 조회
사번 150번 급여
SELECT  salary
FROM    employees
WHERE   employee_id = 150;

SELECT  employee_id, last_name, department_id, job_id, salary --15
FROM    employees
--WHERE   salary > 150번 사원급여
WHERE   salary > ( SELECT  salary
                   FROM    employees
                   WHERE   employee_id = 150 );

05. 월급여가 가장 많은 사원의 
사번, 이름, 성, 업무제목 정보를 조회
우리회사 최대급여
SELECT  MAX(salary)
FROM    employees;

SELECT  e.employee_id, e.first_name, e.last_name, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id(+)
--AND  salary = (최대급여);
AND     e.salary = ( SELECT  MAX(salary)
                     FROM    employees );

06. 사원들의 급여가 우리회사 평균급여 이상 최고급여 이하에 해당하는 사원들의
사번, 성, 급여 조회
평균급여
SELECT  AVG(salary)
FROM    employees;

최대급여
SELECT  MAX(salary)
FROM    employees;

SELECT  employee_id, last_name, salary --51
FROM    employees
--WHERE   salary  BETWEEN (평균급여)
--                AND     (최대급여);
WHERE   salary  BETWEEN (SELECT  AVG(salary) FROM    employees)
                AND     (SELECT  MAX(salary) FROM    employees);

--------------------------------------------------------------------------------
1. 조건절(WHERE, HAVING)에 사용하는 단일결과행 서브쿼리, 조건의 결과값을 기준으로 결과가 하나
--단일 결과행 서브쿼리 연산자 : --★★★★ : =, !=, <>, <, <=, >, >=
--------------------------------------------------------------------------------
2. 조건절(WHERE, HAVING)에 사용하는 다중결과행 서브쿼리, 조건의 결과값을 기준으로 결과가 여러개
--다중 결과행 서브쿼리 연산자 : --★★★★ : IN, NOT IN
--------------------------------------------------------------------------------

2. 다중결과행 서브쿼리
: 조건절에 사용한 서브쿼리의 결과행이 여러행인 경우, 조건의 결과값을 기준으로 결과가 여러개
- 연산자 : IN, NOT IN('=' 을 IN 으로 대체한다고 생각),
  비교의 대상의 두개 이상은 대소비교 불가, 그래서, IN 연산자 사용
  서브쿼리의 결과가 여러행일 경우 '=', '<', '>' 와 같은 연산자는 대소비교가 불가
  WHERE 절에서는 그룹함수 사용 불가
  WHERE 절이 아닌 서브쿼리에서는 그룹함수 사용 가능
- 컬럼표현 IN, 
- NOT 컬럼표현 IN, 컬럼표현 NOT IN

01. 부서의 위치 코드가 1700인 부서에 속한 사원들의
사번, 성, 부서코드, 업무코드 조회
부서의 위치 코드가 1700인 부서
SELECT  department_id --21,
--10,30,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270
FROM    departments
WHERE   location_id = 1700;

일반쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = 1700;

서브쿼리
SELECT  e.employee_id, e.last_name, e.department_id, e.job_id --18
FROM    employees e
--WHERE   e.department_id = (10,30,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270);
--WHERE   e.department_id IN (10,30,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270);
WHERE   e.department_id IN ( SELECT  department_id
                             FROM    departments
                             WHERE   location_id = 1700 );

02. 우리회사 mgr 업무에 종사하는 사원들과 같은 부서에 속한 사원들의
사번, 성, 업무코드, 부서코드 조회
mgr 업무에 종사하는 사원들의 부서
SELECT  department_id --100,110
FROM    employees
WHERE   LOWER(job_id) LIKE '%mgr%';

일반쿼리 --SELF JOIN
SELECT  e.employee_id, e.last_name, e.job_id, e.department_id --8
FROM    employees e, employees m
WHERE   e.department_id = m.department_id(+)
AND     LOWER(m.job_id) LIKE '%mgr%';

서브쿼리
SELECT  e.employee_id, e.last_name, e.job_id, e.department_id --8
FROM    employees e
WHERE   e.department_id IN (SELECT  department_id
                            FROM    employees
                            WHERE   LOWER(job_id) LIKE '%mgr%');

03. 각 부서의 최소급여가 40번 부서의 최소급여보다 더 많이 받는 부서의
서브쿼리
부서코드, 최소급여 조회
40번 부서의 최소급여
SELECT  MIN(salary)
FROM    employees
WHERE   department_id = 40;

SELECT  e.department_id, MIN(salary) min_sal
FROM    employees e
--WHERE   최소급여 > 40번부서의 최소급여 --WHERE 는 그룹함수 사용 불가
--WHERE   e.department_id IS NOT NULL
GROUP BY e.department_id
--HAVING  MIN(salary) > (40번 부서의 최소급여)
HAVING  MIN(salary) > ( SELECT  MIN(salary)
                        FROM    employees
                        WHERE   department_id = 40 )
AND     e.department_id IS NOT NULL
ORDER BY 1;

04. 근무지의 국가코드가 UK(즉, country_id 가 UK)인 위치(코드)에 있는
부서코드, 위치코드, 부서명
국가코드가 UK(즉, country_id 가 UK)인 위치(코드)
SELECT  location_id
FROM    locations
WHERE   country_id = 'UK';

일반조인
SELECT  d.department_id, d.location_id, d.department_name
FROM    departments d, locations l
WHERE   d.location_id = l.location_id
AND     l.country_id = 'UK';

서브쿼리
SELECT  d.department_id, d.location_id, d.department_name
FROM    departments d
WHERE   d.location_id IN ( SELECT  location_id
                           FROM    locations
                           WHERE   country_id = 'UK' );

















































