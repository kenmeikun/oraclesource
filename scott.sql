-- SQL 은 대소문자 구별은 안함(쿼리문)
-- 대소문자 구별은 비밀번호만 함
-- 문자열 표현할 때 홑따옴표 사용함

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;


-- 중복 제거 후 조회 : distinct

SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;
    

-- 정렬 : ORDER BY 컬럼명 기준(오름차순(ASC),내림차순(DESC))

-- ename,sal 조회할 때 sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

-- EMP 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;
    
-- 전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- [문제] 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다.
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    

-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE  

-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
-- 사원번호가 7782 번 조회    
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;


-- 부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';


-- 연산자를 사용한 WHERE

-- 연봉이 36000 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 월급이 3000 보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000 이상인  사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 이름의 첫 글자가 F 이후인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

-- 급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN 이거나, CLERK 이거나, MANAGER 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'ANALYST'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자(같음  = ,  같지않음 =>  !=, <>, ^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;


-- IN 

SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'ANALYST', 'CLERK', 'MANAGER' );

-- 부서번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );


-- BETWEEN A AND B 

-- 급여가 2000 ~ 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 ~ 3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회
-- 와일드카드 
-- ①  % : 길이와 상관없이 모든 문자 데이터를 의미
-- ②  _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미


-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- NULL 은 0이 아니고 완전히 비어 있는 상태를 의미

-- MGR이 NULL 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음), 
--               교집합 - INTERSECT
--               차집합 - MINUS


-- EMPNO,ENAME,SAL,DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


 --오라클 함수
 
 --내장함수 -1 )문자함수
 --             대소문자 변경
 --            UPPER(문자열):괄호안 문자 대문자로 변환
 --             LOWER(문자열) 괄호안 문자 소문자로 변환
 --             INITCAP(문자열) 괄호 안 문자 중 첫글자만 대문자로 변환,나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
 
 --ENAME이 SCOTT 인 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');
     
     
     --문자 길이 구하기
     -- length(문자열):해당 문자열의 길이 돌려줌
     -- lengthB(문자열):해당 문자열의 바이트수 돌려줌

SELECT
    ename,
    length(ename)
