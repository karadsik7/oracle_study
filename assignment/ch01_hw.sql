--1)system������ �����ͺ��̽��� �����Ͽ� ���̵�:lion, ��й�ȣ:1111�� ������ ����ÿ�.

create user lion identified by 1111;

--2)lion �������� ��� ����(DBA ��)�� �ο��Ͻÿ�.

grant dba to lion;

--2.5)lion �������� ������ �� �ִ� conn_lion�̶�� connection�� �����Ͻÿ�.



--3)lion������ �����ͺ��̽��� �����Ͽ� car��� ���̺��� ����ÿ�.
--  �÷� : model varchar2(50) not null, manufacturer varchar2(50) not null

create table car(
    model varchar2(50) not null,
    manufacturer varchar2(50) not null
);


--4)car���̺��� �÷� ������ ��ȸ�Ͻÿ�.
select * from car;
desc car;
--5)car���̺� price number(20) �÷��� �߰��Ͻÿ�.
alter table car add price number(20);
--6)car���̺��� manufacturer�÷��� �̸��� company�� �����Ͻÿ�.
alter table car rename column manufacturer to company;
--7)car���̺��� company�÷��� �Ӽ��� varchar2(100)���� �����Ͻÿ�.
alter table car modify company varchar2(100);
--8)car���̺��� company�÷��� �����Ͻÿ�.
alter table car drop column company;
--9)car���̺��� �����Ͻÿ�.
drop table car;
--10)lion������ ������ ��� ȸ���Ͻÿ�.
revoke dba from lion;
--11)lion������ �����Ͻÿ�.
drop user lion;
--12)system������ �����ͺ��̽��� �ٽ� �����Ͻÿ�.

--12)lion������ �ٽ� ����ÿ�.(���� ������ ���� �� �Դϴ�.)
create user lion identified by 1111;
--12)lion�������� �������� �ٽ� �ο��Ͻÿ�.(���� ������ ���� �� �Դϴ�.)
grant dba to lion;
--13)car���̺��� �ٽ� ����ÿ�.(���� ������ ���� �� �Դϴ�.)
--  �÷� : model varchar(50), manufacturer varchar(50), price number(20)
create table car(
    model varchar(50),
    manufacturer varchar(50),
    price number(20)
);
desc car;
select * from car;
--14)1 ~ 11������ ������ ���ϴ� ������, ��������, connection��, ���̺��, �÷���, �ڷ��������� �ѹ��� �����ϼ���.
create user rrb identified by 1111;
grant dba to rrb;
create table fruits(
    name varchar(20) primary key,
    color varchar(10),
    price number(6) not null
);

select * from fruits;
desc fruits;

alter table fruits add weight number(2);
alter table fruits rename column color to clr;
alter table fruits modify clr number(2);
alter table fruits drop column clr;

insert into fruits(name, color, price) values('apple', 'yellow', 5);
drop table fruits;

revoke dba from rrb;
drop user rrb;



---------SQL�� �ݺ����� ����Դϴ�... :(--------------