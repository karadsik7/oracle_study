select * from departments;
--테이블복사 : 단 제약조건은 복사 안됨
-- where 1=2 조건은 내용은 복사 안되게 하는것
create table dept as select * from departments where 1 = 2;
select * from dept;
desc dept;
drop table dept;


create table dept as select * from departments;
select * from dept;

--전체로우 삭제
delete from dept;

--특정로우 삭제
--실습 : 부서명이 s로 시작하는 부서를 삭제
delete from dept where department_name like 'S%';
delete from dept where instr(department_name, 'S') = 1;

--실습 : 부서명 글자수가 15글자 이하인 부서를 삭제
desc dept;
select * from dept;
delete from dept where length(department_name) <= 15;

--update
--실습 : employees 테이블과 컬럼명이 똑같은 empl테이블을 만들고
create table empl as select * from employees;
select * from empl;

update empl set salary = 10000;
drop table empl;

--실습 : commission_pct가 null인 사람들의 pct를 0.1로 일괄조정

update empl set commission_pct = 0.1 where commission_pct is null;

--실습 : 전화번호의 길이가 12글자 초과인 직원들의 전화번호를 999-999-9999형태로 변경하세요
select * from empl;
update empl set phone_number = replace(phone_number, '.', '-')
, salary = salary * 0.9 where length(phone_number) > 12;

--실습 : 근속년수가 15년 이상인 사원들의 월급을 10%인상하시오
update empl set salary = salary * 1.1 where trunc(months_between(sysdate, hire_date)) >= 15*12;

select first_name, hire_date, 
        trunc(months_between(sysdate, hire_date)) 입사개월
from employees where months_between(sysdate, hire_date) >= 160;


--실습 : 근속년수가 15년 미만인 사원들의 commission_pct를 10%낮추시오
select * from empl;
update empl set commission_pct = commission_pct - 0.1 where trunc(months_between(sysdate, hire_date)) < 15*12 and commission_pct >= 0.1;