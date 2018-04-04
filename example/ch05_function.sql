--[���ڿ� �Լ�]
--[initcap : ù���ڸ� �빮�� ������ �ҹ���]
select job_id, initcap(job_id) from employees;

--[upper, lower]
select upper(first_name), lower(job_id) from employees;
select first_name from employees where lower(first_name) like '%a%';

--[length, lengthb]
select first_name, length(first_name), job_id, lengthb(job_id)
from employees;
select length('�ٳ���'), lengthb('�ٳ���') from dual;
select first_name from employees where length(first_name) > 6;
--�ǽ� ��ȭ��ȣ�� ���̰� 9���� �̻��� ����� �̸��� ��ȭ��ȣ�� ��ȸ
select first_name, phone_number 
from employees where length(phone_number) >= 9;

--[substr(���ڿ�, ������ ������ ��ġ, ������ ���ڼ�)]
select hire_date, substr(hire_date, 1, 2) from employees;
--�ǽ� ���� �����Ͻÿ�.
select hire_date, substr(hire_date, 4, 2) from employees;
--�ǽ� �ϸ� �����Ͻÿ�.
select hire_date, substr(hire_date, -2, 2) from employees;
--�ǽ� ������̺��� ��ȭ��ȣ ������ 4�ڸ��� ��ȸ
select phone_number, substr(phone_number, -4, 4) from employees;

