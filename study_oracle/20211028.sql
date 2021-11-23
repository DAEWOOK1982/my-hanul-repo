3. NON-EQUI JOIN
: 비교연산자(<, <=, >, >=), 범위연산자(BETWEEN), IN 연산자의 등의
동등연산자(=) 이외의 연산자를 사용하는 JOIN 형식이다.
JOIN 하는 컬럼이 일치하지 않게 사용하는 JOIN 조건으로 거의 사용하지 않는다

01. employees 테이블의 급여가 jobs 테이블의 최고급여(max_salary)/최저급여(min_salary) 범위 내에 있는
50번 부서원의 
사번, 이름, 급여, 업무제목 조회
SELECT  e.employee_id, e.first_name, e.salary, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
AND     e.salary BETWEEN j.min_salary AND j.max_salary
AND     e.department_id = 50;

4. OUTER JOIN : NULL 값이 생략되는 정보도 포함해서 표시하기 위한 조인, 합집합
EQUI 조인은 조인조건에 동등비교연산자(=) 로 비교한 형태,
즉, 테이블간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

하지만, OUTER JOIN 은 만족되는 값이 없는 경우의 결과까지 반환한다.
만족되는 값이 없는 테이블 컬럼에 (+) 기호를 표시한다.
--￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
즉, 데이터 행의 누락이 발생하지 않도록 하기 위한 조인기법
--★ 조인조건식에서 (+)기호를 데이터 행이 없는 조인조건쪽에 붙여준다.
--------------------------------------------------------------------------------
사원테이블(employees)     부서테이블(departments)           위치테이블(locations)
사번    부서코드          부서코드(+)  부서명   위치코드    위치코드(+)    부서위치
100     10                10           영업부   1600        1600           Seatle
101     20                20           총무부   1700        1700           Paris
178     NULL              NULL         NULL     NULL        NULL           NULL
--------------------------------------------------------------------------------

01. 모든 사원(107개)의 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id(+);

NULL 파악 --NULL 갯수 확인
employees
SELECT  COUNT(*) cnt --1
FROM    employees
WHERE   department_id IS NULL;

departments
SELECT  COUNT(*) cnt --0
FROM    departments
WHERE   department_id IS NULL;

--------------------------------------------------------------------------------
--사원테이블에서 부서배치 받지 않은 사원 데이터행(NULL) 이 있고
--부서테이블에서 부서코드가 NULL 인것에 대한 데이터행이 없으므로
--(만족되는 데이터가 없을수도 있는 쪽 JOIN 컬럼에 (+)를 추가
--부서테이블의 부서코드 쪽에 OUTER 기호 (+)를  붙인다.
--------------------------------------------------------------------------------
OUTER JOIN ☞ LEFT/RIGHT OUTER JOIN : 기준이 되는 테이블 방향으로 조인한다.
LEFT  OUTER JOIN : 왼  쪽 테이블 기준으로 NULL 포함하여 모두 출력(즉, 등호의 오른쪽에 (+)를 붙인다.)
RIGHT OUTER JOIN : 오른쪽 테이블 기준으로 NULL 포함하여 모두 출력(즉, 등호의 왼  쪽에 (+)를 붙인다.)

※ 즉, NULL 이 있는 반대쪽에 (+) 를 붙인다.

02. 모든 사원의 사번, 성, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id(+);

employees, jobs 테이블의 job_id 의 NULL 개수 파악
SELECT  COUNT(*) cnt
FROM    employees
WHERE   job_id IS NULL;

SELECT  COUNT(*) cnt
FROM    jobs
WHERE   job_id IS NULL;

03. 모든 사원의 사번, 성, 부서명, 업무제목 조회
SELECT  e.employee_id, e.last_name, d.department_name, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id(+)
AND     e.job_id = j.job_id(+);

04. 모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
FROM    employees e, departments d, locations l
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = l.location_id(+);

05. 모든 사원의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name, e.job_id, j.job_title
FROM    employees e, departments d, jobs j
WHERE   e.department_id = d.department_id(+)
AND     e.job_id = j.job_id(+);

5. SELF JOIN 
: 하나의 테이블을 두번 명시하여 동일한 테이블 두개로부터 JOIN 을 통해
데이터를 조회하여 결과를 반환, 즉, 한 테이블 내에서 두 데이터 컬럼이 연관관계 있다

01. 모든사원의 사번, 이름, 매니저 사번, 매니저 이름 조회

























































































