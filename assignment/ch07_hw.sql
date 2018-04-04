--������̺��� �����, ���� ���� ����, ���� ���� ������ ����ϼ���.
select count(employee_id), max(salary), min(salary) from employees;
--������̺��� �μ���(department_id)�� �׷�ȭ��Ű�� �μ����̵�(department_id)�� �μ��� �ο���, �μ��� �޿������ ����ϼ���.
select department_id, count(employee_id), round(avg(salary)) from employees group by department_id;
--���� �������� ������ Ȱ���ؼ� �μ����̵�(department_id) ��� �μ���(department_name)�� ����ϼ���.(�׷�ȭ + ����)
select d.department_name, count(e.employee_id), round(avg(salary)) from employees e, departments d where e.department_id =
d.department_id group by d.department_name;

--������̺��� �μ� ���̵�, ���� ���̵�� �׷�ȭ��Ű�� �μ����̵�, �������̵�, �� �׷캰 ����ǥ�������� ���ϼ���.
select * from departments;
select * from employees;
select * from jobs;
select d.department_id, j.job_id, trunc(stddev(salary)) from jobs j, departments d, employees e
where e.department_id = d.department_id and e.job_id = j.job_id group by d.department_id, j.job_id;

--������̺��� �μ� ���̵�� �׷�ȭ ��Ų�� �׷��� �޿������ 6000�� �Ѵ� �μ��� �μ����̵�, �μ��� �޿��Ѿ�, �μ��� �޿������
--����ϼ���.

select e.department_id, sum(salary), trunc(avg(salary)) from employees e group by e.department_id having avg(salary) >= 6000;
