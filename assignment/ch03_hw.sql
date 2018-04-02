--������̺��� ������ 5000�̻��̸� ����(job_id)�� 'IT_PROG'�� ����� ��ȸ�ϼ���.
desc employees;
select * from employees where salary >= 5000 and job_id = 'IT_PROG';
--� ����� �ڽ��� �̸����� ����� �����µ� 'A��R~~~~'���·� �ν� �Ǿ���. �̷��� ������ ������ ����� �̸�, �̸����� ��ȸ�ϼ���.
--(��, ���� �ĺ��� �Ұ�����  �ѱ����� �����̸� ~~~~�� ���ĺ��� ���ڼ� ��� �ĺ��� �Ұ����� ��������)
select first_name, email from employees where instr(email, '��') != 0;

--������̺��� ����(job_id)�� 'IT_PROG', 'ST_MAN', 'ST_CLERK'�� �ƴϸ鼭 ����ȣ�� ���°� 4������ ���ڷ� �̷������ ���� 
--����� ��� �÷��� ��ȸ�ϼ���.
select * from employees where job_id not in('IT_PROG', 'ST_MAN', 'ST_CLERK') and phone_number not like('%.%.%.%');

--������̺��� ��� �÷��� ��ȸ�ϵ�  job_id�� 'SA_REP' �Ǵ� 'IT_PROG'�̸� job_id�� 'SA_REP'�̸� salary��  5000 �̻�
--10000�����̰� job_id�� 'IT_PROG'�̸� salary�� 4500�̻� 6000������ Ʃ�ø� ��ȸ�ϼ���. (BETWEEN ����ʼ�)
select * from employees where job_id = 'SA_REP' and salary between 5000 and 10000
union all
select * from employees where job_id = 'IT_PROG' and salary between 4500 and 6000;
--and�����ڰ� or�����ں��� �켱�̹Ƿ�
select * from employees where job_id = 'SA_REP' and salary between 5000 and 10000 
or job_id = 'IT_PROG' and salary between 4500 and 6000;
--�μ����̺��� ����÷��� ��ȸ�ϵ� ������ȣ(location_id)�� 1700�� Ʃ�ø� ��ȸ�ϼ���.
select * from tabs;
select * from departments where location_id = 1700;

--�μ����̺��� ����÷��� ��ȸ�ϵ� �޴�����ȣ�� null�� Ʃ�ø� ��ȸ�ϼ���.
select * from departments;
select * from departments where manager_id is not null;
--�μ����̺��� ����÷��� ��ȸ�ϵ� �μ����� �� �� ���ڰ� M �̰ų� N�� Ʃ�ø� ��ȸ�ϼ���.(OR ����ʼ�)
select * from departments where department_name like('M%') or department_name like('N%');
--�������̺��� �������̵�� ������, �׸��� �����ӱݰ� �ְ��ӱ��� ������ ��ȸ�Ͻÿ�.
select * from jobs;
select job_id, job_title, max_salary - min_salary as �ӱݰ��� from jobs;
--�������̺�(locations)���� sydney�� ��ġ�� ������ �Ÿ���� �����ȣ�� ��ȸ�Ͻÿ�.
desc locations;
select street_address, postal_code from locations where city = 'Sydney';
--�������̺��� state_province�� null�� �ƴ� ������ ���ø��� ��ȸ�Ͻÿ�.
select city from locations where state_province is not null;

--�������̺��� ���ø��� �ձ��ڰ� A ~ F�� ������ ���ø��� ��ȸ�Ͻÿ�.
select city from locations where city < 'G';
--�������̺��� �Ÿ����� 3�ܾ�� ������ [ex) 2007 Zagora St] ������ �Ÿ���� ���ø��� ��ȸ�Ͻÿ�.
select street_address, city from locations where STREET_ADDRESS like('% % %') 
and instr(street_address, ' ', 1, 3) = 0;

select street_address, city from locations where STREET_ADDRESS like('% % %') and STREET_ADDRESS not like('% % % %');

--�������̺��� �����ڵ尡 ������������, ���� �����ڵ��� city�� ������������ ���ĵǰ� ����÷��� ��ȸ�Ͻÿ�.
desc locations;
select * from locations order by country_id desc , city asc;


--�������̺�(countries)���� ���� �ڵ尡 UK�̰ų� IN�� ������ �������� ��ȸ�Ͻÿ�.
desc countries;
select country_name from countries where country_id = 'UK' or country_id = 'IN';

--�������̺��� �������� 5���� ������ ������ �������� ��ȸ�Ͻÿ�.
select country_id from countries;
select country_name from countries where length(country_name) <= 5;

--�������̺��� �����ڵ尡 U�� �����ϴ� �������� �������� ��ȸ�Ͻÿ�.
select country_name from countries where country_id like('U%');

--�������̺��� �������� ������������ ���ĵǰ� ����÷��� ��ȸ�Ͻÿ�.
select * from countries order by country_name desc;
