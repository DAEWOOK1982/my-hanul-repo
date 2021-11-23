GROUP 함수 : 여러행으로부터 하나의 결과값을 반환, 
             전체 데이터를 그룹별로 구분하여 통계적인 결과를 구하기 위해서 사용하는 함수

--------------------------------------------------------------------------------
※ 그룹함수의 종류
 1. COUNT     : 입력되는 데이터의 총 갯수를 출력
 2. SUM       : 입력되는 데이터의 합계값을 출력
 3. AVG       : 입력되는 데이터의 평균값을 출력
 4. MAX       : 입력되는 데이터의 최대값을 출력
 5. MIN       : 입력되는 데이터의 최소값을 출력
 
 6. ROLLUP    : 입력되는 데이터의 소계 및 총계값을 출력
 7. CUBE      : 입력되는 데이터의 소계 및 총계값을 출력(아래에 다시 테이터 출력)
 
 8. RANK      : 주어진 컬럼값의 그룹에서 값의 순위를 계산한 후 순위를 출력 
                  --GROUP BY 사용안해도 됨, 1,2,2,4,...
 9. DENSE_RANK  : RANK 함수와 비슷하지만 동일한 순위를 하나의 건수로 취급하므로 연속된 순위 보여줌
                  --GROUP BY 사용안해도 됨  1,2,2,3,3,...., DENSE : 밀접한
--------------------------------------------------------------------------------

DISTINCT : 중복제거

부서를 조회
SELECT  department_id --107
FROM    employees
ORDER BY 1;

중복된 부서를 조회
SELECT  DISTINCT department_id --12, DISTINCT : NULL 포함
FROM    employees
ORDER BY 1;

11개의 부서를 출력
SELECT  DISTINCT department_id --11
FROM    employees
WHERE   department_id IS NOT NULL --NULL 제외
ORDER BY 1;

※ 그룹 함수 : 여러행으로부터 하나의 결과를 반환하는 함수 : NULL 제외
01. 우리회사 사원수 조회
SELECT  COUNT(employee_id) cnt1,
        COUNT(*) cnt2
FROM    employees;

02. 우리회사 부서배치 받은 사원수
SELECT  COUNT(department_id) cnt1, --그룹함수 : NULL 제외
        COUNT(*) cnt2
FROM    employees;

권장
SELECT  COUNT(*) 사원수
FROM    employees
WHERE   department_id IS NOT NULL;

03. 우리회사 사원들 중 부서코드가 60번인 부서에 속한 사원들의 수 조회
SELECT  COUNT(*)  "60번부서 사원수"
FROM    employees
WHERE   department_id = 60;

04. clerk 종류의 업무를 하는 사원의 수 --45
SELECT  job_id
FROM    employees;

SELECT  COUNT(*) cnt
FROM    employees
WHERE   LOWER(job_id) LIKE '%clerk%'; --clerk 업무에 종사하는

2. 데이터값을 합하여 반환하는 함수 : SUM(컬럼명), -- 숫자에만 사용
01. 우리회사 한달 급여의 총액 조회
SELECT  SUM(salary) sum_sal --691416
FROM    employees;

02. 우리회사 60번 부서의 급여 총액 조회
SELECT  SUM(salary) sum_sal --28800
FROM    employees
WHERE   department_id = 60;

03. 우리회사 60번 부서의 급여 총액 조회해서 통화기호와 세자리마다 쉼표 입력
SELECT  TO_CHAR(SUM(salary),'FML999,999,999') sum_sal1, --28,800
        TRIM(TO_CHAR(SUM(salary),'L999,999,999'))   sum_sal2 --28,800
FROM    employees
WHERE   department_id = 60;

3. 데이터값 중 가장 큰/작은 값을 반환하는 함수 : MAX/MIN(컬럼명)
--숫자, 날짜, 문자 모두 사용가능
01. 우리회사 사원들 중 가장 높은/낮은 급여 조회
SELECT  MAX(salary) max_sal, MIN(salary) min_sal
FROM    employees;

02. 우리회사 사원들 중 가장 처음/나중에 나오는 성 조회
SELECT  MIN(last_name) 처음나오는성,
        MAX(last_name) 나중에나오는성
FROM    employees;

03. 우리회사 사원들 중 가장 처음/나중에 입사한 사원의 입사일자 조회
SELECT  MIN(hire_date) min_hire,
        MAX(hire_date) max_hire
FROM    employees;

04. clerk 업무에 종사하는 사원들 중
가장 먼저 입사한 입사일자, 가장 최근에 입사한 입사일자
SELECT  MIN(hire_date) min_hire,
        MAX(hire_date) max_hire
FROM    employees
WHERE   LOWER(job_id) LIKE '%clerk%';

04. 데이터값의 평균을 반환하는 함수 : AVG(컬럼명) - 숫자만 가능
01. 우리회사 급여 평균 조회
급여평균은 소수이하 둘째자리에서 반올림
SELECT  ROUND(AVG(salary),2) avg_sal
FROM    employees;

02. 60번 부서에 속한 사원들의 급여 평균 조회
급여평균은 소수이하 둘째자리에서 반올림
SELECT  ROUND(AVG(salary),2) avg_sal
FROM    employees
WHERE   department_id = 60;