FROM
    emp;
 
 --한글 한 자당 3byte 사용
 --dual:데이터베이스 ㄱ환리자가 소유한 테이블 /임신 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;
    
    --job이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;
        
 -- 문자열 일부를 추출하기
 --substr(문자열데이터,시작위치,추출길이)
 --substr(문자열데이터,시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

--emp 테이블의 모든 사원 이름을 세 번째 글자부터 끝가지 출력하기 

SELECT
    ename,
    substr(ename, 3)
FROM
    emp;
   
   --문자열 데이터 안에서ㅏ 특정 문자 찾기
   -- instr(문자열, 찾을 문자열 ,시작위치,몇번째에있는걸 찾는가):해당 문자열의 길이 돌려줌

SELECT
    instr('HELLO,ORACLE!', 'L'),
    instr('HELLO,ORACLE!', 'L', 5),
    instr('HELLO,ORACLE!', 'L', 2, 2)
FROM
    dual;
    
    --원본 문자열:이것이 Oracle이다.이것도 오라클이다.
    --찾을 문자열:이것
   
    --제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;
    --시작위치를 3으로 지정한후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;
    --이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;
       
       --사원 이름에 문자 S가 있는 행 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;
--특정 문자를 다른 문자로 바꾸는 함수
-- REPLACE(문자열 데이터 또는 열이름,찾는문자,바꿀문자)

--010-1234-5678=>
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;

--특정 문자를 다른 문자로 바꾸는 함수 
--두 문자열 데이터를 합치는  함수
-- CONCAT(문자열1,문자열2)

--EMPNI,ENAME 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';

SELECT
    empno,
    ename,
    concat(empno, concat(':', ename))
FROM
    emp
WHERE
    ename = 'SCOTT';
    
    -- || 문자열 데이터 연결 연산자
    
SELECT EMPNO|| ENAME,
EMPNO|| ':'||ENAME
FROM EMP WHERE ENAME='SCOTT';

-- 문자열 함수 :공백제거
-- TRIM:양쪽 공백제거
-- LTRIM:왼쪽 공백제거
-- RTRIM:오른족 공백제거

SELECT
    ' 이것이 ',TRIM(' 이것이 ') FROM DUAL;
    
--TRIM(삭제옵션(선택),삭제할문자(선택),FROM 원본문자열
SELECT '['|| TRIM('_' FROM '__Oracle__')||']' AS TRIM,
'[' || TRIM(LEADING'_' FROM '__Oracle__')||']'AS TRIM_LEADING,
'[' || TRIM(TRAILING'_' FROM '__Oracle__')||']'AS TRIM_TRAILING,
'[' || TRIM(BOTH'_' FROM '__Oracle__')||']'AS TRIM_BOTH FROM DUAL;

--숫자함수:ROUND(숫자,반올림위치(선택))
--        TRUNC(숫자,버림 위치(선택))
--         CEIL(숫자):입력된우치ㅣ와 가장 가까운 큰 정수
--         FLOOR(숫자):입력된 숫자와 가장 가까운 작은 정수
--          MOD(숫자,나눌숫자):나머지값

SELECT ROUND(1234.5678 ) AS round,
       ROUND(1234.5678,0) AS round0,
       ROUND(1234.5678,1) AS round1,
       ROUND(1234.5678,2) AS round2,
       ROUND(1234.5678,-1) AS round_minus1,
       ROUND(1234.5678,-2) AS round_minus2
       from dual;
       
       SELECT trunc(1234.5678 ) AS trunc,
       trunc(1234.5678,0) AS trunc0,
       trunc(1234.5678,1) AS trunc1,
       trunc(1234.5678,2) AS trunc2,
       trunc(1234.5678,-1) AS trunc_minus1,
       trunc(1234.5678,-2) AS trunc_minus2
       from dual;
       
       select ceil(3.14),floor(3.14),ceil(-3.14),floor(-3.14)
       from dual;
       
       select mod(15,6)
       from dual;
       
--날짜함수
--sysdate

select sysdate as now ,sysdate-1 AS YESTERDAY,SYSDATE+1 AS TOMORROW
FROM DUAL;
SELECT SYSDATE,ADD_MONTHS(SYSDATE,3)
FROM DUAL;

--입사 20주년 조회
SELECT ENAME,HIREDATE,ADD_MONTHS(HIREDATE,240) FROM EMP;

--현재 날짜를 기준으로 입사 40년 미만인 사원 조회
select ename,hiredate
from emp
where ADD_MONTHS(HIREDATE,480) > SYSDATE;

--MONTHS_BETWEEN:두날짜사이 간의 개월 수 차이 구하기
SELECT
    EMPNO,ENAME,HIREDATE,SYSDATE,MONTHS_BETWEEN(SYSDATE,HIREDATE) AS MONTH1,
MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTH2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTH3
FROM EMP;

--NEXT DAY(날짜,요일문자)
--LAST DAY(날짜)
SELECT SYSDATE,NEXT_DAY(SYSDATE,'월요일'),LAST_DAY(SYSDATE)
FROM DUAL;

--형변환 함수
--TO_CHAR():숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER():문자 데이터를 숫자 데이터로 변환
--TO_DATE():문자 데이터를 날짜 데이터로 변환
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'MM') AS 현재월 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'MON') AS 현재월 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH/MI/SS') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH12/MI/SS AM') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24/MI/SS') AS 현재시간 FROM DUAL;

SELECT SAL,
        TO_CHAR(SAL,'$999,999') AS SAL_$,
          TO_CHAR(SAL,'$000,000') AS SAL2_$,
        TO_CHAR(SAL,'L999,999') AS SAL_L
        from emp;
        
