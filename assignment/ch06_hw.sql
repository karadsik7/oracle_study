--����� �̸�, �� ����� ���� �μ��� �μ����� �Բ� ����ϼ���.(inner)
select * from employees;
select * from departments;
select * from locations;
select e.first_name, d.department_name from employees e, departments d where e.department_id = d.department_id;
--����� �̸�, �� ����� ���� �μ��� �μ����� �Բ� ����ϼ���.(full outer)
select e.first_name, d.department_name from employees e full outer join departments d on e.department_id = d.department_id;
--����� �̸�,  �� ����� ���� �μ��� �μ����� �Բ� ����ϼ���.(left outer)
select e.first_name, d.department_name from employees d left outer join departments e on e.department_id = d.department_id;
--����� �̸�, �� ����� ���� �μ���, �� �μ��� ���� ���ø��� �Բ� ����ϼ���
select e.first_name, d.department_name, l.city from employees e, departments d, locations l where 
e.department_id = d.department_id and l.location_id = d.location_id;


--�����, �� ����� �Ŵ������� ����ϼ���
select e1.first_name as ����� , e2.first_name as �Ŵ����� from employees e1, employees e2 where e1.manager_id = e2.employee_id;


--�μ��� �μ��� �μ���� �μ��� ���� ������ �����ȣ�� ����ϼ���.
select * from employees;
select * from departments;
select * from jobs;
select * from locations;
select * from countries;
select * from regions;
select department_name, first_name, postal_code from departments d, employees e, locations l
where d.manager_id = e.employee_id and d.location_id = l.location_id;
--����� ����� ������(job_title)�� ����ϼ���.
select * from jobs;
select e.first_name, j.job_title from employees e, jobs j where e.job_id = j.job_id;
--�����, ������, �μ���, ���ø�, ������, ������� ����ϼ���.
select e.first_name, j.job_title, l.city, c.country_name, r.region_name from
employees e, jobs j, departments d, locations l, countries c, regions r where e.job_id = j.job_id and e.department_id = d.department_id
and d.location_id = l.location_id and  l.country_id = c.country_id and c.region_id = r.region_id;