--[instr : ã�� ���ڿ��� ��ġ�� ��ȯ
--(���ڿ�, ã�¹���, ��������ġ, ���°����]
select first_name, instr(first_name, 'ar') from employees;
--�ǽ� instr�� ����ؼ� �̸��� 'ra'��� ���ڰ� ����ִ� ����� �̸��� ��ȸ
select first_name from employees where instr(first_name, 'ra') != 0;
select hire_date, instr(hire_date,'/'), instr(hire_date,'/',4,2)
from employees;
select phone_number from employees;
select phone_number, instr(phone_number, '.',-1,1) from employees;

select substr(phone_number, instr(phone_number, '.',-1,1)+1, 6) 
from employees;

--[lpad, rpad]
select first_name, lpad(first_name, 10, '*') from employees;
select first_name, rpad(first_name, 10, '*') from employees;
select '910323-1234567', rpad('910323-',14, '*') from dual;
--�ǽ� first_name�� ������ 2���ڸ� **�� ��ü�Ͻÿ�.
select first_name, 
rpad(substr(first_name,1, length(first_name)-2),
length(first_name), '**')
from employees;

select first_name, 
rpad(substr(first_name,1, 2),
length(first_name), '**')
from employees;

--[replace]
select hire_date, replace(hire_date,'/','-') from employees;
--�ǽ� ������̺��� ��ȭ��ȣ�� �����ڸ� .�� �ƴ� %�� ��ȸ�Ͻÿ�.


--[���� �Լ�]
--[round : �ݿø�, trunc : ����]
select 123.456, round(123.456, 2), trunc(123.456, 2)+0.01 from dual;

select 123.456, round(123.456, 0), round(123.456), round(123.456,-1)
from dual;

select 123.456, trunc(123.456) + 1 from dual;

--[ceil : �־��� ���ڿ� ���� ����� ū ����]
--[floor : �־��� ���ڿ� ���� ����� ���� ����]
select 123.456, ceil(123.456), floor(123.456) from dual;
select -123.456, ceil(-123.456), floor(-123.456) from dual;

--[mod : ����������]
select mod(11, 3) from dual;
select mod(11.5, 3) from dual;
--�ǽ� ¦�� �����ȣ�� ���� ������� ������� ��ȸ
select * from employees where mod(employee_id, 2) = 0;

--[power : ����, sqrt : ������]
select power(2, 3) from dual;
select power(2, -3) from dual;

select sqrt(2) from dual;

--[��¥ �Լ�]
--[sysdate, systimestamp]
select sysdate from dual;
select systimestamp from dual;

--[months_between]
select sysdate, hire_date, months_between(sysdate, hire_date) 
from employees;
--�ǽ� : �Ի�Ⱓ�� 160���� �̻��� ������� �̸�, �Ի���, �ϻ��� ���� ������
--       �� ��ȸ�Ͻÿ�(��, �Ի��� �������� ������ ǥ���� ��)
select first_name, hire_date, 
        trunc(months_between(sysdate, hire_date)) �Ի簳��
from employees where months_between(sysdate, hire_date) >= 160;

--[add_months]
select hire_date, add_months(hire_date, 6) from employees;
--�ǽ� ����� 120���� ����� �Ի��� 3�� 6������ �Ǵ³��� ��Ƽ�� �Ϸ����Ѵ�.
--     ��¥�� ���Ͻÿ�.
select add_months(hire_date,3*12+6) from employees where employee_id = 120;

--[next_day : Ư�� ��¥�� �������� ���� ���� ���ƿ��� ������ ��ȯ]
select hire_date, next_day(hire_date, '��') from employees;

--�ǽ� �������� �Ŵ� ù°�� �������̴�. ������ �������� ���Ͻÿ�.
select next_day('18/04/30','��') from dual;

--[last_day : �ش� ���� ������ ��]
select last_day(sysdate) from dual;

--[����ȯ �Լ�]

--[����] ==to_char()==> [����] <==to_char()== [��¥]
--[����] <==to_number()== [����] ==to_date()==> [��¥]

--[���� ==> ����]
select salary*12, to_char(salary*12) from employees;
select salary*12, to_char(salary*12, '$999,999.99') from employees;
select salary*12, to_char(salary*12, '$99,9999.99') from employees;

--[��¥ ==> ����]
select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;
select sysdate, to_char(sysdate, 'YY-MM-DD') from dual;
select sysdate, to_char(sysdate, 'YEAR-MM-DD') from dual;

select sysdate, to_char(sysdate, 'YY-MONTH-DD') from dual;

select sysdate, to_char(sysdate, 'YY-MM-DD DAY') from dual;
--�ǽ� ������̺��� ����� �̸��� �Ի�⵵�� ��ȸ�Ͻÿ�(���ϱ��� ���)
select first_name, to_char(hire_date, 'YY-MM-DD DAY') from employees;

select sysdate, to_char(sysdate, 'YY-MM-DD HH:MI:SS') from dual;
select sysdate, to_char(sysdate, 'YY-MM-DD HH24:MI:SS') from dual;

--[���������� ���� ==> ����]
select '114455', to_number('114455') from dual;
select to_number('1234a') from dual;

--[��¥������ ���� ==> ��¥]
select to_date('20180403') from dual;
select to_char(to_date('00011225'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('19910323'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('1991 03 23'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('1991.03.23'), 'YYYY-MM-DD DAY') from dual;
select to_char(to_date('91/03/23'), 'YYYY-MM-DD DAY') from dual;

--[��Ÿ�Լ�]
--[nvl, nvl2]
select * from departments;
select manager_id, nvl(manager_id,0) from departments;
select manager_id, nvl2(manager_id,1,0) from departments;
--�ǽ� ������̺��� �̸�, ����, ���ʽ��� ����Ͻÿ�
--     ���ʽ� = salary * commssion_pct
select first_name, salary, salary*nvl(commission_pct,0) bonus
from employees;

--[decode]
select decode(manager_id, null, 0, manager_id) from departments;
select first_name, decode(job_id, 'IT_PROG', '������', '�񰳹���') 
from employees;
select first_name, decode(job_id, 'IT_PROG', '������', 
                           decode(job_id,'SA_MAN','���������','������')) 
from employees;
--[decode����]
select first_name,
    decode(substr(hire_date, 1, 2), '02', 1, 0) "2002�⵵",
    decode(substr(hire_date, 1, 2), '03', 1, 0) "2003�⵵",
    decode(substr(hire_date, 1, 2), '04', 1, 0) "2004�⵵",
    decode(substr(hire_date, 1, 2), '05', 1, 0) "2005�⵵",
    decode(substr(hire_date, 1, 2), '06', 1, 0) "2006�⵵"
from employees;

select
    sum(decode(substr(hire_date, 1, 2), '02', 1, 0)) "2002�⵵",
    sum(decode(substr(hire_date, 1, 2), '03', 1, 0)) "2003�⵵",
    sum(decode(substr(hire_date, 1, 2), '04', 1, 0)) "2004�⵵",
    sum(decode(substr(hire_date, 1, 2), '05', 1, 0)) "2005�⵵",
    sum(decode(substr(hire_date, 1, 2), '06', 1, 0)) "2006�⵵"
from employees;

--[case]
select first_name,
    case 
        when job_id = 'IT_PROG' then '������'
        when job_id = 'SA_MAN' then '���������'
        else '������' 
    end
from employees;
--ȸ�翡�� �Ի��Ͽ����� �������� �����ҷ��� �Ѵ�. �������� ���Ͻÿ�.
-- 04�⵵ ������ �Ի��� ���� : salary * 100
-- 04�⵵ ~ 06�⵵�� �Ի��� ���� : salary * 50
-- 07�⵵ ���Ŀ� �Ի��� ���� : salary * 20
select first_name, hire_date, salary,
        case
            when hire_date < '04/01/01' then salary * 100
            when hire_date < '07/01/01' then salary * 50
            else salary * 20
        end ������
from employees;

select * from tabs;
select * from employees;
select * from departments;
select * from locations;






