select to_number('1,300','999,999')
from dual;

select to_date('2021-09-12','YYYY-MM-DD')AS TODATE1,
to_date('20210912','YYYY-MM-DD')AS TODATE2
FROM DUAL;

--날짜 데이터는 연산 가능함
--1981/06/01이후 입사자
SELECT *
FROM EMP WHERE HIREDATE >TO_DATE('1981/06/01','YYYY-MM-DD');

--널처리함수
--NVL(데이터,널이면 반환할 값)
SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM
FROM EMP;

SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM,NVL(COMM,0),SAL+NVL(COMM,0)
FROM EMP;

--NVL2(데이터,널이 아닐경우 반환할값,널이면 반환할값)
SELECT EMPNO,ENAME,SAL,COMM,NVL2(COMM,'O','X'),nvL2(COMM,SAL*12+COMM,SAL*12)
FROM EMP;

select * from emp where empno=7369;

-- decode 함수
--decode([검사 대상이 될 열 또는 데이터],
-- [조건1],[데이터가 조건 1과 일치할때 반환할 결과],
-- [조건2],[데이터가 조건 2과 일치할때 반환할 결과],
--..........
--[위조건들 중에서 일치할 셩우가 없을때 반환할 결과]
--job id 에 따라 급여의 비율 설정
select empno,ename,job,sal,decode(job,'MANAGER',SAL * 1.1,
'SALESMAN',SAL*1.05,'ANALYST',SAL,SAL * 1.03)AS upsal from emp;

--case

select empno,ename,job,sal,case job 
when 'MANAGER' then SAL * 1.1
when 'SALESMAN'then SAL*1.05
when 'ANALYST'then SAL else SAL * 1.03 end AS upsal from emp;

--comm 이 널이면 '해당사항 없음', 0 이면 '수당없음' 0보다 크면 '수당:2500' 출력
select empno,ename,comm, case when comm is null then '해당사항없음'
when comm = 0 then '수당없음'
when comm > 0 then '수당 : ' || comm
 end as comm_text from emp;
 
 
 select empno,ename,sal,trunc(sal/21.5,2) as day_pay,round(sal/21.5/8,1) as time_pay
 from emp;
 --EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
 --사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오. 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.
 
SELECT COMM,NVL(COMM,0) FROM EMP;
SELECT COMM,NVL(COMM,'0') FROM EMP;
SELECT COMM,NVL(COMM,'N/A') FROM EMP; 
SELECT COMM,NVL(TO_CHAR(COMM),'N/A') FROM EMP; 
select empno,ename,hiredate,next_day(add_months(hiredate,3),'월요일') as r_job,
NVL(TO_CHAR(COMM),'N/A') AS COMM
from emp;

 --[실습]
 -- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.

--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

SELECT EMPNO,ENAME,MGR,
DECODE(SUBSTR(TO_CHAR(MGR),1,2),
NULL,'0000',
'75','5555',
'76','6666',
'77','7777',
'78','8888',
SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR
FROM EMP;

SELECT EMPNO,ENAME,MGR,
CASE
WHEN MGR IS NULL THEN '0000'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='75' THEN '5555'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
ELSE TO_CHAR(MGR) 
END AS CHG_MGR
FROM EMP;

--다중행 함수:sum(),count(),max()
select sum(sal) from emp;

select sum(sal),ename from emp;--단일 그룹의 그룹 함수가 아니다.

--emp 테이블으 ㅣ데이터 개수 조회
select count(*) from emp;

select count(empno) from emp;

select count(sal) from emp;

select count(distinct sal) from emp;

--부서번호가 10번인 사원의 최대 급여
select max(sal) from emp where deptno=10;
--부서번호가 10번인 사원의 최소 급여
select min(sal) from emp where deptno=10;

--부서번호가 20 번인 사원 중에서 제일 오래된 입사일 조회
select min(hiredate) from emp where deptno=20;

--부서번호가 30번인 사원들의 평균 급여 조회
seLEct AVG(DISTINCT SAL) FROM EMP WHERE DEPTNO=30;

--GROUP BY 그룹화할 열 지정 (여러개 지정 가능)

--부서별 급여의 합 조회
SELECT SUM(SAL),DEPTNO
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--부서별 급여의 평균 조회
SELECT AVG(SAL),DEPTNO
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--부서별,직무별 급여 평균 조회
SELECT AVG(SAL),DEPTNO,JOB
FROM EMP
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO,JOB;

--GROUP BY~~HAVING 조건식
--부서별 ,직무별 급여 평균 조회(단,급여의 평균이 2000이상)

SELECT DEPTNO,JOB ,AVG(SAL)
FROM EMP
WHERE SAL >=2000-- 그룹 함수는 허가되지 않습니다.
GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000
ORDER BY DEPTNO,JOB;

SELECT DEPTNO,JOB ,AVG(SAL)
FROM EMP
WHERE SAL <=3000-- 1.출력 대상이 되는 행 제한
GROUP BY DEPTNO,JOB HAVING AVG(SAL)>=2000--2.그룹화한 행 제한
ORDER BY DEPTNO,JOB;

--실습1] EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다.
--단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.

SELECT DEPTNO,FLOOR(AVG(SAL)) AS AVG_SAL,MAX(SAL) MAX_SAL,MIN(SAL) MIN_SAL,COUNT(*)
FROM EMP
GROUP BY DEPTNO;

--[실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문을 작성하시오.
SELECT JOB,COUNT(*)
FROM EMP
GROUP BY JOB HAVING COUNT(JOB)>=3;

--[실습3] 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 출력하는 SQL문 작성하시오.
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR,DEPTNO,COUNT(*) AS CNT
FROM EMP
GROUP BY  TO_CHAR(HIREDATE,'YYYY'),DEPTNO
ORDER BY HIRE_YEAR DESC,DEPTNO ASC;

-- 데이터 삽입,삭제,수정

--실습용 테이블 생성
create TABLE DEPT_TEMP AS SELECT * FROM DEPT;
select * from dept_temp;

--insert: 데이터 삽입\
--insert into 테이블명(필 드명.....)values(값1,값2...)
--insert into 테이블명 values(값1,값2....)
insert into dept_temp(deptno,dname,loc)values(50,'DATABASE','SEOUL');

INSERT INTO DEPT_TEMP VALUES(60,'NETWORK','BUSAN',70);

INSERT INTO DEPT_TEMP VALUES('NETWORK','BUSAN',70);--수치부적합
INSERT INTO DEPT_TEMP(dname,loc,deptno) VALUES('NETWORK','BUSAN',70);
insert into dept_temp(deptno,dname) values(90,'database');
insert into dept_temp(deptno,dname,loc) values(91,'web',null);
insert into dept_temp(deptno,dname,loc) values(92,'web','');
commit;

--실습용 테이블 생성
--테이블 구조는 복사하되,데이터는 복사하고싶지 않을 때
create TABLE emp_temp AS SELECT * FROM emp where 1<>1;
SELECT
    * FROM emp_temp;
    
desc emp_temp;
insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(1111,'홍길동','manager',null,'2021-09-27',4000,null,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(2222,'성춘향','analyst',null,'2021-09-27',5000,null,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(3333,'박보검','analyst',null,sysdate,5000,null,10);

commit;

--update: 수정 
--update: 테이블명 set 변경할 열=변경할값,변경할열=변경할값....
--update: 테이블명 set 변경할 열=변경할값,변경할열=변경할값...where 수정할 조건

SELECT
    * FROM dept_temp;
    
update dept_temp
set LOC='SEOUL'
WHERE DEPTNO=90;

update dept_temp
set LOC='BUSAN'
WHERE DEPTNO=91;
commit;

SELECT
    * FROM dept_temp;

--SAL이 4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp 
SET COMM=50
WHERE SAL<=4000;
commit;
SELECT
    * FROM emp_temp;

UPDATE EMP_TEMP
SET COMM=100;
ROLLBACK;

--DELETE:삭제 
--DELETE 테이블 이름 WHERE 삭제할 데이터 조건
--DELETE FROM 테이블 이름 WHERE 삭제할 데이터 조건

create TABLE emp_temp2 AS SELECT * FROM emp;
SELECT
    * FROM emp_temp2;

--JOB이 MANAGER인 사원 삭제
DELETE emp_temp2
where job='MANAGER';

--전체 사원 삭제
delete emp_temp2;
ROLLBACK;

--조인 

select count(*) from emp;
select count(*) from dept;
--카테시안 조인:나올수 있는 모든 조합(14행*4행=56행)
select * from emp,dept;

--내부조인(inner 조인)
--등가조인 : 일치하는 데이터 추출
--비등가 조인 : 특정 범위에 있는 데이터 추출

SELECT
    * FROM emp,dept
    where emp.deptno=dept.deptno;
    
    SELECT empno,ename,emp.deptno,dname
     FROM emp,dept
    where emp.deptno=dept.deptno;
    
    
    --테이블 별칭 설정
SELECT empno,ename,e.deptno,dname
     FROM emp e,dept d
    where e.deptno=d.deptno
    ORDER BY dname;

--sal 3000이상인 사원들의 사번,이름,부서번호,부서명,급여
select empno,ename,d.deptno,dname,sal
from emp e,dept d 
where e.deptno=d.deptno and sal>=3000;

-- 급여가 2500이하이고,사원번호가 9999 이하인 사원의 사번,이름,급여,부서명,부서위치
select empno,ename,sal,dname,loc,e.deptno
from emp e,dept d
where e.deptno=d.deptno and sal<=2500 and empno<=9999;


--emp테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
SELECT
    * FROM salgrade;
    
SELECT
    * FROM emp;
    
SELECT
    * FROM emp e,salgrade s
    where e.sal BETWEEN s.losal and s.hisal;
    
--자체조인 (셀프조인) :본인 테이블과 조인
SELECT
    * FROM emp;
    
select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1,emp e2
where e1.mgr =e2.empno;

--외부조인(outer join)
)

--왼쪽외부조인( left outer join
select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1,emp e2
where e1.mgr =e2.empno(+);

--오른쪽외부조인(right outer join)
select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1,emp e2
where e1.mgr(+) =e2.empno;

--양쪽 외부조인 (+ 기호는 제공안함)
--select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
--from emp e1,emp e2
--where e1.mgr(+) =e2.empno(+);

--모든 데이터 베이스에서 사용가능한 표준 조인 구문

--join-on
SELECT empno,ename,emp.deptno,dname
     FROM emp join dept on emp.deptno=dept.deptno 
    ORDER BY dname;

select empno,ename,d.deptno,dname,sal
from emp e join dept d on e.deptno=d.deptno
where sal>=3000;

select empno,ename,sal,dname,loc
from emp e join dept d on e.deptno=d.deptno
where sal<=2500 and empno<=9999;

SELECT
    * FROM emp e join salgrade s on e.sal
      BETWEEN s.losal and s.hisal;
      
--outer 표준 구문
select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1 left outer join emp e2 on
 e1.mgr =e2.empno;

select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1 right outer join emp e2
on e1.mgr=e2.empno;

select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1 full outer join emp e2
on e1.mgr=e2.empno;

--실습1
--급여가 2000초과인 사원들의 부서정보,사원 정보를 아래와 같이 출력하는 sql문 작성
select e.deptno,d.dname,e.empno,e.ename,e.sal
from emp e join dept d on e.deptno=d.deptno 
where  sal>2000 ;
--실습2
--각 부서별 평균 급여,최대 급여 ,최소 급여,사원수를 출력하는  sql문을 작성하시오

