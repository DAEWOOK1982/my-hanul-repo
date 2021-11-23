5) 나머지를 반환 함수 : MOD(숫자, 나눌숫자)
SELECT  MOD(17, 4)    m1, --1
        MOD(17, -4)   m2, --1
        MOD(-17, 4)   m3, --(-1)
        MOD(-17, -4)  m4, --(-1)
        MOD(17, 0)    m5  --17
FROM    dual;
              값    젯수    몫     나머지
   17/  4 :   17  =  4   *    4   + 1 
   17/ -4 :   17  = -4   *   -4   + 1
  -17/  4 :  -17  =  4   *   -4   + (-1)
  -17/ -4 :  -17  = -4   *    4   + (-1)
   17/  0 :   17  =  0   * 45554545 + 17

3.2 문자 함수 
1. 대/소문자 변환 함수 : UPPER/LOWER(문자) : 문자데이터, 날짜데이터 : 반드시 홑따옴표로 묶음
01. 성이 King 인 사원들의 사번, 성, 명 조회
SELECT  employee_id, last_name, first_name
FROM    employees
--WHERE   last_name = 'King';
--WHERE   UPPER(last_name) = 'KING'; --UPPER : 대문자로 변환
WHERE   LOWER(last_name) = 'king';  --LOWER : 소문자로 변환

02. 성에 대소문자 무관하게 z 가 포함된 사원들의
사번, 성, 명 조회
SELECT  employee_id, last_name, first_name
FROM    employees
--WHERE   last_name LIKE '%z%' 
--OR      last_name LIKE '%Z%';
--WHERE   LOWER(last_name) LIKE '%z%';
WHERE   UPPER(last_name) LIKE '%Z%';

2. 단어 단위로 첫글자는 대문자, 나머지는 소문자로 변환하는 함수 : INTICAP(대상)
: 이니셜만 대문자로 변환
SELECT  INITCAP('we are studing oralce') initcap
FROM    dual;

SELECT  email, INITCAP(email) initcap, 
        first_name, UPPER(first_name) upper, LOWER(first_name) lower
FROM    employees;

3. 문자 데이터(char1)에 특정문자(char2)를 채워서 반환하는 함수
: LPAD/RPAD(char1, n [, char2])
: LPAD/RPAD(대상, 전체크기[, 충전문자]), pad : 채워넣는거
: 세번째 파라미터인 충전문자 생략가능 : default : 공백

SELECT  LPAD('abc', 5, '?') lp1, --??abc
        LPAD('abc', 5)      lp2, --  abc : 생략시 공백 채움
        RPAD('abc', 5, '#') lp3, --abc##
        RPAD('abc', 5)      lp4  --abc__ : 생략시 공백 채움
FROM    dual;

SELECT  employee_id, 
        LPAD(last_name, 10, ' ') last_name1, --공백(' ') 채움
        LPAD(last_name, 10)      last_name2  --생략시 공백 채움
FROM    employees;

4. 문자데이터에서 특정문자를 제거하고 반환하는 함수
  : 제거할 문자는 한글자만 지정 가능 : TRIM()
--                ￣￣￣￣￣￣￣￣￣
  : 입력상자에서 사용자 실수로 공백을 입력시
  : request.getParameter('userId').TRIM()

TRIM([LEADING, TRAILING, BOTH] [TRIM_CHAR] [FROM] char)
TRIM(제거할 위치                제거문자한개 FROM 대상문자)
--                              ￣￣￣￣￣￣        
제거할 위치 - LEADING : 왼쪽부터, TRAINLING : 오른쪽부터, BOTH : 양쪽
제거할 위치 생략시 : BOTH
제거문자한개 생략시 : 공백

SELECT  TRIM('a' FROM 'abcdcbaaaaaa') t1,
        TRIM(LEADING 'a' FROM 'abcdcbaaaaaa') t2,
        TRIM(TRAILING 'a' FROM 'abcdcbaaaaaa') t3,
        TRIM(BOTH 'a' FROM 'abcdcbaaaaaa') t4,
        '   abcdcbaaaaaa  ' t5,
        TRIM('   abcdcbaaaaaa  ') t6
FROM    dual;

5. 문자데이터의 특정문자를 제거하고 반환함수
: 제거할 문자를 여러개 지정가능 ☜ TRIM 함수와 차이점
--              ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
: LTRIM/RTRIM(char1[, char2])
: LTRIM/RTRIM(대상문자[, 제거할문자나열])
: 두번째 파라미터 생략시 : 기본값은 공백문자

