--[inner join]
--[where 활용]
select first_name, e.department_id , 
d.department_id, department_name 
from employees e, departments d
where e.department_id = d.department_id;

select department_name, city
from departments d, locations l
where d.location_id = l.location_id;

--실습 locations와 countries는 country_id라는 컬럼으로 관계를 맺고있다.
--locations테이블에서 도시명과 해당 도시가 위치하고 있는 국가의 이름을 조회.
desc countries;
select city, country_name
from locations l, countries c
where l.country_id = c.country_id;

--실습 counties테이블에서 국가명을 그리고 그 국가가 위치하고있는 
--대륙이 이름을 함께 조회.
desc regions;
select country_name, region_name
from countries c, regions r
where c.region_id = r.region_id;

--실습 도시명, 그 도시가 위치하고있는 국가명, 그 국가가 위치하고있는 대륙명
--을 한번에 조회
desc countries;
select city, country_name, region_name from locations l, countries c, regions r
where l.country_id = c.country_id and c.region_id = r.region_id;

--join 활용
--1. inner join
select first_name, job_id, department_name from employees inner join departments on employees.department_id = 
departments.department_id;

desc employees;
desc jobs;

--실습 : 사원의 이름과 사원의 실제 job_title을 조회
select first_name, job_title from employees inner join jobs on employees.job_id = jobs.job_id;

--실습 부서명과 street_adress, 도시명을 함께 조회
select * from tabs;
desc departments;
desc locations;

select department_name, street_address, city from departments d inner join locations l on d.location_id = l.location_id;

--실습 부서테이블에는 manager_id가 있고 이는 부서장인 사원을 의미하는데 부서의 이름과 부서장의 이름(employees테이블의 이름)을 함께
--조회

select department_name, first_name from departments d inner join employees e on d.manager_id = e.employee_id;

select first_name, d.department_id, city from employees e inner join departments d
on e.department_id = d.department_id inner join locations l on d.location_id = l.location_id;

--2. outer join
--1) full outer join : 찾고자하는 데이터끼리 join이 되지 않더라도 모두 출력
select e.first_name, d.department_name from employees e full outer join departments d
on e.department_id = d.department_id;
--2) inner join : 데이터가 join된 경우만 출력한다
select e.first_name, d.department_name from employees e inner join departments d
on e.department_id = d.department_id;
--실습 : 부서명과 그 부서의 부서장을 조회하되 부서장이 없는 부서도 조회
select * from departments;
select * from employees;

select e.first_name, d.department_name from employees e full outer join departments d
on d.manager_id = e.employee_id;

--3)left outer join : left outer join을 기준으로 left의 테이블에는 join되지 않는 경우에
--outer join을 하고 right측에는 inner join을 함
select first_name, department_name from employees e left outer join departments d
on e.department_id = d.department_id;

--self join
select * from employees;
select first_name, manager_id from employees;
select e1.first_name, e2.first_name from employees e1 inner join employees e2 on
e1.manager_id = e2.employee_id order by e1.first_name;

--non-equi join
create table tax(
    t_id number primary key,
    min number not null,
    max number not null,
    pct number(5,2) not null -- 뒤의 숫자는 소숫점자릿수 제한
);

select * from tax;
insert into tax values(1, 20000, 30000, 0.2);
insert into tax values(2, 10000, 20000, 0.15);
insert into tax values(3, 0, 10000, 0.1);

select e.first_name, e.salary, t.pct as tax from employees e join tax t
on e.salary >= t.min and e.salary < t.max;

select e.first_name, e.salary, t.pct as tax, t.PCT*e.SALARY as salTax from employees e join tax t
on e.salary >= t.min and e.salary < t.max;







