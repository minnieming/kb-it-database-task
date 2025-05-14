-- 현재 서버에 존재하는 데이터베이스 확인
show databases;

-- 현재 데이터베이스를 Employees로 설정하기
use employees;

-- employees 데이터베이스의 테이블 목록 보기
show tables from employees;

-- employees 테이블의 열 목록 출력하기
describe employees;


-- titles 테이블의 데이터 출력하기
select * from titles;

-- employees 테이블에서 first_name 컬럼만 출력하기
select first_name from employees;

-- employees 테이블에서 first_name, last_name, gender 출력하기
select first_name, last_name, gender from employees;


-- employees 테이블 출력시 다음과 같이 나오도록 쿼리를 작성하세요
select first_name, gender, hire_date from employees;


use sqldb;
-- usertbl 테이블에서 이름이 '김경호'인 행을 출력하세요
select * from usertbl where name = '김경호';

-- usertbl 테이블에서 생년이 1970 이상이고 키가 182 이상인 데이터를 출력하세요
select * from usertbl where birthyear >= 1970 and height >= 182;


-- usertbl 테이블에서 키가 180-183 범위인 데이터를 출력하세요.
select * from usertbl where height between 180 and 183;

-- usertbl 테이블에서 주소가 '경남' 또는 '전남' 또는 '경북'인 데이터를 출력하세요
select * from usertbl where addr in ('경남', '전남', '경북');

-- usertbl 테이블에서 이름이 '김'으로 시작하는 데이터를 출력하세요. 
select * from usertbl where name like '김%';


-- usertbl에서 김경호 보다 큰 사람들의 이름과 키를 출력하세요
Select name, height from usertbl where height > (select height from usertbl where name = '김경호');

-- usertbl을 mdate의 오름차순으로 정렬하여 출력하세요.
select * from usertbl order by mdate asc;

-- usertbl을 mdate의 내림차순으로 정렬하여 출력하세요.
select * from usertbl order by mdate desc;

-- usertbl을 height의 내림차순으로 정렬하고, 동률인 경우 name의 내림차순으로 정렬하여 출력하세요.
select * from usertbl order by height desc, name desc;

-- usertbl의 주소지를 중복없이 오름차순으로 출력하세요.
select distinct addr from usertbl order by addr asc;

-- 국가 코드가 'KOR'인 도시를 찾아 인구수를 역순으로 표시하세요.
select * from city where countrycode = 'kor' order by population desc;

-- city 테이블에서 국가코드와 인구수를 출력하라. 정렬은 국가코드별로 오름차순으로, 동일한 코드(국가) 안에서는 인구 수의 역순으로 표시하세요.
select countrycode, population from city order by countrycode asc, population desc;

-- city 테이블에서 국가코드가 'KOR'인 도시의 수를 표시하세요.
select count(*) from city where countrycode = 'kor';

-- city 테이블에서 국가코드가 'KOR', 'CHN', 'JPN'인 도시를 찾으세요.
select * from city where countrycode in ('kor', 'chn', 'jpn');

-- 국가코드가 'KOR'이면서 인구가 100만 이상인 도시를 찾으세요.
select * from city where countrycode = 'kor' and population >= 100000;

-- 국가 코드가 'KOR'인 도시 중 인구수가 많은 순서로 상위 10개만 표시하세요.
select * from city where countrycode = 'kor' order by population desc limit 10;

-- city 테이블에서 국가코드가 'KOR'이고, 인구가 100만 이상 500만 이하인 도시를 찾으세요.
select * from city where countrycode = 'kor' and population between 1000000 and 5000000