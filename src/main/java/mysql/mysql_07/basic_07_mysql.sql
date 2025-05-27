-- 다음과 같이 데이터베이스를 준비하세요.
	-- 데이터베이스명 : jbdc_ex
	-- 사용자 : scoula
	-- 비밀번호 : 1234
    -- jdbc_ex 데이터베이스에 대한 모든 사용권한 부여
CREATE DATABASE jdbc_ex;

CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON jdbc_ex.* TO 'scoula'@'%';

FLUSH PRIVILEGES;

-- Intellij에서 다음과 같은 users 테이블을정의하세요.
use jdbc_ex;

CREATE TABLE USERS (
 ID VARCHAR(12) NOT NULL PRIMARY KEY COMMENT '사용자 id',
 PASSWORD VARCHAR(12) NOT NULL comment '비밀번호',
 NAME VARCHAR(30) NOT NULL comment '이름',
 ROLE VARCHAR(6) NOT NULL comment '역할'
 );

-- 다음과 같은 테스트 데이터를 추가하세요
INSERT INTO USERS(ID, PASSWORD, NAME, ROLE)
VALUES('guest', 'guest123', '방문자', 'USER');

INSERT INTO USERS(ID, PASSWORD, NAME, ROLE)
VALUES('admin', 'admin123', '관리자', 'ADMIN');

INSERT INTO USERS(ID, PASSWORD, NAME, ROLE)
VALUES('member', 'member123', '일반회원', 'USER');

SELECT * FROM USERS;
