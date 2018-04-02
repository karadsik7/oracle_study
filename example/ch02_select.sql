desc employees;
select * from EMPLOYEES;
select * from departments;

--������ ������ ���̺��� ��� ���
--select * from tabs;
select * from tabs;

--���̺��� ��ü �÷� ��ȸ
--select * from ���̺��;
select * from employees;

--�ǽ� : �μ����̺��� ��� �÷� ��ȸ
select * from departments;

--���̺��� �Ϻ� �÷� ��ȸ;
select employee_id, first_name, last_name from employees;

--�ǽ� �μ����̺��� �μ����̵�, �μ��̸��� ��ȸ�Ͻÿ�
desc departments;
select department_id, department_name from departments;

--select���� ������ ����� �ӽ����̺�� Ȱ��� �� �ִ�.
select first_name from (select first_name, last_name from EMPLOYEES);

--�������� ���̺��� �÷���ȸ
--�׷��� �ٷ� �Ʒ���ó�� �ع����� ���̺� ���� ������ ���� �ʾ�
--�׳� ��� ����� ���� ����ع���
select employee_id, first_name, department_name from employees, departments;
-- ���̺� �� department_id�� ���� ���� ���̶�� join�� ���ָ� ���ϴ� ������ ������
select employee_id, first_name, department_name from employees, departments
where employees.department_id = departments.department_id;

--��Ī : �÷��� �ڿ� as ��Ī Ȥ�� �����ϸ� ��Ī���� ������
select employee_id as �����ȣ, first_name �̸� from employees;

--�ǽ� : �μ����̺��� �μ���� �Ŵ��� ���̵� ��ȸ�ϵ� ���� �μ���, �Ŵ��� ���̵�� ��Ī ����
-- ���� : ���Ⱑ �� �� ""�� ����� ��
select * from departments;
select department_name �μ���, manager_id  "�Ŵ��� ���̵�" from departments;

--���ڿ� �̾���̱�
select first_name || ' ' || last_name full_name from employees;

--�ǽ� : �������̺��� �Ÿ���� �����ȣ�� �ٿ��� �ּҺ�Ī���� ���
select * from locations;

select street_address || ' ::: ' || postal_code as �ּ� from locations;

--��Ģ����
select first_name as �̸�, salary*12 as ���� from employees;
select * from employees;
--�ǽ� : �ǿ��� = ���� + ���� * commission_pct
select first_name as �̸�, (salary + (salary*commission_pct)) * 12 as �ǿ��� from employees;

--��¥ ��Ģ����
--������ 1��
select hire_date, hire_date + 1 from employees;

select hire_date, hire_date + 365 from employees;













