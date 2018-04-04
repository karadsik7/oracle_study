select * from departments;
--���̺��� : �� ���������� ���� �ȵ�
-- where 1=2 ������ ������ ���� �ȵǰ� �ϴ°�
create table dept as select * from departments where 1 = 2;
select * from dept;
desc dept;
drop table dept;


create table dept as select * from departments;
select * from dept;

--��ü�ο� ����
delete from dept;

--Ư���ο� ����
--�ǽ� : �μ����� s�� �����ϴ� �μ��� ����
delete from dept where department_name like 'S%';
delete from dept where instr(department_name, 'S') = 1;

--�ǽ� : �μ��� ���ڼ��� 15���� ������ �μ��� ����
desc dept;
select * from dept;
delete from dept where length(department_name) <= 15;

--update
--�ǽ� : employees ���̺�� �÷����� �Ȱ��� empl���̺��� �����
create table empl as select * from employees;
select * from empl;

update empl set salary = 10000;
drop table empl;

--�ǽ� : commission_pct�� null�� ������� pct�� 0.1�� �ϰ�����

update empl set commission_pct = 0.1 where commission_pct is null;

--�ǽ� : ��ȭ��ȣ�� ���̰� 12���� �ʰ��� �������� ��ȭ��ȣ�� 999-999-9999���·� �����ϼ���
select * from empl;
update empl set phone_number = replace(phone_number, '.', '-')
, salary = salary * 0.9 where length(phone_number) > 12;

--�ǽ� : �ټӳ���� 15�� �̻��� ������� ������ 10%�λ��Ͻÿ�
update empl set salary = salary * 1.1 where trunc(months_between(sysdate, hire_date)) >= 15*12;

select first_name, hire_date, 
        trunc(months_between(sysdate, hire_date)) �Ի簳��
from employees where months_between(sysdate, hire_date) >= 160;


--�ǽ� : �ټӳ���� 15�� �̸��� ������� commission_pct�� 10%���߽ÿ�
select * from empl;
update empl set commission_pct = commission_pct - 0.1 where trunc(months_between(sysdate, hire_date)) < 15*12 and commission_pct >= 0.1;