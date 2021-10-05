--사용자 관리
--SCOTT,HR... 오라클 데이터베이스가 기본 계정으로 제공

--오라클 데이터베이스 특징
--테이블,인덱스,뷰... 여러가지 객체가 사용자별로 생성되고 관리

--데이터베이스 스키마
--데이터 간 관계,데이터 구조,제약 조건 등 데이터를 저장 및 관리하기 위해 정의한
--데이터베이스 구조의 범위
--사용자 == 스키마 

--사용자 생성
CREATE USER C##test IDENTIFIED BY 12345;
--사용자 비밀번호 변경
alter user C##test IDENTIFIED BY 54321;
--사용자 삭제
drop user C##test;
--상태:
--권환 부여

--권한 관리
--시스템 권한 :사용자 생성,정보 수정,삭제 ,데이터 베이스 접근 ,객체 생성...
grant create session to C##test;

grant create table to C##test;

create user c##test2 IDENTIFIED BY 12345;
grant resource,create session,create table to C##test2;

--사용자 삭제(현재 사용자가 만든 모든 객체 같이 삭제)
drop user c##test cascade;

drop user  c##test2 cascade;

create user c##test2 IDENTIFIED BY 12345
default tablespace users
temporary tablespace temp;

-- resource:테이블,트리거,시퀸스... 생성권한들이 모여있는 룰
grant resource,create session,create table to C##test2;

--c## test2에게 users 테이블 공간 2M 할당
 alter user C##test2 quota 2M on users;
 
 
 
 
 
 