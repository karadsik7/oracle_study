--union(�ߺ� ����, ����) union all(�ߺ�����x, ����x) ������
select department_id, salary from employees where department_id = 90
union
select department_id, salary from employees where department_id = 80;

--union�� �÷����� �޶� �Ȱ��� �ڷ����̶�� �Ѳ����� ��ȸ �����ϴ�.
select department_id from departments
union
select salary from employees;

--�ߺ����� �ؾ��ϸ� �ȵ� ��
select department_id, salary from employees where department_id = 90 or department_id = 80 order by department_id, salary;

select department_id, salary from employees where department_id = 90
union all
select department_id, salary from employees where department_id = 80;

--intersect : ������
select salary from employees where department_id > 90
intersect
select salary from employees where department_id <= 80;

--minus : ������
select salary from employees where department_id = 100;

select salary from employees
minus
select salary from employees where department_id = 100;

-- �ߺ� ���� : distinct
select distinct salary from employees where department_id != 100;






