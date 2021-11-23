3. 데이터 값이 NULL 인 경우 대체해서 반환 표현을 여러개 지정할 수 있는 형태의 함수
: NULL 이 아닌 첫번째 데이터를 반환하는 함수
: COALESCE : 합치다, 합체하다, 합동하다.
: COALESCE(대체표현1, 대체표현2, ....) ALIAS 명

--------------------------------------------------------------------------------
name      cellular        home            office
홍길동    010-1111-1111  
심청                      062-222-2222    062-333-3333
전우치                                    062-444-4444 
--------------------------------------------------------------------------------
SELEC name 이름, COALESCE(cellular, home, office) 연락처
FRom  dual;

이름      연락처
홍길동    010-1111-1111
심청      062-222-2222
전우치    062-444-4444

※ 조건문 : DECODE, CASE ~ END  WHEN THEN ELSE
3.6 DECODE 와 CASE ~ END
1. 조건문에 해당하는 함수
IF (조건식1) {
  실행문1
} ELSE IF (조건식2) {
  실행문2
} ELSE IF (조건식3) {
  실행문3
} ELSE {
  실행문n
} 

부서별로 보너스를 지급하고자 한다.
부서코드가 10이면 급여의 10%, 
           20이면 급여의 20%,  
           30이면 급여의 30%, 
           나머지 부서원은 급여의 5%

IF (부서코드 == 10) {
  보너스 = 급여 * 0.1;
} ELSE IF (부서코드 == 20) {
  보너스 = 급여 * 0.2;
} ELSE IF (부서코드 == 30) {
  보너스 = 급여 * 0.3;
} ELSE {
  보너스 = 급여 * 0.05;
}

1.1 조건문에 해당하는 함수 : DECODE
: DECODE (대상표현, 비교데이터표현1, 반환데이터1,
--        ￣￣￣￣￣￣￣￣￣￣￣￣￣
                    비교데이터표현2, 반환데이터2,
                    비교데이터표현3, 반환데이터3,
                    default반환데이터n) ALIAS 명
대상표현과 비교데이터표현의 데이터유형은 일치해야 함(즉, 문자는 문자로, 숫자는 숫자로 비교)

: DECODE(컬럼, A, 1, B, 2, 3) : 컬럼값이 A 이면 1, B 이면 2, 그것도 아니면 3)
사번, 성, 부서코드, 급여, 보너스
부서별로 보너스를 지급하고자 한다.
부서코드가 10이면 급여의 10%, 
           20이면 급여의 20%,  
           30이면 급여의 30%, 
           나머지 부서원은 급여의 5%
SELECT  employee_id, last_name, department_id, salary,
        DECODE(department_id, 10, salary * 0.1,
                              20, salary * 0.2,  
                              30, salary * 0.3,
                              salary * 0.05) bonus
FROM    employees;

1.2 조건문에 해당하는 함수 : CASE ~ END
: DECODE 보다 더 큰 개념을 가진 표현식이다.
DECODE 동등비교연산만 할 수 있으나
--     ￣￣￣￣￣￣￣
CASE ~ END 좀 더 다양한 범위비교 연산까지도 가능하다.
--                      ￣￣￣￣￣￣￣￣￣￣￣￣

동등비교연산(=)
--------------------------------------------------------------------------------
CASE  대상표현
--    ￣￣￣￣
  WHEN  비교데이터값1  THEN 반환데이터1 --컴마 없음
--      ￣￣￣￣￣￣￣  
  WHEN  비교데이터값2  THEN 반환데이터2 --컴마 없음
  WHEN  비교데이터값3  THEN 반환데이터3 --컴마 없음
  ELSE  default반환데이터n
END  ALIAS 명
--------------------------------------------------------------------------------

범위비교연산
--------------------------------------------------------------------------------
CASE  --(연산자 : =, !=, >, <, >=, <= 등 사용)
  WHEN  대상표현 연산자 비교데이터값1  THEN 반환데이터1 --컴마 없음
--      ￣￣￣￣        ￣￣￣￣￣￣￣  
  WHEN  대상표현 연산자 비교데이터값2  THEN 반환데이터2 --컴마 없음
  WHEN  대상표현 연산자 비교데이터값3  THEN 반환데이터3 --컴마 없음
  ELSE  default반환데이터n
END  ALIAS 명
--------------------------------------------------------------------------------
사번, 성, 부서코드, 급여, 보너스 --동등비교연산
SELECT  employee_id, last_name, department_id, salary,
        CASE department_id
          WHEN  10  THEN  salary * 0.1 --컴마없음
          WHEN  20  THEN  salary * 0.2 --컴마없음
          WHEN  30  THEN  salary * 0.3 --컴마없음
          ELSE  salary * 0.05 --컴마없음
        END bonus
FROM    employees;

사번, 성, 부서코드, 급여, 보너스 --범위 비교연산
SELECT  employee_id, last_name, department_id, salary,
        CASE 
          WHEN  department_id = 10  THEN  salary * 0.1 --컴마없음
          WHEN  department_id = 20  THEN  salary * 0.2 --컴마없음
          WHEN  department_id = 30  THEN  salary * 0.3 --컴마없음
          ELSE  salary * 0.05 --컴마없음
        END bonus
FROM    employees;



































































