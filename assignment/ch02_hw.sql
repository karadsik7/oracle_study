--[insert]--
--lion�������� �����Ͻÿ�

--����, ���, ������, �ֿ�, ����Ｚ���� ������ ��� ���� �ϳ��� ��� ������ ������ ��
--car���̺� �߰��Ͻÿ�.


select * from car;
describe car;
insert into car values('avante', 'hyundai', 23000000);
insert into car values('K-3', 'kia', 21000000);
insert into car values('malibu', 'chevrolet', 30000000);
insert into car values('qm6', 'renaultsamsung', 32000000);


--�л��� ���� ������ ������ �� �ִ� student��� ���̺��� �ۼ��Ͻÿ�.
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

--student���̺� �츮���л����� ���������� �����Ͻÿ�(������ ��� �ñ� ��...)

insert into student values(1, '������', 100, 70, 50);
select * from student;

--[select]--
--hr�������� ������ �����Ͻÿ�

--�������̺�(locations)�� �÷������� ��ȸ�ϰ� �м��ϼ���.
desc locations;

--�������̺�(locations)���� ����÷��� ��ȸ�ϼ���.
select * from locations;

--�������̺��� ���θ�, �����ȣ, ���ø��� ��ȸ�ϼ���.
select street_address, postal_code, city from locations;
--�������̺��� state_province, country_id�� ������ ��Ī�� �ο��ؼ� ��ȸ�ϼ���.
select state_province ��, country_id �����ڵ� from locations;
--������ �ش��ϴ� ���̺� ���� �����ÿ�.
select * from countries;
--�������̺��� ��ü �÷��� ��ȸ�ϵ� ������ ��Ī�� �ٿ��� ��ȸ�Ͻÿ�.
select * from countries;
select country_id �����ڵ�, country_name ������, region_id "���(����)��ȣ" from countries;
--hr������ �������ִ� ��� ���̺��� ��ȸ�ϰ� �𸣴� ���̺��̸� �м��ϼ���.
select * from tabs;
select * from job_history;
--employees���̺��� ��ȸ�ؼ� �����ȣ�� 145�� ����� ���� �̸��� �����ÿ�.
select * from employees;
select first_name, last_name from employees where employee_id = 145;

select employee_id �����ȣ, first_name �̸�, last_name �� from employees;
-- ��: 145�� john russell

--145�� ����� JOB_ID�� �˾� �� �� ������ ���� ������ �����ϴ� ���̺��� ��ȸ�Ͽ� 145����� JOB_ID 
--�� �ش��ϴ� ���� �̸��� ã�Ƴ� �� �����ÿ�.
select job_id from employees where employee_id = 145;

select employee_id �����ȣ, first_name �̸�, last_name ��, job_id from employees;
--sa_man
select * from jobs;
-- sales manager

--������̺��� ���� ���� ������ �޴� ����� �����ȣ�� �̸��� �����ÿ�.
select * from employees;

--�� : 100�� steven king 24000�޷