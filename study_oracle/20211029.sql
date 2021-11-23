5. SELF JOIN 
: 하나의 테이블을 두번 명시하여 동일한 테이블 두개로부터 JOIN 을 통해
데이터를 조회하여 결과를 반환, 즉, 한 테이블 내에서 두 데이터 컬럼이 연관관계 있다

01. 모든 사원의 사번, 이름, 매니저 사번, 매니저 이름 조회
SELECT  e.employee_id, e.first_name, e.manager_id, m.first_name
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id(+)
ORDER BY 1;

--사원테이블 2개가 아니라 사원테이블 1개, 매니저테이블 1개라고 생각

NVL(대상, NULL일때 반환표현)
--  ￣￣￣￣￣￣￣￣￣￣￣￣(데이터형이 같아야 함)
NVL2(대상, NULL이 아닐때 반환표현, NULL일때 반환표현)
--         ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣(데이터형이 같아야 함)
매니저 사번, 매니저 이름이 NULL 로 조회됐을때 NULL 처리하기
사번, 성             매니저사번1, 매니저사번2, 매니저사번3,      매니저사번4,    매니저이름1, 매니저이름2,         매니저이름3
매니저사번이 없으면  (null)       0(NVL)       매니저없음(NVL)   매니저없음(NVL2) 
매니저이름이 없으면                                                              (null)       매니저이름없음(NVL)  매니저이름없음(NVL2)
SELECT  e.employee_id, e.last_name,
        e.manager_id                                           매니저사번1, --(null)
        NVL(e.manager_id,0)                                    매니저사번2, --0
        NVL(TO_CHAR(e.manager_id),'매니저없음' )               매니저사번3, --매니저없음
        NVL2(e.manager_id, TO_CHAR(e.manager_id),'매니저없음') 매니저사번4, --매니저없음
        m.first_name                                           매니저이름1, --(null)         
        NVL(m.first_name,'매니저이름없음')                     매니저이름2, --매니저이름없음
        NVL2(m.first_name, m.first_name, '매니저이름없음')     매니저이름3  --매니저이름없음
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id(+)
ORDER BY 1;

5.6 ANSI JOIN
: 모든 RDBMS 에서 공통적으로 사용할 수 있는 국제 표준 형식
1. INNER JOIN(오라클의 EQUI JOIN), 교집합

--------------------------------------------------------------------------------
오라클 조인                            | ANSI 조인
--------------------------------------------------------------------------------
5. SELECT 컬럼명1, 컬럼명2,...         | SELECT 컬럼명1, 컬럼명2,...
1. FROM   테이블명1, 테이블명2,...     | FROM 테이블명1 INNER JOIN 테이블명2
2. WHERE  조인조건식                   | ON 조인조건식
                                       | (또는)   
                                       | USING (조인컬럼명만)   
   AND    일반조건식                   | WHERE 일반조건식 --ON, USING 다음의 WHERE 사용
3. GROUP BY                            | GROUP BY
4. HAVING                              | HAVING         
6. ORDER BY                            | ORDER BY 
--------------------------------------------------------------------------------
조인 조건절
ON    절 : 조인조건식(테이블명.컬럼명 = 테이블명.컬럼명)
           조인하는 컬럼명이 동일하면 반드시 테이블명을 명시 
--                                    ￣￣￣￣￣￣￣￣￣￣￣
USING 절 : (조인컬럼명만)
           조인하는 컬럼명이 동일한 경우에만 사용가능
--                           ￣￣￣￣￣￣￣￣
           USING 절에 사용되는 컬럼에 대해서는 테이블명을 절대로 명시하면 안됨
--                                             ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣

01. 부서코드가 60번인 사번, 성, 부서코드, 부서명 조회
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
AND     e.department_id = 60;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, d.department_name
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
WHERE   e.department_id = 60;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, department_id, d.department_name
FROM    employees e INNER JOIN departments d
USING   (department_id)
WHERE   department_id = 60;

02. 사번, 성, 업무코드, 업무제목 조회
오라클조인
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e INNER JOIN jobs j
ON      e.job_id = j.job_id;

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, job_id, j.job_title
FROM    employees e INNER JOIN jobs j
USING   (job_id);

03. 업무코드가 clerk 종류업무형태를 하는
사번, 성, 업무코드, 업무제목 조회
오라클조인
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e, jobs j
WHERE   e.job_id = j.job_id
AND     LOWER(e.job_id) LIKE '%clerk%';

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, e.job_id, j.job_title
FROM    employees e INNER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   LOWER(e.job_id) LIKE '%clerk%';

ANSI JOIN USING
SELECT  e.employee_id, e.last_name, job_id, j.job_title
FROM    employees e INNER JOIN jobs j
USING   (job_id)
WHERE   LOWER(job_id) LIKE '%clerk%';

04. 우리회사 부서정보를 조회하고자 한다.
부서코드, 부서명, 위치코드, 도시 조회
오라클조인
SELECT  d.department_id, d.department_name, d.location_id, l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id;

ANSI JOIN ON
SELECT  d.department_id, d.department_name, d.location_id, l.city
FROM    departments d INNER JOIN locations l
ON      d.location_id = l.location_id;

ANSI JOIN USING
SELECT  d.department_id, d.department_name, location_id, l.city
FROM    departments d INNER JOIN locations l
USING   (location_id);

05. 매니저의 부서가 60이상인 부서의 속한 사원들의
사번, 성, 매니저 사번, 매니저 성 조회
오라클조인
SELECT  e.employee_id, e.last_name, m.employee_id 매니저사번, m.last_name 매니저성
FROM    employees e, employees m
WHERE   e.manager_id = m.employee_id
AND     m.department_id >= 60;

ANSI JOIN ON
SELECT  e.employee_id, e.last_name, m.employee_id 매니저사번, m.last_name 매니저성
FROM    employees e INNER JOIN employees m
ON      e.manager_id = m.employee_id
WHERE   m.department_id >= 60;

ANSI JOIN USING --조인되는 컬럼명이 다르므로 USING 사용불가





























































































