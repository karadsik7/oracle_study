--�������� Ư���� Ȱ���ؼ� ������̺��� ���, �̸��� ��ȸ�ϰ� �ٷ� �ؿ� �μ����̺��� �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
select * from tabs;
desc employees;
desc departments;
select * from EMPLOYEES;
select employee_id, first_name from employees
union
select department_id, department_name from DEPARTMENTS;
--�������� Ư���� Ȱ���ؼ� ����� �ƹ��� ���� �μ����̺��� �μ���ȣ�� ��ȸ�Ͻÿ�.
select * from employees order by department_id asc;

select department_id from departments
minus
select department_id from employees;
--�������� Ư���� Ȱ���ؼ� manager�� �ƴ� ������� �����ȣ�� ��ȸ�Ͻÿ�.
select * from employees;

select employee_id from employees
minus
select manager_id from employees;

--�������� Ư���� Ȱ���ؼ� manager�� ������� �����ȣ�� ��ȸ�Ͻÿ�.
select employee_id from employees
intersect
select manager_id from employees;

