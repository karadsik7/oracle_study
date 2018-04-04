--employees ���̺��� ���纻�� empl���̺��� ����ÿ� (�̹� �����Ѵٸ� �����ϰ� ����)
create table empl as select * from employees;
drop table empl;
--empl ���̺��� ��� Ʃ���� �����Ͻÿ�.�Ϸ� �� empl���̺� ��ü�� ���� �� �ٽ� ����
--�Ϸ� �� �����·� ����
delete from empl;
--empl ���̺��� Ʃ�� �� ����� ¦���� ������� �����Ͻÿ�.
--�Ϸ� �� �����·� ����
delete from empl where mod(employee_id, 2) = 0;
select * from empl;

--empl ���̺��� Ʃ�� �� ����� commission_pct�� null�λ���� �����Ͻÿ�.
--�Ϸ� �� �����·� ����
delete from empl where commission_pct is null;

--empl ���̺��� Ʃ�� �� commtion_pct�� ���� null�� ����� commission_pct�� 
--������ 15000 �̻��̶�� 0.15, 10000�̻� 15000�̸��̶�� 0.1, 5000�̻� 10000�̸��̶�� 0.07, 5000�̸��� 0.05�� �����Ͻÿ�.
--�Ϸ� �� �����·� ����
update empl set 
    case
        when salary >= 15000 then commission_pct = 0.15
        when salary >= 10000 then commission_pct = 0.11
        when salary >= 5000 then commission_pct = 0.07
        else commission_pct = 0.05
    end
where commission_pct is null;
--empl���̺��� Ʃ���� �ټӳ���� 12���� ���� ����� ������ 10% ������Ű�� commission_pct�� 2��� �����Ͻÿ�.
--�Ϸ� �� �����·� ����

update empl set commission_pct = commission_pct * 2, salary = salary * 1.1 where months_between(sysdate, hire_date) >= 144;