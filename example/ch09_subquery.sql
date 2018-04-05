--select - select
-- 값으로 사용
select first_name, salary, avg(salary) from employees;
select avg(salary) from employees;
select first_name, salary, 6461 avg_salary from employees;

select first_name, salary, trunc((select avg(salary) from employees)) as 평균 from employees;

--테이블로 사용 (join)
select first_name, (select department_name from departments d where e.department_id = d.department_id)
from employees e;

-- select - from : 테이블
select 이름 from (select first_name as 이름, salary as 월급 from employees);

select d.department_name, l.city from departments d, (select city, location_id from locations
where country_id = 'US') l where d.location_id = l.location_id;

--select - where : 값으로 사용

select * from employees where salary = (select salary from employees where employee_id = 150);

--실습 : 월급이 평균 월급 이상인 사원들의 이름과 월급을 출력

select first_name, salary from employees where salary >= (select avg(salary) from employees);

--실습 : bruce와 같은 부서에서 근무하고 있는 사원들의 이름을 출력
desc employees;
select first_name from employees where department_id = (select department_id from employees where first_name = 'Bruce');

select e.first_name, d.department_name from employees e inner join departments d on e.department_id = d.department_id 
where e.department_id = (select department_id from employees where first_name = 'Bruce');

select e.first_name, d.department_name from employees e, departments d
where d.department_id = (select department_id from employees where first_name = 'Bruce') and e.department_id = d.department_id;

select * from employees where first_name = 'Steven';

--실습 : 137번 사원보다 월급이 크거나 같고 149번 사원보다 월급이 작거나 같은 사원의 이름과 월급을 조회하시오(between)

select first_name, salary from employees where salary between (select salary from employees where employee_id = 137) 
and (select salary from employees where employee_id = 149);

--select having : 값으로 사용
--직종명과 해당 직종을 가진 사원의 평균 월급을 조회하되 평균월급은 bruce보다 큰 경우에만 조회
select job_id, avg(salary) from employees group by job_id 
        having avg(salary) > (select salary from employees where first_name = 'Bruce');

--select - order by : 테이블로 사용
--사원테이블에서 부서아이디, 이름을 조회하되 부서명으로 정렬

select d.department_name, e.department_id, first_name from employees e, departments d
    where d.department_id = e.department_id
    order by (select department_name from departments d where d.department_id = e.department_id);

--insert - values : 값으로 사용
select * from teacher;
insert into teacher
    values((select max(id) + 1 from teacher), 'mark', '홍길동', 'm');


--delete - where : 값으로 활용
delete from teacher where id = (select max(id) from teacher);

--update - set :값으로 사용
update teacher set nickname = upper((select nickname from teacher where name = '장동혁')) where name = '강감찬';


--update - where : 값으로 사용
--월급을 가장 많이 받는 사원의 월급을 10% 삭감하시오.
update empl set salary = salary * 0.9 where salary = (select max(salary) from empl);
select * from empl;

--실습 월급을 가장 적게 받는 직원의 월급을 15% 증가시키시오
select min(salary) from empl;
select * from empl order by salary desc;
update empl set salary = salary * 1.15 where salary = (select min(salary) from empl);

--실습 평균월급보다 월급을 적게받는 사원의 월급을 5% 증가시키시오.

update empl set salary = salary * 1.05 where salary < (select avg(salary) from empl);