03. clerk 종류의 업무를 하는 사원들의 급여 평균
급여평균은 소수이하 둘째자리에서 반올림
SELECT  ROUND(AVG(salary),2) avg_sal
FROM    employees
WHERE   LOWER(job_id) LIKE '%clerk%';

※ GROUP BY 절 : 그룹별로 조회
전체 데이터행을 하나의 그룹으로 보고 그룹함수로 데이터를 조회
특정 기준을 두어 기준으로 그룹을 짓고 그룹별로 하나의 결과를 조회하고자 할때 사용

01. 사원들의 사번, 성, 부서코드, 급여 조회하여 부서코드 순으로 정렬
SELECT  employee_id, last_name, department_id, salary
FROM    employees
ORDER BY 3;

02. 50번 부서의 급여평균 조회
SELECT  ROUND(AVG(salary),2) avg_sal
FROM    employees
WHERE   department_id = 50;

03. 50번 부서의 부서코드, 업무코드, 급여평균 조회
SELECT  department_id, job_id, ROUND(AVG(salary),2) avg_sal
FROM    employees
WHERE   department_id = 50
GROUP BY department_id, job_id;

SELECT    절 : 조회하고자 하는 컬럼 목록
FROM      절 : SELECT 절의 컬럼이 있는 테이블
WHERE     절 : 조건에 맞는 데이터행을 조회하고자 할때, --★ 그룹함수 조건 사용불가, ALIAS 불가
GROUP BY  절 : 특정 기준으로 그룹을 지을때 --ALIAS 불가
HAVING    절 : 그룹함수 조건 지정 --ALIAS 불가
ORDER BY  절 : 데이터행의 정렬

GROUP BY + 그룹짓고자하는 기준

SELECT  목록에
        그룹함수를 사용한 표현(COUNT, SUM, AVG, MAX, MIN 등) 과
        그룹함수를 사용하지 않은 표현(즉, 일반컬럼) 이 함께 있다면
반드시 그룹함수를 사용하지 않은 표현(일반컬럼)에 대해서는 (즉, 그룹함수 이외의 일반컬럼)
GROUP BY 절에 명시해야만 한다.

그러나, GROUP BY 절에 명시된 컬럼은 SELECT 절에 사용하지 않아도 된다.

04. 각 부서별로 부서, 급여평균을 조회
SELECT  department_id, ROUND(AVG(salary)) avg_sal
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY department_id
ORDER BY 1;

05. 부서별로 급여합계, 급여평균, 부서원수 조회
SELECT  department_id, SUM(salary) sum_sal, ROUND(AVG(salary),2) avg_sal, COUNT(*) cnt
FROM    employees
GROUP BY department_id
ORDER BY 1;

06. 각 부서별 업무별 급여평균 조회
SELECT  department_id, job_id, ROUND(AVG(salary),2) avg_sal
FROM    employees
GROUP BY department_id, job_id
ORDER BY 1;

07. 부서코드 10,20,30,40,60 번 부서에 대해
해당부서별로 부서코드, 부서원수, 부서급여평균 조회
SELECT  department_id, COUNT(*) cnt, ROUND(AVG(salary),2) avg_sal
FROM    employees
WHERE   department_id IN (10,20,30,40,60)
GROUP BY department_id
ORDER BY 1;

08. clerk 종류의 업무별로 사원수, 급여평균 조회
SELECT  job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM    employees
WHERE   LOWER(job_id) LIKE '%clerk%'
GROUP BY job_id
ORDER BY job_id;

09. 우리회사 부서코드 10,20,30,40,60 번 부서에 속한 사원들의
어떤 업무를 하는지 파악하고자 한다.
해당 부서에 속한 사원들이 하는 업무코드를 조회 --7
SELECT  DISTINCT job_id
FROM    employees
WHERE   department_id IN (10,20,30,40,60);

SELECT  job_id
FROM    employees
WHERE   department_id IN (10,20,30,40,60)
GROUP BY job_id;

GROUP BY 의 결과 행에 대해 특정 조건에 맞는 데이터행을 조회하기 위한 조건절
: HAVING 절 사용
조건절 : 
WHERE   : ALIAS 사용불가, 일반조건 가능, 그룹함수 사용불가 --★★★
HAVING  : ALIAS 사용불가, 일반조건, 그룹함수 사용가능 --★★★

10. 80번 부서의 부서와 급여 평균 조회
SELECT  department_id, ROUND(AVG(salary)) avg_sal
FROM    employees 
WHERE   department_id = 80
GROUP BY department_id;

SELECT  department_id, ROUND(AVG(salary)) avg_sal
FROM    employees 
GROUP BY department_id
HAVING   department_id = 80;

11. 각 부서별로 소속된 사원의 수가 5명 이하인 부서와 그 수를 조회
SELECT  department_id, COUNT(*) 사원수
FROM    employees
--WHERE   COUNT(*) <= 5 --WHERE : 일반컬럼만 가능, 그룹함수 사용불가, 
WHERE   department_id IS NOT NULL
GROUP BY department_id
HAVING  COUNT(*) <= 5
ORDER BY 1;

12. 각 부서별 사원에 대해 사원수가 10명 이상인 부서의
부서코드, 사원수, 급여평균, 최대급여, 최저급여 조회
SELECT  department_id, COUNT(*) 사원수, MAX(salary) 최대급여, MIN(salary) 최저급여
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY department_id
HAVING  COUNT(*) >= 10
ORDER BY 1;
































































