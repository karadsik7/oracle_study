--count : null�� �ƴ� �÷��� ����
select count(employee_id) from employees;
select count(commission_pct) from employees;
select first_name, job_id from employees;
--�ش� �÷��� �����Ͱ� ������������ �˰� ���� �� �ߺ� ���Ÿ� Ȱ��
select count(distinct commission_pct) from employees;
--�����̸Ӹ� Ű�� ī��Ʈ�� ���Ͱ� ������ ���(������ ����)
select count(*) from employees;

--�׷��Լ��� �Ϲ� �÷��� ���� ��� �Ұ���
select count(*), first_name from employees;

--���� : group by ���� ���� �÷��� �׷��Լ��� ���� �� �ִ�
select job_id, count(*) from employees group by job_id;

--�ǽ� : �Ŵ����� ����ϴ� ����� ��ȸ

select manager_id, count(*) from employees group by manager_id;

--sum
select sum(salary) from employees;
select department_id, sum(salary) from employees group by department_id;
select d.department_name, sum(e.salary) from employees e, departments d
group by d.department_name;

--�ǽ� : �������� ������ �ջ��� ��ȸ

select job_id, sum(salary) from employees group by job_id;

--�ǽ� : ������ ���� ���
select job_id, avg(salary) from employees group by job_id;

select * from employees;

--max
select max(salary) from employees;

--MIN
select department_id, min(salary) from employees group by department_id;
select job_id, min(salary) from employees group by job_id;

--variance : �л�
select job_id, trunc(variance(salary)) from employees group by job_id;

--stddev, ǥ������
select department_id, trunc(stddev(salary)) from employees group by department_id order by stddev(salary);

--having : �׷��Լ� ������
select job_id, max(salary) from employees where max(salary) > 5000 group by job_id;

select job_id, max(salary) from employees group by job_id having max(salary) > 5000 order by max(salary);

--�ǽ� : �� �μ��� ��� ������ ��ȸ ��, ��� ������ 10000 �̸��� �׷츸
desc employees;
select department_id, trunc(avg(salary)) from employees group by department_id 
having avg(salary) < 10000 order by avg(salary);

select department_id, trunc(avg(salary)) from employees where department_id < 50 group by department_id; 

--group by ������ ����� �÷��� having������ �� �÷����� ��� �� �� ������ ȿ���� �÷������� where���� �׷�������
--having������ ����ϵ��� �Ѵ�

select department_id, job_id, sum(salary) from employees group by department_id, job_id
order by department_id;





