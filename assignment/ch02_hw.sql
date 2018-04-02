--[insert]--
--lion계정으로 접속하시오

--현대, 기아, 쉐보레, 쌍용, 르노삼성에서 마음에 드는 차를 하나씩 골라서 정보를 수집한 뒤
--car테이블에 추가하시오.


select * from car;
describe car;
insert into car values('avante', 'hyundai', 23000000);
insert into car values('K-3', 'kia', 21000000);
insert into car values('malibu', 'chevrolet', 30000000);
insert into car values('qm6', 'renaultsamsung', 32000000);


--학생에 대한 점수를 저장할 수 있는 student라는 테이블을 작성하시오.
--  id number primary key,
--  name varchar(50),
--  korean number(3),
--  english number(3),
--  math number(3)

create table student(
    id number primary key,
    name varchar(50),
    korean number(3),
    english number(3),
    math number(3)
);

--student테이블에 우리반학생들의 시험정보를 저장하시오(점수는 상상에 맡길 것...)

insert into student values(1, '장진수', 100, 70, 50);
select * from student;

--[select]--
--hr계정으로 서버에 접속하시오

--지역테이블(locations)의 컬럼정보를 조회하고 분석하세요.
desc locations;

--지역테이블(locations)에서 모든컬럼을 조회하세요.
select * from locations;

--지역테이블에서 도로명, 우편번호, 도시명을 조회하세요.
select street_address, postal_code, city from locations;
--지역테이블에서 state_province, country_id에 적절한 별칭을 부여해서 조회하세요.
select state_province 도, country_id 국가코드 from locations;
--국가에 해당하는 테이블 명을 적으시오.
select * from countries;
--국가테이블의 전체 컬럼을 조회하되 적절한 별칭을 붙여서 조회하시오.
select * from countries;
select country_id 국가코드, country_name 국가명, region_id "대륙(지역)번호" from countries;
--hr유저가 가지고있는 모든 테이블을 조회하고 모르는 테이블이면 분석하세요.
select * from tabs;
select * from job_history;
--employees테이블을 조회해서 사원번호가 145인 사원의 성과 이름을 적으시오.
select * from employees;
select first_name, last_name from employees where employee_id = 145;

select employee_id 사원번호, first_name 이름, last_name 성 from employees;
-- 답: 145번 john russell

--145번 사원의 JOB_ID를 알아 낸 뒤 직업에 대한 정보를 저장하는 테이블을 조회하여 145사원의 JOB_ID 
--에 해당하는 실제 이름을 찾아낸 뒤 적으시오.
select job_id from employees where employee_id = 145;

select employee_id 사원번호, first_name 이름, last_name 성, job_id from employees;
--sa_man
select * from jobs;
-- sales manager

--사원테이블에서 가장 높은 연봉을 받는 사원의 사원번호와 이름을 적으시오.
select * from employees;

--답 : 100번 steven king 24000달러