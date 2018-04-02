--�������� �˻� => where

--��Һ�
select first_name, salary from employees where salary > 10000;
select first_name, salary from employees where salary >= 10000;
select first_name, salary from employees where 3000 > salary;
select first_name, salary from employees where salary <= 10000;

--����
select first_name, salary from employees where salary = 10000;

--���� �ʴ� !=, <> �Ѵ� ���� ���
select first_name, salary from employees where salary != 10000;
select first_name, salary from employees where salary <> 10000;


--�ǽ� �����ȣ�� 150�̻��� ����� ���, ��, �Ի����� ���
describe employees;
select employee_id as ���, last_name as ��, hire_date as �Ի��� from employees
where employee_id >= 150;

--���ڿ� ����
select first_name, hire_date from employees where first_name = 'Steven';
--����ǥ�� ������� ��Һ񱳸� �� �� �ִ�.
select first_name from employees where first_name < 'Alex';
select first_name from employees where first_name < 'B';

--�̸��� �� �� ���ڰ� H���� ���������� �ڿ� ��ġ�� ��� ����� ���� ��ȸ
select first_name from employees where first_name > 'Hz';
select first_name from employees where first_name >= 'I';

--null��

--select first_name, salary from employees where commission_pct = null; �̰žƴ�
select first_name, salary from employees where commission_pct is null;
select first_name, salary from employees where commission_pct is not null;
--�ǽ� : �Ŵ����� ���� ������� ��� ������ ��ȸ
desc employees;
select * from employees where manager_id is null;

--��������
-- select * from employees where salary > 5000 && salary <= 10000; �̰� �ƴ�
select * from employees where salary > 5000 and salary <= 10000;
select * from employees where salary > 5000 or salary <= 10000;
--�ǽ� ������ 10000 �̻�, 15000�̸��� ����� ��� ������ ��ȸ
select * from employees where salary >= 10000 and salary < 15000;
--�ǽ�2 : ������ 5000�̸��̰ų� 20000�̻��� ������� ���� ��ȸ
select * from employees where salary < 5000 or salary >= 20000;
select * from employees where hire_date >= '03/01/01';

--�ǽ�3 : �Ի簡 05�� ���ĸ鼭 06�� ������  ������� ���� ��ȸ
select * from employees where hire_date >= '05/01/01' and hire_date < '06/01/01';

--�ǽ� : job_id�� 'Sa_man'�̰ų� 'it_prog'�� ����� ��� ���� ��ȸ
select * from employees where job_id = 'SA_MAN' or job_id = 'IT_PROG';
--�ǽ�2 : �̸��� �� �ձ��ڰ� H�� ������� ��� ���� ��ȸ
select * from employees where first_name >= 'H' and first_name < 'I';

--In : ���񱳸� �Ҷ� or�� ����ؾ� �� ��� ȿ����
select * from employees where job_id in('SA_MAN', 'IT_PROG', 'HR_REP');

--�ǽ� : ����� 100, 102, 104, 106���� ����� ��� ���� ��ȸ
select * from employees where employee_id in(100, 102, 104, 106);
select * from employees where employee_id = 100 or employee_id = 102 or employee_id = 104 or employee_id = 106;

--between : ��Һ񱳽� and�� ����� ���
select * from employees where salary >= 5000 and salary <= 6000;
select * from employees where salary between 5000 and 6000;

--�ǽ� 05�⵵�� �Ի��� ����� ��� ���� ��ȸ(between���)
select * from employees where hire_date between '05/01/01' and '05/12/31';

--like % -> ������ ���� ����
--like _ -> ������ �� ����
select * from employees where first_name like 'H%';
select * from employees where first_name like 'Ha%';
select * from employees where first_name like 'H____'; --�ڸ����� h���� 4����
--�ǽ� : �̸��� a�� ������ ����� ��� ������ ��ȸ
select * from employees where first_name like '%a';
--�ǽ�2 : �̸��� h�� �����ϸ鼭 6���� �̻��� ����� ��� ������ ��ȸ
select * from employees where first_name like 'H_____%';
--�ǽ� �̸��� o�� ���鼭 �̸��� a�� ������ ����� ������ ��ȸ
select * from employees where first_name like '%o%a';
select * from employees where phone_number like '011%';

--�ǽ� ��ȭ��ȣ�� 6���� �����ؼ� �߰��� 2�� ���� 9�� ������ ��� ��ȸ
select * from employees where phone_number like '6%2%9';
--�ǽ� ��ȭ��ȣ�� 44�� ���� ��� ��ȸ
select * from employees where phone_number like '%44%';
--�ǽ� ��ȭ��ȣ�� 4���� �׷����� �̷���� ��� ��ȸ
select * from employees where phone_number like '%.%.%.%';

--not
select * from employees where job_id not in('SA_MAN', 'IT_PROG', 'HR_REP');

--�ǽ� ���� ����� or �Ǵ� and�� Ȱ���ؼ� �Ȱ��� ��ȸ�ϼ���.
select * from jobs;
select * from employees where job_id != 'SA_MAN' and job_id != 'IT_PROG' and job_id !='HR_REP';

--not like
select * from employees where phone_number not like '%44%';

--�ǽ� : 44�� �߰����� ����ִ� ����� ��� ������ ��ȸ

select * from employees where phone_number like '%44%' and phone_number not like '44%' and phone_number not like '%44';

--order by
select * from employees;
desc employees;
--��������
select * from employees order by salary; -- asc�� ���� �ٿ����ǰ� �Ⱥٿ��� �⺻�� ��������
--��������
select * from employees order by salary desc;

--�ǽ� ������ 15000�޷� �̻��� ������� ��� ������ �Ի����� ���� ������ ��ȸ
select * from employees where salary >= 15000 order by hire_date;

--���� �����Ͽ��� 2���� ������ �ϰ� �ʹٸ� : hire_date �켱���� hire_date�� ���� �� first_name����
select * from employees order by hire_date, first_name desc;


