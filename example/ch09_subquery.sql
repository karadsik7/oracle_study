--select - select
-- ������ ���
select first_name, salary, avg(salary) from employees;
select avg(salary) from employees;
select first_name, salary, 6461 avg_salary from employees;

select first_name, salary, trunc((select avg(salary) from employees)) as ��� from employees;

--���̺�� ��� (join)
select first_name, (select department_name from departments d where e.department_id = d.department_id)
from employees e;

-- select - from : ���̺�
select �̸� from (select first_name as �̸�, salary as ���� from employees);

select d.department_name, l.city from departments d, (select city, location_id from locations
where country_id = 'US') l where d.location_id = l.location_id;

--select - where : ������ ���

select * from employees where salary = (select salary from employees where employee_id = 150);

--�ǽ� : ������ ��� ���� �̻��� ������� �̸��� ������ ���

select first_name, salary from employees where salary >= (select avg(salary) from employees);

--�ǽ� : bruce�� ���� �μ����� �ٹ��ϰ� �ִ� ������� �̸��� ���
desc employees;
select first_name from employees where department_id = (select department_id from employees where first_name = 'Bruce');

select e.first_name, d.department_name from employees e inner join departments d on e.department_id = d.department_id 
where e.department_id = (select department_id from employees where first_name = 'Bruce');

select e.first_name, d.department_name from employees e, departments d
where d.department_id = (select department_id from employees where first_name = 'Bruce') and e.department_id = d.department_id;

select * from employees where first_name = 'Steven';

--�ǽ� : 137�� ������� ������ ũ�ų� ���� 149�� ������� ������ �۰ų� ���� ����� �̸��� ������ ��ȸ�Ͻÿ�(between)

select first_name, salary from employees where salary between (select salary from employees where employee_id = 137) 
and (select salary from employees where employee_id = 149);

--select having : ������ ���
--������� �ش� ������ ���� ����� ��� ������ ��ȸ�ϵ� ��տ����� bruce���� ū ��쿡�� ��ȸ
select job_id, avg(salary) from employees group by job_id 
        having avg(salary) > (select salary from employees where first_name = 'Bruce');

--select - order by : ���̺�� ���
--������̺��� �μ����̵�, �̸��� ��ȸ�ϵ� �μ������� ����

select d.department_name, e.department_id, first_name from employees e, departments d
    where d.department_id = e.department_id
    order by (select department_name from departments d where d.department_id = e.department_id);

--insert - values : ������ ���
select * from teacher;
insert into teacher
    values((select max(id) + 1 from teacher), 'mark', 'ȫ�浿', 'm');


--delete - where : ������ Ȱ��
delete from teacher where id = (select max(id) from teacher);

--update - set :������ ���
update teacher set nickname = upper((select nickname from teacher where name = '�嵿��')) where name = '������';


--update - where : ������ ���
--������ ���� ���� �޴� ����� ������ 10% �谨�Ͻÿ�.
update empl set salary = salary * 0.9 where salary = (select max(salary) from empl);
select * from empl;

--�ǽ� ������ ���� ���� �޴� ������ ������ 15% ������Ű�ÿ�
select min(salary) from empl;
select * from empl order by salary desc;
update empl set salary = salary * 1.15 where salary = (select min(salary) from empl);

--�ǽ� ��տ��޺��� ������ ���Թ޴� ����� ������ 5% ������Ű�ÿ�.

update empl set salary = salary * 1.05 where salary < (select avg(salary) from empl);



