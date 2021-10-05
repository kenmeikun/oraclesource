--LAST NAME에 U가 포함되는 사원들과 동일 부서에 근무하는 사원들의 
--사번 및 LAST_NAME조회
SELECT EMPLOYEE_ID,LAST_NAME
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');

create table indexTBL as select DISTINCT first_name,last_name,hire_date from employees;

select * from indextbl;

select * from indextbl where first_name='Jack';

create index idx_indexTBL_firstname on indexTBL(first_name);

--인덱스 생성 후 검색 방시ㅏㄱ:
select * from indexTBL where first_name='Jack';

