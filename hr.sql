--employees 테이블 전체 내용 조회
SELECT * from employees;

SELECT first_name,last_name,job_id from employees;

--사원번호가 176인 사람의 LAST_NAME과 DEPARTMENT_ID조회

SELECT
    last_name,department_ID FROM employees WHERE employee_id=176;
    
    SELECT
        last_name, SALARY FROM EMPLOYEES WHERE SALARY>12000;
        
         SELECT
        last_name, SALARY FROM EMPLOYEES WHERE SALARY<5000 or SALARY>12000;
        
        