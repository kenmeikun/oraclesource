alter session set "_ORACLE_SCRIPT" = TRUE;
alter user hr IDENTIFIED by hr;

--새로운 사용자 생성
CREATE USER c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;
--새로운 사용자에게 권한 부여
grant connect,resource,dba to c##scott;