SELECT  LTRIM('abcdcba', 'a') lt1,  --bcdcba
        LTRIM('abcdcba', 'ba') lt2, --cdcba
        LTRIM('abcdcba', 'acb') lt3, --dcba
        LTRIM('abcdcba', 'adb') lt4, --cdcba
        RTRIM('abcdcba', 'adb') rt5, --abcdc
        LTRIM('   abcdcba   ') lt6, --abcdcba___, 생략시 공백문자 
        RTRIM('   abcdcba   ') lt7 --___abcdcba, 생략시 공백문자
FROM    dual;

6. 문자열에서 문자열의 일부를 반환하는 함수, (몇번째부터 몇글자)
--                                            ￣￣￣￣￣￣￣￣￣
: SUBSTR(대상문자열, 시작위치, 몇글자)
: 두번째 파라미터(시작위치) : 음수지정가능 ☞ 오른쪽에서부터
--                            ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
: 세번째 파라미터(몇글자)   : 생략시 문자열의 끝까지 반환
--                            ￣￣￣￣￣￣￣￣￣￣￣￣￣
                1   5   9   13
SELECT  SUBSTR('You are not alone', 5, 3) s1, --are
        SUBSTR('You are not alone', 5)    s2, --are not alone
        SUBSTR('You are not alone', -5)   s3, --alone
        SUBSTR('You are not alone', -5, 3) s4 --alo
FROM    dual;

110 * 120
50 * 110
120 * 30

7. 문자열에서 특정문자열의 위치한 시작위치를 반환하는 함수
--                                ￣￣￣￣￣￣￣￣
: INSTR(대상문자열, 찾는문자열, 문자열찾는위치, 몇번째거)
: 세번째 파라미터 : 문자열찾는위치, 생략시 왼쪽부터
    음수 지정 가능 : 오른쪽에서부터 왼쪽 방향으로 쭉쭉쭉쭉 계속 진행
--                                                ￣￣￣￣￣￣￣￣￣
: 네번째 파라미터 : 몇번째거, 생략시 : 첫번째거
               1     7   11 14 17 20    
SELECT  INSTR('Every sha-la-la-la-la','la', 1, 2) i1, --14
        INSTR('Every sha-la-la-la-la','la', 12, 2) i2,  --17
        INSTR('Every sha-la-la-la-la','la', 12, 4) i3, --0
        INSTR('Every sha-la-la-la-la','la', 12) i4, --14
        INSTR('Every sha-la-la-la-la','la', -4, 2) i5, --14
        INSTR('Every sha-la-la-la-la','la', -10) i6 --11 
FROM    dual;

본인의 이메일에서 아이디와 서비스제공자를 조회
SELECT  'abcdefg@naver.com' 나의이메일,
        abcdefg 아이디,
        naver.com 서비스제공자
FROM    dual;

@의 시작위치 알기
SELECT  INSTR('abcdefg@naver.com','@', 1, 1) "@위치" --8
FROM    dual;

id가져오기
SELECT  SUBSTR('abcdefg@naver.com', 1, INSTR('abcdefg@naver.com','@')-1) 아이디 
FROM    dual;

서비스제공자 가져오기
SELECT  SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com','@')+1) 서비스제공자 
FROM    dual;

결합
SELECT  'abcdefg@naver.com' 나의이메일,
        SUBSTR('abcdefg@naver.com', 1, INSTR('abcdefg@naver.com','@')-1) 아이디,
        SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com','@')+1) 서비스제공자
FROM    dual;

글자갯수 구하기
SELECT  LENGTH('abcdefg@naver.com') l
FROM    dual;

JOBS 테이블에서 업무코드, 업무제목, 직무, 직책 조회
직무, 직책은 업무코드(job_id)에서 '_' 기준으로 조회(직무_직책)
SELECT  *
FROM    jobs;

'_' 시작 위치 
SELECT  INSTR(job_id, '_') "_위치" --3
FROM    jobs; 

SELECT  job_id, job_title, 
        SUBSTR(job_id, 1, INSTR(job_id, '_')-1) 직무, -- '_' 위치 이전까지 가져오기
        SUBSTR(job_id, INSTR(job_id, '_')+1) 직책     -- '_' 위치 다음부터 끝까지 가져오기
FROM    jobs;








































