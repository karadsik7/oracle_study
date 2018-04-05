--�����, ����� ���� �μ���, �μ��� ���� ���ø��� ����ϵ� ������ ������� ���� subquery�� ����ؼ� ����Ͻÿ�.

select first_name, department_name, city from employees, (select * from departments), (select * from locations);

--���� �� ������ ���� �����͸� ����Ѵ�. �� ������ ���� �� ��� ������ ���ɸ鿡�� ȿ���������� �Ǵ��ϰ� �� ������ �����ϼ���.

select e.first_name, d.department_name from employees e, departments d 
    where e.department_id = d.department_id and d.department_id > 80;
    
--=> �켱 �� �������� ���̺��� ���� �ҷ��� �� where ���� �Ѿ�� �������ϰ� d�� id�� 80�̻��� ã�ƿ�
    
select e.first_name, d.department_name from employees e, (select * from departments where department_id > 80) d 
    where e.department_id = d.department_id;
    
--=> �� �������� e���̺�� ���������� ����ؼ� �ɷ��� ���̺��� �ҷ� �� �� ������ �߱� ������ �ҷ����� ������ ���� �� �� �����Ƿ�
-- cpu�� ó������ �ټ� �پ��� ȿ���� �ִ�


--������̺��� �μ��� �޿��� ���� ���� ����� �̸��� �޿��� �μ����̵� ����ϼ���.
select department_id, max(salary) from employees group by department_id;

select first_name, salary, department_id from employees 
    where salary in((select max(salary) from employees group by department_id));
    

select first_name, salary, department_id from (select max(salary) from employees group by department_id);
select * from jobs;
select * from employees;
--����� ����ϴµ� salary�� �ڱⰡ ���� �μ��� �ִ밪�� ��ġ
select first_name, salary, department_id from employees 
where (select max(salary), department_id from employees group by department_id);



--dept���̺��� department_id�� 10�� �����ϴ� �����̴�. �� ��Ģ�� ���߸��� �ʵ��� ��ĭ�� ä��ÿ�. (��ӻ���� ������ �������Ƹ� ��)
--insert into dept values (------------,'research and development', 200, 1500)
select * from dept;
insert into dept values((select max(department_id) from dept) + 10, 'research and development', 200, 1500);


--dept���̺��� department_id�� 10�� �����ϴ� �����̴�. dept���̺��� ���� �ֱٿ� �߰��� �ΰ��� Ʃ���� �����ϴ� ������ �ۼ��Ͻÿ�.

delete from dept
where department_id = (select max(department_id) from dept) or department_id = (select max(department_id) from dept) - 10;



