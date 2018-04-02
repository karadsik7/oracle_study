--문자열 함수
--initcap : 첫글자만 대문자인 문자열로 치환
select job_id, initcap(job_id) from employees;

--upper : 대문자로, lower : 소문자로
select upper(first_name), lower(job_id) from employees;
select first_name from employees where lower(first_name) like '%a%';

--length : 문자열의 길이 , lengthb : 문자열의 바이트 수 리턴

select first_name, length(first_name), job_id, lengthb(job_id) from employees;

--주의 lengthb는 한글의경우 2바이트, 3바이트의 경우가 있다
select length('바나나') from dual;
select lengthb('바나나') from dual;
select length('banana') from dual;
select lengthb('banana') from dual;


select first_name from employees where length(first_name) > 10;

--실습 : 전화번호의 길이가 9글자 이상인 사원의 이름과 전화번호를 조회
select first_name, phone_number from employees where length(phone_number) >= 9;

--substring
--문법 : substr(문자열, 추출을 시작할 위치, 추출할 문자수)
--sql은 제로베이스(0)가 아닌 원베이스(1)라 첫글자가 0번지가 아닌 1번지로 해석
select hire_date, substr(hire_date, 1, 2) from employees;

--실습: 월만 추출하세요
select hire_date, substr(hire_date, 4, 2) from employees;
--실습 : 일만 추출
select hire_date, substr(hire_date, 7, 2) from employees;
-- -(minus)를 넣으면 끝의 인덱스부터 계산한다.
select hire_date, substr(hire_date, -2, 2) from employees;
--실습 : 사원테이블에서 전화번호 마지막 4자리를 조회
select first_name, substr(phone_number, -4, 4) from employees;

--instr : 자바의 indexOf 기능 : 찾는 문자열의 위치를 반환
--문법 : instr(문자열, 찾는 문자, 시작할 위치, 찾는 문자가 몇번째 찾는 문자열인지) <= 3,4번째 파라미터는 생략가능
select first_name, instr(first_name, 'ar') from employees;

--실습 instr을 사용해서 이름에 'ra'라는 문자가 들어있는 사원의 이름을 조회
select first_name from employees where instr(first_name, 'ra') != 0;
select hire_date, instr(hire_date, '/'), instr(hire_date, '/', 3, 2) from employees;




