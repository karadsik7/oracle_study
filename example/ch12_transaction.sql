select * from empl;

--Ʈ����� ���� (commit or rollback or connection)

delete from empl;
select * from empl;
rollback;

delete from empl;
select * from empl;
commit;

--connection to tiger

select * from tabs;

create table account(
    account_number varchar(20) primary key,
    name varchar2(20),
    money number
);

rollback; --���� �޴� ���� update delete insert �� select�� ������ dml������

insert into account values('1111', 'ȫ�浿', 0);
insert into account values('2222', '�Ӳ���', 0);
commit;
select * from account;

update account set money = money + 10000 where account_number = '1111';
commit;

--������ü

update account set money = money - 1000 where account_number = '1111';
--õ���������� ���� ����x
rollback;
update account set money = money + 1000 where account_number = '2222';

--���¹�ȣ ����
select * from account;
update account set money = money - 1000 where account_number = '1111';
update account set money = money + 1000 where account_number = '2222';
rollback;
commit;


