--�����, ����� ���� �μ���, �μ��� ���� ���ø��� ����ϵ� ������ ������� ���� subquery�� ����ؼ� ����Ͻÿ�.

select first_name, (select department_name from departments where department_id = e.department_id),
(select city from locations l, departments d where l.location_id = d.location_id and e.department_id = d.department_id) 
from employees e;

--���� �� ������ ���� �����͸� ����Ѵ�. �� ������ ���� �� ��� ������ ���ɸ鿡�� ȿ���������� �Ǵ��ϰ� �� ������ �����ϼ���.

select e.first_name, d.department_name from employees e, departments d 
    where e.department_id = d.department_id and d.department_id > 80;
    
--=> �켱 �� �������� ���̺��� ���� �ҷ��� �� where ���� �Ѿ�� �������ϰ� d�� id�� 80�̻��� ã�ƿ�
    
select e.first_name, d.department_name from employees e, (select * from departments where department_id > 80) d 
    where e.department_id = d.department_id;
    
--=> �� �������� e���̺�� ���������� ����ؼ� �ɷ��� ���̺��� �ҷ� �� �� ������ �߱� ������ �ҷ����� ������ ���� �� �� �����Ƿ�
-- cpu�� ó������ �ټ� �پ��� ȿ���� �ִ�


--������̺��� �μ��� �޿��� ���� ���� ����� �̸��� �޿��� �μ����̵� ����ϼ���.

--****����� ����ϴµ� salary�� �ڱⰡ ���� �μ��� �ִ밪�� ��ġ********

select department_id, max(salary) from employees group by department_id;
select first_name, salary from employees where salary = (�ڽ��� ���� �μ��� �ִ� ����);
select first_name, salary, department_id from employees e 
    where salary = (select max(salary) from employees where department_id = e.department_id) order by salary desc;
    
    
--��Ƽ��� ���� �μ����� ���ϴ� ��� ���
select *from employees where first_name = 'Steven';
select * from employees where department_id in(select department_id from employees where first_name = 'Steven');

--dept���̺��� department_id�� 10�� �����ϴ� �����̴�. �� ��Ģ�� ���߸��� �ʵ��� ��ĭ�� ä��ÿ�. (��ӻ���� ������ �������Ƹ� ��)
--insert into dept values (------------,'research and development', 200, 1500)
select * from dept;
insert into dept values((select max(department_id) from dept) + 10, 'research and development', 200, 1500);


--dept���̺��� department_id�� 10�� �����ϴ� �����̴�. dept���̺��� ���� �ֱٿ� �߰��� �ΰ��� Ʃ���� �����ϴ� ������ �ۼ��Ͻÿ�.

delete from dept
where department_id = (select max(department_id) from dept) or department_id = (select max(department_id) from dept) - 10;



