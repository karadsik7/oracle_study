--���ڿ� �Լ�
--initcap : ù���ڸ� �빮���� ���ڿ��� ġȯ
select job_id, initcap(job_id) from employees;

--upper : �빮�ڷ�, lower : �ҹ��ڷ�
select upper(first_name), lower(job_id) from employees;
select first_name from employees where lower(first_name) like '%a%';

--length : ���ڿ��� ���� , lengthb : ���ڿ��� ����Ʈ �� ����

select first_name, length(first_name), job_id, lengthb(job_id) from employees;

--���� lengthb�� �ѱ��ǰ�� 2����Ʈ, 3����Ʈ�� ��찡 �ִ�
select length('�ٳ���') from dual;
select lengthb('�ٳ���') from dual;
select length('banana') from dual;
select lengthb('banana') from dual;


select first_name from employees where length(first_name) > 10;

--�ǽ� : ��ȭ��ȣ�� ���̰� 9���� �̻��� ����� �̸��� ��ȭ��ȣ�� ��ȸ
select first_name, phone_number from employees where length(phone_number) >= 9;

--substring
--���� : substr(���ڿ�, ������ ������ ��ġ, ������ ���ڼ�)
--sql�� ���κ��̽�(0)�� �ƴ� �����̽�(1)�� ù���ڰ� 0������ �ƴ� 1������ �ؼ�
select hire_date, substr(hire_date, 1, 2) from employees;

--�ǽ�: ���� �����ϼ���
select hire_date, substr(hire_date, 4, 2) from employees;
--�ǽ� : �ϸ� ����
select hire_date, substr(hire_date, 7, 2) from employees;
-- -(minus)�� ������ ���� �ε������� ����Ѵ�.
select hire_date, substr(hire_date, -2, 2) from employees;
--�ǽ� : ������̺��� ��ȭ��ȣ ������ 4�ڸ��� ��ȸ
select first_name, substr(phone_number, -4, 4) from employees;

--instr : �ڹ��� indexOf ��� : ã�� ���ڿ��� ��ġ�� ��ȯ
--���� : instr(���ڿ�, ã�� ����, ������ ��ġ, ã�� ���ڰ� ���° ã�� ���ڿ�����) <= 3,4��° �Ķ���ʹ� ��������
select first_name, instr(first_name, 'ar') from employees;

--�ǽ� instr�� ����ؼ� �̸��� 'ra'��� ���ڰ� ����ִ� ����� �̸��� ��ȸ
select first_name from employees where instr(first_name, 'ra') != 0;
select hire_date, instr(hire_date, '/'), instr(hire_date, '/', 3, 2) from employees;




