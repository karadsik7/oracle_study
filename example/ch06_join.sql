--[inner join]
--[where Ȱ��]
select first_name, e.department_id , 
d.department_id, department_name 
from employees e, departments d
where e.department_id = d.department_id;

select department_name, city
from departments d, locations l
where d.location_id = l.location_id;

--�ǽ� locations�� countries�� country_id��� �÷����� ���踦 �ΰ��ִ�.
--locations���̺��� ���ø�� �ش� ���ð� ��ġ�ϰ� �ִ� ������ �̸��� ��ȸ.
desc countries;
select city, country_name
from locations l, countries c
where l.country_id = c.country_id;

--�ǽ� counties���̺��� �������� �׸��� �� ������ ��ġ�ϰ��ִ� 
--����� �̸��� �Բ� ��ȸ.
desc regions;
select country_name, region_name
from countries c, regions r
where c.region_id = r.region_id;

--�ǽ� ���ø�, �� ���ð� ��ġ�ϰ��ִ� ������, �� ������ ��ġ�ϰ��ִ� �����
--�� �ѹ��� ��ȸ
desc countries;
select city, country_name, region_name from locations l, countries c, regions r
where l.country_id = c.country_id and c.region_id = r.region_id;

--join Ȱ��
--1. inner join
select first_name, job_id, department_name from employees inner join departments on employees.department_id = 
departments.department_id;

desc employees;
desc jobs;

--�ǽ� : ����� �̸��� ����� ���� job_title�� ��ȸ
select first_name, job_title from employees inner join jobs on employees.job_id = jobs.job_id;

--�ǽ� �μ���� street_adress, ���ø��� �Բ� ��ȸ
select * from tabs;
desc departments;
desc locations;

select department_name, street_address, city from departments d inner join locations l on d.location_id = l.location_id;

--�ǽ� �μ����̺��� manager_id�� �ְ� �̴� �μ����� ����� �ǹ��ϴµ� �μ��� �̸��� �μ����� �̸�(employees���̺��� �̸�)�� �Բ�
--��ȸ

select department_name, first_name from departments d inner join employees e on d.manager_id = e.employee_id;

select first_name, d.department_id, city from employees e inner join departments d
on e.department_id = d.department_id inner join locations l on d.location_id = l.location_id;

--2. outer join
--1) full outer join : ã�����ϴ� �����ͳ��� join�� ���� �ʴ��� ��� ���
select e.first_name, d.department_name from employees e full outer join departments d
on e.department_id = d.department_id;
--2) inner join : �����Ͱ� join�� ��츸 ����Ѵ�
select e.first_name, d.department_name from employees e inner join departments d
on e.department_id = d.department_id;
--�ǽ� : �μ���� �� �μ��� �μ����� ��ȸ�ϵ� �μ����� ���� �μ��� ��ȸ
select * from departments;
select * from employees;

select e.first_name, d.department_name from employees e full outer join departments d
on d.manager_id = e.employee_id;

--3)left outer join : left outer join�� �������� left�� ���̺��� join���� �ʴ� ��쿡
--outer join�� �ϰ� right������ inner join�� ��
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
    pct number(5,2) not null -- ���� ���ڴ� �Ҽ����ڸ��� ����
);

select * from tax;
insert into tax values(1, 20000, 30000, 0.2);
insert into tax values(2, 10000, 20000, 0.15);
insert into tax values(3, 0, 10000, 0.1);

select e.first_name, e.salary, t.pct as tax from employees e join tax t
on e.salary >= t.min and e.salary < t.max;

select e.first_name, e.salary, t.pct as tax, t.PCT*e.SALARY as salTax from employees e join tax t
on e.salary >= t.min and e.salary < t.max;







