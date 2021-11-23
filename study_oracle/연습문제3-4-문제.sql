-----------------------------------------------------------------------------------------------
--[연습문제 3-4]
--사번, 성, 부서코드, 업무코드, 입사일자, 매니저코드, 매니저존재여부(NVL, NVL2 각각 사용) 조회
--매니저존재여부는 각 사원에 대해 
--
--NVL은 
--    관리자가 있으면 manager_id와 관리자가 없으면 '없음'으로 표시,
--NVL2는
--사원의 관리자(매니저)가 있으면 '있음' 으로 --manager_id, 'O','Manager'   
--       관리자(매니저)가 없으면 '없음' 으로 --'없음',     'X','No Manager' 등으로 조회되게 한다.
--       
SELECT  employee_id, last_name, department_id, job_id, hire_date, manager_id, 
        NVL(manager_id, 0)                          m1,
        NVL(TO_CHAR(manager_id), '없음')            m2,
        NVL2(manager_id, '있음', '없음')            m3,
        NVL2(manager_id, TO_CHAR(manager_id), '없음') m4,
        NVL2(manager_id, 'O', 'X')                  m5,
        NVL2(manager_id, 'Manager', 'No Manager')   m6
FROM    employees;


EMPLOYEE_ID LAST_NAME DEPARTMENT_ID JOB_ID      HIRE_DATE   MANAGER_ID    M1    M2    M3    M4    M5  M6        
-----------------------------------------------------------------------------------------------
100	        King	    90	          AD_PRES	    03/06/17		NULL          0	    없음	없음	없음	X	  No Manager
101	        Kochhar	  90	          AD_VP	      05/09/21	  100	          100	  100	  있음	100	  O	  Manager







-----------------------------------------------------------------------------------------------
--DESC employees;  manager_id ☜ number(6,0)
-----------------------------------------------------------------------------------------------