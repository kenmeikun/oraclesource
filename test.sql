CREATE TABLE TABLE_DEFAULT(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDF_LGNID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
TEL VARCHAR2(20));

INSERT INTO TABLE_DEFAULT(LOGIN_ID,login_pwd)
VALUES('TEST_ID','TEST_ID');